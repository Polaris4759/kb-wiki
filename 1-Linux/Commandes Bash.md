# Variables spéciales et autres astuces  
  
## $?  
  
`$?` est une variable dans laquelle est stocké le code erreur de la commande précédemment exécutée.  
  
## $_  
  
`$_` est une variable contenant le dernier argument passé à la commande lors de la commande précédente  
  
#### Exemple :  
  
`mkdir dossier && cd $_` : crée le répertoire "dossier" et s'y déplace  
  
Ou encore, pour comprendre la différence avec la commande `!$` ci-dessous :  
  
```shell  
$ echo "hello" > /tmp/a.txt  
$ echo $_  
hello  
# "hello" est le dernier argument passé à la commande "echo"  
```  
  
## !$  
  
`!$` est une variable contenant le dernier paramètre de la commande précédente, en prenant la ligne dans son ensemble  
  
Exemple :  
  
```shell  
$ echo "hello" > /tmp/a.txt  
$ echo "!$"  
echo "/tmp/a.txt"  
/tmp/a.txt  
```  
  
## !x  
  
`!x` : "x" étant une lettre. Le shell va chercher la dernière commande commençant par "x" et lancer la commande  
  
## !n  
  
`!n` : "n" étant le numéro de la commande d'après l'inventaire présent dans `history`  
  
## !!  
  
`!!` : Représente la dernière commande passée  
  
## Utiliser la substitution de variable  
  
```shell  
$ bash -c 'echo $1' _ test  
test  
```  
  
## Modifier une partie de la dernière commande  
  
`^ancien_texte^nouveau_texte`  
  
## Modification d'une variable  
  
### Modifier une variable en suivant un pattern  
  
En utilisant sed :  
  
`var=$(sed 's/pattern/chaine_de_remplacement/g' <<< $var)`  
  
*Ou aussi*  
  
```shell  
var=<chaine>  
echo ${var/pattern/chaine_de_remplacement}  
  ou  
echo ${var//pattern/chaine_de_remplacement}  
  '//' permet de remplacer toutes les occurrences  
```  
  
### Supprimer les x premiers caractères d'une variable  
  
`var=${var:x}`  
  *où __x__ correspond au nombre de caractères à supprimer*  
  
### Changer la casse d'une variable  
  
`var=${var,,}` : Variable en minuscule  
`var=${var@l}` : Variable en minuscule  
`var=${var^}`  : 1ère lettre de la variable en majuscule  
`var=${var@u}`  : 1ère lettre de la variable en majuscule  
`var=${var^^}` : Variable en majuscule  
`var=${var@U}` : Variable en majuscule  
  
Exemples :  
  
```shell  
$ VAR1="riri"  
$ VAR2="FiFi"  
$ echo ${VAR1^} #echo ${VAR1@u}  
Riri  
$ echo ${VAR1^^} #echo ${VAR1@U}  
RIRI  
$ echo ${VAR2,}  
fiFi  
$ echo ${VAR2,,} #echo ${VAR1@L}  
fifi  
$ echo ${VAR2,F} #(1ère lettre en minuscule si F majuscule)  
fiFi  
$ echo ${VAR2,R}  
FiFi  
```  
  
### Obtenir X caractères à partir du Nième caractère  
  
`var=${var:N:X}`  
  
### Supprimer une chaine de caractère dans la variable  
  
Pour supprimer des caractères, en partant du début, jusqu'à la première occurrence :  
`${var#pattern}`  
Pour supprimer des caractères, en partant du début, jusqu'à la fin de la variable :  
`${var##pattern}`  
Pour supprimer des caractères, en partant de la fin, jusqu'à la première occurrence :  
`${var%pattern}`  
Pour supprimer des caractères, en partant du début, jusqu'à la fin de la variable :  
`${var%%pattern}`  
  
```  
$ test=$(grep polaris4759 /etc/passwd | awk -F: '{print $6";"$7}')  
$ echo $test  
/home/polaris4759;/bin/bash  
$ echo ${test%;*}  
  (Tout ce qui est présent après le ";")  
/home/polaris4759  
$ echo ${test#*;}  
  (Tout ce qui est présent avant le ";")  
/bin/bash  
```  
  
Autre exemple :  
  
```shell  
$ pwd  
/tmp/dir1/dir2/dir3  
$ CurDir=$(pwd)  
$ echo ${CurDir}  
/tmp/dir1/dir2/dir3  
$ echo ${CurDir#/tmp/dir1/dir2/}  
dir3  
$ echo ${CurDir#*/}  
tmp/dir1/dir2/dir3  
  (Le retrait des caractères se fait jusqu'à la première occurrence)  
  
$ echo ${CurDir##*/}  
dir3  
  (Le retrait des caractères se fait jusqu'à la dernière occurrence)  
```  
  
