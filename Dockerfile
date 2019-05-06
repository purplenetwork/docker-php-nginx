# Build arguments
ARG IMAGE=webdevops/php-nginx:alpine-php7
ARG APP_PATH=.
FROM ${IMAGE}

# TimeZone
RUN apk add --no-cache tzdata
RUN cp /usr/share/zoneinfo/Europe/Rome /etc/localtime
RUN apk del tzdata

# Add Memcached
RUN apk add --no-cache --upgrade php7-memcached

# Add prestissimo
RUN composer global require "hirak/prestissimo"

# https://www.php.net/manual/en/opcache.configuration.php#ini.opcache.validate-timestamps
RUN echo opcache.validate_timestamps = 0 >> /opt/docker/etc/php/php.ini