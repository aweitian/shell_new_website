rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
yum install -y nginx
service nginx start

yum install -y mariadb mariadb-server
systemctl start mariadb
systemctl enable mariadb
mysqladmin -u root password 'root'

yum install -y php


php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --filename=composer
mv composer /bin
php -r "unlink('composer-setup.php');"

yum install -y php-fpm
service php-fpm start
