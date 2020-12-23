#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm    -rf "${HOME:?}/.config/kitty"
mkdir -p  "${HOME:?}/.config/kitty"
cp        "$DOTFILES_KITTY_SRCS/kitty_shared.conf" \
          "${HOME:?}/.config/kitty"

if [[ "$OSTYPE" == "darwin"* ]]; then
    cp "$DOTFILES_KITTY_SRCS/kitty_darwin.conf" \
       "${HOME:?}/.config/kitty/kitty.conf"
else
    cp "$DOTFILES_KITTY_SRCS/kitty_linux.conf" \
       "${HOME:?}/.config/kitty/kitty.conf"
fi
