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

    if [ ${#haos_bash_files_in_current_directory[@]} -gt 0 ]
    then
        
        function display_choices() {
            clear;
            printf "\n"
            for index in "${!haos_bash_files_in_current_directory[@]}"
            do 
              # display the index the user will choose.
              printf "%s : " "$(($index+1))";
              # display the file that choice is associated with.
              printf "%s\n" "${haos_bash_files_in_current_directory[$index]}"
            done
            printf "\n"
        }
        
        local users_choice=-1;
        
        while [[ $users_choice =~ ^-?[0-9]+$ ]] && [ $users_choice -ge -1 ] && [ $users_choice -le $((${#haos_bash_files_in_current_directory[@]}-1)) ]
        
        do
            if [ $users_choice -gt -1 ]
            then
                printf "\nbash %s" "${haos_bash_files_in_current_directory[$users_choice]}";
                read -p "" _pause;
                printf "\n" "${haos_bash_files_in_current_directory[$users_choice]}";
                bash ${haos_bash_files_in_current_directory[$users_choice]};
                printf "\n->%s<- : COMPLETED." "${haos_bash_files_in_current_directory[$users_choice]}";
                read -p "" _pause;
                clear
            fi
            
            display_choices;
            
            read -p "Choose one : " users_choice;

            # See if the user entered an integer.
            if [[ $users_choice =~ ^-?[0-9]+$ ]]
            then
                let "users_choice = $(($users_choice-1))"; # Modify the choice to handle off by one concerns.
            fi

            if [[ $users_choice =~ ^-?[0-9]+$ ]] && [ $users_choice -ge 0 ] && [ $users_choice -le $((${#haos_bash_files_in_current_directory[@]}-1)) ]
            then
                let "users_choice = $users_choice";
            elif [ "$users_choice" = "q" ]
            then
                printf "\nBye now!\n";
                sleep 1.5;
                clear;
            else
                printf "I am not sure how to handle your input of : '%s'\n" "$users_choice";
                printf "You can enter 'q' if you would like to quit.\n";
                let "users_choice = -1";
            fi
        done
    else
        printf "There is nothing i can do here...\n";
    fi
}

init
