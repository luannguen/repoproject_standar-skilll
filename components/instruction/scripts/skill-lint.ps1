[CmdletBinding()]
param(
    [string]$InstructionRoot
)

if ([string]::IsNullOrWhiteSpace($InstructionRoot)) {
    $InstructionRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
}

$ErrorActionPreference = 'Stop'
$script:blockers = 0
$script:warnings = 0

function Add-Blocker([string]$Message) {
    $script:blockers++
    Write-Host "[BLOCKER] $Message" -ForegroundColor Red
}

function Add-Warning([string]$Message) {
    $script:warnings++
    Write-Host "[WARN] $Message" -ForegroundColor Yellow
}

$registryPath = Join-Path $InstructionRoot 'SKILL-REGISTRY.json'
$workflowRegistryPath = Join-Path $InstructionRoot 'WORKFLOW-REGISTRY.json'
if (-not (Test-Path -LiteralPath $registryPath -PathType Leaf)) {
    Add-Blocker "Missing SKILL-REGISTRY.json."
    Write-Host "Skill lint: $script:blockers blocker(s), $script:warnings warning(s)."
    exit 1
}

try {
    $registry = Get-Content -Raw -LiteralPath $registryPath | ConvertFrom-Json
} catch {
    Add-Blocker "SKILL-REGISTRY.json is not valid JSON: $($_.Exception.Message)"
    Write-Host "Skill lint: $script:blockers blocker(s), $script:warnings warning(s)."
    exit 1
}

$requiredRegistryFields = @(
    'id','name','version','description','triggers','path','status',
    'dependency_skills','related_skills','risk_usage','task_classes','workflows'
)
$requiredContractFields = @(
    'id','name','version','description','purpose','scope','triggers','exclusions',
    'required_inputs','expected_outputs','required_files','related_skills',
    'prerequisite_skills','next_skills','constraints','blockers',
    'approval_requirements','execution_workflow','pre_task_checklist',
    'post_task_checklist','validation_process','completion_criteria',
    'exception_policy','memory_read_policy','memory_write_policy','update_policy'
)
$validRisks = @('LOW','MEDIUM','HIGH','CRITICAL')
$ids = @{}
$paths = @{}

foreach ($skill in @($registry.skills)) {
    foreach ($field in $requiredRegistryFields) {
        if (-not ($skill.PSObject.Properties.Name -contains $field)) {
            Add-Blocker "Registry skill '$($skill.id)' is missing '$field'."
        }
    }

    if ([string]::IsNullOrWhiteSpace([string]$skill.id)) {
        Add-Blocker 'Registry contains a skill with an empty ID.'
        continue
    }
    if ($ids.ContainsKey($skill.id)) {
        Add-Blocker "Duplicate skill ID '$($skill.id)'."
    } else {
        $ids[$skill.id] = $skill
    }
    if ($paths.ContainsKey($skill.path)) {
        Add-Blocker "Duplicate skill path '$($skill.path)'."
    } else {
        $paths[$skill.path] = $skill.id
    }
    if ($skill.version -notmatch '^\d+\.\d+\.\d+$') {
        Add-Blocker "Skill '$($skill.id)' has non-semver version '$($skill.version)'."
    }
    if ($skill.status -notin @('active','deprecated','experimental')) {
        Add-Blocker "Skill '$($skill.id)' has unsupported status '$($skill.status)'."
    }
    if ([string]::IsNullOrWhiteSpace([string]$skill.triggers)) {
        Add-Blocker "Skill '$($skill.id)' has no triggers."
    }
    if (@($skill.task_classes).Count -eq 0) {
        Add-Blocker "Skill '$($skill.id)' has no task class."
    }
    if (@($skill.workflows).Count -eq 0) {
        Add-Blocker "Skill '$($skill.id)' is unused by workflows."
    }
    if ($skill.risk_usage.default -notin $validRisks) {
        Add-Blocker "Skill '$($skill.id)' has invalid default risk '$($skill.risk_usage.default)'."
    }

    $skillPath = Join-Path $InstructionRoot $skill.path
    if (-not (Test-Path -LiteralPath $skillPath -PathType Leaf)) {
        Add-Blocker "Skill '$($skill.id)' path does not exist: $($skill.path)"
        continue
    }
    $content = Get-Content -Raw -LiteralPath $skillPath
    if ($content -match '\[TODO|TODO:|Help with .* tasks') {
        Add-Blocker "Skill '$($skill.id)' still contains placeholder content."
    }
    if ($content -notmatch "(?ms)^---\s*\r?\nname:\s*$([regex]::Escape($skill.id))\s*\r?\ndescription:\s*.+?\r?\n---") {
        Add-Blocker "Skill '$($skill.id)' has invalid or mismatched frontmatter."
    }
    foreach ($field in $requiredContractFields) {
        if ($content -notmatch "(?m)^- $([regex]::Escape($field)):") {
            Add-Blocker "Skill '$($skill.id)' contract is missing '$field'."
        }
    }
    $contractVersion = [regex]::Match($content, '(?m)^- version:\s*(\S+)').Groups[1].Value
    if ($contractVersion -ne $skill.version) {
        Add-Blocker "Skill '$($skill.id)' registry version '$($skill.version)' differs from contract '$contractVersion'."
    }
    $agentPath = Join-Path (Split-Path -Parent $skillPath) 'agents/openai.yaml'
    if (-not (Test-Path -LiteralPath $agentPath -PathType Leaf)) {
        Add-Blocker "Skill '$($skill.id)' is missing agents/openai.yaml."
    } else {
        $agent = Get-Content -Raw -LiteralPath $agentPath
        if ($agent -notmatch '(?m)^interface:' -or $agent -notmatch '(?m)^\s+display_name:' -or $agent -notmatch '(?m)^\s+short_description:') {
            Add-Blocker "Skill '$($skill.id)' has incomplete interface metadata."
        }
    }
    $lineCount = (Get-Content -LiteralPath $skillPath).Count
    if ($lineCount -gt 500) {
        Add-Warning "Skill '$($skill.id)' is $lineCount lines; consider progressive references."
    }
}

