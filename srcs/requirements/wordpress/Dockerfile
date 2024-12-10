FROM debian:bullseye

RUN apt -y update
RUN apt -y upgrade
RUN apt-get -y install wget
RUN apt-get install -y php7.4\
						php-fpm\
						php-mysql\
						mariadb-client

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/autoconfig.sh autoconfig.sh

ENTRYPOINT ["sh", "autoconfig.sh"]