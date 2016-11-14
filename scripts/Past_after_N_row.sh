#!/bin/bash
#Вставить определенную инфу в документ после N-ой строки:
HowManyPing=$(grep 'Green' '/home/sad/ntsc_logs/10ноя16/test.html' | awk 'END{print NR}')
HowManyDNSres=$(grep 'DNS' '/home/sad/ntsc_logs/10ноя16/test.html' | awk 'END{print NR}')
cd $HOME/test
echo "$HowManyPing - Available hosts" > file1.txt
echo "$HowManyDNSres - DNS names" >> file1.txt
awk '{print} NR==2 {while (getline < "file1.txt") print}' file2.txt > result.txt
exit 0