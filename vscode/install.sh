#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

  CALL_DIR=$(pwd)
VSCODE_DIR=$(realpath $(dirname  "$0"))

cp "$INSTALL_SRCS/vscode/settings.json"    ${HOME:?}/Library/Application\ Support/*Code*/User/
cp "$INSTALL_SRCS/vscode/keybindings.json" ${HOME:?}/Library/Application\ Support/*Code*/User/

cd "${CALL_DIR}"