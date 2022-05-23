# Formation LPIC  

## Installations  

Installation d'un CentOS 7 minimal  

### Réseau  

`nmcli conn show` : Montre l'état des connexions  
`nmcli conn up enp0s3` : Active la connexion enp0s3  

Le fichier `/etc/sysconfig/network-scripts/ifcfg-enp0s3` montre les paramètres par défaut de cette connexion.  

### Ajout d'un environnement graphique  

```shell
yum update
yum install -y redhat-lsb-core net-tools epel-release kernel-headers kernel-devel
yum groupinstall -y "Development Tools"
yum groupinstall -y "X Window System" "MATE Desktop"
```

### Lancement de l'environnement de bureau  

```shell
systemctl set-default graphical.target
systemctl isolate graphical.target
```

### Lancer un DVD  

`mount` : Pour afficher les périphériques présents  
Pour lancer un exécutable sur le DVD par exemple : `/run/media/tux/VBOXADDITIONS_5.0.10_104061/VBoxLinuxAdditions.run`  

### Intro - Quelques commandes  

```shell
$ ls -l $(tty)
crw--w----. 1 stan tty 136, 0  2 mai   16:12 /dev/pts/0
# Fichier de type "c" : "caracter"  

# Liste les disques et partitions
$ lsblk
NAME            MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda               8:0    0    8G  0 disk
├─sda1            8:1    0    1G  0 part /boot
└─sda2            8:2    0    7G  0 part
  ├─centos-root 253:0    0  6,2G  0 lvm  /
  └─centos-swap 253:1    0  820M  0 lvm  [SWAP]
sr0              11:0    1 58,3M  0 rom
```

```shell
$ ls -l /dev/sda
brw-rw----. 1 root disk 8, 0  2 mai   16:03 /dev/sda
# Fichier de type "b" : "block device"
```

```shell
$ ls -l /dev/sda*
brw-rw----. 1 root disk 8, 0  2 mai   16:03 /dev/sda
brw-rw----. 1 root disk 8, 1  2 mai   16:03 /dev/sda1
brw-rw----. 1 root disk 8, 2  2 mai   16:03 /dev/sda2
$ ls -l /dev/sda?
brw-rw----. 1 root disk 8, 1  2 mai   16:03 /dev/sda1
brw-rw----. 1 root disk 8, 2  2 mai   16:03 /dev/sda2
$ ls -l /dev/sda[12]
brw-rw----. 1 root disk 8, 1  2 mai   16:03 /dev/sda1
brw-rw----. 1 root disk 8, 2  2 mai   16:03 /dev/sda2
```

```shell
$ ls -l /etc/system-release
lrwxrwxrwx. 1 root root 14  2 mai   15:17 /etc/system-release -> centos-release
# Lien symbolique

$ ls -l /etc/system-release /etc/centos-release /etc/redhat-release
-rw-r--r--. 1 root root 37 23 nov.   2020 /etc/centos-release
lrwxrwxrwx. 1 root root 14  2 mai   15:17 /etc/redhat-release -> centos-release
lrwxrwxrwx. 1 root root 14  2 mai   15:17 /etc/system-release -> centos-release
# 3 fichiers, 2 liens, un seul vrai fichier
```

```shell
$ lsb_release -d
Description:    CentOS Linux release 7.9.2009 (Core)

$ ls -l $(which lsb_release)
-rwxr-xr-x. 1 root root 15929 27 mars   2015 /usr/bin/lsb_release

$ rpm -qf /usr/bin/lsb_release
redhat-lsb-core-4.1-27.el7.centos.1.x86_64
# lsb_release fait parti du paquet redhat-lsb-...
```

