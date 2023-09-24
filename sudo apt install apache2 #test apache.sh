sudo apt install apache2 #test apache
sudo apt install libapache2-mod-php -y
sudo systemctl restart apache2
sudo nano /var/www/html/phpinfo.php # <?php phpinfo() ?>
sudo apt install mysql-server
sudo apt install mysql-client
sudo apt install php8.1-mysql
sudo apt install php8.1-curl
sudo apt install phpmyadmin
sudo systemctl restart apache2
sudo nano /etc/apache2/apache2.conf #Include /etc/phpmyadmin/apache.conf
sudo systemctl restart apache2
sudo /etc/init.d/mysql restart