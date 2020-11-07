@ECHO ON
SETLOCAL

SET JOM=vendors\jom\1.1.3\jom.exe
SET QMAKE=vendors\qt\v5.12.7\bin\qmake.exe
SET WIN_SDK=10.0.17763.0

REM Clean up files from previous build
IF EXIST build RMDIR /Q /S build
IF EXIST bin RMDIR /Q /S bin
IF EXIST .qmake.stash DEL .qmake.stash
IF EXIST src\libs\7zip\mocinclude.opt DEL src\libs\7zip\mocinclude.opt
IF EXIST src\libs\installer\mocinclude.opt DEL src\libs\installer\mocinclude.opt
IF EXIST src\sdk\installerbase.qrc DEL src\sdk\installerbase.qrc
IF EXIST src\sdk\mocinclude.opt DEL src\sdk\mocinclude.opt
IF EXIST src\sdk\translations\ifw_en.ts DEL src\sdk\translations\ifw_en.ts
IF EXIST tools\archivegen\mocinclude.opt DEL tools\archivegen\mocinclude.opt
IF EXIST tools\binarycreator\mocinclude.opt DEL tools\binarycreator\mocinclude.opt
IF EXIST tools\devtool\mocinclude.opt DEL tools\devtool\mocinclude.opt
IF EXIST tools\repocompare\mocinclude.opt DEL tools\repocompare\mocinclude.opt
IF EXIST tools\repogen\mocinclude.opt DEL tools\repogen\mocinclude.opt

MKDIR build

CALL C:\BuildTools\VC\Auxiliary\Build\vcvarsall.bat x86 %WIN_SDK%

REM Create the makefiles
CALL %QMAKE% -r

REM Build the makefiles
CALL %JOM% release

REM Copy the output to the build folder
COPY bin\binarycreator.exe build\binarycreator.exe
COPY bin\installerbase.exe build\installerbase.exe

REM Clean up
RMDIR /Q /S bin
IF EXIST .qmake.stash DEL .qmake.stash
IF EXIST src\libs\7zip\mocinclude.opt DEL src\libs\7zip\mocinclude.opt
IF EXIST src\libs\installer\mocinclude.opt DEL src\libs\installer\mocinclude.opt
IF EXIST src\sdk\installerbase.qrc DEL src\sdk\installerbase.qrc
IF EXIST src\sdk\mocinclude.opt DEL src\sdk\mocinclude.opt
IF EXIST src\sdk\translations\ifw_en.ts DEL src\sdk\translations\ifw_en.ts
IF EXIST tools\archivegen\mocinclude.opt DEL tools\archivegen\mocinclude.opt
IF EXIST tools\binarycreator\mocinclude.opt DEL tools\binarycreator\mocinclude.opt
IF EXIST tools\devtool\mocinclude.opt DEL tools\devtool\mocinclude.opt
IF EXIST tools\repocompare\mocinclude.opt DEL tools\repocompare\mocinclude.opt
IF EXIST tools\repogen\mocinclude.opt DEL tools\repogen\mocinclude.opt

ENDLOCAL