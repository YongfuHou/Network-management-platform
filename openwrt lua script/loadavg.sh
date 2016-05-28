#!/bin/bash

cat /proc/loadavg |awk '{ printf "1min:"$1"\t""5min:"$2"\t""15min:"$3"\n" } ' /proc/loadavg  