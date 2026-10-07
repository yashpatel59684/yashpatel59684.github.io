<#
.SYNOPSIS
    Automated GitHub Pages Deployment Script for Yash Patel Portfolio
#>

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "  [GitHub Pages Deployment] - Yash Patel Portfolio" -ForegroundColor Green
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

# Check for Git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "[ERROR] Git is not installed or not in your PATH." -ForegroundColor Red
    Write-Host "Please install Git from https://git-scm.com/" -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Press Enter to exit..."
    exit 1
}

Set-Location $PSScriptRoot

# Check Git Init
if (-not (Test-Path ".git")) {
    Write-Host "[*] Initializing local Git repository..." -ForegroundColor Yellow
    git init
    git branch -M main
}

# Check Git Remote
$remoteCheck = git remote get-url origin 2>$null
if (-not $remoteCheck) {
    git remote add origin https://github.com/yashpatel59684/yashpatel59684.github.io.git
    Write-Host "[*] Remote origin set to: https://github.com/yashpatel59684/yashpatel59684.github.io.git" -ForegroundColor Green
}

# Stage and Commit
Write-Host "[*] Staging files..." -ForegroundColor Gray
git add -A

try {
    git commit -m "Deploy portfolio website" 2>$null
    Write-Host "[*] Changes committed." -ForegroundColor Green
} catch {
    Write-Host "[*] Working tree clean." -ForegroundColor Gray
}

# Pre-check remote exists
Write-Host "[*] Checking if repository exists on GitHub..." -ForegroundColor Cyan
$repoCheck = git ls-remote origin 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "========================================================" -ForegroundColor Yellow
    Write-Host "  [ACTION REQUIRED] GitHub Repository does not exist!" -ForegroundColor Red
    Write-Host "========================================================" -ForegroundColor Yellow
    Write-Host "  Aapke GitHub account par repository create nahi hui hai." -ForegroundColor White
    Write-Host ""
    Write-Host "  Steps to fix:" -ForegroundColor Cyan
    Write-Host "  1. https://github.com/new open karo" -ForegroundColor White
    Write-Host "  2. Repository name: yashpatel59684.github.io" -ForegroundColor Green
    Write-Host "  3. Select 'Public' and click 'Create repository'" -ForegroundColor White
    Write-Host "========================================================" -ForegroundColor Yellow
    Write-Host ""

    $openBrowser = Read-Host "Browser me https://github.com/new open kare? (Y/N)"
    if ($openBrowser -eq 'Y' -or $openBrowser -eq 'y') {
        Start-Process "https://github.com/new"
    }

    Write-Host ""
    Read-Host "GitHub pe repo banane ke baad Enter press karo to push..."
}

# Push
Write-Host "[*] Pushing to GitHub (main branch)..." -ForegroundColor Cyan
try {
    git push -u origin main
    Write-Host ""
    Write-Host "========================================================" -ForegroundColor Green
    Write-Host "  [SUCCESS] Pushed to GitHub successfully!" -ForegroundColor Green
    Write-Host "  Your website will be live in 1-2 minutes at:" -ForegroundColor Cyan
    Write-Host "  https://yashpatel59684.github.io" -ForegroundColor Yellow
    Write-Host "========================================================" -ForegroundColor Green
} catch {
    Write-Host ""
    Write-Host "[!] Push failed. Ensure the repo is created and you are logged in as yashpatel59684." -ForegroundColor Yellow
}

Write-Host ""
Read-Host "Press Enter to exit..."
