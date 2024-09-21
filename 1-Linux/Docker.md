# Docker  

## Installation de Docker  

```shell
apt-get update
apt-get install ca-certificates curl gnupg lsb-release -y
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
```

## Manipulation de conteneurs et d'images  

### Lister les images en local  

`docker image build -t polaris4759/gsd:first-ctr .`  

### Voir les images disponible localement  

`docker image ls`  

### Connexion à Docker Hub  

`docker login`

### Pousser l'image sur Docker Hub  

`docker image push polaris4759/gsd:first-ctr`  

### Effacer une image en local  

`docker image rm polaris4759/gsd:first-ctr`  

### Ouvrir une image depuis Docker Hub de façon détachée  

`docker container run -d --name webGSD -p 8000:8080 polaris4759/gsd:first-ctr`  

La commande va vérifier si l'image est présente en local, et si ce n'est pas le cas, la récupérer sur Docker Hub.  

### Lister les conteneurs disponibles  

`docker container ls -a`  

### Stoper un conteneur  

`docker container stop webGSD`  

### Démarrer un conteneur  

`docker container start webGSD`  

### Lister les conteneurs démarrés  

`docker ps -a`  

### Supprimer un conteneur  

`docker container rm webGSD`  

### Démarrer un conteneur attaché au terminal  

`docker container run -it --name test alpine sh`  

Après cette commande, on se trouve dans le terminal.  
Avec un `exit`, on retourne à notre shell initial et on kill le conteneur.  
Avec un `Ctrl+P+Q`, on retourne à notre shell initial, mais le conteneur est toujours vivant.  
On peut le kill avec la commande `docker container rm test -f`  

## Docker Swarm  

### Initialisation du Swarm  

`docker swarm init --advertise-addr=<IPAddr>`  

### Ajouter un manager  

`docker swarm join-token manager`  

Cette commande va retourner une commande a passer sur les autres machines devant être "manager".  

### Ajouter un worker  

`docker swarm join-token worker`  

Idem, cette commande va retourner une commande a passer sur les autres machines devant être "worker".  

### Vérifier les managers/workers présents  

`docker node ls`  

### Créer un service  

`docker service create --name web -p 8080:8080 replicas 3 polaris4759/gsd:first-ctr`  

### Lister les services  

`docker service ps <service_name>`  

### Dupliquer un service  

`docker service scale <service_name>=<X>` : Va créer `X` conteneur du service `<service_name>`  

Après avoir passer cette commande, `X` conteneurs vont apparaître. Si on en supprime, ils vont se recréer automatiquement.  

### Utilisation d'un fichier de déclaration YAML  

Fichier YAML `docker-compose.yml` : 

```yaml
version: "3.8"
services:
  web-fe:
    image: polaris4759/gsd:swarm-stack
    command: python app.py
    deploy:
      replicas: 10
    ports:
      - target: 8080
        published: 5000
    networks:
      - counter-net
    volumes:
      - type: volume
        source: counter-vol
        target: /code
  redis:
    image: "redis:alpine"
    networks:
      counter-net:

networks:
  counter-net:

volumes:
  counter-vol:
```

Déploiement du stack :  
`docker stack deploy -c docker-compose.yml <name>`  

Lister les stacks :  
`docker stack ls`  

Lister les services :  
`docker stack services <name>`  

Lister les conteneurs :  
`docker stack ps <name>`  

### Modification de la configuration  

`vim docker-compose.yml`, puis redéploiement du stack `docker stack deploy -c docker-compose.yml <name>`  
