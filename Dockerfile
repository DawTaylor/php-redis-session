FROM php:5.6-apache

MAINTAINER DawTaylor <adalbertotaylor84@gmail.com>

COPY ./redis_install /usr/local/bin/redis_install
RUN chmod a+x /usr/local/bin/redis_install 
RUN redis_install

RUN sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/html/' /etc/apache2/sites-available/000-default.conf
RUN sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/html/' /etc/apache2/sites-available/default-ssl.conf

RUN usermod -u 1000 www-data
RUN a2enmod rewrite

RUN chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html
VOLUME /var/www/html

EXPOSE 80