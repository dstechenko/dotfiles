#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

    CALL_DIR=$(pwd)
INSTALL_SRCS=$(realpath $(dirname  "$0"))

cd "$INSTALL_SRCS"

git pull origin master

# shellcheck source=/dev/null
source "$INSTALL_SRCS/emacs/install.sh"

# shellcheck source=/dev/null
source "$INSTALL_SRCS/bash/install.sh"

# shellcheck source=/dev/null
source "$INSTALL_SRCS/git/install.sh"

# shellcheck source=/dev/null
source "$INSTALL_SRCS/tmux/install.sh"

# shellcheck source=/dev/null
source "$INSTALL_SRCS/alacritty/install.sh"

# shellcheck source=/dev/null
source "$INSTALL_SRCS/media/install.sh"

cd "$CALL_DIR"
