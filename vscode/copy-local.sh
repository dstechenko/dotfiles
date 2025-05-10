#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

VSCODE_DIR=$(realpath $(dirname  "$0"))

cp ${HOME:?}/Library/Application\ Support/*Code*/User/settings.json    "${VSCODE_DIR}"
cp ${HOME:?}/Library/Application\ Support/*Code*/User/keybindings.json "${VSCODE_DIR}"
