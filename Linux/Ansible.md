# Ansible    
    
## Cours    
  
*Section à venir*  
  
<hr/>  
    
## TP    
    
### Création d'un fichier inventaire et configuration de la connexion    
    
Créer un fichier inventaire hosts,    
Ajouter l'utilisateur root local du localhost,    
Ajouter 2 hosts avec l'utilisateur root.    
    
Copier les clés SSH de chaque hôte.    
    
```yaml    
#fichier : hosts    
    
root_local ansible_connection=local ansible_ssh_user=root    
node1 ansible_ssh_host=192.168.2.1 ansible_ssh_user=usera    
node2 ansible_ssh_host=192.168.2.2 ansible_ssh_user=usera    
```    
    
```yaml    
#Ajout des clés SSH    
    
ssh-copy-id <user>@<host>    
```    
    
### Commandes Ad-hoc    
    
Tester la connexion vers tous les clients distants :    
    
>`ansible -i hosts all -m ping`    
    
Récupérer toutes les informations de la machine distante :    
    
>`ansible -i hosts all -m setup`    
    
Retirer les users du fichier hosts, et indiquer le user dans les commandes :    
    
>`Fichier hosts : root_local ansible_connection=local`    
    
    
>`Commande : ansible -i hosts all -m ping -u root`    
    
Copier un fichier de votre machine vers le répertoire personnel de usera sur la machine distante :    
    
>`ansible -i hosts all -m copy -a "src=./fichier_test dest=~/fichier_test`    
    
Exécuter la commande `ls` pour vérifier :    
    
>`ansible -i hosts all -m command -a "ls ~/fichier_test`    
    
Copier le fichier dans `/var/log` :    
    
>`ansible -i hosts all -m copy -a "src=./fichier_test dest=/var/log/fichier_test` : Cette commande retourne une erreur de permission.    
    
Faire le nécessaire pour que la commande réussisse :    
    
>`ansible -i hosts all -m copy -a "src=./fichier_test dest=/var/log/fichier_test -bK` : Ajout de l'option `bK` pour passer la commande en sudo    
    
Installer le paquet `httpd` :    
    
>`ansible -i hosts all -m yum -a "name=httpd status=present" -u usera -bK`    
    
Installer le paquet `emacs`, mais en mettant à jour les repos en premier :    
    
>`ansible -i hosts all -m yum -a "name=emacs status=latest update_cache=yes" -u usera -bK`    
    
Vérifier que les deux paquets sont installés avec le module `command` :    
    
>`ansible -i hosts all -m command -a "yum list installed | httpd emacs` : Le pipe n'a pas le même usage qu'en bash. Ici, il appelle un plugin `grep` qui va chercher ce qui suit.    
    
Copier un fichier index.html sur les machines vers `/var/www/html` :    
    
>`ansible -i hosts all -m copy -a "src=index.html dest=/var/www/html" -u usera -bK`    
    
Redémarrer le service `httpd` :    
    
>`ansible -i hosts all -m service -a "name=httpd state=restarted" -u usera -bK`    
    
Tester en accédant à la machine dans le navigateur :    
Il est possible qu'il y ai un problème à cette étape. Si le navigateur redirige automatiquement vers l'URL https, stopper le service `firewalld`    
    
>`ansible -i hosts all -m service -a "name=firewalld state=stopped" -u usera -bK`    
    
Si c'est OK, désinstaller le paquet `httpd` :    
    
>`ansible -i hosts all -m yum -a "name=httpd state=absent" -u usera -bK`    
    
    
Modifier le fichier hosts, en créant deux groupes :    
```yaml    
[Grp1]    
node1 ansible_ssh_host=192.168.2.1    
node2 ansible_ssh_host=192.168.2.2    
    
[Grp2]    
node3 ansible_ssh_host=192.168.2.3    
node4 ansible_ssh_host=192.168.2.4    
```    
    
Tester la connexion au groupe `Grp1` :    
    
>`ansible -i hosts Grp1 -m ping`    
    
Désinstaller `emacs` sur les machines du groupe `Grp2` :    
    
>`ansible -i hosts Grp2 -m yum -a "name=emacs state=absent" -u usera -bK`    
    
Vérifier que `emacs` est bien désinstallé :    
    
>`ansible -i hosts all -m command -a "yum list installed | emacs`    
    
    
<hr>    
    
### Playbook    
    
#### Gather_facts & conditions    
    
Ecrire un premier playbook s'exécutant sur le groupe `Grp1`,    
Désactiver la collecte automatique des facts,    
Ecrire une première tâche qui vous affiche la liste des paquets upgradable,    
Ajouter une tâche qui vérifie la connexion aux hôtes,    
Ajouter une tâche de collecte des facts et une deuxième pour les afficher,    
Installer le paquet `httpd`.    
Si l'installation est OK, démarrer le service `httpd`.    
    
```yaml    
---    
name: "Premier playbook - Gather_facts à no, yum upgradable, ping, gather_facts manuel, installation httpd, et start httpd"    
  hosts: Grp1    
  gather_facts: no    
  become: yes    
  tasks:    
    - name: "Récupérer la liste des paquets upgradables"    
      yum:    
        list: updates    
      register: yumupdates    
    - name: "Affichage des paquets upgradables"    
      debug:    
        msg: "{{ yumupdates['results'] }}"    
    - name: "Ping"    
      ping:    
    - name: "Récupération facts"    
      setup:    
      register: facts    
    - name: "Affichage facts"    
      debug:    
        msg: "{{ facts }}"    
    - name: "Installation httpd"    
      yum:    
        name: httpd    
        update_cache: yes    
        present: latest    
      register: installhttpd    
    - name: "Start httpd si install OK"    
      service:    
        name: httpd    
        state: started    
      when: installhttpd.changed    
...    
```    
    
