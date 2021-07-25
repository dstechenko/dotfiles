#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

CONEMU_SRCS=$(dirname  "$0")
CONEMU_SRCS=$(realpath "$CONEMU_SRCS")

cp /mnt/c/Users/Dmytro/AppData/Roaming/ConEmu.xml "$CONEMU_SRCS"
