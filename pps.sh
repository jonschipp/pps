#!/bin/bash

usage()
{
cat <<EOF

Calculates PPS, BPS, and percentage of line-rate (LR).
from Linux kernel statistics by reading from procfs.

      Options:

        -i interface

EOF
}

# Print warning and exit if no arguments specified
if [ $# -lt 1 ]; then
echo "Please specify an argument!, try $0 -h for more information"
exit 1
fi

# option and argument handling
while getopts "hi:" OPTION
do
     case $OPTION in
         h)
             usage
             exit
             ;;
         i)
             INT="$OPTARG"
	     ;;
	 *)
	     usage
	     exit
             ;;
     esac
done

echo "^C to exit"

# Get speed of NIC
speed=$(cat /sys/class/net/$INT/speed)

while true;
do

# Get number of packets for interface
rxppsold=$(awk "/$INT/ "'{ print $3 }' /proc/net/dev)
txppsold=$(awk "/$INT/ "'{ print $11 }' /proc/net/dev)

# Get number of bytes for interface
rxbytesold=$(awk "/$INT/ "'{ print $2 }' /proc/net/dev)
txbytesold=$(awk "/$INT/ "'{ print $10 }' /proc/net/dev)

sleep 1

# Get number of packets for interface again and subtract from old
rxppsnew=$(awk -v rxppsold="$rxppsold" "/$INT/ "'{ rxppsnew = $3; print rxppsnew - rxppsold }' /proc/net/dev)
txppsnew=$(awk -v txppsold="$txppsold" "/$INT/ "'{ txppsnew = $11; print txppsnew - txppsold }' /proc/net/dev)

# Get number of bytes for interface again and subtract from old
rxbytesnew=$(awk -v rxbytesold="$rxbytesold" "/$INT/ "'{ rxbytesnew = $2; print rxbytesnew - rxbytesold }' /proc/net/dev)
txbytesnew=$(awk -v txbytesold="$txbytesold" "/$INT/ "'{ txbytesnew = $10; print txbytesnew - txbytesold }' /proc/net/dev)

# Calculate percentage of line-rate from number of bytes per second.
rxlinerate=$(echo "$rxbytesnew / 125000 / $speed * 100" | bc -l)
txlinerate=$(echo "$txbytesnew / 125000 / $speed * 100" | bc -l)

# Format line-rate values by truncating after the 1000th decimal place.
rxlr=$(printf "%1.3f" $rxlinerate)
txlr=$(printf "%1.3f" $txlinerate)

# Print the results
echo -e "Int: ${INT} | [RX] PPS: ${rxppsnew} | Bytes: ${rxbytesnew} | % of LR: $rxlr \
-- [TX] PPS: ${txppsnew} | Bytes: $txbytesnew | % of LR: $txlr"

done
