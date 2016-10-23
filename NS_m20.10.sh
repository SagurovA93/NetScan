#!/bin/bash

#Экспериментальный скрипт

cd $HOME/In_work/SCLfolder/
rm index.html
touch index.html

#exec 2>$0.err

echo "Введите начальный адрес aaa.bbb.jjj.iii через пробел" 
read a b j i
x=$i
y=$j
z=$b
g=$a
#Проверка введенного начального адреса
type_x=0
type_y=0
type_z=0
type_g=0
# Проверка: является ли ввод числом?
expr $g : '-\?[0-9]\+$' >/dev/null && type_g=1 || type_g=0
expr $z : '-\?[0-9]\+$' >/dev/null && type_z=1 || type_z=0
expr $y : '-\?[0-9]\+$' >/dev/null && type_y=1 || type_y=0
expr $x : '-\?[0-9]\+$' >/dev/null && type_x=1 || type_x=0


correct_g=0
until [ $correct_g -eq 1 ]
do
# Если введеное значение - число и оно принадлежит промежутку от 1 до 255 - все ок. 
	if (( type_g == 1 && g >= 1 && g <= 255 ))
		then
#			echo "$g допустимое значение"
			break
		else 
			echo	"Введено недопустимое значение первого октета"
			echo 	"Ведите новое значение первого октета _?_.bbb.jjj.iii от 1 до 255:"
			read g
			expr $g : '-\?[0-9]\+$' >/dev/null && type_g=1 || type_g=0
	fi
done
a=$g
until [ $correct_g -eq 1 ]
do
	if (( type_z == 1 && z >= 0 && z <= 255 ))
		then
#			echo "$z допустимое значение"
			break
		else 
			echo	"$z Введено недопустимое значение второго октета"
			echo 	"Ведите новое значение второго октета $a._?_.jjj.iii от 0 до 255:"
			read z
			expr $z : '-\?[0-9]\+$' >/dev/null && type_z=1 || type_z=0
	fi
done
b=$z
until [ $correct_g -eq 1 ]
do
	if (( type_y==1 && y >= 0 && y <= 255 ))
		then
#			echo "$y допустимое значение"
			break
		else 
			echo	"Введено недопустимое значение третьего октета"
			echo 	"Ведите новое значение третьего октета $a.$b._?_.iii от 0 до 255:"
			read y
			expr $y : '-\?[0-9]\+$' >/dev/null && type_y=1 || type_y=0
			
	fi
done
j=$y
until [ $correct_g -eq 1 ]
do
	if (( type_x==1 && x >= 1 && x <= 255 ))
		then
#			echo "$x допустимое значение"
			break
		else 
			echo	"Введено недопустимое значение четвертого октета"
			echo 	"Ведите новое значение четвертого октета $a.$b.$j._?_ от 1 до 255:"
			read x
			expr $x : '-\?[0-9]\+$' >/dev/null && type_x=1 || type_x=0	
	fi
done
i=$x
echo "Введите конечный адрес aaa.bbb.jjj.iii через пробел" 
read LIMIT_a LIMIT_b LIMIT_j LIMIT_i
# Проверка введенного конечного адреса
o=$LIMIT_a
p=$LIMIT_b
q=$LIMIT_j
r=$LIMIT_i

type_o=0
type_p=0
type_q=0
type_r=0

# Проверка: является ли ввод числом?
expr $o : '-\?[0-9]\+$' >/dev/null && type_o=1 || type_o=0
expr $p : '-\?[0-9]\+$' >/dev/null && type_p=1 || type_p=0
expr $q : '-\?[0-9]\+$' >/dev/null && type_q=1 || type_q=0
expr $r : '-\?[0-9]\+$' >/dev/null && type_r=1 || type_r=0

until [ $correct_g -eq 1 ]
do
	if (( type_o==1 && o >= 1 && o <= 255 ))
		then
#			echo "$o допустимое значение"
			break
		else 
			echo	"Введено недопустимое значение первого октета"
			echo 	"Ведите новое значение первого октета _?_.bbb.jjj.iii от 1 до 255:"
			read o
			expr $o : '-\?[0-9]\+$' >/dev/null && type_o=1 || type_o=0
	fi
done
LIMIT_a=$o
until [ $correct_g -eq 1 ]
do
	if (( type_p=1 && p >= 0 && p <= 255 ))
		then
#			echo "$p допустимое значение"
			break
		else 
			echo	"$p Введено недопустимое значение второго октета"
			echo 	"Ведите новое значение второго октета $LIMIT_a._?_.jjj.iii от 0 до 255:"
			read p
			expr $p : '-\?[0-9]\+$' >/dev/null && type_p=1 || type_p=0
	fi
done
LIMIT_b=$p
until [ $correct_g -eq 1 ]
do
	if (( type_q==1 && q >= 0 && q <= 255 ))
		then
#			echo "$q допустимое значение"
			break
		else 
			echo	"Введено недопустимое значение третьего октета"
			echo 	"Ведите новое значение третьего октета $LIMIT_a.$LIMIT_b._?_.iii от 0 до 255:"
			read q
			expr $q : '-\?[0-9]\+$' >/dev/null && type_q=1 || type_q=0
			
	fi
done
LIMIT_j=$q
until [ $correct_g -eq 1 ]
do
	if (( type_r=1 && r >= 1 && r <= 255 ))
		then
