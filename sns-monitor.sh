#!/bin/bash
### Escrito por nilsonmorles
### Este script monitoriza que estes conectado a wifi 
### Un cron revisa cada minuto la conexión, de no haber, intenta conectar automaticamente
### Es necesario utilizar Simple Network Setup ( sns ) para funcionar 
### Tambien es necesaria tener sincronizada la hora y fecha para que cron gestione bien.

## Forma de uso 
## 1- Colocar sns-monitor.sh en /usr/bin
## 2- Ejecutar el script cron-sns-monitor.sh 
## Mensajes de información y tiempo se pueden variar si se quiere.

wlan=`/sbin/ifconfig wlan0 | grep inet\ addr | wc -l`
 if [ $wlan -eq 0 ]; then
     gtkdialog-splash -placement center -timeout 6 -bg red -fg white -text "No hay conexión, reconectando...." 
     /usr/sbin/networkdisconnect && /usr/local/simple_network_setup/rc.network start &
 else
##Comente la linea 9, simplemente es para pruebas.
     yaf-splash -placement top-left -bg green -fg black green -timeout 1 -text " ***CONECTADO****"
fi