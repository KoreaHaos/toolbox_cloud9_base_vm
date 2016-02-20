cd "$GOPATH"
if [ -d "STASH" ]
then
    cd STASH
    zip -r stashScriptZipped.zip .
    mv stashScriptZipped.zip $GOPATH
fi
