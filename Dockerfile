FROM tutum/lamp:latest

# Install needed mods
RUN apt-get update && apt-get install -y php5-gd php5-curl wget unzip && php5enmod mcrypt && php5enmod gd && apachectl restart

# Get PrestaShop
RUN mkdir /src && rm -fr /app && wget "https://download.prestashop.com/download/releases/prestashop_1.6.1.10.zip" -O prestashop.zip && unzip prestashop.zip -d /src && mv /src/prestashop /app

# Get extra modules
RUN mkdir /src/modules && git clone https://github.com/wilwade/prestashop-module-weather /src/modules/weather

# Link extra modules
RUN ln -s /src/modules/weather/weather /app/modules/weather

# Fix permissions
RUN chown -R www-data:www-data /app && chown -R www-data:www-data /src/modules

# Allow for overriding Limit
RUN sed -i 's/AllowOverride FileInfo$/AllowOverride FileInfo Limit/' /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80
CMD ["/run.sh"]
