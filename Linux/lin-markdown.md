# Markdown  
  
Markdown permet de coder facilement du HTML. Il faut l'interpréter avec la commande `pandoc`.  
  
## Syntaxe  
  
`ligne vide` : séparation entre deux paragraphes    
`2 espaces en fin de ligne` : retour à la ligne    
`# ` : titre 1    
`## ` : titre 2      
`### ` : titre 3    
`*` ou `_` : *italique*    
`**` ou `__` : **gras**    
`~~` : texte barré    
`>` : blockquotes    
*Pour indenter plusieurs lignes, il suffit de les commencer par `>`*    
*Il est possible d'encastrer plusieurs blockquotes. Pour cela, il suffit de mettre plusieurs `>` à la suite*    
`* ` ou `- ` ou `+` : liste *(\<ul>)*    
*Pour créer des sous listes, il suffit d'indenter la ligne*    
`1.` : liste organisée *(\<ol>)*    
`[ ]` : case à cocher *(unchecked)*    
`[x]` : case à cocher *(checked)*    
`tabulation` : bloc de code    
`backquote` : morceau de code dans un paragraphe de texte    
`^exposant^` : mot^exposant^     
`~indice~` : mot~indice~    
`***` ou `---` ou `___` : Ligne horizontale s'ils sont seuls sur une ligne    
`[nom lien](lien titre "titre")` : affiche un lien    
`<URL>` : Tranforme l'URL en lien    
`![texte alternatif](url de l'image "titre")` : affiche une image    
 *Il est possible de mettre un lien sur une image*    
  `[![texte alternatif](url de l'image "Titre de l'image]`    
  
Tableau :    
  
	|colonne 1|colonne 2|colonne 3|  
	|:--------|:-------:|--------:|  
	|texte    |  texte  |    texte|  
  
`` ` `` : Pour afficher un "\`" dans du code, il faut commencer et finir le paragraphe par "\`\`", ou l'échapper      
`\` : Caractère d'échappement    
  
## Conversion  
>Conversion d'un fichier .md en .html, avec des options.    
  
	pandoc -s -o fichier.html -t markdown --css fichier.css -M title="Titre" fichier.md  
  
`-o` est le fichier de sortie.    
`-t` force l'interpréteur.    
`--css` est le fichier css utilisé.    
`-M` pour les méta-données. ???    
`-s` standalone file. ???    
