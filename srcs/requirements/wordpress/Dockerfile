FROM wordpress:php8.2-fpm

RUN apt-get update && apt-get install -y \
    netcat-openbsd \
    less \
    mariadb-client \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Installer WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp
    
COPY ./php.ini /usr/local/etc/php/conf.d/
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

# Lancer le script à l'entrée du conteneur
ENTRYPOINT ["/setup.sh"]