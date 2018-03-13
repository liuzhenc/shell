#!/bin/bash
#可用内存低于100MB，发邮件报警,
mem_free=`free -m | awk '/cache:/ {print $4}'`
if [ $mem_free -lt 200 ]
  then
     echo "内存报警" | mail -s "内存小于200Mb" 15001399269@139.com
fi

