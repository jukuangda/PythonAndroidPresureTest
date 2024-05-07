
#!/bin/bash
#set -x

NUM=1
DEVICES=`adb devices | grep "\<device\>" | awk '{print $1}'`
FIRSTSTART=0

for device in ${DEVICES}
do
    adb -s $device logcat -c
    adb -s $device logcat -v time > $device.log &
done

for device in ${DEVICES}
do
    # adb -s $device shell pm clear com.technology.newplayer
    adb -s $device shell am start -n "com.technology.newplayer/com.technology.newplayer.activity.WelcomeActivity" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER
done

sleep 30

# for device in ${DEVICES}
# do
#     adb -s $device shell input keyevent 23
#     sleep 20
# done

for(( ; ; ))
do
    for device in ${DEVICES}
            do
              # echo '切换下一个'
              # adb -s $device shell input keyevent 20
              # sleep 20
              # echo '切换上一个'
              # adb -s $device shell input keyevent 19
              # sleep 20
              for i in {1..20}
                do
                  echo '切换下一个'
                  adb -s $device shell input keyevent 20
                  sleep 20
                done
              
              for i in {1..20}
                do
                  echo '切换上一个'
                  adb -s $device shell input keyevent 19
                  sleep 20
                done
            done
done



