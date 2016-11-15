#!/bin/bash
TodayIs=$(date +%d%b%y)
$TodayIs>>$0.err
exec 2>>$0.err
#Вычисление предыдущего числа месяца и запись в переменную
day=$(date +%d)
let Yesterday=$day-1
month=$(date +%b)
year=$(date +%y)
YesterdayIs=$Yesterday$month$year
#Проверка корректности вчерашнего числа
if [ $Yesterday -eq 0 ]
then
	month_num=$(date +%m)
	case $month_num in
		
		01)	
			Yesterday=31
			month_yes=дек
			let year=$(date +%y)-1
			YesterdayIs=$Yesterday$month_yes$year
		;;
		02)
			Yesterday=31
			month_yes=янв
			YesterdayIs=$Yesterday$month_yes$year		
		;;
		03)
			Yesterday=28
			month_yes=фев
			YesterdayIs=$Yesterday$month_yes$year
		;;
		04)
			Yesterday=31
			month_yes=мар
			YesterdayIs=$Yesterday$month_yes$year
		;;
		05)
			Yesterday=30
			month_yes=апр
			YesterdayIs=$Yesterday$month_yes$year
		;;
		06)
			Yesterday=31
			month_yes=май
			YesterdayIs=$Yesterday$month_yes$year
		;;
		07)
			Yesterday=30
			month_yes=июн
			YesterdayIs=$Yesterday$month_yes$year
		;;
		08)
			Yesterday=31
			month_yes=июл
			YesterdayIs=$Yesterday$month_yes$year
		;;
		09)
			Yesterday=31
			month_yes=авг
			YesterdayIs=$Yesterday$month_yes$year
		;;
		10)
			Yesterday=30
			month_yes=сен
			YesterdayIs=$Yesterday$month_yes$year
		;;
		11)
			Yesterday=31
			month_yes=окт
			YesterdayIs=$Yesterday$month_yes$year
		;;
		12)
			Yesterday=30
			month_yes=ноя
			YesterdayIs=$Yesterday$month_yes$year
		;;
	esac
else 
	echo "correct date" >> $0.err
fi
cd $HOME/Общедоступные/
tar -cvzf backup$TodayIs.\tar.gz WORK
rm -Rf WORK
mkdir WORK
cp -R $HOME/NetScan $HOME/Общедоступные/WORK
cp -R $HOME/ntsc_logs $HOME/Общедоступные/WORK