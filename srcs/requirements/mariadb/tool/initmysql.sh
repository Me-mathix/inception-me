#!/bin/sh

# Start MariaDB directly in foreground
mysqld_safe --skip-networking &

# Wait for MariaDB to start
until mysqladmin ping --silent; do
    echo "Waiting for MariaDB to start..."
    sleep 2
done

# Run mysql_secure_installation commands
mysql -uroot -p"${SQL_ROOT_PASSWORD}" <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
EOF

# Grant remote access for root and create the user/database
mysql -uroot -p"${SQL_ROOT_PASSWORD}" <<EOF
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};
CREATE USER '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

# Stop MariaDB safely
mysqladmin -uroot -p"${SQL_ROOT_PASSWORD}" shutdown

exec mysqld_safe