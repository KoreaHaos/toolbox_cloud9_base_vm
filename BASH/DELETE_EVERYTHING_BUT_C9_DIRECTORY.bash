
echo "Directory passed = $1";
reg_exp=".$1/.c9*"
echo "reg_exp = '$reg_exp'"

find $1 -type f -not -path "$1/.c9*"

#find . -regex "$reg_exp" -print
# find . -regex "$reg_exp" -print
# find . -not -regex "$reg_exp" -print

echo "Press return to continue ...";
read _pause;

# find . -not -regex "$1/.c9" -delete
