# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# Exports
export    PS1="$ "
export LC_ALL=en_US.UTF-8
export   LANG=en_US.UTF-8

# Aliases
alias    pip3="python3 -m pip"
alias     emc="emacs -nw"
alias  rcstat="rclone sync --dry-run ~/Documents gdrive:/"
alias  rcpush="rclone sync ~/Documents gdrive:/"
alias  rcpull="rclone copy gdrive:/ ~/Documents"
