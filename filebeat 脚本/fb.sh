#!/bin/bash
#Filename:/home/filebeat/fb.sh
#The filebeat server control script
#if you want to restart the filebeat,please use "./fb.sh restart"
#

proc="/home/filebeat/filebeat"
pid=`ps aux |grep "/home/filebeat/filebeat"|grep -v grep|awk '{print $2}'`


case "$1" in
	start)
		if [ -z $pid ];then
			$proc &
		else
			echo "filebeat is running, start it is error."
		fi
	;;
	stop)
		if [ $pid ];then
			kill $pid
		else
			echo "filebeat is topped, stop it is error."
		fi
	;;
	restart)
		$0 stop
		$0 start
	;;
esac
exit 0
