#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sleep 3

# Define the MAC address to be assigned to eth0.  If this is the
# first time this script is executed, $MAC_ADDR = the empty string.
# In that case, the script initiate_mac.sh is called and this script 
# is exited.  initiate_mac.sh initialises the present script by assigning a 
# MAC address to MAC_ADDR.  initiate_mac.sh then re-calls the present
# script to finalize the setup of eth0.
MAC_ADDR=

# If MAC_ADDR is empty, then call initiate_mac.sh in order to
# give it a value, then exit.  Otherwise, call ip to assign $MAC_ADDR
# to eth0, then call dhclient to get an IP address.
if [ -z $MAC_ADDR ] ;
  then $DIR/initiate_mac.sh;
else
  /bin/ip link set dev eth0 address $MAC_ADDR;
  /sbin/dhclient eth0;
fi
