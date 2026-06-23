$ErrorActionPreference = 'Stop'
$repoRoot = Resolve-Path (Join-Path $PSScriptRoot '..\..')
Set-Location $repoRoot

$status = git status --porcelain
if (-not $status) { exit 0 }

$env:GIT_AUTHOR_NAME = 'seoib85-design'
$env:GIT_AUTHOR_EMAIL = 'seoib85-design@users.noreply.github.com'
$env:GIT_COMMITTER_NAME = 'seoib85-design'
$env:GIT_COMMITTER_EMAIL = 'seoib85-design@users.noreply.github.com'

git add -A
$timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm'
git commit -m "Auto-update: $timestamp"
git push origin main
