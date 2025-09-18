# Utilisation d'Ubuntu 22.04 comme base
FROM ubuntu:22.04

# Variables
ENV DEBIAN_FRONTEND=noninteractive
ENV PHP_VERSION=8.2

# Installation des dépendances système
RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    gnupg2 \
    ca-certificates \
    curl \
    git \
    unzip \
    zip \
    rsync \
    vim-tiny \
    htop \
    sqlite3 \
    nginx \
    supervisor \
    cron \
 && rm -rf /var/lib/apt/lists/*

# Ajout du PPA ondrej/php (spécifique à Ubuntu Jammy)
RUN add-apt-repository ppa:ondrej/php -y

# Installation PHP 8.2 + extensions nécessaires pour Symfony
RUN apt-get update && apt-get install -y --no-install-recommends \
    php${PHP_VERSION} \
    php${PHP_VERSION}-cli \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-intl \
    php${PHP_VERSION}-sqlite3 \
    php${PHP_VERSION}-mysql \
    php${PHP_VERSION}-opcache \
 && rm -rf /var/lib/apt/lists/*

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Répertoire de l'application
WORKDIR /var/www/html

# Copier le code Symfony
COPY . /var/www/html

# Droits
RUN chown -R www-data:www-data /var/www/html/var

# Exposer PHP-FPM
EXPOSE 8080

# Commande de démarrage
CMD ["php-fpm8.2", "-F"]
