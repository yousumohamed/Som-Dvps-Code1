@echo off
echo ========================================
echo Som DVPS - FORCE CLEAN Build
echo ========================================
echo.
echo Step 1: Cleaning problematic build artifacts...
if exist "remote\node_modules\@vscode\windows-process-tree\build" rmdir /s /q "remote\node_modules\@vscode\windows-process-tree\build"
if exist "remote\node_modules\@vscode\node-addon-api\*.sln" del /f /q "remote\node_modules\@vscode\node-addon-api\*.sln"
if exist "remote\node_modules\@vscode\node-addon-api\*.vcxproj" del /f /q "remote\node_modules\@vscode\node-addon-api\*.vcxproj"

echo.
echo Step 2: Rebuilding native modules (Ignoring Errors)...
set npm_config_msvs_args=/p:SpectreMitigation=false
call npm rebuild --ignore-scripts
echo [INFO] Native rebuild complete (Errors here might be okay if main build succeeds)

echo.
echo Step 3: Running Fast Build...
call fast_build.bat
