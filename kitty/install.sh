#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm    -rf "${HOME:?}/.config/kitty"
mkdir -p  "${HOME:?}/.config/kitty"
cp        "$INSTALL_SRCS/kitty/kitty_shared.conf" \
          "${HOME:?}/.config/kitty"

if [[ "$OSTYPE" == "darwin"* ]]; then
    cp "$INSTALL_SRCS/kitty/kitty_darwin.conf" \
       "${HOME:?}/.config/kitty/kitty.conf"
else
    cp "$INSTALL_SRCS/kitty/kitty_linux.conf" \
       "${HOME:?}/.config/kitty/kitty.conf"
fi
