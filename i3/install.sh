#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm    -rf "${HOME:?}/.config/i3"
mkdir -p  "${HOME:?}/.config/i3"
cp        "$DOTFILES_I3_SRCS/config" \
          "${HOME:?}/.config/i3"
cp        "$DOTFILES_I3_SRCS/i3status.conf" \
          "${HOME:?}/.config/i3"
