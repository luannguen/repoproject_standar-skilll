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
$script:warnings = 0

function Add-Blocker([string]$Message) {
    $script:blockers++
    Write-Host "[BLOCKER] $Message" -ForegroundColor Red
}
function Add-Warning([string]$Message) {
    $script:warnings++
    Write-Host "[WARN] $Message" -ForegroundColor Yellow
}
function Has-Property($Object, [string]$Name) {
    return $null -ne $Object -and $Object.PSObject.Properties.Name -contains $Name
}
function Read-Json([string]$Path, [string]$Label) {
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        Add-Blocker "Missing $Label at '$Path'."
        return $null
    }
    try { return Get-Content -Raw -LiteralPath $Path | ConvertFrom-Json }
    catch {
        Add-Blocker "$Label is invalid JSON: $($_.Exception.Message)"
        return $null
    }
}

$customRoot = Join-Path $InstructionRoot 'custom-skills'
$projectRoot = Join-Path $InstructionRoot 'project-custom-skills'
$registry = Read-Json (Join-Path $customRoot 'CUSTOM-SKILL-REGISTRY.json') 'custom skill registry'
$standardRegistry = Read-Json (Join-Path $InstructionRoot 'SKILL-REGISTRY.json') 'Standard Skill registry'
$stackManifest = Read-Json (Join-Path $projectRoot 'PROJECT-STACK-MANIFEST.json') 'project stack manifest'
$domainManifest = Read-Json (Join-Path $projectRoot 'PROJECT-DOMAIN-MANIFEST.json') 'project domain manifest'
$activeManifest = Read-Json (Join-Path $projectRoot 'ACTIVE-CUSTOM-SKILLS.json') 'active custom skill manifest'
foreach ($support in @('CUSTOM-SKILL-CONTRACT.schema.json','ACTIVE-CUSTOM-SKILLS.schema.json','STACK-DETECTION-RULES.json','DOMAIN-DETECTION-RULES.json','COMPATIBILITY-MATRIX.json','STACK-PROFILES.json')) { [void](Read-Json (Join-Path $customRoot $support) "custom support contract '$support'" ) }
if ($null -eq $registry -or $null -eq $standardRegistry -or $null -eq $stackManifest -or $null -eq $domainManifest -or $null -eq $activeManifest) {
    Write-Host "Custom skill lint: $script:blockers blocker(s), $script:warnings warning(s)."
    exit 1
}

$requiredContractFields = @(
    'id','name','type','version','status','description','purpose','upstream_technology',
    'supported_versions','detected_project_version','activation_mode','activation_conditions',
    'deactivation_conditions','detection_rules','confidence_requirement','task_triggers',
    'affected_layers','standard_skill_dependencies','compatible_skills','incompatible_skills',
    'prerequisite_skills','required_inputs','expected_outputs','rules','blockers','patterns',
    'anti_patterns','validation','completion_criteria','official_source_policy',
    'memory_read_policy','memory_write_policy','project_overlay_policy','update_policy','deprecation_policy','scope_policy'
)
$validStatus = @('available','active','provisional','deprecated','disabled')
$validModes = @('auto','confirmation_required','manual','disabled')
$standardIds = @($standardRegistry.skills | ForEach-Object { [string]$_.id })
$registered = @{}
$contractPaths = @{}

