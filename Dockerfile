FROM mono:6.12.0
ADD . /tmp/SMTONLINE
WORKDIR /tmp/SMTONLINE
EXPOSE 80

RUN /usr/bin/nuget restore &&  xbuild /p:Configuration=Release \
        && apt-get update \
        && apt-get install mono-devel apache2 libapache2-mod-mono mono-apache-server apt-transport-https ca-certificates -y --no-install-recommends \
        && a2enmod mod_mono \
        && service apache2 stop \
        && apt-get autoremove -y \
        && apt-get clean \
        && rm -rf /var/tmp/* /var/lib/apt/lists/* \
        && mkdir -p /etc/mono/registry /etc/mono/registry/LocalMachine \
        && sed -ri ' \
            s!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g; \
            s!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g; \
            ' /etc/apache2/apache2.conf \
        && rm -rf /var/www/html \
        && cp -r  /tmp/SMTONLINE/SMTONLINE/* /var/www && rm -rf /tmp/SMTONLINE && chown -R www-data:www-data /var/www
ADD ./default-apache.conf /etc/apache2/sites-available/000-default.conf
WORKDIR /var/www
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
