#!/bin/sh
### nilsonmorales
##Este es el comando para la terea programada de monitorizar wlan0
##Este comando reescribe el cron actual sin borrar otras tareas. 
##Ademas envia un registro a /var/log 

crontab -l | { cat; echo "* * * * * /usr/bin/sns-monitor.sh >/var/log/monitor-de-sns.log 2>&1"; } | crontab -
