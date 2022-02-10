# FTP    
>FTP pour File Transfer Protocol, est un protocole de transfert de fichier. Il utilise par défaut le port 21.    
    
## Connexion    
  
>`ftp <adresse>`    
  
>> ou    
  
>`ftp` puis `open <adresse>`    
  
## Commandes  
  
### Déplacements  
  
>`cd` : Déplacement sur le **serveur distant**    
`lcd` : Déplacement sur la **machine locale**    
`ls` : Liste les fichiers sur **le serveur distant**    
`!ls` : Liste les fichiers sur **la machine locale**  
  
### Charger un fichier     
  
>`put <fichier>`    
    
### Télécharger un fichier    
  
>`get <fichier>`    
  
  
### Quitter le mode ftp    
  
>`bye`  
ou  
`Ctrl-d`    
  
## LFTP  
  
> LFTP permet de faire des transferts FTP dans un script    
  
>> _Exemple :_  
  
```console  
lftp ftp://$LOGIN:$PASSWORD@$HOST -e "lcd $LOCALDIR ; cd $REMOTEDIR ; mirror -R -v --ignore-time; quit"  
```  
  
  
