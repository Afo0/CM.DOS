@echo off
title Connect Four By Mastahhaxor
color 1A
:titlescreen
color 0A
cls
Echo.
Echo.
Echo *************************************************
Echo.
Echo ##### # #
Echo # # # #
Echo # ## ## ## #### ### ### #####
Echo # # # # # # # # # # # 
Echo ##### ## # # # # #### ### # #
Echo.
Echo *************************************************
Echo.
Echo By Mastahhaxor
Echo.
Echo.
Echo 1)Play Game
Echo 2)Instructions
Echo.
Echo.
set /p choice=
If %choice% EQU 1 goto superstart else goto titlescreen
If %choice% EQU 2 goto Instruct
:instruct
cls
Echo.
Echo.
Echo The goal of this game is to get four of your pieces in a row.
Echo in any direction. To choose a column to place your piece in 
Echo type in the letter that corresponds with it (lowercase only).
Echo You must stack pieces in each column so the bottom will always 
Echo fill up first. Enjoy! By the way, I do not claim to own Connect Four,
Echo this is just my representation of it.
Echo.
Echo.
pause
goto :superstart

:superstart
color 0E
cls
Echo.
Echo.
Echo Who will play X's?
Echo.
set /p xs=
cls
Echo.
Echo.
Echo And who will play O's?
Echo.
set /p os=
set /a scorex=0
set /a scoreo=0
set /a draw=0
set /a turns=0
:start
set a1=_
set a2=_
set a3=_
set a4=_
set a5=_
set b1=_
set b2=_
set b3=_
set b4=_
set b5=_
set c1=_
set c2=_
set c3=_
set c4=_
set c5=_
set d1=_
set d2=_
set d3=_
set d4=_
set d5=_
set e1=_
set e2=_
set e3=_
set e4=_
set e5=_
set f1=_
set f2=_
set f3=_
set f4=_
set f5=_


:map1
cls
Echo.
Echo.
Echo Score: %xs%:%scorex%
Echo %os%:%scoreo%
Echo Draw:%draw%
Echo.
Echo.
Echo A B C D E F 
Echo *[%a1%] [%b1%] [%c1%] [%d1%] [%e1%] [%f1%]*
Echo * * 
Echo *[%a2%] [%b2%] [%c2%] [%d2%] [%e2%] [%f2%]*
Echo * *
Echo *[%a3%] [%b3%] [%c3%] [%d3%] [%e3%] [%f3%]*
Echo * *
Echo *[%a4%] [%b4%] [%c4%] [%d4%] [%e4%] [%f4%]*
Echo * *
Echo *[%a5%] [%b5%] [%c5%] [%d5%] [%e5%] [%f5%]*
Echo.
goto P1

:map2
cls
Echo.
Echo.
Echo Score: %xs%:%scorex%
Echo %os%:%scoreo%
Echo Draw:%draw%
Echo.
Echo.
Echo A B C D E F 
Echo *[%a1%] [%b1%] [%c1%] [%d1%] [%e1%] [%f1%]*
Echo * * 
Echo *[%a2%] [%b2%] [%c2%] [%d2%] [%e2%] [%f2%]*
Echo * *
Echo *[%a3%] [%b3%] [%c3%] [%d3%] [%e3%] [%f3%]*
Echo * *
Echo *[%a4%] [%b4%] [%c4%] [%d4%] [%e4%] [%f4%]*
Echo * *
Echo *[%a5%] [%b5%] [%c5%] [%d5%] [%e5%] [%f5%]*
Echo.
goto P2R

