::Execute this script with amalg.lua installed to bundle all modules into a single .lua file
::make sure the bin folder exists
@echo off
setlocal enabledelayedexpansion

set params=
for /f "delims=" %%i in (src/modules.txt) do set params=!params! %%i
amalg.lua -s src/main.lua -o bin/bundle.lua !params!