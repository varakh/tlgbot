#!/bin/sh
echo "*Сводная информация:*"
echo "*1) Время работы:*"
/usr/bin/tlgbot/uptime.sh
echo "*2) Время работы интерфейса WAN:*"
/usr/bin/tlgbot/wan_uptime.sh
echo "*3) Использование памяти:*"
/usr/bin/tlgbot/free.sh
echo "*4) DHCP-клиенты:*"
/usr/bin/tlgbot/dhcp_clients.sh
echo "*5) WiFi-клиенты:*"
/usr/bin/tlgbot/wifi_clients.sh
echo "*6) Вошедшие в систему пользователи:*"
/usr/bin/tlgbot/last.sh