foreach ($entry in @($registry.skills)) {
    foreach ($field in @('id','type','version','status','activation_mode','path','contract','upstream')) {
        if (-not (Has-Property $entry $field)) { Add-Blocker "Registry entry '$($entry.id)' is missing '$field'." }
    }
    $id = [string]$entry.id
    if ([string]::IsNullOrWhiteSpace($id) -or $id -notmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$') {
        Add-Blocker "Invalid custom skill ID '$id'."
        continue
    }
    if ($registered.ContainsKey($id)) { Add-Blocker "Duplicate custom skill ID '$id'." }
    else { $registered[$id] = $entry }
    if ($entry.type -notin @('technology','domain')) { Add-Blocker "Skill '$id' has invalid type '$($entry.type)'." }
    if ($entry.version -notmatch '^\d+\.\d+\.\d+$') { Add-Blocker "Skill '$id' has invalid semver '$($entry.version)'." }
    if ($entry.status -notin $validStatus) { Add-Blocker "Skill '$id' has invalid status '$($entry.status)'." }
    if ($entry.activation_mode -notin $validModes) { Add-Blocker "Skill '$id' has invalid activation mode '$($entry.activation_mode)'." }

    $skillPath = Join-Path $customRoot ([string]$entry.path)
    $contractPath = Join-Path $customRoot ([string]$entry.contract)
    if ($contractPaths.ContainsKey([string]$entry.contract)) { Add-Blocker "Duplicate contract path '$($entry.contract)'." }
    else { $contractPaths[[string]$entry.contract] = $id }
    if (-not (Test-Path -LiteralPath $skillPath -PathType Leaf)) {
        Add-Blocker "Skill '$id' is missing SKILL.md at '$($entry.path)'."
        continue
    }
    $skillText = Get-Content -Raw -LiteralPath $skillPath
    $frontmatter = [regex]::Match($skillText, '(?ms)^---\s*\r?\n(?<body>.*?)\r?\n---')
    if (-not $frontmatter.Success) { Add-Blocker "Skill '$id' has invalid frontmatter." }
    else {
        $keys = @([regex]::Matches($frontmatter.Groups['body'].Value, '(?m)^([a-z_]+):') | ForEach-Object { $_.Groups[1].Value })
        if (($keys -join ',') -ne 'name,description') { Add-Blocker "Skill '$id' frontmatter must contain only name and description." }
        if ($frontmatter.Groups['body'].Value -notmatch "(?m)^name:\s*$([regex]::Escape($id))\s*$") { Add-Blocker "Skill '$id' frontmatter name mismatch." }
    }
    if ($skillText -match '\[TODO|TODO:|Help with .* tasks') { Add-Blocker "Skill '$id' contains scaffold placeholder text." }
    if ((Get-Content -LiteralPath $skillPath).Count -gt 500) { Add-Warning "Skill '$id' exceeds 500 lines." }

    $agentPath = Join-Path (Split-Path -Parent $skillPath) 'agents/openai.yaml'
    if (-not (Test-Path -LiteralPath $agentPath -PathType Leaf)) { Add-Blocker "Skill '$id' is missing agents/openai.yaml." }
    else {
        $agentText = Get-Content -Raw -LiteralPath $agentPath
        foreach ($token in @('interface:','display_name:','short_description:','default_prompt:','policy:','allow_implicit_invocation: false')) {
            if ($agentText -notmatch [regex]::Escape($token)) { Add-Blocker "Skill '$id' agent metadata is missing '$token'." }
        }
        if ($agentText -notmatch [regex]::Escape("`$$id")) { Add-Blocker "Skill '$id' default prompt does not name its skill token." }
    }

    $contract = Read-Json $contractPath "contract for '$id'"
    if ($null -eq $contract) { continue }
    foreach ($field in $requiredContractFields) {
        if (-not (Has-Property $contract $field)) { Add-Blocker "Contract '$id' is missing '$field'." }
    }
    if ([string]$contract.id -ne $id -or [string]$contract.type -ne [string]$entry.type -or [string]$contract.version -ne [string]$entry.version) {
        Add-Blocker "Skill '$id' registry and contract identity/type/version differ."
    }
    if ($contract.status -notin $validStatus -or $contract.activation_mode -notin $validModes) {
        Add-Blocker "Contract '$id' has unsupported status or activation mode."
    }
    foreach ($arrayField in @('supported_versions','activation_conditions','deactivation_conditions','detection_rules','task_triggers','affected_layers','standard_skill_dependencies','required_inputs','expected_outputs','rules','blockers','patterns','anti_patterns','validation','completion_criteria')) {
        if (@($contract.$arrayField).Count -eq 0) { Add-Blocker "Contract '$id' has empty '$arrayField'." }
    }
    foreach ($dependency in @($contract.standard_skill_dependencies)) {
        if ($dependency -notin $standardIds) { Add-Blocker "Contract '$id' references unknown Standard Skill '$dependency'." }
    }
    if ($entry.type -eq 'technology') {
        $upstreamPath = Join-Path $customRoot ([string]$entry.upstream)
        if ([string]::IsNullOrWhiteSpace([string]$entry.upstream) -or -not (Test-Path -LiteralPath $upstreamPath -PathType Leaf)) {
            Add-Blocker "Technology skill '$id' is missing UPSTREAM.md."
        } else {
            $upstreamText = Get-Content -Raw -LiteralPath $upstreamPath
            foreach ($token in @('Last checked:','Official sources','Version-sensitive areas','Verified:','Deprecated:','Migration-only:','Unverified:','https://')) {
                if ($upstreamText -notmatch [regex]::Escape($token)) { Add-Blocker "Technology skill '$id' upstream ledger is missing '$token'." }
            }
        }
    } elseif ($null -ne $entry.upstream) {
        Add-Blocker "Domain skill '$id' must not claim a generic technology upstream ledger."
    }
}

