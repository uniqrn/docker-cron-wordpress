FROM wordpress:php7.1-apache
LABEL maintainer "unicorn research Ltd."

RUN apt-get update && apt-get install -y  git cron \
    && rm -rf /var/lib/apt/lists/*

COPY pam-cron /etc/pam.d/cron

# COPY refresh /.refresh
COPY htaccess /var/www/html/.htaccess

# cron startup & apache2 up
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
