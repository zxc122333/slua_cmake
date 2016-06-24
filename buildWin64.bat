@echo off

if "%VisualStudioVersion%"=="" call "%VS140COMNTOOLS%\vsvars32.bat"

:cleanup
echo clean...
if exist windows_64 (
  rd windows_64 /S /Q
  if %errorlevel% LEQ 1 (
    echo %errorlevel%
    echo cleanup faild, will try again 3s later
    ping 127.0.0.1 -n 3 > nul
    goto :cleanup
  )
)

mkdir windows_64
cd windows_64

echo build visual studio sln
cmake -G "Visual Studio 14 2015 Win64" ../src

echo build library

msbuild slua.sln /p:Configuration=Release /m
msbuild slua.sln /p:Configuration=Debug /m

echo build complete
cd ..

:exit
