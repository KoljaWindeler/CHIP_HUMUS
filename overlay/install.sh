DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp $DIR"/dip-2a-1.dtbo" /lib/firmware/nextthingco/chip/
echo "w1_ds2431" >> /etc/modules

#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "@reboot "$DIR"/load.sh" >> mycron
#install new cron file
crontab mycron
rm mycron
