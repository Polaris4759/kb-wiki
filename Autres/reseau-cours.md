<div id="sommaire">  
# SOMMAIRE  
* ## [Les réseaux et leurs dimensions](# les-reseaux)    
* ## [Les différentes topologies](# les-topologies)    
* ## [Les supports de transmissions](# les-supports)    
* ## [Les interconnexions](# interconnexions)    
* ## [Les réseaux Client/Serveur ou Poste à Poste](# client-serveur)    
* ## [Les modèles *(OSI et TCP/IP)*](# les-modeles)    
* ## [Les ports et protocoles](# les-ports)    
* ## [Adressage IP](# adressage)    
> * ### [Principe et définition](# adressage-principe)  
> * ### [Classes](# adressage-classes)  
> * ### [Calculs](# adressage-calculs)  
> * ### [Exemples](# adressage-exemples)  
    
* ## [Les sous-réseaux](# les-sous-reseaux)    
</div>  
  
<a name="les-reseaux"></a>    
  
# LES RÉSEAUX ET LEURS DIMENSIONS    
  
**PAN :** Personnal Area Network    
  
> Réseau individuel ou domestique    
Connecte les équipements personnels autour de l'utilisateur.    
(Une dizaine de mètres)    
    
**LAN :** Local Area Network    
  
> Réseau local, sur un même site. Typiquement, le réseau local d'entreprise.    
(Une centaine de mètres)    
    
**MAN :** Metropolitan Area Network    
  
> Réseau métropolitain. Environ une dizaine de kilomètres. Permet de relié plusieurs LAN entre eux.    
Par exemple, Sogeti Basso Cambo et Sogeti Blagnac.    
(Une dizaine de kilomètres)    
    
**WAN :** Wide Area Network    
  
