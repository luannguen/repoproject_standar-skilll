[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$ProjectName,

    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$Owner,

    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$Purpose,

    [string]$RepositoryUrl = '',

    [ValidateSet('undecided', 'selected', 'proprietary')]
    [string]$LicenseStatus = 'undecided',

    [switch]$Force
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repositoryRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$profilePath = Join-Path $repositoryRoot 'components/instruction/PROJECT-PROFILE.json'

if (-not (Test-Path -LiteralPath $profilePath -PathType Leaf)) {
    throw "Project profile is missing: $profilePath"
}

$profile = Get-Content -Raw -LiteralPath $profilePath | ConvertFrom-Json
if ($profile.mode -ne 'template' -and -not $Force) {
    throw "Profile mode is '$($profile.mode)'. Use -Force only after reviewing the existing project identity."
}

$profile.mode = 'project'
$profile.status = 'onboarding'
$profile.updated_at = (Get-Date).ToUniversalTime().ToString('yyyy-MM-dd')
$profile.identity.project_name = $ProjectName
$profile.identity.owner = $Owner
$profile.identity.purpose = $Purpose
$profile.identity.repository_url = $RepositoryUrl
$profile.governance.license_status = $LicenseStatus
$profile.onboarding.primary_workflow = 'project-onboarding'
$profile.onboarding.last_completed_at = $null
$profile.onboarding.completed_by = $null
$openDecisions = @(
    'verify application evidence and classifications',
    'register authoritative project commands',
    'verify repository-host protections',
    'activate triggered production controls'
)
if ($LicenseStatus -eq 'undecided') {
    $openDecisions = @('select application license or proprietary status') + $openDecisions
}
$profile.onboarding.open_decisions = $openDecisions

$json = $profile | ConvertTo-Json -Depth 20
if ($PSCmdlet.ShouldProcess($profilePath, 'Initialize cloned project profile')) {
    $temporaryPath = "$profilePath.tmp"
    [IO.File]::WriteAllText($temporaryPath, $json + [Environment]::NewLine, [Text.UTF8Encoding]::new($false))
    Move-Item -LiteralPath $temporaryPath -Destination $profilePath -Force
    Write-Output "Initialized project profile for '$ProjectName'. Status remains 'onboarding'."
} else {
    Write-Output $json
}
