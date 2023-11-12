#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm -rf "${HOME:?}/.config/alacritty/alacritty.toml"
cp     "$INSTALL_SRCS/alacritty/alacritty.toml" \
       "${HOME:?}/.config/alacritty/alacritty.toml"
