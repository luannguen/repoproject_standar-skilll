[CmdletBinding()]
param(
    [string]$RepositoryRoot
)

if ([string]::IsNullOrWhiteSpace($RepositoryRoot)) {
    $RepositoryRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../../..'))
}

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$script:blockers = 0
function Add-Blocker([string]$Message) {
    $script:blockers++
    Write-Host "[BLOCKER] $Message" -ForegroundColor Red
}

$instructionRoot = Join-Path $RepositoryRoot 'components/instruction'
$manifestPath = Join-Path $instructionRoot 'project-custom-skills/PROJECT-DOMAIN-MANIFEST.json'
$rulesPath = Join-Path $instructionRoot 'custom-skills/DOMAIN-DETECTION-RULES.json'
try {
    $manifest = Get-Content -Raw -LiteralPath $manifestPath | ConvertFrom-Json
    $rules = Get-Content -Raw -LiteralPath $rulesPath | ConvertFrom-Json
} catch {
    Add-Blocker "Cannot parse domain detection input: $($_.Exception.Message)"
    Write-Host "Domain detection: $script:blockers blocker(s)."
    exit 1
}

$rawFiles = @(& git -C $RepositoryRoot ls-files --cached --others --exclude-standard 2>$null)
if ($LASTEXITCODE -ne 0) { Add-Blocker 'Cannot enumerate repository files with git.'; $rawFiles = @() }
$eligibleExtensions = @('.ts','.tsx','.js','.jsx','.py','.go','.rs','.java','.kt','.cs','.sql','.prisma','.graphql','.gql','.yaml','.yml','.json','.md')
$files = @($rawFiles | ForEach-Object { ([string]$_).Replace('\','/') } | Where-Object {
    $_ -notmatch '(^|/)(node_modules|vendor|dist|build|coverage)/' -and
    $_ -notlike 'components/instruction/*' -and
    $_ -notin @('README.md','AGENTS.md','CONTRIBUTING.md','CHANGELOG.md','docs/SECURITY-BASELINE.md','docs/REPOSITORY-GOVERNANCE.md','docs/RELEASE-POLICY.md') -and
    $_ -notlike '.github/*' -and
    $_ -notlike '.git/*' -and
    [IO.Path]::GetExtension($_).ToLowerInvariant() -in $eligibleExtensions
})

function Category([string]$Path) {
    $p = $Path.ToLowerInvariant()
    if ($p -match '(^|/)(migrations?|schema|database|db)/' -or $p.EndsWith('.sql') -or $p.EndsWith('.prisma')) { return 'database_schema_or_migration' }
    if ($p -match '(^|/)(__tests__|tests?|specs?)/' -or $p -match '\.(test|spec)\.[^.]+$') { return 'domain_test' }
    if ($p -match '(^|/)(docs?|specifications?|contracts?)/' -or $p -match '(openapi|asyncapi|contract)') { return 'contract_or_specification' }
    if ([IO.Path]::GetExtension($p) -in @('.ts','.tsx','.js','.jsx','.py','.go','.rs','.java','.kt','.cs','.graphql','.gql')) { return 'domain_source_model' }
    return $null
}
function Contains-Term([string]$Content,[string]$Term) {
    $pattern = '(?i)(^|[^a-z0-9])' + [regex]::Escape($Term) + '([^a-z0-9]|$)'
    return $Content -match $pattern
}

$observed = @{}
foreach ($rule in @($rules.rules)) {
    $id = [string]$rule.skill_id
    $evidence = @()
    foreach ($relative in $files) {
        $category = Category $relative
        if ($null -eq $category) { continue }
        $absolute = Join-Path $RepositoryRoot $relative
        try {
            $item = Get-Item -LiteralPath $absolute
            if ($item.Length -gt 1MB) { continue }
            $content = [IO.File]::ReadAllText($absolute)
        } catch { continue }
        $matched = @($rule.concept_terms | Where-Object { Contains-Term $content ([string]$_) })
        if ($matched.Count -ge 2) {
            $evidence += [pscustomobject]@{ path=$relative; category=$category; terms=@($matched | ForEach-Object { [string]$_ }) }
        }
    }
    $categories = @($evidence | ForEach-Object { $_.category } | Sort-Object -Unique)
    $count = @($evidence).Count
    $detected = $count -ge [int]$rule.minimum_independent_evidence -and $categories.Count -ge 2
    $confidence = if ($detected -and $count -ge 3 -and (@($categories | Where-Object { $_ -in @('database_schema_or_migration','domain_test') }).Count -gt 0)) { 'HIGH' }
        elseif ($detected) { 'MEDIUM' }
        elseif ($count -gt 0) { 'LOW' }
        else { 'NONE' }
    $observed[$id] = [pscustomobject]@{ skill_id=$id; detected=$detected; confidence=$confidence; evidence=$evidence }
}

$manifestById = @{}
foreach ($item in @($manifest.detections)) { $manifestById[[string]$item.skill_id] = $item }
foreach ($id in $observed.Keys) {
    if (-not $manifestById.ContainsKey($id)) { Add-Blocker "Domain manifest is missing '$id'."; continue }
    $actual = $observed[$id]
    $declared = $manifestById[$id]
    if ([bool]$declared.detected -ne [bool]$actual.detected -or [string]$declared.confidence -ne [string]$actual.confidence) {
        $paths = @($actual.evidence | ForEach-Object { $_.path }) -join ', '
        Add-Blocker "Domain manifest is stale for '$id': declared detected=$($declared.detected)/$($declared.confidence), observed detected=$($actual.detected)/$($actual.confidence). Evidence: $paths"
    }
    if ([int]$declared.verified_rules_count -gt 0 -and -not [bool]$declared.detected) {
        Add-Blocker "Domain '$id' declares verified rules without qualifying detection evidence."
    }
}
foreach ($id in $manifestById.Keys) { if (-not $observed.ContainsKey($id)) { Add-Blocker "Domain manifest contains unregistered detection '$id'." } }

$detectedCount = @($observed.Values | Where-Object detected).Count
$candidateCount = @($observed.Values | Where-Object confidence -eq 'LOW').Count
Write-Host "Domain detection: $script:blockers blocker(s), $detectedCount detected, $candidateCount low-confidence candidate(s), $($observed.Count) domain skill(s)."
if ($script:blockers -gt 0) { exit 1 }
exit 0
