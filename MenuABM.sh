#!/bin/bash
while :
do
	clear
	echo "MENU"
	echo "1.Usuarios"
	echo "2.Grupos"
	echo "0.Salir"
	echo "Opcion: "
	read op
	case $op in
		1)
		sh Usuarios.sh;;
		2)
		sh Grupos.sh;;
		0)
		sleep 3;
		clear
		echo "Gracias por utilizar nuestro programa!"
		exit ;;
		*)
		echo "Ingrese una opcion valida!";;
	esac

done
