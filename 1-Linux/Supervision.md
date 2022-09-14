#  Installation de Prometheus  
Liste de commandes pour installer Prometheus :  
  
```shell  
# Ajout groupe et utilisateur prometheus  
groupadd --system prometheus  
useradd -s /sbin/nologin --system -g prometheus prometheus  
# Installation Prometheus  
mkdir /var/lib/prometheus  
for i in rules rules.d files_sd; do sudo mkdir -p /etc/prometheus/${i}; done  
apt-get update && apt-get -y install wget curl  
mkdir -p /tmp/prometheus && cd $_  
curl -s https://api.github.com/repos/prometheus/prometheus/releases/latest | grep browser_download_url|grep linux-amd64|cut -d '"' -f 4|wget -qi -  
tar xvf prometheus*.tar.gz  
cd prometheus*/  
mv prometheus promtool /usr/local/bin/  
mv prometheus.yml  /etc/prometheus/prometheus.yml  
mv consoles/ console_libraries/ /etc/prometheus/  
cd  
rm -rf /tmp/prometheus  
# Vérification de la configuration  
cat /etc/prometheus/prometheus.yml  
# Création d'un service prometheus.service  
vim /etc/systemd/system/prometheus.service  
```  
```shell  
# Contenu du fichier prometheus.service  
[Unit]  
Description=Prometheus  
Documentation=https://prometheus.io/docs/introduction/overview/  
Wants=network-online.target  
After=network-online.target  
  
[Service]  
Type=simple  
User=prometheus  
Group=prometheus  
ExecReload=/bin/kill -HUP $MAINPID  
ExecStart=/usr/local/bin/prometheus \  
--config.file=/etc/prometheus/prometheus.yml \  
--storage.tsdb.path=/var/lib/prometheus \  
--web.console.templates=/etc/prometheus/consoles \  
--web.console.libraries=/etc/prometheus/console_libraries \  
--web.listen-address=0.0.0.0:9090 \  
--web.external-url=  
  
SyslogIdentifier=prometheus  
Restart=always  
  
[Install]  
WantedBy=multi-user.target  
```  
  
```shell  
# Attribution des droits  
for i in rules rules.d files_sd; do sudo chown -R prometheus:prometheus /etc/prometheus/${i}; done  
for i in rules rules.d files_sd; do sudo chmod -R 775 /etc/prometheus/${i}; done  
chown -R prometheus:prometheus /var/lib/prometheus/  
# Démarrage des services  
systemctl daemon-reload  
systemctl start prometheus  
systemctl enable prometheus  
systemctl status prometheus  
```  
  
Accès : `<IP>:9090`  
  
Source : https://computingforgeeks.com/how-to-install-prometheus-and-node-exporter-on-debian/  
  
#  Instalation de Node Exporter  
  
```shell  
# Installation de Node Exporter  
curl -s https://api.github.com/repos/prometheus/node_exporter/releases/latest| grep browser_download_url|grep linux-amd64|cut -d '"' -f 4|wget -qi -  
tar -xvf node_exporter*.tar.gz  
cd  node_exporter*/  
cp node_exporter /usr/local/bin  
# Vérification de la version  
node_exporter --version  
# Création du service node_exporter.service  
vim /etc/systemd/system/node_exporter.service  
```  
  
```shell  
# Contenu du fichier node_exporter.service  
[Unit]  
Description=Node Exporter  
Wants=network-online.target  
After=network-online.target  
  
[Service]  
User=prometheus  
ExecStart=/usr/local/bin/node_exporter  
  
[Install]  
WantedBy=default.target  
```  
  
```shell  
# Démarrage des services  
systemctl daemon-reload  
systemctl start node_exporter  
systemctl enable node_exporter  
systemctl status node_exporter.service  
# Création d'un job de récupération des métriques  
vim /etc/prometheus/prometheus.yml  
```  
  
