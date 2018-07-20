FROM webdevops/php-apache:alpine-php7

MAINTAINER Mariano Abdala <marianoabdala@gmail.com>

ENV VERSION LATEST-mutillidae-2.6.62
WORKDIR /tmp

RUN wget https://sourceforge.net/projects/mutillidae/files/mutillidae-project/$VERSION.zip && \
unzip $VERSION.zip && \
mv mutillidae/* /app && \
rm -fr /tmp/*

WORKDIR /app

RUN chown application:application -R /app && \
sed -i s/'127.0.0.1'/'mysql'/g  includes/database-config.php  && \ 
sed -i s/\'\'/'root'/g  includes/database-config.php

EXPOSE 80
