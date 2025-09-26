!/bin/bash

cd /var/www/html
chmod 777 -R api

cd api

composer install
composer dump-autoload

php artisan config:clear
php artisan cache:clear
php artisan view:clear

systemctl restart supervisor
php artisan queue:restart
