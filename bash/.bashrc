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
export PATH="${HOME:?}/Scripts:${PATH}"
export PATH="/opt/homebrew/bin:${PATH}"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Export environment variables, aliases
export     TERM="xterm-256color"
export COLORTERM="truecolor"
export    EDITOR="emacs -nw"
export    VISUAL="$EDITOR"
export    LC_ALL="en_US.UTF-8"
export      LANG="en_US.UTF-8"

# Prompt colors
R='\[\e[38;2;255;100;100m\]'
G='\[\e[38;2;100;255;100m\]'
B='\[\e[38;2;100;100;255m\]'
W='\[\e[0m\]'

# Prompt
if [ $(id -u) -eq 0 ];
then
  export PS1="$W[$R\j$W] $G\u$W@$B\h$W# "
else
  export PS1="$W[$R\j$W] $G\u$W@$B\h$W$ "
fi

# Prevent MacOS from whining about bash for now
export BASH_SILENCE_DEPRECATION_WARNING=1

alias edit="$EDITOR"
