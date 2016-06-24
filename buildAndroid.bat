@echo off

mkdir tmp
cd tmp

if "%ANDROID_NDK%"=="" set ANDROID_NDK=E:\android-ndk-r10b

goto :a
cmake -G"MinGW Makefiles" ^
      -DCMAKE_TOOLCHAIN_FILE=.\android.toolchain.cmake ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DANDROID_ABI=armeabi-v7a ^
      -DCMAKE_MAKE_PROGRAM="%ANDROID_NDK%\prebuilt\windows-x86_64\bin\make.exe" ..\src
cmake --build . --target slua
mkdir ..\android_armeabi-v7a
copy lib/libslua.so ..\android_armeabi-v7a\libslua.so /Y /D
:a
cmake -G"MinGW Makefiles" ^
      -DCMAKE_TOOLCHAIN_FILE=.\android.toolchain.cmake ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DANDROID_ABI=x86 ^
      -DANDROID_NATIVE_API_LEVEL=21 ^
      -D "ANDROID_TOOLCHAIN_NAME=x86-4.6" ^
      -DCMAKE_MAKE_PROGRAM="%ANDROID_NDK%\prebuilt\windows-x86_64\bin\make.exe" ..\src
cmake --build . --target slua
mkdir ..\android_x86
copy lib/libslua.so ..\android_x86\libslua.so /Y /D

cd ..
rem del tmp /F /Q

:exit
