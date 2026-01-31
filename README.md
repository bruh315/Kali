This is a kali linux simulator written in batch.
So far there are some bugs, and it is not finished.
This script is also compatible with only W10/W11.

Notes:
1: 
   This is just for fun, not really practicale

2: 
   if you see text like [38;2;X;X;Xm, that means 
   ANSI escape codes aren't registering
   To turn them on open up a command prompt 
   and type the command:
      reg add "HKCU/Console" /v "VirtualTerminalLevel" /t REG_DWORD /d 1 /f
   and restart the batch file.