```shell
$ yum list installed | grep ^kernel

kernel.x86_64                         3.10.0-1160.el7                  @anaconda
kernel.x86_64                         3.10.0-1160.62.1.el7             @updates
kernel-devel.x86_64                   3.10.0-1160.62.1.el7             @updates
kernel-headers.x86_64                 3.10.0-1160.62.1.el7             @updates
kernel-tools.x86_64                   3.10.0-1160.62.1.el7             @updates
kernel-tools-libs.x86_64              3.10.0-1160.62.1.el7             @updates
# Recherche les lignes qui commencent par 'kernel' parmis les paquets installés

$ grep 'server' /etc/ntp.conf
    # Use public servers from the pool.ntp.org project.
    server 0.centos.pool.ntp.org iburst
    server 1.centos.pool.ntp.org iburst
    server 2.centos.pool.ntp.org iburst
    server 3.centos.pool.ntp.org iburst
    #broadcast 192.168.1.255 autokey        # broadcast server
    #broadcast 224.0.1.1 autokey            # multicast server
    #manycastserver 239.255.254.254         # manycast server
# Recherche du mot 'server'

$ grep '\bserver\b' /etc/ntp.conf
    server 0.centos.pool.ntp.org iburst
    server 1.centos.pool.ntp.org iburst
    server 2.centos.pool.ntp.org iburst
    server 3.centos.pool.ntp.org iburst
    #broadcast 192.168.1.255 autokey        # broadcast server
    #broadcast 224.0.1.1 autokey            # multicast server
    #manycastserver 239.255.254.254         # manycast server
# Recherche du mot 'server' avec un séparateur avant et après (espace, début de ligne, fin de ligne)

$ cat ntp.conf | wc -l
58
$ sed '/^#/d ; /^$/d' ntp.conf | wc -l
11


$ function clean_file {
> sed -i '/^#/d;/^$/d' $1
> }
$ clean_file ntp.conf
$ cat ntp.conf | wc -l
11


```

# Les Liens  

```shell
# Hard links
$ echo "Hello" > f1
$ ls -li f1
8714040 -rw-rw-r--. 1 stan stan 6  2 mai   16:51 f1
# Le fichier créé indique un nombre de "Hard links" de 1 (Après les permissions)  

# Création d'un "Hard link" f2 de f1
$ ln f1 f2

$ ll
total 8
-rw-rw-r--. 2 stan stan 6  2 mai   16:51 f1
-rw-rw-r--. 2 stan stan 6  2 mai   16:51 f2
# Les fichiers f1 et f2 inidquent un nombre de "Hard links" de 2

$ ll -i
total 8
8714040 -rw-rw-r--. 2 stan stan 6  2 mai   16:51 f1
8714040 -rw-rw-r--. 2 stan stan 6  2 mai   16:51 f2
# Ils ont le même numéro d'inode

$ cat *
Hello
Hello
# Leurs contenus sont identiques

$ echo "World" >> f2
$ cat *
Hello
World
Hello
World
# En modifiant f2, f1 est modifié également

# Soft link ou Symbolink link
$ ln -s f1 f3
# Création d'un "Soft link" f3 de f1
$ ls -li
total 8
8714040 -rw-rw-r--. 2 stan stan 12  2 mai   16:51 f1
8714040 -rw-rw-r--. 2 stan stan 12  2 mai   16:51 f2
8505926 lrwxrwxrwx. 1 stan stan  2  2 mai   16:56 f3 -> f1
# Le nombre de "Hard links" n'ont pas changé pour f1 et f2.
# f3 affiche 1 hard link
# L'inode de f3 est différent des inodes de f1 et f2
```

# Les redirections  

`>` = `1>` : Redirige la sortie de la commande précédente sans les erreurs dans le fichier indiqué après  
`2>` : Redirige les erreurs de la commande précédente dans le fichier indiquée après  
`&>` : Redirige toute la sortie vers le fichier indiqué après  
`>>` : Ajout la sortie de la commande précédentes dans le fichier indiqué après  

## noclobber  

Evite d'écraser un fichier.  

`set -o` :  
`set -o noclobber` : Active l'option `noclobber`  
`set +o noclobber` : Désactive l'option `noclobber`  

```shell
# Avec l'option noclobber activée 
$ date > file1
$ date > file1
-bash: file1 : impossible d'écraser le fichier existant
# Pour forcer l'écriture dans le fichier
$ date >| file1
```

## Pipe nommées  

`mkfifo mypipe` : créé un fichier de type p ("pipe")  

Ce fichier est utilisable par un tty en sortie, puis par un autre en entrée.  
Une fois le mypipe utilisé sur le deuxième tty, le process utilisé sur le premier tty est terminé.  

## Archivage  

### tar  

`tar -cvf doc.tar /usr/share/doc` : Créé une archive tar  
`tar --list --file=doc.tar` : Liste les fichiers de l'archive doc.tar  
`tar -lf doc.tar` : Identique  
`tar --extract --verbose --file=doc.tar` : Extrait l'archive  
`tar -xvf doc.tar` : Identique  
`tar --extract --verbose --file=doc.tar --directory=~` : Extrait l'archive vers le dossier `~`  

Utilisation de tar pour des sauvegardes régulières :  

