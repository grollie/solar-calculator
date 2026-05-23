# publish.ps1 — copy the latest calculator from the Desktop working copy to the repo,
# commit, and push to GitHub. GitHub Pages auto-redeploys in ~30 seconds.
#
# Usage:
#   .\publish.ps1                                     # uses default commit message
#   .\publish.ps1 "Fix battery cost"                  # custom commit message
#   .\publish.ps1 Update panel specs and pricing      # message can be multiple words

$ErrorActionPreference = 'Stop'

$src = 'C:\Users\garyr\OneDrive\Desktop\Claude\solar_calculator.html'
$dst = 'C:\Users\garyr\projects\solar-calculator\index.html'
$repo = 'C:\Users\garyr\projects\solar-calculator'

if ($args.Count -gt 0) { $msg = $args -join ' ' } else { $msg = 'Update solar calculator' }

if (-not (Test-Path $src)) {
  Write-Host "ERROR: source file not found at $src" -ForegroundColor Red
  exit 1
}

Write-Host "Copying $src -> $dst" -ForegroundColor Cyan
Copy-Item $src $dst -Force

Set-Location $repo

git add index.html | Out-Null
$changes = git status --porcelain
if (-not $changes) {
  Write-Host "No changes to publish (file is already in sync)." -ForegroundColor Yellow
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
