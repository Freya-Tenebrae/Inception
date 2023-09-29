#
FROM	debian:buster

# arguments
ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_PASSWORD
ARG SQL_ROOT_PASSWORD
ARG WP_ADMIN
ARG WP_ADMIN_PASSWORD

ENV SQL_DATABASE=${SQL_DATABASE}
ENV SQL_USER=${SQL_USER}
ENV SQL_PASSWORD=${SQL_PASSWORD}
ENV SQL_ROOT_PASSWORD=${SQL_ROOT_PASSWORD}
ENV WP_ADMIN=${WP_ADMIN}
ENV WP_ADMIN_PASSWORD=${WP_ADMIN_PASSWORD}

#
LABEL maintainer="cmaginot <cmaginot@student.42.fr>"

# update
RUN		apt update -y
RUN		apt upgrade -y
RUN		apt-get update -y
RUN		apt-get upgrade -y

# install vim, curl and mariadb
RUN		apt install vim -y
RUN		apt install curl -y
RUN		apt install mariadb-server -y
RUN		apt install mariadb-client -y
RUN		apt install gettext-base -y

#remplacement des fichiers de configurations
COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY	tool/mariadb_start_script.sh /mariadb_start_script.sh

#
RUN ln -sf /dev/stderr /var/log/mysql/error.log

# grant privilege for mariadb
RUN		chmod 755 /etc/mysql/mariadb.conf.d/50-server.cnf
RUN		chmod 755 /mariadb_start_script.sh

#starting mariadb
ENTRYPOINT	["bash","/mariadb_start_script.sh"]

# Ports
EXPOSE 3306
