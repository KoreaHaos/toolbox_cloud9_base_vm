function init() {
    explain_script;
    pause_for_carriage_return;
    cache_username_and_password_for_git;
    pause_for_carriage_return;
    setup_toolbox_for_github_bash;
    pause_for_carriage_return;
    set_up_bash_history_file;
}


function explain_script() {
    explanation=(
        ''
        'vm_builder-BASIC.bash has been called!'
        ''
    );
    
    clear;
    
    for line in "${explanation[@]}"
    do
      printf "%s\n" "${line}";
    done
}

function cache_username_and_password_for_git() {
    # This makes it so repeated user/password entry is not needed when git push commands are called.
    # By default, this command will make Git cache user name and password for 15 minutes.
    # More info : https://help.github.com/articles/caching-your-github-password-in-git/
    
    git config --global credential.helper cache
}

function setup_toolbox_for_github_bash() {
    local _URL_4_toolbox_github_bash="https://github.com/KoreaHaos/toolbox_github_bash.git";
    
    clear_screen_display_message_centered "setup_toolbox_for_github_bash proceeding!" 1;
    git clone $_URL_4_toolbox_github_bash;
    mkdir -p ~/haos_tools/BASH/github
    cp -r ./toolbox_github_bash/bash/toolbox/github ~/haos_tools/BASH;
    rm -rf toolbox_github_bash;
    echo "FOLDER(S) AND FILE(S) ADDED TO HOME DIRECTORY (haos_tools)!!"
    sleep 3;
}

function pause_for_carriage_return() {
    local pause;
    printf "paused - hit return : ";
    read pause;
}

function set_up_bash_history_file() {

    local _path_for_temp_file=tmp_history_file.txt;
    
    declare -a lines_to_prepend_to_bash_history_file;
    
    lines_to_prepend_to_bash_history_file=("bash ~/haos_tools/BASH/github/add_commit_push_all.bash");
    
    if [ -e $_path_for_temp_file ]; then
        echo "TEMP FILE EXISTS!";
        rm $_path_for_temp_file;
        echo "DELETE TEMP FILE ATTEMPTED!";
    else
        echo "NO TEMP FILE EXISTS!";
    fi
    
    for i in "${lines_to_prepend_to_bash_history_file[@]}"
    do
       echo "$i" >> tmp_history_file.txt;
    done
    
    local _history_file_path=~/.bash_history;
    
    if [ -e $_history_file_path ]; then
        echo "History file present, commands will be prepended to file.";
        cat $_history_file_path >>tmp_history_file.txt
    else
        echo "No history file present, creation will be attempted.";
    fi
    
    cp tmp_history_file.txt $_history_file_path;
    
    if [ -e $_path_for_temp_file ]; then
        echo "TEMP FILE EXISTS!";
        rm $_path_for_temp_file;
        echo "DELETE TEMP FILE ATTEMPTED!";
    else
        echo "NO TEMP FILE EXISTS!";
    fi
    
}

function say_hello() {
    echo "Hello.";
}

function restart_cloud9_terminal() {
    
    local COUNTER=0;
    local SECS_TO_COUNT=5;
    while [  $COUNTER -lt $SECS_TO_COUNT ]; do
        local _SECS_REMAIN=$(($SECS_TO_COUNT-$COUNTER));
        local _RESET_MESSAGE="RESTARTING TERMINAL IN $_SECS_REMAIN SECONDS!!";
        clear_screen_display_message_centered "$_RESET_MESSAGE" 1;
        let COUNTER=COUNTER+1 
     done
}

init;
