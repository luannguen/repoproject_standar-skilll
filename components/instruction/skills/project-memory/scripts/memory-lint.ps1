[CmdletBinding()]
param(
    [string]$MemoryRoot
)

if ([string]::IsNullOrWhiteSpace($MemoryRoot)) {
    $MemoryRoot = Join-Path $PSScriptRoot '../../../project-memory'
}

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$blockers = [System.Collections.Generic.List[string]]::new()
$warnings = [System.Collections.Generic.List[string]]::new()

function Add-Blocker([string]$Message) {
    $blockers.Add($Message)
}

function Add-Warning([string]$Message) {
    $warnings.Add($Message)
}

function Has-Property($Object, [string]$Name) {
    return $null -ne $Object -and $Object.PSObject.Properties.Name -contains $Name
}

function Is-Blank($Value) {
    if ($null -eq $Value) {
        return $true
    }
    if ($Value -is [string]) {
        return [string]::IsNullOrWhiteSpace($Value)
    }
    return $false
}

try {
    $memoryRootPath = (Resolve-Path -LiteralPath $MemoryRoot).Path
} catch {
    Write-Output "[BLOCKER] Memory root does not exist: $MemoryRoot"
    exit 1
}

$repoRoot = (Resolve-Path -LiteralPath (Join-Path $memoryRootPath '../../..')).Path
$indexPath = Join-Path $memoryRootPath 'memory-index.json'
$humanIndexPath = Join-Path $memoryRootPath 'INDEX.md'

if (-not (Test-Path -LiteralPath $indexPath -PathType Leaf)) {
    Write-Output "[BLOCKER] Missing structured index: $indexPath"
    exit 1
}

try {
    $index = Get-Content -Raw -LiteralPath $indexPath | ConvertFrom-Json
} catch {
    Write-Output "[BLOCKER] Structured index is not valid JSON: $($_.Exception.Message)"
    exit 1
}

if (-not (Has-Property $index 'entries')) {
    Write-Output '[BLOCKER] Structured index has no entries property.'
    exit 1
}

$entries = @($index.entries)
$entryById = @{}
$detailById = @{}
$detailPathById = @{}
$allowedStatuses = @('verified', 'supported', 'provisional', 'disputed', 'deprecated', 'superseded', 'archived')
$allowedConfidence = @('high', 'medium', 'low')
$requiredProperties = @(
    'memory_id', 'title', 'memory_type', 'scope', 'summary', 'status', 'confidence',
    'tags', 'trigger_terms', 'affected_modules', 'affected_paths', 'related_entities',
    'related_features', 'source_references', 'evidence', 'decision_or_fact', 'rationale',
    'consequences', 'risks', 'valid_from', 'last_verified_at', 'review_after',
    'created_at', 'updated_at', 'created_by_task', 'supersedes', 'superseded_by',
    'related_memories', 'detail_path'
)
$requiredNonBlank = @(
    'memory_id', 'title', 'memory_type', 'scope', 'summary', 'status', 'confidence',
    'decision_or_fact', 'rationale', 'valid_from', 'last_verified_at', 'review_after',
    'created_at', 'updated_at', 'created_by_task', 'detail_path'
)

