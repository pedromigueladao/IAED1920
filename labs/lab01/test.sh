#!/bin/bash
#
# File:  test.sh
# Author:  mikolas
# Created on:  Sun Feb 17 13:31:59 STD 2019
# Copyright (C) 2019, Mikolas Janota
#
if [[ $# != 1 ]] ; then
    echo "Usage: $0 <exercise-name>"
    echo "Example: ./${0} ex01"
    exit 1
fi

prog_name="${1}"
cfile="${1}".c
test_in="tests/${1}.in"
test_out="tests/${1}.out"
diff_opts=""

# use color for diff, if supported
if diff --help | grep -q -w -e '--color'
then
    diff_opts="${diff_opts} --color"
fi

if [ ! -f "${cfile}" ]; then
    echo "ERROR: file ${cfile} not found!"
    exit 1
fi

gcc -ansi -Wall -Wextra -pedantic -o ${prog_name} ${cfile}
rv=$?
if [ ${rv} != 0 ]; then
    echo "ERROR: Compilation failed!"
    exit 1
else
    echo "Program successfully compiled..."
fi

stamp=${RANDOM}${RANDOM}
student_out=/tmp/in_${stamp}
./${prog_name} <${test_in} | sed -e 's/\r$//' > ${student_out}
rv1=$?
if [ ${rv} != 0 ]; then
    echo "ERROR: Compiled program did not return 0!"
    exit 1
else
    echo "Compiled program successfully ran..."
fi

if [ ! -f "${student_out}" ]; then
    echo "ERROR: The output of the exercise was not created (file ${student_out})!"
    exit 1
fi

diff ${diff_opts} ${student_out} ${test_out}
rv_diff=$?
rm -f ${student_out}

if [ ${rv_diff} == 0 ]; then
    echo "Test ${test_in} PASSED!"
else
    echo "Test ${test_in} FAILURE!"
    exit 1
fi
