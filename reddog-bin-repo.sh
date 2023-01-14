#!/bin/bash


# Slackware script for @reddog Gnome binaries repo.
# Anagnostakis Ioannis (rizitis) GR Crete 1/2023
#
# This script will help you keep always update your reddog Gnome binary repo.
# Note script DELETE old file or removed files that you have in your local repo BUT not exist on reddog repo.
# If you dont want that remoce the "--delete-first" option from script.
#
##Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# MIT License
#
# Copyright (c) 2023 Anagnostakis Ioannis
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# Gnome Version you want to download. examples "42.x" "43.x" "44.x"
# Note you only edit the number, from "43.x" to "44.x" etc.. Dont edit the "x" that must be the always the same, dont touch it. 
GNOMVER="42.x"
# host server url and dir
URL="https://reddoglinux.ddns.net"
REMOTEDIR="/linux/gnome/$GNOMVER/x86_64/"

# Your local path files will be copied. ADD your path
LOCALDIR="/home/user/folder"
# place to keep logs
LOG="/tmp/GnomeLFTP.log"

cd $LOCALDIR 
if [  ! $? -eq 0 ]; then
 echo "$(date "+%d/%m/%Y-%T") Cant cd to $LOCALDIR. Please make sure this local directory is valid" >> $LOG 
 exit 1
fi

if [ ! $? -eq 0 ]; then
    echo "$(date "+%d/%m/%Y-%T") Cant download files. Make sure the credentials and server information are correct" >> $LOG
else
lftp  $URL << EOF
  set mirror:use-pget-n 5
mirror -c -P5 --delete-first  "$REMOTEDIR" "$LOCALDIR"
  quit
EOF
fi

echo -e #|-----handy-ruler------------------------------------------------------|  
echo -e  :⠀⠀⠀⠀⣠⣶⡾⠏⠉⠙⠳⢦⡀⠀⠀⠀⢠⠞⠉⠙⠲⡀
echo -e  :⠀⠀⠀⣴⠿⠏⠀⠀⠀⠀⠀⠀⢳⡀⠀⡏⠀⠀⠀SLACKWARE⠀⠀
echo -e  :⠀⠀⢠⣟⣋⡀⢀⣀⣀⡀⠀⣀⡀⣧⠀⢸⠀⠀⠀⠀⠀ ⡇
echo -e  :⠀⠀⢸⣯⡭⠁⠸⣛⣟⠆⡴⣻⡲⣿⠀⣸⠀⠀OK⠀ ⡇
echo -e  :⠀⠀⣟⣿⡭⠀⠀⠀⠀⠀⢱⠀⠀⣿⠀⢹⠀⠀⠀⠀⠀ ⡇
echo -e  :⠀⠀⠙⢿⣯⠄⠀⠀⠀⢀⡀⠀⠀⡿⠀⠀⡇⠀⠀⠀⠀⡼GNOME
echo -e  :⠀⠀⠀⠀⠹⣶⠆⠀⠀⠀⠀⠀⡴⠃⠀⠀⠘⠤⣄⣠⠞⠀ 
echo -e  :⠀⠀⠀⠀⠀⢸⣷⡦⢤⡤⢤⣞⣁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
echo -e  :⠀⠀⢀⣤⣴⣿⣏⠁⠀⠀⠸⣏⢯⣷⣖⣦⡀⠀⠀⠀⠀⠀⠀
echo -e  :⢀⣾⣽⣿⣿⣿⣿⠛⢲⣶⣾⢉⡷⣿⣿⠵⣿⠀⠀⠀⠀⠀⠀
echo -e  :⣼⣿⠍⠉⣿⡭⠉⠙⢺⣇⣼⡏⠀⠀⠀⣄⢸⠀⠀⠀⠀⠀⠀
echo -e  :⣿⣿⣧⣀⣿………⣀⣰⣏⣘⣆⣀⠀⠀       

exit 0
