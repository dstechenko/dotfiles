#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

INSTALL_SRCS=$(realpath   $(dirname  "$0"))
USER_PROFILE=$(wslpath -u $(wslvar USERPROFILE))

# copy terminal settings
cp ${USER_PROFILE}/AppData/Local/Packages/Microsoft.WindowsTerminal_*/LocalState/settings.json \
   ${INSTALL_SRCS}/settings.json
