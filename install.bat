@echo off
rem ==============================================================================
rem Universal AI Project Brain Framework (AIPBF) Onboarding (Windows Batch)
rem ==============================================================================

setlocal enabledelayedexpansion

set SCRIPT_DIR=%~dp0
set TARGET_REPO=""

if "%1"=="--target" (
    set TARGET_REPO=%2
)
if "%1"=="--help" (
    echo Usage: install.bat [options]
    echo Options:
    echo   --target ^<path^>    Integrate AIPBF into another repository located at ^<path^>
    echo   --help             Show this help menu
    exit /b 0
)

where python >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo Error: Python is required but could not be located in PATH!
    exit /b 1
)

if not !TARGET_REPO!=="" (
    echo ====== AIPBF Integration Bootstrapping (Windows) ======
    echo Target Repo: !TARGET_REPO!
    echo ======================================================

    if not exist "!TARGET_REPO!" (
        echo Error: Target directory "!TARGET_REPO!" does not exist!
        exit /b 1
    )

    set DEST_DIR=!TARGET_REPO!\tools\project_brain
    echo [Install] Creating !DEST_DIR! directory...
    if not exist "!DEST_DIR!" mkdir "!DEST_DIR!"

    echo [Install] Copying core engine...
    copy "%SCRIPT_DIR%analyzer.py" "!DEST_DIR!\" >nul
    copy "%SCRIPT_DIR%reviewer.py" "!DEST_DIR!\" >nul
    copy "%SCRIPT_DIR%generator.py" "!DEST_DIR!\" >nul
    copy "%SCRIPT_DIR%project_brain.py" "!DEST_DIR!\" >nul
    if exist "%SCRIPT_DIR%Dockerfile" copy "%SCRIPT_DIR%Dockerfile" "!DEST_DIR!\" >nul

    echo [Install] Running initial repository scan...
    python "!DEST_DIR!\project_brain.py" --init --scan --path "!TARGET_REPO!"

    if exist "!TARGET_REPO!\.git" (
        echo [Install] Injecting automated Git pre-commit hook...
        (
        echo #!/usr/bin/env bash
        echo python tools/project_brain/project_brain.py --scan
        echo git add AI_BRAIN/PROJECT_BRAIN.md CODE_UNDERSTANDING.md AI_CONTEXT_PACKAGE.md
        ) > "!TARGET_REPO!\.git\hooks\pre-commit"
        echo [Install] Pre-commit hook successfully established!
    )
) else (
    echo ====== AIPBF Local Setup (Windows) ======
    echo Directory: %SCRIPT_DIR%
    echo =========================================

    echo [Install] Running initial repository scan...
    python "%SCRIPT_DIR%project_brain.py" --init --scan --path "%SCRIPT_DIR%."

    if exist "%SCRIPT_DIR%.git" (
        echo [Install] Injecting automated Git pre-commit hook...
        (
        echo #!/usr/bin/env bash
        echo python project_brain.py --scan
        echo git add AI_BRAIN/PROJECT_BRAIN.md CODE_UNDERSTANDING.md AI_CONTEXT_PACKAGE.md
        ) > "%SCRIPT_DIR%.git\hooks\pre-commit"
        echo [Install] Pre-commit hook successfully established!
    )
)

echo ====== AIPBF Integration Complete! ======
exit /b 0
