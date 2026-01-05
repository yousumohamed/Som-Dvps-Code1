@echo off
echo ========================================
echo Som DVPS - Installation Script
echo ========================================
echo.

REM Set environment variable to disable Spectre mitigation
set npm_config_msvs_args=/p:SpectreMitigation=false

echo Installing dependencies with Spectre mitigation disabled...
echo.

npm install

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo SUCCESS! Installation completed.
    echo ========================================
    echo.
    echo Next steps:
    echo 1. Run: npm run watch
    echo 2. In a new terminal, run: .\scripts\code.bat
    echo.
) else (
    echo.
    echo ========================================
    echo Installation failed. Check errors above.
    echo ========================================
)

pause
