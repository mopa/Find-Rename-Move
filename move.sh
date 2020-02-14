#!/usr/bin/env bash
#################################
# Video Organize
#
# VERSION 0.4
# Author: Pablo M. Pareja
#################################

DIR="Videos"
mkdir $DIR
read -p "File Extension: " IEXT

# Find all files in the directory and subdir
find . \( -iname "*.$IEXT" \) -type f -exec mv -n -t $DIR/ -- {} +

# Move to dir that contain the files found
# and input the name of videos
cd $DIR

echo ""
echo "********************************"
read -p "Name : " SNAME


echo ""
echo "*****************************************"
echo "Se van a realizar los siguientes CAMBIOS:"
echo ""

for i in *; do
    Var1=$(echo $i | awk '{print match(tolower($0),/s[0-9]+e/)}')
    Varfin=$(( Var1 + 5 ))

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


# Show me the content and move to other dir
cd $DIR
echo ""
echo "****************************"
echo "Se han realizado los cambios"
echo ""
ls -lah .

# Question to move to another directory
echo ""
read -p "Quieres mover los archivos a otro directorio? [y/n]: " QDIR
if [ $QDIR = "y" ]; then
    echo ""
    read -p "Introducir Directorio de Destino (ruta absoluta): " FDIR
    echo "(E.g.: /home/user/Documents)"
    mv *.$IEXT $FDIR/
else
    exit 0
fi

