#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm -rf "${HOME:?}/.config/alacritty/alacritty.yml"
cp     "$INSTALL_SRCS/alacritty/alacritty.yml" \
       "${HOME:?}/.config/alacritty/alacritty.yml"
