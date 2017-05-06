sudo apt-get update
sudo apt-get install nginx -y
sudo ufw allow 'Nginx HTTP'
sudo ufw status
sudo apt-get update
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install mysql-server -y
sudo apt-get install php5-fpm php5-mysql
add_file="/etc/php5/fpm/php.ini"
if [ -f $add_file ]
then 
	echo "hi vikas file is  avalable"
	sed -i '2 cgi.fix_pathinfo=0' $add_file
else
	echo "file not avalable"
fi
sudo service php5-fpm restart
defalt_file="/etc/nginx/sites-available/default"
if [ -f $defalt_file  ]
then
	echo "hi vikas doing changes in this file"
	sed -i '39,47d' $defalt_file
	sed -i '/root/Nginx-vikas/r serverconf.txt' $defalt_file
fi
sudo nginx -t
sudo systemctl reload nginx
cd /usr/share/nginx/html/
touch info.php
php_file="/usr/share/nginx/html/info.php"
if [ -f $php_file ]
then 
	echo "php file also avalable "
	sed -i '/root/Nginx-vikas/r phpconf.txt' $php_file
fi

