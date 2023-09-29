# OS
FROM	debian:buster

# 
LABEL maintainer="cmaginot <cmaginot@student.42.fr>"

# update
RUN		apt update -y
RUN		apt upgrade -y
RUN		apt-get update -y
RUN		apt-get upgrade -y

# install nginx, vim, curl and openssl (dev)
RUN		apt install vim -y
RUN		apt install curl -y
RUN		apt install nginx -y wget
RUN		apt install openssl -y

# creating ssl/tsl crt and key
RUN		mkdir -p /etc/nginx/ssl
RUN		openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=cmaginot.42.fr/UID=cmaginot"
RUN		mkdir -p /var/run/nginx

#suppresion des config site nginx par default
RUN		rm -rf /etc/nginx/site-available/default
RUN		rm -rf /etc/nginx/site-enabled/default

#remplacement des fichiers de configurations
COPY	conf/site.conf /etc/nginx/sites-enabled/cmaginot.42.fr

# grant privilege for nginx
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

#starting nginx
CMD ["nginx", "-g", "daemon off;"]

# Ports
EXPOSE 443