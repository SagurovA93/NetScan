#!/bin/bash
echo "Как назовем файл?"
read NewfileName

if [ "$NewfileName" == fileName ]
	then 
	echo "Файл с именем $NewfileName уже существует. Перезаписать? [y/n]"
	read myAnswer
		until [[ "$myAnswer" ==  "y" || "$myAnswer" ==  "n" ]]
		do
		echo "Файл с именем $filename уже существует. Перезаписать? [y/n]"
		read  myAnswer
		done
	elif [ ! fileName ]
		then
		
		else

fi

