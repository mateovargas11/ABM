#!/bin/bash
while :
do 
clear 
echo "----------Programa de gestion de grupos----------"
echo "| 1.Crear grupo                                 |"
echo "| 2.Eliminar grupo                              |"
echo "| 3.Modificar grupo                             |"
echo "| 4.Sacar a un usuario de grupo                 |"
echo "| 0.Salir                                       |"
echo "-------------------------------------------------"
read -p "Ingrese una opcion: " op

case "$op" in
	1)
	clear 
	read -p "Ingrese el nombre del grupo a crear: " grupo
	sudo groupadd $grupo
	echo "El grupo fue creado correctamente.."
	sleep 3;
	;;
	2)
	clear 
	read -p "Ingrese el nombre del grupo a eliminar: " grupo
	sudo groupdel $grupo
	echo "El grupo fue eliminado correctamente.."
	sleep 3;
	;;
	3)
	clear 
	read -p "Ingrese el nombre del grupo a modificar: " grupo
	read -p "Ingrese el nuevo nombre: " grupoN
	sudo groupmod -n $grupoN $grupo
	echo "El grupo fue modificado correctamente.."
	sleep 3;
	;;
	4)
	clear 
	read -p "Ingrese el nombre del usuario a echar: " nombre
	read -p "Ingrese el nombre del grupo: " grupo
	sudo deluser $nombre $grupo
	echo "El usuario $nombre fue quitado del grupo $grupo"
	sleep 3;
	;;
	0)
	echo "Finalizando.."
	sleep 5;
	clear
	exit;;
	*) 
	echo "$op no es opcion valida"
	sleep 3;
	;;
esac
done
	
