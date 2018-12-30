#!/usr/bin/env bash

DIR="tosjuntos"
mkdir $DIR

find . \( -iname '*.txt'  \) -type f -exec mv -nv -t $DIR/ -- {} +

cd $DIR

a=1
for i in *.txt; do
  new=$(printf "Twin s01e%0d.txt" "$a") #04 pad to length of 4
  mv -i -- "$i" "$new"
  let a=a+1
done
