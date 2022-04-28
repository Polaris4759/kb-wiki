# Oracle  
  
## Fichiers à accès séquentiel  
  
Dans un fichier à accès séquentiel, les enregistrements logiques sont accessibles les uns après les autres. Pour accéder à un enregistrement fixé, il faut utiliser un algortihme de recherche séquentielle (Pour accéder à l'enregistrement de rang n, il faut parcourir les n-1 précédents enregistrement)  
  
  
# Fichiers à accès indexé  
  
C'est un mode d'accès semi-direct dans lequel l'on recherche en premier la valeur de la clef dans une table (nommée table d'index), puis ensuite on accède directement à l'enregistrement.  
  
Dans l'accès indexé la fonction associe généralement par une recherche dans la table d'index une clef avec une valeur de position du pointeur de fichier  
  
# Fichiers à accès direct  
  
Dans un fichier à accès direct, les enregistrements logiques sont accéssible immédiatement grâce à une clef. Il y a similitude avec la structure de tableau en mémoire centrale dans ce dernier cas la clef est l'indice de la cellule du tableau.  
Nous disposerons généralement d'une fonction permettant de transformer un champ de l'enregistrement en une clef.  
  
# Modèle hiérarchique  
  
C'est le modèyle des premières base de données.  
  
Inconvénients :  
1/ La suppression d'un noeud entraine la disparition des descendants  
2. ...  
  
# Modèle réseau  
  
# Modèle relationnel  
  
Le modèle relationnel est une manière de modéliser les relations existantes entre plusieurs informations, et de les ordonner entre elles. Cette modélisation qui repose sur des principe mathématiques mis en avant est souvent retranscite physiquement ("implémentée") dans une base de données.  
  
# SGBD  
  
Le SGBD le plus courant est le système de gestion de base de données relationnelle.  
  
L'interface standard est le SQL (Structured Query Language)  
  
Les plus répandu sont : IBM DB2, Oracle, MySQL, PostgreSQL, Oracle, Microsoft SQLServer, Access  
  
  
# Oracle  
# Détail d'un numéro de version  
  
Version 11.2.0.2.0  
11 désigne le numéro de la version majeure de la base  
2 désigne le numéro de version de la matinenance  
0 désigne le numéro de version du serveur d'applications  
2 désigne le numéro de version du composant (patch)  
0 est le numéro de la version de la plate-forme.  
  
Architecture d'une application web  
  
Client  
Navictaeurs internet (IE, Firefox, Chrome, etc...)  
  
Serveur Web  
Serveur Web (Apache, IIS, JBOSS, Websphere)  
  
Serveur de données  
SGBD (Oracle, SQL Server, MySQL, PostgreSql)  
  
Schéma yEd:  
Client > Requête HTTP > Serveur Web > Requête SQL > Serveur de données  
Client < Page HTML < Serveur Web < Données < Serveur de données  
  
# Aspect fonctionnels et technique d'un projet  
  
**Fonctionnel** : Représente la partie métier de l'application  
  
**Technique** (matériels et choix des technologies):  
Les choix techniques concerne:  
* Présentation : Langage (HTML, PHP, JSP, javascript)  
* Serveurs Web (Tomcat, WebLo, WebSphere)  
* SGBD (Oracle, DB2, Mysql,...) : Le choix d'un SGBD trepose sur des critères liés :  
> * A la volumétrie traitée par l'application  
> * A la sécurité des données  
> * A la reprise sur incident  
> * Aux performances du SGBD  
> * Au respect des standards  
> * Au niveau de la maintenance fournie pour l'éditeur  
> * Aux tarifs du SGBD  
  
# Acteurs d'un projet  
  
Les acteurs d'un projet :  
Les acteurs impliqués dans la réaliston d'un projet sont repartis dans différents groupes de travail que sont :  
* Groupe de pilotage  
Oriente sur les choix stratégiques et techniques. il met à disposition les moyens pour la réalisation du projet  
* Groupe de projet ou de réalsiation  
Il est chargé de l'exécution du projet. Il réalise les différentes tâches d'analyse, de conception, de développement et de déploiement. Il est tenu de rendre comtpe au groupe de pilotage pour la validation de ses activités.  
* Groupe des utilisateurs  
Il est solicité pour fournir des information nécessaires à la bonne coinduite du projet. Il intervient également dans la va	lidation des dossires d'études et des prototypes produits par le groupe de projet  
  
# UML et les abases de données  
  
UML (Langage de modélisation unifié ou Unified Modeling Language)  
L'UML est un langage de modélisation graphique oriené objet.  
  
# SGBD  
  
Présentation:  
  
Un SGBD est un logiciel système conçu pour créer et gérer des bases de données.    
Il prend en charge les requêtes des utilisateurs ainsi que celles provenant d'autres programmes pour qu'ils n'aient pas à comprendre où la données se situent physiquement sur le support de stockage et, dans le cas d'un système multi-utilisateurs, qui d'autres peut également accéder aux données.  
  
