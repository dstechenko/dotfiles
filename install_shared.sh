#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

             CALL_DIR=$(pwd)
DOTFILES_INSTALL_SRCS=$(dirname  "$0")
DOTFILES_INSTALL_SRCS=$(realpath "$DOTFILES_INSTALL_SRCS")

DOTFILES_EMACS_SRCS="$DOTFILES_INSTALL_SRCS/emacs"

cd "$DOTFILES_INSTALL_SRCS"
git pull origin master

# shellcheck source=/dev/null
source "$DOTFILES_EMACS_SRCS/install_shared.sh"

cd "$CALL_DIR"
