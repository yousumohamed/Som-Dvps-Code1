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
echo You can find your Som DVPS release in:
echo   Folder: .build\win32-x64\
echo   INSTALLER: .build\win32-x64\system-setup\VSCodeSetup.exe
echo.
echo To share with friends:
echo   1. Go to .build\win32-x64\
echo   2. Right-click the folder "Som DVPS-win32-x64" (or similar)
echo   3. Select "Compress to ZIP file"
echo   4. Send the ZIP file to your friends!
echo.
echo Inside the folder, they just run "Som DVPS.exe"
echo.
pause
