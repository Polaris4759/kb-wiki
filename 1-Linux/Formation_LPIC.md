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
```

```shell
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


