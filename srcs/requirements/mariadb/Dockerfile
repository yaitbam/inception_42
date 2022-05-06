FROM alpine:3.14

RUN	apk update && apk upgrade && apk add --no-cache	\
    mariadb			\
    mariadb-client	\
    curl			\
    vim				\
    sudo

RUN mkdir -p /run/mysqld && mkdir -p /var/lib/mysql
RUN	chown -R mysql:mysql /run/mysqld && chown mysql:mysql /var/lib/mysql
RUN	mariadb-install-db --user=mysql --datadir='/var/lib/mysql'

ENV	MARIADB_USER=${MARIADB_USER}			\
    MARIADB_PASSWORD=${MARIADB_PASSWORD}	\
    MARIADB_DATABASE=${MARIADB_DATABASE}	\
    MARIADB_PORT=${MARIADB_PORT}

COPY ./config/mariadb-server.cnf  /etc/my.cnf.d/mariadb-server.cnf
RUN	 chown -R mysql:mysql /etc/my.cnf.d

COPY ./tools /tmp/tools
COPY ./config/runtime_config.sql /tmp/config/runtime_config.sql
COPY ./config/wordpress.sql /tmp/config/wordpress.sql
RUN	 chown -R mysql:mysql /tmp/config &&	\
    chown -R mysql:mysql /tmp/tools

USER mysql

WORKDIR	/tmp/tools

EXPOSE	3306

ENTRYPOINT	["sh", "setup.sh"]