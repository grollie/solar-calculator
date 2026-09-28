# publish.ps1 — commit index.html + catalog data from THIS directory and push to GitHub.
# GitHub Pages auto-redeploys in ~30 seconds.
#
# The working copy IS this directory (C:\Users\garyr\projects\solar-calculator).
# Edit index.html here directly — there is no OneDrive copy step anymore.
#
# Usage:
#   .\publish.ps1                                     # uses default commit message
#   .\publish.ps1 "Fix battery cost"                  # custom commit message
#   .\publish.ps1 Update panel specs and pricing      # multi-word, quotes optional

$ErrorActionPreference = 'Stop'

$repo = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $repo

if ($args.Count -gt 0) { $msg = $args -join ' ' } else { $msg = 'Update solar calculator' }

if (-not (Test-Path 'index.html')) {
  Write-Host "ERROR: index.html not found in $repo" -ForegroundColor Red
  exit 1
}

git add index.html | Out-Null
foreach ($f in 'panels_eg4.json', 'inverters_eg4.json', 'publish.ps1', 'README.md') {
  if (Test-Path $f) { git add $f | Out-Null }
}
if (Test-Path 'archive') { git add archive | Out-Null }

$changes = git status --porcelain
if (-not $changes) {
  Write-Host "No changes to publish (working tree is clean)." -ForegroundColor Yellow
  exit 0
}

Write-Host "Committing: $msg" -ForegroundColor Cyan
git commit -m $msg | Out-Null

Write-Host "Pushing to GitHub..." -ForegroundColor Cyan
git push | Out-Null

Write-Host ""
Write-Host "Published successfully." -ForegroundColor Green
Write-Host "Live URL: https://grollie.github.io/solar-calculator/" -ForegroundColor Green
Write-Host "(GitHub Pages takes ~30s to rebuild after a push.)" -ForegroundColor DarkGray
