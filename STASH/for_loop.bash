# For loop example that displays string one letter at a time with a 1/2 pause between each character.
#
# Source (for iterating through string) : http://stackoverflow.com/questions/10551981/how-to-perform-a-for-loop-on-each-character-in-a-string-in-bash/10552175#10552175
# Source (for sleep): http://www.cyberciti.biz/faq/linux-unix-sleep-bash-scripting/
#

foo=string;

for (( i=0; i<${#foo}; i++ )); do
  printf "${foo:$i:1}";
  sleep 0.5;
done

printf "\n";

