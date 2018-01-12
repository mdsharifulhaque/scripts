#!/bin/bash

input="/home/mshaque/darpa1998/all_links.txt"
path="/home/mshaque/darpa1998"
parentfolder="$(pwd)"
while read -r line
do 
#echo "$var"
	arr1=($(echo $line | tr " " "\n"))
	echo "***${arr1[0]}***"
	#${#arr[@]}"
	if [ ${#arr1[@]} == 4 ]; then
		
		#get the file name
		foldername=$(basename "${arr1[0]}" ".tar")
		echo "$foldername"  

		sudo mkdir "$foldername"		
	
		#download the file
		sudo wget -k "${arr1[0]}" -O "$foldername/$foldername.tar"
		
		cd "$foldername"

		#unzip the tar file
		sudo tar -xvf "$foldername.tar"		

		#IFS='#' read -r -a arr2 <<< "${arr1[1]}"
		#enter into the folder 
		cd "${arr1[1]}"
		
		#unzip the tcpdump file
		sudo gzip -d "${arr1[2]}"

		#get the dump file name
		filename=$(basename "${arr1[2]}" ".gz")

		#move the file to the final location
		sudo mv "$filename" "${arr1[3]}"
	
		#exit from the current directory
		
		cd $parentfolder
		echo "2. $(pwd)"
		#remove the folder and tar file
		sudo rm -r "$path/$foldername"
		#sudo rm "$path/$foldername.tar"				
		
	else
		arr1=($(echo $line | tr " " "\n"))

		#get the file name
		filename=$(basename "${arr1[0]}" ".gz")
		
		echo "$filename"

		mkdir "$filename"		

		#download the file
		sudo wget -k "${arr1[0]}" -O "$path/$filename.gz"

		#cd "$filename"

		#move the file to the final location
		sudo mv "$filename.gz" "${arr1[1]}"

		#unzip the tcpdump file
		sudo gzip -d "${arr1[1]}"

		#exit from the directory
		cd $parentfolder 
		echo "2. $(pwd)"

		#remove the folder and tar file
		#sudo rm -r "$path/$filename"
	fi
done<"$input"
