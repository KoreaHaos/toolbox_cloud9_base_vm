find $1 -maxdepth 1 -type f -delete
find $1 -maxdepth 1 -not -name "*c9*" -type d -exec rm -rf {} +

echo "Press return to continue ...";
read _pause;

