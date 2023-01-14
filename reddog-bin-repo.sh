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
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR IMPLIED
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
#  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
#  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
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
