#!/bin/bash
while : 
do 
clear 
echo "----------Programa de gestion de usuarios----------"
echo "|                                                 |"
echo "| 1. Crear un usuario                             |"
echo "| 2. Eliminar un usuario                          |"
echo "| 3. Modificar un usuario                         |"
echo "| 0. Salir                                        |"
echo "---------------------------------------------------"
read -p "Opcion: " op

case "$op" in
	1)
	clear 
	read -p "Ingrese el nombre del usuario a crear: " nombre
	read -p "Ingrese la ruta de su directorio de trabajo: " ruta
	read -p "Ingrese el grupo principal del usuario: " grupo
	sudo useradd -d $ruta -m -s /bin/bash -g $grupo $nombre
	echo "Ingrese la contraseña del usuario: " 
	sudo passwd $nombre
	sleep 5;
	;;
	2)	
	read -p "Ingrese el nombre del usuario a eliminar: " nombre
	sudo userdel -r $nombre
	echo "El usuario $nombre fue eliminado correctamente.."
	sleep 5;
	;;
	3)
	clear
	read -p "Ingrese el nombre del usuario a crear: " nombre	
	read -p "Ingrese la ruta de su directorio de trabajo: " ruta
	read -p "Ingrese el grupo principal del usuario: " grupo
	echo "----------Modificar----------"
	echo "| 1.Nombre		  |"
	echo "| 2.Contraseña              |"
	echo "| 3.Directorio              |"
	echo "| 0.Salir                   |"
	echo "-----------------------------"
	read -p "Opcion: " opM
	case "$opM" in 
		1)
			clear
			read -p "Ingrese el nombre del usuario a modificar: " nombreM
			read -p "Ingrese el nuevo nombre del usuario: " nombreN
			sudo usermod -l $nombreN $nombreM
			echo "El nombre fue modificado correctamente.."
			sleep 3;
		;;
		2)	
			clear
			read -p "Ingrese el nombre del usuario: " nombre	
			sudo passwd $nombre
			echo "Modificado correctamente.."
			sleep 3;
		;;
		3)
			clear
			read -p "Ingrese el nombre del usuario: " nombre	
			read -p "Ingrese la ruta de su directorio de trabajo: " ruta
			sudo usermod -d $ruta -m $nombre
			echo "Modificado correctamente.."
			sleep 3;
		;;
		0)
			echo "Finalizando.."
			sleep 3;
			clear
			exit
		;;
		*)
			echo "Ingrese una opcion valida"
			sleep 3;
		;;
	esac
	;;
	0)
	echo "Finalizando.."
	sleep 5;
	clear
	exit
	;;
	*)
	echo "Ingrese una opcion valida"
	sleep 3;
	;;
esac
done	
