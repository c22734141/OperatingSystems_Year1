# !/bin/bash

# Main function
main () {
    keep_running=true
    count=0
    echo "Starting..."
    menu="\t\t* Bash Commands *\t\t\n\t- 1. List files\n\t- 2. Show free disk space\n\t- 3. Show system path\n\t- 4. Display command history\n\t- 5. Backup files\n\t- 6. Exit"

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
                    echo -e "\n$(df)\n"
            elif (( main_input=='3' )); then
                    echo -e "\n$PATH\n"
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
    cp -r "$backup_directory/"* "$(pwd)/BackupFolder" # Using absolute path
    echo -e "\nAll folders and files insede that directory where duplicated into $(pwd)/BackupFolder\n"
    echo -e "Recursively listing content of BackupFolder:\n"
    echo -e "$(tree $(pwd)/BackupFolder)\n"
}

main

echo "Program finished."
