source BASH/query_toy.bash
source BASH/function_runner.bash
source BASH/vm_builder.bash
source BASH/git_tool.bash;

if [ -z "$1" ]; then
    display_intro;
fi

do_passed_in_functions_if_user_wants_to cache_username_and_password_for_git;
do_passed_in_functions_if_user_wants_to setup_toolbox_for_github_bash;
#do_passed_in_functions_if_user_wants_to get_capstone_setup work_with_git_hub_repos play_with_google_api;
#do_passed_in_functions_if_user_wants_to get_capstone_setup work_with_git_hub_repos play_with_google_api set_up_bash_history_file;
do_passed_in_functions_if_user_wants_to get_capstone_setup;
#do_passed_in_functions_if_user_wants_to work_with_git_hub_repos;
#do_passed_in_functions_if_user_wants_to play_with_google_api;
do_passed_in_functions_if_user_wants_to set_up_bash_history_file;
do_passed_in_functions_if_user_wants_to restart_cloud9_terminal;

display_goodbye;


# START OF COMMENT BLOCK
: <<'END'
# YAYA
END
# END OF COMMENT BLOCK
