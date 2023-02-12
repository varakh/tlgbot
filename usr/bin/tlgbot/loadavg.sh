#!/bin/sh
cat /proc/loadavg | awk -F"[ ]" '{print "Средняя нагрузка: " $1 ", " $2 ", " $3}'
