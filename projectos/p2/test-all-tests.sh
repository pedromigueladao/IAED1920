#!/bin/bash
#
# File:  test_all_tests.sh
# Author:  mikolas
# Created on:  Wed May 6 09:27:21 WEST 2020
# Copyright (C) 2020, Mikolas Janota
#

RED='\033[0;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'
if [ $# -lt 1 ] ; then
    echo "Usage: $0 <src-file1> <src-file2> ..."
    echo "Example: ${0} *.c"
    exit 1
fi


for d in `ls -d testes-*`
do
    echo "testing $d"
    if DO_NOT_TIME=1 ./test.sh  "$d" $* >/dev/null
    then
        echo -n -e "${GREEN}${d} PASSED!\n${NC}"
     else
        echo -n -e "${RED}${d} FAILURE!\n${NC}"
    fi
done
