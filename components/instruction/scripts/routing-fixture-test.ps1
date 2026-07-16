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

$fixturePath = Join-Path $InstructionRoot 'tests/routing-cases.json'
$workflowPath = Join-Path $InstructionRoot 'WORKFLOW-REGISTRY.json'
$skillPath = Join-Path $InstructionRoot 'SKILL-REGISTRY.json'
$approvalPath = Join-Path $InstructionRoot 'APPROVAL-GATES.md'

foreach ($path in @($fixturePath,$workflowPath,$skillPath,$approvalPath)) {
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        Add-Blocker "Missing routing fixture input '$path'."
    }
}
if ($script:blockers -gt 0) {
    Write-Host "Routing fixture test: $script:blockers blocker(s), $script:warnings warning(s)."
    exit 1
}

try {
    $fixtures = Get-Content -Raw -LiteralPath $fixturePath | ConvertFrom-Json
    $workflowRegistry = Get-Content -Raw -LiteralPath $workflowPath | ConvertFrom-Json
    $skillRegistry = Get-Content -Raw -LiteralPath $skillPath | ConvertFrom-Json
} catch {
    Add-Blocker "Invalid routing JSON: $($_.Exception.Message)"
    Write-Host "Routing fixture test: $script:blockers blocker(s), $script:warnings warning(s)."
    exit 1
}

$approvalText = Get-Content -Raw -LiteralPath $approvalPath
$riskRank = @{ LOW = 0; MEDIUM = 1; HIGH = 2; CRITICAL = 3 }
$workflowById = @{}
foreach ($workflow in @($workflowRegistry.workflows)) {
    $workflowById[$workflow.id] = $workflow
}
$skillIds = @($skillRegistry.skills | ForEach-Object { $_.id })
$seenIds = @{}
$coverage = @{}
foreach ($workflow in @($workflowRegistry.workflows)) {
    $coverage[$workflow.id] = 0
}

foreach ($case in @($fixtures.cases)) {
    $id = [string]$case.id
    if ([string]::IsNullOrWhiteSpace($id)) {
        Add-Blocker 'Routing fixture has a blank ID.'
        continue
    }
    if ($seenIds.ContainsKey($id)) {
        Add-Blocker "Duplicate routing fixture ID '$id'."
    } else {
        $seenIds[$id] = $true
    }
    if ([string]::IsNullOrWhiteSpace([string]$case.prompt)) {
        Add-Blocker "Routing fixture '$id' has a blank prompt."
    }
    if (-not $workflowById.ContainsKey([string]$case.expected_workflow)) {
        Add-Blocker "Routing fixture '$id' references unknown workflow '$($case.expected_workflow)'."
        continue
    }

    $workflow = $workflowById[[string]$case.expected_workflow]
    $coverage[$workflow.id]++
    if (-not $riskRank.ContainsKey([string]$case.expected_risk)) {
        Add-Blocker "Routing fixture '$id' has invalid risk '$($case.expected_risk)'."
    } elseif ($riskRank[[string]$case.expected_risk] -lt $riskRank[[string]$workflow.default_risk]) {
        Add-Blocker "Routing fixture '$id' risk is below workflow '$($workflow.id)' floor."
    }

    $allowedSkills = @($workflow.required_skills) + @($workflow.optional_skills)
    foreach ($skill in @($case.expected_skills)) {
        if ($skill -notin $skillIds) {
            Add-Blocker "Routing fixture '$id' references unknown skill '$skill'."
        } elseif ($skill -notin $allowedSkills) {
            Add-Blocker "Routing fixture '$id' skill '$skill' is not routed by workflow '$($workflow.id)'."
        }
    }
    foreach ($mandatory in @($workflow.required_skills)) {
        if ($mandatory -notin @($case.expected_skills)) {
            Add-Blocker "Routing fixture '$id' omits required skill '$mandatory'."
        }
    }

    foreach ($gate in @($case.expected_gates)) {
        if ($gate -notin @($workflow.approval_gates)) {
            Add-Blocker "Routing fixture '$id' gate '$gate' is not routed by workflow '$($workflow.id)'."
        } elseif ($approvalText -notmatch [regex]::Escape([string]$gate)) {
            Add-Blocker "Routing fixture '$id' gate '$gate' is undefined."
        }
    }
    if ([string]::IsNullOrWhiteSpace([string]$case.reason)) {
        Add-Blocker "Routing fixture '$id' has no reason."
    }
}

foreach ($workflow in @($workflowRegistry.workflows)) {
    if ($coverage[$workflow.id] -lt 2) {
        Add-Blocker "Workflow '$($workflow.id)' has only $($coverage[$workflow.id]) routing fixture(s); expected at least 2."
    }
}
foreach ($risk in $riskRank.Keys) {
    if (@($fixtures.cases | Where-Object expected_risk -eq $risk).Count -eq 0) {
        Add-Blocker "Routing fixtures do not cover risk '$risk'."
    }
}

$declaredCount = [int]$fixtures.case_count
$actualCount = @($fixtures.cases).Count
if ($declaredCount -ne $actualCount) {
    Add-Blocker "Routing fixture case_count is $declaredCount but actual count is $actualCount."
}

Write-Host "Routing fixture test: $script:blockers blocker(s), $script:warnings warning(s), $actualCount case(s), $($coverage.Keys.Count) workflow(s)."
if ($script:blockers -gt 0) { exit 1 }
exit 0
