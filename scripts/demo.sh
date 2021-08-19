#!/bin/bash

number=500
userInput=$1

until [ $userInput -gt $number ]
do
	echo "$userInput need to be more than $number"
	echo "Enter number: "
	read userInput
done

echo "$userInput is greater than $number"