#			echo "$r допустимое значение"
			break
		else 
			echo	"Введено недопустимое значение четвертого октета"
			echo 	"Ведите новое значение четвертого октета $LIMIT_a.$LIMIT_b.$LIMIT_j._?_ от 1 до 255:"
			read r
			expr $r : '-\?[0-9]\+$' >/dev/null && type_r=1 || type_r=0
	fi
done
LIMIT_i=$r

echo "Сканируем диапазон адресов $a.$b.$j.$i - $LIMIT_a.$LIMIT_b.$LIMIT_j.$LIMIT_i"
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
echo "" 														>> index.html
echo '<html>' 														>> index.html
echo '<head>' 														>> index.html
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' 						>> index.html
echo '<title>Net Scan</title>'	 											>> index.html
echo '<style type="text/css">'												>> index.html
echo	'table {border: 1px solid #000}'										>> index.html
echo    'tr {}'														>> index.html
echo   	'.layout {'													>> index.html
echo   	'width: 100%; /* Ширина всей таблицы в процентах */'								>> index.html
echo   	'}'														>> index.html
echo   	'.layout TD {'													>> index.html
echo   	'vertical-align: top; /* Вертикальное выравнивание в ячейках */'						>> index.html
echo   	'}'														>> index.html
# Стиль для ячейки НЕ успешного пинга
echo   	'TD.leftcolRed {'												>> index.html
echo    'width: 150px;border: 1px solid #000; background: red;/* Ширина левой колонки */'				>> index.html
echo   	'}'														>> index.html
# Стиль для ячейки успешного пинга
echo   	'TD.leftcolGreen {'												>> index.html
echo    'width: 150px;border: 1px solid #000;background: green;/* Ширина левой колонки  */'				>> index.html
echo   	'}'														>> index.html
echo   	'TD.rightcol {'													>> index.html
echo    'width: 150px;border: 1px solid #000;/* Ширина правой колонки в процентах */'					>> index.html
echo   	'}'														>> index.html
echo  	'</style>'													>> index.html
echo '</head>' 														>> index.html
echo '<body>' 														>> index.html
	echo '<div align = "center">Эта страница сгенерирована автоматически скриптом на bash</div>' 			>> index.html
	echo '<br>'													>> index.html
	echo '<table cellspacing="0" cellpadding="0" class="layout">' 							>>index.html
for ((a; a <= LIMIT_a; a++))
do
b=$z
for ((b; b <= LIMIT_b; b++))
	do
	j=$y
	for ((j; j <= LIMIT_j; j++))
		do
		i=$x
		for ((i; i <= $LIMIT_i; i++))
		do
	#Проверка доступности 'unknown|expired|unreachable|time out'
	errorcount="$(ping $a.$b.$j.$i -i 0.5 -c 1 2<&1 | grep -icE 'unknown|expired|unreachable|timeout|100% packet loss')" 
		echo '<tr>' 												>> index.html
		if [ "$errorcount" != "$Zero"  ]
		then
			#Пинг не прошел

				echo '<td class="leftcolRed">'"$a"'.'"$b"'.'"$j"'.'"$i"' - NOT Available</td>' 		>> index.html
				dnsresult=$(nslookup $a.$b.$j.$i | grep '.4.10'	| awk '{print $4}')
				sed -i 's/find/ /g' index.html
				echo '<td class="rightcol">'"$dnsresult"'</td>' 					>> index.html
				echo ""$a"."$b"."$j"."$i" - NOT Available"
		else
			#Пинг прошел
				echo '<td class="leftcolGreen">'"$a"'.'"$b"'.'"$j"'.'"$i"' - Available</td>' 		>> index.html
				dnsresult=$(nslookup $a.$b.$j.$i | grep '.4.10'	| awk '{print $4}')
				sed -i 's/find/ /g' index.html
				echo '<td class="rightcol">'"$dnsresult"'</td>' 					>> index.html
				echo ""$a"."$b"."$j"."$i" - Available"
		fi

		if (( $i < $LIMIT_i))
			then 
				let i=$i+1
			else
				break
		fi
	#Проверка доступности 'unknown|expired|unreachable|time out'
	errorcount="$(ping $a.$b.$j.$i -i 0.5 -c 1 2<&1 | grep -icE 'unknown|expired|unreachable|timeout|100% packet loss')" 

		if [ "$errorcount" != "$Zero"  ]
		then
			#Пинг не прошел

				echo '<td class="leftcolRed">'"$a"'.'"$b"'.'"$j"'.'"$i"' - NOT Available</td>' 		>> index.html
				dnsresult=$(nslookup $a.$b.$j.$i | grep '.4.10'	| awk '{print $4}')
				sed -i 's/find/ /g' index.html
				echo '<td class="rightcol">'"$dnsresult"'</td>' 					>> index.html
				echo ""$a"."$b"."$j"."$i" - NOT Available"
		else
			#Пинг прошел
				echo '<td class="leftcolGreen">'"$a"'.'"$b"'.'"$j"'.'"$i"' - Available</td>' 		>> index.html
				dnsresult=$(nslookup $a.$b.$j.$i | grep '.4.10'	| awk '{print $4}')
				sed -i 's/find/ /g' index.html
				echo '<td class="rightcol">'"$dnsresult"'</td>' 					>> index.html
				echo ""$a"."$b"."$j"."$i" - Available"
		fi
		echo '</tr>' 					                        				>> index.html
			done	
		done
	done
done
	echo '</table>' 												>> index.html
	echo '</body>' 													>> index.html
	echo '</html>' 													>> index.html
exit 0

#-ge - больше или равно
#-lt - меньше или равно

