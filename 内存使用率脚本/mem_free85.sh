#!/bin/bash
#内存使用率大于85%，邮件短信报警
#20161213
mem_used=`free -m | awk '/cache:/ {print int($3/($3+$4)*100)}'`
if [ $mem_used -gt 85 ]
  then
       echo "内存报警" | mail -s "内存使用率超过85%" 15001399269@139.com
fi