> Réseau étendu    
(Plus d'une centaine de kilomètres)    
    
<a name="les-topologies"></a>    
  
# TOPOLOGIE    
    
**C'est l'architecture du réseau**    
*<u>Topologie physique :</u>* Comment ils sont connectés    
*<u>Topologie logique  :</u>* Comment ils communiquent    
    
**Topologie physique:**    
  
* **En bus**    
Les ordinateurs sont reliés directement entre eux.    
*<u>Avantages</u>* : Coût, facile à mettre en place, pas de perturbation si une machine est ne panne    
*<u>Incovénients</u>* : Peu fiable (confidentialité des données), si support en panne tout le réseau est affecté, nombre d'équipements limité affectant le réseau.    
    
* **En anneau**    
Chaque ordinateur est relié à deux autres machines du réseau    
*<u>Avantages</u>* : Coût (moins de câble), évite la collision, facile à installer et à reconfigurer.    
*<u>Inconvénients</u>* : diffusion lente, si une machine est défaillante, tout le réseau est coupé, la modification du réseau affecte le réseau.    
    
* **En étoile**    
Les ordinateurs sont reliés à un hub (concentrateur), ou un switch (commutateur)    
*<u>Avantages</u>* : La connexion est mieux organisée, et plus sûre.    
*<u>Inconvénients</u>* : Coût    
    
* **Maillé**    
Chaque ordinateur est relié à chacune des autres machines    
*<u>Avantages</u>* : Multiples routes, donc continuité accrue. Confidentialité. Reconfiguration facile (ajout d'une machine).     
*<u>Inconvénients</u>* : Coût    
    
**Topologie logique :**      
  
* Ethernet    
* Token ring    
* FDDI    
    
Notion de jeton    
  
<a name="les-supports"></a>    
  
# SUPPORTS DE TRANSMISSION  
  
**Support filaire**  
  
* Câble paire torsadée  
* Câble coaxial  
* Câble optique  
  
|Type de cable |Distance    |Facilité     |Immunité au bruit|Débit  |  
|:-------------|:-----------|:------------|:----------------|:------|  
|Paire torsadée|Faible (1km)|Très grande  |Faible           |10Mb/s |  
|Coaxial       |Moyenne 10km|Grande       |Moyenne          |100Mb/s|  
|Optique       |Très grande |Très délicate|Excellente       |500Mb/s|  
  
**Support sans fils**  
  
* Faisceau hertzien  
* Liaison satellite  
  
<a name="interconnexions"></a>    
  
# LES INTERCONNEXIONS  
  
L'interconnexion de plusieurs machines ou réseaux nécessite des équipements spécifiques.  
  
C'est ainsi que sont définis :   
* Le répéteur  
* Le switch (comutateur)  
* Le pont  
* Le routeur  
  
  
**Le répéteur**  
  
* Equipement d'interconnexion de niveau 1 du modèle OSI  
* Permet la régénération du signal  
* Réalise l'adaptation et la prolongation des supports. Passage du coaxial à la fibre optique par exemple.  
  
**Le switch**  
  
* Equipement d'interconnexion de niveau 2 du modèle OSI  
* Appelé aussi commutateur  
* Permet de filtrer les informations *(trame)* vers la destination voulue dans un même réseau  
* **Matériel qui relie des machines entre elles via des ports Ethernet**  
  
**Le pont (bridge)**  
  
* Equipement d'interconnexion de niveau 2 du modèle OSI  
* Permet de relier deux segments de réseaux de même types. Il n'a que deux connexions.  
* **Matériel qui relie physiquement 2 réseaux séparés et distants ayant, le plus souvent, un même protocole comme TCP/IP, mais <u>avec des classes d'adresses IP et masques identiques</u>**  
  
**Le routeur**  
  
* Equipement d'interconnexion de niveau 3 du modèle OSI  
* Permet d'acheminer **les paquets** entre deux ou plusieurs réseaux.  
* **Matériel qui relie physiquement 2 réseaux séparés et distants ayant un même protocole comme TCP/IP mais <u>avec des classes d'adresses IP et masques différents</u>. Son rôle est de faire transiter des paquets d'une interface réseau vers une autre**  
  
<a name="client-serveur"></a>    
  
# RESEAU CLIENT-SERVEUR  
  
Réseau informatique où des machines clientes contactent un serveur qui leur fournit des services.    
*<u>Avantages :</u>* Meilleure sécurité, Facile à administrer pour un réseau important, Sauvegarde des données dans un emplacement centralisé.    
*<u>Inconvénients :</u>* Nécéssite un logiciel coûteux, Présente un point de défaillance unique, Requiert un expert "Administrateur Système/Réseau"    
  
**Réseau poste à poste**  
Réseau informatique où des machines peuvent être un peu serveur et un peu client.    
Chacun des ordinateurs du réseau est libre de partager ses ressources (imprimantes)    
  
*<u>Avantages :</u>* IMplémentation moins coûteuse    
Ne demande pas d'autres logiciels spécialisé dans l'administration réseau    
Ne demande pas d'administrateur réseau dédié    
  
*<u>Inconvénients :</u>* Moins sécurisé    
Toutes les machines partageant des ressources diminuent les performances    
Chaque utilisateur doit êtres formés aux tâches d'administration    
  
<a name="les-modeles"></a>    
  
# MODELE OSI  
  
OSI signifie Open Systems Interconnection  
  
* Il définit de quelle manière les ordinateurs et les périphériques en réseau doivent procéder pour communiquer  
* Il est composer de 7 couches  
* Une couche de niveau N communique avec les couches N-1 et N+1  
* Une couche inférieure transporte les données de la couche supérieure  
  
|Modèle OSI    |Unité de données|En résumé                          |  
|:------------:|:--------------:|:---------------------------------:|  
|7.Application |APDU            |Point d'accès aux services         |  
|6.Presentation|PPDU            |Conversion et chiffrement          |  
|5.Session     |SPDU            |Communication interhost            |  
|4.Transport   |TPDU            |Connexion et contrôle de flux (TCP)|  
|3.Réseau      |Paquet          |Adressage logique et routes (IP)   |  
|2.Liaison     |Trame           |Adressage physique (MAC et LLC)    |  
|1.Physique    |Bit             |Transmission binaire               |  
  
# MODELE TCP/IP  
  
* On notera que l'appellation TCP/IP provient du protocole orienté connexion de la couche transport TCP et de celui de la couche réseau IP  
* Le modèle OSI est placé  en parallèle pour indiquer que la famille des protocoles TCP/IP  recouvre le même domaine.  
  
|TCP/IP      |  
|:----------:|  
|Application |  
|Transport   |  
|Internet    |  
|Accès réseau|  
  
<a name="les-ports"></a>    
  
# LES PORTS ET LES PROTOCOLES  
  
Chaque protocole passe par un port prédéfini.  
  
	Liste des ports/protocoles :   
		Linux => /etc/services  
		Windows => %SystemRoot%\System32\drivers\etc\services  
  
  
<a name="adressage"></a>    
  
# ADRESSAGE IP  
  
* Une adresse IP est un numéro permettant à un ordinateur de communiquer dans réseau  
* Chaque hôte dispose d'une adresse unique  
* L'adresse est une adresse logique et non physique (MAC)  
* L'adresse est assignée à l'interface et non à la machine  
* Les adresses sont groupées par rapport au numéro du réseau  
  
<a name="adressage-principe"></a>    
  
## **Principe de l'adressage**  
  
* <u>*But*</u> : fournir un service de communication universel permettant à toute machine de communiquer avec toute autre machine de l'interconnexion  
* Une machine doit être accessible aussi bien par des humains que par d'autres machine  
* Une route précisant comment la machine peut être atteinte  
  
Une adresse IP est décomposée en deux parties :   
  
* Une partie de l'adresse identifie le réseau (netid) auquel appartient l'hôte  
* Une partie identifie le numéro de l'hôte (hostid) dans le réseau  
  
## **Définition d'une adresse IP**  
  
* Une adresse est composée de 32 bist (4 octets) dite <u>*"adresse IP"*</u>  
* Chaque combinaison représente une adresse  
* Il est pratiquement impossible de mémoriser 32bits  
* Une adresse IP est représentée dans un format décimal avec 4 nombres séparés par des points  
* On parle de <u>*"notation décimale pointée"*</u>  
  
## **Composition d'une adresse IP**  
  
Une adresse IP comprend deux parties :   
Un numéro de réseau (NET-ID): une adresse globale pouridentifier un réseau, cette adresse est commune à toutes les machines de ce réseau  
Un numéro de machine (h$ote): identifier une machine dans un réseau  
  
Une adresse = N° réseau (k bits) + N° machine (n bits)  
  
Exemple : 131.108.122.204. Si on a k=16 et n=16, alors  
NET-ID : 131.108  
HOST : 0.0.122.204  
  
## **Attribution d'adresse à une machine**  
  
Il existe plusieurs façon d'attribuer une adresse IP à un équipement:  
* Certaines machines possèdent toujours la même adresse (adresse statique) : cette adresse est attribuée d'une manière manuelle (en utilisant une commande ou via une interface graphique)    
  
    Exemple : Sur linux : ifconfig eth0 192.168.3.4 netmask 255.255.255.0 permet d'attribuer une adresse manuellement  
  
* Certaines machines possèdent une adresse qui change à chaque démarrage (adresse dynamique) : cette adresse est attribuée d'une façon dynamique et automatique par une autre machine (serveur DHCP : Dynamic Host Configuration Protocol)  
  
<a name="adressage-classes"></a>    
  
## **Classes d'adresses IP**  
  
La taille de la partie réseau (net-id) détermine la classe de l'adresse  
Les adresses IP sont classées en 3 classes  
A:  8 bits + 24 bits  
B: 16 bits + 16 bits  
C: 24 bits +  8 bits  
  
### **Classe A**  
  
* Le premier octet est réservé au réseau  
* Les 3 derniers octets sont réservés aux hôtes  
* La valeur du premier octet est comprise entre 1 et 126 (le bit de poids fort est égal à 0)  
  
Nombre de réseaux disponibles : 2^7^ = 128 réseaux    
Nombre d'hôtes disponibles : 2^24^-2 = 16 777 214 hôtes  
  
### **Classe B**  
  
* Les deux premiers octets sont réservés au réseau  
* Les deux derniers octets sont réservés aux hôtes  
* La valeur du premier octet est comprise entre 128 et 192 (les deux bits de poids fort sont égaux à 10)  
  
Nombre de réseaux disponibles : 2^15^ = 32768 réseaux    
Nombre d'hôtes disponibles : 2^16^-2 = 65534 hôtes    
  
### **Classe C**  
  
* Les 3 premiers octets sont réservés au réseau  
* Le dernier octet est réservé aux hôtes  
* La valeur du premier octet est comprise entre 192 et 223 (les trois bits de poids fort sont égaux à 110)  
  
  
Nombre de réseaux disponibles : 2^23^ = 8 388 608 réseaux    
Nobmre d'hôtes disponibles : 2^8^-2 = 254 hôtes  
  
  
### **Autres classes**  
  
Il existe d'autres classes (D et E), qui sont réservées à des usages spécifiques.  
  
### **Adresses IP réservées**  
  
Pamris ces adresses *(Classes A, B, et C)*, certaines adresses sont également réservées pour des usages spécifiques, notamment pour définir une plage d'adresses d'un réseau local :    
*(liste non exhaustive)*  
  
>`0.0.0.0/8` : *Ce réseau*    
>`127.0.0.0/8` : Adresse de bouclage (localhost)    
>`10.0.0.0/8` : Adresses privées    
>`172.10.0.0/12` : Adresses privées    
>`192.168.0.0/15` : Adresses privées    
  
## Valeurs particulières  
  
**Adresse d'un réseau**    
* La partie hôte de l'adresse ne peut pas être composée exclusivement de 0    
* Dans le cas ou la partie hôte comporte uniquement des zéros alors cette adresse correspond à l'adresse d'un réseau    
* L'adresse qui comporte uniquement des zéros dans la partie réseau et hôte désigne tout le réseau    
* Une adresse réseau ne peut pas être attribué à une machine    
  
><u>*Exemple :*</u> 192.168.0.0    
    
**Le broadcast**    
* Adresse de diffusion : on parle de diffusion lorsqu'une source envoie des données a toutes les unités d'un réseau    
* Toutes les machines du même réseau reçoivent le paquet de données    
* Quand une adresse ne contient que des 1 dans la parti hôte. Elle est appelée adresse de diffusion (broadcast)    
* Une adresse de diffusion ne peut pas être attribuée à une machine    
  
><u>*Exemple :*</u> 192.168.255.255    
  
<a name="adressage-calculs"></a>    
  
## **Calculs sur une adresse IP**  
  
A partir d'une adresse IP, on peut définir :   
  
* Sa classe  
* Son masque  
* La partie réseau *(net-id)*, qui représente également l'adresse du réseau  
* La partie hôtes *(host-id)*  
* L'adresse de diffusion *(Broadcast)*  
  
>**Le Masque**  
  
>>**Si rien n'est spécifié**, la valeur par défaut du masque, qui dépend de la classe, est utilisée :    
  
* Adresses entre **0.0.0.0** et **127.255.255.255**    
Classe A    
Masque par défaut = 255.0.0.0 *(Notation CIDR : /8)*    
<u>Le premier octet représente le ***net-id***, les trois autres le ***host-id***.</u>    
    
* Adresses entre **128.0.0.0** et **191.255.255.255**    
Classe B    
Masque par défaut = 255.255.0.0 *(Notation CIDR : /16)*    
<u>Les deux premiers octets représentent le ***net-id***, les deux derniers le ***host-id***</u>    
    
* Adresses entre **192.0.0.0** et **223.255.255.255**    
Classe C     
Masque par défaut = 255.255.255.0 *(Notation CIDR : /24)*    
<u>Les trois premiers octets représentent le ***net-id***, et le dernier le ***host-id***</u>  
  
>>**Si le masque est spécifié :**    
  
>***/25*** par exemple, ou ***255.255.255.128***, signifie que les 25 premiers bits des 32 représentant une adresse IP correspond au masque.  
>**Ce sont les bits à 1, les autres sont à 0**    
>On obtient : 11111111.11111111.11111111.10000000  
  
<u>Pour la partie réseau,</u> on fait une opération "ET logique" de l'adresse IP et du masque de sous-réseau    
<u>Pour la partie hôte,</u> on fait une opération "ET logique" de l'adresse IP et du complément à 1 du masque de sous-réseau  
  
**Table de vérité ET logique**  
  
|a  |b  |S=a ET b|  
|:-:|:-:|:------:|  
|0  |0  |0       |  
|0  |1  |0       |  
|1  |0  |0       |  
|1  |1  |1       |  
  
><u>*Exemple:*</u> adresse IP **172.29.48.183/22**    
>    
>**172.29.48.183** *(En décimal pointé)*    
>10101100.00011101.00110000.10110111 *(En binaire)*      
  
>**Masque de sous-réseau**    
>11111111.11111111.11111100.00000000  *(Les 22 premiers bits sont à 1, les autres à 0)*  
    
>**Partie réseau**    
  
	Addresse IP :10101100.00011101.00110000.10110111     
	Masque      :11111111.11111111.11111100.00000000     
	------------------------------------------------     
	Résultat    :10101100.00011101.00110000.00000000       
  
>La partie réseau *(net-id)* est : <u>**172.29.48.0**</u>    
    
>**Partie hôte**    
  
>**Masque de sous-réseau complément à 1**    
>00000000.00000000.00000011.11111111 Ca1    
  
	Addresse IP :10101100.00011101.00110000.10110111    
	Masque Ca1  :00000000.00000000.00000011.11111111    
	------------------------------------------------    
	Résultat    :00000000.00000000.00000000.10110111    
  
>La partie hôte *(host-id)* est : <u>**0.0.0.183**</u>    
  
>**Adresse de diffusion (Broadcast)**  
  
Pour obtenir l'adresse de la diffusion, il faut mettre à 1 tous les bits de la partie hôte  
  
Dans notre exemple d'adresse IP **172.29.48.183/22**, il faut donc mettre les 10 derniers bits à 1 :     
     
>10101100.00011101.00110000.10110111      
>devient :     
>10101100.00011101.00110011.11111111    
  
L'adresse de diffusion est donc:  172.29.51.255    
  
<a name="adressage-exemples"></a>    
  
## Exemples:  
  
**12.30.10.2**    
  
	Classe : A  
	Réseau: 12.0.0.0  
	Hôte:0.30.10.2  
	Broadcast: 12.255.255.255  
	Première adresse : 12.0.0.1  
	Dernière adresse : 12.255.255.254  
    
**172.30.10.2**    
  
	Classe : B  
	Réseau : 172.30.0.0  
	Hôte : 0.0.10.2  
	Broadcast : 172.30.255.255  
	Première adresse : 172.30.0.1  
	Dernière adresse : 172.30.255.254  
    
**192.130.10.2**    
  
	Classe : C  
	Réseau : 192.130.10.0  
	Hôte : 0.0.0.2  
	Broadcast : 192.130.10.255  
	Première adresse : 192.130.10.1  
	Dernière adresse : 192.130.10.254  
  
<a name="les-sous-reseaux"></a>    
  
# LES SOUS RESEAUX  
  
Le principal problème de l'adressage IP est le gaspillage de l'espace d'adressage : des adresses réservées mais non attribuées.  
  
**<u>Par exemple :</u>**    
  
* Si l'on dispose de 50 machines dans un réseau, cela nécessite 50 adresses    
* La classe la plus adéquate est la classe C pour laquelle on dispose de 254 hôtes, donc on utilise 50 adresses seulement    
* Mais le reste des adresses sont inutilisées et ne peuvent pas être affecter ailleurs puisque l'adresse réseau est déjà attribuée.    
    
## Pourquoi créer des sous-réseaux    
    
Donc pourquoi ne pas utiliser les adresses d'un réseau ayant une capacité qui répond juste au besoin sans gaspiller les adresses?    
    
* Cela revient a prendre une partie du réseaux global au lieu de prendre la totalité des adresses offertes par ce réseau.    
  
Le net-id des nouveaux sous-réseaux est constitué de k+n bits  
  
* Cette opération est souvent appelée emprunt de bits  
* L'emprunt se fait toujours à partir du bit d'he situé le plus à gauche  
* Chaque combinaison des bits empruntés représente un sous-réseau (2^n^ sous-réseaux)   
* Le nombre de bits qu'il reste détermine le nomvre d'adresses utilisable dans le sous-réseau  
* (2^nombre^ ^de^ ^bits^ ^hôtes^ ^restants^)=adresses utilisables  
* La soustraction correspond aux deux adresses réservées : l'adresse IP du réseau et l'adresse de broadcast  
  
## Exemple :     
    
192.168.13.X    
    
On réserve les deux premiers bits du dernier octet pour faire des sous-réseaux.    
    
On obtient donc 4 sous-réseaux, avec X :    
X~1~=00 000000    
X~2~=01 000000    
X~3~=10 000000    
X~4~=11 000000    
    
|Sous-réseau|Début|Fin  |  
|:---------:|:---:|:---:|  
|X~1~       |0    |63   |  
|X~2~       |64   |127  |  
|X~3~       |128  |191  |  
|X~4~       |192  |255  |  
    
La colonne "Début" correspond à l'adresse du sous-réseau  
La colonne "Fin" correspond à l'adresse de diffusion du sous-réseau  
  
