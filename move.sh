#!/usr/bin/env bash
#################################
# Video-Organize
#
# VERSION 0.3
# Author: Pablo M. Pareja
#################################

DIR="Videos"
mkdir $DIR
read -p "File Extension: " IEXT

# Find all files in the directory and subdir
find . \( -iname "*.$IEXT" \) -type f -exec mv -n -t $DIR/ -- {} +

# Move to dir that contain the files found and
# input the info
cd $DIR

echo ""
echo "********************************"
read -p "Name : " SNAME
# read -p "Season: " SNUM
# read -p "Episode to start loop: " ICAP


echo ""
echo "*****************************************"
echo "Se van a realizar los siguientes CAMBIOS:"
echo ""

for i in *; do
    Var1=$(echo $i | awk '{print match(tolower($0),/s[0-9]+e/)}')
    Varfin=$(( Var1 + 5 ))
    # echo $Varfin

    if [ $Var1 != 0 ] ; then
        SEP=$(echo $i | cut -b $Var1-$Varfin | awk '{ print tolower($0) }')
    else
        continue
    fi
    
    echo $i "  --->  " $SNAME-$SEP.$IEXT
done


echo ""
read -p "Continuar con los cambios? [y/n]: " QCONTINUE

if [ $QCONTINUE = "y" ]; then
    cd $DIR
    for i in *; do
        Var1=$(echo $i | awk '{print match(tolower($0),/s[0-9]+e/)}')
        Varfin=$(( Var1 + 5 ))
        # echo $Varfin

        if [ $Var1 != 0 ] ; then
            SEP=$(echo $i | cut -b $Var1-$Varfin | awk '{ print tolower($0) }')
        else
            continue
        fi
        
        NEWNAME="$SNAME-$SEP.$IEXT"
        mv -i -- "$i" "$NEWNAME"
    done
else
    exit 0
fi


# Start Loop!!!!
# a=$ICAP
# for i in *.$IEXT; do
#   new=$(printf "$SNAME-s"$SNUM"e0%0d."$IEXT"" "$a")
#   mv -i -- "$i" "$new"
#   let a=a+1
# done

# Show me the content and move to other dir
# ls -lah .

# echo ""
# read -p "Final Directory: " FDIR
# echo "(E.g.: /home/user/Documents)"
# mv *.$IEXT $FDIR/

