::the startup system, which loads the files and sets the color.
@echo off
color f
prompt CM.DOS$G
if not exist .\systemfiles\CMD.ID goto oof
set loadnum=0
set load=::
cd .\SystemFiles
if exist color.txt (
title CM.DOS 1.1 Expansion
goto customcolor
)
title CM.DOS 1.1 Expansion
goto loading

::custom color setting system
:customcolor
set /p customcolor=<color.txt
color %customcolor%


::the loading bar system, the first thing a user sees when CM.DOS is started up
:Loading
set load=%load%::
echo             /  /\/\ ^|\
echo             \ /    \^|/
echo               CM.DOS
echo             loading...
echo -----------------------------------------
echo %load%
echo -----------------------------------------
ping localhost -n 1 >nul
cls
set /a loadnum=%loadnum% +1
if %loadnum%==20 goto LoginScreen
goto Loading

::the section that looks for the nologin file to skip the login, and if a user1.txt doesn't exist it goes through the initial setup
:LoginScreen
if exist nologin.dev goto bgset
if exist user1.txt goto login
pushd ..
attrib +s +h +r .\SystemFiles
cls
echo ======================
echo Welcome to CM.DOS!
echo Let's get you set up.
echo ======================
echo.
pause
taskkill /f -im explorer.exe>nul
start explorer.exe>nul
md .\"User 1 personal folder
attrib +s +h +r .\"User 1 personal folder"
popd
nul>USER1FOLDERCLOSED

:userset
cls
echo =======================================
echo What is the username you want to have?
echo =======================================
echo.
set /p user1name=
if "%user1name%"=="" goto userset
cls
echo ==============================================================
echo Are you sure you want your username to be "%user1name%"? (Y/N)
::nice
echo ==============================================================
choice>nul
if %errorlevel%==2 goto userset
echo %user1name%> user1.txt

:passset
cls
echo =======================================
echo What is the password you want to have?
echo =======================================
echo.
set /p user1pass=
cls
echo ==============================================================
echo Are you sure you want your password to be "%user1pass%"? (Y/N)
echo ==============================================================
choice>nul
if %errorlevel%==2 goto passset
echo %user1pass%>> user1.txt
cls
echo =====================================
echo User has been created. enjoy CM.DOS.
echo =====================================
goto bgset

::the actual login screen
:login
set /p user1name=<user1.txt
if exist user2.txt set /p user2name=<user2.txt
cls
echo =====================================
echo Welcome back to CM.DOS!
echo What user do you want to log in as?
echo 1) %user1name%
echo 2) Guest session
if exist user2.txt echo 3) %user2name%
echo =====================================
if exist user2.txt (choice /c 123>nul) else (choice /c 12>nul)
if "%errorlevel%"=="1" goto :user1login
if "%errorlevel%"=="2" goto :guestsession
if "%errorlevel%"=="3" goto :user2login

:: User 1 login prompt
:user1login
cls
echo =====================================
echo  Enter the password for %user1name%.
echo =====================================
set /p user1input=
if %user1input%=="" goto user1login
set user1input=%user1input:"=%
(
    set /p =
    set /p user1pass=
) <user1.txt
if "%user1input%"=="%user1pass%" goto 1login
goto user1login

:: User 2 login prompt
:user2login
cls
echo =====================================
echo  Enter the password for %user2name%.
echo =====================================
set /p user2input=
if %user2input%=="" goto user2login
set user2input=%user2input:"=%
(
    set /p =
    set /p user2pass=
) <user2.txt
if "%user2input%"=="%user2pass%" goto 2login
goto user2login

::system that makes CM.DOS know you're logged in as user 1 or 2
:1login
if exist .\TEMPUSER1 del .\TEMPUSER1
if exist .\TEMPUSER2 del .\TEMPUSER2
if exist .\TEMPGUEST del .\TEMPGUEST
nul> TEMPUSER1
goto bgset1

:2login
if exist .\TEMPUSER1 del .\TEMPUSER1
if exist .\TEMPUSER2 del .\TEMPUSER2
if exist .\TEMPGUEST del .\TEMPGUEST
nul> TEMPUSER2
goto bgset2

:bgset
if exist .\tempuser2 goto bgset2
if exist .\TEMPGUEST goto guestmenu
::background setting system
:bgset1
cls	
if exist 1bg1 goto bg1
if not exist 1bg1 goto 1bat2

:1bat2
if exist 1bg2 goto bg2
if not exist 1bg2 goto 1bat3

:1bat3
if exist 1bg3 goto bg3
if not exist 1bg3 goto 1bat4

:1bat4
if exist 1bg4 goto bg4
if not exist 1bg4 goto 1bat5

:1bat5
if exist 1BG5 goto bg5
if not exist 1BG5 goto 1BAT6

:1BAT6
if exist 1NOBG goto bg6
if not exist 1NOBG goto 1choosebg

::this will make you choose the background if said files don't exist
:1choosebg
echo Choose one of these backgrounds by typing in the correspondent number.
echo 1: Happy face 
echo 2: Windows logo
echo 3: A knife
echo 4: A kite
echo 5: A coffee mug
echo 6: No background
choice /c 123456>nul
if %errorlevel%==1 goto 1ch1
if %errorlevel%==2 goto 1ch2
if %errorlevel%==3 goto 1ch3
if %errorlevel%==4 goto 1ch4
if %errorlevel%==5 goto 1ch5
if %errorlevel%==6 goto 1ch6

:1ch1
NUL>1bg1
goto bg1

:1ch2
NUL>1bg2
goto bg2

:1ch3
NUL>1bg3
goto bg3