foreach ($entry in $entries) {
    foreach ($field in $requiredProperties) {
        if (-not (Has-Property $entry $field)) {
            Add-Blocker "Entry is missing required field '$field': $($entry.memory_id)"
        }
    }

    if (-not (Has-Property $entry 'memory_id') -or (Is-Blank $entry.memory_id)) {
        Add-Blocker 'Entry has a blank memory_id.'
        continue
    }

    $id = [string]$entry.memory_id
    if ($entryById.ContainsKey($id)) {
        Add-Blocker "Duplicate memory ID in index: $id"
        continue
    }
    $entryById[$id] = $entry

    foreach ($field in $requiredNonBlank) {
        if ((Has-Property $entry $field) -and (Is-Blank $entry.$field)) {
            Add-Blocker "Entry $id has blank required field: $field"
        }
    }

    if ((Has-Property $entry 'status') -and $allowedStatuses -notcontains [string]$entry.status) {
        Add-Blocker "Entry $id has invalid status: $($entry.status)"
    }
    if ((Has-Property $entry 'confidence') -and $allowedConfidence -notcontains [string]$entry.confidence) {
        Add-Blocker "Entry $id has invalid confidence: $($entry.confidence)"
    }
    if ((Has-Property $entry 'trigger_terms') -and @($entry.trigger_terms).Count -eq 0) {
        Add-Blocker "Entry $id has no trigger terms."
    }
    if ((Has-Property $entry 'source_references') -and @($entry.source_references).Count -eq 0) {
        Add-Blocker "Entry $id has no source references."
    }
    if ((Has-Property $entry 'evidence') -and @($entry.evidence).Count -eq 0 -and [string]$entry.status -eq 'verified') {
        Add-Blocker "Verified entry $id has no evidence."
    }

    if (Has-Property $entry 'detail_path') {
        $detailRelative = [string]$entry.detail_path
        $detailAbsolute = Join-Path $repoRoot $detailRelative
        if (-not (Test-Path -LiteralPath $detailAbsolute -PathType Leaf)) {
            Add-Blocker "Entry $id points to missing detail file: $detailRelative"
        } else {
            $detailText = Get-Content -Raw -LiteralPath $detailAbsolute
            $detailById[$id] = $detailText
            $detailPathById[$id] = $detailRelative
            $match = [regex]::Match($detailText, '(?m)^memory_id:\s*["'']?([^\r\n"'']+)')
            if (-not $match.Success) {
                Add-Blocker "Detail file has no memory_id frontmatter: $detailRelative"
            } elseif ($match.Groups[1].Value.Trim() -ne $id) {
                Add-Blocker "Index/detail ID mismatch for $id at $detailRelative"
            }
        }
    }

    if (Has-Property $entry 'source_references') {
        foreach ($source in @($entry.source_references)) {
            if (Is-Blank $source) {
                Add-Blocker "Entry $id has a blank source reference."
                continue
            }
            $sourceValue = [string]$source
            if ($sourceValue -match '^https?://') {
                Add-Warning "Entry $id uses an external source that local lint cannot verify: $sourceValue"
                continue
            }
            $sourcePath = ($sourceValue -split '#', 2)[0]
            $sourceAbsolute = Join-Path $repoRoot $sourcePath
            if (-not (Test-Path -LiteralPath $sourceAbsolute)) {
                Add-Blocker "Entry $id has broken source path: $sourceValue"
            }
        }
    }

    if (Has-Property $entry 'review_after') {
        $reviewDate = [datetime]::MinValue
        if (-not [datetime]::TryParse([string]$entry.review_after, [ref]$reviewDate)) {
            Add-Blocker "Entry $id has invalid review_after date: $($entry.review_after)"
        } elseif ([string]$entry.status -eq 'verified' -and $reviewDate.Date -lt (Get-Date).Date) {
            Add-Warning "Verified entry $id is past review_after: $($entry.review_after)"
        }
    }
}

foreach ($entry in $entries) {
    if (-not (Has-Property $entry 'memory_id') -or (Is-Blank $entry.memory_id)) {
        continue
    }
    $id = [string]$entry.memory_id

    foreach ($oldId in @($entry.supersedes)) {
        if (Is-Blank $oldId) {
            continue
        }
        $oldKey = [string]$oldId
        if (-not $entryById.ContainsKey($oldKey)) {
            Add-Blocker "Entry $id supersedes unknown memory: $oldKey"
        } else {
            $old = $entryById[$oldKey]
            if (-not (Has-Property $old 'superseded_by') -or [string]$old.superseded_by -ne $id) {
                Add-Blocker "Supersession is not bidirectional: $id -> $oldKey"
            }
        }
    }

    if ((Has-Property $entry 'superseded_by') -and -not (Is-Blank $entry.superseded_by)) {
        $newId = [string]$entry.superseded_by
        if (-not $entryById.ContainsKey($newId)) {
            Add-Blocker "Entry $id has unknown superseded_by memory: $newId"
        } elseif (@($entryById[$newId].supersedes) -notcontains $id) {
            Add-Blocker "Supersession is not bidirectional: $id <- $newId"
        }
    }

    if ([string]$entry.memory_type -eq 'task_checkpoint' -and $detailById.ContainsKey($id)) {
        $nextStep = [regex]::Match($detailById[$id], '(?im)^\s*-?\s*next_exact_step:\s*(.+)$')
        if (-not $nextStep.Success -or $nextStep.Groups[1].Value -match '^\s*(todo|tbd|later|continue|continue coding|check more)\s*$') {
            Add-Blocker "Task checkpoint $id has no exact next step."
        }
    }

    if ([string]$entry.memory_type -eq 'incident' -and $detailById.ContainsKey($id)) {
        $rootCause = [regex]::Match($detailById[$id], '(?im)^root_cause_status:\s*(confirmed|suspected|unknown|not_applicable)\s*$')
        if (-not $rootCause.Success) {
            Add-Blocker "Incident $id has no valid root_cause_status."
        }
    }
}

