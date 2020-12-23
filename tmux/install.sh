#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm -rf "${HOME:?}/.tmux.conf"
cp     "$DOTFILES_TMUX_SRCS/.tmux.conf" \
       "${HOME:?}/.tmux.conf"