:1ch4
NUL>1bg4
goto bg4

:1ch5
NUL>1bg5
goto bg5

:1ch6
NUL>1NOBG
cls
goto menu

:bgset2
cls	
if exist 2bg1 goto bg1
if not exist 2bg1 goto 2bat2

:2bat2
if exist 2bg2 goto bg2
if not exist 2bg2 goto 2bat3

:2bat3
if exist 2bg3 goto bg3
if not exist 2bg3 goto 2bat4

:2bat4
if exist 2bg4 goto bg4
if not exist 2bg4 goto 2bat5

:2bat6
if exist 2NOBG goto bg6
if not exist 2NOBG goto 2choosebg

::this will make you choose the background if said files don't exist
:2choosebg
echo Choose one of these backgrounds by typing in the correspondent number.
echo 1: Happy face 
echo 2: Windows logo
echo 3: A knife
echo 4: A kite
echo 5: A coffee mug
echo 6: No background
choice /c 123456>nul
if %errorlevel%==1 goto 1ch1
if %errorlevel%==2 goto 1ch2
if %errorlevel%==3 goto 1ch3
if %errorlevel%==4 goto 1ch4
if %errorlevel%==5 goto 1ch5
if %errorlevel%==6 goto 1ch6

:2ch1
NUL>2bg1
goto bg1

:2ch2
NUL>2bg2
goto bg2

:2ch3
NUL>2bg3
goto bg3

:2ch4
NUL>2bg4
goto bg4

:2ch5
NUL>2bg5
goto bg5

:2ch6
NUL>2NOBG
cls
goto menu

::the backgrounds themselves
:bg1
cls
echo          / \      / \
echo           .       .
echo.
echo              .
echo      _________________
echo      \   BE HAPPY    /
echo       \_____________/
goto menu 

:bg2
cls
echo      _______________
echo     ^|       ^|       ^|
echo     ^|       ^|       ^|
echo     ^|       ^|       ^|
echo     ^|_______^|_______^|
echo     ^|       ^|       ^|
echo     ^|       ^|       ^|
echo     ^|       ^|       ^|
echo     ^|_______^|_______^|
echo          WINDOOOS
goto menu

:bg3
cls
echo     _______
echo     \      \
echo      \      \
echo       \      \
echo        \      \
echo         \      \
echo          \      \ 
echo           \      \
echo            \      \
echo             \      \
echo              \     / 
echo               \   /  
echo                ( )
echo                 ( )
echo                  ( )
echo                   ( )
echo                    ( )
goto menu

:bg4
cls
echo         /\
echo        /  \    
echo       /    \
echo       \    /
echo        \  /
echo         \/
echo         /
echo         \
echo         /
echo         \
echo         /
echo         \
echo         /
echo         \
goto menu

:bg5
cls
echo                \    \   \
echo                /    /   /
echo                \    \   \
echo         _______________________
echo        ^|                       ^|
echo       _^|                       ^|
echo      / ^|                       ^|
echo     /  ^|                       ^|
echo     ^|  ^|       ^|      ^|        ^|
echo     ^|  ^|          ^|            ^|
echo     ^|  ^|      \________/       ^|
echo     ^|  ^|                       ^|
echo     ^|  ^|                       ^|
echo     \  ^|                       ^|
echo      \_^|                       ^|
echo        ^|                       ^|
echo        ^|_______________________^|
goto menu

:bg6
cls

::The home menu for users.
:menu
echo =============================
echo List of available tasks
echo 1) Open an outside program
echo 2) start an embedded app 
echo 3) Make a new file/folder 
echo 4) Lock/unlock your personal folder
echo 5) Open settings
echo 6) Shut down your computer
echo 7) Launch an add-on
echo 8) Info on CM.DOS (readme.txt)
if "%consolevariable%"=="yes" echo 9) start the console
echo x) Exit
echo =============================
if not "%consolevariable%"=="yes" choice /c 12345678xlf>nul
if "%consolevariable%"=="yes" choice /c 12345678x9f>nul
if %errorlevel%==1 goto openprg
if %errorlevel%==2 goto appmenu
if %errorlevel%==3 goto newfolderfile
if %errorlevel%==4 goto LockPFolder
if %errorlevel%==5 goto settings
if %errorlevel%==6 goto shutdown
if %errorlevel%==7 goto AddonLauncher
if %errorlevel%==8 goto start_readme
if %errorlevel%==9 exit
if %errorlevel%==10 goto console
if %errorlevel%==11 goto respect

:start_readme
if not exist .\readme.txt goto oof5
start readme.txt & goto bgset

:respect
cls
color 1f
echo you have payed your respects :(
pause>nul
exit

:shutdown
for /f "tokens=4" %%A in ('ver') do set "windows_version=%%A"
set windows_version=%windows_version:~0,3%
if "%windows_version%"=="10." start slidetoshutdown.exe & goto bgset
if "%windows_version%"=="6.3" start slidetoshutdown.exe & goto bgset
if "%windows_version%"=="6.2" start slidetoshutdown.exe & goto bgset
cls
echo =================================================
echo are you sure you want to shut down windows? (Y/N)
echo =================================================
choice>nul
if %errorlevel%==2 goto bgset
shutdown /s /t 0
goto bgset

::the program launcher
:openprg
cls
echo ====================================================
echo Choose a program to launch.
echo 1) Calculator
echo 2) Chrome (requires chrome to be already installed)
echo 3) Internet Explorer
echo 4) Notepad
echo 5) Command prompt
echo 6) control panel
echo 7) Windows media player
echo 8) WordPad
echo 9) Back to menu
echo ====================================================
choice /c 123456789>nul
if %errorlevel%==1 start calc & goto openprg
if %errorlevel%==2 start chrome & goto openprg
if %errorlevel%==3 start Iexplore.exe & goto openprg
if %errorlevel%==4 start notepad & goto openprg
if %errorlevel%==5 goto startcmd
if %errorlevel%==6 start control & goto openprg
if %errorlevel%==7 start dvdplay & goto openprg
if %errorlevel%==8 write & goto openprg
if %errorlevel%==9 goto bgset

