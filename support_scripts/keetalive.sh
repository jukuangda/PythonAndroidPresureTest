#!/bin/bash
#set -x

for(( ; ; ))
do
  echo 音量下
  adb -s $1 shell input keyevent 25
  sleep 1200
done