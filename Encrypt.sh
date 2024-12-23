#!/bin/bash

echo "Encryption !!!!!!!!"
echo "Please select the choice"

choice="Encrypt Decrypt Exit"

select option in $choice; do
	if [ $REPLY -eq 1 ]; then
	echo "please select the file name"
	read file;
	gpg -c $file
	encrypted_text="$file.gpg"
	echo "enter a password for second encryption"
	read -s openssl_password
	openssl enc -aes-256-cbc -in "$encrypted_text" -out "${file}doublenr.gpg" -k "$openssl_password"
	echo "file is double encrypted"
	rm -f "$encrypted_text"
	
	elif [ $REPLY -eq 2 ]; then
	echo "please enter the file name to decrypt"
	read file2;
	echo "Enter a password"
	read -s openssl_password
	openssl enc -d -aes-256-cbc -in "$file2" -out "$temp.gpg" -k "$openssl_password"
	echo "one layer is decrypted next layer is decrypting" 
	gpg -d "$temp.gpg"
	rm -f "$temp.gpg"
	echo "file decrypted"

	elif [ $REPLY -eq 3 ]; then
	exit
else
	echo "Invalid option!!"
fi
done


