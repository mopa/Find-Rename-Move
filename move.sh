#!/usr/bin/env bash
#################################
# FIND-RENAME-MOVE
#
# VERSION 0.2
# Author: Pablo M. Pareja
#################################

DIR="Videos"
mkdir $DIR
read -p "File Extension: " IEXT

# Find all files in the directory and subdir
find . \( -iname "*.$IEXT" \) -type f -exec mv -nv -t $DIR/ -- {} +

# Move to dir that contain the files found and
# input the info
cd $DIR

echo ""
echo "********************************"
read -p "Name : " SNAME
read -p "Season: " SNUM
read -p "Episode to start loop: " ICAP

# Start Loop!!!!
a=$ICAP
for i in *.$IEXT; do
  new=$(printf "$SNAME-s"$SNUM"e0%0d."$IEXT"" "$a")
  mv -i -- "$i" "$new"
  let a=a+1
done

# Show me the content and move to other dir
ls -lah .

echo ""
read -p "Final Directory: " FDIR
echo "(E.g.: /home/user/Documents)"
mv *.$IEXT $FDIR/

