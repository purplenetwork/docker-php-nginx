# Build arguments
FROM webdevops/php-nginx:alpine-php7

# TimeZone
RUN apk add --no-cache tzdata
RUN cp /usr/share/zoneinfo/Europe/Rome /etc/localtime
RUN apk del tzdata

# Add Memcached
RUN apk add --no-cache --upgrade php7-memcached

# Add prestissimo
RUN composer global require "hirak/prestissimo"

# Add the source
ONBUILD ARG APP_PATH=.
ONBUILD ADD ${APP_PATH} /app
ONBUILD ADD --chown=application ${APP_PATH} /app

# Set the working directory
ONBUILD WORKDIR /app