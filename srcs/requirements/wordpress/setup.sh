#!/bin/bash

set -e

echo "⏳ Attente de MariaDB sur ${WORDPRESS_DB_HOST}..."

# Extraire l'hôte et le port
DB_HOST=$(echo "$WORDPRESS_DB_HOST" | cut -d':' -f1)
DB_PORT=$(echo "$WORDPRESS_DB_HOST" | cut -s -d':' -f2)
DB_PORT=${DB_PORT:-3306}

# Attente de MariaDB (on peut aussi utiliser wait-for-it.sh ou autre)
while ! nc -z $DB_HOST $DB_PORT; do
    echo "📡 En attente de ${DB_HOST}:${DB_PORT}..."
    sleep 2
done

echo "✅ MariaDB est disponible !"

if [ ! -f /var/www/html/wp-config.php ]; then
  echo "⬇️ Téléchargement de WordPress..."
  wp core download --path=/var/www/html --allow-root

  echo "⚙️ Configuration de wp-config..."
  wp config create \
    --dbname=$WORDPRESS_DB_NAME \
    --dbuser=$WORDPRESS_DB_USER \
    --dbpass=$WORDPRESS_DB_PASSWORD \
    --dbhost=$WORDPRESS_DB_HOST \
    --path=/var/www/html \
    --allow-root

  echo "🛠️ Installation de WordPress..."
  wp core install \
    --url=$DOMAIN_NAME \
    --title="Inception" \
    --admin_user=admin \
    --admin_password=admin42 \
    --admin_email=admin@admin.com \
    --path=/var/www/html \
    --allow-root
else
  echo "✅ WordPress est déjà installé."
fi

exec php-fpm -F
