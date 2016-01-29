# Always introduce the script!

printf "\nScript add_commit_push_all.bash has been called!\n\n";

# That done; first, handle any args' passed in.

if [ -z "$1" ]; then
_commit_message="NO COMMIT MESSAGE!. Script commit by : $0.";
else
_commit_message="$1 = message. Script commit by : $0.";
fi

# Display commit message.

printf "\n_commit_message = \'%s\' \n\n" "$_commit_message";


# Next, turn on git's credential helper cache function.
# This makes it so constant user/password entry is not needed.
# By default, Git will cache your password for 15 minutes.
# More info : https://help.github.com/articles/caching-your-github-password-in-git/

git config --global credential.helper cache

# Add all, 

git add --all;

# commit,

git commit -m "$_commit_message";

# push,

git push --all;

# say goodbye,

printf "\nadd_commit_push_all.bash is done!\n\n";

# and, that's it!
