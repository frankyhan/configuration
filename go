#!/bin/bash


#ssh -t osys11 ssh 1

if [ $# -ne 1 ];then 
	echo 'paramater is no corret exit'
	exit
fi

#echo ${1:0:1}
#echo ${1:1}
ssh -t osys11.meilishuo.com  ssh 172.16.${1:0:1}.${1:1}
