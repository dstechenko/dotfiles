@echo off
start "Emacs" wsl.exe $(wslpath -u "$(wslvar USERPROFILE)/Apps/Emacs.sh")
exit
