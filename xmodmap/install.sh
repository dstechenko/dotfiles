#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm -rf "${HOME:?}/.xinitrc"
rm -rf "${HOME:?}/.xsession"
cp     "$INSTALL_SRCS/xinitrc/.xinitrc" \
       "${HOME:?}/.xinitrc"
ln -s  "${HOME:?}/.xinitrc" \
       "${HOME:?}/.xsession"

xmodmap -pke > "${HOME:?}/.Xmodmap"

echo "! Auto-generated section"               >> "${HOME:?}/.Xmodmap"
cat  "$INSTALL_SRCS/xmodmap/xmodmap_override" >> "${HOME:?}/.Xmodmap"
