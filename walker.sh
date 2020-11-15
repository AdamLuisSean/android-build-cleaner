#!/usr/bin/env bash

#Variables
PROJECT_BUILD_PATH=build

#MAIN MENU
#tmp: /Users/alexey/Dev
#tmp: /Users/alexey/OpenSource
echo 'SELECT FOLDER PATH:'

read -r DIR

#echo $DIR

### Check if a directory does not exist ###
if [ ! -d $DIR ]
then
    echo "Directory $DIR DOES NOT exists."
    exit 9999 # die with error code 9999
fi

# look for empty dir
if [ "$(ls -A $DIR)" ]; then
     echo "Path $DIR is not empty go ahead"
else
    echo "$DIR is empty exit"
    exit 9999
fi

#find $DIR -type d -name "build" -print
echo 'Scanning...'

for file in $DIR/*
do
	#du -sk "${element}"
    echo "${file}"
    cd $DIR/* && sh gradlew clean

done
echo "Done"