#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm -rf "${HOME:?}/.tmux.conf"
cp     "${INSTALL_SRCS:?}/tmux/.tmux.conf" \
       "${HOME:?}/.tmux.conf"
