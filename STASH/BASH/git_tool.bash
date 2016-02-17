function load_repository () {
    if [ -z "$1" ]; then
        printf "NO REPO IN : load_repository() !!\n";
    else

        printf "\n* * * load_repository() function will attempt clone of : $1 \n\n";
        printf "hit return to continue (CNTR-C to abort!)";
        read pause_var;

        git clone $1;
        printf "\n* * * load_repository() function has finished attempted clone of : $1 \n\n";
        
        printf "hit return to continue";
        read pause_var;
        
    fi
}