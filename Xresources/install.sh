#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm -rf "${HOME:?}/.Xresources"
cp     "$INSTALL_SRCS/Xresources/.Xresources" \
       "${HOME:?}/.Xresources"