$visitState = @{}
function Visit-Supersession([string]$Id, [System.Collections.Generic.List[string]]$Trail) {
    if ($visitState.ContainsKey($Id) -and $visitState[$Id] -eq 1) {
        Add-Blocker "Circular supersession detected: $([string]::Join(' -> ', @($Trail + $Id)))"
        return
    }
    if ($visitState.ContainsKey($Id) -and $visitState[$Id] -eq 2) {
        return
    }
    $visitState[$Id] = 1
    if ($entryById.ContainsKey($Id)) {
        foreach ($oldId in @($entryById[$Id].supersedes)) {
            if (-not (Is-Blank $oldId)) {
                $nextTrail = [System.Collections.Generic.List[string]]::new()
                $nextTrail.AddRange([string[]]$Trail)
                $nextTrail.Add($Id)
                Visit-Supersession ([string]$oldId) $nextTrail
            }
        }
    }
    $visitState[$Id] = 2
}

foreach ($id in $entryById.Keys) {
    Visit-Supersession $id ([System.Collections.Generic.List[string]]::new())
}

$seenDetailIds = @{}
foreach ($file in Get-ChildItem -LiteralPath $memoryRootPath -Recurse -File -Filter '*.md') {
    $text = Get-Content -Raw -LiteralPath $file.FullName
    $match = [regex]::Match($text, '(?m)^memory_id:\s*["'']?([^\r\n"'']+)')
    if (-not $match.Success) {
        continue
    }
    $id = $match.Groups[1].Value.Trim()
    $relative = $file.FullName.Substring($repoRoot.Length).TrimStart([char[]]"\/").Replace('\', '/')
    if ($seenDetailIds.ContainsKey($id)) {
        Add-Blocker "Duplicate memory ID in detail files: $id ($($seenDetailIds[$id]), $relative)"
    } else {
        $seenDetailIds[$id] = $relative
    }
    if (-not $entryById.ContainsKey($id)) {
        Add-Blocker "Detail memory is not indexed: $id at $relative"
    }
}

if (-not (Test-Path -LiteralPath $humanIndexPath -PathType Leaf)) {
    Add-Blocker 'Missing human INDEX.md.'
} else {
    $humanIndex = Get-Content -Raw -LiteralPath $humanIndexPath
    foreach ($entry in $entries) {
        if ($allowedStatuses[0..3] -contains [string]$entry.status) {
            if ($humanIndex -notmatch [regex]::Escape([string]$entry.memory_id)) {
                Add-Blocker "Active entry is missing from human INDEX.md: $($entry.memory_id)"
            }
        }
    }
}

$summaryGroups = $entries | Group-Object summary | Where-Object { $_.Count -gt 1 }
foreach ($group in $summaryGroups) {
    Add-Warning "Possible duplicate memory summary across $($group.Count) entries: $($group.Name)"
}

$secretPatterns = @(
    '-----BEGIN (RSA |OPENSSH |EC |DSA |PGP )?PRIVATE KEY-----',
    '\bAKIA[0-9A-Z]{16}\b',
    '\bgh[pousr]_[A-Za-z0-9]{30,}\b',
    '(?im)\b(api[_-]?key|access[_-]?token|refresh[_-]?token|password|secret)\b\s*[:=]\s*["'']?([A-Za-z0-9+/_=-]{16,})'
)
foreach ($file in Get-ChildItem -LiteralPath $memoryRootPath -Recurse -File) {
    $text = Get-Content -Raw -LiteralPath $file.FullName
    foreach ($pattern in $secretPatterns) {
        if ($text -match $pattern) {
            $relative = $file.FullName.Substring($repoRoot.Length).TrimStart([char[]]"\/").Replace('\', '/')
            Add-Blocker "Possible secret value in memory file: $relative"
            break
        }
    }
}

foreach ($message in $blockers | Sort-Object -Unique) {
    Write-Output "[BLOCKER] $message"
}
foreach ($message in $warnings | Sort-Object -Unique) {
    Write-Output "[WARN] $message"
}

Write-Output ("Memory lint: {0} blocker(s), {1} warning(s), {2} indexed entries." -f $blockers.Count, $warnings.Count, $entries.Count)

if ($blockers.Count -gt 0) {
    exit 1
}
exit 0
