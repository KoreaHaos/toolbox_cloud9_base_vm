printf "These files and directories will be deleted :\n\n"
find $1 -maxdepth 1 -type f -print
find $1/ -maxdepth 1 -not -wholename "$1/.c9*" -not -wholename "$1/" -type d -print

echo "Press return to continue ...";
read _pause;

find $1 -maxdepth 1 -type f -delete
find $1/ -maxdepth 1 -not -wholename "$1/.c9*" -not -wholename "$1/" -type d -delete