# Divers  
  
## **sysprep**  
  
## **Trouver le chemin d'un process**  
  
```console  
wmic process where "name='<nom_process'" get ExecutablePath  
```  
  
## Ajouter une application absente du menu démarrer  
  
1. Ouvrir une fenêtre de l'explorateur Windows  
2. Accéder au dossier `%APPDATA%\Microsoft\Windows\Start Menu\Programs`  
3. Copier dans ce dossier le raccourci de l'application  
4. Redémarrer le PC, ou juste l'explorateur Windows  
  
## Redémarrer l'explorateur Windows  
  
* <u>__Via l'invite de commande__</u> :  
  
```console  
taskkill /f /IM explorer.exe  
start explorer.exe  
exit  
```  
  
* <u>__Via le "Gestionnaire de tâches"__</u>    
  
>___Accéder au gestionnaire de tâches___ :    
1. Raccourci clavier : `Ctrl+Maj+Echap`    
2. Clic-droit sur la barre des tâches, "Gestionnaire des tâches"    
Dans processus, clic-droit sur "Explorateur Windows", "Redémarrer"    
  
## Linux Subsystem for Linux  
  
### Fichier /etc/wsl.conf  
  
Ce fichier permet la configuration de WSL au lancement.    
S'il n'existe pas, on peut le créer.  
  
#### Autoriser les modifications de permissions  
  
Il faut ajouter les lignes suivantes :    
  
```console  
[automount]  
enabled = true  
options = "metadata"  
```  
  
## Supprimer un service Windows    
  
`sc.exe delete "Nom_du_service"`    
  
## Telnet    
  
`pkgmgr /iu:”TelnetClient”` : Pour activer Telnet    
  
## Star Wars Episode IV en ASCII    
  
telnet towel.blinkenlights.nl    
  
## Voir ce qui empêche l'ordinateur de se mettre en veille    
  
`powercfg /requests` : Liste de ce qui maintient le PC eveillé    
`powercfg /requestsoverride` : Liste ce qui a été exclu par l'utilisateur    
`powercfg -requestsoverride DRIVER "<nom_du_driver>" awaymode display system` : Ajoute le driver <nom_du_driver> à la liste de ce qui ne doit pas maintenir eveillé le PC    

## Windows 11  

### Remettre la barre d'outil en haut de l'explorateur de fichier  

`reg add "HKCU\Software\Classes\CLSID\{d93ed569-3b3e-4bff-8355-3c44f6a52bb5}\InprocServer32" /f /ve`

Pour revenir à la barre d'outil Windows 11 :  
`reg delete "HKCU\Software\Classes\CLSID\{d93ed569-3b3e-4bff-8355-3c44f6a52bb5}" /f`  
