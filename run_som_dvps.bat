@echo off
echo ========================================
echo Som DVPS - Quick Launch
echo ========================================
echo.

cd /d %~dp0

echo Launching Som DVPS...
npm run electron

pause
