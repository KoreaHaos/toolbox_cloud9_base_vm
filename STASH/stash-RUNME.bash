:<<'EOF1'

function init() {
    explain_script;
    

:<<'EOF'
    read -r -p "Would you like to setup the basics? [y/N] " response
    
    case $response in
        [yY][eE][sS]|[yY]) 
            setup_the_basics;
            ;;
        [nN][oO]|[nN]) 
            exit_runme_with_no_error;
            ;;
            
        *)
            exit_runme_with_error "Do not understand : " "$response";
            ;;
    esac
EOF
}


function explain_script() {
    explanation=(
        ''
        '**** Welcome to the basics install script!'
        ''
        'This script will :'
        ''
        '1 : Create some basic bash scripts in the home directory.'
        '2 : Setup GitFlow.'
        "3 : Turn on Git's credential helper"
        '4 : Modify the bash history file so that the first few entries pertain to common Git commands.'
        '5 : Clean up after itself, if you choose to do so.'
        ''
        'NOTE - There is no guarantee that this script will work correctly or that it will do no irrepairable damage to you, your computer, your files, or the world in general.'
        ''
        "UNDER NO CIRCUMSTANCES SHOULD YOU EVER ENTER THE STATEMENT 'Love to. How about Global Thermonuclear War?' !!"
        ''
        'Thank you and have a nice day!'
        ''
    );
    
    clear;
    
    for line in "${explanation[@]}"
    do
      printf "%s\n" "${line}";
    done
}
   
function setup_the_basics() {
    printf "Setting the basics will commence.\n\n";
    
    if [ -d "bash" ]
    then
        echo directory found!
        #if [ -e "bash/vm_builder-BASIC.bash"]
    else
        exit_runme_with_error "directory NOT found!";
    fi

    if [ -e "bash/vm_builder-BASIC.bash" ]
    then
        echo file found!
        #if [ -e "bash/vm_builder-BASIC.bash"]
    else
        exit_runme_with_error "file NOT found!";
    fi
    
    source bash/vm_builder-BASIC.bash;
    exit_runme_with_no_error;
}

function exit_runme_with_error() {
    printf "ERROR\n\n";
    RED='\033[0;31m'
    NC='\033[0m'
    case "$#" in
        0)
        printf "UNDEFINED ERROR!\n";
        ;;
        1)
        printf "err : ${RED}%s${NC}\n" "$1"
        ;;
        2)
        printf "%s ${RED}%s${NC}\n" "$1" "$2";
        ;;
        *)
        printf "TOO MUCH ARGUING!\n"
        ;;
    esac
    
    printf "\n";
    
    exit 1;
}

function exit_runme_with_no_error() {
    echo "Goodbye!";
    exit 0;
}


init;
EOF1