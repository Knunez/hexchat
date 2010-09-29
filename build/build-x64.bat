@echo off
cd ..\src
echo X64 = YES > makeinc.mak
type makeinc.skel >> makeinc.mak
set INCLUDE=c:\WinDDK\7600.16385.1\inc\api;c:\WinDDK\7600.16385.1\inc\crt;c:\WinDDK\7600.16385.1\inc\api\crt\stl70
set LIB=c:\WinDDK\7600.16385.1\lib\wnet\amd64;c:\WinDDK\7600.16385.1\lib\Crt\amd64
set OPATH=%PATH%
set PATH=c:\WinDDK\7600.16385.1\bin\x86\amd64;c:\WinDDK\7600.16385.1\bin\x86;c:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\amd64;c:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\Bin\x64;c:\mozilla-build\build\xchat-dev64\bin
cd common
nmake /nologo /f makefile.mak clean
cd ..\fe-gtk
nmake /nologo /f makefile.mak clean
cd ..\fe-text
nmake /nologo /f makefile.mak clean
cd ..
nmake /nologo /f makefile.mak
cd ..\plugins
nmake /nologo /f makefile.mak clean
nmake /nologo /f makefile.mak
cd perl
set OOPATH=%PATH%
set PATH=%OOPATH%;c:\mozilla-build\perl-5.8-x64\bin
nmake /nologo /s /f makefile-58.mak clean
nmake /nologo /s /f makefile-58.mak
set PATH=%OOPATH%;c:\mozilla-build\perl-5.10-x64\bin
nmake /nologo /s /f makefile-510.mak clean
nmake /nologo /s /f makefile-510.mak
set PATH=%OOPATH%;c:\mozilla-build\perl-5.12-x64\bin
nmake /nologo /s /f makefile-512.mak clean
nmake /nologo /s /f makefile-512.mak
cd ..\..\build
set PATH=%OPATH%
call release-x64.bat
