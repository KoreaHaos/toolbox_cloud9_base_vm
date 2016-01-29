source test.bash

echo "In test part 2";

return_var1=''
return_var2=''

pass_back_a_string return_var1 return_var2;

echo $return_var1
echo $return_var2