::the additional process to start CMD in system32
:startcmd
pushd %systemroot%\system32
start cmd
popd
goto openprg

::the embedded app launcher
:appmenu
cls
echo ========================================
echo choose an app.
echo 1) internet search (uses default browser)
echo 2) calculator
echo 3) gamehub
echo 4) file explorer
echo 5) media player
echo 6) back to menu
echo =========================================
choice /c 123456>nul
if %errorlevel%==1 goto chromesearch
if %errorlevel%==2 goto calculator
if %errorlevel%==3 goto gamehub
if %errorlevel%==4 goto fileExplorersetup
if %errorlevel%==5 goto mediaplayer
if %errorlevel%==6 goto bgset

::the embedded internet search V3, changed in 1.1. Now it uses the default browser.
:chromesearch
cls
echo ============================================================
echo NOTE: this is an experimental feature that might not work.
echo.
echo Type in a site that you want to go to. (this is only for 
echo testing purposes tbh) If you want to seach for something on 
echo google, type in WordSearch. Type in back to go to the menu.
echo ============================================================
set /p searchinput=
if "%searchinput%"=="back" goto bgset
if "%searchinput%"=="WordSearch" goto WordSearch
echo search %searchinput%? (Y/N)
choice>nul
if %errorlevel%==1 start "" https://%searchinput% & goto bgset
if %errorlevel%==2 goto chromesearch

::this is the process to look up single word-terms.
:WordSearch
cls
echo =============================================================================
echo type in the phrase that you want to search. Back takes you back to the menu.
echo =============================================================================
set /p WordInput=
if "%WordInput%"=="back" goto bgset
echo search this term? (Y/N)
set wordoutput=%wordinput%
choice>nul
if %errorlevel%==1 start "" https://www.google.com/search?q=%wordinput%" & goto bgset
if %errorlevel%==2 goto chromesearch
goto bgset

::the process to make a new folder or file onto whatever directory.
:newfolderfile
cls
echo ==============================
echo what do you want to create?
echo 1)file
echo 2)folder
echo 3)back to menu
echo ==============================
choice /c 123>nul
if %errorlevel%==1 goto fileinstead 
if %errorlevel%==3 goto bgset
cls
echo Create folder in custom path? (Y/N)
choice>nul
if %errorlevel%==1 goto custompath
if %errorlevel%==2 goto justmakeafolder

:fileinstead
cls
echo ==============================
echo choose a name for the file.
echo ==============================
set /p filename=
cls
echo =====================================
echo choose the file extension. (No dot!)
echo =====================================
set /p fileextension=
cls
echo choose the path for the file (example=C:\windows\system32)
set /p filepath=
nul >"%filepath%\%filename%.%fileextension%"
if not exist "%filepath%\%filename%.%fileextension%" goto creationerror
cls
echo ==================
echo new file created.
echo ==================
pause
goto bgset

:justmakeafolder
cd ..
mkdir "New Folder"
if not exist .\"New Folder" goto creationerror
cls
echo =================================================================
echo New folder created. it is in the directory of the main .cmd file.
echo =================================================================
cd .\systemfiles
echo Press any key to go back to the menu.
pause>nul
goto bgset

:custompath
cls
echo =====================================
echo Enter the path to create the folder.
echo =====================================
set /p folderpath=
mkdir %folderpath%\"New Folder"
if not exist %folderpath%\"New Folder" goto creationerror
pause
echo ==================================================================
echo Folder has been created in directory: %folderpath%
echo ==================================================================
goto bgset

::if the creation of the file or folder fails, it displays this message.
:creationerror
cls
echo Error in creation of file. 
echo Press any key to go back to the menu.
pause>nul
goto menu

:LockPFolder
if exist .\TEMPUSER2 set usernumber=2
if exist .\TEMPUSER1 set usernumber=1
if exist USER%usernumber%CLOSED (
pushd ..
attrib -s -h -r .\"User %usernumber% personal folder"
popd
del USER%usernumber%CLOSED
nul>USER%usernumber%OPEN
cls
echo ======================================
echo Folder unlocked.
echo Press any key to go back to the menu.
echo ======================================
pause>nul
goto bgset
)
If exist USER%usernumber%OPEN (
pushd ..
attrib +s +h +r .\"User %usernumber% personal folder"
popd
del USER%usernumber%OPEN
nul>USER%usernumber%CLOSED
cls
echo ======================================
echo Folder locked.
echo Press any key to go back to the menu.
echo ======================================
pause>nul
goto bgset
)
goto bgset

::Calculator created by david, with custom input coded by P2
:calculator
cls
echo ==========================================
echo What Type of Math would you like to do?
echo 1) Add
echo 2) Subtract
echo 3) Multiply
echo 4) Divide
echo 5) Exponent
echo 6) Poly-numbered / Custom equation (BETA)
echo 7) Back to menu
echo ==========================================
choice /c 1234567>nul
if %errorlevel%==1 goto NUMBERSADD
if %errorlevel%==2 goto NUMBERSSUB
if %errorlevel%==3 goto NUMBERSMULTIPLY
if %errorlevel%==4 goto NUMBERSDIVIDE
if %errorlevel%==5 goto EXPONENT
if %errorlevel%==6 goto CUSTOMEQ
if %errorlevel%==7 goto bgset
:NUMBERSADD
cls
echo What is the First Number you would like to add?
set /p number1=">>>:"
cls
echo What is the Second Number you would like to add?
set /p number2=">>>:"
cls
GOTO ADD2
exit

