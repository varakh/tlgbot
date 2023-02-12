# Telegram bot for OpenWRT

[![ru](https://img.shields.io/badge/lang-ru-red.svg)](https://github.com/varakh/tlgbot/blob/main/README.md)
[![en](https://img.shields.io/badge/lang-en-blue.svg)](https://github.com/varakh/tlgbot/blob/main/README.en.md)

> **Main language of bot's messages is Russian**

This is a Telegram bot for devices with OpenWRT written in Bash. In the basis there is a set of Bash scripts taken and slightly modified from another similar projects, I thank the authors of such projects as: 

 * [tg-bot1](https://github.com/ZigFisher/glutinium/tree/master/tg-bot1) (@ZigFisher) 
 * [openwrt-telegram-bot](https://github.com/ixiumu/openwrt-telegram-bot) (@ixiumu) 
 * [telegramopenwrt](https://github.com/alexwbaule/telegramopenwrt) (@alexwbaule)

## Version history

**1.0** (12.02.2023) - first release

## Functionality

The bot's functionality is provided with a set of scripts to receive a various information about OpenWRT device working.
The list of scripts (they are bot commands also) is below: 

* **/start** - an output of the available commands
* **/uptime** - device's uptime
* **/wan_uptime** - WAN-interface uptime 
* **/wan_ip** - white IP address
* **/free** - RAM using
* **/loadavg** - average loading (1 min., 5 min., 15 min.)
* **/last** - a list of current users logged in via SSH
* **/dhcp_clients** - a list of DHCP clients
* **/wifi_clients** - a list of WiFi networks clients
* **/summary** - an output of commands above in a single message

There are no commands to manage the device (e.g. to restart a service, to add a rule in firewall, etc.). The examples of such commands can be found in similar projects.

## Installation and starting

#### Dependencies

`curl` - to interact with Telegram API. Can be installed with Luci (**System** -> **Software**) or using next commands:

1. `opkg update`
2. `opkg install curl`

#### Bot creation 

To create your own bot you need to refer to another bot called BotFather. That bot helps to create and manage your own bots. More information in [FAQ](https://core.telegram.org/bots/faq#how-do-i-create-a-bot).
When bot is created BotFather will provide a special token which should be kept secret, you have not to disclosure it otherwise unwanted persons can get an access to manage your bot.
In addition to token, you also need to get your chatID. It can be done using bots also.
 
#### Files copying

The bot's files should be placed in the corresponding folders of the device. 

* `/etc/config/tlgbot` - the configuration file. 
> **Before its copying, you need to add the values of token and chatID there**
* `/etc/init.d/tlgbot` - the file for procd managing of bot's start
* `/usr/bin/tlgbot/` - the folder with set of scripts executing by bot
* `/usr/sbin/tlgbot` - the main bot's script

#### Starting

Bot's starting, stopping and adding to startup can be done in Luci (**System** -> **Startup**).
The next commands manage the bot's starting, etc. via terminal:

* `service tlgbot start` - starting the bot
* `service tlgbot stop` - stopping the bot
* `service tlgbot enable` - adding bot to startup
* `service tlgbot disable` - removing bot from startup
