FROM alpine:3.14

# Update and Install required packages
RUN	 apk update && apk upgrade && apk add --no-cache		\
    php7				\
    php7-fpm			\
    php7-phar			\
    php7-json			\
    php7-mysqli			\
    php7-curl			\
    php7-iconv			\
    php7-pecl-mailparse	\
    curl				\
    mariadb-client		\
    bash				\
    wget				\
    curl				\
    vim					\
    sudo

# Download WordPress and untar it
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xvf latest.tar.gz
RUN rm latest.tar.gz

# Install wp-cli
# RUN	 curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     chmod +x wp-cli.phar &&	\
#     cp wp-cli.phar /usr/bin/wp 

RUN mkdir -p /var/www/html

# Bonus | static website
COPY config/index.html /tmp/website/index.html

# Install redis object cache plugin
RUN wget https://downloads.wordpress.org/plugin/redis-cache.2.0.22.zip
RUN unzip redis-cache.2.0.22.zip
RUN rm -rf redis-cache.2.0.22.zip

# Obtain Redis Cache Backend Script
ADD ./config/object-cache.php /wordpress/wp-content/

# COPY Files to container
COPY config/wp-config.php /wordpress/wp-config.php

ENV	MARIADB_DATABASE=${MARIADB_DATABASE}			\
    MARIADB_USER=${MARIADB_USER}				\
    MARIADB_PASSWORD=${MARIADB_PASSWORD}			\
    MARIADB_HOST=${MARIADB_HOST}					\
    MARIADB_PORT=${MARIADB_PORT}						


# Copy installing script and make it executable
COPY ./tools /tmp/tools
COPY config/www.conf /etc/php7/php-fpm.d
RUN	 chmod -R +x /tmp/tools

RUN	adduser -S nginx &&	\
    addgroup -S nginx


ENTRYPOINT ["bash", "/tmp/tools/setup.sh"]