Ou encore :  
(Renommer tous les fichiers .sh en .bash dans un dossier)  
  
```shell  
for f in /scripts  
do  
	mv "$s" "${s%.sh}.bash"  
done  
```  
  
### Récupérer le nom ou l'extension d'un fichier dans une variable  
  
Par conséquent, suivant le point précédent, il est possible de récupérer le nom ou l'extension d'un fichier  
  
`${fichier%.*}` : Représente le nom  
`${fichier##*.}` : Représente l'extension  
  
Exemple :  
```  
$ echo ${fic}  
/home/polaris4759/prometheus/prometheus.yml  
$ echo ${fic%.*}  
/home/polaris4759/prometheus/prometheus  
$ echo ${fic##*.}  
yml  
```  
  
### Utiliser une valeur par défaut pour une variable  
  
```shell  
var=${parameter:-defaultValue}  
```  
  
Par exemple, dans un script, définir des valeurs par défaut si elles ne sont pas spécifiées en paramètres :  
  
```shell  
#!/bin/bash  
WorkDir="${1:-/tmp}"  
echo "Setting users directories as ${UserDir}"  
# rest of the script ...  
```  
Exemple d'exécution du script :  
```shell  
./script.sh /home/<user>/work  	# <--- set work directory as /home/<user>/work  
./script.sh /tmp/WorkDir		# <--- set work directory as /tmp/WorkDir  
./script.sh                    	# <--- set work directory as /tmp (default)  
```  
  
### Utiliser une valeur si la variable est vide  
  
```shell  
$ unset test  
$ echo $test  
  
$ echo ${test:=toto}  
toto  
$ echo $test  
toto  
```  
  
*Ne fonctionne pas avec les variables de positions des paramètres d'un script*  
  
### Utiliser un message d'erreur si variable non définie ou vide  
  
```shell  
$ unset test  
$ echo ${test?Erreur : variable non définie}  
bash: test: Erreur : variable non définie  
$ echo ${test:?Erreur : variable non définie ou vide}  
bash: test: Erreur : variable non définie ou vide  
  
$ ErrMess="Erreur. Variable non définie ou vide"  
$ echo ${test:?${ErrMess}}  
bash: test: Erreur. Variable non définie ou vide  
```  
  
### Lister les variables dont les noms répondent à un pattern  
  
```shell  
$ VAR1="riri"  
$ VAR2="fifi"  
$ VAR3="loulou"  
$ echo "${!VAR*}"  
VAR1 VAR2 VAR3  
$ echo "${!VAR@}"  
VAR1 VAR2 VAR3  
```  
  
# Gestion des utilisateurs  
  
## Utilisateurs et groupes  
  
Afficher les groupes  
  
`cat /etc/group | awk -F: '{print $1}'`  
  
Afficher les groupes auxquels appartient un utilisateur  
  
`groups <utilisateurs>`  
  
Afficher les utilisateurs  
  
`cat /etc/passwd | awk -F: '{print $1}'`  
  
Afficher les utilisateurs appartenant à un groupe  
  
`grep <groupe> /etc/group`  
  
# Commandes courantes et leurs syntaxes  
  
## addgroup  
  
Ajouter un groupe  
  
`addgroup <groupe>`  
  
## adduser  
  
Ajouter un utilisateur  
  
`adduser <utilisateur>`  
  
Ajouter un utilisateur à un groupe  
  
`adduser <utilisateur> <groupe>`  
  
## apropos  
  
Permet de chercher des commandes lié à un mot clé  
  
`apropos <mot clé>`  
  
## apt  
  
Gestionnaire d'installation de paquets  
  
`apt install <paquet>` : Installer  
`apt remove <paquet>` : Désinstaller  
`apt autoremove <paquet>` : Désinstaller  
`apt-file search <fichier>` : Chercher à quel paquet appartient un fichier  
`apt-cache search <paquet>` : Chercher un paquet dans le repo  
  
## blkid  
  
Liste les UUID, Label et Type de chaque partition montée  
  
`blkid`  
  
## cal  
  
Affiche un calendrier  
  
`cal 07 1988` : Affiche le mois de juillet 1988  
  
`cal -3` : Ressort 3 mois (1 avant, mois actuel, 1 après)  
## chgrp  
  
Changer le groupe propriétaire  
  
`chgrp <groupe> <fichier>`  
  
## chmod  
  
Changer les permissions  
  
`chmod <droits> <fichier>`  
  
<u>**Attention**</u>  
  
