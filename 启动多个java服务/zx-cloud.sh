#!/bin/bash
# Date:2017-08-14
# Description: zx-cloud项目的开机自启动

DIR=/usr/local/zx-runtime
FIRSTRUN=zx-eureka-server-1.0.0.jar
OTHERRUN=`ls $DIR/zx-cloud |grep jar |grep -v "$FIRSTRUN"`

source /etc/profile
$DIR/zx-manage/apache-tomcat-zx-manage/bin/startup.sh
$DIR/zx-cms/apache-tomcat-zx-cms/bin/startup.sh
$DIR/zx-rbac/apache-tomcat-zx-rbac/bin/startup.sh

cd $DIR/zx-cloud
/usr/bin/nohup java -jar $FIRSTRUN & > /dev/null 2>&1
if [ $? -ne 0 ]
then 
	echo -e "$(date +%F) \t---\t $FIRSTRUN is started ERROR\n" > /opt/zx-cloud.error
fi

for i in $OTHERRUN
do
	/usr/bin/nohup java -jar $i & >/dev/null 2>&1
	if [ $? -ne 0 ]
	then
		echo -e "$(date +%F) \t---\t $i is started ERROR\n" >> /opt/zx-cloud.error
	fi
done

