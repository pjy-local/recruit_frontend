param(
    [string]$RepoUrl = "https://github.com/hmm5411/HMM-PJ.git"
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $root

if (-not (Test-Path ".git")) {
    git init -b main
}

$remote = git remote get-url origin 2>$null
if ($LASTEXITCODE -eq 0) {
    git remote set-url origin $RepoUrl
} else {
    git remote add origin $RepoUrl
}

$status = git status --short
if ($status) {
    git add .
    git commit -m "Initial commit: HMM 채용사이트 (Vue + Spring Boot + PostgreSQL)"
}

Write-Host "origin -> $RepoUrl"
Write-Host "다음: git push -u origin main"
