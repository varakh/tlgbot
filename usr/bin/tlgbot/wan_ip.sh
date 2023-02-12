#!/bin/sh
ip=$(curl -s api.ipify.org)
echo "Публичный IP-адрес: $ip"