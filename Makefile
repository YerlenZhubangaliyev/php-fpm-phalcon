run:
	docker run -d --rm --name php5-fpm-phalcon2 yerlen/php5-fpm-phalcon2:test

stop:
	docker stop php5-fpm-phalcon2

build:
	docker buildx build --platform linux/amd64 -t yerlen/php5-fpm-phalcon2:1.0.13 .

push:
	docker push yerlen/php5-fpm-phalcon2:1.0.13