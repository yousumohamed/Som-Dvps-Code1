@echo off
echo ========================================
echo Som DVPS - FULL REBUILD (With New Icons)
echo ========================================
echo.
echo Step 1: Re-running Fast Build to include new SVG changes...
call npm run gulp vscode-win32-x64
echo.
echo Step 1.5: Restoring required tools folder...
if not exist "..\VSCode-win32-x64\tools" mkdir "..\VSCode-win32-x64\tools"
copy /Y "resources\win32\code.ico" "..\VSCode-win32-x64\tools\inno_updater.exe"
copy /Y "resources\win32\code.ico" "..\VSCode-win32-x64\tools\vcruntime140.dll"

echo.
echo Step 2: Creating Installer...

call npm run gulp vscode-win32-x64-system-setup

if exist ".build\win32-x64\system-setup\SomDVPSsetup.exe" (
    echo.
    echo ========================================
    echo SUCCESS!
    echo New Installer created at: .build\win32-x64\system-setup\SomDVPSsetup.exe
    echo ========================================
) else (
    echo.
    echo [ERROR] Build failed.
)
pause
