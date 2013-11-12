#!/bin/bash

echo -n "enter db's ip : "
read ip
echo -n "enter db's port : "
read port
echo -n "enter db's name : "
read dbname
echo -n "enter db login username : "
read username
echo -n "enter password : "
read -s pass
echo 
#echo $pass
for file in *.jsp
do
	sed -e 's|String url = "jdbc:postgresql://[^ ]*/[^ ]*";|String url = "jdbc:postgresql://'$ip:$port'/'$dbname'";|' -e 's|String username = "[^ ]*"; // Enter your PostgreSQL username|String username = "'$username'"; // Enter your PostgreSQL username|' -e 's|String password = "[^ ]*"; // Enter your PostgreSQL password|String password = "'$pass'"; // Enter your PostgreSQL password|' <$file >temp
mv temp $file
done
echo done changing the header in all files
