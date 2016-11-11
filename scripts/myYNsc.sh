#!/bin/bash
#Скрипт для отработки 2 вариантов ответа через Y/N
echo "Да или нет? [y/n]"
read myAnswer
until [[ "$myAnswer" ==  "y" || "$myAnswer" ==  "n" ]]
	do
	echo "Только y или n"
	read  myAnswer
	done
	
if [ "$myAnswer" == "y" ]
	then
		echo "Ты ответил положительно!"
	else
		echo "Ты ответил отрицательно!"
fi
