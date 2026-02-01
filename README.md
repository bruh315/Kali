This is a (Kali) Linux terminal simulator, 
it is ironically written in the Windows batch scripting language
and currently it has some bugs.

I'm also making a recon-ish extension to this called Wns
you can type the command netshell to access it from the terminal

Notes:

If you see text like [38;2;X;X;Xm
You might have some registery settings set up in a way that the script doesn't handle.

To fix it, open a command prompt window and type the command:
   reg add "HKCU\Console" /v "VirtualTerminalLevel" /t REG_DWORD /d 1 /f
This command changes the registery to treat those characters as colors.


You can also set a custom "indentation" level
to indent everything the scripts outputs
To do that just go into the io.txt file and put as much spaces as you wish
Default is 3, make sure the io.txt file is in the same folder as the Wns script file (If you have installed it)
And the Kali script file
