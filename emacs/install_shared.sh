#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

         EMACS_HOME="${HOME:?}/.emacs.d"
DOTFILES_EMACS_SRCS="$DOTFILES_INSTALL_SRCS/emacs"

rm    -rf "$EMACS_HOME/init/init-shared.el"
mkdir -p  "$EMACS_HOME/init"
cp        "$DOTFILES_EMACS_SRCS/init-shared.el" \
          "$EMACS_HOME/init/init-shared.el"
