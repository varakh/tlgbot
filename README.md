# Telegram bot для OpenWRT

[![ru](https://img.shields.io/badge/lang-ru-red.svg)](https://github.com/varakh/multilanguage-readme-pattern/blob/master/README.md)
[![en](https://img.shields.io/badge/lang-en-blue.svg)](https://github.com/varakh/multilanguage-readme-pattern/blob/master/README.md)

Бот для Telegram, представляющий собой набор скриптов, написанных на Bash, для использования на устройствах с OpenWRT.
В основе лежат скрипты из других похожих проектов, авторам которых выражаю благодарность:

 * [tg-bot1](https://github.com/ZigFisher/glutinium/tree/master/tg-bot1) (@ZigFisher) 
 * [openwrt-telegram-bot](https://github.com/ixiumu/openwrt-telegram-bot) (@ixiumu) 
 * [telegramopenwrt](https://github.com/alexwbaule/telegramopenwrt) (@alexwbaule)

## История версий

**1.0** (12.02.2023) - начальная версия

## Функционал

Функционал бота представлен набором скриптов для получения различной информации о работе устройства с OpenWRT на борту. 
Список скриптов (они же являются командами бота) следующий:

* **/start** - вывод списка доступных команд
* **/uptime** - время работы роутера
* **/wan_uptime** - время работы WAN-интерфейса 
* **/wan_ip** - белый IP-адрес
* **/free** - использование оперативной памяти
* **/loadavg** - средняя загрузка (1 мин., 5 мин., 15 мин.)
* **/last** - текущие сессии пользователей, вошедших по SSH
* **/dhcp_clients** - список клиентов DHCP
* **/wifi_clients** - список клиентов сетей WiFi
* **/summary** - вывод информации команд выше в одном сообщении

Команд по управлению роутером (перезапустить службу, добавить правило в firewall, перезагрузить роутер и т.п.) не предусмотрено. Примеры таких команд можно найти в других похожих проектах. 

## Установка и запуск

#### Зависимости

`curl` - для взаимодействия с Telegram API. Устанавливается с помощью Luci (**System** -> **Software**) либо командами:

1. `opkg update`
2. `opkg install curl`

#### Создание бота 

Для создания собственного бота необходимо обратиться к другому боту, который называется BotFather. Этот бот позволяет создавать и управлять собственными ботами. Подробнее в [FAQ](https://core.telegram.org/bots/faq#how-do-i-create-a-bot).
Когда бот будет создан, BotFather отправит специальный токен, который не следует кому-либо передавать, иначе посторонние получат доступ к управлению ботом. 
Помимо токена, необходимо узнать собственный chatID. Это можно сделать также с помощью других ботов.  

#### Копирование файлов

Файлы бота необходимо расположить в соответствующих папках на устройстве.

* `/etc/config/tlgbot` - файл конфигурации. 
> **В него необходимо перед копированием добавить полученные значения токена и chatID**
* `/etc/init.d/tlgbot` - файл для управления запуском и остановкой бота с помощью procd
* `/usr/bin/tlgbot/` - папка с набором скриптов, выполняемых ботом
* `/usr/sbin/tlgbot` - основной скрипт бота

#### Запуск

Запуск, остановка и добавление в автозагрузку бота можно произвести в Luci (**System** -> **Startup**). Для этого для Initscript **tlgbot** необходимо нажать соответствующие кнопки.
Управление через терминал выполняется командами:

* `service tlgbot start` - запуск бота
* `service tlgbot stop` - остановка бота
* `service tlgbot enable` - добавление бота в автозагрузку
* `service tlgbot disable` - отключение автозагрузки бота