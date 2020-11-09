@ECHO ON

SET JOM=C:\Qt\Tools\QtCreator\bin\jom.exe
SET QMAKE=C:\Qt_static\v5.12.7\bin\qmake.exe
SET WIN_SDK=10.0.17763.0

SET TOOLS_PATH=%~1
IF "%TOOLS_PATH%" == "" (
    ECHO "Local build, assuming C:\"
    SET TOOLS_PATH=C:
    ECHO Local build, cleanup applied
    SET CLEANUP=1
) ELSE (
    ECHO "TeamCity build, using %TOOLS_PATH%"
    ECHO TeamCity build, so no cleanup needed
    SET CLEANUP=0
)

IF %CLEANUP% NEQ 0 call clean.bat 1
call "%TOOLS_PATH%\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x86 %WIN_SDK%
call create_framework.bat
IF %CLEANUP% NEQ 0 call clean.bat 0
