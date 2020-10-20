FROM httpd 
RUN apt-get update && apt-get install -y cron
RUN echo '* * * * * docker ps > /usr/local/apache2/htdocs/index.html 2>&1' >>/var/spool/cron/crontabs/root
WORKDIR /var/spool/cron/crontabs
RUN crontab root
CMD ["/bin/bash","-c","service cron start && httpd-foreground"]