:NUMBERSSUB
cls
echo What is the First Number you would like to subtract?
set /p number1=">>>:"
cls
echo What is the Second Number you would like to subtract?
set /p number2=">>>:"
cls
GOTO SUB2
exit

:NUMBERSMULTIPLY
cls
echo What is the First Number you would like to multiply?
set /p number1=">>>:"
cls
echo What is the Second Number you would like to multiply?
set /p number2=">>>:"
cls
GOTO MULTIPLY2
exit

:NUMBERSDIVIDE
cls
echo What is the First Number you would like to divide?
set /p number1=">>>:"
cls
echo What is the Second Number you would like to divide?
set /p number2=">>>:"
cls
GOTO DIVIDE2

:ADD2
Set /A result = %number1% + %number2%
echo ========================
echo The answer is %result%.
echo ====================
Pause
goto calculator
:SUB2
Set /A result = %number1% - %number2%
echo ========================
echo The answer is %result%.
echo ========================
pause
goto calculator
:MULTIPLY2
Set /A result = %number1% * %number2%
echo ========================
echo The answer is %result%.
echo ========================
pause
goto calculator
:DIVIDE2
Set /A result = %number1% / %number2%
echo ========================
echo The answer is %result%.
echo ========================
pause
goto calculator
:EXPONENT
cls
echo What is the number you wish to use?
set /p number3=">>>:"
cls
echo How many times do you want to multiply it by?
echo 1) 2
echo 2) 3
echo 3) 4
echo 4) 5
echo 5) 6
choice /c 12345>nul
if %errorlevel%==1 goto e2
if %errorlevel%==2 goto e3
if %errorlevel%==3 goto e4
if %errorlevel%==4 goto e5
if %errorlevel%==5 goto e6
:e2
cls
set /A result2 = %number3% * %number3%
echo =========================
echo The answer is %result2%.
echo =========================
pause
goto menu
:e3
cls
set /A result2 = %number3% * %number3% * %number3%
echo =========================
echo The answer is %result2%.
echo =========================
pause
goto calculator
:e4
cls
set /A result2 = %number3% * %number3% * %number3% * %number3%
echo =========================
echo The answer is %result2%.
echo =========================
pause
goto calculator
:e5
cls
set /A result2 = %number3% * %number3% * %number3% * %number3% * %number3%
echo =========================
echo The answer is %result2%.
echo =========================
pause
goto calculator
:e6
cls
set /A result2 = %number3% * %number3% * %number3% * %number3% * %number3% * %number3%
echo =========================
echo The answer is %result2%.
echo =========================
pause
goto calculator

:CUSTOMEQ
cls
echo ====================
echo Input your equation.
echo ====================
set /p equation=
if "%equation%"=="" goto customeq
set /a customresult="%equation%"
cls
echo ==========================
echo Your result is %customresult%!
echo ==========================
pause 
goto calculator

:calculationfail
cls
echo =====================
echo error in calculation.
echo =====================
pause
goto calculator

::the game launcher.
:gamehub
cls
echo ======================================
echo NOTE: these games are not made by me. 
echo choose the game you want to play 
echo 1) Snake
echo 2) Connect 4 (multiplayer)
echo 3) Tetris
echo 4) War Game
echo 5) Back to Menu
echo ======================================
choice /c 1234>nul
if %errorlevel%==1 goto snakelaunch
if %errorlevel%==2 goto connect4launch
if %errorlevel%==3 goto tetrislaunch
if %errorlevel%==4 goto wargamelaunch
if %errorlevel%==5 goto bgset

:snakelaunch
cls
if not exist .\snake.bat goto oof1
start snake.bat & goto gamehub

:connect4launch
cls
if not exist .\connect4.bat goto oof2
start connect4.bat & goto gamehub

:tetrislaunch
cls
if not exist .\tetris.bat goto oof3
start tetris.bat & goto gamehub

:wargamelaunch
cls
if not exist .\wargame.bat goto oof4
start wargame.bat & goto gamehub

:fileExplorersetup
pushd C:\
set dir=C:\
:explorermenu
cls
echo ================================================
echo You are currently in %dir%
dir
echo Choose your action.
echo 1) go to a different directory
echo 2) open a file here
echo 3) create a new file here
echo 4) create a new folder here
echo 5) back to menu
echo ================================================
choice /c 12345>nul
if %errorlevel%==1 goto pathset 
if %errorlevel%==2 goto openfile
if %errorlevel%==3 goto mkfile
if %errorlevel%==4 goto mkfolder
if %errorlevel%==5 goto explorertomenu
goto explorermenu

:pathset
cls
echo ======================================
echo Type the directory you want to go to.
echo ======================================
set /p dirchange=
pushd %dirchange%
set dir=%dirchange%
goto explorermenu

:openfile
cls
echo =============================================================================
echo Type the name of the file you want to open. (please include file extension!)
echo =============================================================================
set /p filetoopen=
start %filetoopen%
cls 
goto explorermenu

:mkfile
cls
echo ===============================
echo Choose the name for your file.
echo ===============================
set /p filename=

echo ====================================================
echo choose the file extension for %filename%. (no dot!)
echo ====================================================
set /p fileextension=
nul>"%filename%.%fileextension%"
cls
if not exist .\"%filename%.%fileextension%" goto creationerror
echo file created.
echo press any key to go back to the file explorer menu.
pause>nul
goto explorermenu

