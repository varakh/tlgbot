#!/bin/sh
logread -e dropbear | grep 'Password auth succeeded for' | sed 's/^.* dropbear\[//' | sed 's/\]:.*//' | sort -u > /tmp/procids

successfullogins="/tmp/procids"

while IFS= read -r procid
do
user=$(logread -e "$procid" | grep 'Password auth succeeded for' | sed 's/^.*succeeded for //' | sed 's/ from.*//')
ip=$(logread -e "$procid" | grep 'Password auth succeeded for' | sed 's/^.*from //' | sed 's/\:.*//')
starttime=$(logread -e "$procid" | grep 'Password auth succeeded for' | sed 's/authpriv.*//' | sed 's/ from.*//')
endtime=$(logread -e "$procid" | grep 'Exited normally' | sed 's/authpriv.*//' | sed 's/ from.*//')
if [ -z "$endtime" ]; then
endtime="ещё в системе"
fi
echo -e "$user\t$ip\t$starttime"- "$endtime"
done < "$successfullogins"
exit 0
