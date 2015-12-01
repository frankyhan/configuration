#!/bin/bash

if [ $# -eq 1 ]
then
	name=$1
	#user='root'
	user='fenghan'
elif [ $# -eq 2 ]
then
	name=$1
        user=$2
else
	echo "参数错误"
	exit
fi

ip=`cat ip.txt | grep -e "^${name}" | head -1 | cut -d' ' -f2`

cmd="expect ./ssh_ip.exp $ip $user"
$cmd