:mkfolder
cls
echo ==================================================
echo choose the name of the folder you want to create.
echo ==================================================
set /p foldername=
mkdir "%foldername%"
if not exist .\"%foldername%" goto creationerror
echo folder created.
echo press any key to go back to the file explorer menu.
pause>nul
goto explorermenu

:explorertomenu
cls
popd
if exist .\systemfiles\CMD.ID goto bgset
goto explorertomenu

:creationerror
cls
echo error in creation of the file or folder.
echo press any key to go back to menu.
pause>nul
goto explorermenu

:cderror
cls
echo error in changing paths.
echo press any key to go back to the menu.
popd>nul
pause>nul
goto explorermenu

::the media player
:mediaplayer
if exist ..\media goto playermenu
cls
echo =================================================
echo would you like to set up the media player? (Y/N)
echo ==================================================
choice>nul
if %errorlevel%==1 goto settingplayer
if %errorlevel%==2 goto bgset

:settingplayer
cd ..
md media
cd .\systemfiles
cls
echo ============================================================================================================================
echo Media folder has been created and player has been set up. Drop some mp3/mp4/wav files into the folder and restart this app.
echo ============================================================================================================================
pause>nul
goto bgset

:playermenu
cls
cd ..
cd .\media
echo ===========================================
echo what type of file would you like to play?
echo 1) MP3
echo 2) MP4
echo 3) WAV
echo 4) back to menu
echo ===========================================
choice /c 1234>nul
if %errorlevel%==1 set 'mediaextension="mp3" & goto play
if %errorlevel%==2 set "mediaextension="mp4" & goto play
if %errorlevel%==3 set "mediaextension=wav" & goto play
if %errorlevel%==4 goto modtomenu
cls

:play
cls
echo what is the name of the file?
set /p medianame=
start "%medianame%.%mediaextension%"
goto playermenu

::CM.DOS help center
:HelpCenter
cls
echo =======================================
echo What do you need help with? 
echo 1) navigating CM.DOS
echo 2) resetting background\password\color
echo 3) Other support
echo 4) Back to menu
echo =======================================
choice /c 1234>nul
if %errorlevel%==1 goto NavigatingHelp
if %errorlevel%==2 goto ResetHelp
if %errorlevel%==3 goto OtherHelp
if %errorlevel%==4 goto bgset

:NavigatingHelp
cls
echo To navigate CM.DOS, just type in the number shown before the option. It will sometimes prompt you with a (Y/N), so put one of the options in.
echo.
echo press any key to go back to the menu.
pause>nul
goto HelpCenter

:ResetHelp
cls
echo To reset background and password, just go to the settings and navigate to the appropriate menu. To reset/change the color, navigate to the color change menu and choose white to reset.
echo.
echo press any key to go back to the menu.
pause>nul
goto HelpCenter

:OtherHelp
cls
echo You can contact the leader of Elite Technologies on discord (Player 2#1345). do not hesitate to ask as other people might have the same question/issue.
echo.
echo press any key to go back to the menu.
pause>nul
goto HelpCenter

:settings
::CM.DOS settings menu
cls
echo ===========================
echo CM.DOS settings
echo 1) Change your password
echo 2) change your username
echo 3) Change your background
echo 4) Change system color/theme
echo 5) Developer settings
echo 6) Reset CM.DOS
echo 7) Back to menu
if not exist .\user2.txt echo 8) make a second user
if exist .\guestcode.txt echo 9) force-disable guest code
echo ===========================
if exist user2.txt choice /c 1234567>nul
if not exist user2.txt choice /c 123456789>nul 
if %errorlevel%==1 goto chpassword
if %errorlevel%==2 goto chuser
if %errorlevel%==3 goto bgreset
if %errorlevel%==4 goto colorreset
if %errorlevel%==5 goto DevSettings
if %errorlevel%==6 goto reset_S
if %errorlevel%==7 goto bgset
if %errorlevel%==8 goto user2creator
if %errorlevel%==9 goto guestdisable

:guestdisable
del .\guestcode.txt
echo ======================================
echo Guest code disabled.
echo Press any key to go back to the menu.
echo ======================================
pause>nul
goto bgset

::background reset system
:bgreset
if exist TEMPUSER2 (
del 2bg1
del 2bg2
del 2bg3
del 2bg4
del 2bg5
del 2NOBG
cls
goto 2choosebg
)
del 1bg1
del 1bg2
del 1bg3
del 1bg4
del 1bg5
del 1NOBG
cls
goto 1choosebg
::the color reset system
:colorreset
if exist TEMPUSER2 (
cls
echo Only User 1 can change this option.
echo press any key to go back to the menu.
pause>nul
goto bgset2
)
del .\color.txt
:colormenu
cls
::The theme choice and theme setting system
echo ========================================================
echo choose your theme by typing in the correspondent number.
echo 1) simple red (black/red)
echo 2) simple green (black/green)
echo 3) simple blue (black/blue)
echo 4) simple yellow (black/yellow)
echo 5) default (black/white)
echo 6) More Themes
echo ========================================================
choice /c 123456>nul
if %errorlevel%==1 goto colorred
if %errorlevel%==2 goto colorgreen
if %errorlevel%==3 goto colorblue 
if %errorlevel%==4 goto coloryellow
if %errorlevel%==5 color f & goto bgset
if %errorlevel%==6 goto morethemes

:colorred
echo c>color.txt
color c
goto bgset

:colorgreen
echo a>color.txt
color a
goto bgset

