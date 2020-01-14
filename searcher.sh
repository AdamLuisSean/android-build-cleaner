#!/usr/bin/env bash

#************************************************#
#                   searcher.sh                  #
#           written by Alexey Shtanko            #
#                January 11, 2020                #
#                                                #
#       Searches build folders in the path       #
#              and writes to the file            #
#************************************************#

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
my_array=( $(find $DIR -type d -name "build" -print) )
my_array_length=${#my_array[@]}

echo "$my_array_length paths was found"

echo "Creating empty file..."
rm -r read.txt
touch read.txt
echo "Created empty file read.txt"

echo "Writing to file..."
for element in "${my_array[@]}"
do
	#du -sk "${element}"
    echo "${element}" >> read.txt
done
echo "Done"

echo "Do you want to continue?(Y/N)"
read -r NEXT

go() {
    #echo 'Running Script'
    #output=$(eval "$(go run main.go)")
    go run main.go
    #echo output
    #exit
}

case $NEXT in

"y" | "Y")
	go
;;

"n" | "N")
	exit
;;

esac
