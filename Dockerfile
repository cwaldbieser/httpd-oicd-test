FROM ubuntu:22.04

RUN apt update && apt upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt install apache2 libapache2-mod-auth-openidc -y

RUN a2enmod headers
RUN mkdir /var/www/testsite
COPY index.html /var/www/testsite/index.html
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
