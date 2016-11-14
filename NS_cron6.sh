#!/bin/bash
#Cкрипт для запуска по крону (первый диапазон сети с 10.4.0.1 до 10.4.30.255)
TodayIs=$(date +%d%b%y)
exec 2>$0.err
mkdir $HOME/ntsc_logs/$TodayIs
cd $HOME/ntsc_logs/$TodayIs
NewfileName=log6
#Гвоздями все прибито для автозапуска скрипта.
FirstOctet=10 
SecondOctet=4 
ThirdOctet=201
FourthOctet=1
tempVarFourth=$FourthOctet
tempVarThird=$ThirdOctet
tempVarSecond=$SecondOctet
tempVarFirst=$FirstOctet
#Проверка введенного начального адреса
type_Fourth=0
type_Third=0
type_Second=0
type_First=0
# Проверка: является ли ввод числом?
expr $tempVarFirst : '-\?[0-9]\+$' >/dev/null && type_First=1 || type_First=0
expr $tempVarSecond : '-\?[0-9]\+$' >/dev/null && type_Second=1 || type_Second=0
expr $tempVarThird : '-\?[0-9]\+$' >/dev/null && type_Third=1 || type_Third=0
expr $tempVarFourth : '-\?[0-9]\+$' >/dev/null && type_Fourth=1 || type_Fourth=0


correct_g=0
until [ $correct_g -eq 1 ]
do
# Если введеное значение - число и оно принадлежит промежутку от 1 до 255 - все ок. 
	if (( type_First == 1 && tempVarFirst >= 1 && tempVarFirst <= 255 ))
		then
#			echo "$tempVarFirst допустимое значение"
			break
		else 	
			echo	"Введено недопустимое значение первого октета"
			echo 	"Ведите новое значение первого октета _?_.bbb.jjj.iii от 1 до 255:"
			read tempVarFirst
			expr $tempVarFirst : '-\?[0-9]\+$' >/dev/null && type_First=1 || type_First=0
	fi
done
FirstOctet=$tempVarFirst
until [ $correct_g -eq 1 ]
do
	if (( type_Second == 1 && tempVarSecond >= 0 && tempVarSecond <= 255 ))
		then
#			echo "$tempVarSecond допустимое значение"
			break
		else 
			echo	"$tempVarZ Введено недопустимое значение второго октета"
			echo 	"Ведите новое значение второго октета $FirstOctet._?_.jjj.iii от 0 до 255:"
			read tempVarSecond
			expr $tempVarSecond : '-\?[0-9]\+$' >/dev/null && type_Second=1 || type_Second=0
	fi
done
SecondOctet=$tempVarSecond
until [ $correct_g -eq 1 ]
do
	if (( type_Third == 1 && tempVarThird >= 0 && tempVarThird <= 255 ))
		then
#			echo "$tempVarThird допустимое значение"
			break
		else 
			echo	"Введено недопустимое значение третьего октета"
			echo 	"Ведите новое значение третьего октета $FirstOctet.$SecondOctet._?_.iii от 0 до 255:"
			read tempVarThird
			expr $tempVarThird : '-\?[0-9]\+$' >/dev/null && type_Third=1 || type_Third=0
			
	fi
done
ThirdOctet=$tempVarThird
until [ $correct_g -eq 1 ]
do
	if (( type_Fourth == 1 && tempVarFourth >= 1 && tempVarFourth <= 255 ))
		then
#			echo "$tempVarFourth допустимое значение"
			break
		else 
			echo	"Введено недопустимое значение четвертого октета"
			echo 	"Ведите новое значение четвертого октета $FirstOctet.$SecondOctet.$ThirdOctet._?_ от 1 до 255:"
			read tempVarFourth
			expr $tempVarFourth : '-\?[0-9]\+$' >/dev/null && type_Fourth=1 || type_Fourth=0	
	fi
done
FourthOctet=$tempVarFourth 
LimFirstOc=10
LimSecondOc=4
LimThirdOc=240
LimFourthOc=254
# Проверка введенного конечного адреса
tempLimFirst=$LimFirstOc
tempLimSecond=$LimSecondOc
tempLimThird=$LimThirdOc
tempLimFourth=$LimFourthOc

