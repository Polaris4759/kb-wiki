#  Bash    
    
## Prérequis script  
  
Un script doit être exécutable. Pour cela, il faut modifier les droits:  
  
```console  
chmod +x <fichier>  
```  
  
L'exécution se fera en tapant `./<nom-script>` en étant dans le dossier du script, ou bien en tapant directement `<nom-script>` après avoir ajouté le script à un dossier du PATH.  
  
Pour se faire, on peut également le mettre dans un dossier personnel de scripts, et ajouter ce dossier au PATH.  
  
Par exemple: Dans le fichier `/etc/.bashrc`, on peut rajouter la ligne `PATH=$PATH:<dossier-perso>`  
  
## Variables    
  
>Pour déclarer une variable, il suffit de taper son nom et d'y affecter une valeur:    
`variable="0"`    
Pour appeler une variable, il faut la faire précéder d'un dollar ($):    
`echo $variable`    
ou    
`echo ${variable}` *(Recommandé)*  
  
## Opérations sur les variables  
  
>Pour mettre une variable en MAJUSCULES :   
`var=${var^^}`  
  
>Pour mettre une variable en minuscule :   
`var=${var,,}`  
    
## Conditions    
  
>**If**    
  
La condition `if` permet de vérifier si un test est vrai. Pour cela, on utilise essentiellement des opérateurs de comparaison.    
  
>On peut comparer des nombres entiers:    
  
	-eq : est égale à (=)    
	-ne : n'est pas égale à (!=)    
	-gt : plus grand que (>) *greater then*    
	-ge : plus grand ou égale à (>=) *greater or equal*    
	-lt : plus petit que (<) *lower then*    
	-le : plus petit ou égale à (<=) *lower or equal*    
  
>On peut comparer des chaînes de caractères    
  
	= : est égale à    
	== : est égale à (c'est à peut près la même chose, sauf si le test est entre doubles crochets [[]])    
	!= : n'est pas égale à    
	-n : la chaîne n'est pas vide    
	-z : la chaîne est vide, sa taille est nulle    
  
>On peut tester des fichiers *(rappel : tout est fichier dans linux*)    
  
	-e : le fichier existe    
	-f : le fichier est un fichier    
	-s : le fichier n'est pas vide    
	-d : le fichier est un dossier    
	-b : le fichier est un périphérique de type bloc    
	-c : le fichier est un périphérique de type caractère    
	-p : le fichier est un tube    
	-h : le fichier est un lien symbolique (ou -L)    
	-r : le fichier autorise la lecture    
	-w : le fichier autorise l'écriture    
	-x : le fichier autorise l'exécution    
	-g : le groupe a les permissions    
	-u : l'utilisateur a les permissions    
	-O : vous êtes le propriétaire    
	-G : vous faites partie du groupe propriétaire    
	-N : le fichier a été modifié depuis sa dernière lecture    
	-nt : plus récent que *Newer Then*    
	-ot : plus ancien que *Older Then*    
    
	! correspond à la négation. Il suffit de faire précéder le test du ! pour inverser le sens du test:    
	if [ ! -e <fichier> ] *si le fichier n'existe pas*    
&nbsp;      
  
> Utilisation d'expressions régulières dans les conditions  
  
>> `if [[ $variable =~ [a-z] ]];then ... fi`    
&nbsp;    
    
>**Case (Switch)**  
  
	Case $#  in  
		Valeur1) action1;action2;;  
		Valeur2)action1;action2;;  
		*)action;;  
	esac  
    
## Boucles    
  
>**While**    
  
	while [ <condition> ];do  
		action  
	done  
  
	Pour mettre un "read" dans une boucle while :    
  
	while [ <condition> ];do    
		read input </dev/tty    
	done    
  
>**For**    
  
	for i in 1 2 3 4 5;do  
		action  
	done  
  
	for i in *.sh;do  
		action  
	done  
  
	for ((i=0;i<10:i++));do  
		action  
	done  
  
## Fonctions  
  
	fonction(){  
		echo $1  
	}  
  
	fonction param  
  
>`$1` : correspond à `param`  
  
## Les paramètres  
  
Les paramètres sont utilisables lors de l'exécution de scripts, ou de fonctions, ou encore de certaines commandes  
  
`$x` : Est égale au paramètre numéro x    
`${x}` : A utiliser à partir du dixième paramètre obligatoirement. Optionnel avant    
`$0` : Nom du script    
`$*` : Ensemble des paramètres sous forme d'un seul argument    
`$@` : Ensemble des paramètres, un paramètre = un argument    
`$# ` : Nombre de paramètres *(nom du script exclu)*    
`$?` : Code retour de la dernière commande    
`$$` : PID du shell qui exécute le script    
`$!` : PID du dernier processus lancé en arrière-plan    
  
  
## getopts  
  
```console  
while getopts ":ab:" option  
# Avec les deux points en début de ligne, l'erreur ne s'affichera pas dans le terminal  
# Avec les deux points après une des options, cela indique que cette option requiert un argument  
do  
	echo "getopts a trouvé l'option $option"  
	case $option in  
		a)  
		echo "Exécution des commandes de l'option a"  
		echo "Indice de la prochaine option à traiter : $OPTIND"  
		;;  
		b)  
		echo "Exécution des commandes de l'option b"  
		echo "Liste des arguments à traiter : $OPTARG"  
		echo "Indice de la prochaine option à traiter : $OPTIND"  
		;;  
		# Le cas suivant permet de faire certaines actions si l'option est invalide  
		\?)  
		echo "$OPTARG : option invalide"  
		exit 1  
		;;  
		# Le cas suivant (:) permet de faire certaines actions si l'option requiert un argument mais que ce dernier est manquant  
		:)  
		echo "L'option $OPTARG requiert un argument"  
		exit 1  
		;;  
	esac  
done  
# La commande suivante permet de supprimer les options et de ne garder que les arguments (Les arguments liés aux options seront également supprimés)  
shift $((OPTIND-1))  
echo "Liste des arguments : $*"  
echo "Analyse des options terminée"  
exit 0  
```  
