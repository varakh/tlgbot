#!/bin/sh

DEVICE="$1"
NL="$2"

ping ${DEVICE} -w 1 -q &>/dev/null; [ $? == 0 ] && echo -en "Доступен" || echo -en "Недоступен (Firewall?)"
if [ -z ${NL} ];then
	echo -en "\n"
fi