typeLimFirst=0
typeLimSecond=0
typeLimThird=0
typeLimFourth=0

# Проверка: является ли ввод числом?
expr $tempLimFirst : '-\?[0-9]\+$' >/dev/null && typeLimFirst=1 || typeLimFirst=0
expr $tempLimSecond : '-\?[0-9]\+$' >/dev/null && typeLimSecond=1 || typeLimSecond=0
expr $tempLimThird : '-\?[0-9]\+$' >/dev/null && typeLimThird=1 || typeLimThird=0
expr $tempLimFourth : '-\?[0-9]\+$' >/dev/null && typeLimFourth=1 || typeLimFourth=0

until [ $correct_g -eq 1 ]
do
	if (( typeLimFirst==1 && tempLimFirst >= 1 && tempLimFirst <= 255 ))
		then
#			echo "$tempLimFirst допустимое значение"
			break
		else 
			echo	"Введено недопустимое значение первого октета"
			echo 	"Ведите новое значение первого октета _?_.bbb.jjj.iii от 1 до 255:"
			read tempLimFirst
			expr $tempLimFirst : '-\?[0-9]\+$' >/dev/null && typeLimFirst=1 || typeLimFirst=0
	fi
done
LimFirstOc=$tempLimFirst
until [ $correct_g -eq 1 ]
do
	if (( typeLimSecond==1 && tempLimSecond >= 0 && tempLimSecond <= 255 ))
		then
#			echo "$tempLimSecond допустимое значение"
			break
		else 
			echo	"$tempLimSecond Введено недопустимое значение второго октета"
			echo 	"Ведите новое значение второго октета $LimFirstOc._?_.jjj.iii от 0 до 255:"
			read tempLimSecond
			expr $tempLimSecond : '-\?[0-9]\+$' >/dev/null && typeLimSecond=1 || typeLimSecond=0
	fi
done
LimSecondOc=$tempLimSecond
until [ $correct_g -eq 1 ]
do
	if (( typeLimThird==1 && tempLimThird >= 0 && tempLimThird <= 255 ))
		then
#			echo "$tempLimThird допустимое значение"
			break
		else 
			echo	"Введено недопустимое значение третьего октета"
			echo 	"Ведите новое значение третьего октета $LimFirstOc.$LimSecondOc._?_.iii от 0 до 255:"
			read tempLimThird
			expr $tempLimThird : '-\?[0-9]\+$' >/dev/null && typeLimThird=1 || typeLimThird=0
			
	fi
done
LimThirdOc=$tempLimThird
until [ $correct_g -eq 1 ]
do
	if (( typeLimFourth==1 && tempLimFourth >= 1 && tempLimFourth <= 255 ))
		then
#			echo "$tempLimFourth допустимое значение"
			break
		else 
			echo	"Введено недопустимое значение четвертого октета"
			echo 	"Ведите новое значение четвертого октета $LimFirstOc.$LimSecondOc.$LimThirdOc._?_ от 1 до 255:"
			read tempLimFourth
			expr $tempLimFourth : '-\?[0-9]\+$' >/dev/null && typeLimFourth=1 || typeLimFourth=0
	fi
done
LimFourthOc=$tempLimFourth
    
echo "Сканируем диапазон адресов $FirstOctet.$SecondOctet.$ThirdOctet.$FourthOctet - $LimFirstOc.$LimSecondOc.$LimThirdOc.$LimFourthOc"

