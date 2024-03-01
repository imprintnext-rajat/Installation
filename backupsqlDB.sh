#!/bin/bash
mysql -h 212.2.243.223 -u root -p'1$_,uG3FXl4SN5vSK' -e "show databases;" >file.txt
echo "all the database"

cat file.txt

for word in Database  information_schema mysql sys performance_schema
do
  sed -i "/^$word$/d"  file.txt
done

grep '\S' file.txt > file1.txt
echo " "
echo "Backup-database are "
cat file1.txt

numberDatabases=$(wc -l  file1.txt | cut -c1)
echo "number of backup-databases is ${numberDatabases}"
for (( a=1; a<=${numberDatabases}; a++ ))
do

    database=$(awk NR==$a file1.txt)

       #comment out (#) to run the mysqldum for back-up the database
       #mysqldum   --single-transaction  -h  212.2.243.223 -u newuser -p123456  ${database} >/backupSQL/${database}.sql

     echo "Database '${database}' is retrieved"
done


