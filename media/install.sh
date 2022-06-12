#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm -rf "${HOME:?}/Pictures/wallpaper.jpg"
cp     "$INSTALL_SRCS/media/wallpaper.jpg" \
       "${HOME:?}/Pictures/wallpaper.jpg"

rm -rf "${HOME:?}/Pictures/profile.jpg"
cp     "$INSTALL_SRCS/media/profile.jpg" \
       "${HOME:?}/Pictures/profile.jpg"
