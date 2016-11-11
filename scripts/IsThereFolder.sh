#!/bin/bash
#Скрипт на создание папки или файла с датой в имени файла
cd $HOME/ntsc_logs
echo "создаем папку"
TodayIs=$(date +%d%b%y)

mkdir $TodayIs

exit 0

