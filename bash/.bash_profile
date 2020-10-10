# .bash_profile
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

# Source local definitions
if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi

# Export environment variables, start background programs, etc.
export   TERM="xterm-256color"
export EDITOR="emacs"
export VISUAL="$EDITOR"
export    PS1="$ "
export LC_ALL="en_US.UTF-8"
export   LANG="en_US.UTF-8"
