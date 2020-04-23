#!/bin/bash
# Replace the ___.___.___.___'s with IP address and
# Replace the ---.---.---.---'s with Default Gateway

# The script reads a list of IPs, and iterates them using 'i'
# On the i'th element, it brings ips[i] up on eth0. 
# iterations 0-2 use the same default gateway
# iterations 3-5 use the same default gateway
# After the script brings the interface up, it switches the last one off (if it's over 0)


ips=( ___.___.___.___  ___.___.___.___  ___.___.___.___  ___.___.___.___  ___.___.___.___)
while :
do
i=0
    for i in ${!ips[@]}; do
        ifconfig eth0 ${ips[$i]} up
        ifconfig eth0

        if [ $i -gt 2 ];then
            ip route add default via ---.---.---.--- dev eth0
        else
            ip route add default via ---.---.---.--- dev eth0
        fi
        if [ $i -gt 0 ];then
            x=$(($i-1))
            ifconfig eth0 ${ips[$x]} down
        fi
        sleep 60
    done
done
