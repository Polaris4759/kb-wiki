# Grafana - Netatmo  

## Prérequis  

 - InfluxDB  
`pip install influxdb`  

 - lnetatmo
`pip install --upgrade lnetatmo==1.6.0`  

## Téléchargement d'un script python  

Télécharger le script python :  
```shell
cd /tmp
wget https://raw.githubusercontent.com/Polaris4759/kb-wiki/master/3-Autres/src/netatmo_influx.py
sudo mv netatmo_influx.py /usr/local/bin
```

Après l'avoir déplacé dans un dossier adequat, création d'un cron pour mettre les données à jour  

```shell
sudo crontab -l > /tmp/netatmo_crontab
echo "*/5 * * * * root  /usr/local/bin/netatmo_influx.py > /dev/null 2>&1" >> /tmp/netatmo_crontab
sudo crontab /tmp/netatmo_crontab
```
