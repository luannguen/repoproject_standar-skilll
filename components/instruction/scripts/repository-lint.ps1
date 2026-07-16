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

$requiredFiles = @(
    '.editorconfig',
    '.gitattributes',
    '.gitignore',
    'README.md',
    'CONTRIBUTING.md',
    'CHANGELOG.md',
    'VERSION',
    'AGENTS.md',
    'docs/REPOSITORY-GOVERNANCE.md',
    'docs/SECURITY-BASELINE.md',
    'docs/RELEASE-POLICY.md',
    '.github/CODEOWNERS',
    '.github/SECURITY.md',
    '.github/dependabot.yml',
    '.github/pull_request_template.md',
    '.github/workflows/quality-gates.yml',
    'components/instruction/TEMPLATE-MANIFEST.json',
    'components/instruction/PROJECT-PROFILE.json',
    'components/instruction/PROJECT-ONBOARDING.md',
    'components/instruction/scripts/validate.ps1',
    'components/instruction/scripts/routing-fixture-test.ps1',
    'components/instruction/scripts/custom-skill-lint.ps1',
    'components/instruction/scripts/stack-detection.ps1',
    'components/instruction/scripts/domain-detection.ps1',
    'components/instruction/scripts/custom-skill-route-test.ps1',
    'components/instruction/tests/routing-cases.json',
    'components/instruction/tests/custom-skill-routing-cases.json',
    'components/instruction/custom-skills/CUSTOM-SKILL-REGISTRY.json',
    'components/instruction/custom-skills/STACK-DETECTION-RULES.json',
    'components/instruction/custom-skills/DOMAIN-DETECTION-RULES.json',
    'components/instruction/custom-skills/COMPATIBILITY-MATRIX.json',
    'components/instruction/project-custom-skills/PROJECT-STACK-MANIFEST.json',
    'components/instruction/project-custom-skills/PROJECT-DOMAIN-MANIFEST.json',
    'components/instruction/project-custom-skills/ACTIVE-CUSTOM-SKILLS.json',
    'components/instruction/workflows/project-onboarding/WORKFLOW.md',
    'components/instruction/skills/project-bootstrap-governance/SKILL.md',
    'scripts/initialize-project.ps1',
    '.github/ISSUE_TEMPLATE/bug_report.yml',
    '.github/ISSUE_TEMPLATE/feature_request.yml',
    '.github/ISSUE_TEMPLATE/config.yml'
)

foreach ($relative in $requiredFiles) {
    if (-not (Test-Path -LiteralPath (Join-Path $RepositoryRoot $relative) -PathType Leaf)) {
        Add-Blocker "Missing repository baseline file '$relative'."
    }
}

$jsonFiles = @(
    'components/instruction/TEMPLATE-MANIFEST.json',
    'components/instruction/PROJECT-PROFILE.json',
    'components/instruction/SKILL-REGISTRY.json',
    'components/instruction/WORKFLOW-REGISTRY.json',
    'components/instruction/tests/routing-cases.json',
    'components/instruction/tests/custom-skill-routing-cases.json',
    'components/instruction/custom-skills/CUSTOM-SKILL-REGISTRY.json',
    'components/instruction/custom-skills/STACK-DETECTION-RULES.json',
    'components/instruction/custom-skills/DOMAIN-DETECTION-RULES.json',
    'components/instruction/custom-skills/COMPATIBILITY-MATRIX.json',
    'components/instruction/custom-skills/STACK-PROFILES.json',
    'components/instruction/project-custom-skills/PROJECT-STACK-MANIFEST.json',
    'components/instruction/project-custom-skills/PROJECT-DOMAIN-MANIFEST.json',
    'components/instruction/project-custom-skills/ACTIVE-CUSTOM-SKILLS.json',
    'components/instruction/project-memory/memory-index.json'
)

$jsonObjects = @{}
foreach ($relative in $jsonFiles) {
    $path = Join-Path $RepositoryRoot $relative
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        Add-Blocker "Missing JSON contract '$relative'."
        continue
    }
    try {
        $jsonObjects[$relative] = Get-Content -Raw -LiteralPath $path | ConvertFrom-Json
    } catch {
        Add-Blocker "Invalid JSON in '$relative': $($_.Exception.Message)"
    }
}

