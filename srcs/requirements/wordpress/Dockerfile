#
FROM	debian:buster

# arguments
ARG		SQL_DATABASE
ARG		SQL_USER
ARG		SQL_PASSWORD
ARG		SQL_ROOT_PASSWORD
ARG		SQL_HOST
ARG		WP_URL
ARG		WP_TITLE
ARG		WP_ADMIN
ARG		WP_ADMIN_PASSWORD
ARG		WP_ADMIN_EMAIL
ARG		WP_USR
ARG		WP_USR_MAIL
ARG		WP_USR_PASS

ENV		SQL_DATABASE=${SQL_DATABASE}
ENV		SQL_USER=${SQL_USER}
ENV		SQL_PASSWORD=${SQL_PASSWORD}
ENV		SQL_ROOT_PASSWORD=${SQL_ROOT_PASSWORD}
ENV		SQL_HOST=${SQL_HOST}
ENV		WP_URL=${WP_URL}
ENV		WP_TITLE=${WP_TITLE}
ENV		WP_ADMIN=${WP_ADMIN}
ENV		WP_ADMIN_PASSWORD=${WP_ADMIN_PASSWORD}
ENV		WP_ADMIN_EMAIL=${WP_ADMIN_EMAIL}
ENV		WP_USR=${WP_USR}
ENV		WP_USR_MAIL=${WP_USR_MAIL}
ENV		WP_USR_PASS=${WP_USR_PASS}

#
LABEL maintainer="cmaginot <cmaginot@student.42.fr>"

# update
RUN		apt update -y
RUN		apt upgrade -y
RUN		apt-get update -y
RUN		apt-get upgrade -y

# install vim, curl, wget mariadb-client, php and dependencies
RUN		apt install vim -y
RUN		apt install curl -y
RUN		apt-get install wget -y
RUN		apt-get install mariadb-client -y
RUN		apt-get install php7.3 -y
RUN		apt-get install php-fpm -y
RUN		apt-get install php-mysql -y
RUN		apt-get install tar -y

# installing CLI
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod 755 wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp

#remplacement des fichiers de configurations
COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY 	./tool/wp_start_script.sh /wp_start_script.sh

# grant privilege for wp_start_script
RUN		chmod 755 /etc/php/7.3/fpm/pool.d/www.conf
RUN		chmod 755 /wp_start_script.sh

RUN 	sed -i "/listen =/d" /etc/php/7.3/fpm/pool.d/www.conf
RUN 	echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN 	mkdir -p /run/php/


#starting wordpress & php
ENTRYPOINT ["bash", "/wp_start_script.sh"]

# Ports
EXPOSE 9000

CMD ["bash", "/wp_start_script.sh"]