@echo off
:start
SET sourcepath="OregonCore"
SET msbuildpath="%CD%\Tools\VisualStudio\MSBuild\15.0\Bin\msbuild.exe"
SET repo=https://github.com/talamortis/OregonCore
SET mainfolder=%CD%
SET cmake=3.12.2
SET cmake_latest=3.12.2
SET mariadb_version=10.1.36
SET arch=Win32
SET GIT_EXECUTABLE=%mainfolder%\Tools\Git\bin
SET dynamic_linking=0

if not exist Build mkdir Build
if not exist Source mkdir Source

if exist "%mainfolder%\Tools\vs_ok.txt" goto menu
if not exist %msbuildpath% goto msbuild_not_found
goto menu

:msbuild_not_found
cls
echo MSBuild.exe not found here: 
echo %msbuildpath%
echo.
echo Do you want to install Visual Studio 2017 Community Edition or want to use your own Visual Studio?
echo.
echo 1 - Install Visual Studio 2017 Community Edition (recommend)
echo 2 - Use my pre-installed Visual Studio 2017
echo.
set /P menu=Enter a number: 
if "%menu%"=="1" (goto install_vs_community)
if "%menu%"=="2" (goto vs_use_own)

:vs_use_own
echo using own vs2017>Tools\vs_ok.txt
goto menu

:install_vs_community
cls
"%CD%\Tools\vs_community.exe" -p --installPath "%CD%\Tools\VisualStudio" --add Microsoft.VisualStudio.Component.VC.Tools.14.12 --add Microsoft.VisualStudio.Workload.NativeDesktop;includeRecommended
echo.
echo Restart the tool when the install is done.
ping -n 10 127.0.0.1>nul
exit

