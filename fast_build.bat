@echo off
echo ========================================
echo Som DVPS - FAST Build
echo ========================================
echo.
echo This build skips "minification" (optimization).
echo It will create a larger file, but it runs MUCH faster.
echo Use this if the normal build gets stuck!
echo.
echo Step 1: Cleaning previous builds...
call npm run gulp clean

echo.
echo Step 2: Building Application (Fast Mode)...
echo This should take about 5-10 minutes...
call npm run gulp vscode-win32-x64

echo.
echo Step 3: Creating Installer...
call npm run gulp vscode-win32-x64-system-setup

echo.
echo ========================================
echo Build Complete!
echo ========================================
echo.
echo Checking results...

if exist "..\VSCode-win32-x64" (
    echo [SUCCESS] App folder: ..\VSCode-win32-x64
) else (
    echo [ERROR] App folder failed to build.
)

if exist ".build\win32-x64\system-setup\VSCodeSetup.exe" (
    echo [SUCCESS] Installer: .build\win32-x64\system-setup\VSCodeSetup.exe
) else (
    echo [WARNING] Installer not found (Do you have Inno Setup?)
)

echo.
pause