```yaml  
# Contenu du fichier prometheus.yml  
scrape_configs:  
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.  
  - job_name: "prometheus"  
    static_configs:  
      - targets: ["localhost:9090"]  
  - job_name: 'node_exporter'  
    static_configs:  
      - targets: ['localhost:9100']  
      sudo systemctl restart prometheus  
```  
  
Accès : `<IP>:9100`  
  
Source : https://computingforgeeks.com/how-to-install-prometheus-and-node-exporter-on-debian/  
  
#  Installation de Windows Exporter  
  
Sur la page https://github.com/prometheus-community/windows_exporter/releases, télécharger le fichier MSI adapté et le lancer  
  
Accès : `<IP>:9182`  
  
#  Installation de AlertManager  
  
```shell  
# Installation de AlertManager  
cd /tmp  
curl -s https://api.github.com/repos/prometheus/alertmanager/releases/latest | grep browser_download_url|grep linux-amd64|cut -d '"' -f 4|wget -qi -  
tar xzf alertmanager-*.linux-amd64.tar.gz  
mkdir -p /etc/prometheus/alertmanager  
mv -v alertmanager-*.linux-amd64 /etc/prometheus/alertmanager  
# Attribution des droits  
chown -Rfv root:root /etc/prometheus/alertmanager  
mkdir -v /etc/prometheus/alertmanager/data  
chown -Rfv prometheus:prometheus /etc/prometheus/alertmanager/data  
# Création du service alertmanager.service  
vim /etc/systemd/system/alertmanager.service  
```  
  
```shell  
# Contenu du fichier alertmanager.service  
[Unit]  
Description=Alertmanager for prometheus  
  
[Service]  
Restart=always  
User=prometheus  
ExecStart=/etc/prometheus/alertmanager/alertmanager --config.file=/etc/prometheus/alertmanager/alertmanager.yml --storage.path=/etc/prometheus/alertmanager/data
ExecReload=/bin/kill -HUP $MAINPID  
TimeoutStopSec=20s  
SendSIGKILL=no  
  
[Install]  
WantedBy=multi-user.target  
systemctl daemon-reload  
systemctl start alertmanager.service  
systemctl enable alertmanager.service  
systemctl status alertmanager.service  
```  
  
```yaml  
# Ajout du job de récolte alertmanager  
vim /etc/prometheus/prometheus.yml  
- job_name: 'alertmanager'  
  static_configs:  
  - targets: ['192.168.20.161:9093']  
```  
  
```shell  
# Prise en compte de la modification  
systemctl restart prometheus.service  
# Ajout d'une règle  
vim /etc/prometheus/rules.yml  
```  
  
```yaml  
# Contenu du fichier rules  
groups:  
 - name: test  
   rules:  
   - alert: InstanceDown  
     expr: up == 0  
     for: 1m  
```  
  
```shell  
# Ajout de la règle dans le fichier prometheus.yml  
vim /etc/prometheus/prometheus.yml  
systemctl restart prometheus.service  
```  
  
  
#  Installation de Grafana  
  
## Installation  
Liste de commande pour installer Grafana :  
  
```shell  
# Installation de Grafana  
apt-get install apt-transport-https software-properties-common  
wget -O - https://packages.grafana.com/gpg.key | sudo apt-key add -  
add-apt-repository "deb https://packages.grafana.com/enterprise/deb stable main"  
apt-get update  
apt-get install grafana-enterprise  
/bin/systemctl start grafana-server  
```  
  
Accès : `<IP>:3000`  
  
Source : https://www.hostwinds.fr/tutorials/how-to-install-grafana-debian-ubuntu  
  
## Configuration d'un dashboard Grafana avec Prometheus et Node Exporter :  
  
`Configuration` > `Data sources`, puis bouton `Add data source`, et `Prometheus`  
URL de Prometheus dans `URL`  
`Basic auth` activé  
Renseignez les champs `User` et `Password`  
`Create` > `Import` > `1860` pour le dashboard "Node Exporter Full"  
  
# Installation Alerta  

```shell
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
```