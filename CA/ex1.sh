# !/bin/bash

# Main function
main () {
    keep_running=true
    count=0
    echo "Starting..."
    menu="\t\t* Bash Commands *\t\t\n\t1. List files\n\t2. Show free disk space\n\t3. Show system path\n\t4. Display command history\n\t5. Backup files\n\t6. Exit"

    while [ $keep_running == true ]
    do
            echo -e $menu
            read main_input
            if (( main_input=='6' )); then
                    keep_running=false
                    break
            elif (( main_input=='1' )); then
                    echo -e "\n$(ls)\n"
            elif (( main_input=='2' )); then
                    echo -e "\n$(df -h)\n"
            elif (( main_input=='3' )); then
                    echo -e "\n$(pwd)\n"
            elif (( main_input=='4' )); then
                    echo -e "\n$(history)\n"
            elif (( main_input=='5' )); then
                    backup
            else
                    echo "Select a valid option."
            fi
    done
}

# Backup function
backup () {
    echo "Enter directory to backup: "
    read backup_directory
    mkdir "$(pwd)/BackupFolder" # Using absolute path
    cp -r "$backup_directory/"* "$(pwd)/BackupFolder" # Using relative path for dir to backup and absolute for BackupFolder
    echo -e "\nAll folders and files insede that directory where duplicated into $(pwd)/BackupFolder\n"
    echo -e "Recursively listing content of BackupFolder:\n"
    echo -e "$(tree $(pwd)/BackupFolder)\n"
}

main

echo "Program finished."
