
#!/bin/bash
#set -x

NUM=1
TIMER=86400
WAKEUP_WORD="小度小度"
DEVICES=`adb devices | grep "\<device\>" | awk '{print $1}'`
START_TIME=`date +%s`
END_TIME=$(($START_TIME+$TIMER))

for device in ${DEVICES}
do
    adb -s $device logcat -c
    adb -s $device logcat -v time > $device.log &
done

for(( ; ; ))
do
    for device in ${DEVICES}
            do
               #  adb -s $device shell input tap 871 237.6            #点击进入音乐列表
               # sleep 10
              echo 播放张学良将军
              if [[ FIRSTSTART -eq 0 ]]; then
                adb -s $1 shell am start -a android.intent.action.VIEW -d "cctv_xst://duershow.media/play?playInfo=%7B%27cbox_jump_version%27%3A%274.4%27%2C%27action%27%3A%27OPEN_VIDEO%27%2C%27type%27%3APS%2C%27id%27%3A50487706%2C%27fid%27%3A0%7D"
                FIRSTSTART=1
                echo adbType0
              else
                adb -s $1 shell am start -a android.intent.action.VIEW -c android.intent.category.DEFAULT -d "cctv_xst://duershow.media/play?playInfo=%7B%27cbox_jump_version%27%3A%274.4%27%2C%27action%27%3A%27OPEN_VIDEO%27%2C%27type%27%3APS%2C%27id%27%3A50487706%2C%27fid%27%3A0%7D"
                echo adbType1
              fi
              sleep 15
              echo 暂停
              adb -s $1 shell am broadcast -a com.baidu.duer.query -e q 暂停
              sleep 15
              echo 继续
              adb -s $1 shell am broadcast -a com.baidu.duer.query -e q 继续
              sleep 15
              echo 第一集
              adb -s $1 shell am broadcast -a com.baidu.duer.query -e q 第一集
              sleep 15
              echo 下一集
              adb -s $1 shell am broadcast -a com.baidu.duer.query -e q 下一集
              sleep 15

              echo 播放听雪楼
              adb -s $1 shell am start -a android.intent.action.VIEW -d "cctv_xst://duershow.media/play?playInfo=%7B%27cbox_jump_version%27%3A%274.4%27%2C%27action%27%3A%27OPEN_VIDEO%27%2C%27type%27%3APS%2C%27id%27%3A52686802%2C%27fid%27%3A0%7D"
              sleep 100
              echo 暂停
              adb -s $1 shell am broadcast -a com.baidu.duer.query -e q 暂停
              sleep 15
              echo 继续
              adb -s $1 shell am broadcast -a com.baidu.duer.query -e q 继续
              sleep 15
              echo 第一集
              adb -s $1 shell am broadcast -a com.baidu.duer.query -e q 第一集
              sleep 15
              echo 下一集
              adb -s $1 shell am broadcast -a com.baidu.duer.query -e q 下一集
              sleep 15

               

              echo 快进二十分钟
              adb -s $1 shell am broadcast -a com.baidu.duer.query -e q 快进二十分钟
              sleep 15
              echo 快退10分钟
              adb -s $1 shell am broadcast -a com.baidu.duer.query -e q 快退10分钟
              sleep 15
              echo 跳到一分三十二秒
              adb -s $1 shell am broadcast -a com.baidu.duer.query -e q 跳到一分三十二秒
              sleep 15

              
            done

        now_time=`date +%s`
        if [ $now_time -ge $END_TIME ]; then
            for device in ${DEVICES}
            do
                adb -s $device shell am broadcast -a com.baidu.duer.query -e q 退出
                ps aux | grep $device | grep -v "grep" | awk '{print $2}' | xargs -I {} kill {}
            done
            echo -e "\nrun ${TIMER}s, exit with 0"
            
            exit 0
        fi
    done
done



