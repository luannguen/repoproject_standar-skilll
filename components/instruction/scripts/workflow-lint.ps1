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

$workflowPath = Join-Path $InstructionRoot 'WORKFLOW-REGISTRY.json'
$skillPath = Join-Path $InstructionRoot 'SKILL-REGISTRY.json'
foreach ($path in @($workflowPath,$skillPath)) {
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        Add-Blocker "Missing registry '$path'."
    }
}
if ($script:blockers -gt 0) {
    Write-Host "Workflow lint: $script:blockers blocker(s), $script:warnings warning(s)."
    exit 1
}

try {
    $registry = Get-Content -Raw -LiteralPath $workflowPath | ConvertFrom-Json
    $skillRegistry = Get-Content -Raw -LiteralPath $skillPath | ConvertFrom-Json
} catch {
    Add-Blocker "Registry JSON is invalid: $($_.Exception.Message)"
    Write-Host "Workflow lint: $script:blockers blocker(s), $script:warnings warning(s)."
    exit 1
}

$requiredFields = @(
    'id','name','version','description','triggers','path','status','task_classes',
    'default_risk','required_skills','optional_skills','approval_gates',
    'pre_task_gate','execution_phases','validation','completion_criteria',
    'rollback_or_recovery','memory_writeback'
)
$requiredSections = @(
    '## Inputs','## Outputs','## Pre-task gate','## Execution phases',
    '## Validation','## Completion criteria','## Rollback or recovery',
    '## Project Memory write-back','## Final report'
)
$validRisks = @('LOW','MEDIUM','HIGH','CRITICAL')
$skillIds = @($skillRegistry.skills | ForEach-Object { $_.id })
$workflowIds = @{}
$workflowPaths = @{}
$usedSkills = @{}

$approvalText = ''
$approvalPath = Join-Path $InstructionRoot 'APPROVAL-GATES.md'
if (Test-Path -LiteralPath $approvalPath) {
    $approvalText = Get-Content -Raw -LiteralPath $approvalPath
} else {
    Add-Blocker 'Missing APPROVAL-GATES.md.'
}

