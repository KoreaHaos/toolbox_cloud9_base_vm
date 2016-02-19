function init() {
    clear
    if [ -d "haos_bash" ]
    then
        cd haos_bash;
        explain_what_can_be_done;
    else
        echo "I can not do anything, sorry!";
    fi
}

function explain_what_can_be_done() {
    
    local directories_and_files_in_current_directory=($(ls))
    declare -a haos_bash_files_in_current_directory;

    local count_of_dir_and_files=0;
    local count_of_haos_bash_files=0;
    
    for dir_or_file in "${directories_and_files_in_current_directory[@]}"
    do
        if [[ $dir_or_file == *".haos_bash" ]]
        then
            haos_bash_files_in_current_directory[$count_of_haos_bash_files]="$dir_or_file"
            let "count_of_haos_bash_files+=1";
        fi
        let "count_of_dir_and_files+=1"
    done

    for index in "${!haos_bash_files_in_current_directory[@]}"
    do 
      printf "%s : %s \n" "$index" "${haos_bash_files_in_current_directory[$index]}"
    done

    printf "\n"
    
    local users_choice=-1;
    
    while [[ $users_choice =~ ^-?[0-9]+$ ]] && [ $users_choice -ge -1 ] && [ $users_choice -le $((${#haos_bash_files_in_current_directory[@]}-1)) ]
    do
        if [ $users_choice -gt -1 ]
        then
            bash ${haos_bash_files_in_current_directory[$users_choice]};
            # ToDo put pause/clear screen here.
        fi
        
        read -p "Choose one : " users_choice;
        if [[ $users_choice =~ ^-?[0-9]+$ ]] && [ $users_choice -ge 0 ] && [ $users_choice -le $((${#haos_bash_files_in_current_directory[@]}-1)) ]
        then
            let "users_choice = $users_choice";
        elif [ "$users_choice" = "q" ]
        then
            echo "Bye now!";
        else
            echo "Huh? enter an appriate answer! ('q' to quit)";
            let "users_choice = -1";
        fi
    done
}

init
