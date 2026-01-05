@echo off
call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
cl /QSpectre test_spectre.cpp
if %errorlevel% neq 0 (
    echo Compilation FAILED
    exit /b %errorlevel%
) else (
    echo Compilation SUCCESS
)