hundred=100
Zero=0
#Подсчет количества узлов в сети
echo "<!DOCTYPE html>"																																			>> $NewfileName.html
echo '<html>' 																																					>> $NewfileName.html
echo '<head>' 																																					>> $NewfileName.html
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' 																						>> $NewfileName.html
echo "<title>$FirstOctet.$SecondOctet.$ThirdOctet.$FourthOctet - $LimFirstOc.$LimSecondOc.$LimThirdOc.$LimFourthOc</title>"										>> $NewfileName.html
echo '<style type="text/css">'																																	>> $NewfileName.html
echo	'table {border: 1px solid #000}'																														>> $NewfileName.html
echo    'tr {}'																																					>> $NewfileName.html
echo   	'.layout {'																																				>> $NewfileName.html
echo   	'width: 100%; /* Ширина всей таблицы в процентах */'																									>> $NewfileName.html
echo   	'}'																																						>> $NewfileName.html
echo   	'.layout TD {'																																			>> $NewfileName.html
echo   	'vertical-align: top; /* Вертикальное выравнивание в ячейках */'																						>> $NewfileName.html
echo   	'}'																																						>> $NewfileName.html
# Стиль для ячейки НЕ успешного пинга
echo   	'TD.leftcolRed {'																																		>> $NewfileName.html
echo    'width: 180px;border: 1px solid #000; background: red;/* Ширина левой колонки */'																		>> $NewfileName.html
echo   	'}'																																						>> $NewfileName.html
# Стиль для ячейки успешного пинга
echo   	'TD.leftcolGreen {'																																		>> $NewfileName.html
echo    'width: 180px;border: 1px solid #000;background: green;/* Ширина левой колонки  */'																		>> $NewfileName.html
echo   	'}'																																						>> $NewfileName.html
echo   	'TD.rightcolDNSreslv {'																																	>> $NewfileName.html
echo    'width: 180px;border: 1px solid #000;background: #F0FFF0;/* Успешный DNS resolve */'																	>> $NewfileName.html
echo   	'}'																																						>> $NewfileName.html
echo   	'TD.rightcol {'																																			>> $NewfileName.html
echo    'width: 180px;border: 1px solid #000;/* Не получено сведений об хостейме */'																			>> $NewfileName.html
echo   	'}'																																						>> $NewfileName.html
echo  	'</style>'																																				>> $NewfileName.html
echo '</head>' 																																					>> $NewfileName.html
echo '<body>' 																																					>> $NewfileName.html
	echo "<div align = "center">диапазон адресов $FirstOctet.$SecondOctet.$ThirdOctet.$FourthOctet - $LimFirstOc.$LimSecondOc.$LimThirdOc.$LimFourthOc $(date)</div>" 	>> $NewfileName.html
	echo '<br>'																																					>> $NewfileName.html
	echo '<table cellspacing="0" cellpadding="0" class="layout">' 																								>> $NewfileName.html
for ((FirstOctet; FirstOctet <= $LimFirstOc; FirstOctet++))
do
SecondOctet=$tempVarSecond
for ((SecondOctet; SecondOctet <= $LimSecondOc; SecondOctet++))
	do
	ThirdOctet=$tempVarThird
	for ((ThirdOctet; ThirdOctet <= $LimThirdOc; ThirdOctet++))
		do
		FourthOctet=$tempVarFourth
		for ((FourthOctet; FourthOctet <= $LimFourthOc; FourthOctet++))
		do
	#Проверка доступности 'unknown|expired|unreachable|time out'
	errorcount="$(ping $FirstOctet.$SecondOctet.$ThirdOctet.$FourthOctet -i 0.5 -c 1 2<&1 | grep -icE 'unknown|expired|unreachable|timeout|100% packet loss')" 
		
		echo '<tr>' 																																			>> $NewfileName.html
		if [ "$errorcount" != "$Zero"  ]
		then
			#Пинг не прошел

echo '<td class="leftcolRed">' "$FirstOctet"'.'"$SecondOctet"'.'"$ThirdOctet"'.'"$FourthOctet"' - NOT Available</td>' 											>> $NewfileName.html
dnsresult=$(nslookup $FirstOctet.$SecondOctet.$ThirdOctet.$FourthOctet | grep "$FourthOctet.$ThirdOctet.$SecondOctet.$FirstOctet"	| awk '{print $4}')
				case $dnsresult in
					
					find)
						echo '<td class="rightcol">' "$dnsresult" '</td>' 		>> $NewfileName.html
						sed -i 's/find/ /g' $NewfileName.html
						;;
					*)
						echo '<td class="rightcolDNSreslv">' "$dnsresult" '</td>' 		>> $NewfileName.html
						;;
				esac
				echo "$FirstOctet.$SecondOctet.$ThirdOctet.$FourthOctet - NOT Available"
		else
			#Пинг прошел
