# JSON  

## Récupérer des informations dans un fichier JSON  

### Commande de base  

```shell
cat <fichier> | jq
```

### Lister les clés  

```shell
cat <fichier> | jq -r 'keys | .[]'
```

### Lister les clés dans une clé  

```shell
cat <fichier> | jq -r '.<clé>[] | keys'
```

### Récupérer la valeur d'une clé  

```shell
cat <fichier> | jq -r '.<clé>[<index>].<clé>
```
