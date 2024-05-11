#!/bin/bash
#set -x

fileList=`ls $1`
sub_name='report'
for f_name in $fileList
do
#   echo $f_name
  if [[ "$f_name" == *"$sub_name" ]]
  then
    echo $f_name
    `python3 raphael.py -r "$1"/"$f_name" -o "$1"/"$f_name"_ana.txt`
  fi
done
# test_name="20220616_095232_report"
# `python3 raphael.py -r "$1"/"$test_name" -o "$1"/"$test_name"_ana_all.txt`