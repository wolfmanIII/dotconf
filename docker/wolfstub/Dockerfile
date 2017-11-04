FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

# setting terminal emulator
ENV TERM xterm

# setting default shell
ENV SHELL /bin/bash

RUN apt-get update && \
    apt-get install -y --no-install-recommends supervisor \
    mysql-client \
    nginx \
    curl \
    php5 \
    php5-mysql \
    php5-curl \
    php5-gd \
    php5-fpm \
    php5-mcrypt \
    php5-xdebug \
    nano && \
    rm -rf /var/lib/apt/lists/* && \
	apt-get clean

# Supervisor configuration
ADD docker/supervisor/supervisor-lemp.conf /etc/supervisor/conf.d/

# php5-fpm configuration
ADD docker/php5-fpm/www.conf /etc/php5/fpm/pool.d/www.conf

# php5-xdebug configuration
ADD docker/xdebug/xdebug.ini /etc/php5/mods_available/xdebug.ini

# Nginx configuration
# default server
ADD docker/nginx/default /etc/nginx/sites-enabled/default

# phpinfo to check if fpm is working
ADD projects/html/info.php /var/www/html/info.php

# bash configuration
ADD docker/bash/.bashrc /root/.bashrc

# Entrypoint
ADD docker/entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
