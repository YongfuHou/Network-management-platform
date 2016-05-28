#!/bin/bash

iwinfo |grep "Signal" |awk '{printf $1" "$2" "$3"\n"}';    
iwinfo |grep "Bit" |awk '{printf $1" "$2" "$3" "$4"\n"}' ; 
iwinfo |grep "Tx-Power" |awk '{printf $1" "$2" "$3"\n"}';  
iwinfo |grep "Mode:" |awk '{printf $3" "$4" "$5" "$6"\n"}';
iwinfo |grep "Tx-Power" |awk '{printf $4" "$5" "$6"\n"}';  