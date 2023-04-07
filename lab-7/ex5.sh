#!/bin/bash

keep_running=true
count=0
echo "Starting..."
menu="---- MAIN MENU ----\n\t- 1. Show disk usage\n\t- 2. Uptime on the System\n\t- 3. Users logged into this system\n\t- q. End program"

while [ $keep_running == true ]
do
	echo -e $menu
	read input
	if (( input=="q" )); then
		keep_running=false
		break
	elif (( input=='1' )); then
		echo -w "\n$(df)\n"
	elif (( input=='2' )); then
		echo "\n$(uptime)\n"
	elif (( input=='3' )); then
		echo "\n$(who)\n"
	else
		echo "Select a valid option."
	fi
done

echo "Program finished."
