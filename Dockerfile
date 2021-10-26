FROM php:5-fpm
MAINTAINER "YerlenZhubangaliyev" <yerlen@yerlen.com>

ARG PHALCON_VERSION=2.0.13

ENV PHALCON_VERSION=${PHALCON_VERSION}

RUN apt-get update && apt-get install -y \
      libpq-dev \
      libicu-dev \
      libfreetype6-dev \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
      libmcrypt-dev \
      libpng-dev \
    && docker-php-ext-install pdo mbstring iconv mcrypt pdo_mysql pgsql pdo_pgsql zip mysqli exif intl  \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

# Compile Phalcon
RUN set -xe \
    && curl -LO https://github.com/phalcon/cphalcon/archive/refs/tags/phalcon-v${PHALCON_VERSION}.tar.gz \
    && tar xzf phalcon-v${PHALCON_VERSION}.tar.gz && cd cphalcon-phalcon-v${PHALCON_VERSION}/build/64bits && phpize && ./configure CFLAGS="-O2 -g" --enable-phalcon && make -B && make install \
    && docker-php-ext-enable phalcon \
    && cd ../.. && rm -rf phalcon-v${PHALCON_VERSION}.tar.gz cphalcon-phalcon-v${PHALCON_VERSION} \

EXPOSE 9000
