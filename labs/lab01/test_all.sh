#!/bin/bash
#
# File:  test_all.sh
# Author:  mikolas
# Created on:  Mon Feb 18 14:00:31 STD 2019
# Copyright (C) 2019, Mikolas Janota
#
failures=0
for e in ex01 ex02; do
    echo '====' "${e}"
    ./test.sh "${e}"
    let failures="$?+${failures}"
    echo '===='
done
echo FAILURES: $failures
if [ ${failures} == 0 ]; then
    echo "**********************************"
    echo "*All tests passed! Great success!*"
    echo "**********************************"
fi
