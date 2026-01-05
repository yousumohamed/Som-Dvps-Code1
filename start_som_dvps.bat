@echo off
echo ========================================
echo Som DVPS - Quick Start
echo ========================================
echo.
echo Starting Som DVPS in development mode...
echo.
echo This will:
echo 1. Start the watch compiler (auto-recompile on changes)
echo 2. Launch Som DVPS editor
echo.
echo Press Ctrl+C in the watch window to stop compilation
echo.
pause

start "Som DVPS - Watch Compiler" cmd /k "cd /d %~dp0 && npm run watch"

echo.
echo Waiting for initial compilation...
echo (This may take 1-2 minutes on first run)
echo.
timeout /t 60 /nobreak

echo.
echo Launching Som DVPS...
echo.
call scripts\code.bat

echo.
echo Som DVPS has been launched!
echo Keep the watch compiler window open for auto-recompilation.
echo.
pause
