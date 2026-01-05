@echo off
setlocal

title Som DVPS Launcher

:: Get the absolute path to the VS Code folder (where this script is)
set "ROOT_DIR=%~dp0"

:: Configuration
set NODE_ENV=development
set VSCODE_DEV=1
set VSCODE_CLI=1
set ELECTRON_ENABLE_LOGGING=1

:: Launch Som DVPS
:: Argument 1: The App Path (ROOT_DIR) - tells Electron where the code is
:: Argument 2+: Files/Folders you want to open (%*)
"%ROOT_DIR%.build\electron\Code - OSS.exe" "%ROOT_DIR%." %*

endlocal
