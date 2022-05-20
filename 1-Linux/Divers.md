#  Divers    
    
## Fichiers de configuration    
    
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
    
## Raccourcis    
    
>**Affichage**    
    
>>`Ctrl-l` : Effacer l'écran    
    
>**Déplacements**    
    
>>`Ctrl-a` : Début de ligne    
>>`Ctrl-e` : Fin de ligne    
>>`Alt-b` : Début du mot    
    
>**Copier/couper/coller**    
    
>>`Ctrl-u` : couper du curseur jusqu'au début de la ligne    
>>`Ctrl-k` : couper du curseur jusqu'à la fin de la ligne    
>>`Ctrl-y` : coller    
    
>**Commandes**    
    
>>`flèche <haut>` : commandes précédentes    
>>`Ctrl-r` : rechercher la dernière commande contenant une chaîne    
>>`Ctrl-r`, puis `Ctrl-r` pour remonter dans la recherche    
    
>**Changement de casse**    
    
>>`Alt-u` : Majuscule de la lettre sous le curseur, jusqu'à la fin du mot    
>>`Alt-l` : Minuscule de la lettre sous le curseur, jusqu'à la fin du mot    
>>`Alt-c` : Majuscule de la lettre sous le curseur, puis minuscule jusqu'à la fin du mot    
    
>**Onglets**    
    
>>`Ctrl-Shift-t` : Nouvel onglet    
>>`Ctrl-<page suivante>` : Onglet suivant    
>>`Ctrl-Shift-<page suivante>` : Déplacer l'onglet courant    
>>`Ctrl-Shift-w` : Fermet l'onglet courant    
    
>**Divers**    
    
>>`Ctrl-d` : quitter la session, quitter le terminal si une seule session ouverte    
    
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
    


    
## Fun commands    
    
Avec un `apt install` :    
  
>`cmatrix`    
`cowsay`    
`oneko`    
`sl`    
`fortune`      
`xeyes`      
`espeak`      
`aview`      
`figlet`      
    
>`telnet towel.blinkenlights.nl`    
    
Installation via script :    
    
### Aquarium    
Script : [Aquarium](../SH/asciiquarium.tar.gz)      
    
>*Les commandes :*    
  
```console    
apt install libcurses-perl    
cd /tmp    
wget http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/Term-Animation-2.4.tar.gz    
tar zxvf Term-Animation*    
cd $_    
perl Makefile.PL && make && make test    
make install    
cd /tmp    
wget http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz    
tar zxvf asciiquarium*    
cd $_    
sudo cp asciiquarium /usr/local/bin    
sudo chmod 0755 /usr/local/bin/asciiquarium    
```    
    
### Funny Man Pages    
Script [funny-manpages](../SH/funnymanpages.tar.gz)      
    
>*Les commandes :*    
  
```console    
cd /tmp    
wget https://github.com/ltworf/funny-manpages/archive/refs/heads/master.zip    
unzip master.zip    
cd funny-manpages-master    
make install    
```    
    
## Racourcis clavier    
    
>`Ctrl-Alt-t` : ouvrir un terminal    
`Ctrl-Alt-<gauche>` ou `Ctrl-Alt-<droite>` : Changer d'espace de travail    
`Ctrl-Alt-Shift-<gauche>` ou `Ctrl-Alt-<droite>` : Changer la fenêtre courante d'espace de travail    
`Host-d` : Afficher le bureau. Rappuyer pour afficher les fenêtres à nouveau    
`Host-e` : Ouvrir l'explorateur par défaut.    
`Ctrl-Alt-fn` : Bascule en tty, de 1 à 6, le 7 correspond au mode graphique.    
`Ctrl-Alt-t` : Ouvrir un nouveau terminal    
    
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