#### Vars prompt & conditions    
    
Ecrire un playbook demandant à l'utilisateur son nom, et son domaine d'expertise (DevOps ou autre).    
Si le domaine d'expertise est DevOps, afficher le message "Bienvenue <nom>".    
Si le domaine d'expertise est "autre", afficher le message "Bye <nom>".    
    
```yaml    
- name "Prompt utilisateur"    
  hosts: Gp1    
  become: yes    
  vars_prompt:    
    - name: nom    
      prompt: "Votre nom "    
      private: no    
    - name: exp    
      prompt: "Votre domaine d'expertise (DevOps/autre) "    
      private: no    
  tasks:    
    - name:    
      debug:    
        msg: "Bienvenue {{ nom }}"    
      when exp == "DevOps"    
    - name:    
      debug:    
        msg: "Bye {{ nom }}"    
      when exp != "DevOps"    
```    
    
#### Boucles (Installation paquets, création groupes, création utilisateurs)    
    
Ecrire un playbook avec des boucles.    
La première pour installer les paquets suivants : python3, python3-setuptools, python3-pip, python3-mysql.    
La deuxième pour créer les groupes suivants : orsys, alten, ansible.    
La troisième pour créer les utilisateurs suivant : user1, user2, user3.    
Durant la troisième tâche, ajouter les groupes suivant en tant que groupes secondaires : orsys & alten.    
    
```yaml    
#fichier : playbook_loop.yml    
---    
- name: "Boucles"    
  hosts: precedent    
  become: yes    
  tasks:    
    - name: "Installation des paquets"    
      yum:    
        name: "{{ item }}"    
        state: latest    
      loop:    
        - python3    
        - python3-setuptools    
        - python3-pip    
        - python3-mysql    
    - name: "Vérification de l'existance des groupes"    
      group:    
        name: "{{ item }}"    
        state: present    
      loop:    
        - orsys    
        - alten    
        - ansible    
    - name: "Vérification utilisateurs et groupes"    
      user:    
        name: "{{ item }}"    
        state: present    
        group: ansible    
        groups: orsys,alten    
      loop:    
        - user1    
        - user2    
        - user3    
    
...    
    
ansible-playbook -i hosts -u usera -K playbook_loop.yml    
```    
    
A présent, créer les 3 fichiers suivants : packages.yaml, groupes.yaml, users.yaml.    
Ces fichiers doivent contenir chacun la liste des items correspondant selon l'exercice précédent.    
    
```yaml    
#packages.yaml    
    
- packages:    
  - python3    
  - python3-setuptools    
  - python3-pip    
  - python3-mysql    
    
#groupes.yaml    
    
- groupes:    
  - g1    
  - g2    
  - g3    
    
#users.yaml    
    
- users:    
  - orsys    
  - alten    
  - stan    
```    
    
Créer 2 fichiers reprenant les tâches `packages` et `groupes`, et etiqueter les tâches :    
    
```yaml    
#packages    
    
- name: "Installation des paquets"    
  yum:    
    name: "{{ item }}"    
    state: latest    
  with_items:    
    - "{{ packages }}"    
  tags:    
    - packages    
    
#groupes    
    
- name: "Vérification de l'existance des groupes"    
  group:    
    name: "{{ item }}"    
    state: present    
  with_items:    
    - "{{ groupes }}"    
  tags:    
    - groupes    
```    
    
Réécrire le playbook en utilisant la balise `vars_files`    
Réécrire le playbook en utilisant les balises `include_tasks`    
  
```yaml    
---    
- name: "Boucle avec vars_files"    
  hosts: precedent    
  become: yes    
  vars_files:    
    - "var/packages.yaml"    
    - "var/groupes.yaml"    
    - "var/users.yaml"    
  tasks:    
    - name: "Installation des paquets"    
      include_tasks: tasks/packages.yaml    
    - name: "Vérification de l'existance des groupes"    
      include_tasks: tasks/groupes.yaml    
    - name: "Vérification utilisateurs et groupes"    
      user:    
        name: "{{ item }}"    
        state: present    
        group: ansible    
        groups: orsys,alten    
      with_items:    
        - "{{ users }}"    
      tags:    
        - users    
...    
    
```    
    
Exécuter uniquement les tâches `packages` et `groupes` :    
    
    
>`ansible -i hosts -u usera -K playbook_loop.yaml --tag "packages,groupes"`    
    
    
    
#### Rôles    
    
Créer l'arborescence pour l'utilisation d'un rôle :    
    
>`mkdir -p ~/ansible/roles/motd/default ~/ansible/roles/motd/tasks`    
    
Créer un fichier main.yml sous le dossier task, contenant une tâche permettant de copier un fichier `motd` sous `/etc/motd` :    
    
```yaml    
---    
    
- name: "Copie du fichier motd"    
  copy:    
    src: motd    
    dest: /etc/motd    
    
...    
```    
    
Créer un dossier files sous le dossier motd et y ajouter un fichier motd avec un message d'accueil.    
    
Créer un playbook dans le dossier parent de rôles, contenant l'appel au rôle :    
    
```yaml    
- name: "Modification motd"    
  roles:    
    - motd    
```    
    
Exécuter le playbook :    
    
>`ansible-playbook -i hosts -u usera -K playbook_motd.yml`    
    
    
    
#### Ansible-galaxy    
    
Aller sur le site [galaxy.ansible.com] et télécharger le rôle `katmai.influxdb`.    
Pour cela, copier la ligne de code présente sur le site et l'exécuter sur le terminal.    
Ajouter la mention du rôle `katmai.influxdb` dans le playbook `motd` précédent.    
Une fois le playbook exécuté, vérifier que le service `influxdb` est bien lancé sur la machine cible.    
