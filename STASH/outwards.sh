#!/bin/bash

#outwards.sh

#colour the screen

tput setb 5

tput clear

#paint menu onto the screen

echo ""

echo ""

echo " OUTWARDS GOODS MENU"

echo " 1 ..... Enter Outwards Goods"

echo " 2 ..... Adjust Outwards Goods"

echo " 3 ..... QUIT"

echo ""

echo "Enter Choice Number: "

#loop around gathering input until QUIT is selected

QUIT=0

while [ $QUIT -lt 1 ]

do

   #Move cursor to after select message

   tput cup 7 22

   #Delete from cursor to end of line

   tput el

   read SEL

   if [ ${#SEL} -lt 1 ]

   then

      continue

   fi

   #call the required shell

   case $SEL in

      1) exec $HOME/GOODS/bin/outentry.sh;;

      2) exec $HOME/GOODS/bin/outadjust.sh;;

      3) exec $HOME/GOODS/bin/goods.sh;;

      *) continue;;

   esac

done

#Fail safe point. Should never get here

exec $HOME/GOODS/bin/goods.sh