`755 (= rwxrw-rw-)` : Donne les droits d'écriture et de lecture à tout le monde, d'exécution au propriétaire  
`777 (= rwxrwxrwx)` : Donne tous les droits à tout le monde  
`a+x` : Ajoute l'exécution à tout le monde  
`g+w` : Donne les droits d'écriture au groupe propriétaire  
  
## chown  
  
Changer le propriétaire d'un fichier  
  
`chown <utilisateur> <fichier>`  
  
Changement de façon récursive (sous-dossier)  
  
`chown -R <utilisateur>:<groupe> <fichier>`  
  
## cp  
  
La commande `cp` permet de copier un fichier vers une destination. Il est possible de le copier en modifiant le nom du nouveau fichier.  
  
`cp <fichier_source> <fichier_cible>`  
  
En combinant les commandes `ls`, `xargs`, et `cp`, il est possible de copier une série de fichiers en modifiant le nom de chacun, pour inclure un timestamp par exemple.  
  
`ls <motif> | xargs -J % cp % <répertoire_cible>/%<motif_fichiers_cibles>`  
  
*exemple*  
  
`ls *.sh | xargs -I % cp % save/%_$(date "+%Y.%m.%d-%H.%M")`  
  
## cpio  
  
`find -name '*.pdf' | cpio -o > /tmp/pdf.cpio` : Créé une archive .cpio  
`cpio -id < /tmp/pdf.cpio` : Extrait l'archive  
  
```shell  
cpio -id < <fichier>.cpio  
# -i input  
# -d créé les dossiers indiqués dans l'archive  
```  
  
## cut  
  
Découpe une ligne par exemple  
  
Exemple :  
```shell  
$ cut -d: -f7 /etc/passwd | sort -u  
/bin/bash  
/bin/false  
/bin/sync  
/sbin/halt  
/sbin/nologin  
/sbin/shutdown  
  
# -d : Délimiteur. Ici ":"  
# -f : Field, le champ à afficher. Ici, la 7ème colonne.  
```  
  
## date  
  
La commande `date` renvoie la date courante.  
  
```console  
$ date  
Sun Mar 15 09:44:49 CET 2020  
```  
  
On peut mettre en forme la date avec des options.  
*Par exemple :*  
  
```shell  
$ date "+%d/%m/%Y %Hh%M"  
15/03/2020 09h46  
```  
  
On peut récupérer la date de dernière modification d'un fichier avec l'option `-r`.  
  
```shell  
$ date -r "Commandes Bash.md"  
jeu. 10 févr. 2022 22:40:48 CET  
```  
  
date --date "40 days" : indique la date qu'il sera dans 40 jours  
date --date "40 days ago" : indique la date qu'il était il y a 40 jours  
  
## dpkg  
  
Installer un paquet .deb  
  
`dpkg -i <paquet>`  
  
Vérifier si un paquet est installé  
  
```console  
dpkg-query -l <paquet>  
apt-cache showpkg <paquet>  
```  
  
L'option `-L` liste les fichiers d'un `<paquet>`.  
  
`dpkg-query -L <paquet>`  
  
## du  
  
Afficher la taille d'un dossier  
  
`du` : Donne la taille du dossier courant  
  
L'option `-h` affiche les tailles d'une façon humainement lisible  
L'option `-s` permet de spécifier le nom d'un fichier  
  
`du -sh <dossier>`  
  
Afficher la taille totale d'un ensemble de fichier (en fonction d'un motif de recherche)  
  
`du -csh <motif>`  
  
## file  
  
Affiche le type d'un fichier  
  
```console  
file /tmp  
/tmp: sticky, directory  
```  
  
## find  
  
Chercher un fichier  
  
`find <chemin> -name <fichier> -perm <permision>`  
  
### Options possibles :  
  
`!` : Pour la négation *(ex : ! -user root)*  
`-a` : Pour "et"  
`-o` : Pour "ou" *(ex : find . \( -name '*.avi' -o -name '*.mp4' \) pour les fichiers se terminant par avi ou mp4)*  
  
`-name` : Nom de fichier _ex : `-name` "\*.mp4"_  
`-perm` : Niveau de permission *(ex : 755 ou -655 pour au minimum 655)*  
`-user` : Utilisateur  
`-group` : Groupe  
`-maxdepth x` : Profondeur maximum  
`-mindepth x` : Profondeur minimum  
`-type` : Type de fichier **(Fichier, dossier, etc...)**  
  
`-f` : Fichier  
`-d` : Répertoire  
`-l` : Lien symbolique  
  
`-size` : Taille  
  
