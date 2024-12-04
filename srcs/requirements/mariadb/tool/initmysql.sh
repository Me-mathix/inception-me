#!/bin/sh

/etc/init.d/mariadb start


if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 

	echo "Database already exists"
else

mysql_secure_installation << _EOF_

Y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
Y
Y
Y
Y
_EOF_


mysql -uroot -e "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$SQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;"

mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE; GRANT ALL ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD'; FLUSH PRIVILEGES;"

fi

/etc/init.d/mariadb stop

exec "$@"