```shell
# Création d'un dossier de test
$ mkdir test
$ cd test
# Création de fichiers de test
$ touch file{1..3}
$ ls
file1 file2 file3
$ cd ..
# Création de l'archive d'origine
$ tar -cvf my0.tar -g my.snar test
# Modification du fichier file1
$ echo "Hi" >> test/file1
# Mise à jour de l'archive myx.tar
$ tar -cvf my1.tar -g my.snar test
# Suppression du fichier file2
$ rm test/file2
# Mise à jour de l'archive myx.tar
$ tar -cvf my2.tar -g my.snar test
# Suppression du dossier d'origine
$ rm -rf test
# Les commandes suivantes restaurent le dossier avec les modifications faites à chaque fois
$ tar -xvf my0.tar -g /dev/null # Création du dossier test avec les 3 fichiers
$ tar -xvf my1.tar -g /dev/null # Modification du fichier file1
$ tar -xvf my2.tar -g /dev/null # Suppression du fichier file2
```

## gzip  

`gzip <file>.tar` : Comprime le fichier .tar, créé un fichier .tar.gz et supprime le .tar  
`gunzip <file>.tar.gz` : Décompresse le fichier .tar.gz, créé le fichier .tar, et supprime le .tar.gz  

Faisable directement avec la commande `tar` :  
`tar -cvzf <file>.tar.gz <file1> <file2> ...` : Création de l'archive  
`tar -xvzf <file>.tar.gz <file1> <file2> ...` : Extraction de l'archive  

## bzip2  

`bzip2 <file>.tar` : Comme `gzip`, mais comprime davantage  
`bunzip2 <file>.tar.bz2` : Comme `gunzip`, pour les fichiers .tar.bz2  

Faisable directement avec la commande `tar` :  
`tar -cvjf <file>.tar.bz2 <file1> <file2> ...` : Création de l'archive  
`tar -xvjf <file>.tar.bz2 <file1> <file2> ...` : Extraction de l'archive  

## cpio  

```shell
#Création d'une archive cpio
find . | cpio -o > /tmp/archive.cpio
#Extraction de l'archive (-i) en créant les dossiers requis dans l'archive (-d)
cpio -id < /tmp/archive.cpio
```

## dd (Disk duplicator)  

Après avoir monté un disque :  

```shell
#dd : Disk duplicator
#if : input file
#of : output file
dd if=/dev/sr0 of=netinstall.iso
#Créé un fichier img avec l'intégralité de la partition bootable
dd if=/dev/sda1 of=boot.img
#Faire un wipe de la machine 
##Faire une sauvegarde
dd if=/dev/sda of=sda.mbr count=1 bs=512
##Wipe de la partition
dd if=/dev/zero of=/dev/sda count=1 bs=512
##Restauration
dd if=sda.mbr of=/dev/sda
```

## Copier un dvd vers un fichier iso  

```shell
dd if=/dev/sr0 of=output.iso
# if : Input
# /dev/sr0 : Correspond au lecteur de disque 
# of : Output
```

## Copier une partition vers un fichier img
```shell
sudo dd if=/dev/sda1 of=boot.img
# if : Input
# of : Output
```

## Copier un disque vers un fichier img

Copie d'un seul bloc de 512 bytes pour l'exemple
```shell
dd if=/dev/sda of=sda.mbr count=1 bs=512
# if : Input
# of : Output
# count : 1 block
# bs : Block-size 512 bytes
```

## Effacer un disque    
```shell
dd if=/dev/zero of=/dev/sda count=1 bs=512
# if : Input
# of : Output
# count : 1 block
# bs : Block-size 512 bytes
```

Un `fdisk -l` n'affiche plus les partitions sda1 et sda2

## Restaurer un disque    
```shell
dd if=sda.mbr of=/dev/sda
# if : Input
# of : Output
```

Un `fdisk -l` affiche à nouveau les partitions sda1 et sda2

## Sudo  

### Autorisation de commandes à un groupe d'utilisateurs  

Il est possible de créer un groupe d'utilisateurs, qui pourront utiliser un ensemble de commandes spécifiques, en modifiant le sudoers.  

Par exemple, dans le sudoers :  

```shell
#Création d'un groupe d'utilisateur HELPDESK
User_Alias HELPDESK = joe, sally
#Création d'un groupe de commandes HELPCOMMANDS
Cmnd_Alias HELPCOMMANDS = /usr/sbin/useradd, /usr/bin/passwd
#Autorisation au groupe HELPDESK de passer les commandes dans HELPCOMMANDS en tant que root
HELPDESK ALL=(root) HELPCOMMANDS
```

