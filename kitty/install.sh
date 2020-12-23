#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm    -rf "${HOME:?}/.config/kitty"
mkdir -p  "${HOME:?}/.config/kitty"
cp        "$DOTFILES_KITTY_SRCS"/*.conf \
          "${HOME:?}/.config/kitty"
if [[ "$OSTYPE" == "darwin"* ]]; then
    mv        "${HOME:?}/.config/kitty/kitty_darwin.conf" \
              "${HOME:?}/.config/kitty/kitty.conf"
else
    mv        "${HOME:?}/.config/kitty/kitty_linux.conf" \
              "${HOME:?}/.config/kitty/kitty.conf"
fi