:menu
cls
echo   ____                              _____           _       _   
echo  / __ \                            / ____^|         (_)     ^| ^|  
echo ^| ^|  ^| ^|_ __ ___  __ _  ___  _ __ ^| (___   ___ _ __ _ _ __ ^| ^|_ 
echo ^| ^|  ^| ^| '__/ _ \/ _` ^|/ _ \^| '_ \ \___ \ / __^| '__^| ^| '_ \^| __^|
echo ^| ^|__^| ^| ^| ^|  __/ (_^| ^| (_) ^| ^| ^| ^|____) ^| (__^| ^|  ^| ^| ^|_) ^| ^|_ 
echo  \____/^|_^|  \___^|\__, ^|\___/^|_^| ^|_^|_____/ \___^|_^|  ^|_^| .__/ \__^|
echo                   __/ ^|                              ^| ^|        
echo                  ^|___/                               ^|_^|  
echo                           https://discord.gg/Nyc3fTy
echo #########################################################
echo.
echo ID.....[NAME]...........[BRANCH].....[DESCRIPTION]
echo.
echo 1 - OregonCore          (master)     active master branch
echo 2 - OregonCore          (Eluna)      w/ Eluna Support
echo 3 - OregonCore          (CFBG)       w/ Cross-Faction BattleGround
echo 4 - OregonCore          (ElunaCFBG)  w/ Eluna+CFBG
echo 5 - OregonCore          (master)     Original OregonCore
echo 6 - OregonCore          (Patch)      few fun patches
echo.
echo 8 - Build custom source
echo.
echo 9 - Install Visual Studio 2017 Community Edition
echo.
set /P menu=Enter a number: 
if "%menu%"=="1" (set id=1)
if "%menu%"=="2" (set id=2)
if "%menu%"=="3" (set id=3)
if "%menu%"=="4" (set id=4)
if "%menu%"=="5" (set id=5)
if "%menu%"=="6" (set id=6)
if "%menu%"=="7" (set id=7)
if "%menu%"=="8" (goto custom_build_menu)
if "%menu%"=="9" (goto install_vs_community)
if "%menu%"=="" (goto menu)
goto default_repos

:custom_build_menu
if not exist Custom mkdir Custom
if not exist Custom\1 mkdir Custom\1
if not exist Custom\2 mkdir Custom\2
if not exist Custom\3 mkdir Custom\3
if not exist Custom\4 mkdir Custom\4
if not exist Custom\5 mkdir Custom\5
if not exist Custom\6 mkdir Custom\6
if not exist Custom\7 mkdir Custom\7
if not exist Custom\8 mkdir Custom\8
if not exist Custom\9 mkdir Custom\9

set customname1=
set customname2=
set customname3=
set customname4=
set customname5=
set customname6=
set customname7=
set customname8=
set customname9=

set customrepo1=
set customrepo2=
set customrepo3=
set customrepo4=
set customrepo5=
set customrepo6=
set customrepo7=
set customrepo8=
set customrepo9=

set custombranch1=
set custombranch2=
set custombranch3=
set custombranch4=
set custombranch5=
set custombranch6=
set custombranch7=
set custombranch8=
set custombranch9=

if exist custom\1\name.txt set /p customname1=<custom\1\name.txt
if exist custom\2\name.txt set /p customname2=<custom\2\name.txt
if exist custom\3\name.txt set /p customname3=<custom\3\name.txt
if exist custom\4\name.txt set /p customname4=<custom\4\name.txt
if exist custom\5\name.txt set /p customname5=<custom\5\name.txt
if exist custom\6\name.txt set /p customname6=<custom\6\name.txt
if exist custom\7\name.txt set /p customname7=<custom\7\name.txt
if exist custom\8\name.txt set /p customname8=<custom\8\name.txt
if exist custom\9\name.txt set /p customname9=<custom\9\name.txt

if exist custom\1\repo.txt set /p customrepo1=<custom\1\repo.txt
if exist custom\2\repo.txt set /p customrepo2=<custom\2\repo.txt
if exist custom\3\repo.txt set /p customrepo3=<custom\3\repo.txt
if exist custom\4\repo.txt set /p customrepo4=<custom\4\repo.txt
if exist custom\5\repo.txt set /p customrepo5=<custom\5\repo.txt
if exist custom\6\repo.txt set /p customrepo6=<custom\6\repo.txt
if exist custom\7\repo.txt set /p customrepo7=<custom\7\repo.txt
if exist custom\8\repo.txt set /p customrepo8=<custom\8\repo.txt
if exist custom\9\repo.txt set /p customrepo9=<custom\9\repo.txt

if exist custom\1\branch.txt set /p custombranch1=<custom\1\branch.txt
if exist custom\2\branch.txt set /p custombranch2=<custom\2\branch.txt
if exist custom\3\branch.txt set /p custombranch3=<custom\3\branch.txt
if exist custom\4\branch.txt set /p custombranch4=<custom\4\branch.txt
if exist custom\5\branch.txt set /p custombranch5=<custom\5\branch.txt
if exist custom\6\branch.txt set /p custombranch6=<custom\6\branch.txt
if exist custom\7\branch.txt set /p custombranch7=<custom\7\branch.txt
if exist custom\8\branch.txt set /p custombranch8=<custom\8\branch.txt
if exist custom\9\branch.txt set /p custombranch9=<custom\9\branch.txt
cls
echo ##############################################################
echo # You can build your own customized Oregon source from here. #
echo # Choose a slot, add a name, enter the repo and build it.    #
echo ##############################################################
echo.
echo -----------------[NAME]:[REPO]:[BRANCH]-----------------------
echo.
echo Slot 1 - [%customname1% : %customrepo1% : %custombranch1%]
echo Slot 2 - [%customname2% : %customrepo2% : %custombranch2%]
echo Slot 3 - [%customname3% : %customrepo3% : %custombranch3%]
echo Slot 4 - [%customname4% : %customrepo4% : %custombranch4%]
echo Slot 5 - [%customname5% : %customrepo5% : %custombranch5%]
echo Slot 6 - [%customname6% : %customrepo6% : %custombranch6%]
echo Slot 7 - [%customname7% : %customrepo7% : %custombranch7%]
echo Slot 8 - [%customname8% : %customrepo8% : %custombranch8%]
echo Slot 9 - [%customname9% : %customrepo9% : %custombranch9%]
echo.
echo --------------------------------------------------------------
echo.
echo 1 - Add
echo 2 - Remove
echo 3 - Build
echo.
set /P slotmenu=Select your option: 
if "%slotmenu%"=="1" (goto custom_choose)
if "%slotmenu%"=="2" (goto custom_choose)
if "%slotmenu%"=="3" (goto custom_choose)

:custom_choose
set /P customslot=Select a slot: 
if "%customslot%"=="1" (set customslot=1)
if "%customslot%"=="2" (set customslot=2)
if "%customslot%"=="3" (set customslot=3)
if "%customslot%"=="4" (set customslot=4)
if "%customslot%"=="5" (set customslot=5)
if "%customslot%"=="6" (set customslot=6)
if "%customslot%"=="7" (set customslot=7)
if "%customslot%"=="8" (set customslot=8)
if "%customslot%"=="9" (set customslot=9)
if "%customslot%"=="" (goto custom_build_menu)

if "%slotmenu%"=="1" (goto add_slot_menu)
if "%slotmenu%"=="2" (goto remove_slot_menu)
if "%slotmenu%"=="3" (goto custom_build)

:add_slot_menu
cls
set /P slotname=Add a name for the selected slot: 
echo %slotname%>custom\%customslot%\name.txt
echo.
set /P repoaddress=Enter the source repo address: 
echo %repoaddress%>custom\%customslot%\repo.txt
echo.
set /P branchname=Enter the target branch name (leave empty to default): 
if "%branchname%"=="" (goto custom_build_menu)
echo %branchname%>custom\%customslot%\branch.txt
goto custom_build_menu

:remove_slot_menu
cls
set /p sourcepath=<custom\%customslot%\name.txt
rmdir /S /Q Build\%sourcepath%_Win32
rmdir /S /Q Build\%sourcepath%_Win64
rmdir /S /Q Source\%sourcepath%
del custom\%customslot%\name.txt
del custom\%customslot%\repo.txt
del custom\%customslot%\branch.txt
pause
goto custom_build_menu

:custom_build
cls
set /p sourcepath=<custom\%customslot%\name.txt
set /p repo=<custom\%customslot%\repo.txt
set /p branch=<custom\%customslot%\branch.txt
goto cmake_choose

:default_repos
if "%id%"=="1" (set sourcepath="OregonCoreMaster")
if "%id%"=="1" (set repo=https://github.com/talamortis/OregonCore.git)
if "%id%"=="1" (set branch=master)

if "%id%"=="2" (set sourcepath="OregonCoreEluna")
if "%id%"=="2" (set repo=https://github.com/talamortis/OregonCore.git)
if "%id%"=="2" (set branch=Eluna)

if "%id%"=="3" (set sourcepath="OregonCoreCFBG")
if "%id%"=="3" (set repo=https://github.com/talamortis/OregonCore.git)
if "%id%"=="3" (set branch=CFBG)

if "%id%"=="4" (set sourcepath="OregonCoreElunaCFBG")
if "%id%"=="4" (set repo=https://github.com/talamortis/OregonCore.git)
if "%id%"=="4" (set branch=ElunaCFBG)

if "%id%"=="5" (set sourcepath="OregonCoreOriginal")
if "%id%"=="5" (set repo=https://github.com/OregonCore/OregonCore.git)
if "%id%"=="5" (set branch=master)

if "%id%"=="6" (set sourcepath="OregonCorePatch")
if "%id%"=="6" (set repo=https://github.com/coolzoom/OregonCore.git)
if "%id%"=="6" (set branch=ElunaCFBGPatch)

if "%id%"=="7" (set sourcepath="")
if "%id%"=="7" (set repo=)
if "%id%"=="7" (set branch=)
rem goto cmake_choose

rem :cmake_choose

rem cls
rem echo.
rem echo 1 - Cmake 3.7.2
rem echo 2 - Cmake %cmake_latest%
rem echo.
rem set /P cmake_select=Select cmake version: 
rem if "%cmake_select%"=="1" (set cmake=3.7.2)
rem if "%cmake_select%"=="2" (set cmake=%cmake_latest%)
rem if "%cmake_select%"=="" (goto wrong_option)

rem :openssl_choose
set openssl=1.0.2
rem echo.
rem echo 1 - OpenSSL 1.0.2
rem echo 2 - OpenSSL 1.1.0
rem echo.
rem set /P openssl_select=Select cmake version: 
rem if "%openssl_select%"=="1" (set openssl=1.0.2)
rem if "%openssl_select%"=="2" (set openssl=1.1.0)
rem if "%openssl_select%"=="" (goto wrong_option)

rem :mysql_choose
set mariadb=MariaDB-%mariadb_version%
rem echo.
rem echo 1 - MariaDB %mariadb_version%
rem echo 2 - MySQL 8.0.12 (x64 only)
rem echo.
rem set /P mariadb_select=Select cmake version: 
rem if "%mariadb_select%"=="1" (set mariadb=MariaDB-%mariadb_version%)
rem if "%mariadb_select%"=="2" (set mariadb=MySQL-8.0.12)
rem if "%mariadb_select%"=="" (goto wrong_option)

rem if "%mariadb_select%"=="2" (goto arch_choose_x64_only)

:arch_choose
echo.
echo 1 - Win32
echo 2 - Win64
echo.
set /P arch_select=Select architecture type: 
if "%arch_select%"=="1" (goto arch_win32)
if "%arch_select%"=="2" (goto arch_win64)
if "%arch_select%"=="" (goto wrong_option)

:arch_choose_x64_only
echo.
echo 1 - Win32 (not usable with MySQL)
echo 2 - Win64
echo.
set /P arch_select=Select architecture type: 
if "%arch_select%"=="1" (goto wrong_option)
if "%arch_select%"=="2" (goto arch_win64)
if "%arch_select%"=="" (goto wrong_option)

:arch_win32
echo.
set /P cpu_cores=How many CPU core(s) you want to use for compile: 
set arch=
set archpath=Win32
goto git_clone

:arch_win64
echo.
set /P cpu_cores=How many CPU core(s) you want to use for compile: 
set arch= Win64
set archpath=Win64
goto git_clone

:wrong_option
echo.
echo You selected a wrong option.
echo Please try again.
echo.
pauese
goto menu

:git_clone
rem cls
if exist %mainfolder%\Source\%sourcepath%\README.md goto git_pull
echo Get the source from %repo% %branch%
echo.
if exist %mainfolder%\custom\%customslot%\branch.txt goto git_clone_branch
%mainfolder%\Tools\Git\bin\git.exe clone %repo% %mainfolder%/Source/%sourcepath%
goto git_clone_finish

:git_clone_branch
%mainfolder%\Tools\Git\bin\git.exe clone %repo% --single-branch -b %branch% %mainfolder%/Source/%sourcepath%
goto git_clone_finish

:git_clone_finish
echo.
echo.
goto git_pull

:git_pull
echo.
echo Pull the commits from %repo% %branch%
echo.
cd %mainfolder%\Source\%sourcepath%
if exist %mainfolder%\custom\%customslot%\branch.txt goto git_pull_branch
%mainfolder%\Tools\Git\bin\git.exe pull %repo%
goto git_pull_finish

:git_pull_branch
%mainfolder%\Tools\Git\bin\git.exe pull %repo% %branch%
goto git_pull_finish


:git_pull_finish
echo.
echo Updating submodules if available...
echo.
%mainfolder%\Tools\Git\bin\git.exe submodule update --init --recursive
%mainfolder%\Tools\Git\bin\git.exe submodule update --recursive --remote

cd %mainfolder%
goto build

:build
mkdir Build\%sourcepath%_%archpath%
cd Build\%sourcepath%_%archpath%
echo.
echo Checking core to create compatible cmake options...
echo.
echo.
echo Generate cmake...
echo.
"%mainfolder%\Tools\cmake\%cmake%\bin\cmake.exe" "%mainfolder%/Source/%sourcepath%" -G "Visual Studio 15 2017%arch%" -DOPENSSL_ROOT_DIR="%mainfolder%/Tools/openssl/%openssl%-%archpath%" -DOPENSSL_INCLUDE_DIR="%mainfolder%/Tools/openssl/%openssl%-%archpath%/include" -DMYSQL_LIBRARY="%mainfolder%/Tools/database/%mariadb%-%archpath%/lib/libmysql.lib" -DMYSQL_INCLUDE_DIR="%mainfolder%/Tools/database/%mariadb%-%archpath%/include/mysql" -DGIT_EXECUTABLE="%mainfolder%/Tools/Git/bin/git.exe" -DTOOLS=1 -DSCRIPT_LIB_ELUNA=0 -DELUNA=0 -DBUILD_EXTRACTORS=1 -DWITH_CPR=1 -DWITH_DYNAMIC_LINKING=%dynamic_linking% -DSCRIPTS=static
echo.
echo Start building...
echo.
rem if exist "%mainfolder%\Tools\vs_ok.txt" goto manual_vs_build
%msbuildpath% /p:CL_MPCount=%cpu_cores% ALL_BUILD.vcxproj /p:Configuration=Release
echo.
echo Copy required dll files into bin folder
if "%arch_select%"=="1" (copy "%mainfolder%\Tools\dll\bin\*.dll" bin\Release)
if "%arch_select%"=="2" (copy "%mainfolder%\Tools\dll\bin64\*.dll" bin\Release)
if exist "%mainfolder%\Tools\vs_ok.txt" goto manual_vs_build
echo.
pause

explorer bin\Release
exit

:manual_vs_build
cls
echo.
echo You have selected pre-installed Visual Studio 2017.
echo Visual Studio opening soon and please run the build process manually.
echo.
ping -n 10 127.0.0.1>nul
OregonCore.sln
exit


