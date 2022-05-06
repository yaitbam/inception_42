#!/bin/sh

echo "Start Backup service every 10 minutes for MariaDB database.."

while true;
do
	# Take the current date
	time=$(date '+%Y-%m-%d %H:%M:%S')
	
	# Create new folder with the current date
	backup_folder="backup_${time}"
	mkdir "/backup/$backup_folder"
	
	# Copy the data from "db-data" to the backup Folder
	echo "Backup mariadb server at $time in $backup_folder folder"
	cp -Rf /db-data/* /backup/"${backup_folder}"
	
	# Sleep for 10 minutes
	sleep 10m
done

exit 0