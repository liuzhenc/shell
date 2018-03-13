#!/bin/bash
#mysql 异地备份脚本

#设置变量
MY_CMD="/usr/bin/mysqldump"
MY_CONN="-uadmin -p123123 -h192.168.16.13"
MY_TIME="$(date +%Y%m%d%H%M)"

#定义备份目录
BF_DIR="/backup/mysql"

#定义备份数据库
BF_DB1="auth"
BF_DB2="client"
BF_DB3="TY"

#定义备份名称
NAME_1="$BF_DB1-$MY_TIME"
NAME_2="$BF_DB2-$MY_TIME"
NAME_3="$BF_DB3-$MY_TIME"

#备份mysql数据库,打包并删除源文件
[ -d $BF_DIR ] || mkdir $BF_DIR
cd $BF_DIR
$MY_CMD $MY_CONN $BF_DB1 > $BF_DIR/$NAME_1
$MY_CMD $MY_CONN $BF_DB2 > $BF_DIR/$NAME_2
$MY_CMD $MY_CONN $BF_DB3 > $BF_DIR/$NAME_3
/bin/tar zcf $NAME_1.sql.gz $NAME_1 --remove &>/dev/null 
/bin/tar zcf $NAME_2.sql.gz $NAME_2 --remove &>/dev/null 
/bin/tar zcf $NAME_3.sql.gz $NAME_3 --remove &>/dev/null 

#查找并删除大于3天的备份文件
find $BF_DRI -name "*.sql.gz" -type f -mtime +3 | xargs rm -rf {} \ ;>/dev/null 







