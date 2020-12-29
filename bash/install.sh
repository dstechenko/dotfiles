#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm -rf "${HOME:?}/.bashrc"
cp     "$INSTALL_SRCS/bash/.bashrc" \
       "${HOME:?}/.bashrc"

rm -rf "${HOME:?}/.bash_profile"
cp     "$INSTALL_SRCS/bash/.bash_profile" \
       "${HOME:?}/.bash_profile"

echo "# Auto-generated section"                    >> "${HOME:?}/.bashrc"
echo "alias dotfiles=\"$INSTALL_SRCS/install.sh\"" >> "${HOME:?}/.bashrc"
