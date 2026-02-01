@echo off
setlocal enabledelayedexpansion
chcp 65001>nul

set "e="
call :initloop
call :whtsapp
:main

call :initloop
set "n="
echo !pl1!
set /p n="!pl2!"

if /I "!n!" == "" (
	echo.
	goto main
)

echo !n!>>hs.txt

if /I "!n!" == "help" (
	echo !i0!╔══════════════════╦═══════════════════════════════════════════════════════════╗!i0!╔══════════════════╦═══════════════════════════════════════════════════════════╗
	echo !i0!║     Command      ║ Action                                                    ║!i0!║     NetCmd       ║ Action                                                    ║
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣
	echo !i0!║     Clear        ║ Clears the terminal buffer                                ║!i0!║     conscan      ║ Scans for processes that have a connection over TCP       ║
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣
	echo !i0!║     pwd          ║ Prints the working directory                              ║!i0!║     ipscan ^<sn^>  ║ Scans for IP addresses on the subnet sn                   ║
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!╚══════════════════╩═══════════════════════════════════════════════════════════╝
	echo !i0!║     cd ^<dir^>     ║ Goes to the following directory                           ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     ping ^<ip^>    ║ Checks the network status of a host                       ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     webhook      ║ Sends a message to a discord webhook                      ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     neofetch     ║ Displays certain system information                       ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     touch ^<name^> ║ Creates a file with the specified name                    ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     cat ^<name^>   ║ Displayes the contents of a file                          ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     whoami       ║ Shows hostname and user account                           ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     hostname     ║ Shows hostname                                            ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     exit         ║ Exits out of shell                                        ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     history      ║ Shows command history                                     ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║    flush history ║ Flushes the history                                       ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     ls           ║ Lists directory contents                                  ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     mkdir ^<dir^>  ║ Creates a directory                                       ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     rmdir ^<dir^>  ║ Removes a directory                                       ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     sleep ^<time^> ║ Sleeps for a specified amount                             ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     cp ^<f1^> ^<f2^> ║ Copies f1 into f2                                         ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     rm ^<file^>    ║ Deletes the file                                          ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     ps x         ║ Lists running processes                                   ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     ifconfig     ║ Displays IP configs                                       ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     uptime       ║ Displays the time of system boot and current time         ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║     echo         ║ Echoes text                                               ║!i0!
	echo !i0!╠══════════════════╬═══════════════════════════════════════════════════════════╣!i0!
	echo !i0!║    nc -l -p port ║ Listens on a sertain port ^(tcp^)                           ║!i0!
	echo !i0!╚══════════════════╩═══════════════════════════════════════════════════════════╝!i0!
)

if /I "!n!" == "clear" (
	cls
	echo.
	goto main
)

