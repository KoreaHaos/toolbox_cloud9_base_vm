# This bit of script zips up an entire C9 workspace, including the git bits.

cd "$GOPATH"
zip -r workspaceScriptZipped.zip . -x *.c9*
