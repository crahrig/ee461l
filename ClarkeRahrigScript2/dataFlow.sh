#!/bin/bash

#capture the intitial sent a recievied packets
#irecieve=$(netstat | tail -1)
#isent=$(netstat | tail -1)
#calculate the data usage
idatausage=$(cat /sys/class/net/eth1/statistics/rx_bytes)

#setting initial data usage
datausage=0
pdatausage=0

while [ $datausage -lt $2 ]
  do
    date=$(date)
    cdatausage=$(cat /sys/class/net/eth1/statistics/rx_bytes)
    datausage=$(($cdatausage - $idatausage))
    inspeed=$((($datausage - $pdatausage) / 2))
    outspeed=$((($datausage - $pdatausage) / 2))
    pdatausage=$datausage
    echo $date Now_In_Speed: $inspeed kbps Now_Out_Speed: $outspeed kbps Data_Usage: $datausage kb
    sleep 2
  done

echo WOULD HAVE THEN SENT EMAIL TO ME: 'mail -s "Data Usage Exceeded" "crahrig@gmail.com" <<< "Why did you do this to yourself you exceded $2 MB"'
