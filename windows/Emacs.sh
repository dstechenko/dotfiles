#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

cd

export               DISPLAY=$(ip route | head -n 1 | cut -d ' ' -f3):0
export LIBGL_ALWAYS_INDIRECT=1
export             GDK_SCALE=1

emacsclient -c -n --alternate-editor=