`+` : Pour supérieur  
`-` : Pour inférieur  
` ` : Rien pour égale  
`c` : Pour Octet  
`k` : Pour KiloOctet  
`M` : Pour MégaOctet  
`G` : Pour GigaOctet  
  
`-atime` : Dernière date d'accès  
`-ctime` : Dernière date de modification du fichier ou des ses attributs  
`-mtime` : Dernière date de modification du contenu du fichier  
`-amin` : Dernière date d'accès en minutes  
`-cmin` : Dernière date de modification du fichier en minutes  
`-mmin` : Dernière date de modification du contenu du fichier en minutes  
`-daytime` : Pour rechercher à partir du début du jour spécifié  
`-newer` : Pour comparer à un autre fichier|  
  
`+` : Pour supérieur  
`-` : Pour inférieur  
` ` : Rien pour égale  
  
> *ex : `find . -mtime +60` affiche les fichiers modifier il y à plus de 60 jours*  
> *ex : `find . -mtime 1 -daytime` retourne les fichiers modifier la veille (Et non pas il y a 24h)*|  
> *ex : `find /tmp -newer /tmp/foo`*  
  
`printf` : Pour spécifier ce qu'il faut afficher  
  
`s` : Taille de fichier en octet  
`p` : Nom de fichier avec le chemin relatif "./\*"  
`P` : Nom de fichier sans le chemin relatif sans le "./\*"  
`f` : Nom de fichier  
`d` : Profondeur du fichier dans l'arborescence  
`g` : Groupe propriétaire  
`u` : Utilisateur propriétaire  
`G` : G-ID du groupe propriétaire  
`U` : U-ID de l'utilisateur propriétaire  
`m` : Permissions format binaire  
`M` : Permissions format lettres  
`Y` : Type de fichier  
`h` : Répertoire contenant le fichier  
`l` : Chemin fichier de destination du lien  
`t` : Date de dernière modification  
`a` : Date de dernier accès  
`Ax` : Date de dernier accès, avec "x" pouvant prendre les valeurs ci-dessous  
`Cx` : Date de dernier changement, avec "x" pouvant prendre les valeurs ci-dessous  
`Tx` : Date de dernière modification, avec "x" pouvant prendre les valeurs ci-dessous  
  
`H` : Heure (00..23)  
`I` : Heure (01..12)  
`k` : Heure (0..23)  
`l` : Heure (1..12)  
`M` : Minute  
`p` : AM ou PM  
`r` : Heure complète, AM ou PM  
`S` : Seconde  
`%.2TS` : Seconde, limité à 2 digits  
`T` : Heure complète, 24H  
`Z` : Fuseau horaire  
`b` : Mois abrégé  
`B` : Mois entier  
`c` : Date et heure  
`d` : Jour du mois  
`D` : Date (mm/jj/aaaa)  
`j` : Jour de l'année  
`m` : Mois (1..12)  
`W` : Numéro de semaine  
`x` : Date, représentation locale  
`y` : Année "aa"  
`Y` : Année "aaaa"  
  
> *Exemple :*  
> `find /var/log -type f -name "*fichier*" -perm 755 -exec grep -iHn libpng {} \; 2> /dev/null`  
>  
> `find` : trouve  
> `/var/log` : où?  
> `-type f` : un fichier de type fichier  
> `-name "*fichier*"` : un fichier contenant la chaine "fichier"  
> `-perm 755` : un fichier ayant les permissions 755  
> `-exec` : exécute  
> `-iHn` : Non sensible à la casse, affiche le nom du fichier, et la ligne  
> `libpng` : chaîne à rechercher  
> `{}` : sur chaque fichier correspondant au `find`  
> `\;` : fin de la commande find (obligatoire avec `-exec`)  
> `2>` : envoie les erreurs dans  
> `/dev/null` : le néant  
  
## fsck  
  
Outil de contrôle d'intégrité et de réparation  
  
`fsck <partition>` : Réparer le système de fichier  
`fsck -y <partition>` : Répond "Oui" à toutes les questions  
  
## fuser  
  
`fuser -cu <path>` : Chercher les process utilisant le path  
`fuser 80/tcp` : Chercher les process utilisant le port 80  
  
## gcc  
  
Compiler des sources en C  
  
`gcc -Wall <sources> -o <sortie>`  
`-Wall` : Active certaines alertes  
`-o` : fichier de sortie  
  
## grep  
  
Recherche un motif dans un fichier  
  
`grep <motif> <fichier>`  
  
Recherche de plusieurs motifs dans un fichier  
  
`grep -E "<motif1>|<motif2>" <fichier>`  
  
## groff  
  
Permet de mettre au format une page de manuel  
  
