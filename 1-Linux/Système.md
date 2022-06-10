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
