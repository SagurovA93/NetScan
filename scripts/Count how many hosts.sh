#!/bin/bash
		#Подсчет количества успешных пингов и DNS ответов:
		HowManyPing=$(grep 'leftcolGreen' $NewfileName.html | awk 'END{print NR}')
		let HowManyPing=$HowManyPing-1
		HowManyDNSres=$(grep 'rightcolDNSreslv' $NewfileName.html | awk 'END{print NR}')
		let HowManyDNSres=$HowManyDNSres-1
		echo '<div align = right>' > 				$NewfileName.tmp
		echo "$HowManyPing - Available hosts" >> 	$NewfileName.tmp
		echo "$HowManyDNSres - DNS names" >> 		$NewfileName.tmp
		echo '</div>' >> 							$NewfileName.tmp
		echo $NewfileName.html
		sed -i '31r $HOME/ntsc_logs/$TodayIs/$NewfileName.tmp' $HOME/ntsc_logs/$TodayIs/$NewfileName.html 
exit 0