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
$manifestPath = Join-Path $instructionRoot 'project-custom-skills/PROJECT-STACK-MANIFEST.json'
$rulesPath = Join-Path $instructionRoot 'custom-skills/STACK-DETECTION-RULES.json'
try {
    $manifest = Get-Content -Raw -LiteralPath $manifestPath | ConvertFrom-Json
    $rules = Get-Content -Raw -LiteralPath $rulesPath | ConvertFrom-Json
} catch {
    Add-Blocker "Cannot parse stack detection input: $($_.Exception.Message)"
    Write-Host "Stack detection: $script:blockers blocker(s)."
    exit 1
}

$rawFiles = @(& git -C $RepositoryRoot ls-files --cached --others --exclude-standard 2>$null)
if ($LASTEXITCODE -ne 0) { Add-Blocker 'Cannot enumerate repository files with git.'; $rawFiles = @() }
$files = @($rawFiles | ForEach-Object { ([string]$_).Replace('\','/') } | Where-Object {
    $_ -notmatch '(^|/)(node_modules|vendor|dist|build|coverage)/' -and
    $_ -notlike 'components/instruction/custom-skills/*' -and
    $_ -notlike 'components/instruction/project-custom-skills/*' -and
    $_ -notlike 'components/instruction/project-memory/*' -and
    $_ -notlike 'components/instruction/reports/*'
})
function Has-File([string[]]$Patterns) {
    foreach ($pattern in $Patterns) {
        if (@($files | Where-Object { $_ -like $pattern }).Count -gt 0) { return $true }
    }
    return $false
}
function Matching-Files([string[]]$Patterns) {
    $matches = @()
    foreach ($pattern in $Patterns) { $matches += @($files | Where-Object { $_ -like $pattern }) }
    return @($matches | Sort-Object -Unique)
}

$packages = @()
foreach ($relative in @($files | Where-Object { $_ -eq 'package.json' -or $_ -like '*/package.json' })) {
    try {
        $json = Get-Content -Raw -LiteralPath (Join-Path $RepositoryRoot $relative) | ConvertFrom-Json
        $all = @{}
        foreach ($section in @('dependencies','devDependencies','peerDependencies','optionalDependencies')) {
            if ($json.PSObject.Properties.Name -contains $section -and $null -ne $json.$section) {
                foreach ($property in $json.$section.PSObject.Properties) { $all[$property.Name] = [string]$property.Value }
            }
        }
        $packages += [pscustomobject]@{ Path = $relative; Json = $json; Dependencies = $all }
    } catch { Add-Blocker "Invalid package manifest '$relative': $($_.Exception.Message)" }
}
function Dependency-Version([string[]]$Names) {
    foreach ($package in $packages) {
        foreach ($name in $Names) {
            if ($name.EndsWith('*')) {
                $prefix = $name.TrimEnd('*')
                $match = @($package.Dependencies.Keys | Where-Object { $_.StartsWith($prefix) } | Select-Object -First 1)
                if ($match.Count -gt 0) { return [string]$package.Dependencies[$match[0]] }
            } elseif ($package.Dependencies.ContainsKey($name)) { return [string]$package.Dependencies[$name] }
        }
    }
    return $null
}
function Has-Dependency([string[]]$Names) { return $null -ne (Dependency-Version $Names) }
function Package-EngineVersion {
    foreach ($package in $packages) {
        if ($package.Json.PSObject.Properties.Name -contains 'engines' -and $null -ne $package.Json.engines -and $package.Json.engines.PSObject.Properties.Name -contains 'node') {
            return [string]$package.Json.engines.node
        }
    }
    foreach ($pin in @('.node-version','.nvmrc')) {
        if ($pin -in $files) { return (Get-Content -Raw -LiteralPath (Join-Path $RepositoryRoot $pin)).Trim() }
    }
    return $null
}
function Result([string]$Id,[bool]$Detected,[string]$Confidence,$Version,[string[]]$Evidence) {
    return [pscustomobject]@{ skill_id=$Id; detected=$Detected; confidence=$Confidence; detected_version=$Version; evidence=$Evidence }
}

$observed = @{}
$react = Dependency-Version @('react')
$typescript = Has-Dependency @('typescript')
$reactSupport = Has-File @('tsconfig.json','*/tsconfig.json','src/*.tsx','src/**/*.tsx','app/*.tsx','app/**/*.tsx')
$observed['react-typescript'] = Result 'react-typescript' ($null -ne $react -and $typescript) $(if($null -ne $react -and $typescript){if($reactSupport){'HIGH'}else{'MEDIUM'}}else{'NONE'}) $(if($null -ne $react){$react}else{$null}) @('package dependency evidence')

$next = Dependency-Version @('next')
$nextSupport = Has-File @('next.config.*','*/next.config.*','app/*','app/**/*','pages/*','pages/**/*','*/app/*','*/app/**/*')
$observed['nextjs'] = Result 'nextjs' ($null -ne $next) $(if($null -ne $next){if($nextSupport){'HIGH'}else{'MEDIUM'}}else{'NONE'}) $next @('next dependency and router/config evidence')

$vite = Dependency-Version @('vite')
$viteSupport = Has-File @('vite.config.*','*/vite.config.*')
$observed['vite-react'] = Result 'vite-react' ($null -ne $vite -and $null -ne $react) $(if($null -ne $vite -and $null -ne $react){if($viteSupport){'HIGH'}else{'MEDIUM'}}else{'NONE'}) $vite @('vite/react dependency and config evidence')

$supabase = Dependency-Version @('@supabase/supabase-js','@supabase/ssr')
$supabaseSupport = Has-File @('supabase/config.toml','*/supabase/config.toml','supabase/functions/*','supabase/functions/**/*')
$observed['supabase-platform'] = Result 'supabase-platform' ($null -ne $supabase -or $supabaseSupport) $(if($supabaseSupport -and $null -ne $supabase){'HIGH'}elseif($supabaseSupport -or $null -ne $supabase){'MEDIUM'}else{'NONE'}) $supabase @('Supabase dependency/config evidence')

$migrations = @(Matching-Files @('supabase/migrations/*.sql','supabase/migrations/**/*.sql','*/supabase/migrations/*.sql','*/supabase/migrations/**/*.sql'))
$hasMigrations = $migrations.Count -gt 0
$observed['postgres-supabase-db'] = Result 'postgres-supabase-db' $hasMigrations $(if($hasMigrations){if(Has-File @('supabase/config.toml','*/supabase/config.toml')){'HIGH'}else{'MEDIUM'}}else{'NONE'}) $null $migrations

$vercelProject = Has-File @('.vercel/project.json','*/.vercel/project.json')
$vercelConfig = Has-File @('vercel.json','*/vercel.json','.vercel/project.json','*/.vercel/project.json')
$vercelWorkflow = Has-File @('.github/workflows/*vercel*.yml','.github/workflows/*vercel*.yaml')
$observed['vercel-platform'] = Result 'vercel-platform' $vercelConfig $(if($vercelConfig){if($vercelWorkflow -or $vercelProject){'HIGH'}else{'MEDIUM'}}else{'NONE'}) $null @('Vercel config/workflow evidence')

$query = Dependency-Version @('@tanstack/react-query')
$querySupport = Has-File @('*queryClient*','*query-client*','*/queryClient*','*/query-client*')
$observed['tanstack-query'] = Result 'tanstack-query' ($null -ne $query) $(if($null -ne $query){if($querySupport){'HIGH'}else{'MEDIUM'}}else{'NONE'}) $query @('TanStack Query dependency/source evidence')

$rhf = Dependency-Version @('react-hook-form')
$zod = Dependency-Version @('zod')
$observed['react-hook-form-zod'] = Result 'react-hook-form-zod' ($null -ne $rhf -and $null -ne $zod) $(if($null -ne $rhf -and $null -ne $zod){'HIGH'}else{'NONE'}) $(if($null -ne $rhf -and $null -ne $zod){"react-hook-form=$rhf; zod=$zod"}else{$null}) @('React Hook Form and Zod dependency evidence')

$tailwind = Dependency-Version @('tailwindcss')
$componentsJson = Has-File @('components.json','*/components.json')
$observed['tailwind-shadcn'] = Result 'tailwind-shadcn' ($null -ne $tailwind -and $componentsJson) $(if($null -ne $tailwind -and $componentsJson){if(Has-File @('tailwind.config.*','*/tailwind.config.*','app/globals.css','*/app/globals.css')){'HIGH'}else{'MEDIUM'}}else{'NONE'}) $tailwind @('Tailwind dependency and shadcn components.json evidence')

$manifestFiles = @(Matching-Files @('public/manifest.webmanifest','public/manifest.json','*/public/manifest.webmanifest','*/public/manifest.json'))
$workerFiles = @(Matching-Files @('public/sw.js','*/public/sw.js','src/*service-worker*','src/**/*service-worker*','*/src/*service-worker*','*/src/**/*service-worker*'))
$pwaDetected = $manifestFiles.Count -gt 0 -and $workerFiles.Count -gt 0
$observed['pwa-webview'] = Result 'pwa-webview' $pwaDetected $(if($pwaDetected){'HIGH'}else{'NONE'}) $null @($manifestFiles + $workerFiles)

$base44 = Dependency-Version @('@base44/sdk','base44')
$base44Support = Has-File @('base44/*','base44/**/*','*/base44/*','*/base44/**/*')
$observed['base44-platform'] = Result 'base44-platform' ($null -ne $base44 -or $base44Support) $(if($null -ne $base44 -and $base44Support){'HIGH'}elseif($null -ne $base44 -or $base44Support){'MEDIUM'}else{'NONE'}) $base44 @('Base44 dependency/config evidence')

$gitConfig = Test-Path -LiteralPath (Join-Path $RepositoryRoot '.git/config') -PathType Leaf
$workflowFiles = @(Matching-Files @('.github/workflows/*.yml','.github/workflows/*.yaml'))
$githubDetected = $gitConfig -and $workflowFiles.Count -gt 0
$observed['github-ci'] = Result 'github-ci' $githubDetected $(if($githubDetected){'HIGH'}elseif($gitConfig -or $workflowFiles.Count -gt 0){'LOW'}else{'NONE'}) $(if($githubDetected){'platform-managed; workflow action releases are explicit in workflow files'}else{$null}) @($workflowFiles)

$nodeVersion = Package-EngineVersion
$nodeServer = Has-File @('server.*','src/server.*','*/src/server.*','api/*','api/**/*','*/api/*','*/api/**/*','Dockerfile','*/Dockerfile')
$observed['nodejs-runtime'] = Result 'nodejs-runtime' ($null -ne $nodeVersion) $(if($null -ne $nodeVersion){if($nodeServer){'HIGH'}else{'MEDIUM'}}else{'NONE'}) $nodeVersion @('Node engines/version pin and runtime source evidence')

$aiVersion = Dependency-Version @('openai','@anthropic-ai/sdk','@ai-sdk/*')
$aiSource = Has-File @('src/*llm*','src/**/*llm*','src/*embedding*','src/**/*embedding*','*/src/*llm*','*/src/**/*llm*')
$observed['ai-llm-integration'] = Result 'ai-llm-integration' ($null -ne $aiVersion) $(if($null -ne $aiVersion){if($aiSource){'HIGH'}else{'MEDIUM'}}else{'NONE'}) $aiVersion @('AI provider SDK and integration source evidence')

$ruleIds = @($rules.rules | ForEach-Object { [string]$_.skill_id })
$manifestById = @{}
foreach ($item in @($manifest.detections)) { $manifestById[[string]$item.skill_id] = $item }
foreach ($id in $ruleIds) {
    if (-not $observed.ContainsKey($id)) { Add-Blocker "Detector implementation is missing '$id'."; continue }
    if (-not $manifestById.ContainsKey($id)) { Add-Blocker "Stack manifest is missing '$id'."; continue }
    $actual = $observed[$id]
    $declared = $manifestById[$id]
    if ([bool]$declared.detected -ne [bool]$actual.detected -or [string]$declared.confidence -ne [string]$actual.confidence) {
        Add-Blocker "Stack manifest is stale for '$id': declared detected=$($declared.detected)/$($declared.confidence), observed detected=$($actual.detected)/$($actual.confidence)."
    }
    if ([string]$declared.detected_version -ne [string]$actual.detected_version) {
        Add-Blocker "Stack manifest version is stale for '$id': declared '$($declared.detected_version)', observed '$($actual.detected_version)'."
    }
}
foreach ($id in $manifestById.Keys) { if ($id -notin $ruleIds) { Add-Blocker "Stack manifest contains unregistered detection '$id'." } }

$detectedCount = @($observed.Values | Where-Object detected).Count
Write-Host "Stack detection: $script:blockers blocker(s), $detectedCount detected of $($observed.Count) technology skill(s)."
if ($script:blockers -gt 0) { exit 1 }
exit 0
