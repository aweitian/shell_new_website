#!/bin/bash  
if [ $# -ne 1 ]; then
	echo $0 www.baidu.com
	exit;
fi
path="/www/web/$1"
public="$path/public"


if [ ! -d ${path} ]; then
	ls /www/web
	echo "$path is not exist!";
	exit
fi


if [ -d ${public} ]; then
	ls $public
	echo "=================================="
	echo "$public exist!"
	echo "=================================="
	echo "rm -rf $public"
	exit
fi

cd $path
#echo $public
#exit;

git clone /home/www/repository/cms.git .
cp /home/www/.env $path
composer update
cp -a /home/www/templates/ $public
cp /home/www/.htaccess $public
sed -i "s/cattkyy_com/$1/g" .env
cd public
cp index.php.dist index.php
cd ..
chown -R www:www .
echo "done!!!"
exit
