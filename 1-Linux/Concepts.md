# Concepts de commandes à appronfondir / à maîtriser  

## Descripteurs de fichiers personnalisés  

```shell
exec 3< <(grep "toto" *txt)
while IFS= read -r line <&3; do
    echo "Ligne : $line"
done
exec 3<&-  # On ferme proprement le FD 3
```

Explication :  

> <(…) est une substitution de processus : ça crée un fichier temporaire FIFO contenant la sortie de la commande.  
exec 3< <(…) : on associe le descripteur 3 à ce FIFO.  
read -r line <&3 : on lit ligne par ligne depuis ce descripteur.  
exec 3<&- : on ferme proprement le flux quand on n’en a plus besoin.  

Avantages :  

> Pas de sous-shell.  
Très utile pour lire plusieurs flux en parallèle, ou ne pas toucher au stdin normal (0).  
Utilisable pour faire des scripts plus robustes (gestion de logs, erreurs, etc.).  


## mapfile  

Lecture en tableau  

```shell
mapfile -t lignes < <(grep "toto" *txt)

for ligne in "${lignes[@]}"; do
    echo "→ $ligne"
done
```

Explication :  

> -t : supprime les \n à la fin de chaque ligne.  
< <(cmd) : on lit la sortie de cmd comme une liste de lignes.  
${lignes[@]} : on accède à toutes les lignes.  

Avantages :  

> Très lisible et moderne (Bash 4+).  
Permet d'accéder à la ligne n, à la dernière, aux indices pairs/impaire, etc.  
Idéal pour des traitements multi-passe ou pour garder les lignes en mémoire.  

## Fiche mémo : classes de caractères POSIX  

Classe POSIX	Signification	Équivalent / Remarques  
[[:alnum:]]	Caractères alphanumériques (lettres + chiffres)	[A-Za-z0-9]  
[[:alpha:]]	Lettres uniquement (minuscules + majuscules)	[A-Za-z]  
[[:digit:]]	Chiffres (0 à 9)	[0-9]  
[[:lower:]]	Lettres minuscules	[a-z]  
[[:upper:]]	Lettres majuscules	[A-Z]  
[[:space:]]	Espaces blancs (espace, tab, retour ligne…)	≠ \s (non reconnu dans sed)  
[[:blank:]]	Espace ou tabulation seulement	Plus restrictif que [[:space:]]  
[[:punct:]]	Ponctuation (., ; ! ? etc.)	Tous les symboles sauf lettres/chiffres  
[[:cntrl:]]	Caractères de contrôle	Ex. : \n, \t, \r, etc.  
[[:graph:]]	Tout sauf les espaces non imprimables	= visible à l’écran  
[[:print:]]	Tout caractère imprimable (espace compris)	[[:graph:]] + espace  
[[:xdigit:]]	Chiffres hexadécimaux (0-9A-Fa-f)	Pour matcher des valeurs hex  