`groff -Tascii -man page.man | less`  
`-Tascii` : Précise que le format doit être de type ASCII  
`-Tps` : Précise que le format doit être de type PostScript  
  
## groups  
  
Afficher les groupes d'un utilisateur  
  
`groups <utilisateur>`  
  
## ip  
  
Informations réseau  
  
`ip a` : Afficher toutes les informations  
`ip addr` : Afficher toutes les informations  
`ip -4 addr` : Afficher les adresses en IPv4 uniquement  
`ip -6 addr` : Afficher les adresses en IPv6 uniquement    
`ip route` : Afficher la table de routage  
  
## less  
  
`↑ ↓` : Déplacer par ligne  
`ESPACE` : Descendre d’une page  
`Nj` : Descendre de N lignes  
`Nk` : Remonter de N lignes  
`b` : Monter d’une page  
`g` : ou <	Aller à la première ligne  
`G` : ou >	Aller à la dernière ligne  
`Ng` : Allez à la ligne N dans le fichier  
`Np` : Allez à la N pourcentage du fichier dans le fichier  
`Ng` : Aller à la Ne ligne  
`/`motif : Chercher le motif à partir de la position  
`?`motif : Chercher le motif à avant de la position  
`n` : Répétez la recherche précédente  
`N` : Répétez la recherche précédente dans la direction inverse  
`v` : Transfère le fichier vers l’éditeur par défaut  
`q` : Quitter le journal  
  
## locate  
  
Rechercher un fichier  
  
`locate <fichier>`  
  
**Avantage :** *Rapide*  
**Inconvénient :** *Ne trouve que ce qui a été indéxe. Pour forcer l'indéxation avec `updatedb`*  
  
## ls  
  
Permet de lister le contenu d'un dossier  
  
`-R` : affiche les fichiers du répertoire courant et de ses sous-répertoires  
`-i` : affiche les numéros d'inode  
`-t` : tri l'affichage chronoliguement  
`-r` : inverse le tri  
  
## lsof  
  
`lsof -i :80` : Affiche les process utilisant le port 80  
  
## man  
  
Manuel de commandes  
  
`man <commande>` : Afficher le manuel  
`<# > <commande>` : Afficher la page # de la commande <commande>  
  
## man 7glob  
  
## mount  
  
Action sur les partitions  
  
