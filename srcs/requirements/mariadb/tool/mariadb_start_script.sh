# !/bin/bash
set -x
FILE=/var/lib/mysql/.db_create
if [ ! -f "$FILE" ]
then
	service mysql start

	sleep 5

	mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`"
	mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}'"
	mysql -e "GRANT ALL PRIVILEGES ON  \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' WITH GRANT OPTION"
	mysql -e "DELETE FROM mysql.user WHERE user = 'root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
	mysql -e "SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${SQL_ROOT_PASSWORD}')"
	mysql -e "FLUSH PRIVILEGES"

	service mysql stop | echo -n ""
	touch $FILE
	sleep 5
fi

exec mysqld_safe