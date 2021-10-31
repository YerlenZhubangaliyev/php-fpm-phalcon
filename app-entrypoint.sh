#!/bin/bash

crontab < /etc/cron.d/crontab

cron -f &
docker-php-entrypoint php-fpm

exec $@
