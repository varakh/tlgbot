#!/bin/sh
uptime=$(jsonfilter -s "$(ifstatus wan)" -e '$.uptime')
printf 'WAN-интерфейс работает %dд %dч %dм %dс\n'  $((uptime/86400)) $((uptime%86400/3600)) $((uptime%3600/60)) \
  $((uptime%60))