if (@($registry.skills | Where-Object type -eq 'technology').Count -ne 14) { Add-Blocker 'Expected exactly 14 reusable technology skills.' }
if (@($registry.skills | Where-Object type -eq 'domain').Count -ne 13) { Add-Blocker 'Expected exactly 13 reusable domain skills.' }

$stackIds = @($stackManifest.detections | ForEach-Object { [string]$_.skill_id })
$domainIds = @($domainManifest.detections | ForEach-Object { [string]$_.skill_id })
foreach ($entry in @($registry.skills)) {
    $manifestIds = if ($entry.type -eq 'technology') { $stackIds } else { $domainIds }
    if ($entry.id -notin $manifestIds) { Add-Blocker "Skill '$($entry.id)' is absent from its project detection manifest." }
}

$detectedById = @{}
foreach ($item in @($stackManifest.detections) + @($domainManifest.detections)) { $detectedById[[string]$item.skill_id] = $item }
$activeIds = @{}
foreach ($binding in @($activeManifest.bindings)) {
    $id = [string]$binding.skill_id
    if ($activeIds.ContainsKey($id)) { Add-Blocker "Duplicate active binding '$id'." }
    else { $activeIds[$id] = $binding }
    if (-not $registered.ContainsKey($id)) { Add-Blocker "Active binding '$id' is not registered."; continue }
    if (-not $detectedById.ContainsKey($id) -or -not [bool]$detectedById[$id].detected -or $detectedById[$id].confidence -notin @('HIGH','MEDIUM')) {
        Add-Blocker "Binding '$id' is active without HIGH/MEDIUM detection evidence."
    }
    foreach ($field in @('base_skill_path','overlay_path','detected_version','activation_status','activation_reason','evidence','applicable_packages','applicable_paths','applicable_task_types','incompatible_scopes','required_standard_skills','memory_scope','last_verified_at')) {
        if (-not (Has-Property $binding $field)) { Add-Blocker "Binding '$id' is missing '$field'." }
    }
    if ($binding.activation_status -notin @('active','provisional','deprecated','disabled')) { Add-Blocker "Binding '$id' has invalid activation status." }
    $basePath = Join-Path $projectRoot ([string]$binding.base_skill_path)
    if (-not (Test-Path -LiteralPath $basePath -PathType Leaf)) { Add-Blocker "Binding '$id' base skill does not exist." }
    $overlayPath = Join-Path $projectRoot ([string]$binding.overlay_path)
    if (-not (Test-Path -LiteralPath $overlayPath -PathType Leaf)) { Add-Blocker "Binding '$id' overlay does not exist." }
    if ($registered[$id].type -eq 'domain' -and [int]$detectedById[$id].verified_rules_count -lt 1) { Add-Blocker "Domain binding '$id' has no verified project rule." }
    if (@($binding.evidence).Count -eq 0 -or @($binding.applicable_paths).Count -eq 0 -or @($binding.applicable_task_types).Count -eq 0) {
        Add-Blocker "Binding '$id' lacks evidence or routing scope."
    }
}

$antiPath = Join-Path $customRoot 'CUSTOM-SKILL-ANTI-PATTERNS.md'
if (-not (Test-Path -LiteralPath $antiPath -PathType Leaf)) { Add-Blocker 'Missing custom skill anti-pattern catalog.' }
else {
    $antiCount = @([regex]::Matches((Get-Content -Raw -LiteralPath $antiPath), '(?m)^\d+\.\s')).Count
    if ($antiCount -ne 30) { Add-Blocker "Expected 30 custom skill anti-patterns, found $antiCount." }
}

Write-Host "Custom skill lint: $script:blockers blocker(s), $script:warnings warning(s), $(@($registry.skills).Count) reusable skill(s), $(@($activeManifest.bindings).Count) active binding(s)."
if ($script:blockers -gt 0) { exit 1 }
exit 0
