#!/bin/bash

if [ $1 == 1 ]
	then 
	echo	"Первая ветвь. ВВеди вариант для case: ubuntu, centos|rhel, windows"
	read DISTR
	case $DISTR in

	ubuntu)
          echo "Я тоже знаю Ubuntu! Эта система основана на Debian."
          ;;
     centos|rhel)
          echo "Эй! Это мой любимый серверный дистрибутив!"
          ;;
     windows)
          echo "Очень смешно..."
          ;; 
     *)
          echo "Хмм, кажется я никогда не использовал этот дистрибутив."
          ;;	

	esac
	else
	echo "Вторая ветвь"
fi
