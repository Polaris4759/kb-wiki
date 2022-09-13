# Système Linux  

## Changer le hostname  

```shell
#Changer le nom dans les fichiers suivants
sudo vim /etc/hostname
sudo vim /etc/hosts
sudo reboot
```

## Shell  

`chsh -l` : Affiche les différents shell disponible  

## Fichiers de configuration utilisateurs  
    
>`/etc/bash.bashrc` : Configuration globale    
>`~/.bashrc` : Configuration pour l'utilisateur    
>`/root/.bashrc` : Configuration pour root    
    
>> *Dans le fichier `.bashrc` il est possible de rajouter des alias.    
Par exemple, après avoir rajouté la ligne `alias ll='ls -l'`, il suffit de lancer la commande ll pour faire ls -l    
Une bonne pratique est de mettre les alias dans un fichier `.bash_aliases` séparé, sourcé dans le `.bashrc`    
Attention, après avoir modifié le fichier `.bashrc`, il faut le sourcer.*    
    
## Sourcer un fichier    
    
>`source <fichier>` ou  `. <fichier>`    
    
## Modifier l'éditeur par défaut    
    
>`sudo update-alternative --config editor` : Il faut choisir l'éditeur à utiliser    
`update-alternatives --set editor /usr/bin/vim.basic` : Permet de le faire en une seule ligne *(Vim doit être déjà installé)*    
    
## Fichier sudoers    
    
>Pour utiliser une commande sans avoir à utiliser de mot de passe, il faut ajouter la ligne suivante (Séparer plusieurs commandes par une virgule) :    
    
>`<user> ALL=NOPASSWD:<chemin_vers_la_commande>`    
  
>Pour utiliser toutes les commandes, sans utiliser de mot de passe    
    
>`<user> ALL=NOPASSWD:ALL`    
    
## Lancer une commande en tant qu'un autre utilisateur    
    
>`su - <username> -c "<comands>"`    
    
## Lancer une commande sur un serveur distant    
    
>`ssh <serveur> "<commande>"`    
    
## Connexion à distance avec Xrdp    
    
>`sudo apt-get install xrdp`    
  
## Changer disposition de clavier en azerty    
    
>`setxkbmap fr`    

## Dépannage    
    
>**Services**    
    
>>`/etc/init.d` : scripts de démarrage des services    
    
>**Cron**    
    
>>`service cron start` ou `/etc/init.d/cron start` pour Debian    
>>`service crond start` ou `/etc/init.d/crond start` pour CentOS    
    
>**Réseau**    
    
>>`systemctl restart networking` : redémarrer le service réseau    
>>`dhclient -4 <interface>` : redémarre le client DHCP    
>>`ifdown <interface>` : désactive le réseau    
>>`ifup <interface>` : active le réseau    
    
## Trouver sa version d'OS    
    
>`lsb-release -a`    
    
## Trouver les partitions connectées    
    
>`tree /dev/disk/`    
        
## Boucler sur des lignes contenant des espaces :      
    
>`find . | while read file;do echo $file;done`    
    
## Création d'une page de manuel    
    
1.Créer le fichier commande.man    
    
>`.TH` : Titre de la page    
`.SH` : Début de section    
`\-` :    
`\fB` : Police en **gras**    
`\fI` : Police en *italique*    
`\fR` : Police normal (Reset)    
`\fP` : Police précédente    
`.SS` : Sous-section    
`.TP` : Retrait    
    
2.Formater la page    
    
>`groff -Tascii -man commande.man | less`    
    
3.Copier la page dans le répertoire contenant les pages de manuel en modifiant l'extension en `.1`    
    
>Pour trouver un répertoire du MANPATH, on peut regarder le contenu du fichier `/etc/manpath.config`.    
    
>Sur Ubuntu par exemple, on peut les mettre dans `/usr/share/man/man1/`.    
>`cp commande.man /usr/share/man/man1/commande.1`    
    
>Il peut être intéressant de compresser la page de manuel    
>`gzip /usr/share/man/man1/commande.1`    
    
>> **ATTENTION : cette méthode n'est pas fonctionnelle, il me faut plus de documentations**    
4.Pour installer la page dans un dossier personel:    
    
>`export MANPATH=$MANPATH:$HOME/man`    
    
5.Lancer la commande man    
    
>`man <commande>`    
    
    
## Lancer une commande au démarrage    
Il faut pour cela créer un lanceur dans le dossier `~/.config/autostart/`    
    
>Syntaxe d'un fichier `*.desktop` :    
    
        [desktop entry]    
        Name=nom_a_afficher    
        Type=Application    
        Exec=commande_a_executer    
        Icon=chemin    
        Terminal=ouvrir_ou_non_un_terminal    
    
    
>Par exemple, pour lancer un terminal au démarrage:    
    
        [desktop entry]    
        Name=Terminal    
        Type=Application    
        Exec=gnome-terminal    
        Terminal=false    
    
## Connaitre le runlevel actuel    
    
>`who -r` ou `runlevel`    
    
## Changer de runlevel    
    
>`telinit n` ou `init n`    
    
## Faire d'un script un service    
    
