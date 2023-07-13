#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm -rf "${HOME:?}/Pictures/wallpaper.*"
cp     "$INSTALL_SRCS/media/wallpaper.*" \
       "${HOME:?}/Pictures/"

rm -rf "${HOME:?}/Pictures/profile.*"
cp     "$INSTALL_SRCS/media/profile.*" \
       "${HOME:?}/Pictures/"
