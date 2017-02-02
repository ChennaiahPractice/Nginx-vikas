sudo apt-get update
sudo apt-get install nginx -y
sudo ufw allow 'Nginx HTTP'
sudo ufw status
sudo apt-get update
sudo apt-get install mysql-server
sudo mysql_secure_installation
sudo apt-get install php-fpm php-mysql -y
add_file="/etc/php/7.0/fpm/php.ini"
if [ -f $add_file ]
then 
	echo "hi vikas file is  avalable"
	sed -i '2 cgi.fix_pathinfo=0' $add_file
else
	echo "file not avalable"
fi
sudo systemctl restart php7.0-fpm
defalt_file="/etc/nginx/sites-available/default"
if [ -f $defalt_file  ]
then
	echo "hi vikas doing changes in this file"
	sed -i '39,47d' $defalt_file
	sed -i '/root/Nginxvikas/r serverconf.txt' $defalt_file
fi
sudo nginx -t
sudo systemctl reload nginx
cd /var/www/html
touch info.php
php_file="/var/www/html/info.php"
if [ -f $php_file ]
then 
	echo "php file also avalable "
	sed -i '/root/Nginxvikas/r phpconf.txt' $php_file
fi
