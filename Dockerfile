FROM ubuntu:22.04

RUN apt update && apt upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt install apache2 libapache2-mod-auth-openidc python3 -y

RUN a2enmod headers
RUN a2enmod cgi
RUN mkdir -p /var/www/testsite/protected/cgibin
COPY index.html /var/www/testsite/index.html
COPY index.html /var/www/testsite/protected/index.html
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN mkdir  /var/cache/mod_auth_oidc
RUN chown www-data /var/cache/mod_auth_oidc
RUN mkdir  /var/www/cgibin
COPY server_vars.py /var/www/cgibin/server_vars.py
RUN chmod u=rwx,go=rx /var/www/cgibin/server_vars.py
COPY server_vars.py /var/www/testsite/protected/cgibin/server_vars.py
RUN chmod u=rwx,go=rx /var/www/testsite/protected/cgibin/server_vars.py

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
