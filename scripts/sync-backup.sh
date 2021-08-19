#!/bin/bash

destinations=("/media/igor/Dysk lokalny/backup/" "/media/igor/Dysk lokalny1/backup/" "/media/igor/Interracial disk/source/")
src="/home/igor/source/"

sync_with_source=("/home/igor/Documents/Keepass dbs" "/home/igor/Documents/Keys and certs")
private_catalog="/home/igor/source/Dysk/private/"

rsync -qarshPu --stats "/home/igor/Documents/Studia/" "/home/igor/source/Dysk/Studia/"
rsync -qarshPu --stats "/home/igor/Documents/obsidian/" "/home/igor/source/Dysk/obsidian/"

for path in "${sync_with_source[@]}"
do
	rsync -qarshPu --stats "$path" "$private_catalog"
done

for dest in "${destinations[@]}"
do
	rsync -qarshPu --stats --log-file="log.log" "$src" "$dest" 
done

notify-send -u critical -a "Backup" "Local backup finished"