Les scripts des services se trouve dans le dossier `/etc/init.d/`.    
Pour qu'ils soient démarrés au démarrage ou arrêtés à l'arrêt de la machine, il faut ajouter des liens aux dossiers des runlevels : `/etc/rcN.d`, où `N` est le runlevel.    
Commande pour ajouter les liens : `update-rc.d <script> defaults`.    
Commande pour enlever les liens : `update-rc.d <script> remove`.    
Pour que la commande fonctionne, il faut ajouter quelques lignes au début du script:    
    
        ###  BEGIN INIT INFO    
        #  Provides:          nom_du_service    
        #  Required-Start:    dépendance1 dépendance2    
        #  Required-Stop:     dépendance1 dépendance2    
        #  Default-Start:     2 3 4 5    
        #  Default-Stop:      0 1 6    
        #  Short-Description: Une courte description    
        #  Description:       Une description plus détaillée du service    
        ###  END INIT INFO    
    
## Modifier le umask par défaut    
    
L'umask défini les droits lors de la création de fichiers ou de répertoires.    
Dans le fichier `.bashrc`, il faut rajouter une ligne du type `umask 0002`. Avec ce umask, un répertoire créé aura les permissions 775.    

## Configurer POSTFIX pour envoyer des mails avec Gmail  

```shell
apt-get update
apt-get install postfix mailutils libsasl2-2 ca-certificates libsasl2-modules
systemctl enable postfix
vim /etc/postfix/main.cf
    # Modification de la ligne suivante 
    relayhost = [smtp.gmail.com]:587
    # Ajout des lignes suivantes 
    smtp_sasl_auth_enable = yes
    smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
    smtp_sasl_security_options = noanonymous
    smtp_tls_CAfile = /etc/postfix/cacert.pem
    smtp_use_tls = yes
```

Il faut ensuite créer un mot de passe d'application sur Google.  

```shell
vim /etc/postfix/sasl_passwd
    [smtp.gmail.com]:587 username@gmail.com:MdpApplication
chmod 400 /etc/postfix/sasl_passwd
postmap /etc/postfix/sasl_passwd
cd /etc/ssl/certs
openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key-for-smtp-gmail.pem -out cert-for-smtp-gmail.pem
cat /etc/ssl/certs/cert-for-smtp-gmail.pem | sudo tee -a /etc/postfix/cacert.pem
/etc/init.d/postfix reload
/etc/init.d/postfix status
echo "Test mail" | mail -s "Postfix" address@example.com
```

## Installer un environnement de bureau  

```shell
sudo apt update && sudo apt upgrade -y
sudo apt install install task-gnome-desktop -y
sudo systemctl set-default graphical.target
vi /etc/pam.d/gdm-password
# Commenter la ligne suivante : 
    auth  required  pam_succeed_if.so user != root quiet_success
sudo reboot
```

## Formater un disque NTFS  

`lsblk` : Pour afficher les disques et leurs points de montage si montés  
`mkfs -t ntfs /dev/sdb1` : Formatage en NTFS  

## SETUID  

### Explication  
Permet à un utilisateur de lancer un script qui fera des actions en tant que root.  
Applicable uniquement sur un fichier, pas un dossier.  
`-rwsr-xr-x 1 root root 63960  7 févr.  2020 /usr/bin/passwd`  

### Positionnement du sticky bit
```shell
chmod 4755
# ou
chmod u+s
```

## SETGUID  

### Explication  
Sur un fichier, identique à SETUID, mais avec le groupe propriétaire.  
Si le groupe propriétaire est root, exécutera en tant que membre du groupe propriétaire.    

Sur un répertoire, définie l'appartenance à tous les fichiers et sous-dossiers d'un dossier "setguidé".  

### Positionnement du sticky bit
```shell
chmod 2755
# ou
chmod g+s
```

## Sticky bit  

### Explication  
Tout comme SETGID, le STICKY BIT peut s’appliquer aussi bien aux fichiers qu’aux répertoires.  
Lorsqu’il est positionné sur un fichier, celà permet à l’exécutable de rester en mémoire même si le programme qui l’invoque est terminé.  
Cette fonctionnalité était très utilisée sur les systèmes Unix dans les années 70 car il fallait du temps à l’époque pour charger un exécutable en mémoire et le rendre disponible à l’utilisation.  
Positionner le STICKY BIT permettait au système de garder cet exécutable en swap pour le charger plus rapidement en mémoire par la suite.
Aujourd'hui, cette méthode n’est quasiment plus utilisée.

En revance pour les répertoires il est toujours très utile.  
Postionné sur un dossier, le STICKY BIT permet d’interdire la suppression du répertoire et/ou de son contenu par quiconque n’en est pas propriétaire. L’exemple le plus parlant pour démontrer cela est le cas du répertoire /tmp. N’importe quel utilisateur du système peut créer ou supprimer des fichiers ou des dossiers dans /tmp, mais il ne pourra pas supprimer ceux créés par quelqu’un d’autre. Ceci est permis grâce au positionnement du STICKY BIT.  

### Positionnement du sticky bit
```shell
chmod 1777
# ou
chmod o+t
```
Ce qui donne :  
`drwxrwxrwt 22 root root 6548 7 févr.  2020 tmp/`  