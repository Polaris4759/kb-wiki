#  FFMPEG    
    
## Réduire la taille d'une vidéo (Dimensions et bitrate)      
    
> `ffmpeg -i "<input>" -vf "scale=1280:720" -b:v 2M "<output>"`    
  
>> `-vf "scale=xx:xx"` : Dimensions    
`-b:v xM` : Bitrate    
    
## Découper une vidéo    
  
> `ffmpeg -i <fichier_input> -ss <timestamp_début> -to <timestamp_fin> -async 1 <fichier_output`    
  
Les timestamps doivent être de la forme suivante : 00:00:00    
  
## Convertir une vidéo en GIF    
  
> `ffmpeg -i <fichier_input> -vf "fps=30,scale=<résolution>:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 <fichier_sortie>`    
  
## Rogner une vidéo    
  
> `ffmpeg -i <fichier_input> -filter:v "crop=t_w:t_h:x:y" <fichier_output>`    
  
>> `t_w` : Largeur    
`t_h` : Hauteur    
`x:y` : Position du coin supérieur gauche    
