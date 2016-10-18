#!/bin/bash

cd $HOME/scripts/sc_html/
rm index.html
touch index.html

exec 2>$0.err

echo "Введите начальный адрес 10.4._._ через пробел" 
read j i
x=$i
if [ $x == 0 ]; then
	x=1
fi
echo "Введите конечный адрес 10.4._._ через пробел" 
read LIMIT_j LIMIT_i
echo "Сканируем диапазон адресов 10.4.$j.$i - 10.4.$LIMIT_j.$LIMIT_i"
#Подсчет размера сети
#let count4th=$LIMIT_i-$x
#let count3th=$LIMIT_j-$j
#if [ $count3th == 0]; then
#	count3th=1
#fi
#let netSize=$count4th*$count3th
#echo $netSize
#Всякие разные переменные 
hundred=100
Zero=0
#Подсчет количества узлов в сети
echo "" 												>> index.html
echo '<html>' 												>> index.html
echo '<head>' 												>> index.html
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' 				>> index.html
echo '<title>Net Scan</title>'	 									>> index.html
echo '<style type="text/css">'										>> index.html
echo	'table {border: 1px solid #000}'								>> index.html
echo    'tr {}'												>> index.html
echo   	'.layout {'											>> index.html
echo   	'width: 100%; /* Ширина всей таблицы в процентах */'						>> index.html
echo   	'}'												>> index.html
echo   	'.layout TD {'											>> index.html
echo   	'vertical-align: top; /* Вертикальное выравнивание в ячейках */'				>> index.html
echo   	'}'												>> index.html
# Стиль для ячейки НЕ успешного пинга
echo   	'TD.leftcolRed {'										>> index.html
echo    'width: 20%; border: 1px solid #000; background: red;/* Ширина левой колонки */'		>> index.html
echo   	'}'												>> index.html
# Стиль для ячейки успешного пинга
echo   	'TD.leftcolGreen {'										>> index.html
echo    'width: 20%; border: 1px solid #000;background: green;/* Ширина левой колонки  */'		>> index.html
echo   	'}'												>> index.html
echo   	'TD.rightcol {'											>> index.html
echo    'width: 30%;border: 1px solid #000;/* Ширина правой колонки в процентах */'			>> index.html
echo   	'}'												>> index.html
echo  	'</style>'											>> index.html
echo '</head>' 												>> index.html
echo '<body>' 												>> index.html
	echo '<div align = "center">Эта страница сгенерирована автоматически скриптом на bash</div>' 	>> index.html
	echo '<br>'											>> index.html
	echo '<table cellspacing="0" cellpadding="0" class="layout">' 					>> index.html
	for ((j; j <= LIMIT_j; j++))
		do
		i=$x
		for ((i; i < $LIMIT_i; i++))
		do
	#Проверка доступности 'unknown|expired|unreachable|time out'
	errorcount="$(ping 10.4.$j.$i  -i 0.5 -c 1 2<&1 | grep -icE 'unknown|expired|unreachable|timeout')" 
		if [ "$errorcount" != "$Zero"  ]
		then
			#Пинг не прошел
			echo '<tr>' 									>> index.html
				echo '<td class="leftcolRed">10.4.'"$j"'.'"$i" ' - NOT Available</td>' 	>> index.html
				dnsresult=$(nslookup 10.4.$j.$i | grep '.4.10'	| awk '{print $4}')
				sed -i 's/find/ /g' index.html
				echo '<td class="rightcol">'"$dnsresult"'</td>' 			>> index.html
				echo "10.4."$j"."$i" - NOT Available"
				let i=$i+1			
				echo '<td class="leftcolRed">10.4.'"$j"'.'"$i" ' - NOT Available</td>' 	>> index.html
				dnsresult=$(nslookup 10.4.$j.$i | grep '.4.10'	| awk '{print $4}')
				sed -i 's/find/ /g' index.html
				echo '<td class="rightcol">'"$dnsresult"'</td>' 			>> index.html
				echo "10.4."$j"."$i" - NOT Available"

			echo '</tr>' 					                        	>> index.html 	
		else
			#Пинг прошел
			echo '<tr>' 									>> index.html	
				echo '<td class="leftcolGreen">10.4.'"$j"'.'"$i" ' - Available</td>' 	>> index.html
				dnsresult=$(nslookup 10.4.$j.$i | grep '.4.10'	| awk '{print $4}')
				sed -i 's/find/ /g' index.html
				echo '<td class="rightcol">'"$dnsresult"'</td>' 			>> index.html
				echo "10.4."$j"."$i" - Available"
				let i=$i+1				
				echo '<td class="leftcolGreen">10.4.'"$j"'.'"$i" ' - Available</td>' 	>> index.html
				dnsresult=$(nslookup 10.4.$j.$i | grep '.4.10'	| awk '{print $4}')
				sed -i 's/find/ /g' index.html
				echo '<td class="rightcol">'"$dnsresult"'</td>' 			>> index.html
				echo "10.4."$j"."$i" - Available"

			echo '</tr>' 					                        	>> index.html 	
		fi
		done	
	done
	echo '</table>' 										>> index.html
	echo '</body>' 											>> index.html
	echo '</html>' 											>> index.html
exit 0