:P1c
If %a1%+%a2%+%a3%+%a4% EQU O+O+O+O goto wino
If %a5%+%a2%+%a3%+%a4% EQU O+O+O+O goto wino
If %b1%+%b2%+%b3%+%b4% EQU O+O+O+O goto wino
If %b5%+%b2%+%b3%+%b4% EQU O+O+O+O goto wino
If %c1%+%c2%+%c3%+%c4% EQU O+O+O+O goto wino
If %c5%+%c2%+%c3%+%c4% EQU O+O+O+O goto wino
If %d1%+%d2%+%d3%+%d4% EQU O+O+O+O goto wino
If %d5%+%d2%+%d3%+%d4% EQU O+O+O+O goto wino
If %e1%+%e2%+%e3%+%e4% EQU O+O+O+O goto wino
If %e5%+%e2%+%e3%+%e4% EQU O+O+O+O goto wino
If %f1%+%f2%+%f3%+%f4% EQU O+O+O+O goto wino
If %f5%+%f2%+%f3%+%f4% EQU O+O+O+O goto wino
If %a1%+%b1%+%c1%+%d1% EQU O+O+O+O goto wino
If %e1%+%b1%+%c1%+%d1% EQU O+O+O+O goto wino
If %e1%+%f1%+%c1%+%d1% EQU O+O+O+O goto wino
If %a2%+%b2%+%c2%+%d2% EQU O+O+O+O goto wino
If %e2%+%b2%+%c2%+%d2% EQU O+O+O+O goto wino
If %e2%+%f2%+%c2%+%d2% EQU O+O+O+O goto wino
If %a3%+%b3%+%c3%+%d3% EQU O+O+O+O goto wino
If %e3%+%b3%+%c3%+%d3% EQU O+O+O+O goto wino
If %e3%+%f3%+%c3%+%d3% EQU O+O+O+O goto wino
If %a4%+%b4%+%c4%+%d4% EQU O+O+O+O goto wino
If %e4%+%b4%+%c4%+%d4% EQU O+O+O+O goto wino
If %e4%+%f4%+%c4%+%d4% EQU O+O+O+O goto wino
If %a5%+%b5%+%c5%+%d5% EQU O+O+O+O goto wino
If %e5%+%b5%+%c5%+%d5% EQU O+O+O+O goto wino
If %e5%+%f5%+%c5%+%d5% EQU O+O+O+O goto wino
If %a2%+%b3%+%c4%+%d5% EQU O+O+O+O goto wino
If %a1%+%b2%+%c3%+%d4% EQU O+O+O+O goto wino
If %e5%+%b2%+%c3%+%d4% EQU O+O+O+O goto wino
If %b1%+%c2%+%d3%+%e4% EQU O+O+O+O goto wino
If %f5%+%c2%+%d3%+%e4% EQU O+O+O+O goto wino
If %c1%+%d2%+%e3%+%f4% EQU O+O+O+O goto wino
If %c5%+%d4%+%e3%+%f2% EQU O+O+O+O goto wino
If %c5%+%d4%+%e3%+%f2% EQU O+O+O+O goto wino
If %b5%+%c4%+%d3%+%e2% EQU O+O+O+O goto wino
If %f1%+%c4%+%d3%+%e2% EQU O+O+O+O goto wino
If %a5%+%b4%+%c3%+%d2% EQU O+O+O+O goto wino
If %e1%+%b4%+%c3%+%d2% EQU O+O+O+O goto wino
If %a4%+%b3%+%c2%+%d1% EQU O+O+O+O goto wino
If %turns% EQU 30 goto draw
goto map1

:P1
Echo.
Echo.
Echo %xs%, it's your turn.
Echo.
Echo.
set /p x=
If %x% EQU a goto A5
If %x% EQU b goto B5
If %x% EQU c goto C5
If %x% EQU d goto D5
If %x% EQU e goto E5
If %x% EQU f goto F5
goto Map1

:A5
If %a5% EQU X goto A4
If %a5% EQU O goto A4
set a5=X
goto P2

:A4
If %a4% EQU X goto A3
If %a4% EQU O goto A3
set a4=X
goto P2

:A3
If %a3% EQU X goto A2
If %a3% EQU O goto A2
set a3=X
goto P2

:A2
If %a2% EQU X goto A1
If %a2% EQU O goto A1
set a2=X
goto P2

:A1
If %a1% EQU X goto error1
If %a1% EQU O goto error1
set a1=X
goto P2



:B5
If %b5% EQU X goto B4
If %b5% EQU O goto B4
set b5=X
goto P2

