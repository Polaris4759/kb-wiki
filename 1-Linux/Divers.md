#  Divers    
    
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
        
## Racourcis clavier    
    
>`Ctrl-Alt-t` : ouvrir un terminal    
`Ctrl-Alt-<gauche>` ou `Ctrl-Alt-<droite>` : Changer d'espace de travail    
`Ctrl-Alt-Shift-<gauche>` ou `Ctrl-Alt-<droite>` : Changer la fenêtre courante d'espace de travail    
`Host-d` : Afficher le bureau. Rappuyer pour afficher les fenêtres à nouveau    
`Host-e` : Ouvrir l'explorateur par défaut.    
`Ctrl-Alt-fn` : Bascule en tty, de 1 à 6, le 7 correspond au mode graphique.    
`Ctrl-Alt-t` : Ouvrir un nouveau terminal    
    

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