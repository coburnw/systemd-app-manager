#!/bin/bash
service="myapp"

echo "systemd $service.service unit manager"

OPTIONS="edit install reload enable disable start stop status log quit"

select choice in $OPTIONS; do
    if [ "$choice" = "edit" ]; then
        # edit service file
        nano /lib/systemd/system/$service.service
    
    elif [ "$choice" = "install" ]; then
        # transfer the service file to systemd's control
        cp $service.service /lib/systemd/system
	 
    elif [ "$choice" = "reload" ]; then
	# reload service file after edit
	sudo systemctl daemon-reload

    elif [ "$choice" = "enable" ]; then
	# enable service
	sudo systemctl enable $service.service

    elif [ "$choice" = "disable" ]; then
	# disable service
	sudo systemctl disable $service.service

    elif [ "$choice" = "start" ]; then
	# start it up
	sudo systemctl start $service.service

    elif [ "$choice" = "stop" ]; then
	# stop it
	sudo systemctl stop $service.service

    elif [ "$choice" = "status" ]; then
	#check status
	systemctl status $service.service

    elif [ "$choice" = "log" ]; then
	# view log
	journalctl -u $service

    elif [ "$choice" = "quit" ]; then
	# view log
	exit
    fi
done
