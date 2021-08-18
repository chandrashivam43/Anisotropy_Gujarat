bash sacsei.sh
bash rename.sh
pid=`ps -e | grep gedit | awk '{print $1}'`
kill ${pid}
bash event_lle.sh
sh stat.sh
bash instrument.sh