:colorblue
echo b>color.txt
color b
goto bgset

:coloryellow
echo e>color.txt
Color E
Goto bgset

:morethemes
cls
echo =================================
echo 1) nuclear 1 (gray/yellow)
echo 2) nuclear 2 (green/yellow)
echo 3) navy (blue/white)
echo 4) inverted default (white/black)
echo 5) eggplant (purple/white)
echo 6) ferrari (red/white)
echo 7) Back to Normal Themes
echo =================================
choice /c 1234567>nul
if %errorlevel%==1 goto nuclear1
if %errorlevel%==2 goto nuclear2
if %errorlevel%==3 goto navy
if %errorlevel%==4 goto inverted
if %errorlevel%==5 goto eggplant
if %errorlevel%==6 goto ferrari
if %errorlevel%==7 goto colormenu

:nuclear1
echo 8E>color.txt
color 8E
goto bgset

:nuclear 2
echo 2E>color.txt
color 2E
goto bgset

:navy
echo 1F>color.txt
color 1F
goto bgset

:inverted
echo F0>color.txt
color F0
goto bgset

:eggplant
echo 5F>color.txt
color 5F
goto bgset

:ferrari
echo 4F>color.txt
color 4F
goto bgset

::user identifier and password reset system
:chpassword
if exist tempuser2 goto chpassword2
:chpassword1
cls
echo ====================================================
echo Are you sure you want to change your password? (Y/N)
echo ==================================================== 
choice>NUL
if %errorlevel%==2 goto bgset
cls
echo =================================================
echo What is the new password you want to have?
echo Press enter without input to go back to the menu.
echo =================================================
set /p newuser2pass=
if "%newuser1pass%"=="" goto bgset
del .\user2.txt
echo %user1name%> .\user1.txt
echo %newuser1pass%>> .\user1.txt
cls
echo =======================================================
echo Password changed. Press any key to go back to the menu.
echo =======================================================
pause>nul
goto bgset

:chpassword2
cls
echo ====================================================
echo Are you sure you want to change your password? (Y/N)
echo ==================================================== 
choice>NUL
if %errorlevel%==2 goto bgset
cls
echo =================================================
echo What is the new password you want to have?
echo Press enter without input to go back to the menu.
echo =================================================
set /p newuser2pass=
if "%newuser2pass%"=="" goto bgset
del .\user2.txt
echo %user2name%> .\user2.txt
echo %newuser2pass%>> .\user2.txt
cls
echo =======================================================
echo Password changed. Press any key to go back to the menu.
echo =======================================================
pause>nul
goto bgset

:chuser
if exist TEMPUSER2 goto chuser2
:chuser1
cls
echo ====================================================
echo Are you sure you want to change your username? (Y/N)
echo ====================================================
choice>nul
if %errorlevel%==2 goto bgset
cls
echo =================================================
echo What is the new username you want to have?
echo Press enter without input to go back to the menu.
echo =================================================
set /p newuser1name=
if "%newuser1name%"=="" goto bgset
del .\user1.txt
echo %newuser1name%> .\user2.txt
echo %user1pass%>> .\user2.txt
echo =======================================================
echo Username changed. Press any key to go back to the menu.
echo =======================================================
pause>nul
goto bgset 

:chuser2
cls
echo ====================================================
echo Are you sure you want to change your username? (Y/N)
echo ====================================================
choice>nul
if %errorlevel%==2 goto bgset
cls
echo =================================================
echo What is the new username you want to have?
echo Press enter without input to go back to the menu.
echo =================================================
set /p newuser1name=
if "%newuser2name%"=="" goto bgset
del .\user2.txt
echo %newuser2name%> .\user2.txt
echo %user2pass%>> .\user2.txt
echo =======================================================
echo Username changed. Press any key to go back to the menu.
echo =======================================================
pause>nul
goto bgset

:user2creator
cls
echo =======================================================
echo What is the username you want the second user to have?
echo =======================================================
echo.
set /p user2name=
if "%user2name%"=="" goto userset
cls
echo ==============================================================
echo Are you sure you want the username to be "%user2name%"? (Y/N)
echo ==============================================================
choice>nul
if %errorlevel%==2 goto user2creator
echo %user2name%> user2.txt
pushd ..
md .\"User 2 Personal Folder"
attrib +s +h +r "User 2 Personal Folder"
popd
nul>USER2FOLDERCLOSED
:passset2
cls
echo =======================================
echo What is the password you want to have?
echo =======================================
echo.
set /p user2pass=
cls
echo ==============================================================
echo Are you sure you want your password to be "%user2pass%"? (Y/N)
echo ==============================================================
choice>nul
if %errorlevel%==2 goto passset2
echo %user2pass%>> user2.txt
cls
echo =============================================================
echo User has been created. Press any key to go back to the menu.
echo =============================================================
pause>nul
goto bgset

::to reset cmdos
:reset_S
cls
echo are you sure you want to reset cm.dos? (Y/N)
choice>nul
if %errorlevel%==2 goto bgset
del user1.txt
del 1bg1
del 1bg2
del 1bg3
del 1bg4
del 1bg5
del user2.txt
del USER1FOLDERCLOSED
del USER1FOLDEROPEN
del USER2FOLDERCLOSED
del USER2FOLDEROPEN
del 2bg1
del 2bg2
del 2bg3
del 2bg4
del 2bg5
del 1NOBG
del 2NOBG
del colorblue
del colorgreen
del colorred
del coloryellow
del TEMPGUEST
del TEMPUSER1
del TEMPUSER2
cd ..
attrib -h -s -r .\"User 1 personal folder"
attrib -h -s -r .\"User 2 personal folder"
rd .\"User 1 personal folder"
rd .\"User 2 personal folder"
rd .\media
attrib -h -s -r .\systemfiles
cls
echo would you like to keep your add ons folder? (Y/N)
echo if not, everything in there will be deleted
choice>nul
if %errorlevel%==1 goto endreset
if %errorlevel%==2 rd .\add-ons & goto endreset

