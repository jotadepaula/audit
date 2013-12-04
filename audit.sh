#!/bin/bash

function exportPermissoes () { 
	listPer=$(ls -l $1)
	echo -e "Exportando permissoes..."
	echo "$listPer" >> listPer.cvs
	echo -e "Permissoes exportadas com Sucesso"

}
 function scan () {
	listScan=$(nmap -v $1)
 	echo -e "escaneado IP ... "
 	echo -e "Exportando resultados ..."
 	echo -e "$listScan" >> listScan.cvs
 	echo -e "Escaneamento conluido com sucesso "
 }

 function verCompartilhamentos() {
  	echo -e " verificando Compartilhamentos..."
  	echo -e "Exportando resultados ..."
 	samba=$(smbclient -L $1 -N)
 	echo "$samba" >> verCompartilhamentos.cvs
 	echo -e "Verifcação conluida com sucesso "
 }
 
echo -e "digite o IP a ser escaneado:"
read hostScan
scan "$hostScan"

echo -e "Verificar permissoes dos diretórios"
echo -e "Digite o diretório a ser verificado"
read dir
exportPermissoes "$dir"

echo -e "Verificar Compartilhamentos na Rede"
echo -e "Digite o IP para verificar os Compartilhamentos"
read hostShare
verCompartilhamentos "$hostShare"

