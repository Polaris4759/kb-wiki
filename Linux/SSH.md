# SSH  
  
>SSH pour Secure SHell, permet de se connecter à distance, de façon sécurisée,  au shell d'une machine ayant un serveur SSH.  
  
## connexion  
  
```console  
ssh <utilisateur>@<adresse>  
```  
  
## connexion avec intégration de X11  
  
```console  
ssh -X <utilisateur>@<adresse>  
```    
> ou    
  
```console  
ssh -Y <utilisateur>@<adresse>  
```  	  
  
## ajouter un alias ssh    
  
>Modifier le fichier ~/.ssh/config    
Il faut y ajouter les lignes suivantes :    
  
	Host <alias>  
		Hostname <adresse>  
		User <utilisateur>  
		Port 22 *Optionnel*  
  
## copies d'un serveur à un autre  
> Pour cela, on utilise la commande `scp`  
  
> ### Copier des fichiers  
```console  
scp serveur_source:chemin serveur_cible:chemin  
```  
> ### Copier des dossiers  
```console  
scp -r serveur_source:chemin serveur_cible:chemin  
```  
> ### Options  
> `-r` : Recursive    
`-p` : Préserve les informations du fichier source (date de modification, d'accès, ...)  
  
## authentification par clé  
  
> Création de la paire de clé    
`ssh-keygen`  
  
> Copier la clé publique sur le serveur cible    
`scp ~/.ssh/id_rsa.pub user@serveur\_cible:/tmp`    
`ssh user@serveur_cible`    
`cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys`  
`rm /tmp/id_rsa.pub`  
  
> Agent SSH    
`ssh-agent $SHELL`    
`ssh-add`    
    
> ou pour ne pas avoir à le faire systématiquement    
>    
>Créer le fichier `~/.bash_profile` sur le client, et ajouter les lignes suivantes :  
  
```console   
SSH_ENV="$HOME/.ssh/environment"  
  
function start_agent {  
     echo "Initialising new SSH agent..."  
     /usr/bin/ssh-agent | sed 's/^echo/# echo/' > "${SSH_ENV}"  
     echo succeeded  
     chmod 600 "${SSH_ENV}"  
     . "${SSH_ENV}" > /dev/null  
     /usr/bin/ssh-add;  
}  
  
#  Source SSH settings, if applicable  
  
if [ -f "${SSH_ENV}" ]; then  
     . "${SSH_ENV}" > /dev/null  
     # ps ${SSH_AGENT_PID} doesn't work under cywgin  
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {  
         start_agent;  
     }  
else  
     start_agent;  
fi  
```  
  
## Autorisé la connexion SSH du compte root    
  
> Modifier le fichier `/etc/ssh/sshd_config` pour ajouter la ligne suivante :    
`PermitRootLogin yes`    
