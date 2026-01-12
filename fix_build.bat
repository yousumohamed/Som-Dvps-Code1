@echo off
echo ========================================
echo Som DVPS - Fix and Build
echo ========================================
echo.
echo Step 1: Repairing Dependencies (including fixing "gyp" errors)...
set npm_config_msvs_args=/p:SpectreMitigation=false
call npm rebuild
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Dependency repair failed.
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo Step 2: Running Fast Build...
call fast_build.bat
