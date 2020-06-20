#!/bin/bash
while :
do 
clear
echo "----------Menu principal----------"
echo "|1.Crear directorio              |"
echo "|2.Respaldar base de datos       |"
echo "|3.Activar/desactivar conexion   |"
echo "|4.Monitorear sql                |"
echo "|5.Verificar conexion a internet |"
echo "|0.Salir                         |"
echo "----------------------------------"
read -p "Opcion: " op

case "$op" in
	1)
	clear
	echo "Crear directorio de usuario" 
	echo "1.Medicos"
	echo "2.Administradores"
	read -p "Opcion: " opD
	case "$opD" in
		1)
		read -p "Nombre del directorio: " nombreD
		cd Medicos/
		cd Usuarios/
		mkdir $nombreD 
		;;
		2)		
		read -p "Nombre del directorio: " nombreD	
		cd Administradores/
		cd Usuarios/
		mkdir $nombreD
		;;
	esac
	;;
	2)
	clear
	read -p "Ingrese el nombre de su usuario: " nom
	read -p "Ingrese el nombre de la base de datos: " basedatos
	read -p "Ingrese el nombre de su host: " host
	mysqldump -u $nom -p -h $host $basedatos > respaldo.sql;
	;;
	3)
	clear 
	echo "1.Activar ssh"
	echo "2.Desactivar ssh"
	read -p "Opcion: " opS
	case "$opS" in
		1)
		sudo systemctl enable sshd
		sleep 4;
		echo "Debe reiniciar para que los cambios tomen efecto"
		;;
		2)
		sudo systemctl disable sshd
		echo "Debe reiniciar para que los cambios tomen efecto"
		sleep 4;
		;;
		*)
		echo "Ingrese una opcion valida"
		sleep 2;
		;;
	esac
	;;
	4)
	clear
	systemctl status mysqld
	sleep 2;
	;;
	5)
	clear
	ping -c 7 -q google.com
	sleep 2; 
	exit
	;;
	0)
	exit

	;;
	*)
	;;
esac

done
