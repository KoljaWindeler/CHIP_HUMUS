#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# "ip link show eth0" to display all info concerning device eth0.
# That output gets piped to awk which searches for lines 
# containing "ether" and prints the second field of such lines.
# That second field is the MAC address of eth0.
MAC_ADDR=$(ip link show eth0 | awk '/ether/ {print $2}')

# sed modifies (configures) the file /opt/CHIP_HUMUS/overlay/load.sh by
# appending the $MAC_ADDR acquired  above to the null variable 
# assignment to MAC_ADDR.
/bin/sed -i.bak s/^MAC_ADDR=$/MAC_ADDR=$MAC_ADDR/ $DIR/load_mac.sh

# Once that file has been modified (configured), it can be re-executed.
$DIR/load_mac.sh
