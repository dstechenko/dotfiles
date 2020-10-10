#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

         EMACS_HOME="$HOME/.emacs.d"
DOTFILES_EMACS_SRCS="$DOTFILES_INSTALL_SRCS/emacs"

rm -rf "$EMACS_HOME"

# shellcheck source=/dev/null
source "$DOTFILES_EMACS_SRCS/install_shared.sh"

cp "$DOTFILES_EMACS_SRCS/init.el" \
   "$EMACS_HOME/init.el"
