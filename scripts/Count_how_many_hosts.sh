#!/bin/bash
		TodayIs=$(date +%d%b%y)
		echo $TodayIs
		cd /home/sad/ntsc_logs/$TodayIs/
		#Подсчет количества успешных пингов и DNS ответов:
		HowManyPing=$(grep 'leftcolGreen' test1.html | awk 'END{print NR}')
		let HowManyPing=$HowManyPing-1
		HowManyDNSres=$(grep 'rightcolDNSreslv' test1.html | awk 'END{print NR}')
		let HowManyDNSres=$HowManyDNSres-1
		echo '<div align = right>' > 				test1.tmp
		echo "$HowManyPing - Available hosts" >> 	test1.tmp
		echo "$HowManyDNSres - DNS names" >> 		test1.tmp
		echo '</div>' >> 							test1.tmp
		sed -i "31r /home/sad/ntsc_logs/$TodayIs/test1.tmp" /home/sad/ntsc_logs/$TodayIs/test1.html 
exit 0