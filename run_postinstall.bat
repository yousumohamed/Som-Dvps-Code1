@echo off
call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
$env:npm_config_msvs_args="/p:SpectreMitigation=false"
node build/npm/postinstall.ts > postinstall_debug.log 2>&1
