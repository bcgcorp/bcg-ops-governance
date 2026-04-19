<#
.SYNOPSIS
  One-way incremental sync A:\AI Accessible\Outputs\ -> B:\AI Accessible\Outputs\

.DESCRIPTION
  Implements GOV-021 section 8.1. A:\ is the canonical location for Claude
  Projects status-update prompts (class A3). B:\ is a compatibility copy
  for non-A:\ users during the A3 phased migration.

  Uses robocopy /E /XO for non-destructive incremental sync:
    - Copies new files (present on A:\, missing on B:\)
    - Overwrites B:\ files when the A:\ source is newer (/XO excludes
      older source files from copy)
    - Leaves B:\ files alone when they are newer than source, or when
      they exist only on B:\
    - Never deletes anything on B:\

  Behavioral consequence: B:\ is a strict superset of A:\ with
  "source-newer-wins" conflict resolution. Stale or duplicate content on
  B:\ is preserved. If divergence becomes material, a separate cleanup
  pass is required -- this script will never prune.

  On any failure, appends a FAILED line to last-sync.txt without
  advancing the success timestamp, per section 8.2.

  Register via Windows Task Scheduler:
    Trigger:  hourly
    Action:   powershell.exe -NoProfile -ExecutionPolicy Bypass -File <path-to-script>
    User:     account with access to both A:\ and B:\
    Options:  Run whether user is logged on or not; highest privileges if needed

.NOTES
  Governed by: GOV-021 Artifact Deployment Routing Standard
  Author:      BCG Corp governance
  First added: 2026-04-19 (GOV-021 v1.0 rollout, initial /MIR version)
  Revised:     2026-04-19 (switched to /E /XO per Gregory direction;
               destructive-action safety guards removed since no
               destructive operation remains).
#>

[CmdletBinding()]
param(
    [string] $Source      = 'A:\AI Accessible\Outputs',
    [string] $Destination = 'B:\AI Accessible\Outputs',
    [string] $SyncStateDir = 'C:\ProgramData\BCG\sync-a-to-b'
)

$ErrorActionPreference = 'Stop'

$log   = Join-Path $SyncStateDir 'robocopy.log'
$stamp = Join-Path $SyncStateDir 'last-sync.txt'
$utf8  = New-Object System.Text.UTF8Encoding($false)

function Write-Stamp([string]$line) {
    [System.IO.File]::WriteAllText($stamp, $line, $utf8)
}

function Append-Stamp([string]$line) {
    [System.IO.File]::AppendAllText($stamp, $line + [Environment]::NewLine, $utf8)
}

try {
    New-Item -ItemType Directory -Force -Path $SyncStateDir | Out-Null

    # Source must be accessible.
    if (-not (Test-Path -LiteralPath $Source)) {
        Append-Stamp "FAILED at $((Get-Date).ToString('o')) -- source not accessible: $Source"
        exit 2
    }

    # Ensure destination parent exists (robocopy creates the leaf itself).
    $destParent = Split-Path -Path $Destination -Parent
    if ($destParent -and -not (Test-Path -LiteralPath $destParent)) {
        New-Item -ItemType Directory -Force -Path $destParent | Out-Null
    }

    # /E   -- copy subdirectories including empty ones
    # /XO  -- exclude older source files (skip if destination is newer)
    # No /PURGE, no /MIR -- B:\ files not in A:\ are preserved.
    # /R:2 /W:5 -- two retries with 5 second waits on transient failures
    # /NP  -- no per-file progress percentage (cleaner log)
    # /LOG+ -- append to log rather than overwrite
    $robocopyArgs = @(
        $Source
        $Destination
        '/E'
        '/XO'
        '/R:2'
        '/W:5'
        '/NP'
        "/LOG+:$log"
    )

    & robocopy.exe @robocopyArgs | Out-Null
    $rc = $LASTEXITCODE

    # robocopy exit codes are a bitmask. 0-7 are success variants
    # (0=no change, 1=files copied, 2=extras detected, 4=mismatches, plus
    # combinations). 8+ indicates at least one file could not be copied.
    if ($rc -lt 8) {
        Write-Stamp ((Get-Date).ToString('o'))
        exit 0
    } else {
        Append-Stamp "FAILED at $((Get-Date).ToString('o')) -- robocopy exit $rc"
        exit $rc
    }
}
catch {
    Append-Stamp "FAILED at $((Get-Date).ToString('o')) -- exception: $($_.Exception.Message)"
    exit 1
}
