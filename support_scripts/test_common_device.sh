adb -s $1 shell am start -a android.intent.action.VIEW -d "cctv_xst://duershow.media/play?playInfo=%7B%27cbox_jump_version%27%3A%274.4%27%2C%27action%27%3A%27OPEN_VIDEO%27%2C%27type%27%3ATX-PS%2C%27id%27%3A24411468%2C%27fid%27%3A0%7D"
sleep 45

for(( ; ; ))
do
  adb -s $1 shell am start -a android.intent.action.VIEW -c android.intent.category.DEFAULT -d "cctv_xst://duershow.media/play?playInfo=%7B%27cbox_jump_version%27%3A%274.4%27%2C%27action%27%3A%27OPEN_VIDEO%27%2C%27type%27%3ATX-PS%2C%27id%27%3A24411468%2C%27fid%27%3A0%7D"
  sleep 45
  adb -s $1 shell am start -a android.intent.action.VIEW -d "cctv_xst://duershow.media/play?playInfo=%7B%27cbox_jump_version%27%3A%274.4%27%2C%27action%27%3A%27OPEN_VIDEO%27%2C%27type%27%3ATX-PS%2C%27id%27%3A24629426%2C%27fid%27%3A0%7D"
  sleep 45
done