### Timeout du mot de passe sudo en mémoire  

Dans le sudoers, en ajoutant la ligne suivante, il est possible de modifier le temps durant lequel les utilisateurs n'ont pas besoin de remettre leur mot de passe pour passer une commande avec sudo :  

```shell
#Ne mémorise pas le mot de passe
Defaults timestamp_timeout=0
#Mémorise le mot de passe pendant 30 minutes
Defaults timestamp_timeout=30
```

### Lister les paramétrages sudo  

```shell
#Afficher les paramètres de sudo
sudo sudo -V
```

## ssh  

### Création d'alias  

```shell
vi ~.ssh/config
#Ajouter les lignes suivantes : 
Host server1
  HostName 192.168.1.50
  User root
  Port 22

Host server2
  HostName 192.168.1.51
  User root
```

### Utilisation de clé d'authentification  

```shell
#Création de la clé
ssh-keygen -t rsa
#En faisant un `ls ~.ssh`, on voit les fichiers id_rsa et id_rsa.pub
#Le fichier id_rsa.pub doit être transmit au serveur cible
ssh-copy-id -i id_rsa.pub server1
ssh-agent bash
ssh-add
```

Pour sécuriser cette connexion, il est possible de mofifier le fichier `/etc/ssh/ssh_config`, et modifier la ligne `PermitRootLogin yes` en `PermitRootLogin without-password`. Ceci autorisera uniquement les connexions avec la clé publique déjà partagée.  

## Commande script  

Permet d'enregistrer les commandes et leur sortie dans un fichier.  

```shell
#Début de l'enregistrement dans le fichier typescript
script
[...]
exit
#Fin de l'enregistrement dans le fichier typescript

#Afficher les commandes passées et leurs retours
cat typescript
```

Permet également de le mettre dans un autre fichier, que quelqu'un d'autre peut afficher en direct.  

```shell
#Terminal 1
script -f /tmp/mypipe
ls
#Terminal 2
cat /tmp/mypipe
  #Les commandes passées sur le terminal 1 s'affiche aussi sur le terminal 2
#Terminal 1
exit
#Stoppe l'enregistrement, et rend la main au terminal 2
```

## Commande screen  

Nécessite d'être installé au préalable.  
`yum install -y screen`  

`screen` : Ouvre un nouveau terminal  

Fichier de configuration à la base du home : `.screenrc`  

Exemple de contenu du fichier `.screenrc`  
```shell
screen -t master 0 bash
screen -t s1 1 ssh server1
screen -t s2 2 ssh server2
```

En lançant `screen`, le fichier `.screenrc` est lu, et les différentes sessions s'ouvrent.  
Commandes en `screen` : 
- `Ctrl+a n` : Terminal suivant (next)  
- `Ctrl+a p` : Terminal précédent (previous)  
- `Ctrl+a "` : Liste les terminaux ouverts    
- `Ctrl+a :` : Ouvre un prompt (Comme sur vi)  

Une fois la commande `screen`, `Ctrl+a :` pour ouvrir le prompt.  
Il est possible d'envoyer des commandes de façon simultanée à tous les terminaux avec la commande suivante :  
`:at "#" stuff "<commande>^M"` (^M = Ctrl+M = Retour à la ligne)  

## Le prompt (PS1)  

### Ajouter le nom long dans le PS1  

```shell
sudo vim /etc/bashrc
#Remplacer le \W par un \w
```

## Gestion utilisateurs  

### Template par défaut  

`/etc/skel`  

### Commande id  

La commande id montre les informations d'un utilisateur.  

`id` : Montre les informations de l'utilisateur courant.  
`id <user>` : Montre les informations de l'utilisateur <user>.  
`id -g` : Montre le groupe primaire de l'utilisateur courant.  
`id -G` : Montre les groupes de l'utilisateur courant (ID de groupes).  
`id -Gn` : Montre les groupes de l'utilsateur courant (Noms de groupes).  

### Création utilisateur locale  

```shell
sudo useradd -m user1
# -m pour ajouter un dossier user1 dans le /home - Actif par défaut, inutile de l'ajouter
```

```shell
sudo useradd user2 -N user2 -g users -G adm -s /bin/sh
# -N pour no-user-group
# -g pour Primary Group ID
# -G pour Secondary Group
# -s pour spécifier le shell
```

### Gestion des mots de passe  

`sudo passwd user1` : Permet de modifier le mot de passe de user1.  
`echo 'user2:Password2' | sudo chpasswd` : Permet de modifier le mot de passe de user2.  
`echo Password3 | sudo passwd user3 --stdin` : Permet de modifier le mot de passe de user3.  

