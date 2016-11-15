#!/bin/bash
#Вычисление даты предыдущего дня без поправки на високосный год
#Сегодняшнее число TodayIs
TodayIs=$(date +%d%b%y)
#Вычисление предыдущего числа месяца и запись в переменную
day=$(date +%d)
let Yesterday=$day-1
month=$(date +%b)
year=$(date +%y)
YesterdayIs=$Yesterday$month$year
#Проверка корректности вчерашнего числа
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
	echo "date is correct"
fi
exit 0