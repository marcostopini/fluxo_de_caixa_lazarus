@echo off
SET THEFILE=C:\projetos\LAZARUS\fluxo_caixa\fluxocaixa.exe
echo Linking %THEFILE%
C:\lazarus\fpc\3.2.2\bin\x86_64-win64\ld.exe -b pei-x86-64  --gc-sections  -s --subsystem windows --entry=_WinMainCRTStartup    -o C:\projetos\LAZARUS\fluxo_caixa\fluxocaixa.exe C:\projetos\LAZARUS\fluxo_caixa\link6632.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
