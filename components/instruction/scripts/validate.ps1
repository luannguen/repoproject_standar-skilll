[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$instructionRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$repositoryRoot = [IO.Path]::GetFullPath((Join-Path $instructionRoot '../..'))
$memoryRoot = Join-Path $instructionRoot 'project-memory'
$hostExecutable = (Get-Process -Id $PID).Path
$checks = @(
    @{ Name = 'repository-lint'; Path = (Join-Path $PSScriptRoot 'repository-lint.ps1'); Args = @('-RepositoryRoot',$repositoryRoot) },
    @{ Name = 'skill-lint'; Path = (Join-Path $PSScriptRoot 'skill-lint.ps1'); Args = @('-InstructionRoot',$instructionRoot) },
    @{ Name = 'workflow-lint'; Path = (Join-Path $PSScriptRoot 'workflow-lint.ps1'); Args = @('-InstructionRoot',$instructionRoot) },
    @{ Name = 'custom-skill-lint'; Path = (Join-Path $PSScriptRoot 'custom-skill-lint.ps1'); Args = @('-InstructionRoot',$instructionRoot) },
    @{ Name = 'stack-detection'; Path = (Join-Path $PSScriptRoot 'stack-detection.ps1'); Args = @('-RepositoryRoot',$repositoryRoot) },
    @{ Name = 'domain-detection'; Path = (Join-Path $PSScriptRoot 'domain-detection.ps1'); Args = @('-RepositoryRoot',$repositoryRoot) },
    @{ Name = 'routing-fixture-test'; Path = (Join-Path $PSScriptRoot 'routing-fixture-test.ps1'); Args = @('-InstructionRoot',$instructionRoot) },
    @{ Name = 'instruction-route-test'; Path = (Join-Path $PSScriptRoot 'instruction-route-test.ps1'); Args = @('-RepositoryRoot',$repositoryRoot) },
    @{ Name = 'custom-skill-route-test'; Path = (Join-Path $PSScriptRoot 'custom-skill-route-test.ps1'); Args = @('-InstructionRoot',$instructionRoot) },
    @{ Name = 'memory-lint'; Path = (Join-Path $instructionRoot 'skills/project-memory/scripts/memory-lint.ps1'); Args = @('-MemoryRoot',$memoryRoot) }
)

$failed = [System.Collections.Generic.List[string]]::new()
foreach ($check in $checks) {
    Write-Host ''
    Write-Host "== $($check.Name) ==" -ForegroundColor Cyan
    $arguments = @('-NoLogo','-NoProfile','-NonInteractive','-File',[string]$check.Path) + @($check.Args)
    & $hostExecutable @arguments
    if ($LASTEXITCODE -ne 0) {
        $failed.Add([string]$check.Name)
    }
}

Write-Host ''
if ($failed.Count -gt 0) {
    Write-Host "Unified validation failed: $($failed -join ', ')." -ForegroundColor Red
    exit 1
}

Write-Host "Unified validation passed: $($checks.Count) check(s)." -ForegroundColor Green
exit 0