$profileKey = 'components/instruction/PROJECT-PROFILE.json'
if ($jsonObjects.ContainsKey($profileKey)) {
    $profile = $jsonObjects[$profileKey]
    foreach ($field in @('schema_version','template_version','updated_at','mode','status','identity','evidence','classification','commands','governance','onboarding')) {
        if (-not (Has-Property $profile $field)) {
            Add-Blocker "Project profile is missing '$field'."
        }
    }
    if ($profile.mode -notin @('template','project')) {
        Add-Blocker "Project profile has unsupported mode '$($profile.mode)'."
    }
    if ($profile.status -notin @('uninstantiated','onboarding','active','archived')) {
        Add-Blocker "Project profile has unsupported status '$($profile.status)'."
    }
    if ($profile.mode -eq 'template' -and $profile.status -ne 'uninstantiated') {
        Add-Blocker 'Template mode must remain uninstantiated.'
    }
    if ($profile.mode -eq 'project') {
        foreach ($field in @('project_name','owner','purpose')) {
            if (-not (Has-Property $profile.identity $field) -or [string]::IsNullOrWhiteSpace([string]$profile.identity.$field)) {
                Add-Blocker "Instantiated project identity is missing '$field'."
            }
        }
    }
    if ($profile.status -eq 'active' -and $profile.governance.license_status -eq 'undecided') {
        Add-Blocker 'An active project cannot retain an undecided license status.'
    }
}

$manifestKey = 'components/instruction/TEMPLATE-MANIFEST.json'
$versionPath = Join-Path $RepositoryRoot 'VERSION'
if ($jsonObjects.ContainsKey($profileKey) -and $jsonObjects.ContainsKey($manifestKey) -and (Test-Path -LiteralPath $versionPath -PathType Leaf)) {
    $version = (Get-Content -Raw -LiteralPath $versionPath).Trim()
    if ($version -notmatch '^[0-9]+[.][0-9]+[.][0-9]+$') {
        Add-Blocker "VERSION is not semantic versioning: '$version'."
    }
    if ([string]$jsonObjects[$profileKey].template_version -ne $version) {
        Add-Blocker 'Project profile template_version differs from VERSION.'
    }
    if ([string]$jsonObjects[$manifestKey].template_version -ne $version) {
        Add-Blocker 'Template manifest template_version differs from VERSION.'
    }
    $entrypoint = [string]$jsonObjects[$manifestKey].validation_entrypoint
    if ([string]::IsNullOrWhiteSpace($entrypoint) -or -not (Test-Path -LiteralPath (Join-Path $RepositoryRoot $entrypoint) -PathType Leaf)) {
        Add-Blocker "Template validation entrypoint is missing: '$entrypoint'."
    }
    if ([string]$jsonObjects[$profileKey].onboarding.primary_workflow -ne 'project-onboarding') {
        Add-Blocker 'Project profile does not route onboarding to project-onboarding.'
    }
    if ($jsonObjects[$profileKey].mode -eq 'template' -and [bool]$jsonObjects[$profileKey].evidence.application_code_present) {
        Add-Blocker 'Template mode conflicts with application_code_present=true.'
    }
}
$gitIgnorePath = Join-Path $RepositoryRoot '.gitignore'
if (Test-Path -LiteralPath $gitIgnorePath) {
    $gitIgnore = Get-Content -Raw -LiteralPath $gitIgnorePath
    foreach ($pattern in @('.env','*.pem','*.key','*.p12','*.pfx')) {
        if ($gitIgnore -notmatch [regex]::Escape($pattern)) {
            Add-Blocker ".gitignore is missing '$pattern'."
        }
    }
}

$workflowPath = Join-Path $RepositoryRoot '.github/workflows/quality-gates.yml'
if (Test-Path -LiteralPath $workflowPath) {
    $workflow = Get-Content -Raw -LiteralPath $workflowPath
    foreach ($token in @('permissions:','contents: read','ubuntu-latest','windows-latest','validate.ps1')) {
        if ($workflow -notmatch [regex]::Escape($token)) {
            Add-Blocker "Quality workflow is missing '$token'."
        }
    }
    if ($workflow -notmatch 'actions/checkout@[0-9a-f]{40}\s+#\s+v[0-9]+\b') {
        Add-Blocker 'Quality workflow must pin actions/checkout to a full commit SHA and record its major version.'
    }
}


$dependabotPath = Join-Path $RepositoryRoot '.github/dependabot.yml'
if (Test-Path -LiteralPath $dependabotPath) {
    $dependabot = Get-Content -Raw -LiteralPath $dependabotPath
    foreach ($token in @('version: 2','package-ecosystem: github-actions','directory: /','interval: weekly')) {
        if ($dependabot -notmatch [regex]::Escape($token)) {
            Add-Blocker "Dependabot baseline is missing '$token'."
        }
    }
}
$tracked = @(& git -C $RepositoryRoot ls-files --cached --others --exclude-standard 2>$null)
if ($LASTEXITCODE -ne 0) {
    Add-Blocker 'Cannot enumerate repository files with git.'
    $tracked = @()
}

