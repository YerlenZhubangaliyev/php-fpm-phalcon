run:
	docker run -d --rm --name php5-fpm-phalcon2 yerlen/php5-fpm-phalcon2:test

stop:
	docker stop php5-fpm-phalcon2

build:
	docker build -t yerlen/php5-fpm-phalcon2:1.0.0 .

push:
	docker push yerlen/php5-fpm-phalcon2:1.0.0