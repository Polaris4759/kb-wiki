# VirtualBox  

## Installation des Additions invité VirtualBox  

### Windows  

Dans le menu de la machine virtuelle, "Périphériques", il faut cliquer sur "Insérer l'image CD des Additions invité".  
Exécuter `VBoxWindowsAdditions.exe` pour installer les Addition invité.  

### Linux  

Dans le menu de la machine virtuelle, "Périphériques", il faut cliquer sur "Insérer l'image CD des Additions invité".  

Dans la machine virtuel, se déplacer dans `/media/cdrom`, et faire un `ls`  
Les fichiers suivants devraient être présents :  

```shell
/media/cdrom0$ ll
total 49573
dr-xr-xr-x 2 root root      968  1 sept. 16:23 cert/
dr-xr-xr-x 2 root root     1824  1 sept. 16:23 NT3x/
dr-xr-xr-x 2 root root     2652  1 sept. 16:23 OS2/
-r--r--r-- 1 root root      763 20 févr.  2020 AUTORUN.INF
-r-xr-xr-x 1 root root     6384  1 sept. 15:43 autorun.sh*
-r-xr-xr-x 1 root root     4821  1 sept. 15:43 runasroot.sh*
-r--r--r-- 1 root root      592  1 sept. 16:23 TRANS.TBL
-r--r--r-- 1 root root  4114801  1 sept. 15:46 VBoxDarwinAdditions.pkg
-r-xr-xr-x 1 root root     3949  1 sept. 15:42 VBoxDarwinAdditionsUninstall.tool*
-r-xr-xr-x 1 root root  7566772  1 sept. 15:43 VBoxLinuxAdditions.run*
-r--r--r-- 1 root root  9559552  1 sept. 15:40 VBoxSolarisAdditions.pkg
-r-xr-xr-x 1 root root 18283432  1 sept. 16:23 VBoxWindowsAdditions-amd64.exe*
-r-xr-xr-x 1 root root   272736  1 sept. 15:45 VBoxWindowsAdditions.exe*
-r-xr-xr-x 1 root root 10940328  1 sept. 16:02 VBoxWindowsAdditions-x86.exe*
-r--r--r-- 1 root root      259  4 oct.   2021 windows11-bypass.reg
```

Si ce n'est pas le cas, faire un `lsblk`  
```shell
$ lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda      8:0    0   10G  0 disk
├─sda1   8:1    0    9G  0 part /
├─sda2   8:2    0    1K  0 part
└─sda5   8:5    0  975M  0 part [SWAP]
sr0     11:0    1 60,9M  0 rom  /media/cdrom0
```
Une ligne du type `sr0` devrait être présente.  
En fin de ligne, on retrouve son point de montage.  
S'il n'y en a pas, alors passer la commande suivante :  
`sudo mount /dev/sr0 /media/cdrom`  

A présent, les fichiers du CD-Rom devraient être présent dans `/media/cdrom`  