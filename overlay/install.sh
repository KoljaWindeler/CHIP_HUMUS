cp JKW_humus.dtbo /lib/firmware/nextthingco/chip/dip-2a-3.dtbo
echo "w1_ds2431" >> /etc/modules

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "@reboot "$DIR"/load.sh" >> mycron
#install new cron file
crontab mycron
rm mycron
