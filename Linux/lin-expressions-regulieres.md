# Les expressions régulières    
    
Permet d'identifier une chaîne de caractère répondant à certains critères.    
C'est un outil extrêmement complexe, mais très puissant!    
    
    
## Les métacaractères    
    
Les expressions régulières utilisent les métacaractères pour faciliter les recherches.    
    
`^` : début de ligne    
`$` : fin de ligne    
`.` : remplace n'importe quel caractère    
`*` est le caractère de répétition. <em>`a*` :  désigne 0 `a` ou plusieurs `a`</em>    
`.*` désigne n'importe quelle chaîne de caractères.    
`|` permet de désigner plusieurs chaînes *(ou)*.  <em>`foo|bar` désigne foo ou bar.</em>    
  
><u>Attention</u>, il peut être nécessaire d'échapper le pipe (`|`), notamment dans un `sed`.    
*(voir script de conversion md=\>html).*    
  
`[]` : désigne une plage de caractère, ou **ensemble**.    
`[tT]oto` désigne *toto* ou *Toto*.    
`[a-z]` désigne n'importe quelle lettre minuscule.    
`[a-zA-Z0-9]` désigne n'importe quel caractère alphanumérique, minuscule ou majuscule.    
  
>Avec le caractère `^` au début des crochets, il ne signifie pas "début", mais "sauf".    
`[^0-9]toto` désigne tous les "toto" qui ne sont pas précédés par un chiffre.    
   
**Il existe des ensembles préconçus :**     
  
`.` : N'importe quel caractère    
`\w` : [a-zA-Z0-9]    
`\d` : [0-9]    
`\n` : retour à la ligne    
`\t` : tabulation    
  
  
## Les quantificateurs :  
  
`ma[a-z][a-z][a-z]` désigne tout mot commençant par `ma` suivi de trois lettres.    
`[a-z]{6}` désigne 6 lettres consécutives.    
`[a-z]{2,4}` désigne 2 à 4 lettres consécutives.    
  
>`google\.[a-z]{2,3}` peut désigner google.fr ou .com.  
  
`*` : 0 ou plusieurs occurences. Equivaut à {0,}.    
`+` : 1 ou plusieurs occurences. Equivaut à {1,}.    
`?` : 0 ou 1 occurences. Equivaut à {,1}. *(Rend facultatif le caractère précédent).*    
  
>`https?` : désigne `http` ou `https`    
  
`&` : Permet de récupérer la chaîne désigné par le motif de recherche.    
  
>`sed 's/[0-9]/n° &/g' fichier` va rajouter `n°` devant chaque chiffre trouvé.    
  
Il est possible de mémoriser le résultat d'un motif en le mettant entre paranthèses.    
  
>`sed 's/([0-9]*)(t)(.*)/321/'` va réorganiser les chaines contenant des nombres, une tabulation, et des lettres, en lettres, tabulation, chiffres.    
  
Caractère d'échappement : `\`    
    
  
## Syntaxes    
  
### Ligne ne contenant pas le motif  
  
```console  
^((?!motif).)*$  
```  
  
### S'arrêter à la première occurrence sur la ligne  
  
Par défaut, si on prend l'expression régulière suivante : `^.*\s`, `\s` représentant un espace, la regex renverra toute la ligne, du début jusq'au dernière espace.    
  
```console  
^[^motif]*motif  
```  
**Exemple pour trouver le début d'une ligne jusqu'au premier espace :**  
  
```console  
^([^\s]*)(\s) (Les paranthèses ne servent qu'a dissocier les caractères avant l'espace de l'espace)  
```  
