#!/bin/bash

function exportPermissoes () { 
	listPer=$(ls -l)
	echo "$listPer" >> listPer.cvs

}
 function scan () {
	listScan=$(nmap -v $1)
 	echo -n "escaneado IP ..."
 	echo -n "Exportando resultados ..."
 	echo -n "$listScan" >> listScan.cvs
 	echo "Escaneamento conluido com sucesso"
 }

 function verCompartilhamentos() {
 	samba=$(smbclient -L 127.0.0.1 -N)
 	echo "$samba" >> verCompartilhamentos.cvs
 }
echo -n "digite o IP a ser escaneado:"
read $hostScan
scan "$hostScan"