:endreset
cls
echo cm.dos has been reset. It will now close. 
pause>nul
exit
::The developer settings 
:DevSettings
cls
echo ==============================================================================================================
echo NOTE: These settings are meant for people who are trying to edit the code of CM.DOS or create an add-on for it.
echo 1) enable/disable login screen skip
echo 2) enable/disable console startup
echo 3) lock/unlock systemfiles folder 
echo 4) back to menu
echo ==============================================================================================================
choice /c 123>nul
if %errorlevel%==1 goto enableskip
if %errorlevel%==2 goto enableconsole
if %errorlevel%==3 goto lock_unlock
if %errorlevel%==4 goto bgset

:lock_unlock
if exist .\systemfilesopen goto systemlock
nul>systemfilesopen
cd ..
attrib -s -h -r .\systemfiles
cd .\systemfiles
cls
echo systemfiles unlocked!
pause>nul
goto bgset

:systemlock
cd ..
attrib +s +h +r .\systemfiles
cd .\systemfiles
del .\systemfilesopen
cls
echo system files locked
pause>nul
goto bgset

::process to enable login screen skip 
:enableskip
if exist TEMPUSER2 (
cls
echo Only User 1 can change this option.
echo press any key to go back to the menu.
pause>nul
goto bgset2
)
if exist .\nologin.dev goto disableskip
cls
echo ===================================================
echo Activating this option will skip the login screen,
echo automatically logging in as user 1.
echo Are you sure you want to enable this? (Y/N)
echo ===================================================
choice>nul
if %errorlevel%==2 goto bgset1
nul>nologin.dev
cls
echo ====================================================
echo Login skip activated. You can disable this anytime.
echo Press any key to go back to the menu.
echo ====================================================
pause>nul
goto bgset

:disableskip
cls
del .\nologin.dev
echo ======================================
echo Login skip disabled.
echo Press any key to go back to the menu. 
echo ======================================
pause>nul
goto bgset

:enableconsole
if exist ..\"CM.DOS (console startup).cmd" goto disableconsole
echo ==========================================================
echo Are you sure you want to enable the console startup? (Y/N)
echo ==========================================================
choice>nul
if %errorlevel%==2 goto bgset
pushd ..
echo cd .\SystemFiles > .\"CM.DOS (console startup).cmd"
echo set consolevariable=yes >> .\"CM.DOS (console startup).cmd"
echo start "CM.DOS Beta test 3.cmd" >> .\"CM.DOS (console startup).cmd"
popd
cls
echo ======================================
echo Console startup enabled.
echo Press any key to go back to the menu. 
echo ======================================
pause>nul
goto bgset

:disableconsole
pushd ..
del .\"CM.DOS (console startup).cmd"
popd
cls
echo ======================================
echo Console startup disabled.
echo Press any key to go back to the menu. 
echo ======================================
pause>nul
goto bgset

::the add-on launcher
:AddonLauncher
if not exist ..\"Add-ons" goto addonsetup
cd ..
cd .\Add-ons
cls
echo ===========================================================
echo What is the extension of the add-on you want to launch?
echo 1) BAT
echo 2) CMD
echo 3) EXE
echo 4) Back to menu
echo ===========================================================
choice /c 123>nul
if %errorlevel%==1 goto BatAddons
if %errorlevel%==2 goto CmdAddons
if %errorlevel%==3 goto ExeAddons
if %errorlevel%==4 goto modtomenu

::the .bat section of the add-on launcher
:BatAddons
cls
echo Write the name of the .BAT add-on file you want to launch. Back takes you back to menu.
set /p modinput=
if "%modinput%"=="back" goto modtomenu
call "%modinput%.bat"
goto AddonLauncher

::the .cmd section of the add-on launcher
:CmdAddons
cls
echo Write the name of the .CMD add-on file you want to launch. Back takes you back to menu.
set /p modinput=
if "%modinput%"=="back" goto modtomenu
call %modinput%.cmd
goto AddonLauncher

::the .exe section of the add-on launcher
:ExeAddons
cls
echo Write the name of the .EXE add-on file you want to launch. Back takes you back to menu.
set /p modinput=
if "%modinput%"=="back" goto modtomenu
call %modinput%.exe
goto AddonLauncher

:modtomenu
cd ..
cd .\SystemFiles
goto bgset

:addonsetup
cd .\systemfiles
cls
echo Would you like to set up add-on launcher? (Y/N)
choice>nul
if %errorlevel%==1 goto addonsetup2
if %errorlevel%==2 goto bgset

:addonsetup2
md ..\Add-ons
cls
echo =====================================================================================
echo Addon launcher has been set up. Drop any add-ons in the folder and restart this app.
echo =====================================================================================
echo press any key to go back to the menu.
pause>nul
goto bgset

::guest menu with reduced features
:guestsession
if exist .\TEMPUSER1 del .\TEMPUSER1
if exist .\TEMPUSER2 del .\TEMPUSER2
if exist .\TEMPGUEST del .\TEMPGUEST
if exist .\.txt goto guestlogin
nul>TEMPGUEST
goto guestmenu

