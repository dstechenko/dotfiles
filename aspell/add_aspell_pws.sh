#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

FILE=$1
WORD=$2

WORDS=$((echo $WORD && tail -n +2 $FILE) | uniq | sort)

echo "personal_ws-1.1 en $(echo $WORDS | wc -w)" >  $FILE
echo $WORDS | xargs -n1                          >> $FILE
