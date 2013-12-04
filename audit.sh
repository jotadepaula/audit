#!/bin/bash

#Função que exporta permissões de um dirétório passado como parametro
#Salva o arquivo listPer.cvs para ser importado no excel

function exportPermissoes () { 
	listPer=$(ls -l $1 -R)
	echo -e "Exportando permissoes..."
	echo "$listPer" >> listPer.cvs
	echo -e "Permissoes exportadas com Sucesso"

}

#Função que scaneia um ip recebido como parametro e exporta o resultado no arquivo listScan.cvs 

 function scan () {
	listScan=$(nmap -v $1)
 	echo -e "escaneado IP ... "
 	echo -e "Exportando resultados ..."
 	echo -e "$listScan" >> listScan.cvs
 	echo -e "Escaneamento conluido com sucesso "
 }

#Função que verifica os compartilhamentos de um endereço numa rede através do Samba

 function verCompartilhamentos() {
  	echo -e " verificando Compartilhamentos..."
  	echo -e "Exportando resultados ..."
 	samba=$(smbclient -L $1 -N)
 	echo "$samba" >> verCompartilhamentos.cvs
 	echo -e "Verifcação conluida com sucesso "
 }

#inicia o Programa

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

