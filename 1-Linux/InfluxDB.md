# InfluxDB  

## Connexion à InfluxDB  

`influx -precision rfc3339`  

## Lister les bases de données  

`show databases`  

## Se connecter à une base  

`use <database>`  

## Lister les mesures (Tables)  

`show measurements`  

## Afficher une mesure spécifique  

`SELECT * FROM <measurement>`  
`SELECT * FROM <measurement> WHERE <column> = '<value>'`  
`SELECT * FROM <measurement> WHERE <column> =~ /<value>/`  

## Lancement d'une commande InfluxDB depuis le shell  

`influx -execute 'SELECT * FROM <measurement>' -database <database> -precision rfc3339`  