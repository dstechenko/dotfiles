#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm    -rf "${HOME:?}/.config/kitty"
mkdir -p  "${HOME:?}/.config/kitty"
cp        "$DOTFILES_KITTY_SRCS/kitty.conf" \
          "${HOME:?}/.config/kitty/kitty.conf"
