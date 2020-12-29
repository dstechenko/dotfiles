#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm -rf "${HOME:?}/.config/gtk-"*
cp -r  "$INSTALL_SRCS/gtk/gtk-"* \
       "${HOME:?}/.config/"
