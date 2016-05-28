#!/bin/bash

a=$(netstat -at |grep -o tcp |wc -w)        
echo "tcp-allsockets:$a"  
b=$(netstat -tl |grep -o tcp |wc -w)        
echo "tcp-listeningsockets:$b" 
c=$(netstat -at |grep -o ESTABLISHED |wc -w)
echo "tcp-activeconnectedsockets:$c" 

e=$(netstat -au |grep -o udp |wc -w)        
echo "udp-allsockets:$e"
f=$(netstat -ul |grep -o udp |wc -w)        
echo "udp-listeningsockets:$f" 
g=$(netstat -au |grep -o ESTABLISHED |wc -w)
echo "udp-activeconnectedsockets:$g" 

h=$(netstat -aw |grep -o raw |wc -w)        
echo "raw-allsockets:$h"
i=$(netstat -wl |grep -o raw |wc -w)        
echo "raw-listeningsockets:$i" 
j=$(netstat -aw |grep -o ESTABLISHED |wc -w)
echo "raw-actvieconnectedsockets:$j" 
