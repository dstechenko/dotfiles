#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

CALL_DIR=$(pwd)
DOTFILES_INSTALL_SRCS=$(dirname "$0")

cd "$DOTFILES_INSTALL_SRCS"
DOTFILES_INSTALL_SRCS=$(pwd -P)

DOTFILES_EMACS_SRCS="$DOTFILES_INSTALL_SRCS/emacs"

git pull origin master

# shellcheck source=/dev/null
source "$DOTFILES_EMACS_SRCS/install_shared.sh"

cd "$CALL_DIR"
