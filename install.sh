#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

    CALL_DIR=$(pwd)
INSTALL_SRCS=$(dirname  "$0")
INSTALL_SRCS=$(realpath "$INSTALL_SRCS")

cd "$INSTALL_SRCS"

git pull origin master

# shellcheck source=/dev/null
source "$INSTALL_SRCS/emacs/install.sh"

# shellcheck source=/dev/null
source "$INSTALL_SRCS/kitty/install.sh"

# shellcheck source=/dev/null
source "$INSTALL_SRCS/bash/install.sh"

# shellcheck source=/dev/null
source "$INSTALL_SRCS/git/install.sh"

# shellcheck source=/dev/null
source "$INSTALL_SRCS/tmux/install.sh"

# shellcheck source=/dev/null
source "$INSTALL_SRCS/i3/install.sh"

# shellcheck source=/dev/null
source "$INSTALL_SRCS/xinitrc/install.sh"

# shellcheck source=/dev/null
source "$INSTALL_SRCS/Xresources/install.sh"

# shellcheck source=/dev/null
source "$INSTALL_SRCS/gtk/install.sh"

cd "$CALL_DIR"
