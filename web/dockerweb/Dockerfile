FROM ubuntu:latest

RUN apt update --fix-missing

# FIX TIMEZONE ISSUE
RUN apt install tzdata -y

# UTILS THAT ARE NEEDED
RUN apt install vim git zip wget curl -y

# STYLE TOOLS LESS AND COMPASS
RUN apt install npm -y && npm install -g less
RUN apt install ruby-compass -y && gem install sass-globbing


# APACHE2 NEEDED
RUN apt-get install apache2 -y && a2enmod rewrite ssl

# MYSQL CLIENT TO CONNECT BACK TO NETWORKED MYSQL CONTAINER
RUN apt-get install mysql-client -y

# GET ALTERNATIVE PHP VERSIONS IF YOU DON'T WANT STANDARD
# RUN apt-get install -y software-properties-common apt-utils language-pack-en-base
# RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php
# RUN apt-get update -y

# PHP NEEDED - DEFAULT UBUNTU IS PHP7.2
RUN apt-get install -y php
RUN apt-get install -y php-common	php-curl	php-gd	php-xml	php-mysql	php-mbstring	php-zip  php-ldap php-imagick

# PHP 5.6
# RUN apt-get install -y php5.6
# RUN apt-get install -y php5.6-common	php5.6-curl	php5.6-gd	php5.6-xml	php5.6-mysql	php5.6-mbstring	php5.6-zip  php5.6-ldap php5.6-imagick

# PHP 7.1
# RUN apt-get install -y php7.1
# RUN apt-get install -y php7.1-common	php7.1-curl	php7.1-gd	php7.1-xml	php7.1-mysql	php7.1-mbstring	php7.1-zip  php7.1-ldap php7.1-imagick

# PHP APACHE2 HOOKUP STUFF
# SELECT CORRECT VERSION BASED ON PHP VERSION
RUN apt-get install -y libapache2-mod-php
# RUN apt-get install -y libapache2-mod-php5.6
# RUN apt-get install -y libapache2-mod-php7.1

# IF USING ALTERNATIVE PHP VERSION UPDATE BUT ALSO RESTART APACHE2
# SELECT CORRECT VERSION BASED ON PHP VERSION
RUN service apache2 restart
# RUN update-alternatives --set php /usr/bin/php5.6 && service apache2 restart
# RUN update-alternatives --set php /usr/bin/php7.1 && service apache2 restart

# COMPOSER INSTALL
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && mv composer.phar /usr/local/bin/composer && php -r "unlink('composer-setup.php');"

# DRUPAL CONSOLE INSTALL
RUN curl https://drupalconsole.com/installer -L -o drupal.phar && chmod +x drupal.phar && mv drupal.phar /usr/local/bin/drupal

# DRUSH INSTALL
RUN composer global require drush/drush:8.x-dev --prefer-source && ln -s /root/.composer/vendor/drush/drush/drush /usr/local/bin
# RUN composer global require drush/drush:9.x-dev --prefer-source && ln -s /root/.composer/vendor/drush/drush/drush /usr/local/bin


# UPDATE AND CLEANUP
# RUN apt-get dist-upgrade -y && apt-get autoremove -y

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
