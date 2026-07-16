[CmdletBinding()]
param(
    [string]$RepositoryRoot
)

if ([string]::IsNullOrWhiteSpace($RepositoryRoot)) {
    $RepositoryRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../../..'))
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

$instructionRoot = Join-Path $RepositoryRoot 'components/instruction'
$required = @(
    'AGENTS.md',
    'components/instruction/AI-BOOTSTRAP.md',
    'components/instruction/PROJECT-CONSTITUTION.md',
    'components/instruction/APPROVAL-GATES.md',
    'components/instruction/SKILL-REGISTRY.json',
    'components/instruction/WORKFLOW-REGISTRY.json',
    'components/instruction/SYSTEM-ANTI-PATTERNS.md',
    'components/instruction/TEMPLATE-MANIFEST.json',
    'components/instruction/PROJECT-PROFILE.json',
    'components/instruction/PROJECT-ONBOARDING.md',
    'components/instruction/skills/project-bootstrap-governance/SKILL.md',
    'components/instruction/workflows/project-onboarding/WORKFLOW.md',
    'components/instruction/skills/project-orchestrator/SKILL.md',
    'components/instruction/skills/project-memory/SKILL.md'
)
foreach ($relative in $required) {
    if (-not (Test-Path -LiteralPath (Join-Path $RepositoryRoot $relative) -PathType Leaf)) {
        Add-Blocker "Missing required routing artifact '$relative'."
    }
}
if ($script:blockers -gt 0) {
    Write-Host "Route test: $script:blockers blocker(s), $script:warnings warning(s)."
    exit 1
}

$agents = Get-Content -Raw -LiteralPath (Join-Path $RepositoryRoot 'AGENTS.md')
$bootstrap = Get-Content -Raw -LiteralPath (Join-Path $instructionRoot 'AI-BOOTSTRAP.md')
$constitution = Get-Content -Raw -LiteralPath (Join-Path $instructionRoot 'PROJECT-CONSTITUTION.md')
$approval = Get-Content -Raw -LiteralPath (Join-Path $instructionRoot 'APPROVAL-GATES.md')
$antiPatterns = Get-Content -Raw -LiteralPath (Join-Path $instructionRoot 'SYSTEM-ANTI-PATTERNS.md')

foreach ($token in @('PROJECT-CONSTITUTION.md','AI-BOOTSTRAP.md','SKILL-REGISTRY.json','WORKFLOW-REGISTRY.json','project-orchestrator','APPROVAL-GATES.md','project-memory')) {
    if (($agents + $bootstrap) -notmatch [regex]::Escape($token)) {
        Add-Blocker "Routing does not reference '$token'."
    }
}
foreach ($token in @('ui-ux-production','backend-production-engineering','domain-skill-framework','do not read every skill')) {
    if ($bootstrap -notmatch [regex]::Escape($token)) {
        Add-Blocker "Bootstrap does not preserve required route '$token'."
    }
}
foreach ($level in @('LOW','MEDIUM','HIGH','CRITICAL')) {
    if ($bootstrap -notmatch "(?m)^- $($level):") {
        Add-Blocker "Bootstrap does not define risk '$level'."
    }
}
foreach ($gate in 1..12) {
    $gateId = 'AG-{0:d2}' -f $gate
    if ($approval -notmatch [regex]::Escape($gateId)) {
        Add-Blocker "Approval gate '$gateId' is not defined."
    }
}

$orderTokens = @(
    'PROJECT-CONSTITUTION.md',
    'SKILL-REGISTRY.json',
    'skills/project-orchestrator/SKILL.md',
    'APPROVAL-GATES.md',
    'skills/project-memory/SKILL.md'
)
$last = -1
foreach ($token in $orderTokens) {
    $position = $bootstrap.IndexOf($token, [StringComparison]::Ordinal)
    if ($position -lt 0) {
        Add-Blocker "Bootstrap order token '$token' is missing."
    } elseif ($position -le $last) {
        Add-Blocker "Bootstrap order is invalid at '$token'."
    } else {
        $last = $position
    }
}

try {
    $skillRegistry = Get-Content -Raw -LiteralPath (Join-Path $instructionRoot 'SKILL-REGISTRY.json') | ConvertFrom-Json
    $workflowRegistry = Get-Content -Raw -LiteralPath (Join-Path $instructionRoot 'WORKFLOW-REGISTRY.json') | ConvertFrom-Json
} catch {
    Add-Blocker "Cannot parse routing registries: $($_.Exception.Message)"
}

if ($null -ne $workflowRegistry) {
    foreach ($workflow in @($workflowRegistry.workflows)) {
        if ($bootstrap -notmatch [regex]::Escape($workflow.id)) {
            Add-Blocker "Bootstrap does not route workflow '$($workflow.id)'."
        }
        $workflowFile = Join-Path $instructionRoot $workflow.path
        if (-not (Test-Path -LiteralPath $workflowFile -PathType Leaf)) {
            Add-Blocker "Workflow route '$($workflow.id)' has no file."
        }
    }
}
if ($null -ne $skillRegistry) {
    foreach ($skill in @($skillRegistry.skills)) {
        $skillFile = Join-Path $instructionRoot $skill.path
        if (-not (Test-Path -LiteralPath $skillFile -PathType Leaf)) {
            Add-Blocker "Skill route '$($skill.id)' has no file."
        }
    }
}

$antiCount = [regex]::Matches($antiPatterns, '(?m)^\d+\.\s+\*\*').Count
if ($antiCount -ne 35) {
    Add-Blocker "SYSTEM-ANTI-PATTERNS.md has $antiCount numbered patterns; expected 35."
}

$authorityTokens = @(
    'Platform, system, developer',
    "user's current explicit intent",
    'This constitution',
    'AGENTS.md',
    'APPROVAL-GATES.md',
    'selected workflow',
    'selected Standard Skill',
    'Activated reusable Custom Skill'
)
foreach ($token in $authorityTokens) {
    if ($constitution -notmatch [regex]::Escape($token)) {
        Add-Blocker "Constitution authority order is missing '$token'."
    }
}

$linkPattern = '\[[^\]]+\]\(([^)]+)\)'
Get-ChildItem -LiteralPath $RepositoryRoot -Recurse -File -Filter '*.md' | Where-Object { -not $_.FullName.StartsWith((Join-Path $RepositoryRoot '.git') + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase) } | ForEach-Object {
    $file = $_
    $content = Get-Content -Raw -LiteralPath $file.FullName
    foreach ($match in [regex]::Matches($content, $linkPattern)) {
        $target = $match.Groups[1].Value.Trim()
        if ($target.StartsWith('<') -and $target.EndsWith('>')) {
            $target = $target.Substring(1, $target.Length - 2)
        }
        $target = ($target -split '#', 2)[0]
        if ([string]::IsNullOrWhiteSpace($target) -or
            $target -match '^(https?://|mailto:|#)' -or
            $target -match '^\$') {
            continue
        }
        try {
            $resolved = [IO.Path]::GetFullPath((Join-Path $file.DirectoryName $target))
            if (-not (Test-Path -LiteralPath $resolved)) {
                Add-Blocker "Broken Markdown link in '$($file.FullName.Substring($RepositoryRoot.Length + 1))': '$target'."
            }
        } catch {
            Add-Blocker "Invalid Markdown link in '$($file.FullName.Substring($RepositoryRoot.Length + 1))': '$target'."
        }
    }
}

$todoMatches = Get-ChildItem -LiteralPath (Join-Path $instructionRoot 'skills') -Recurse -File |
    Select-String -Pattern '\[TODO|TODO:|Help with .* tasks'
foreach ($match in @($todoMatches)) {
    Add-Blocker "Placeholder remains at '$($match.Path.Substring($RepositoryRoot.Length + 1)):$($match.LineNumber)'."
}

$routeCases = @(
    @{ Signal='clone'; Workflow='project-onboarding'; Skill='project-bootstrap-governance' },
    @{ Signal='feature'; Workflow='feature-development'; Skill='requirement-analysis' },
    @{ Signal='bug'; Workflow='bug-fix'; Skill='testing-quality' },
    @{ Signal='migration'; Workflow='migration'; Skill='migration-compatibility' },
    @{ Signal='dependency'; Workflow='dependency-upgrade'; Skill='dependency-evolution' },
    @{ Signal='release'; Workflow='release'; Skill='devops-release' },
    @{ Signal='incident'; Workflow='incident-response'; Skill='observability-incident' },
    @{ Signal='performance'; Workflow='performance-optimization'; Skill='performance-scalability' },
    @{ Signal='security'; Workflow='security-review'; Skill='security-threat-modeling' },
    @{ Signal='AI'; Workflow='ai-feature'; Skill='ai-agent-safety' }
)
foreach ($case in $routeCases) {
    $workflow = @($workflowRegistry.workflows | Where-Object id -eq $case.Workflow)
    $skill = @($skillRegistry.skills | Where-Object id -eq $case.Skill)
    if ($workflow.Count -ne 1 -or $skill.Count -ne 1) {
        Add-Blocker "Routing case '$($case.Signal)' cannot resolve workflow '$($case.Workflow)' and skill '$($case.Skill)'."
    }
}

Write-Host "Route test: $script:blockers blocker(s), $script:warnings warning(s), $antiCount anti-pattern(s), $(@($workflowRegistry.workflows).Count) route case families."
if ($script:blockers -gt 0) { exit 1 }
exit 0
