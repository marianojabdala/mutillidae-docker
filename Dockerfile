FROM webdevops/php-apache:alpine-php7

MAINTAINER Mariano Abdala <marianoabdala@gmail.com>

WORKDIR /tmp 

RUN wget https://sourceforge.net/projects/mutillidae/files/mutillidae-project/LATEST-mutillidae-2.6.50.zip && \
unzip LATEST-mutillidae-2.6.50.zip && \
mv mutillidae/* /app && \
rm -fr /tmp/*

RUN chown application:application -R /app

WORKDIR /app

RUN sed -i s/'$mMySQLDatabasePassword = ""'/'$mMySQLDatabasePassword = "root"'/g classes/MySQLHandler.php
RUN sed -i s/'$mMySQLDatabaseHost = "127.0.0.1"'/'$mMySQLDatabaseHost = "mysql"'/g classes/MySQLHandler.php

VOLUME app
