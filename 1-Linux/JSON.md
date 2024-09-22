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

### Lister les clés dans un objet  

```shell
cat <fichier> | jq -r '.<objet>[] | keys'
```

### Récupérer la valeur d'une clé  

```shell
cat <fichier> | jq -r '.<objet>[<index>].<clé>
```

### Récupérer la valeur d'une clé faisant partie d'un ensemble répondant à des critères spécfique  

*Exemple avec les codecs d'une vidéo MKV*  

```shell
ffprobe -v quiet -print_format json -show_format -show_streams <fichier> | jq '.streams[] | select(.codec_type=="audio") | .codec_name'
```
