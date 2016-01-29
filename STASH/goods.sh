#!/bin/bash

#goods.sh

#colour the screen

tput setb 3

tput clear

#loop around gathering input until QUIT is more than 0

QUIT=0

SEL=0

while [ $QUIT -lt 1 -o $SEL -ne 3 ]

do

   #paint menu onto the screen

   echo ""

   echo ""

   echo " GOODS MENU"

   echo " 1 ..... Inwards Goods"

   echo " 2 ..... Outwards Goods"

   echo " 3 ..... QUIT"

   echo ""

   echo "Enter Choice Number: "

   #Move cursor to after select message

   tput cup 7 22

   #Delete from cursor to end of line

   tput el

   read SEL

   if [ ${#SEL} -lt 1 ]

   then

      continue

   fi

   #call the required shell or set QUIT and continue the loop,
   or continue the loop on any other input

   case $SEL in

      1) exec $HOME/GOODS/bin/inwards.sh;;

      2) exec $HOME/GOODS/bin/outwards.sh;;

      3) QUIT=1

      continue;;

      *) continue;;

   esac

done

#reset the screen on exit

if [ $TERM = "linux" ]

then

   tput setb 0

fi

tput reset

tput clear

exit