<#
.SYNOPSIS
  One-way mirror A:\AI Accessible\Outputs\ -> B:\AI Accessible\Outputs\

.DESCRIPTION
  Implements GOV-021 section 8.1. A:\ is the canonical location for Claude
  Projects status-update prompts (class A3). B:\ is a compatibility mirror
  for non-A:\ users during the A3 phased migration.

  Uses robocopy /MIR for exact-mirror semantics. Writes an ISO-8601 timestamp
  to last-sync.txt on success, or a FAILED line on error, per section 8.2.

  Safety guards:
    1. Aborts if A:\ is not accessible.
    2. Aborts if A:\ is empty but B:\ is not (migration-not-complete guard).
    3. Aborts if A:\ has FEWER files than B:\ (hints at un-migrated content).

  Register via Windows Task Scheduler:
    Trigger:  hourly
    Action:   powershell.exe -NoProfile -ExecutionPolicy Bypass -File <path-to-script>
    User:     account with access to both A:\ and B:\
    Options:  Run whether user is logged on or not; highest privileges if needed

.NOTES
  Governed by: GOV-021 Artifact Deployment Routing Standard
  Author:      BCG Corp governance
  First added: 2026-04-19 (GOV-021 v1.0 rollout)
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

    # Guard 1: source must be accessible.
    if (-not (Test-Path -LiteralPath $Source)) {
        Append-Stamp "FAILED at $((Get-Date).ToString('o')) -- source not accessible: $Source"
        exit 2
    }

    # Ensure destination parent exists (not the directory itself -- robocopy creates).
    $destParent = Split-Path -Path $Destination -Parent
    if ($destParent -and -not (Test-Path -LiteralPath $destParent)) {
        New-Item -ItemType Directory -Force -Path $destParent | Out-Null
    }

    # Guard 2 & 3: file-count sanity check to prevent wiping B:\.
    $srcCount = 0
    $dstCount = 0
    if (Test-Path -LiteralPath $Source) {
        $srcCount = (Get-ChildItem -LiteralPath $Source -Recurse -File -ErrorAction SilentlyContinue | Measure-Object).Count
    }
    if (Test-Path -LiteralPath $Destination) {
        $dstCount = (Get-ChildItem -LiteralPath $Destination -Recurse -File -ErrorAction SilentlyContinue | Measure-Object).Count
    }

    if ($srcCount -eq 0 -and $dstCount -gt 0) {
        Append-Stamp "FAILED at $((Get-Date).ToString('o')) -- A:\ empty, B:\ has $dstCount files; migration not complete. Aborting to protect B:\."
        exit 3
    }

    if ($srcCount -lt $dstCount) {
        Append-Stamp "FAILED at $((Get-Date).ToString('o')) -- A:\ has $srcCount files, B:\ has $dstCount. Refusing /MIR to protect B:\ content. Investigate."
        exit 4
    }

    # Run mirror.
    $robocopyArgs = @(
        $Source
        $Destination
        '/MIR'
        '/R:2'
        '/W:5'
        '/NP'
        "/LOG+:$log"
    )

    & robocopy.exe @robocopyArgs | Out-Null
    $rc = $LASTEXITCODE

    # robocopy exit codes 0-7 are success (0=no change, 1=files copied, etc.).
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
