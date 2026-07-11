@echo off
title Git Auto Update Tool
echo ====================================================
echo             Git Auto Update ^& Push Tool
echo ====================================================
echo.

:: Check if git is installed and in path
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed or not in your system PATH.
    echo Please install Git from https://git-scm.com/ and try again.
    pause
    exit /b
)

:: Show current git status
echo [INFO] Current Git Status:
echo ----------------------------------------------------
git status -s
echo ----------------------------------------------------
echo.

:: Prompt user for commit message
set /p msg="Enter commit message (press Enter for 'update'): "
if "%msg%"=="" set msg=update

:: Stage all changes
echo.
echo [INFO] Staging all files...
git add .

:: Commit changes
echo.
echo [INFO] Committing changes...
git commit -m "%msg%"

:: Push changes
echo.
echo [INFO] Pushing to remote repository...
git push origin main

if %errorlevel% neq 0 (
    echo.
    echo [WARNING] Push failed. If this is a new repository or has conflicting changes,
    echo you may need to resolve conflicts or run: git push -u origin main --force
) else (
    echo.
    echo [SUCCESS] Git repository updated successfully!
)

echo.
pause
