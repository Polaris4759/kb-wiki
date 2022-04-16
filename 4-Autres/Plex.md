# Plex

## Extraire la liste des éléments d'une playlist

### Récupérer le X-Plex-Token  
Sur l'application web Plex, ouvrir les informations d'un élément, et cliquer sur "Voir le XML" en bas à droite.  
À la fin de l'URL, le token s'affiche.   
*Par exemple : *
`X-Plex-Token=ESTC7vhbhAqZRjtQf9P6`  

### Lister les playlists et récupérer l'identifiant de la playlist à extraire  
Se rendre sur l'URL suivante, en remplaçant `X-Plex-Token` par le token récupéré juste avant :  
http://plex:32400/playlists?X-Plex-Token=`X-Plex-Token`  

Un XML va s'afficher, une ligne par playlist, commençant ainsi :  
`<Playlist ratingKey="14399" key="[...]`  
Ici, dans ratingKey, on retrouve l'identifiant **14399**  

### Afficher un XML contenant toutes les informations de la playlist  
Se rendre sur l'URL suivante, en remplaçant <X-Plex-Token> et <ID-playlist> : 
http://plex:32400/playlists/<ID-playlist>/items?X-Plex-Token=<X-Plex-Token>  

### Récupérer une information particulière  

Après avoir copié/collé le texte dans un fichier accessible avec un terminal Linux :  

#### Récupérer le titre  
`cat playlist_1 | sed -E 's/title="(.*)/\ntitle=\1/g' | sed 's/"/\n"/g' | grep -E "^title" | sed 's/title=//g' | sort > playlist_1TMP`

#### Récupérer le nom de fichier  
`cat playlist_2 | sed 's/videoProfile//g' | sed 's/audioProfile//g' | sed -E 's/file="(.*)/\nfile=\1/g' | sed 's/"/\n"/g' | grep -E "^file" | sed 's/file=//g' | sort > playlist_2TMP`