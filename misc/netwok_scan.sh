#!/bin/bash

echo -n "[*]Enter your current ip: " ; read ip
new_ip=$(echo $ip  | sed 's/.$//' | sed 's/.$//')
s="0/24"
full_network="${new_ip}${s}"

#looking for hosts
echo "[*]Scanning full network"
nmap -sn $full_network | awk '/Nmap scan/{gsub(/[()]/,"",$NF); print $NF > "nmap_scanned_ips"}'

#get the no. of ips
no_ip=$(wc -l nmap_scanned_ips | awk '{print $1}')
echo "$no_ip ip found"
#scanning each ip
echo "[*]Scanning each ip"
for ip in $(cat nmap_scanned_ips); do echo "Scanning $ip" ;printf "<--------------------------->\n" >> ip-info.txt;nmap -sC -sV $ip >> ip-info.txt ; done
printf "[*]Results stored: ip-info.txt"