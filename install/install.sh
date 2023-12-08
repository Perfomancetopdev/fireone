#!/bin/bash


cd /home
yum update -y

yum remove -y httpd
yum remove -y libopendkim*
yum remove -y opendkim
yum remove -y postfix
yum remove -y php*
yum remove postgres\*
rm -rf /etc/httpd
rm -rf /etc/opendkim*


setenforce 0
setenforce Disabled


read -p 'Enter your Domain Name: ' Fqdn
read -p 'Enter your Database Sytem name: ' DBsystem
read -p 'Enter your Database client name: ' DBclient
read -p 'Enter your Database MD5 passowrd: ' DBpwd

ConfIps=`ip a | grep 'inet ' | awk '{print $2}' | cut -f1 -d/ | grep -v ^127.[0-9] | grep -v ^10.[0-9] | grep -v ^192.168.[0-9] | grep -v ^172.16.[0-9]`
echo "$ConfIps" > /root/ips.info
Ips=`cat /root/ips.info`
IpPrinc=`head -1 /root/ips.info`
IpsQuant=`cat /root/ips.info | wc -l`
sleep 2s

yum install -y openssh-clients
yum install -y glibc.i686
yum install -y pam.i686 pam
yum install -y nano
yum install -y rsync
yum install -y wget
yum install -y xinetd
yum install -y gcc
yum install -y make
yum install -y httpd
yum install -y perl
yum install -y mod_ssl
yum install -y zip
yum install -y unzip
yum install -y yum-utils
yum update -y

wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm;

rpm -Uvh epel-release-latest-7.noarch.rpm
rpm -Uvh remi-release-7*.rpm

yum-config-manager --enable remi-php70

yum install -y php
yum install -y php-pgsql
yum install -y php-mysql
yum install -y php-common
yum install -y php-pdo
yum install -y php-opcache
yum install -y php-mcrypt
yum install -y php-imap
yum install -y php-mbstring
yum install -y php-soap
yum install -y php-xmlrpc
yum install -y cronie
yum install -y php-pecl-ssh2
yum update -y ca-certificates


sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 5G/g' /etc/php.ini
sed -i 's/max_file_uploads = 20/max_file_uploads = 200/g' /etc/php.ini
sed -i 's/post_max_size = 8M/post_max_size = 5G/g' /etc/php.ini
sed -i 's/memory_limit = 128M/memory_limit = -1/g' /etc/php.ini
sed -i 's/max_input_time = 60/max_input_time = 3600/g' /etc/php.ini
sed -i 's/;max_input_nesting_level = 64/max_input_nesting_level = 10000/g' /etc/php.ini
sed -i 's/; max_input_vars = 1000/max_input_vars = 100000/g' /etc/php.ini
sed -i 's/default_socket_timeout = 60/default_socket_timeout = 360/g' /etc/php.ini
sed -i 's/max_execution_time = 30/max_execution_time = 3600/g' /etc/php.ini

echo " Restarting services "

systemctl restart httpd.service
systemctl enable httpd.service


php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
HASH="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"
chmod +x /usr/local/bin/composer
sleep 3s


yum -qy module disable postgresql
rpm -Uvh -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
yum install postgresql11-server postgresql11 -y
/usr/pgsql-11/bin/postgresql-11-setup initdb 
systemctl enable postgresql-11.service
systemctl start postgresql-11.service
clear
sleep 2s

set PGPASSWORD=$DBpwd
sudo -u postgres psql postgres -c "CREATE ROLE admin PASSWORD '$DBpwd' SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN;"
sudo -u postgres psql postgres -c "CREATE DATABASE nosystem OWNER admin;"
sudo -u postgres psql postgres -c "CREATE DATABASE noclients  OWNER admin;"
sleep 2s



rm -rf /var/lib/pgsql/11/data/pg_hba.conf
cp /usr/fireone/install/pg_hba_trust.conf /var/lib/pgsql/11/data/pg_hba.conf
rm -rf /usr/fireone/install/pg_hba_trust.conf
sed -i 's/#listen_addresses =/listen_addresses =/g' /var/lib/pgsql/11/data/postgresql.conf
sed -i 's/#port =/port =/g' /var/lib/pgsql/11/data/postgresql.conf
sed -i 's/max_connections = 100/max_connections = 3000/g' /var/lib/pgsql/11/data/postgresql.conf
systemctl restart postgresql-11.service


