# .bashrc
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

# Check if we need to exit non-interactive shells
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# Set path if managed by path helper
if [ -x /usr/libexec/path_helper ]; then
  eval "$(/usr/libexec/path_helper)"
fi

# Keep oodles of command history
HISTFILESIZE=-1
HISTSIZE=1000000
shopt -s histappend

# Add scripts to execute on demand
export PATH="${HOME:?}/scripts:${PATH}"
export PATH="/opt/homebrew/bin:${PATH}"

# Export environment variables, aliases
export   TERM="xterm-256color"
export EDITOR="emacs -nw"
export VISUAL="$EDITOR"
export    PS1="[$HOSTNAME]\$ "
export LC_ALL="en_US.UTF-8"
export   LANG="en_US.UTF-8"

# Prevent MacOS from whining about bash for now
export BASH_SILENCE_DEPRECATION_WARNING=1

alias edit="$EDITOR"
