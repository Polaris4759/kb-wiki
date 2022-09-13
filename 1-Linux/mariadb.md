# MariaDB  

## Exécution commandes MariaDB  

Les commandes MariaDB peuvent être lancées depuis le shell directement, comme ceci :  
`mariadb -u root -e "<commande>"`  
Ou bien après s'être connecté : 
```shell
\# mariadb -u root
MariaDB [(none)]> <commande>
```

## Commandes utiles  

`SHOW DATABASES;` : Affiche les bases de données  
`SHOW TABLES FROM mysql;` : Affiche les tables de la base de donnée `mysql`
`SHOW FULL TABLES FROM mysql;` : Affiche les tables de la base de donnée `mysql` ainsi que le type de chaque table  
`SELECT * FROM mysql.user;` : Affiche le contenu de la table `user` de la base `mysql`  
`SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root');` : Modifie le mot de passe de `root` en `root`  