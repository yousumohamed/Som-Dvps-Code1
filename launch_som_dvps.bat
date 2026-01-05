@echo off
echo ========================================
echo Som DVPS - Launcher
echo ========================================
echo.

cd /d "%~dp0"

echo Current directory: %CD%
echo.

echo Checking if compilation exists...
if not exist "out\main.js" (
    echo ERROR: Compiled files not found!
    echo Please run: npm run compile
    echo.
    pause
    exit /b 1
)

echo Compiled files found!
echo.

echo Launching Som DVPS...
echo.

".build\electron\Code - OSS.exe" .

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ERROR: Som DVPS failed to launch!
    echo Error code: %ERRORLEVEL%
    echo.
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo Som DVPS launched successfully!
echo You can close this window.
echo.
timeout /t 3
