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

# Aliases
