#!/bin/sh

sed -i "s/port = 3306/port = ${MARIADB_PORT}/g" /etc/my.cnf.d/mariadb-server.cnf

mariadbd &

if ! mysqladmin --wait=30 ping; then
	printf "Runtime config error\n"
	exit 1
fi

# Copy and Setup WP DB
cp /tmp/config/wordpress.sql  /var/lib/mysql/.
mariadb  < /var/lib/mysql/wordpress.sql
rm /var/lib/mysql/wordpress.sql

mariadb -e "$(eval "echo \"$(cat ../config/runtime_config.sql)\"")"
pkill mariadbd
mariadbd