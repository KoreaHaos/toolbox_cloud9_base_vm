function do_passed_in_functions_if_user_wants_to() {
    
    for arg_passed_in in "$@"
    do
        local task_to_perform="$arg_passed_in";
        local should_do_task_var;
        
        ask_yes_no "Would you like to $task_to_perform ?" should_do_task_var;
        
        if [ "$should_do_task_var" == "TRUE" ]; then
            $arg_passed_in;
        else
            printf "I will not %s \n" "$arg_passed_in";
        fi
    done
}