:B4
If %b4% EQU X goto B3
If %b4% EQU O goto B3
set b4=X
goto P2

:B3
If %b3% EQU X goto B2
If %b3% EQU O goto B2
set b3=X
goto P2

:B2
If %b2% EQU X goto B1
If %b2% EQU O goto B1
set b2=X
goto P2

:B1
If %b1% EQU X goto error1
If %b1% EQU O goto error1
set b1=X
goto P2



:C5
If %c5% EQU X goto C4
If %c5% EQU O goto C4
set c5=X
goto P2

:C4
If %c4% EQU X goto C3
If %c4% EQU O goto C3
set c4=X
goto P2

:C3
If %c3% EQU X goto C2
If %c3% EQU O goto C2
set c3=X
goto P2

:C2
If %c2% EQU X goto C1
If %c2% EQU O goto C1
set c2=X
goto P2

:C1
If %c1% EQU X goto error1
If %c1% EQU O goto error1
set c1=X
goto P2


:D5
If %d5% EQU X goto D4
If %d5% EQU O goto D4
set d5=X
goto P2

:D4
If %d4% EQU X goto D3
If %d4% EQU O goto D3
set d4=X
goto P2

:D3
If %d3% EQU X goto D2
If %d3% EQU O goto D2
set d3=X
goto P2

:D2
If %d2% EQU X goto D1
If %d2% EQU O goto D1
set d2=X
goto P2

:D1
If %d1% EQU X goto error1
If %d1% EQU O goto error1
set d1=X
goto P2


:E5
If %e5% EQU X goto E4
If %e5% EQU O goto E4
set e5=X
goto P2

:E4
If %e4% EQU X goto E3
If %e4% EQU O goto E3
set e4=X
goto P2

:E3
If %e3% EQU X goto E2
If %e3% EQU O goto E2
set e3=X
goto P2

:E2
If %e2% EQU X goto E1
If %e2% EQU O goto E1
set e2=X
goto P2

:E1
If %e1% EQU X goto error1
If %e1% EQU O goto error1
set e1=X
goto P2

:F5
If %f5% EQU X goto F4
If %f5% EQU O goto F4
set f5=X
goto P2

:F4
If %f4% EQU X goto F3
If %f4% EQU O goto F3
set f4=X
goto P2

:F3
If %f3% EQU X goto F2
If %f3% EQU O goto F2
set f3=X
goto P2

:F2
If %f2% EQU X goto F1
If %f2% EQU O goto F1
set f2=X
goto P2

:F1
If %f1% EQU X goto error1
If %f1% EQU O goto error1
set f1=X
goto P2




