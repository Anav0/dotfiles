#!/bin/bash
destinations=("/media/igor/Pan E/backup/" "/media/igor/Pan D/backup/" "/media/igor/Pan G/backup/")
src="/home/igor/backup/"

rsync -qashPu --stats "/home/igor/Documents/Studia/" "/home/igor/backup/Dysk/Studia/"
rsync -qashPu --stats "/home/igor/Documents/obsidian/" "/home/igor/backup/Dysk/obsidian/"

for dest in "${destinations[@]}"
do
	rsync -qashPu --stats --log-file="log.log" "$src" "$dest" 
done

notify-send -u critical -a "Backup" "Local backup finished"
