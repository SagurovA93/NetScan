#!/bin/bash

cd /home/sad/
echo "Введи имя файла:"
read NewFileName
if [ -f $NewFileName ] 
	then
		echo "Файл с таким именем $NewFileName уже существует. Перезаписать? [y/n]"
		read myAnser
		until [[ "$myAnswer" ==  "y" || "$myAnswer" ==  "n" ]]
			do
			echo "Только y или n"
			read  myAnswer
		done
	
	else
		echo "Такого файла ЕЩЕ не существует"
fi
