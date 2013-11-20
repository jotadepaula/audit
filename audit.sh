#!/bin/bash
hostScan="127.0.0.1"
function exportPermissoes () { 
	listPer=$(ls -l)
	echo "$listPer" >> listPer.cvs

}
 function scan () {
 	listScan=$(nmap -v $hostScan)
 	echo "$listScan" >> listScan.cvs
 }

 function verCompartilhamentos() {
 	samba=$(smbclient -L 127.0.0.1 -N)
 	echo "$samba" >> verCompartilhamentos.cvs
 }
exportPermissoes
scan
verCompartilhamentos