:guestlogin
cls
echo ============================
echo enter the code to continue.
echo [----]
echo ============================
choice /c 1234567890>nul
if %errorlevel%==10 set errorlevel=0
set digit1=%errorlevel%
cls
echo ============================
echo enter the code to continue.
echo [%digit1%---]
echo ============================
choice /c 1234567890>nul
if %errorlevel%==10 set errorlevel=0
set digit2=%errorlevel%
cls
echo ============================
echo enter the code to continue.
echo [%digit1%%digit2%--]
echo ============================
choice /c 1234567890>nul
if %errorlevel%==10 set errorlevel=0
set digit3=%errorlevel%
cls
echo ============================
echo enter the code to continue.
echo [%digit1%%digit2%%digit3%-]
echo ============================
choice /c 1234567890>nul
if %errorlevel%==10 set errorlevel=0
set digit4=%errorlevel%
set code=%digit1%%digit2%%digit3%%digit4%
set /p actualcode=<guestcode.txt
if not %code%==%actualcode% (
cls
echo ==============
echo Code is wrong.
echo ==============
ping localhost -n 2 >nul
goto login
)
del guestcode.txt
:guestmenu
cls
echo =============================
echo List of available tasks
echo 1) Open an outside program
echo 2) start an embedded app 
echo 3) Launch an add-on
echo 4) Info on CM.DOS (readme.txt)
echo 5) pause guest session
echo x) Exit
echo =============================
choice /c 12345x>nul
if %errorlevel%==1 goto openprg
if %errorlevel%==2 goto guestappmenu
if %errorlevel%==3 goto AddonLauncher
if %errorlevel%==4 start readme.txt & goto guestmenu
if %errorlevel%==5 goto pausepinchoice
if %errorlevel%==6 exit
		
::guest app menu that doesn't include file explorer
:guestappmenu
cls
echo ==================
echo choose an app.
echo 1) chrome search
echo 2) calculator
echo 3) gamehub
echo 4) media player
echo 5) back to menu
echo ==================
choice /c 12345>nul
if %errorlevel%==1 goto chromesearch
if %errorlevel%==2 goto calculator
if %errorlevel%==3 goto gamehub
if %errorlevel%==4 goto mediaplayer
if %errorlevel%==5 goto bgset

::generate a random suggested code, and pin chooser
:pausepinchoice
set random1=%random:-1,1%
set random2=%random:-1,1%
set random3=%random:-1,1%
set random4=%random:-1,1%
set randomcodesuggest=%random1%%random2%%random3%%random4%
cls
echo Choose a 4 digit pin. (wanna stay safe? Here's a randomly generated code, "%randomcodesuggest%")
echo [----]
choice /c 1234567890>nul
if %errorlevel%==10 set errorlevel=0
set digit1=%errorlevel%
cls
echo Choose a 4 digit pin. 
echo [%digit1%---]
choice /c 1234567890>nul
if %errorlevel%==10 set errorlevel=0
set digit2=%errorlevel%
cls
echo Choose a 4 digit pin. 
echo [%digit1%%digit2%--]
choice /c 1234567890>nul
if %errorlevel%==10 set errorlevel=0
set digit3=%errorlevel%
cls
echo Choose a 4 digit pin. 
echo [%digit1%%digit2%%digit3%-]
choice /c 1234567890>nul
if %errorlevel%==10 set errorlevel=0
set digit4=%errorlevel%
set code=%digit1%%digit2%%digit3%%digit4%
cls
echo are you sure you want to use pin "%code%"? [Y/N]
choice>nul
if %errorlevel%==2 goto guestmenu
echo %code%>guestcode.txt
cls
echo ================================
echo Code set. Press any key to exit.
echo ================================
pause>nul
exit

::error code for if different things don't exist
:oof
nul>Error_no_id.log
color ce
cls
echo ERROR
echo ID file does not exist or is not in systemfiles folder.
echo ERROR CODE: MISSING_LICENCE_ID
echo You might have downloaded a pirated version of CM.DOS. join our discord server at https://discord.gg/DmZGK8F and we'll help you out.
pause>nul
exit

:oof1
nul>Error0001.log
color ce
cls
echo ERROR
echo snake game does not exist or is not in systemfiles folder.
echo ERROR CODE: 0001
echo if you do not know how to fix this issue by yourself, you can join our discord server at https://discord.gg/DmZGK8F and we'll help you out.
pause>nul
exit

:oof2
nul>Error0002.log
color ce
cls
echo ERROR
echo connect 4 game does not exist or is not in systemfiles folder.
echo ERROR CODE: 0002
echo if you do not know how to fix this issue by yourself, you can join our discord server at https://discord.gg/DmZGK8F and we'll help you out.
pause>nul
exit

:oof3
nul>Error0003.log
color ce
cls
echo ERROR
echo tetris game does not exist or is not in systemfiles folder.
echo ERROR CODE: 0003
echo if you do not know how to fix this issue by yourself, you can join our discord server at https://discord.gg/DmZGK8F and we'll help you out.
pause>nul
exit

:oof4
nul>Error0004.log
color ce
cls
echo ERROR
echo war game does not exist or is not in systemfiles folder.
echo ERROR CODE: 0004
echo if you do not know how to fix this issue by yourself, you can join our discord server at https://discord.gg/DmZGK8F and we'll help you out.
pause>nul
exit

:oof5
nul>Error0005.log
color ce
cls
echo ERROR
echo readme file does not exist or is not in systemfiles folder.
echo ERROR CODE: 0005
echo if you do not know how to fix this issue by yourself, you can join our discord server at https://discord.gg/DmZGK8F and we'll help you out.
pause>nul
exit

::console enabler
:console
echo Input "goto bgset" to go back to the menu.