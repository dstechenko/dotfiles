#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm -rf "${HOME:?}/Pictures/wallpaper.png"
cp     "$INSTALL_SRCS/media/wallpaper.png" \
       "${HOME:?}/Pictures/"

rm -rf "${HOME:?}/Pictures/profile.jpg"
cp     "$INSTALL_SRCS/media/profile.jpg" \
       "${HOME:?}/Pictures/"
