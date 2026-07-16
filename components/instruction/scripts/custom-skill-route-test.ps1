[CmdletBinding()]
param(
    [string]$InstructionRoot
)

if ([string]::IsNullOrWhiteSpace($InstructionRoot)) {
    $InstructionRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
}

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$script:blockers = 0
function Add-Blocker([string]$Message) {
    $script:blockers++
    Write-Host "[BLOCKER] $Message" -ForegroundColor Red
}

try {
    $fixtures = Get-Content -Raw -LiteralPath (Join-Path $InstructionRoot 'tests/custom-skill-routing-cases.json') | ConvertFrom-Json
    $active = Get-Content -Raw -LiteralPath (Join-Path $InstructionRoot 'project-custom-skills/ACTIVE-CUSTOM-SKILLS.json') | ConvertFrom-Json
    $registry = Get-Content -Raw -LiteralPath (Join-Path $InstructionRoot 'custom-skills/CUSTOM-SKILL-REGISTRY.json') | ConvertFrom-Json
    $profiles = Get-Content -Raw -LiteralPath (Join-Path $InstructionRoot 'custom-skills/STACK-PROFILES.json') | ConvertFrom-Json
} catch {
    Add-Blocker "Cannot parse custom routing input: $($_.Exception.Message)"
    Write-Host "Custom route test: $script:blockers blocker(s)."
    exit 1
}

function Select-CustomSkills([string]$TaskType,[string[]]$Paths) {
    $selected = @()
    foreach ($binding in @($active.bindings)) {
        if ($binding.activation_status -notin @('active','provisional')) { continue }
        if ($TaskType -notin @($binding.applicable_task_types)) { continue }
        $pathMatch = $false
        foreach ($path in $Paths) {
            foreach ($scope in @($binding.applicable_paths)) {
                if ($path -like $scope) { $pathMatch = $true; break }
            }
            if ($pathMatch) { break }
        }
        if ($pathMatch) { $selected += [string]$binding.skill_id }
    }
    return @($selected | Sort-Object -Unique)
}

$seen = @{}
foreach ($case in @($fixtures.cases)) {
    $id = [string]$case.id
    if ($seen.ContainsKey($id)) { Add-Blocker "Duplicate custom routing case '$id'." }
    else { $seen[$id] = $true }
    $actual = @(Select-CustomSkills ([string]$case.task_type) @($case.paths))
    $expected = @($case.expected_custom_skills | ForEach-Object { [string]$_ } | Sort-Object -Unique)
    if (($actual -join ',') -ne ($expected -join ',')) {
        Add-Blocker "Case '$id' expected [$($expected -join ', ')] but routed [$($actual -join ', ')]."
    }
    if ([string]::IsNullOrWhiteSpace([string]$case.reason)) { Add-Blocker "Case '$id' has no reason." }
}
if ([int]$fixtures.case_count -ne @($fixtures.cases).Count) { Add-Blocker 'Custom routing fixture case_count is stale.' }

$registeredIds = @($registry.skills | ForEach-Object { [string]$_.id })
$activeIds = @($active.bindings | ForEach-Object { [string]$_.skill_id })
foreach ($id in $activeIds) { if ($id -notin $registeredIds) { Add-Blocker "Active binding '$id' is not registered." } }
foreach ($profile in @($profiles.profiles)) {
    foreach ($id in @($profile.skills) + @($profile.requires_all)) {
        if ($id -notin $registeredIds) { Add-Blocker "Profile '$($profile.id)' references unknown skill '$id'." }
    }
    if ($profile.PSObject.Properties.Name -contains 'rules' -or $profile.PSObject.Properties.Name -contains 'activation_status') {
        Add-Blocker "Profile '$($profile.id)' contains copied rules or activation state."
    }
}

$bootstrapPath = Join-Path $InstructionRoot 'AI-BOOTSTRAP.md'
$bootstrap = Get-Content -Raw -LiteralPath $bootstrapPath
foreach ($id in $activeIds) {
    if ($bootstrap -match "(?m)^.*active.*$([regex]::Escape($id)).*$") {
        Add-Blocker "AI-BOOTSTRAP hard-codes active skill '$id'; it must read the manifest."
    }
}
foreach ($token in @('PROJECT-STACK-MANIFEST.json','PROJECT-DOMAIN-MANIFEST.json','ACTIVE-CUSTOM-SKILLS.json')) {
    if ($bootstrap -notmatch [regex]::Escape($token)) { Add-Blocker "AI-BOOTSTRAP does not read '$token'." }
}

Write-Host "Custom route test: $script:blockers blocker(s), $(@($fixtures.cases).Count) case(s), $(@($active.bindings).Count) active binding(s)."
if ($script:blockers -gt 0) { exit 1 }
exit 0
