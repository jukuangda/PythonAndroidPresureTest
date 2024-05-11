#!/bin/bash
#set -x

curtime=`date +"%Y%m%d_%H%M%S"`
adb shell am broadcast -a com.bytedance.raphael.ACTION_START -f 0x01000000 --es configs 0xCF0400
sleep 5
adb shell am broadcast -a com.bytedance.raphael.ACTION_PRINT -f 0x01000000
sleep 2
# adb shell am dumpheap com.newtv.cboxtv /data/local/tmp/"$curtime"_heap.hprof
# sleep 10
adb pull /sdcard/Android/data/com.newtv.cboxtv/files/raphael/report result/"$curtime"_report
adb pull /sdcard/Android/data/com.newtv.cboxtv/files/raphael/maps result/"$curtime"_maps
# adb pull /data/local/tmp/"$curtime"_heap.hprof result/
# adb shell dumpsys meminfo com.newtv.cboxtv > result/"$curtime"_meminfo.txt

sleep 5
python3 raphael.py -r result/"$curtime"_report -o result/"$curtime"_report_ana.txt -s result/symbol
python3 mmap.py -m result/"$curtime"_maps > result/"$curtime"_maps_ana.txt