foreach ($skill in @($registry.skills)) {
    foreach ($dependency in @($skill.dependency_skills)) {
        if (-not $ids.ContainsKey($dependency)) {
            Add-Blocker "Skill '$($skill.id)' depends on missing skill '$dependency'."
        }
    }
    foreach ($related in @($skill.related_skills)) {
        if (-not $ids.ContainsKey($related)) {
            Add-Blocker "Skill '$($skill.id)' relates to missing skill '$related'."
        }
    }
}

$script:states = @{}
function Visit-Skill([string]$Id, [string[]]$Trail) {
    if ($script:states[$Id] -eq 1) {
        Add-Blocker "Circular skill dependency: $((@($Trail) + $Id) -join ' -> ')"
        return
    }
    if ($script:states[$Id] -eq 2 -or -not $ids.ContainsKey($Id)) {
        return
    }
    $script:states[$Id] = 1
    foreach ($dependency in @($ids[$Id].dependency_skills)) {
        Visit-Skill $dependency (@($Trail) + $Id)
    }
    $script:states[$Id] = 2
}
foreach ($id in $ids.Keys) {
    Visit-Skill $id @()
}

$skillRoot = Join-Path $InstructionRoot 'skills'
Get-ChildItem -LiteralPath $skillRoot -Directory | ForEach-Object {
    $skillFile = Join-Path $_.FullName 'SKILL.md'
    if (Test-Path -LiteralPath $skillFile -PathType Leaf) {
        $relative = $skillFile.Substring($InstructionRoot.TrimEnd('\').Length + 1).Replace('\','/')
        if (-not $paths.ContainsKey($relative)) {
            Add-Blocker "Unregistered skill file '$relative'."
        }
    }
}

if (Test-Path -LiteralPath $workflowRegistryPath -PathType Leaf) {
    try {
        $workflows = (Get-Content -Raw -LiteralPath $workflowRegistryPath | ConvertFrom-Json).workflows
        $workflowIds = @($workflows | ForEach-Object { $_.id })
        foreach ($skill in @($registry.skills)) {
            foreach ($workflow in @($skill.workflows)) {
                if ($workflow -notin $workflowIds) {
                    Add-Blocker "Skill '$($skill.id)' references missing workflow '$workflow'."
                }
            }
        }
    } catch {
        Add-Blocker "Cannot parse WORKFLOW-REGISTRY.json for skill usage: $($_.Exception.Message)"
    }
} else {
    Add-Blocker 'Missing WORKFLOW-REGISTRY.json.'
}

Write-Host "Skill lint: $script:blockers blocker(s), $script:warnings warning(s), $(@($registry.skills).Count) registered skill(s)."
if ($script:blockers -gt 0) { exit 1 }
exit 0