:P2
If %a1%+%a2%+%a3%+%a4% EQU X+X+X+X goto winx
If %a5%+%a2%+%a3%+%a4% EQU X+X+X+X goto winx
If %b1%+%b2%+%b3%+%b4% EQU X+X+X+X goto winx
If %b5%+%b2%+%b3%+%b4% EQU X+X+X+X goto winx
If %c1%+%c2%+%c3%+%c4% EQU X+X+X+X goto winx
If %c5%+%c2%+%c3%+%c4% EQU X+X+X+X goto winx
If %d1%+%d2%+%d3%+%d4% EQU X+X+X+X goto winx
If %d5%+%d2%+%d3%+%d4% EQU X+X+X+X goto winx
If %e1%+%e2%+%e3%+%e4% EQU X+X+X+X goto winx
If %e5%+%e2%+%e3%+%e4% EQU X+X+X+X goto winx
If %f1%+%f2%+%f3%+%f4% EQU X+X+X+X goto winx
If %f5%+%f2%+%f3%+%f4% EQU X+X+X+X goto winx
If %a1%+%b1%+%c1%+%d1% EQU X+X+X+X goto winx
If %e1%+%b1%+%c1%+%d1% EQU X+X+X+X goto winx
If %e1%+%f1%+%c1%+%d1% EQU X+X+X+X goto winx
If %a2%+%b2%+%c2%+%d2% EQU X+X+X+X goto winx
If %e2%+%b2%+%c2%+%d2% EQU X+X+X+X goto winx
If %e2%+%f2%+%c2%+%d2% EQU X+X+X+X goto winx
If %a3%+%b3%+%c3%+%d3% EQU X+X+X+X goto winx
If %e3%+%b3%+%c3%+%d3% EQU X+X+X+X goto winx
If %e3%+%f3%+%c3%+%d3% EQU X+X+X+X goto winx
If %a4%+%b4%+%c4%+%d4% EQU X+X+X+X goto winx
If %e4%+%b4%+%c4%+%d4% EQU X+X+X+X goto winx
If %e4%+%f4%+%c4%+%d4% EQU X+X+X+X goto winx
If %a5%+%b5%+%c5%+%d5% EQU X+X+X+X goto winx
If %e5%+%b5%+%c5%+%d5% EQU X+X+X+X goto winx
If %e5%+%f5%+%c5%+%d5% EQU X+X+X+X goto winx
If %a2%+%b3%+%c4%+%d5% EQU X+X+X+X goto winx
If %a1%+%b2%+%c3%+%d4% EQU X+X+X+X goto winx
If %e5%+%b2%+%c3%+%d4% EQU X+X+X+X goto winx
If %b1%+%c2%+%d3%+%e4% EQU X+X+X+X goto winx
If %f5%+%c2%+%d3%+%e4% EQU X+X+X+X goto winx
If %c1%+%d2%+%e3%+%f4% EQU X+X+X+X goto winx
If %c5%+%d4%+%e3%+%f2% EQU X+X+X+X goto winx
If %c5%+%d4%+%e3%+%f2% EQU X+X+X+X goto winx
If %b5%+%c4%+%d3%+%e2% EQU X+X+X+X goto winx
If %f1%+%c4%+%d3%+%e2% EQU X+X+X+X goto winx
If %a5%+%b4%+%c3%+%d2% EQU X+X+X+X goto winx
If %e1%+%b4%+%c3%+%d2% EQU X+X+X+X goto winx
If %a4%+%b3%+%c2%+%d1% EQU X+X+X+X goto winx
If %turns% EQU 30 goto draw
goto map2


:P2R
Echo.
Echo.
Echo %os%, it's your turn.
Echo.
Echo.
set /p x=
If %x% EQU a goto A5o
If %x% EQU b goto B5o
If %x% EQU c goto C5o
If %x% EQU d goto D5o
If %x% EQU e goto E5o
If %x% EQU f goto F5o
goto Map2

:A5o
If %a5% EQU X goto A4o
If %a5% EQU O goto A4o
set a5=O
goto P1c

:A4o
If %a4% EQU X goto A3o
If %a4% EQU O goto A3o
set a4=O
goto P1c

:A3o
If %a3% EQU X goto A2o
If %a3% EQU O goto A2o
set a3=O
goto P1c

:A2o
If %a2% EQU X goto A1o
If %a2% EQU O goto A1o
set a2=O
goto P1c

:A1o
If %a1% EQU X goto error2
If %a1% EQU O goto error2
set a1=O
goto P1c



:B5o
If %b5% EQU X goto B4o
If %b5% EQU O goto B4o
set b5=O
goto P1c

:B4o
If %b4% EQU X goto B3o
If %b4% EQU O goto B3o
set b4=O
goto P1c

:B3o
If %b3% EQU X goto B2o
If %b3% EQU O goto B2o
set b3=O
goto P1c

:B2o
If %b2% EQU X goto B1o
If %b2% EQU O goto B1o
set b2=O
goto P1c

:B1o
If %b1% EQU X goto error1
If %b1% EQU O goto error1
set b1=O
goto P1c



:C5o
If %c5% EQU X goto C4o
If %c5% EQU O goto C4o
set c5=O
goto P1c

:C4o
If %c4% EQU X goto C3o
If %c4% EQU O goto C3o
set c4=O
goto P1c

:C3o
If %c3% EQU X goto C2o
If %c3% EQU O goto C2o
set c3=O
goto P1c

