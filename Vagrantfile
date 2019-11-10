Vagrant.configure("2") do |config|
 config.vm.box = "ubuntu/xenial64"
 
 config.vm.define "web" do |web|
  web.vm.box = "ubuntu/xenial64"
  web.vm.hostname = "web-server"
  web.vm.network "private_network", ip: "192.168.100.10"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.provider "virtualbox" do |web|
   web.name = "web-server"
   web.cpus = 1
   web.memory = "1024"
  end
 
  web.vm.provision "shell", inline: <<-SHELL
   apt-get update
   apt-get -y upgrade
   apt-get install -y mc htop tmux mysql-client
   apt-get install -y apache2 php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-mcrypt php-xml php-xmlrpc zip
   a2enmod rewrite
   service apache2 restart
 
   cd /tmp
   wget http://wordpress.org/latest.zip > /dev/null
   unzip latest.zip
   mv /tmp/wordpress/ /var/www/
 
   cd /etc/apache2/sites-available/
   a2dissite 000-default.conf
   cp 000-default.conf wordpress.conf
   a2ensite wordpress.conf
 
   chown -R www-data:www-data /var/www/wordpress/
 
   sed -i 's/html/wordpress/' /etc/apache2/sites-available/wordpress.conf
   sed -i 's/#ServerName www.example.com/ServerName worpdress.example.ru/' /etc/apache2/sites-available/wordpress.conf
   sed -i 's/ServerAdmin webmaster@localhost/ServerAdmin volodymyr.skliar@nure.ua/' /etc/apache2/sites-available/wordpress.conf
 
   service apache2 restart
  SHELL
 end

 config.vm.define "db" do |db|
  db.vm.box = "ubuntu/xenial64"
  db.vm.hostname = "db"
  db.vm.network "private_network", ip: "192.168.100.11"

  config.vm.provider "virtualbox" do |db|
   db.name = "db"
   db.cpus = 1
   db.memory = "1024"
  end

  db.vm.provision "shell", inline: <<-SHELL
   apt-get update
   apt-get -y upgrade
   apt-get install -y mc htop tmux

   export DEBIAN_FRONTEND=noninteractive
   debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password password Qwerty.123'
   debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password_again password Qwerty.123'

   apt-get install -y mariadb-server

   sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

   service mysql restart

   mysql -u root -pQwerty.123 -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
   mysql -u root -pQwerty.123 -e "GRANT ALL ON wordpress.* TO 'wordpress'@'192.168.100.10' IDENTIFIED BY 'wordpress';"

  SHELL
  end
 end