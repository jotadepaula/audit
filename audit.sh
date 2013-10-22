#!/bin/bash
hostScan="127.0.0.1"
function exportPermissoes () { 
	listPer=$(ls -l)
	echo "$listPer" >> listPer.log

}
 function scan () {
 	listScan=$(nmap -v $hostScan)
 	echo "$listScan" >> listScan.log
 }
#exportPermissoes
scan