echo '<td class="leftcolGreen">' "$FirstOctet"'.'"$SecondOctet"'.'"$ThirdOctet"'.'"$FourthOctet"' - Available</td>' 												>> $NewfileName.html
dnsresult=$(nslookup $FirstOctet.$SecondOctet.$ThirdOctet.$FourthOctet | grep "$FourthOctet.$ThirdOctet.$SecondOctet.$FirstOctet"	| awk '{print $4}')
				case $dnsresult in
					
					find)
						echo '<td class="rightcol">' "$dnsresult" '</td>' 		>> $NewfileName.html
						sed -i 's/find/ /g' $NewfileName.html
						;;
					*)
						echo '<td class="rightcolDNSreslv">' "$dnsresult" '</td>' 		>> $NewfileName.html
						;;
				esac
				echo "$FirstOctet.$SecondOctet.$ThirdOctet.$FourthOctet -  Available"
		fi

		if (( $FourthOctet < $LimFourthOc))
			then 
				let FourthOctet=$FourthOctet+1
			else
				break
		fi
	#Проверка доступности 'unknown|expired|unreachable|time out'
	errorcount="$(ping $FirstOctet.$SecondOctet.$ThirdOctet.$FourthOctet -i 0.5 -c 1 2<&1 | grep -icE 'unknown|expired|unreachable|timeout|100% packet loss')" 
		
																																								>> $NewfileName.html
		if [ "$errorcount" != "$Zero"  ]
		then
			#Пинг не прошел

echo '<td class="leftcolRed">' "$FirstOctet"'.'"$SecondOctet"'.'"$ThirdOctet"'.'"$FourthOctet"' - NOT Available</td>'											 >> $NewfileName.html
dnsresult=$(nslookup $FirstOctet.$SecondOctet.$ThirdOctet.$FourthOctet | grep "$FourthOctet.$ThirdOctet.$SecondOctet.$FirstOctet"	| awk '{print $4}')
				case $dnsresult in
					
					find)
						echo '<td class="rightcol">' "$dnsresult" '</td>' 		>> $NewfileName.html
						sed -i 's/find/ /g' $NewfileName.html
						;;
					*)
						echo '<td class="rightcolDNSreslv">' "$dnsresult" '</td>' 		>> $NewfileName.html
						;;
				esac
				echo "$FirstOctet.$SecondOctet.$ThirdOctet.$FourthOctet - NOT Available"
		else
			#Пинг прошел
echo '<td class="leftcolGreen">' "$FirstOctet"'.'"$SecondOctet"'.'"$ThirdOctet"'.'"$FourthOctet"' - Available</td>' 												>> $NewfileName.html
dnsresult=$(nslookup $FirstOctet.$SecondOctet.$ThirdOctet.$FourthOctet | grep "$FourthOctet.$ThirdOctet.$SecondOctet.$FirstOctet"	| awk '{print $4}')
				case $dnsresult in
					
					find)
						echo '<td class="rightcol">' "$dnsresult" '</td>' 		>> $NewfileName.html
						sed -i 's/find/ /g' $NewfileName.html
						;;
					*)
						echo '<td class="rightcolDNSreslv">' "$dnsresult" '</td>' 		>> $NewfileName.html
						;;
				esac
				echo "$FirstOctet.$SecondOctet.$ThirdOctet.$FourthOctet -  Available"
		fi
		echo '</tr>' 					                        																								>> $NewfileName.html
			done	
		done
	done
done
	echo '</table>' 																																			>> $NewfileName.html
	echo '</body>' 																																				>> $NewfileName.html
	echo '</html>' 																																				>> $NewfileName.html
exit 0

#-ge - больше или равно
#-lt - меньше или равно
