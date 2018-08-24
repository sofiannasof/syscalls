#!/bin/bash
STRACE_OUTPUT_FILE="strace_output.txt"
SYSCALLS_OUTPUT_FILE="syscalls.txt"

strace -o $STRACE_OUTPUT_FILE "$@" && grep -oP '^.+?(?=\()' $STRACE_OUTPUT_FILE$
echo -e "\e[95mThe following syscalls were called:\e[93m"
cat $SYSCALLS_OUTPUT_FILE
echo -e "\e[95mThe syscalls were saved to $(pwd)/$SYSCALLS_OUTPUT_FILE"
exit 0
