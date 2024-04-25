FROM debian:10

RUN apt-get update \
    && apt-get install apache2 -y --no-install-recommends

COPY index.html /var/www/html
COPY sites-enabled/000-default.conf /etc/apache2/sites-enabled
COPY sites-enabled/100-oscar.conf /etc/apache2/sites-enabled
COPY --chmod=755 entrypoint.sh /

EXPOSE 80
ENTRYPOINT [ "/entrypoint.sh" ]
