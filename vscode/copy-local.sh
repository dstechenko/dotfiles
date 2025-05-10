#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

  CALL_DIR=$(pwd)
VSCODE_DIR=$(realpath $(dirname  "$0"))

cp ~/Library/Application\ Support/*Code*/User/settings.json    "${VSCODE_DIR}"
cp ~/Library/Application\ Support/*Code*/User/keybindings.json "${VSCODE_DIR}"

cd "${CALL_DIR}"