En gérant les requêtes des utilisateurs, le SGBD garantit :  
* L'intégrité des données (s'assure qu'elles soient toujours disponibles et qu'elles soient organisées de façon cohérente)  
* La sécurité (s'assure que seulement ceux disposant des privilètes d'accès puissent accéder aux données).  
  
# BDR : Base de données relationnelle  
Une BDR est une base de données où l'information est organisée dans des tables appelées relations.  
  
Selon ce modèle relationnel, une base de données consiste en une ou plusieurs relations, les lignes sont appelées des enregistrements, les colonnes sont des attributs.  
  
# Schéma relationnel d'une BD  
  
* Schéma d'une relation  
  
Le Schéma d'une ralation est composé!:  
* Du nom de la relation,  
* De la liste de ses attributs avec les domaines respectifs dans lesquels ils prennent leurs valeurs  
* De la clé primaire,  
* Des clés étrangères  
  
* Schéma relationnel d'une base de donnée  
Le schéma relationnel d'une BD est composé de l'ensemble des schémas de chaque relation de la BD  
  
# Notion de schéma  
  
* Chaque objet d'une base est associé a son propriétaire  
* Un utilisateur qui ne détient aucun objet, il est perçu par Oracle comme un identificateur de connexion, pour accéder aux objets, il doit avoir les droits acordés par le propriétaire ou l'administrateur.  
  
# Algèbre relationnel  
Les opérateurs de l'algèbre relationnelle définie par CODD comprennent  
* Les opérateurs ensemblistes (UNION, INTERSECTION, DIEFFERENCE)  
Les opérateurs relationnels eavce deux opérateurs unaires (Projection, selection et des opérateurs binaires jointure et division  
Ces opérateurs servent à évaluer la complétude d'un langage relationnel.  
  
# Opérateurs ensemblistes : UNION  
Soit R1 et R2 deux relations  
  
**Union R1 U R2**  
  
*Exemple SQL:*  
SELECT colonne~x~ FROM Table~1~  
UNION  
SELECT colonne~x~ FROM Table~2~  
  
# Opérateurs ensemblistes : INTERSECTION  
Soit R1 et R2 deux relations  
  
**INTERSECTION R1 &cap; R2**  
  
*Exemple SQL:*  
SELECT colonnex FROM Table1  
WHERE EXISTS (SELECT colonne~x~ FROM Table~2~ WHERE Table~2~.colonne~x~=Table~1~.colonne~x~)  
  
# Opérateurs Relationnels  
Soit R1 et R2 deux relations  
  
**DIFFERENCE R1 - R2**  
  
*Exemple SQL:*  
SELECT colonnex FROM Table1  
WHERE NOT EXISTS (SELECT colonne~x~ FROM Table~2~ WHERE Table~2~.colonne~x~=Table~1~.colonne~x~)  
  
# Opérateur relationnels : SELECTION  
Soit R la relation et F la formule d'une combinaison de comparaison et d'opératuers logiques  
  
**SELECTION R**  
  
*Exemple SQL:*  
SELECT colonne~x1~, ..., colonne~xn~ FROM Table WHERE (condition)  
  
# Opérateurs relationnels: PROJECTION  
Soit R la relation et L la liste des attributs à sélectionner  
  
**PROJECTION R**  
*(Découpage vertical)*  
  
*Exemple SQL:*  
SELECT colonne~x1~, ..., colonne~xn~ FROM Table  
  
# Opérateurs relationnels: JOINTURE  
Soit R1 et R2 deux relations  
  
**JOINTURE R1 R2**  
  
*Exemple SQL:*  
SELECT colonne~1~, colonne~2~ FROM Table~1~ Table~2~ WHERE Table~1~.colonne~2~=Table~2~.colonne~2~  
  
# Opérateurs relationnels: DIVISION  
Soit R1 et R2  
  
**DIVISION R1/R2**  
  
# Les concepts relationnels et SQL  
  
* Le Tableau donne la correspondance entre le vocabulaire des structures de données du modèle relationnel de CODD et celles de SQL  
  
  
|Codd                      ||SQL|  
|:-------------:|:---------:|:--------------------:|  
|Français       |Anglais    |Anglais               |  
|Relation       |Relation   |Table                 |  
|Domaine        |Domain     |-                     |  
|Attribut       |Attribute  |Column                |  
|N-uplets(tuple)|Tuple      |Line                  |  
|Clé primaire   |Primary Key|Primary Key           |  
|Clé étrangère  |Foreign Key|References/Foreign Key|  
  
# sqlplus  
  
près avoir installé Oracle sur votre ordinateur, vous serez libre de choisir l'accès qui vous convient:  
* L'interface SQL\*Plus (livrée avec la base et dans toutes les versions clientes d'Oracle).  
* Vous pouvez opter pour SQL-Developper (produit Java gratuit sur le site d'Oracle qui ne nécessite aucune installation, simplement une décompression dans un de vos répertoires  
* Pour un programme Java ou PHP (via JDBC  
  
Il existe d'autres clients SQL qui sont payants ou gratuits (SQL developper, SQL tools)  
  
sqlplus permet d'envoyer des requêtes SQL à une table.  
  
  
