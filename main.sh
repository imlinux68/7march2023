#!/bin/bash
function makedirs () {
echo "1. crete dirs"
cd ~
mkdir -p Cloud/{Storage/{VPC,S3,Redshift},database/{RDS,DynamoDB}}

echo "2.display Cloud"
tree Cloud

echo "3. Go to VPS"
cd Cloud/Storage/VPC

echo "4. rename vpc to ebs in rel"
mv ../VPC ../EBS

echo "5. move rdshift to database"
mv ../Redshift ../../database/

echo "6. insert text"
echo "S3 is object storage, EBS is block storage
designed for EC2, EFS is file storage" > ~/Cloud/Storage/EBS/factstorage

echo "7. copy factstorage to S3"
cp ~/Cloud/Storage/EBS/factstorage ~/Cloud/Storage/S3/

echo "8. copy factstorage to DYNAMODB"
cp ~/Cloud/Storage/EBS/factstorage ~/Cloud/database/DynamoDB/
tree ~/Cloud

echo "9. destroy cloud"
rm -rvf ~/Cloud
}

makedirs

function bindec () {
	read -p "Enter Binary Num:  " binum
	local result=`echo $((2#$binum))`
	echo -e "\n\n Your result is $result\n\n"
}

function decbin () {
	read -p "Enter Decimal Num:  " denum
	local result=`echo "obase=2; $denum" | bc `
	echo -e "\n\n Your result is $result\n\n"
}

function calc () {
while [ 1 = 1 ]
	do
		echo "*************************"
		echo "What you wanna to convert"
		echo "*************************"
		echo "1. Decimal to Binary"
		echo "2. Binary to Decimal"
		echo "3. Exit"
		read -p "Make you choice now: " c
		case $c in
			1) decbin ;;
			2) bindec ;;
			3) exit 5 ;;
			*) echo "1-3 ONLY!" ; sleep 3 ;;
		esac
	done
}

calc
