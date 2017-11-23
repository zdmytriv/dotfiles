#!/bin/sh

PATH_TO_IDEA='/Applications/IntelliJ\ IDEA\ CE.app/Contents/MacOS/idea'

if [ $# -ne 2 ]
then
    echo "Usage: $0 <file1> <file2>"
    exit 1
fi

FILE1=`pwd`/$1
FILE2=`pwd`/$2

if [ !-f $FILE1 ]; then $FILE1 = $1; fi
if [ !-f $FILE2 ]; then $FILE2 = $2; fi

echo "Applying diff for files:"
echo "File 1: $FILE1"
echo "File 2: $FILE2"

$PATH_TO_IDEA diff $FILE1 $FILE2
