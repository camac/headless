designer.exe -RPARAMS -vmargs -Dcom.ibm.designer.cmd.file="designercmd.txt"

@echo off
:LOOP
PSLIST notes2 >nul 2>&1
IF ERRORLEVEL 1 (
GOTO CONTINUE
) ELSE (
ECHO designer is still running
C:\sleep\SLEEP 5 /quiet
GOTO LOOP
)

:CONTINUE

echo "launch client to copy"