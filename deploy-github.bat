@echo off
setlocal enabledelayedexpansion

title GitHub Pages Deployment - Yash Patel Portfolio
echo ========================================================
echo   [GitHub Pages Deployment] - Yash Patel Portfolio
echo ========================================================
echo.

where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed or not in your PATH.
    echo Please install Git from https://git-scm.com/
    echo.
    set /p dummy="Press Enter to exit..."
    exit /b 1
)

cd /d "%~dp0"

if not exist ".git" (
    echo [*] Initializing Git repository...
    git init
    git branch -M main
)

git remote get-url origin >nul 2>nul
if %errorlevel% neq 0 (
    echo [*] Setting remote origin to: https://github.com/yashpatel59684/yashpatel59684.github.io.git
    git remote add origin https://github.com/yashpatel59684/yashpatel59684.github.io.git
)

echo.
echo [*] Staging all files...
git add -A

git commit -m "Deploy portfolio website" >nul 2>nul
if %errorlevel% equ 0 (
    echo [*] Committed latest changes.
) else (
    echo [*] Working directory clean.
)

echo.
echo [*] Checking remote repository on GitHub...
git ls-remote origin >nul 2>nul
if %errorlevel% neq 0 (
    echo.
    echo ========================================================
    echo   [ACTION REQUIRED] GitHub Repository does not exist!
    echo ========================================================
    echo   GitHub pe repository abhi bani nahi hai.
    echo.
    echo   Bas yeh 2 simple steps follow karo:
    echo   1. Browser me https://github.com/new open karo
    echo   2. Repository name me likho: yashpatel59684.github.io
    echo   3. Public select karo aur "Create repository" click karo
    echo ========================================================
    echo.
    set /p OPEN_BROWSER="Browser me https://github.com/new open kare? (Y/N): "
    if /i "!OPEN_BROWSER!"=="Y" (
        start https://github.com/new
    )
    echo.
    set /p dummy="GitHub pe repo create karke Enter press karo to push..."
)

echo.
echo [*] Pushing files to GitHub (main branch)...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================================
    echo   [SUCCESS] Deployment pushed to GitHub successfully!
    echo   Your website will be live in 1-2 minutes at:
    echo   https://yashpatel59684.github.io
    echo ========================================================
) else (
    echo.
    echo ========================================================
    echo   [NOTE] Push did not succeed.
    echo   Agar authentication prompt aaya ho, toh browser me
    echo   'Sign in with your browser' karke yashpatel59684
    echo   account se authorize kar do.
    echo ========================================================
)

echo.
set /p dummy="Press Enter to exit..."
