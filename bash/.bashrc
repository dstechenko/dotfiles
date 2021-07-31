# .bashrc
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

# Check if we need to exit non-interactive shells
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# Keep oodles of command history
HISTFILESIZE=-1
HISTSIZE=1000000
shopt -s histappend

# Export environment variables, aliases
export   TERM="xterm-256color"
export EDITOR="emacsclient -c -n --alternate-editor="
export VISUAL="$EDITOR"
export    PS1="[$HOSTNAME]\$ "
export LC_ALL="en_US.UTF-8"
export   LANG="en_US.UTF-8"

alias  editor="$EDITOR"
alias  pifind="
    sudo watch -c -t -n 2 '
         arp -a | cut -f1 -d \" \" | grep -v ? ;
         arp-scan -l -g | grep -i -m 1 raspberry | cut -f1 | xargs -r ping -q -c 1 >> /dev/null'"
