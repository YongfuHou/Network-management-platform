#!/bin/bash

iw dev wlan0 station dump |grep "Station" |awk '{print $2}' |sort -t : -k 1 -n > MACaddress

echo -e "IP address\tHW address\t\tSignal\t\tTx bitrate\tRx bitrate\tName"

while read line

do

m=$line

a=$(iw dev wlan0 station dump |grep "$m" |awk '{print $2}')

b=$(iw dev wlan0 station dump |grep -A 9 "$m" |grep "signal:" |awk '{print $2" "$3}')

c=$(iw dev wlan0 station dump |grep -A 10 "$m" |grep "tx bitrate" |awk '{print $3" "$4}')

d=$(iw dev wlan0 station dump |grep -A 11 "$m" |grep "rx bitrate" |awk '{print $3" "$4}')

e=$(cat /proc/net/arp |grep "$m" |awk '{print $1}')

f=$(cat /tmp/dhcp.leases |grep "$m" |awk '{print $4}')

echo -e "$e\t$a\t$b\t\t$c\t$d\t$f" 

done < MACaddress