@echo off
echo ========================================
echo Som DVPS - Build Release
echo ========================================
echo.
echo This will build the optimized release version of Som DVPS.
echo This process takes 15-20 minutes. Please be patient!
echo.
echo Step 1: Cleaning previous builds...
call npm run gulp clean

echo.
echo Step 2: Building Release (Minified)...
echo This is the longest step...
call npm run gulp vscode-win32-x64-min

echo.
echo Step 3: Creating Installer (Setup.exe)...
call npm run gulp vscode-win32-x64-system-setup

echo.
echo ========================================
echo Build Complete!
echo ========================================
echo.
echo Checking for build output...

if exist "..\VSCode-win32-x64" (
    echo [SUCCESS] Build folder found at: ..\VSCode-win32-x64
) else (
    echo [ERROR] Build folder NOT found at: ..\VSCode-win32-x64
    echo The build step verify failed.
)

if exist ".build\win32-x64\system-setup\VSCodeSetup.exe" (
    echo [SUCCESS] Installer found at: .build\win32-x64\system-setup\VSCodeSetup.exe
) else (
    echo [WARNING] Installer NOT found. This might be normal if you don't have Inno Setup installed.
)

echo.
echo To share with friends:
echo   1. Go to the folder: ..\VSCode-win32-x64 (It is OUTSIDE the vscode folder)
echo   2. Right-click the folder "VSCode-win32-x64"
echo   3. Select "Compress to ZIP file"
echo   4. Send the ZIP file!
echo.
echo Inside the folder, run "Som DVPS.exe" (or Code.exe)
echo.
pause
