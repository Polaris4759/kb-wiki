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


# dd 

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