if /I "!n!"=="pwd" (
	echo !i0!!e![0m!kpth!
	goto main
)
if /I "!n:~0,3!" == "cd " (
	if "!n:~3!"==".." (
		cd ..
		goto main
	)
	if "!n:~3!" == "." (
		goto main
	)
	:: Convert linux path into windows-style path
	set "pls=!n:~3!"
	set "pls=!pls:/mnt/c=C:!"
	set "pls=!pls:/mnt/d=D:!"
	set "pls=!pls:/mnt/e=E:!"
	set "pls=!pls:/mnt/f=F:!"
	set "pls=!pls:/mnt/z=Z:!"
	set "pls=!pls:/=\!"
	set "pls=!pls:./=!"
	:: Actually change the directory
	cd !pls!
	goto main
)
if /I "!n:~0,5!"=="ping " (
	for /f "tokens=* delims=" %%a in ('!n!') do (
		echo !i0!%%a
	)
	goto main 
)

if /I "!n!" == "webhook" (
	set /p wbu=".!i0:~1!!e![38;2;0;127;255mEnter Webhook URL: !e![38;2;0;255;0m"
	set /p msw=".!i0:~1!!e![38;2;0;127;255mEnter Message: !e![38;2;0;255;0m"
	
	curl -H "Content-Type: application/json" -d "{\"content\":\"!msw!\"}" "!wbu!" -s > nul 2>&1
	if "!errorlevel!" == "0" (
		echo !i0!!e![38;2;0;255;0m[+] Successfully sent webhook message!
		goto main
	)
	echo !i0!!e![38;2;255;0;0m[-] A failure has happened, [DEBUG: Exit code !errorlevel!]
	goto main
)

if /I "!n!" == "neofetch" (
	call :nfb
	goto main
)

if /I "!n:~0,6!" == "touch " (
	set "prf=!n:~6!"
	set "prf=!prf:/mnt/c=C:!"
	set "prf=!prf:/mnt/d=D:!"
	set "prf=!prf:/mnt/e=E:!"
	set "prf=!prf:/mnt/f=F:!"
	set "prf=!prf:/mnt/z=Z:!"
	set "prf=!prf:/=\!"
	set "prf=!prf:./=!"
	<nul set /p=>!prf!
	goto :main
)

if /I "!n:~0,4!" == "cat " (
	set "prfc=!n:~4!"
	set "prfc=!prfc:/mnt/c=C:!"
	set "prfc=!prfc:/mnt/d=D:!"
	set "prfc=!prfc:/mnt/e=E:!"
	set "prfc=!prfc:/mnt/f=F:!"
	set "prfc=!prfc:/mnt/z=Z:!"
	set "prfc=!prfc:/=\!"
	set "prfc=!prfc:./=!"
	set "prfc=!prfc:"=!"
	for /f "tokens=* delims=" %%a in ('type "!prfc!"') do (
		echo !i0!%%a
	)
	goto main 
)

if /I "!n!" == "whoami" (
	for /f "tokens=* delims=" %%a in ('whoami') do (
		echo !i0!%%a
	)
	goto main 
)

if /I "!n!" == "hostname" (
	echo !i0!!hostname!
	goto main
)

if /I "!n!" == "exit" (
	exit
)

if /I "!n!" == "history" (
	if not exist "hs.txt" (
		echo.>>hs.txt
	)
	for /f "tokens=* delims=" %%a in ('type "hs.txt"') do (
		echo !i0!%%a
	)
	goto main
)

if /I "!n!" == "flush history" (
	if exist "hs.txt" (
		del "hs.txt"
	)
	goto main
)

if /I "!n!" == "ls" (
	for /f "tokens=* delims=" %%a in ('dir') do (
		echo !i0!%%a
	)
	goto main
)

if /I "!n!" == "netshell" (
	if not exist "wns.bat" (
		echo !i0!Netshell extension not installed.
		goto main
	)
	start "" "wns.bat"
	goto main
)

if /I "!n:~0,6!" == "mkdir" (
	set "plsm=!n:~6!"
	set "plsm=!plsm:/mnt/c=C:!"
	set "plsm=!plsm:/mnt/d=D:!"
	set "plsm=!plsm:/mnt/e=E:!"
	set "plsm=!plsm:/mnt/f=F:!"
	set "plsm=!plsm:/mnt/z=Z:!"
	set "plsm=!plsm:/=\!"
	set "plsm=!plsm:./=!"
	mkdir !plsm!
	goto main
)
if /I "!n:~0,6!" == "rmdir" (
	set "plsrd=!n:~6!"
	set "plsrd=!plsrd:/mnt/c=C:!"
	set "plsrd=!plsrd:/mnt/d=D:!"
	set "plsrd=!plsrd:/mnt/e=E:!"
	set "plsrd=!plsrd:/mnt/f=F:!"
	set "plsrd=!plsrd:/mnt/z=Z:!"
	set "plsrd=!plsrd:/=\!"
	set "plsrd=!plsrd:./=!"
	rmdir !plsrd!
	goto main
)

if /I "!n:~0,6!" == "sleep " (
	timeout /t !n:~6! > nul 2>&1
	goto main
)

if /I "!n:~0,3!" == "cp " (
	set "plsc=!n:~3!"
	set "plsc=!plsc:/mnt/c=C:!"
	set "plsc=!plsc:/mnt/d=D:!"
	set "plsc=!plsc:/mnt/e=E:!"
	set "plsc=!plsc:/mnt/f=F:!"
	set "plsc=!plsc:/mnt/z=Z:!"
	set "plsc=!plsc:/=\!"
	set "plsc=!plsc:./=!"
	copy /b !plsc!
	goto main
)
	
if /I "!n:~0,3!" == "rm " (
	set "prm=!n:3!"
	set "prm=!prm:/mnt/c=C:!"
	set "prm=!prm:/mnt/d=D:!"
	set "prm=!prm:/mnt/e=E:!"
	set "prm=!prm:/mnt/f=F:!"
	set "prm=!prm:/mnt/z=Z:!"
	set "prm=!prm:/=\!"
	set "prm=!prm:./=!"
	del !prm!
	goto main
)

if /I "!n!" == "ls -R" (
	for /f "tokens=* delims=" %%a in ('dir /s') do (
		echo !i0!%%a
	)
	goto main
)

if /I "!n!" == "ls --recursive" (
	for /f "tokens=* delims=" %%a in ('dir /s') do (
		echo !i0!%%a
	)
	goto main
)

if /I "!n!" == "ps x" (
	for /f "tokens=* delims=" %%a in ('tasklist') do (
		echo !i0!%%a
	)
	goto main
)

if /I "!n!" == "ifconfig" (
	for /f "tokens=* delims=" %%a in ('ipconfig') do (
		echo !i0!%%a
	)
	goto main
)

if /I "!n!" == "uptime" (
	for /f "tokens=* delims=" %%a in ('systeminfo ^| find "System Boot Time:          "') do (
		set "bt=%%a"
		set "bt=!bt:System=!"
		set "bt=!bt:Boot=!"
		set "bt=!bt:Time=!"
		set "bt=!bt: =!"
	)
	echo !i0!Startup: !bt!
	echo !i0!Current time: !time!
	goto main
)

if /I "!n!" == "ifconfig -a" (
	ipconfig /all
	goto main
)

if /I "!n:~0,5!" == "echo " (
	set "text=!n:~6!"
	set "text=!text:0!"
	echo !text!
	goto main
)

if /I "!n:~0,9!" == "nc -l -p " (
	set "port=!n:~9!"
	powershell -Command "$listener = [System.Net.Sockets.TcpListener]::new([System.Net.IPAddress]::Any, !port!); $listener.Start(); $client = $listener.AcceptTcpClient(); $stream = $client.GetStream(); $reader = New-Object System.IO.StreamReader($stream); while ($true) { $input = $reader.ReadLine(); if ($input -eq $null) { break }; Write-Host 'Client: ' $input; } $client.Close(); $listener.Stop(); "
	goto main
)
if /I "!n:~0,5!" == "grep " (
	set "file=!n:~5!"
	set /p srch="!e![38;2;0;255;127mEnter search string: !e![38;2;0;255;255m"
	type "!file!" | findstr /I "!srch!"
)

if /I "!n:~0,4!" == "man " (
	if /I "!n:~4!" == "help" (
		echo help - Displays most cmomands that are available.
		goto main
	)
	if /I "!n:~4!" == "clear" (
		echo clear - Clears the console buffer
		goto main
	)
	if /I "!n:~4!" == "pwd" (
		echo pwd - Prints the working directory
		goto main
	)
	if /I "!n:~4!" == "cd" (
		echo cd [DM] - Changes the working directory to [DM]
		goto main
	)
	if /I "!n:~4!" == "ping" (
		echo ping [IP/Hostname] - Checks if a server is up ^(ICMP^)
		goto main
	)
	if /I "!n:~4!" == "webhook" (
		echo webhook - Gets a webhook URL and a message, sends it.
		goto main
	)
	if /I "!n:~4!" == "neofetch" (
		echo neofetch - Displays system information
		goto main
	)
	if /I "!n:~4!" == "touch" (
		echo touch [FN] - Creates an empty file with the name of [FN]
		goto main
	)
	if /I "!n:~4!" == "cat" (
		echo cat [FN] - Displays the contents of a file with the name of [FN]
		goto main
	)
	if /I "!n:~4!" == "whoami" (
		echo whoami - Displays the hostname and user account
		goto main
	)
	if /I "!n:~4!" == "hostname" (
		echo hostname - Displays the hostname of the computer
		goto main
	)
	if /I "!n:~4!" == "history" (
		echo history - Displays the command history
		goto main
	)
	if /I "!n:~4!" == "flush history" (
		echo flush history - Flushes the command history
		goto main
	)
	if /I "!n:~4!" == "ls" (
		echo ls - Lists the files and directories in the working directory
		echo ls -R - Lists the files recursively
		echo ls --recursive - Lists the files recursively
		goto main
	)
	if /I "!n:~4!" == "mkdir" (
		echo mkdir [DM] - Makes a directory with the name of [DM]
		goto main
	)
	if /I "!n:~4!" == "rmdir" (
		echo rmdir [DM] - Removes a directory with the name of [DM]
		goto main
	)
	if /I "!n:~4!" == "sleep" (
		echo sleep [TIME] - Sleep for [TIME] seconds
		goto main
	)
	if /I "!n:~4!" == "rm" (
		echo rm [FN] - Removes a the file [FN]
		goto main
	)
	if /I "!n:~4!" == "cp" (
		echo cp [FN1] [FN2] - Copies the contents of the file [FN1] into [FN2]
		echo Note: The cp command copies the file byte for byte, in a binary format
		echo       This isn't an issue with text files thought
		goto main
	)
	if /I "!n:~4!" == "ps x" (
		echo ps x - Lists the current running processes
		goto main
	)
	if /I "!n:~4!" == "ifconfig" (
		echo ifconfig - Lists information about local adapter configurations
		goto main
	)
	if /I "!n:~4!" == "uptime" (
		echo uptime - Displays the time of the system boot, and the current time
		goto main
	)
	if /I "!n:~4!" == "nc -l -p" (
		echo nc -l -p [PORT] - Listens on TCP on port [PORT]
		goto main
	)
	if /I "!n:~4!" == "grep" (
		echo grep [FN] - Asks for search string, finds the string in a file
		goto main
	)
)

if /I "!n!" == "" goto main
echo !i0!Unknown command: !n!.>&2
goto main

:initloop
set "nfi=          "
set /p i0=<io.txt
for /f "tokens=* delims=" %%a in ('hostname') do (
	set "hostname=%%a"
)
set "kpth=!cd!"
set "kpth=!kpth:\=/!"
set "kpth=!kpth:C:=/mnt/c!"
set "kpth=!kpth:D:=/mnt/d!"
set "kpth=!kpth:E:=/mnt/e!"
set "kpth=!kpth:F:=/mnt/f!"
set "kpth=!kpth:Z:=/mnt/z!"
set "pl1=!i0!!e![38;2;39;181;34m┌──(!e![38;2;59;120;255m!username!㉿!hostname!!e![38;2;39;181;34m)-[!e![38;2;0;255;180m!kpth!!e![38;2;39;181;34m]"
set "pl2=.!i0:~1!!e![38;2;39;181;34m└─!e![38;2;59;120;255m$ !e![38;2;0;255;180m"
exit /b 0

:whtsapp
echo.
echo !i0!!e![38;2;39;181;34mKali Linux Simulator
echo !i0!Made by:  alexsome1
set /p=".!i0:~1!Press enter to continue !e![0m"
mode 175, 75
cls
echo.
goto :main

:nfb
set "lp=!userprofile!"
set "lp=!lp:\=/!"
set "lp=!lp:C:=/mnt/c!"
set "lp=!lp:D:=/mnt/d!"
set "lp=!lp:E:=/mnt/e!"
set "lp=!lp:F:=/mnt/f!"
set "lp=!lp:Z:=/mnt/z!"
echo !e![38;2;255;0;0m!i0!░▒▓██████████████████████▓▒░ ░▒▓█████████▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░░▒▓██████████▓▒░▒▓█▓▒░!nfi! ██  Processor: !PROCESSOR_IDENTIFIER!
echo !e![38;2;255;10;0m!i0!░▒▓█▓▒░░░░░░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░       ░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░!nfi!██  Windows Directory: !windir!
echo !e![38;2;255;20;0m!i0!░▒▓█▓▒░░░░░░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░       ░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░!nfi!██  Computer Name: !COMPUTERNAME!
echo !e![38;2;255;30;0m!i0!░▒▓█▓▒░░░░░░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░       ░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░!nfi!██  OS: Windows
echo !e![38;2;255;40;0m!i0!░▒▓█▓▒░░░░░░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░       ░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░!nfi!██  Processor Architecture: !PROCESSOR_ARCHITECTURE!
echo !e![38;2;255;50;0m!i0!░▒▓█▓▒░░░░░░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░       ░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░!nfi!██  User directory: !userprofile!
echo !e![38;2;255;60;0m!i0!░▒▓█▓▒░░░░░░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░       ░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░!nfi!██  Linux path: !lp!
echo !e![38;2;255;70;0m!i0!░▒▓█▓▒░░░░░░▒▓█▓▒░░░░░░▒▓█▓▒░░▒▓████████▓▒░░▒▓████████████▓▒░▒▓████████████▓▒░▒▓█▓▒░!nfi!██  Hostname: !hostname!
echo !e![38;2;255;80;0m!i0!░▒▓█▓▒░░░░░░▒▓█▓▒░░░░░░▒▓█▓▒░      ░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░!nfi!██
echo !e![38;2;255;90;0m!i0!░▒▓█▓▒░░░░░░▒▓█▓▒░░░░░░▒▓█▓▒░      ░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░!nfi!██
echo !e![38;2;255;100;0m!i0!░▒▓█▓▒░░░░░░▒▓█▓▒░░░░░░▒▓█▓▒░      ░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░!nfi!██ 
echo !e![38;2;255;110;0m!i0!░▒▓█▓▒░░░░░░▒▓█▓▒░░░░░░▒▓█▓▒░      ░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░!nfi!██
echo !e![38;2;255;120;0m!i0!░▒▓█▓▒░░░░░░▒▓█▓▒░░░░░░▒▓█▓▒░      ░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░!nfi!██
echo !e![38;2;255;130;0m!i0!░▒▓█▓▒░░░░░░▒▓█▓▒░░░░░░▒▓█▓▒░      ░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░!nfi!██
echo !e![38;2;255;140;0m!i0!░▒▓█▓▒░░░░░░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█████████▓▒░░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓█▓▒░░░░░░▒▓█▓▒░▒▓████████▓▒░!nfi:~7!██
echo !e![38;2;255;150;0m!i0!                                                                                    !nfi!██
echo !e![38;2;255;160;0m!i0!      @@@@@                                                                         !nfi!██  !e![48;2;140;140;140m                                !e![0m
echo !e![38;2;255;170;0m!i0!     @     @      AAA   L       EEEEEE X     X SSSSS OOOOOO M      M EEEEEE   111   !nfi!██  !e![48;2;200;200;200m !e![48;2;170;170;170m     !e![48;2;0;120;215m                    !e![48;2;200;200;200m      !e![0m
echo !e![38;2;255;180;0m!i0!    @  @@@  @    AA AA  L       E      XX   XX S     O    O MMM  MMM E       11 1   !nfi!██  !e![48;2;200;200;200m      !e![48;2;0;120;215m                    !e![48;2;170;170;170m     !e![48;2;200;200;200m !e![0m
echo !e![38;2;255;190;0m!i0!    @ @   @ @    A   A  L       E       XX XX  S     O    O M MMMM M E       1  1   !nfi!██  !e![48;2;200;200;200m !e![48;2;170;170;170m     !e![48;2;0;120;215m                    !e![48;2;200;200;200m      !e![0m
echo !e![38;2;255;200;0m!i0!    @ @   @ @   AA   AA L       EEEEEE    XX   SSSSS O    O M  MM  M EEEEEE     1   !nfi!██  !e![48;2;200;200;200m      !e![48;2;0;120;215m                    !e![48;2;170;170;170m     !e![48;2;200;200;200m !e![0m
echo !e![38;2;255;210;0m!i0!    @  @@@@@    AAAAAAA L       E       XX XX      S O    O M      M E          1   !nfi!██  !e![48;2;200;200;200m !e![48;2;170;170;170m     !e![48;2;0;120;215m                    !e![48;2;200;200;200m      !e![0m
echo !e![38;2;255;220;0m!i0!     @       @  A     A L       E      XX   XX     S O    O M      M E          1   !nfi!██  !e![48;2;200;200;200m      !e![48;2;0;120;215m                    !e![48;2;170;170;170m     !e![48;2;200;200;200m !e![0m
echo !e![38;2;255;230;0m!i0!      @@@@@@@   A     A LLLLLLL EEEEEE X     X SSSSS OOOOOO M      M EEEEEE    111  !nfi!██  !e![48;2;140;140;140m                                !e![0m
echo !e![38;2;255;240;0m!i0!                                                                                    !nfi!██  
echo.
exit /b0
