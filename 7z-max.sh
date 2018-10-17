#!/bin/bash

# 7z-max.sh - 7z max compression with a password

if [ $# -ne 2 ]
then
        echo "Usage: $0 <write-to-file> <from-file-or-directory>"
        exit
fi

echo -e 'New password for 7z file: '
read -s p1
echo -e 'Enter it again: '
read -s p2

if [ $p1 != $p2 ]
then
        echo -e 'Password missmatch.\n'
        exit
fi

echo -e 'Please wait...\n'

# The part nobody can remember:
echo `7z a -mhe=on -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on -p"$p1" $1 $2`
echo -e 'Complete.\n'
