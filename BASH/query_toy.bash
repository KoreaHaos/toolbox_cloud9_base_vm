function display_intro() {
    
    local _users_response="";
    
    ask_query_clear_centered_slowly "Shall we play a game?" _users_response;

    if [ "$_users_response" == "Love to. How about Global Thermonuclear War?" ]; then
      clear_screen_display_message_centered "ARE YOU SERIOUS? (Retorical Question, BTW...)" 2;
    fi

    clear_screen_display_message_centered "Maybe later ..." 1;

    # We are not playing games; yet...
}

function display_goodbye() {
    clear_screen_display_message_centered "Goodbye, Happy Coding!!" 1;
}

function clear_screen_display_message_centered() {
  
  # setup local variables
  
  local _message_to_display="";
  
  local _terminals_cols="$(tput cols)"
  local _terminals_lines="$(tput lines)"
  
  local _half_width=$(( $_terminals_cols/2 ));
  local _half_height=$(( $_terminals_lines/2 ));
  
  
  if [ -z "$1" ]; then
    _message_to_display="DEFAULT_MESSAGE!";
  else
    _message_to_display="$1";
  fi

  local _message_length=${#_message_to_display}
  local _curser_offset=$(( $_half_width-$_message_length ));

  clear

  tput cup $_half_height $_curser_offset;
  
  
  printf "%s" "$_message_to_display";
  
  if [ -z "$2" ]; then
    sleep 1;
  else
    sleep $2;
  fi
  
  printf "\n";
}

function ask_query_clear_centered_slowly() {

  # $1 = question to ask.
  # $2 = variable to return response with.

  clear;
  
  local _default_message="";
  
  if [ -z "$1" ]; then
  local _query_for_user="$_default_message";
  else
  local _query_for_user="$1";
  fi
  
  local _terminals_cols="$(tput cols)"
  local _terminals_lines="$(tput lines)"
  
  local _half_width=$(( $_terminals_cols/2 ));
  local _half_height=$(( $_terminals_lines/2 ));
  
  local _query_length=${#_query_for_user}
  local _curser_offset=$(( $_half_width-$_query_length ));
  
  tput cup $_half_height $_curser_offset;
  
  slow_display_query "$_query_for_user";

  local _query_response="";
  read _query_response;
  
  if [ -z "$2" ]; then
    echo "ERROR-can not return user's input.";
  else
    eval "$2=\"$_query_response\"";
  fi
}

function slow_display_query() {
  local _query_to_slowly_display;
  local _prompt_for_query;
  
  if [ -z "$2" ]; then
  _prompt_for_query=" : > ";
  else
  _prompt_for_query="$2";
  fi;
  
  if [ -z "$1" ]; then
  _query_to_slowly_display="I do not know what to say.";
  else
  _query_to_slowly_display="$1";
  fi;
  
  for (( i=0; i<${#_query_to_slowly_display}; i++ )); do
    printf "${_query_to_slowly_display:$i:1}";
    sleep 0.05;
  done

  printf "%s " "$_prompt_for_query";
}



function ask_yes_no() {
  
  # $1 = yes/no question to ask.
  # $2 = variable to return response with.
  
  if [ -z "$1" ]; then
    echo -n "Do you agree? [yes or no] : ";
  else
    echo -n $1 "[yes or no] : ";
  fi
  
  read yes_no_or_other_response;
  
  case $yes_no_or_other_response in
    [yY] | [yY][Ee][Ss] )
      eval "$2='TRUE'";
    ;;
    
    [nN] | [nN][Oo] )
      eval "$2='FALSE'";
    ;;
    *) eval "$2='ERROR'";
    ;;
  esac
}
