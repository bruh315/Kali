@echo off
setlocal enabledelayedexpansion

mode 190, 60

chcp 65001 > nul
set "e="

:epoint

call :initloop
call :banner
:ml
set /p wnscmd="!e![38;2;255;180;0m!i0:~2!# "

if /I "!wnscmd!" == "conscan" (
	for /f "tokens=5" %%a in ('netstat -nop TCP ^| find "ESTABLISHED"') do for /f "tokens=1,5" %%b in ('tasklist /FI "PID eq %%a" ^| find "%%a"') do echo !i0!Process Image: %%b ^| Memory usage: %%cKB
	goto ml
)

if /I "!wnscmd!" == "ipscan" (
	cls
	echo.
	set /p sbn=".!i0:~1!!e![38;2;255;0;0mEnter subnet -> !e![38;2;255;255;0m" 
	for /l %%a in (1,1,255) do (
		ping -n 1 -w 300 !sbn!.%%a | find "Reply from !sbn!.%%a" > nul
		if "!errorlevel!" == "0" (
			echo !i0!!e![38;2;255;255;255m!sbn!.%%a - !e![38;2;0;255;0monline!e![m
			:: ~40 ms timeout each ping, 320 ms timeout in total
			for /l %%b in (0,1,5) do ping -n 1 localhost > nul 
		)
	)
	goto ml
)

if /I "!wnscmd!" == "cls" (
	cls
	echo.
	goto ml
)

if /I "!wnscmd!" == "clear" (
	cls
	echo.
	goto ml
)

if /I "!wnscmd!" == "ecls" (
	cls
	goto epoint
)

if /I "!wnscmd!" == "eclear" (
	cls
	goto epoint
)

if /I "!wnscmd!" == "addrp" (
	for /f %%a in ('curl -s https://api.ipify.org ') do echo !i0!Public IP address: %%a
	goto ml
)

if /I "!wnscmd!" == "addrl" (
	for /f "tokens=2 delims=:" %%a in ('ipconfig ^| find "IPv4"') do (
		set "ip=%%a"
		:: Remove space using :~1
		echo !i0!Local IP address: !ip:~1!
	) 
	goto ml
)


if /I "!wnscmd!" == "exit" (
	exit
	goto ml
)

if /I "!wnscmd:~0,4!" == "ssh " (
	ssh !wnscmd:~4!
)

if /I "!wnscmd:~0,4!" == "ftp " (
	ftp !wnscmd:~4!
)

if /I "!wnscmd!" == "help" (
	echo.
	echo !i0!!e![38;2;255;0;0m╔════════════════════════╗!i0!╔══════════════════════════════════════════════════════════════════════╗
	echo !i0!!e![38;2;255;15;0m║        Command         ║!i0!║                           Actione                                    ║ 
	echo !i0!!e![38;2;255;30;0m╠════════════════════════╣!i0!╠══════════════════════════════════════════════════════════════════════╣
	echo !i0!!e![38;2;255;45;0m║        conscan         ║!i0!║ Scans for connected processes and displays the image and mem usage   ║
	echo !i0!!e![38;2;255;60;0m║        ipscan          ║!i0!║ Asks for a subnet and showes online devices ^(ICMP^)                   ║
	echo !i0!!e![38;2;255;75;0m║        ssh             ║!i0!║ Uses the Secure Shell protocol to access a machines shell            ║
	echo !i0!!e![38;2;255;90;0m║        ftp             ║!i0!║ Uses the file sharing protocol to access a machines files            ║
	echo !i0!!e![38;2;255;105;0m║        addrl           ║!i0!║ Shows your local IP addresses                                        ║
	echo !i0!!e![38;2;255;120;0m║        addrp           ║!i0!║ Shows your public IP address                                         ║
	echo !i0!!e![38;2;255;135;0m║        help            ║!i0!║ Use your imagination for once bro                                    ║
	echo !i0!!e![38;2;255;150;0m║                        ║!i0!║                                                                      ║
	echo !i0!!e![38;2;255;165;0m║                        ║!i0!║                                                                      ║
	echo !i0!!e![38;2;255;180;0m║                        ║!i0!║                                                                      ║
	echo !i0!!e![38;2;255;195;0m║                        ║!i0!║                                                                      ║
	echo !i0!!e![38;2;255;210;0m║                        ║!i0!║                                                                      ║
	echo !i0!!e![38;2;255;225;0m║                        ║!i0!║                                                                      ║
	echo !i0!!e![38;2;255;250;0m╚════════════════════════╝!i0!╚══════════════════════════════════════════════════════════════════════╝
	echo.
	goto ml
)

echo !i0!Unknown command: !wnscmd!
goto :ml

:banner
echo.
echo                                                                  !e![38;2;255;0;0m╔════════════════════════════════════════════╗
echo                                                                  !e![38;2;255;0;0m║                                            ║
echo                                                                  !e![38;2;255;0;0m║    !e![38;2;255;0;0m██╗    ██╗███╗   ██╗███████╗██╗  ██╗    !e![38;2;255;0;0m║
echo                                                                  !e![38;2;255;0;0m║    !e![38;2;255;50;0m██║    ██║████╗  ██║██╔════╝██║  ██║    !e![38;2;255;0;0m║
echo                                                                  !e![38;2;255;0;0m║    !e![38;2;255;100;0m██║ █╗ ██║██╔██╗ ██║███████╗███████║    !e![38;2;255;0;0m║
echo                                                                  !e![38;2;255;0;0m║    !e![38;2;255;150;0m██║███╗██║██║╚██╗██║╚════██║██╔══██║    !e![38;2;255;0;0m║
echo                                                                  !e![38;2;255;0;0m║    !e![38;2;255;200;0m╚███╔███╔╝██║ ╚████║███████║██║  ██║    !e![38;2;255;0;0m║
echo                                                                  !e![38;2;255;0;0m║    !e![38;2;255;250;0m ╚══╝╚══╝ ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝    !e![38;2;255;0;0m║
echo                                                                  !e![38;2;255;0;0m║                                            ║
echo                                                                  !e![38;2;255;0;0m╚════════════════════════════════════════════╝
exit /b 0

:initloop
set /p i0=<io.txt
exit /b 0