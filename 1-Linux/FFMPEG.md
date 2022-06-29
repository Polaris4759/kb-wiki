#  FFMPEG    
    
## Réduire la taille d'une vidéo (Dimensions et bitrate)      
    
`ffmpeg -i "<input>" -vf "scale=1280:720" -b:v 2M "<output>"`    
  
`-vf "scale=xx:xx"` : Dimensions    
`-b:v xM` : Bitrate    

## Réduire la taille d'une vidéo & convertir de WMV à MP4 en même temps  

`ffmpeg -i input.wmv -c:v libx264 -crf 23 -c:a aac -q:a 100 -vf "scale=xx:xx" -b:v xM output.mp4`  
    
## Découper une vidéo    
  
`ffmpeg -i <fichier_input> -ss <timestamp_début> -to <timestamp_fin> -async 1 <fichier_output>`    
  
Les timestamps doivent être de la forme suivante : 00:00:00    
  
## Convertir une vidéo en GIF    
  
`ffmpeg -i <fichier_input> -vf "fps=30,scale=<résolution>:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 <fichier_sortie>`    
  
## Rogner une vidéo    
  
`ffmpeg -i <fichier_input> -filter:v "crop=t_w:t_h:x:y" <fichier_output>`    
  
`t_w` : Largeur    
`t_h` : Hauteur    
`x:y` : Position du coin supérieur gauche    

## Ajouter des sous-titre à un fichier .mkv  

`ffmpeg -i input.mkv -sub_charenc 'UTF-8' -f srt -i input.srt -map 0 -map 1:0 "-metadata:s:s:1" "language=en" "-metadata:s:s:1" "title=Eng Full" -c:v copy -c:a copy -c:s srt $output.mkv`  

Cette commande permet d'ajouter un sous-titre `input.srt` au fichier `input.mkv`.
En spécifiant la langue et le nom du sous-titre avec les options `"-metadata:s:s:X" "language=<lang>"` et `"-metadata:s:s:X" "title=<titre>"`.  
Le `X` est un chiffre définissant la position du sous-titre, en partant de 0.  
