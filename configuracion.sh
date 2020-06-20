yum install mariadb-server
#echo "instalando wget"
yum install wget
#echo "descargamos el paquete rpm del repositorio mysql server"
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
#echo "Despelegamos e instalamos el rpm del repositorio mysql server"
rpm -ivh mysql-community-release-el7-5.noarch.rpm
#echo "Instalamos mysql server"
echo "Darle a si"
sleep 3;
yum install mysql-server
#echo "Una vez instalado podremos iniciar el servicio"
systemctl start mysqld
echo "Configuramos Mysql server y acceso externo"
sleep 2;
mysql_secure_installation
#echo "Abrimos el puerto de mysql para acceder desde fuera"
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --zone=public --add-service=ssh --permanent
#echo "Reiniciamos el servicio para que se apliquen los cambios"
systemctl restart firewalld.service



