FROM wordpress:php7.1-apache
LABEL maintainer "unicorn research Ltd."

RUN apt-get update && apt-get install -y  git cron \
    && rm -rf /var/lib/apt/lists/*

COPY pam-cron /etc/pam.d/cron

WORKDIR /var/www/html
RUN tar cf - --one-file-system -C /usr/src/wordpress . | tar xf - -C /var/www/html

# COPY refresh /.refresh
COPY htaccess /var/www/html/.htaccess

# cron startup & apache2 up
RUN awk '{print $0 ((NR==3)?"\nservice cron start\n":"")}' /usr/local/bin/docker-entrypoint.sh
