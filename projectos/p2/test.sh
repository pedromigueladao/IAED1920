#!/bin/bash
#
# File:  test.sh
# Author:  mikolas
# Created on:  Sun Feb 17 13:31:59 STD 2019
# Copyright (C) 2019, Mikolas Janota
#

RED='\033[0;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [ $# -lt 2 ] ; then
    echo "Usage: $0 <test-dir> <src-file1> <src-file2> ..."
    echo "Example: ${0} testes-enunciado *.c"
    exit 1
fi

test_dir="${1}"
shift
prog_name=foo_${RANDOM}
DIFF="diff"
CC="gcc -ansi -Wall -Wextra -pedantic -g -fsanitize=address"
diff_opts="--ignore-space-change --ignore-blank-lines"

# use color for diff, if supported
if diff --help | grep -q -w -e '--color'
then
    diff_opts="${diff_opts} --color"
fi


if [ -n "${DO_NOT_TIME}" ]
then
   TIME_COMMAND=""
else
   TIME_COMMAND="time"
fi

${CC} -o ${prog_name} $*
rv_compile=$?
if [ ${rv_compile} != 0 ]; then
    echo -e "${RED}ERROR: Compilation failed!${NC}"
    exit 1
else
    echo "Program successfully compiled..."
fi

for test_in in `ls -rS ${test_dir}/*.in`; do
    echo "Test:" "${test_in}"
    test_out="${test_in%.in}.out"
    stamp="${RANDOM}${RANDOM}"
    student_out=/tmp/in_${stamp}
    bash -c "${TIME_COMMAND} ./${prog_name} <${test_in} >${student_out}"
    rv_student=$?

    if [ ! -f "${student_out}" ]; then
        echo -e "${RED}ERROR: The output of the exercise was not created (file ${student_out})!${NC}"
        rm -f ${prog_name}
        exit 1
    fi

    if [ ${rv_student} != 0 ]; then
        echo -e "${RED}ERROR: Program did not return 0!\n${NC}"
        rm -f ${prog_name}
        rm -f ${student_out}
        exit 1
    else
        echo "Program successfully ran..."
    fi

    ${DIFF} ${diff_opts} ${student_out} ${test_out}
    rv_diff=$?
    rm -f ${student_out}

    if [ ${rv_diff} == 0 ]; then
        echo -e "${GREEN}Test ${test_in} PASSED!\n${NC}"
    else
        echo -e "${RED}Test ${test_in} FAILURE!\n${NC}"
        rm -f ${prog_name}
        exit 1
    fi
done

rm -f ${prog_name}