foreach ($workflow in @($registry.workflows)) {
    foreach ($field in $requiredFields) {
        if (-not ($workflow.PSObject.Properties.Name -contains $field)) {
            Add-Blocker "Workflow '$($workflow.id)' is missing '$field'."
        }
    }
    if ([string]::IsNullOrWhiteSpace([string]$workflow.id)) {
        Add-Blocker 'Workflow with empty ID.'
        continue
    }
    if ($workflowIds.ContainsKey($workflow.id)) {
        Add-Blocker "Duplicate workflow ID '$($workflow.id)'."
    } else {
        $workflowIds[$workflow.id] = $workflow
    }
    if ($workflowPaths.ContainsKey($workflow.path)) {
        Add-Blocker "Duplicate workflow path '$($workflow.path)'."
    } else {
        $workflowPaths[$workflow.path] = $workflow.id
    }
    if ($workflow.version -notmatch '^\d+\.\d+\.\d+$') {
        Add-Blocker "Workflow '$($workflow.id)' has invalid version '$($workflow.version)'."
    }
    if ($workflow.status -ne 'active') {
        Add-Warning "Workflow '$($workflow.id)' status is '$($workflow.status)'."
    }
    if ($workflow.default_risk -notin $validRisks) {
        Add-Blocker "Workflow '$($workflow.id)' has invalid risk '$($workflow.default_risk)'."
    }
    if (@($workflow.required_skills).Count -eq 0) {
        Add-Blocker "Workflow '$($workflow.id)' has no required skills."
    }

    $combined = @($workflow.required_skills) + @($workflow.optional_skills)
    $duplicates = @($combined | Group-Object | Where-Object Count -gt 1)
    foreach ($duplicate in $duplicates) {
        Add-Blocker "Workflow '$($workflow.id)' lists skill '$($duplicate.Name)' more than once."
    }
    foreach ($skill in $combined) {
        if ($skill -notin $skillIds) {
            Add-Blocker "Workflow '$($workflow.id)' references missing skill '$skill'."
        } else {
            $usedSkills[$skill] = $true
        }
    }
    foreach ($mandatory in @('project-orchestrator','project-memory','documentation-sync')) {
        if ($mandatory -notin @($workflow.required_skills)) {
            Add-Blocker "Workflow '$($workflow.id)' must require '$mandatory'."
        }
    }
    if ($workflow.id -ne 'documentation' -and $workflow.id -ne 'incident-response' -and 'testing-quality' -notin @($workflow.required_skills)) {
        Add-Blocker "Workflow '$($workflow.id)' must require testing-quality."
    }
    foreach ($gate in @($workflow.approval_gates)) {
        if ($gate -notmatch '^AG-\d{2}$') {
            Add-Blocker "Workflow '$($workflow.id)' has malformed approval gate '$gate'."
        } elseif ($approvalText -notmatch [regex]::Escape($gate)) {
            Add-Blocker "Workflow '$($workflow.id)' references undefined approval gate '$gate'."
        }
    }

    $file = Join-Path $InstructionRoot $workflow.path
    if (-not (Test-Path -LiteralPath $file -PathType Leaf)) {
        Add-Blocker "Workflow '$($workflow.id)' file is missing: $($workflow.path)"
        continue
    }
    $content = Get-Content -Raw -LiteralPath $file
    if ($content -match '\[TODO|TODO:') {
        Add-Blocker "Workflow '$($workflow.id)' contains placeholder content."
    }
    foreach ($section in $requiredSections) {
        if ($content -notmatch "(?m)^$([regex]::Escape($section))\s*$") {
            Add-Blocker "Workflow '$($workflow.id)' is missing section '$section'."
        }
    }
    foreach ($field in @('id','version','status','applies_when','goal','risk_floor','required_skills','optional_skills','approval_gates')) {
        if ($content -notmatch "(?m)^- $([regex]::Escape($field)):") {
            Add-Blocker "Workflow '$($workflow.id)' contract is missing '$field'."
        }
    }
    $fileId = [regex]::Match($content, '(?m)^- id:\s*(\S+)').Groups[1].Value
    $fileVersion = [regex]::Match($content, '(?m)^- version:\s*(\S+)').Groups[1].Value
    if ($fileId -ne $workflow.id) {
        Add-Blocker "Workflow path '$($workflow.path)' declares ID '$fileId'."
    }
    if ($fileVersion -ne $workflow.version) {
        Add-Blocker "Workflow '$($workflow.id)' registry/file versions differ."
    }
}

foreach ($skill in @($skillRegistry.skills | Where-Object status -eq 'active')) {
    if (-not $usedSkills.ContainsKey($skill.id)) {
        Add-Blocker "Active skill '$($skill.id)' is not used by any workflow."
    }
    foreach ($workflowId in @($skill.workflows)) {
        if (-not $workflowIds.ContainsKey($workflowId)) {
            Add-Blocker "Skill '$($skill.id)' references unknown workflow '$workflowId'."
            continue
        }
        $workflow = $workflowIds[$workflowId]
        if ($skill.id -notin (@($workflow.required_skills) + @($workflow.optional_skills))) {
            Add-Blocker "Skill '$($skill.id)' claims workflow '$workflowId', but the workflow does not list it."
        }
    }
}

$workflowRoot = Join-Path $InstructionRoot 'workflows'
if (Test-Path -LiteralPath $workflowRoot -PathType Container) {
    Get-ChildItem -LiteralPath $workflowRoot -Directory | ForEach-Object {
        $file = Join-Path $_.FullName 'WORKFLOW.md'
        if (Test-Path -LiteralPath $file -PathType Leaf) {
            $relative = $file.Substring($InstructionRoot.TrimEnd('\').Length + 1).Replace('\','/')
            if (-not $workflowPaths.ContainsKey($relative)) {
                Add-Blocker "Unregistered workflow file '$relative'."
            }
        }
    }
}

Write-Host "Workflow lint: $script:blockers blocker(s), $script:warnings warning(s), $(@($registry.workflows).Count) registered workflow(s)."
if ($script:blockers -gt 0) { exit 1 }
exit 0
