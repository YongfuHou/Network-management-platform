#!/bin/bash

 IF=$1                                                                 
 RXpre=$(cat /sys/class/net/$1/statistics/rx_bytes| awk '{print $1}') 
 TXpre=$(cat /sys/class/net/$1/statistics/tx_bytes| awk '{print $1}')  
 sleep 1                                                               
 RXnext=$(cat /sys/class/net/$1/statistics/rx_bytes| awk '{print $1}')
 TXnext=$(cat /sys/class/net/$1/statistics/tx_bytes| awk '{print $1}') 

 RX=$((${RXnext}-${RXpre}))                                            
 TX=$((${TXnext}-${TXpre}))                                            

 if [[ $RX -lt 1024 ]];then                                            
 RXBS="${RX}\tB/s" 
 RXbs="$((RX*8))\tbit/s" 
 elif [[ $RX -gt 1048576 ]];then                                       
 RXBS=$(echo $RX | awk '{print $1/1048576"\t""MB/s"}')
 RXbs=$(echo $RX | awk '{print $1/1048576*8"\t""Mbit/s"}')
 else                                                                  
 RXBS=$(echo $RX | awk '{print $1/1024"\t""KB/s"}')
 RXbs=$(echo $RX | awk '{print $1/1024*8"\t""Kbit/s"}') 
 fi
  
 if [[ $TX -lt 1024 ]];then                                            
 TXBS="${TX}\tB/s"
 TXbs="$((TX*8))\tbit/s"
 elif [[ $TX -gt 1048576 ]];then                                       
 TXBS=$(echo $TX | awk '{print $1/1048576"\t""MB/s"}')
 TXbs=$(echo $TX | awk '{print $1/1048576*8"\t""Mbit/s"}')
 else                                                                  
 TXBS=$(echo $TX | awk '{print $1/1024"\t""KB/s"}')
 TXbs=$(echo $TX | awk '{print $1/1024*8"\t""Kbit/s"}')
 fi

 echo -e "$1\t\t$RXBS\t$RXbs\t$TXBS\t$TXbs\t"                          