`mount`: Liste les points de montage, et comment ils on été montés  
`mount /dev/sda1 /mnt/disque_dur` : Monte la partition `sda1` dans un dossier "disque dur"  
`mount -t ntfs-3g /dev/sdb1 /opt/disque_dur/` : Monte une partition NTFS *(Il faut avoir `ntfs-3g` d'installer)*  
`/dev/disk/by-label/<partition>` : Monte une partition avec son nom  
`mount -t drvfs D: /mnt/d` : Monte un disque en spécifiant un système de fichier  
`mount | grep <parition>` : Indique si une partition est montée  
  
> *On peut également le voir avec df*  
> *On peut monter un périphérique dans n'importe quel dossier, peut importe de quelle partition il fait parti*  
> ***Si on monte un périphérique dans le dossier /media, il apparaîtra dans l'explorateur de fichier***  
  
Pour monter automatiquement au démarrage :  
  
```shell  
# Récuperer l'UUID  
sudo blkid  
# Modifier le fichier fstab  
sudo vi /etc/fstab  
# Ajouter la ligne (Partition ntfs)  
<partition> <point de montage> <type> <attributs>  
/dev/sdb1 /mnt/ntfs/ ntfs nls-utf8,umask-0222,uid-1000,gid-1000,ro 0 0  
# Tester avec  
sudo mount -a  
cd /mnt/ntfs  
```  
  
## namei  
  
Donne (entre autre) des infos sur le 1er bit des 10 bits en sortie de `ls -l`  
  
## netstat  
  
`netstat -lntp | grep -w ':80'` : Voir les process utilisé par le port 80  
  
## passwd  
  
`passwd <utilisateur>` : Changer le mot de passe d'un utilisateur  
  
## printf  

Permet d'afficher du contenu sur le terminal, comme un `echo`.  
La différence étant qu'un `echo` intégre un retour à la ligne à la fin de la commande.
Autre différence, `echo` affichera du texte brut, là où `printf` interprètera certaines commandes.  

Par exemple, pour afficher le texte en couleur, `printf` le fera par défaut, alors qu'avec un `echo` il faudra rajouter l'option `-e` : 

```shell
printf "\e[33mErreur\e[0m"
# Identique à : 
echo -e "\e[33mErreur\e[0m"
```

Avec `printf`, il est possible de déterminer un nombre de répétition d'un caractère : 

```shell
printf "Info%-3s : \n" # Affiche "Info   : (Info suivi de 3 espaces)
```

## rename  
  
  
`rename 's/pattern/remplacement/' <fichier>` : Renomme le <fichier> en remplaçant le <pattern> par la chaîne de <remplacement>.  
  
*Attention, cette commande doit être installée avant  
L'option `-v` rend le `rename` verbeux.*  
  
## scp  
  
Permet de transferer un fichier par ssh  
  
`scp -r -p <user>@<serveur_source>:<chemin_sur_serveur_source> <user>@<serveur_cible>:<chemin_sur_serveur_cible>`  
  
## shutdown  
  
La commande `shutdown` permet d'éteindre ou de redémarrer le PC  
  
`shutdown -h now` : Arrêter maintenant  
`shutdown -h +5` : Arrêter dans 5 minutes  
`shutdown -r now` : Redémarrer maintenant  
  
Il est également possible de passer par la commande `systemctl` :  
  
`systemctl reboot` : Pour redémarrer  
`systemctl poweroff` : Pour arrêter  
  
  
## stat  
  
La commande `stat` renvoie des statistiques concernant un fichier.  
  
```console  
$ stat .bashrc  
File: .bashrc  
Size: 4007            Blocks: 8          IO Block: 512    regular file  
Device: 2h/2d   Inode: 13510798882396022  Links: 1  
Access: (0644/-rw-r--r--)  Uid: ( 1000/    stan)   Gid: ( 1000/    stan)  
Access: 2020-03-08 16:43:09.210202500 +0100  
Modify: 2020-03-08 16:43:09.211203900 +0100  
Change: 2020-03-08 16:43:09.214206300 +0100  
Birth: -  
```  
  
## tar  
  
Création d'archives non-compressées  
  
`tar cvf archive.tar fichier1 fichier2 ...` : Archivage des fichiers  
`tar zcvf archive.tar.gz fichier1 fichier2 ...` : Archivage et compression en utilisant Gzip  
`tar xvf archive.tar` : Extraire une archive  
`tar zxvf archive.tar.gz` : Décompresser et extraire une archive compresser (Gzip)  
`tar tvf archive.tar` : Afficher le contenu d'une archive  
`tar tvf archive.tar '<chaine_a_rechercher>'` : Lister les fichiers correspondants  
`tar xfO <nom-archive> <nom-fichier>` : Afficher le contenu du fichier présent dans l'archive  
`tar vf <nom-archive> --delete <nom-fichier>` : Supprimer un fichier présent dans l'archive  
  
Le `z` est utilisé dans le cas d'archive Gzip.  
On peut le remplacer par `j` pour utiliser BZip2, et faire des archives .bz2  
*Meilleure compression, mais durée plus longue*  
  
<u>*Les options :*</u>  
`c` : Création  
`v` : Verbeux  
`f` : Nom de l'archive  
`z` : gzip  
`x` : Extraction  
`t` : Lister  
`j` : bzip2  
  
## tee  
  
Permet d'avoir la sortie d'une commande redirigé vers le terminal, mais aussi vers un fichier  
  
Exemple :  
`ls | tee liste.txt` : Affiche le contenu du dossier et ajoute également la liste des fichiers dans le fichier liste.txt  
  
Permet également d'ajouter du texte dans un fichier nécessitant des permissions plus élevées  
Exemple :  
```shell  
echo '127.0.0.1 stan' | sudo tee -a /etc/hosts  
# echo ne nécessite pas de permission  
# tee précédé de sudo pour exécuté tee avec les droits root  
# -a pour 'append' afin de ne pas écraser le fichier  
```  
  
## time  
  
Affiche le temps utilisé par une commande  
  
```shell  
$ time ls  
file1  file2  file3  
  
real    0m0.003s  
user    0m0.001s  
sys     0m0.001s  
```  
  
## top  
  
Affiche la consommation des ressources  
  
Pour trier par la consommation mémoire : `Shift-m`  
  
La commande suivante récupère les process qui consomme le plus de mémoire, à 10 reprises, espacées de 5 secondes :  
```console  
for i in {1..10};do date; top -b -o +%MEM | head -n 17|tail -11;sleep 5;done  
```  
  
## touch  
  
Par défaut, `touch` permet de modifier la date de modification d'un fichier pour le mettre à la date actuelle.  
`touch` peut être utilisé pour créé un fichier vide. Tout comme `> fichier`.  
  
`touch` permettant d'agir sur la date de modification d'un fichier, il est possible de définir la date de modification d'un fichier avec la commande suivante :  
`touch -d '03 May 2022' fichier`  
  
## tput  
  
Positionne le curseur.  
  
`tput <ligne> <col>` : Positionne le curseur à la ligne et la colonne définies.  
`tput sc` : Sauvegarde la position du curseur.  
`tput rc` : Restaure la position du curseur précédemment sauvegardée.  
  
## tree  
  
`tree` : Afficher l'arborescence d'un dossier  
`tree -DFfipgus` : Formattage du résultat  
`tree -L 1` : Limiter le niveau à 1  
`tree -I 'tests|logs_*'` : Exclure des dossiers  
  
## tty  
Indique quel terminal est utilisé  
  
## umount  
  
`umount <partition>` : Démonter une partition  

`<partition` peut être le chemin du disque monté (/dev/sdb1), ou son point de montage (/mnt/cleusb)  

Si le `unmount` retourne une ligne "Cible active", il est possible de trouver quel process bloque le `unmount`.  

Exemple :  
```shell
lsof | grep -E "sdb1|cleusb"
watch     2317             stan  cwd    unknown         /mnd/cleusb
```
  
## uname  
  
Affiche les informations du système  
  
`uname -a` : Affiche toutes les informations  
`uname -p` : Affiche l'architecture du processeur  
  
---  
  
# Commandes sur les chaînes  
  
## sed  
  
`sed` est un éditeur non-intéractif.  
*La commande `sed` a beaucoup d'utilité. Ce qui suit n'en est qu'un extrait*  
  
<u>Syntaxe :</u>  
  
`sed -option adresse/pattern1/pattern2/flag fichier` : Remplacer le <pattern1> par le <pattern2>  
`sed -option adresse:pattern1:pattern2:action fichier` : Si des `/` doivent être utilisé dans les chaines, on utilise d'autres caractères de séparations (par exemple `:` )  
`sed -e "s/\b\(.\)/\u\1/g"` : Transforme la première lettre de chaque mot par en majuscule  
  
**adresse**  
  
`s` : Substitution  
`ns` : Substitution sur la nème ligne <u>(ex : 5s ou 7,9s)</u>  
`y` : Transposition (Remplace le nième caractère du pattern1 par le nième caractère du pattern2)  
  
**pattern1**  
  
Il est possible d'utiliser ici les expressions régulières.  
On peut également "mémoriser" le résultat du motif, et le réutiliser ensuite, en utilisant les paranthèses dans le motif, et leur numéro dans le remplacement.  
*Exemple à ajouter*  
Il est possible d'utiliser les caractères `^` & `$` pour indiquer le début ou la fin d'une ligne.  
	  
**pattern2**  
  
Ici, on peut utiliser des métacaractères spécifiques:  
  
**flag**  
  
`g` : global *(recursive)*  
`d` : supprimer (lignes)  
`n` : nième pattern (remplacer n par un nombre)  
`i` : Non-sensible à la casse  
`I` : Non-sensible à la casse  
  
Par défaut, sed ne fait que retourner dans la console la ligne correspondante une fois modifiée.  
Il est possible d'écrire le modifier le fichier d'entrée avec l'option `-i` :  
  
`sed -i "s/chaine_a_remplacer/nouvelle_chaine/g <fichier>`  
  
### Substitution  
  
`sed 's/<pattern1>/<pattern2/'` : Remplace le premier caractère trouvé de chaque ligne répondant au pattern1 par le pattern2  
`sed 's/<pattern1>/<pattern2/g'` : Remplace tous les caractères trouvé de chaque ligne répondant au pattern1 par le pattern2  
`sed 's/<pattern1>/<pattern2>/X'` : Remplace le Xième caractère trouvé de chaque ligne répondant au pattern1 par le pattern2  
`sed 's/<pattern1>/<pattern2>/gi'` : Remplace tous les caractères trouvé de chaque ligne répondant au pattern1 sans prendre en compte la casse par le pattern2  
`sed 's/\.*\\L\1/'` : (Passe le pattern en Uppercase  
`sed 's/\.*\\U\1/'` : (Passe le pattern en Lowercase  
  
  
### Suppression  
  
`sed ':a;N;$!ba;s/\n/ /g' <fichier>` : Suppression des retour à la ligne  
`sed '1~2d'` : Suppression de la première ligne, puis toutes les deux lignes jusqu'à la fin. Lignes impaires  
`sed '2~2d'` : Suppression de la deuxième ligne, puis toutes les deux lignes jusqu'à la fin. Lignes paires  
`sed '4,10d'` : Suppression des lignes 4 à 10  
`sed '2+4d'` : Suppression de la ligne 2, et les 4 suivantes  
`sed '/pattern/d'` : Suppression des lignes contenant le pattern  
`sed '/pattern/!d'` : Suppression des lignes ne contenant pas le pattern  
  
### Transposition  
  
Très utile pour enlever des caractères accentués par exemple :  
  
`sed 'y/àâéèêëîïôöùûü/aaeeeeiioouuu/'` : Remplace à par a, â par a, etc...  
  
## awk  
  
`awk -F: '{print($1 "\n")}' <fichier>` : Affiche la première colonne d'un fichier  
  
`-F` : définit le délimiteur de colonnes  
`$n` : où *n* est le numéro de colonne  
`\n` : permet d'afficher un résultat par ligne  
  
`echo "Test" | awk '{print tolower($0)}'` : Change la casse en minuscule  
  
# Commandes sur les images  
  
**Le paquet *`imagemagick`* doit être installé.**  
  
## identify  
  
`identify <image>` : Retourne des infos concernant l'image.  
  
## convert  
  
Permet de modifier des images, selon plusieurs options.  
  
<u>Syntaxe :</u> `convert image-entree options image-sortie`  
  
***Redimensionner une image :***  
  
`-resize 50` redimensionne l'image à 50px.  
`-resize 50x100\!` redimensionne en forçant le changement de proportion.  
`-resize 50%` réduit la taille de l'image à 50%.  
  
***Rotation :***  
  
`-rotate 90` effectue une rotation horaire de 90°.  
  
***Rogner une image :***  
  
`convert <fic_src> -crop <largeur_finale>x<hauteur_finale>+<pox_x>+<pos_y> <fic_sortie>`  
exemple : `convert 01.png -crop 1000x500+550+350 croped-01.png` va créé un fichier croped-01.png en partant de l'image 01.png, d'une largeur de 1000px, d'une hauteur de 500px, en partant de la position 550 depuis la gauche de l'image d'origine, et de la position 350 depuis le haut de l'image d'origine.  
  
# Opérations  
  
## Exponentielle  
  
Il faut utiliser la commande `let`  
  
	>>$ let "e=2**3"; echo $e  
	8  
  
## Modulo  
  
Il faut utiliser la commande `expr` ou la commande `let`  
  
	$ expr 5 % 3  
	2  
	$ let "e=5%3";echo $e  
	2  
  
# Boucles  
  
Syntaxe :  
  
`for i in ...;do <actions>;done`  
`for i in {1..10};do echo $i;done`  
  
# Conditions  
  
`if [ <variable> <opérateur> <référence> ];then <actions>;else <action>;fi` : Si alors sinon  
`if [[ <variable> <opérateur> <RegEx> ]];then ...` : RegEx  
  
Exemple :  
  (Pour vérifier si un script est lancé avec certaines options)  
  
```shell  
if [[ ${@} =~ "-user" && ${@} =~ "-pass" ]]; then <actions>;fi  
```  
  
Dans la partie `<actions>`, lors d'une vérification par exemple, il est possible d'utiliser les commandes `exit <cr>` ou `return <cr>`.  
Le `exit <cr>` stoppera l'exécution du script, avec un `echo $?` égale au `<cr>`.  
Le `return <cr>` continuera l'exécution du script, avec un `echo $?` égale au `<cr>` après le `fi`.  
  
# Tableaux  
  
## Déclaration  
  
`declare -a <nom_tableau>` : Pour créer un tableau indicé  
`declare -A <nom_tableau>` : Pour créer un tableau associatif  
  
## Ajouter une entrée  
  
`<nom_tableau>+=("<entrée>")`  
  
## Déclarer et insérer des entrées  
  
`<nom_tableau>=("<entrée_1>" "<entrée_2>" ...)`  
  
## Lectures tableaux  
  
`echo ${<tableau>[n]}`  : Renvoie l'entrée ayant pour indice `n`  
`echo ${<tableau>[@]}`  : Renvoie les entrées du tableau  
`echo ${!<tableau>[@]}` : Renvoie les indices du tableau  
`echo ${#<tableau>[@]}` : Renvoie le nombre d'entrée dans le tableau  
`echo ${<tableau>[-n]}` : Renvoie l'entrée `n` en partant du dernier  
  
## Récupérer la valeur la plus grande  
```console  
IFS=$'\n'  
val=`echo "${<tableau>[*]}" | sort -nr | head -1`  
```  
  
## Supprimer un élément du tableau  
  
`unset tableau[n]` : Supprime l'indice/entrée `n`  
  
## Supprimer un tableau  
  
`unset <tableau>`  
`unset <tableau>[@]`  
`unset <tableau>[*]`  
  