echo " Instaling Java "

cd /opt/
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "https://github.com/frekele/oracle-java/releases/download/8u212-b10/jdk-8u212-linux-x64.tar.gz"
tar -xvf jdk-8u212-linux-x64.tar.gz
cd /opt/jdk1.8.0_212/
alternatives --install /usr/bin/java java /opt/jdk1.8.0_212/bin/java 2
alternatives --config java
alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_212/bin/jar 2
alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_212/bin/javac 2
alternatives --set jar /opt/jdk1.8.0_212/bin/jar
alternatives --set javac /opt/jdk1.8.0_212/bin/javac
export JAVA_HOME=/opt/jdk1.8.0_212
export JRE_HOME=/opt/jdk1.8.0_212/jre
export PATH=$PATH:/opt/jdk1.8.0_212/bin:/opt/jdk1.8.0_212/jre/bin
echo 'apache ALL = NOPASSWD: /opt/jdk1.8.0_212/bin/java' | sudo EDITOR='tee -a' visudo
alternatives --config java 1
alternatives --config --auto java
alternatives --config --auto=1 java
cd /home
sleep 1s

yum install -y epel-release
yum update -y

sudo -u postgres psql -U admin -d nosystem -a -f /usr/fireone/install/system.sql
sudo -u postgres psql -U admin -d noclients -a -f /usr/fireone/install/clients.sql
rm -rf system.sql
rm -rf clients.sql
sed -i "s|200.200.200.200|$IpPrinc|g" /usr/fireone/config/application.json
sed -i "s|xxxx|$DBpwd|g" /usr/fireone/datasources/clients.json
sed -i "s|yyyy|$DBclient|g" /usr/fireone/datasources/clients.json
sed -i "s|xxxx|$DBpwd|g" /usr/fireone/datasources/system.json
sed -i "s|yyyy|$DBsystem|g" /usr/fireone/datasources/system.json
sleep 1s

wget https://github.com/phpPgAdmin/phppgadmin/archive/REL_5-6-0.tar.gz
tar -zxvf REL_5-6-0.tar.gz

mv phppgadmin-REL_5-6-0/ /usr/share/phppgadmin
mv /usr/share/phppgadmin/conf/config.inc.php-dist /usr/share/phppgadmin/conf/config.inc.php

rm -rf /usr/share/phppgadmin/conf/config.inc.php
cp /usr/fireone/install/config.inc.php /usr/share/phppgadmin/conf/config.inc.php

sleep 3s

echo "
Alias /phpmyadmin /usr/share/phppgadmin

<Directory /usr/share/phppgadmin/>
   AddDefaultCharset UTF-8

   <IfModule mod_authz_core.c>
     # Apache 2.4
     <RequireAny>
       Require ip 105.67.129.198
       Require ip ::1
     </RequireAny>
   </IfModule>
   <IfModule !mod_authz_core.c>
     # Apache 2.2
     Order Deny,Allow
     Deny from All
     Allow from 105.67.129.198
     Allow from ::1
   </IfModule>
</Directory>
" > /etc/httpd/conf.d/phpPgAdmin.conf

sleep 3s

echo "
<VirtualHost *:80>
        ServerName $Fqdn
        DocumentRoot '/usr/fireone/public/'
        <Directory /usr/fireone/public/>
                AllowOverride all
                Options Indexes FollowSymLinks
                Order Deny,Allow
                Allow from all
        </Directory>
</VirtualHost>
" > /etc/httpd/conf.d/vhost.conf
setsebool -P httpd_can_network_connect 1
sed -i 's|/var/www/html|/usr/fireone/public/|g' /etc/httpd/conf/httpd.conf
cd /usr/fireone/
composer remove monolog/monolog
composer require monolog/monolog
chown -R apache:apache /usr/fireone/
chown -R apache:apache /usr/fireone/storage/logs
chown -R apache:apache /usr/fireone/storage/*
chown -R apache:apache /usr/fireone/public/*
cd /usr/fireone/install
crontab cron

sleep 3s
sudo systemctl restart httpd
sleep 3s
cd /usr/fireone/app/api/lib/
java -jar postgresql2.jar
chown -R apache:apache .lic


systemctl restart httpd.service
service httpd restart
