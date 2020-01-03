FROM centos:7

RUN yum install httpd -y && yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm && yum -y install epel-release yum-utils

RUN yum-config-manager --disable remi-php54 && yum-config-manager --enable remi-php73

RUN yum -y install php php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json

RUN cd /var/www/html && echo "<?php phpinfo(); ?>" > test.php

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]