$sensitiveNamePatterns = @(
    '(^|/)\.env($|\.)',
    '\.(pem|key|p12|pfx|jks|keystore)$',
    '(^|/)(id_rsa|id_ed25519)$',
    '(^|/)secrets?\.(json|ya?ml|txt)$'
)
$textExtensions = @(
    '.md','.txt','.json','.yml','.yaml','.ps1','.psm1','.psd1','.js','.jsx',
    '.ts','.tsx','.py','.rb','.go','.rs','.java','.kt','.cs','.fs','.xml',
    '.toml','.ini','.cfg','.conf','.properties','.env','.sh','.bash','.zsh'
)
$secretPatterns = @(
    ('-----BEGIN ' + '(RSA |OPENSSH |EC |DSA |PGP )?PRIVATE KEY-----'),
    ('AKIA' + '[0-9A-Z]{16}'),
    ('gh' + '[pousr]_[A-Za-z0-9]{30,}'),
    ('(?im)(api[_-]?key|access[_-]?token|refresh[_-]?token|password|secret)\s*[:=]\s*["'']?[A-Za-z0-9+/_=-]{20,}')
)

foreach ($relative in $tracked) {
    $normalized = ([string]$relative).Replace('\','/')
    if ($normalized -eq '.env.example' -or $normalized -match '(^|/)secrets?\.example\.') {
        continue
    }
    foreach ($pattern in $sensitiveNamePatterns) {
        if ($normalized -match $pattern) {
            Add-Blocker "Sensitive filename is tracked: '$normalized'."
            break
        }
    }

    $absolute = Join-Path $RepositoryRoot $relative
    if (-not (Test-Path -LiteralPath $absolute -PathType Leaf)) {
        continue
    }
    $item = Get-Item -LiteralPath $absolute -Force
    if ($item.Length -gt 10MB) {
        Add-Blocker "Repository file exceeds 10 MB: '$normalized'."
        continue
    }
    if ($item.Length -gt 1MB) {
        Add-Warning "Repository file exceeds 1 MB and was not content-scanned: '$normalized'."
        continue
    }

    $extension = [IO.Path]::GetExtension($absolute).ToLowerInvariant()
    $name = [IO.Path]::GetFileName($absolute)
    $isText = $extension -in $textExtensions -or $name -in @('VERSION','LICENSE','CODEOWNERS','.editorconfig','.gitattributes','.gitignore')
    if (-not $isText) {
        continue
    }

    try {
        $content = [IO.File]::ReadAllText($absolute)
        foreach ($pattern in $secretPatterns) {
            if ($content -match $pattern) {
                Add-Blocker "Possible secret value in tracked text: '$normalized'."
                break
            }
        }
        if ($content.Length -gt 0 -and -not $content.EndsWith([Environment]::NewLine) -and -not $content.EndsWith([char]10)) {
            Add-Blocker "Text file has no final newline: '$normalized'."
        }
        if ($content -match '(?m)[ \t]+$') {
            if ($extension -eq '.md') {
                Add-Warning "Markdown file contains trailing whitespace: '$normalized'."
            } else {
                Add-Blocker "Text file contains trailing whitespace: '$normalized'."
            }
        }
    } catch {
        Add-Warning "Could not inspect text file '$normalized': $($_.Exception.Message)"
    }
}

$licensePath = Join-Path $RepositoryRoot 'LICENSE'
if ($jsonObjects.ContainsKey($profileKey)) {
    $licenseStatus = [string]$jsonObjects[$profileKey].governance.license_status
    if ($licenseStatus -eq 'undecided' -and (Test-Path -LiteralPath $licensePath)) {
        Add-Blocker 'LICENSE exists while the project profile says the license is undecided.'
    }
    if ($licenseStatus -notin @('undecided','proprietary') -and -not (Test-Path -LiteralPath $licensePath -PathType Leaf)) {
        Add-Blocker "License status '$licenseStatus' requires a LICENSE file."
    }
}

Write-Host "Repository lint: $script:blockers blocker(s), $script:warnings warning(s), $($tracked.Count) file(s) inspected."
if ($script:blockers -gt 0) { exit 1 }
exit 0
