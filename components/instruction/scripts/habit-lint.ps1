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

function ConvertTo-Metadata([string]$Content, [string]$Label) {
    $match = [regex]::Match($Content, '(?ms)\A---\s*\r?\n(?<metadata>.*?)\r?\n---\s*\r?\n')
    if (-not $match.Success) {
        return @{ Errors = @("$Label has no leading YAML metadata block."); Values = @{}; Body = $Content }
    }

    $values = @{}
    $errors = [System.Collections.Generic.List[string]]::new()
    foreach ($line in ($match.Groups['metadata'].Value -split '\r?\n')) {
        if ([string]::IsNullOrWhiteSpace($line)) { continue }
        $field = [regex]::Match($line, '^(?<key>[a-z][a-z0-9_]*):\s*(?<value>.*)$')
        if (-not $field.Success) {
            [void]$errors.Add("$Label contains unsupported metadata line '$line'.")
            continue
        }
        $key = $field.Groups['key'].Value
        if ($values.ContainsKey($key)) {
            [void]$errors.Add("$Label repeats metadata field '$key'.")
        } else {
            $values[$key] = $field.Groups['value'].Value.Trim()
        }
    }
    return @{ Errors = @($errors); Values = $values; Body = $Content.Substring($match.Length) }
}

function ConvertTo-List([string]$Value) {
    if ($null -eq $Value) { return @() }
    $trimmed = $Value.Trim()
    if ($trimmed -notmatch '^\[.*\]$') { return @() }
    $inner = $trimmed.Substring(1, $trimmed.Length - 2).Trim()
    if ([string]::IsNullOrWhiteSpace($inner)) { return @() }
    return @($inner -split ',' | ForEach-Object { $_.Trim().Trim('"').Trim("'") } | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
}

function ConvertTo-Integer([hashtable]$Values, [string]$Field, [System.Collections.Generic.List[string]]$Errors, [string]$Label) {
    $parsed = 0
    if (-not $Values.ContainsKey($Field) -or -not [int]::TryParse([string]$Values[$Field], [ref]$parsed)) {
        [void]$Errors.Add("$Label field '$Field' must be an integer.")
        return $null
    }
    return $parsed
}

function Test-HabitContent([string]$Content, [string]$Label, [object]$Policy, [string]$ProfileMode, [bool]$EnforceProfile) {
    $errors = [System.Collections.Generic.List[string]]::new()
    $parsed = ConvertTo-Metadata $Content $Label
    foreach ($errorMessage in @($parsed.Errors)) { [void]$errors.Add($errorMessage) }
    $values = [hashtable]$parsed.Values

    $requiredFields = @(
        'habit_id','schema_version','status','source_kind','binding_scope','project_binding','intent',
        'applicable_paths','risk_ceiling','required_workflow','required_skills','approval_gates',
        'allowed_actions','forbidden_actions','source_task_ids','evidence_refs','observed_successes',
        'independent_verifications','max_steps','max_retries','timeout_seconds','owner',
        'last_verified_at','review_after','rollback'
    )
    foreach ($field in $requiredFields) {
        if (-not $values.ContainsKey($field) -or [string]::IsNullOrWhiteSpace([string]$values[$field])) {
            [void]$errors.Add("$Label is missing metadata field '$field'.")
        }
    }
    if ($errors.Count -gt 0) { return @{ Errors = @($errors); Values = $values } }

    if ($values.habit_id -notmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$') {
        [void]$errors.Add("$Label habit_id '$($values.habit_id)' is not kebab-case.")
    }
    if ($values.schema_version -ne '1.0.0') {
        [void]$errors.Add("$Label uses unsupported schema_version '$($values.schema_version)'.")
    }
    if ($values.status -notin @($Policy.allowed_statuses)) {
        [void]$errors.Add("$Label has unsupported status '$($values.status)'.")
    }
    if ($values.source_kind -notin @('compiled','fixture')) {
        [void]$errors.Add("$Label has unsupported source_kind '$($values.source_kind)'.")
    }
    if ($values.binding_scope -notin @('project','template','fixture')) {
        [void]$errors.Add("$Label has unsupported binding_scope '$($values.binding_scope)'.")
    }
    if ($values.risk_ceiling -notin @($Policy.allowed_risk_ceilings)) {
        [void]$errors.Add("$Label risk_ceiling '$($values.risk_ceiling)' exceeds policy.")
    }

    foreach ($field in @('applicable_paths','required_skills','approval_gates','allowed_actions','forbidden_actions','source_task_ids','evidence_refs')) {
        if (@(ConvertTo-List $values[$field]).Count -eq 0) {
            [void]$errors.Add("$Label field '$field' must be a non-empty inline list.")
        }
    }
    foreach ($gate in @(ConvertTo-List $values.approval_gates)) {
        if ($gate -ne 'none' -and $gate -notmatch '^AG-\d{2}$') {
            [void]$errors.Add("$Label approval gate '$gate' is invalid.")
        }
    $paths = @(ConvertTo-List $values.applicable_paths)
    if ('**' -in $paths -or '/' -in $paths -or '.' -in $paths) {
        [void]$errors.Add("$Label applicable_paths is repository-wide or unbounded.")
    }
    foreach ($skillId in @(ConvertTo-List $values.required_skills)) {
        if ($skillId -notin @($script:skillIds)) { [void]$errors.Add("$Label references unknown Standard Skill '$skillId'.") }
    }
    if ($values.required_workflow -notin @($script:workflowIds)) {
        [void]$errors.Add("$Label references unknown workflow '$($values.required_workflow)'.")
    }
    foreach ($gate in @(ConvertTo-List $values.approval_gates)) {
        if ($gate -ne 'none' -and $gate -notin @($script:approvalGateIds)) {
            [void]$errors.Add("$Label references undefined approval gate '$gate'.")
        }
    }
    foreach ($action in @(ConvertTo-List $values.allowed_actions)) {
        if ($action -match '(?i)(\*|anything|arbitrary|unbounded)') { [void]$errors.Add("$Label allowed action '$action' is unbounded.") }
    }
    }
    $requiredForbidden = @('approval-bypass','production-mutation-without-approval','secret-access','destructive-action-without-approval')
    $forbidden = @(ConvertTo-List $values.forbidden_actions)
    foreach ($action in $requiredForbidden) {
        if ($action -notin $forbidden) { [void]$errors.Add("$Label does not explicitly forbid '$action'.") }
    }

    $successes = ConvertTo-Integer $values 'observed_successes' $errors $Label
    $verifications = ConvertTo-Integer $values 'independent_verifications' $errors $Label
    $maxSteps = ConvertTo-Integer $values 'max_steps' $errors $Label
    $maxRetries = ConvertTo-Integer $values 'max_retries' $errors $Label
    $timeout = ConvertTo-Integer $values 'timeout_seconds' $errors $Label
    if ($null -ne $maxSteps -and ($maxSteps -lt 1 -or $maxSteps -gt 50)) { [void]$errors.Add("$Label max_steps must be between 1 and 50.") }
    if ($null -ne $maxRetries -and ($maxRetries -lt 0 -or $maxRetries -gt 3)) { [void]$errors.Add("$Label max_retries must be between 0 and 3.") }
    if ($null -ne $timeout -and ($timeout -lt 1 -or $timeout -gt 3600)) { [void]$errors.Add("$Label timeout_seconds must be between 1 and 3600.") }

    if ($values.status -eq 'verified') {
        if ($null -ne $successes -and $successes -lt [int]$Policy.minimum_promotion_successes) {
            [void]$errors.Add("$Label verified status lacks minimum successful outcomes.")
        }
        if ($null -ne $verifications -and $verifications -lt [int]$Policy.minimum_independent_verifications) {
            [void]$errors.Add("$Label verified status lacks independent verification.")
        if (@(ConvertTo-List $values.source_task_ids).Count -lt [int]$Policy.minimum_promotion_successes) {
            [void]$errors.Add("$Label verified status lacks sufficient task provenance.")
        }
        if (@(ConvertTo-List $values.evidence_refs).Count -lt [int]$Policy.minimum_promotion_successes) {
            [void]$errors.Add("$Label verified status lacks sufficient evidence references.")
        }
        }
        if ($EnforceProfile -and $ProfileMode -eq 'template' -and $values.binding_scope -eq 'project') {
            [void]$errors.Add("$Label cannot be verified for a project binding while the repository profile is template/uninstantiated.")
        }
    }

    $verifiedDate = [datetime]::MinValue
    $reviewDate = [datetime]::MinValue
    if (-not [datetime]::TryParseExact($values.last_verified_at, 'yyyy-MM-dd', [Globalization.CultureInfo]::InvariantCulture, [Globalization.DateTimeStyles]::None, [ref]$verifiedDate)) {
        [void]$errors.Add("$Label last_verified_at must use YYYY-MM-DD.")
    }
    if (-not [datetime]::TryParseExact($values.review_after, 'yyyy-MM-dd', [Globalization.CultureInfo]::InvariantCulture, [Globalization.DateTimeStyles]::None, [ref]$reviewDate)) {
        [void]$errors.Add("$Label review_after must use YYYY-MM-DD.")
    } elseif ($reviewDate -le $verifiedDate) {
        [void]$errors.Add("$Label review_after must be later than last_verified_at.")
    } elseif ($values.status -eq 'verified' -and $reviewDate.Date -lt [datetime]::Today) {
        [void]$errors.Add("$Label verified status is stale and must fail closed.")
    }

    $voplMatch = [regex]::Match($parsed.Body, '(?ms)```vopl\s*(?<vopl>.*?)\s*```')
    if (-not $voplMatch.Success) {
        [void]$errors.Add("$Label has no fenced VOPL body.")
        return @{ Errors = @($errors); Values = $values }
    }
    $vopl = $voplMatch.Groups['vopl'].Value
    foreach ($section in @('governance','activates when','requires','predicts','preserves','execute','on prediction_error','on failure','consolidate after')) {
        if ($vopl -notmatch "(?ms)\b$([regex]::Escape($section))\s*\{") {
            [void]$errors.Add("$Label VOPL is missing '$section'.")
        }
    }
    foreach ($token in @('profile.instantiated == true','registry.status == verified','workflow.selected == required_workflow','risk.current <= risk_ceiling','approvals.satisfied == true','scope.matches(applicable_paths)','return to selected workflow','apply declared rollback','success_count >= 3','independent_verifications >= 2')) {
        if ($vopl -notmatch [regex]::Escape($token)) {
            [void]$errors.Add("$Label VOPL is missing safety token '$token'.")
        }
    }

    $execute = [regex]::Match($vopl, '(?ms)\bexecute\s*\{(?<steps>.*?)\}')
    if ($execute.Success) {
        $stepLines = @($execute.Groups['steps'].Value -split '\r?\n' | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
        if ($stepLines.Count -eq 0) { [void]$errors.Add("$Label execute block has no steps.") }
        foreach ($line in $stepLines) {
            if ($line.Trim() -notmatch '^step\s+\d+:\s+invoke skill [a-z0-9-]+ action [a-z0-9-]+$') {
                [void]$errors.Add("$Label contains non-declarative execution step '$($line.Trim())'.")
            }
        }
        if ($null -ne $maxSteps -and $stepLines.Count -gt $maxSteps) {
            [void]$errors.Add("$Label declares more execution steps than max_steps.")
        }
    }
    if ($Content -match '(?i)\b(raw[- ]transcript|chain[- ]of[- ]thought|Invoke-Expression|powershell\s+-Command|bash\s+-c|curl\s+https?://|rm\s+-rf|git\s+reset\s+--hard)\b') {
        [void]$errors.Add("$Label contains prohibited raw evidence or executable command content.")
    }

    return @{ Errors = @($errors); Values = $values }
}

$registryPath = Join-Path $InstructionRoot 'procedural-memory/HABIT-REGISTRY.json'
$profilePath = Join-Path $InstructionRoot 'PROJECT-PROFILE.json'
if (-not (Test-Path -LiteralPath $registryPath -PathType Leaf)) { Add-Blocker 'Missing procedural-memory/HABIT-REGISTRY.json.'; exit 1 }
if (-not (Test-Path -LiteralPath $profilePath -PathType Leaf)) { Add-Blocker 'Missing PROJECT-PROFILE.json.'; exit 1 }

try { $registry = Get-Content -Raw -LiteralPath $registryPath | ConvertFrom-Json } catch { Add-Blocker "Habit registry is invalid JSON: $($_.Exception.Message)"; exit 1 }
try { $profile = Get-Content -Raw -LiteralPath $profilePath | ConvertFrom-Json } catch { Add-Blocker "Project profile is invalid JSON: $($_.Exception.Message)"; exit 1 }
$skillRegistry = Get-Content -Raw -LiteralPath (Join-Path $InstructionRoot 'SKILL-REGISTRY.json') | ConvertFrom-Json
$workflowRegistry = Get-Content -Raw -LiteralPath (Join-Path $InstructionRoot 'WORKFLOW-REGISTRY.json') | ConvertFrom-Json
$approvalContract = Get-Content -Raw -LiteralPath (Join-Path $InstructionRoot 'APPROVAL-GATES.md')
$script:skillIds = @($skillRegistry.skills | ForEach-Object { $_.id })
$script:workflowIds = @($workflowRegistry.workflows | ForEach-Object { $_.id })
$script:approvalGateIds = @([regex]::Matches($approvalContract, 'AG-\d{2}') | ForEach-Object { $_.Value } | Select-Object -Unique)


if ($registry.schema_version -ne '1.0.0') { Add-Blocker "Unsupported habit registry schema '$($registry.schema_version)'." }
if ($registry.habits_directory -ne 'procedural-memory/habits') { Add-Blocker 'Habit registry directory must remain procedural-memory/habits.' }
if ($registry.default_deny -ne $true) { Add-Blocker 'Habit registry must default deny.' }
if ([int]$registry.policy.minimum_promotion_successes -lt 3) { Add-Blocker 'Habit promotion requires at least three successes.' }
if ([int]$registry.policy.minimum_independent_verifications -lt 2) { Add-Blocker 'Habit promotion requires at least two independent verifications.' }
if ($registry.policy.critical_habit_selection_forbidden -ne $true) { Add-Blocker 'CRITICAL habit selection must be forbidden.' }
if (@($registry.policy.selectable_statuses).Count -ne 1 -or @($registry.policy.selectable_statuses)[0] -ne 'verified') { Add-Blocker 'Only verified habits may be selectable.' }

$registeredPaths = @{}
$registeredIds = @{}
$profileMode = [string]$profile.mode
foreach ($entry in @($registry.habits)) {
    foreach ($field in @('habit_id','path','status','project_binding','applicable_paths','risk_ceiling','owner','review_after')) {
        if (-not ($entry.PSObject.Properties.Name -contains $field) -or [string]::IsNullOrWhiteSpace([string]$entry.$field)) {
            Add-Blocker "Habit registry entry '$($entry.habit_id)' is missing '$field'."
        }
    }
    if ($registeredIds.ContainsKey($entry.habit_id)) { Add-Blocker "Duplicate habit ID '$($entry.habit_id)'." } else { $registeredIds[$entry.habit_id] = $true }
    if ($entry.path -notmatch '^procedural-memory/habits/[a-z0-9]+(?:-[a-z0-9]+)*\.vopl\.md$') {
        Add-Blocker "Habit '$($entry.habit_id)' path is outside the governed directory or has an invalid name: $($entry.path)"
        continue
    }
    if ($registeredPaths.ContainsKey($entry.path)) { Add-Blocker "Duplicate habit path '$($entry.path)'." } else { $registeredPaths[$entry.path] = $true }
    $habitPath = Join-Path $InstructionRoot $entry.path
    if (-not (Test-Path -LiteralPath $habitPath -PathType Leaf)) { Add-Blocker "Registered habit path does not exist: $($entry.path)"; continue }
    $result = Test-HabitContent (Get-Content -Raw -LiteralPath $habitPath) $entry.path $registry.policy $profileMode $true
    foreach ($errorMessage in @($result.Errors)) { Add-Blocker $errorMessage }
    if ($result.Values.habit_id -ne $entry.habit_id) { Add-Blocker "Registry ID '$($entry.habit_id)' differs from file ID '$($result.Values.habit_id)'." }
    if ($result.Values.status -ne $entry.status) { Add-Blocker "Registry status for '$($entry.habit_id)' differs from its file." }
}

$habitRoot = Join-Path $InstructionRoot $registry.habits_directory
$habitFiles = @()
if (Test-Path -LiteralPath $habitRoot -PathType Container) { $habitFiles = @(Get-ChildItem -LiteralPath $habitRoot -File -Filter '*.vopl.md') }
foreach ($file in $habitFiles) {
    $relative = $file.FullName.Substring($InstructionRoot.TrimEnd('\').Length + 1).Replace('\','/')
    if (-not $registeredPaths.ContainsKey($relative)) { Add-Blocker "Unregistered habit file '$relative'." }
}

$validRoot = Join-Path $InstructionRoot 'tests/vopl/valid'
$invalidRoot = Join-Path $InstructionRoot 'tests/vopl/invalid'
$validFiles = @(Get-ChildItem -LiteralPath $validRoot -File -Filter '*.vopl.md')
$invalidFiles = @(Get-ChildItem -LiteralPath $invalidRoot -File -Filter '*.vopl.md')
if ($validFiles.Count -eq 0 -or $invalidFiles.Count -eq 0) { Add-Blocker 'Habit lint requires valid and invalid fixtures.' }
foreach ($file in $validFiles) {
    $result = Test-HabitContent (Get-Content -Raw -LiteralPath $file.FullName) $file.Name $registry.policy $profileMode $false
    foreach ($errorMessage in @($result.Errors)) { Add-Blocker "Valid fixture rejected: $errorMessage" }
}
$invalidExpectations = @{
    'unsafe-route.vopl.md' = @(
        'risk_ceiling',
        'applicable_paths',
        'allowed action',
        'minimum successful outcomes',
        'independent verification',
        'sufficient task provenance',
        'sufficient evidence references',
        'template/uninstantiated',
        'max_steps',
        'max_retries',
        'timeout_seconds',
        'review_after',
        "missing 'governance'",
        'non-declarative execution step',
        'prohibited raw evidence or executable command content'
    )
}
foreach ($file in $invalidFiles) {
    $result = Test-HabitContent (Get-Content -Raw -LiteralPath $file.FullName) $file.Name $registry.policy $profileMode $true
    if (@($result.Errors).Count -eq 0) { Add-Blocker "Invalid fixture '$($file.Name)' was accepted." }
    if ($invalidExpectations.ContainsKey($file.Name)) {
        $joinedErrors = @($result.Errors) -join "`n"
        foreach ($expected in @($invalidExpectations[$file.Name])) {
            if ($joinedErrors -notmatch [regex]::Escape($expected)) {
                Add-Blocker "Invalid fixture '$($file.Name)' did not prove expected rejection '$expected'."
            }
        }
    }
}

Write-Host "Habit lint: $script:blockers blocker(s), $script:warnings warning(s), $(@($registry.habits).Count) registered habit(s), $($validFiles.Count) valid and $($invalidFiles.Count) invalid fixture(s)."
if ($script:blockers -gt 0) { exit 1 }
exit 0
