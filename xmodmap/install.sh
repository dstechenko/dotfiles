#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

xmodmap -pke > "${HOME:?}/.Xmodmap"

echo "! Auto-generated section"               >> "${HOME:?}/.Xmodmap"
cat  "$INSTALL_SRCS/xmodmap/xmodmap_override" >> "${HOME:?}/.Xmodmap"
