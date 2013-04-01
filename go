#!/bin/bash


#ssh -t osys11 ssh 1

if [ $# -ne 1 ];then 
	echo 'paramater is no corret exit'
	exit
fi
ssh -t osys11 ssh 172.16.0.$1
