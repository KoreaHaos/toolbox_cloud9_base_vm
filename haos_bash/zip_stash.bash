# NOT USEFULL?s

# Made for Haos C9 workflow... 

# Move to the project workspace.
cd "$GOPATH"

# Figure out if there's a stash.
# If so, zip up the contents and put it in the project directory.
if [ -d "STASH" ]
then
    cd STASH
    zip -r stashScriptZipped.zip .
    mv stashScriptZipped.zip $GOPATH
fi

# ToDo :    Confirm it is zipping up the hidden directories and figure out how to
#           handle the git tracking.