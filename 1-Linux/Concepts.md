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
Très utile si tu veux lire plusieurs flux en parallèle, ou ne pas toucher au stdin normal (0).  
Utilisable pour faire des scripts plus robustes (gestion de logs, erreurs, etc.).  
