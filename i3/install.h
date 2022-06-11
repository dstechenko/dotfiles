#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm    -rf "${HOME:?}/.config/i3"
mkdir -p  "${HOME:?}/.config/i3"
cp        "$INSTALL_SRCS/i3/config" \
          "${HOME:?}/.config/i3"
cp        "$INSTALL_SRCS/i3/i3status.conf" \
          "${HOME:?}/.config/i3"
