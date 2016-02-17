printf "\n\n\n\n";

function delete_directory() {
    source BASH/DELETE_EVERYTHING_BUT_C9_DIRECTORY.bash;
}

function delete_toolbox() {
    local DIR_TO_DELETE="$PWD";
    #local DIR_TO_DELETE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
    #printf "The current working directory is : %s\n" "$WD";
    printf "The current:\n DIRECTORY TO DELETE is : %s\n" "$DIR_TO_DELETE";
    
    printf "\nWould you like to delete everything in this directory? ";
    
    ask_for_a_really_definate_yes;
    
    case $? in
        77)
            ask_yes_or_no_simple;
            local _ask_again=$?;
            echo $_ask_again;
            if [ "$_ask_again" -eq "0" ]
            then
                printf "(you could still enter cntrol-c to stop this madness)\n";
                printf "DELETION WILL COMMENCE WHEN YOU HIT RETURN...";
                read _users_last_chance_to_quit;
                printf "\n FINE. I WILL DELETE THE WORKING DIRECTORY.\n";
                printf "this kills me :(\n";
                printf "Goodbye cruel world.";
               for i in `seq 1 5`;
                do
                        printf " . ";
                        sleep 1;
                done
                printf "\n";
                printf "cntrol-c will save me!\n";
                sleep 2;
                printf "I see a light.\n";
                delete_directory;
            else
                printf "Not gonna do it!\n";
            fi
        ;;
        *)
        ;;
    esac
} 


function ask_for_a_really_definate_yes() {
    
    local _users_response_to_request_for_a_really_definate_yes;
    local _return_val_for_the_request_for_a_really_definate_yes;

    printf "\n\n[YeS] if you are sure, capitilization is critical, anything else = no\n\n";
    printf "Type your answer here : ";
    read _users_response_to_request_for_a_really_definate_yes;

    case $_users_response_to_request_for_a_really_definate_yes in
        [Y][e][S])
            printf "OK, i will take that as a for sure, definate, yes...\n";
            _return_val_for_the_request_for_a_really_definate_yes=77;
            ;;
        [yY][eE][sS]|[yY]) 
            printf "Although it seems like you might mean yes, you did not respond exactly as describe. You might be able to try again..\n";
            _return_val_for_the_request_for_a_really_definate_yes=111;
            ;;
        [nN][oO]|[nN])
            printf "No it is then.\n";
            _return_val_for_the_request_for_a_really_definate_yes=0;
            ;;
        [nN][][][])
            printf "You seem rather casual, have you done this before?\n";
             _return_val_for_the_request_for_a_really_definate_yes=7;
            ;;
        *)
            printf "Not sure what you mean but i will assume no.\n";
             _return_val_for_the_request_for_a_really_definate_yes=1;
            ;;
    esac;
    
    return  "$_return_val_for_the_request_for_a_really_definate_yes";
}

function ask_yes_or_no_simple() {
    
    local _response_to_simple_yesy_no;
    local _return_from_ask_yes_or_no_simple;
    
    read -r -p "Are you sure? [y/N] " _response_to_simple_yesy_no;
    
    case $_response_to_simple_yesy_no in
        [yY][eE][sS]|[yY]) 
            _return_from_ask_yes_or_no_simple=0;
            ;;
        *)
            _return_from_ask_yes_or_no_simple=1;
            ;;
    esac
    
    return  "$_return_from_ask_yes_or_no_simple";
}