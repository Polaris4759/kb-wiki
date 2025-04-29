# Paquets  
  
> ### imagemagick  
  
>> Edition en ligne de commande d'image  
  
> ### mkhtmltopdf  
  
>> Conversion d'une page web en PDF  
  
> ### lftp  
  
>> Client FTP  
  
>>> Permet d'automatiser la synchronisation de dossiers locaux et distants  

> ### [pdftotext](#pdftotext-1)  

>> Outil OCR permettant de retranscrire des PDF en txt  
  
> ### xampp  
  
>> Suite logiciels Apache, MySql, etc..  
  
>> #### Dépannage :  
  
> ```bash sudo /opt/lampp/lampp security```  
  
> ### [samba](#samba-1)  
  
>> Partage de dossiers et d'imprimantes au sein d'un réseau local  
Suite d'outils qui permettent de gérer le protocole SMB (ou CIFS) sous Linux.  
  
	apt install samba  
  
> ### Vim  
  
---  
  
# Logiciels graphiques  
  
> ### Atom  
  
	sudo add-apt-repository ppa:webupd8team/atom && apt update && apt install atom  
  
> ### Calibre  
  
	apt install calibre  
  
> ### Filebot  
  
	mkdir ~/Téléchargements/filebot-portable && cd $_ && sh -xu <<< "$(curl -fsSL https://raw.githubusercontent.com/filebot/plugins/master/installer/tar.sh)"  
  
> ### Filezilla  
  
	apt install filezilla  
  
> ### Gparted  
  
	apt install gparted  
  
> ### jDownloader  
  
	sudo add-apt-repository ppa:jd-team/jdownloader && apt update && apt install jdownloader-installer  
  
> ### Kodi  
  
	apt install kodi  
  
> ### MKVToolnix  
  
	apt install mkvtoolnix mkvtoolnix-gui  
  
> ### Remarkable  
  
	mkdir ~/Téléchargements/Remarkable && cd $_ && wget https://remarkableapp.github.io/files/remarkable_1.87_all.deb && dpkg -i remarkable_1.87_all.deb  
  
> ### Spotify  
  
	sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list' && sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list' && apt update && apt install spotify-client  
  
> ### Teamviewer  
  
	mkdir ~/Téléchargements/TeamViewer && cd $_ && wget https://download.teamviewer.com/download/linux/teamviewer-host_amd64.deb && dpkg -i teamviewer-host_amd64.deb  
  
> ### Virtualbox  
  
	apt install virtualbox virtualbox-qt virtualbox-dkms  
  
> ### yEd Graph Editor  
  
	mkdir ~/Téléchargements/yEd-graph-editor && cd $_ && wget https://www.yworks.com/resources/yed/demo/yEd-3.18.1.1_with-JRE10_64-bit_setup.sh && chmod +x yEd-3.18.1.1_with-JRE10_64-bit_setup.sh && ./yEd-3.18.1.1_with-JRE10_64-bit_setup.sh  
  
> ### Zenmap  
  
	apt install zenmap  
  
---  
  
## Plex Server    
  
Ajout du dépôt Plex :    
`nano /etc/apt/sources.list.d/plexmediaserver.list`    
`deb https://downloads.plex.tv/repo/deb public main`    
`wget -q https://downloads.plex.tv/plex-keys/PlexSign.key -O - | apt-key add -`    
  
Installation des paquets :    
`apt update`    
`apt install plexmediaserver`    
  
Vérification que le service Plex est Up :    
`systemctl status plexmediaserver `    
  
Création d'un répertoire pour héberger les médias :    
`sudo mkdir -p /opt/plexmediaserver/{movies,series}`    
Ou dans le cas d'un hébergement des médias sur disque dur par exemple :  
`sudo mkdir /opt/plexmediaserver/`    
`mount -t ntfs-3g /dev/sdb1 /opt/plexmediaserver/`    
  
Modification des permissions du répertoire hébergeant les médias    
`sudo chown -R $USER: /opt/plexmediaserver `    
`sudo chmod 755 -R /opt/plexmediaserver`    
Pour accéder au serveur :   
`http://YOUR_SERVER_IP:32400/web`    
  
## Samba  
  
Installation    
`apt update && apt install -y samba`    
  
Vérification de la version    
`smbd --version`    
  
Démarrage de Samba  
`systemctl status smbd`  
  
Modification de la configuration de Samba    
`vim /etc/samba/smb.conf`    
Ajouter le répertoire à partager :  
  
  
Redémarrer Samba pour charger la conf    
`systemctl restart smbd`    
  
Création d'un utilisateur spécifique au partage    
`adduser it-connect`    
`smbpasswd -a it-connect`    
  
Création d'un groupe pour le partage    
`groupadd partage`    
  
Ajout du compte utilisateur précédemment créé dans le groupe de partage    
`gpasswd -a it-connect partage`    
  
Création du répertoire à partager et modification des droits d'accès    
`mkdir /srv/partage`    
`chgrp -R partage /srv/partage/`    
`chmod -R g+rw /srv/partage/`    
  
Dans l'explorateur Windows, taper ce chemin pour accéder au partage    
`\\<nom-du-serveur>\it-connect`    
  
Il est également possible de l'ajouter en tant que disque réseau    
  
## SSH    
  
### Installation    
  
`sudo apt install openssh-server`    
  
`sudo vi /etc/ssh/sshd_config`    
  
Changer `PasswordAuthentication no` en `PasswordAuthentication yes`    
A la fin du fichier, rajouter `AllowUsers user` en remplaçant `user` par l'utilisateur qui va se connecter    
  
`service ssh status`    
`sudo service ssh start`    
  
  
### Connexion sans mot de passe    
Sur la machine qui va se connecter à la machine distante :    
`ssh-keygen`    
Il faut taper "Entrée" tout le long    
`ssh-copy-id -i ~/.ssh/id_rsa.pub <remote_host>`    

## Mail depuis Gmail  

```shell
apt-get install postfix mailutils libsasl2-2 ca-certificates libsasl2-modules
systemctl enable postfix
vim /etc/postfix/main.cf
# Modifier
relayhost = [smtp.gmail.com]:587
# Ajouter
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_tls_CAfile = /etc/postfix/cacert.pem
smtp_use_tls = yes
```

Sur Gmail, Paramètres, activer l'authentification en deux étapes, puis configurer un "Mot de passe d'application".  

```shell
vim /etc/postfix/sasl_passwd
[smtp.gmail.com]:587 USERNAME@gmail.com:MDP_Application
chmod 400 /etc/postfix/sasl_passwd
postmap /etc/postfix/sasl_passwd
cd /etc/ssl/certs
openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key-for-smtp-gmail.pem -out cert-for-smtp-gmail.pem
cat /etc/ssl/certs/cert-for-smtp-gmail.pem | sudo tee -a /etc/postfix/cacert.pem
/etc/init.d/postfix reload
/etc/init.d/postfix status
```

## [pdftotext](#paquets)  

### Installation  

```shell
apt update && apt install poppler-utils
```

### Utilisation  

```shell
pdftotext -layout input.pdf output.txt
```
