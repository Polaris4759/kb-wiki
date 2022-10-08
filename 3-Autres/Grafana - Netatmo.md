# Grafana - Netatmo  

## Prérequis  

 - InfluxDB  
`sudo pip install influxdb`  

 - lnetatmo  
`sudo pip install --upgrade lnetatmo==1.6.0`  

## Téléchargement d'un script python  

Télécharger le script python :  
```shell
cd /tmp
wget https://raw.githubusercontent.com/Polaris4759/kb-wiki/master/3-Autres/src/netatmo_influx.py
sudo mv netatmo_influx.py /usr/local/bin
sudo chmod 755 /usr/local/bin/netatmo_influx.py
```

Il faut créer une API sur le site [développeur de Netatmo](https://dev.netatmo.com/apps/createanapp#form), récupérer les valeurs de "CLIENT_ID" & "CLIENT_SECRET", et les ajouter dans le script. Valoriser également les variables "USERNAME" et "PASSWORD".  

## Création d'un cron pour mettre les données à jour  

```shell
sudo crontab -l > /tmp/netatmo_crontab
echo "*/5 * * * * /usr/local/bin/netatmo_influx.py > /dev/null 2>&1" >> /tmp/netatmo_crontab
sudo crontab /tmp/netatmo_crontab
```

## Ajout dans Grafana  

### Création d'une database InfluxDB  

 - URL : `http://<IP>:8086`  
 - Database : `netatmo`  

### Import du dashboard Grafana  

 - Code : `12378`  