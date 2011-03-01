#!/bin/bash

config=`find $PWD -name '*wp-config.php' -print -quit`

sqlname=`grep "define.*DB_NAME" $config | awk -F"[,'\"]" '{print $5}'`
sqluser=`grep "define.*DB_USER" $config | awk -F"[,'\"]" '{print $5}'`
sqlhost=`grep "define.*DB_HOST" $config | awk -F"[,'\"]" '{print $5}'`
sqlpass=`grep "define.*DB_PASSWORD" $config | awk -F"[,'\"]" '{print $5}'`

if [ "$1" = "" ]
then
	echo "Usage: ./wp-db-reset.sh path-to-sql-file.sql";
else
	if [ -f $1 ]
	then
		echo "Reset $sqlname with '$1'? (y/N)"
		read goahead
		if [ "$goahead" = "y" ]
		then
			echo "Dropping and re-creating database..."
			mysql -h $sqlhost -u $sqluser -p$sqlpass $sqlname --execute="DROP DATABASE $sqlname; CREATE DATABASE $sqlname;"
			
			echo "Reading in SQL file..."
			mysql -h $sqlhost -u $sqluser -p$sqlpass $sqlname < $1

			echo "Done!"
		else
			echo "Aborting"
		fi
	else
		echo "File '$1' does not exist."
	fi
fi
