#!/usr/bin/env bash
#################################
# FIND-RENAME-MOVE
#
# VERSION 0.1
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

read -p "Nombre : " SNAME
read -p "Temporada: " SNUM
read -p "Capitulo Inicial: " ICAP

# Start Loop!!!!
a=$ICAP
for i in *.$IEXT; do
  new=$(printf "$SNAME-s"$SNUM"e%0d.txt" "$a")
  mv -i -- "$i" "$new"
  let a=a+1
done

# Show me the content and move to other dir
ls -lah .

read -p "Directorio destino final: " FDIR
mv *.$IEXT $FDIR/

