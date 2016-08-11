DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sudo rmdir /sys/kernel/config/device-tree/overlays/JKW_HUMUS/ >/dev/null 2>&1;
sudo mkdir /sys/kernel/config/device-tree/overlays/JKW_HUMUS
dmesg >/tmp/pre_JKW_HUMUS_load
su -c 'cat '$DIR'/JKW_humus.dtbo > /sys/kernel/config/device-tree/overlays/JKW_HUMUS/dtbo'
dhclient -v eth0&;
sleep 3
dmesg >/tmp/post_JKW_HUMUS_load
diff /tmp/pre_JKW_HUMUS_load /tmp/post_JKW_HUMUS_load
rm /tmp/pre_JKW_HUMUS_load /tmp/post_JKW_HUMUS_load

