#!/bin/bash

# Copy redis-cache to mounted volume
cp -r redis-cache/ /wordpress/wp-content/plugins/
# Copy WordPress to mounted volume
cp -r /wordpress/* /var/www/html/

# Bonus | static website
mv /tmp/website/index.html /var/www/html/index.html

# Setup Wordpress
# if [ ! -f /var/www/html/wp-config.php ]; then
# 	cd /var/www/html;
# 	echo "Wordpress: creating users..."
# 	wp core install --allow-root --url="yait-bam.42.fr" --title="Hello world" --admin_user="yait-bam" --admin_password="root" --admin_email="yait-bam@student.1337.ma" --skip-email
# 	wp user create --allow-root bamouh bamouh@gmail.com --role=author --user_pass=root
# 	echo "Wordpress: set up!"
# fi

php-fpm7 -F -R
echo "Wordpress started on: 9000"