:C2o
If %c2% EQU X goto C1o
If %c2% EQU O goto C1o
set c2=O
goto P1c

:C1o
If %c1% EQU X goto error1
If %c1% EQU O goto error1
set c1=O
goto P1c


:D5o
If %d5% EQU X goto D4o
If %d5% EQU O goto D4o
set d5=O
goto P1c

:D4o
If %d4% EQU X goto D3o
If %d4% EQU O goto D3o
set d4=O
goto P1c

:D3o
If %d3% EQU X goto D2o
If %d3% EQU O goto D2o
set d3=O
goto P1c

:D2o
If %d2% EQU X goto D1o
If %d2% EQU O goto D1o
set d2=O
goto P1c

:D1o
If %d1% EQU X goto error1
If %d1% EQU O goto error1
set d1=O
goto P1c


:E5o
If %e5% EQU X goto E4o
If %e5% EQU O goto E4o
set e5=O
goto P1c

:E4o
If %e4% EQU X goto E3o
If %e4% EQU O goto E3o
set e4=O
goto P1c

:E3o
If %e3% EQU X goto E2o
If %e3% EQU O goto E2o
set e3=O
goto P1c

:E2o
If %e2% EQU X goto E1o
If %e2% EQU O goto E1o
set e2=O
goto P1c

:E1o
If %e1% EQU X goto error1
If %e1% EQU O goto error1
set e1=O
goto P1c

:F5o
If %f5% EQU X goto F4o
If %f5% EQU O goto F4o
set f5=O
goto P1c

:F4o
If %f4% EQU X goto F3o
If %f4% EQU O goto F3o
set f4=O
goto P1c

:F3o
If %f3% EQU X goto F2o
If %f3% EQU O goto F2o
set f3=O
goto P1c

:F2o
If %f2% EQU X goto F1o
If %f2% EQU O goto F1o
set f2=O
goto P1c

:F1o
If %f1% EQU X goto error1
If %f1% EQU O goto error1
set f1=O
goto P1c



:error1
Echo.
Echo Invalid Entry, That Column is Full
Echo.
pause
goto map1

:error2
Echo.
Echo Invalid Entry, That Column is Full
Echo.
pause
goto map2



:winx
cls
color 0A
set /a scorex=%scorex%+1
Echo.
Echo.
Echo Congrats %xs%, because...
Echo.
Echo.
Echo **
Echo **** **** * ********* ** ** ** **** **
Echo **** **** ** ** ** ** **** **
Echo ******** ** ** ** ** ** ** * **
Echo ****** ********* ** ** ** ** ** * **
Echo ******** ** ** ** ** ** ** * **
Echo **** **** ** ************ ** ** * **
Echo **** **** ******** ************ ** ** ****
Echo.
Echo.
pause
goto ending

:wino
cls
Color 0C
set /a scoreo=%scoreo%+1
Echo.
Echo.
Echo Congrats %os%, because...
Echo.
Echo.
Echo **
Echo ************ * ********* ** ** ** **** **
Echo ************ ** ** ** ** **** **
Echo ** ** ** ** ** ** ** ** * **
Echo ** ** ********* ** ** ** ** ** * **
Echo ** ** ** ** ** ** ** ** * **
Echo ************ ** ************ ** ** * **
Echo ************ ******** ************ ** ** ****
Echo. 
Echo.
pause 
goto ending

:draw
cls
color 0E
set /a draw=%draw%+1
Echo.
Echo.
Echo Sorry %xs% and %os%, but it's a...
Echo.
Echo.
Echo ######
Echo ## # 
Echo ## # #### ##### # #
Echo ## # # # # # # #
Echo ## # # # # # # #
Echo ###### # #### # #####
Echo.
Echo.
pause
goto ending

:ending
cls
color 0E
Echo.
Echo.
Echo Press 1 to Play Again
Echo Press 2 to Change Players
Echo Press 3 to Exit
Echo.
set /p v=
IF %v% EQU 1 goto start
IF %v% EQU 2 goto superstart
IF %v% EQU 3 goto close

:close
color b
call menu.bat