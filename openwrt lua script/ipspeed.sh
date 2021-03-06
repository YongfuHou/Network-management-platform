#!/bin/sh
echo "Collecting data..."
echo ""
cat /proc/net/arp | grep : | grep ^192 | grep -v 00:00:00:00:00:00 | awk '{print $1}' > mac-ip                   

iptables -N UPLOAD                         
iptables -N DOWNLOAD
while read line;do iptables -I FORWARD 1 -s $line -j UPLOAD;done < mac-ip
while read line;do iptables -I FORWARD 1 -d $line -j DOWNLOAD;done < mac-ip
sleep 1     
echo "Download speed:"
echo ""
iptables -nvx -L FORWARD | grep DOWNLOAD | awk '{print $9"\t"$2/1024/1" KB/s""\t"$1/10" packets/s"}' | sort -n  
echo ""
echo "Upload speed:"
echo ""
iptables -nvx -L FORWARD | grep UPLOAD | awk '{print $8"\t"$2/1024/1" KB/s""\t"$1/10" packets/s"}' | sort -n  
 
while read line;do iptables -D FORWARD -s $line -j UPLOAD;done < mac-ip
while read line;do iptables -D FORWARD -d $line -j DOWNLOAD;done < mac-ip
iptables -X UPLOAD
iptables -X DOWNLOAD