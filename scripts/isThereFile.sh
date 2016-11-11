#!/bin/bash
#Скрипт проверки и записи/ведения логов 

	function create_new_file (){
		touch $NewfileName
	}
	
	function delete_file () {
		rm $NewfileName
	}

echo "Как назовем файл?"
read NewfileName
cd $HOME/NetScan/scripts/
if [ -f $NewfileName ]
	then 
	echo "Файл с именем $NewfileName уже существует. Перезаписать? [y/n]"
	read myAnswer
		until [[ "$myAnswer" ==  "y" || "$myAnswer" ==  "n" ]]
		do
		echo "Файл с именем $filename уже существует. Перезаписать? [y/n]"
		read  myAnswer
		done
		
		case $myAnswer in
			
			y)
				echo "Перезаписываю файл $NewfileName"
				delete_file
				create_new_file
			;;
			n)
				echo "Работа завершена с ошибкой: файл $NewfileName уже существует."
				exit 1
			;;
		esac
		
		else
		echo "Записываю файл $NewfileName"
		create_new_file
			
fi

exit 0