`/etc/shadow` : Fichier contenant les mots de passe  

`chage -l user1` : Affiche les informations de date conernant le mot de passe de l'utilisateur user1  

Par défaut, `/etc/passwd` affiche un `x` dans la deuxième colonne des utilisateurs lorsque leur mot de passe est stocké dans le fichier `/etc/shadow`.  
Pour afficher le mot de passe dans `/etc/passwd`, il suffit de passer la commande `sudo pwunconv`.  
Pour remettre l'affichage par défaut, `sudo pwconv`.  

`sudo chage -M 40 user1` : Change la durée en jour entre chaque changement de mot de passe  

`sudo passwd -l user1` : Vérouille le mot de passe de user1  
`sudo passwd -u user1` : Dévérouille le mot de passe de user1  

### Paramètres par défaut des utilisateurs  

`/etc/login.defs` : Fichier contenant les paramétrages par défaut  

`sudo useradd -D` : Affiche des paramètres par défaut  
`sudo useradd -Ds` : -s pour shell. Permet de définir le shell par défaut.  

Ces paramétrages sont stockés dans `/etc/default/useradd`  

### Modification sur un compte utilisateur  

`sudo usermod -c "User One" user1` : Modifie le commentaire pour l'utilisateur user1 (Visible dans le fichier `/etc/passwd` par exemple )  

`sudo chsh -s /bin/sh user1` : Change le shell pour user1 en Bourne Shell  
`sudo usermod -s /bin/bash user1` : Change le shell pour user1 en Bourne Again Shell  

### Suppression d'un compte utilisateur  

`sudo userdel -r user1` : Supprime le compte. `-r` pour supprimer le home directory  

Sans le `-r`, le compte est supprimé, mais tous les fichiers/dossiers appartenant à l'utilisateur sont toujours là.  
On peut passer la commande suivante pour supprimer son home :   
`sudo find /home -uid 1002 -delete`  

### Changement de groupe  

`newgrp` : Permet de permuter le groupe principal d'un utilisateur. En faisant un `exit`, on repasse sur le groupe principal par défaut.  

### Gestion d'un groupe  

`groupadd` : Ajouter un groupe  
`groupmod` : Modifier un groupe  
`groupdel` : Supprimer un groupe  

`usermod -G <groupes_secondaires>` : Remplace les groupes secondaires (ajouter tous les groupes, séparé par une virgule)  

`gpasswd -a <user> <groupe>` : Ajoute l'utilisateur <user> à <groupe>  
`gpasswd -M <user1>,<user2> <groupes>` : Ajoute les utilisateurs <user1> et <user2> à <groupe>  

`chgrp -R <groupe> <path>` : Donne la propriété de <path> au groupe <groupe>  

`chmod g+s <path>` : En ajoutant le stickybit au group propriétaire du répertoire <path>, tout ce qui est créé dedans appartient au groupe de <path>, et non pas au groupe de l'utilisateur à l'origine de la création.  

`sudo gpasswd <groupe>` : Créé un mot de passe pour le groupe <groupe>  

### Utiliser PAM pour contrôler les accès utilisateur  

`/etc/pam.d` : Fichiers de configuration de PAM  
`/lib64/security` : Modules de PAM  
`/etc/security` : Fichier de configuration des modules  

#### Créer un home directory automatiquement  

Modifier le fichier `/etc/login.defs` pour ne pas créer le home directory à la création (Activé par défaut).  

Vérifier que les modules nécessaires soit présents : `rpm -qa | grep oddjob`
Si non, les installer `yum install -y oddjob oddjob-mkhomedir`  

Activer le service : `systemctl enable oddjobd`  
Démarrer le service : `systemctl start oddjobd`  

`sudo authconfig --enablemkhomedir --update` : Activer la création des home   

#### Règles de mots de passe  

`/etc/pam.d/system-auth` : Fichier de configuration pour l'authentification  
`/etc/security/pwquality.conf` : Fichier de configuration pour les règles de mots de passe  

`pwscore` : Permet de tester la conformité d'un mot de passe (Score de 0 à 100)  

#### Limitation d'utilisation de ressource  

`ulimit -u` : Défini la limite de process lancé par un utilisateur  
`ulimit -u 10` : Limite à 10 process  

`/etc/security/limits.conf` : Fichier de configuration concernant les limitations de ressources  

#### Limitation d'horaire de connexions  


