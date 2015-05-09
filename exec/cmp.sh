#!/bin/sh 
if [ "$#" == "0" ] || [ "$#" == "1" ]; then
    echo -e "\nusage: cmp.sh dir1 dir2\n"
    echo -e "This script compares existing file in dir1 and compare to dir2 if file exists\n"
    exit 0
fi

# compare existing file in both directories
for file in ./$1/*
do
    #filename = ${file//\.\/$1\//}  # this line cannot work
    if [ -f $2/${file//\.\/$1\//} ]; then
        cmp $file $2/${file//\.\/$1\//} | sed 's/\(\.\/.*\/\)\(.*\)/\2/g'
        #diff $file $2/${file//\.\/$1\//} | sed 's/\(\.\/.*\/\)\(.*\)/\2/g'
    fi
done
