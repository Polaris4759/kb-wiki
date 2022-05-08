# Powershell    
    
## license  
  
## Changer la date d'un fichier/dossier  
  
>Ceci va lister les options possibles.  
  
```console  
Get-Item <fichier> | gm -Name *time  
```  
  
>Ceci va changer la date de création du fichier en mettant la date actuelle.  
  
```console  
$a = get-item <fichier>  
$a.CreationTime = (Get-Date)  
```  
  
> Ceci va changer la date de modification du fichier en mettant la date choisie.  
  
```console  
$a.LastWriteTime = $(Get-Date "27/06/2020 9:30 pm")  
ou  
$a.LastWriteTime = $(Get-Date "27/06/2020 21:30:20")  
```  
  
## Lister des fichiers selon des critères    
  
### Chercher dans plusieurs emplacmeent    
  
```console  
Get-ChildItem -Path Path1, Path2  
```  
  
```console  
Get-ChildItem *.txt  
```  
  
### Date de dernière modification    
  
```console  
Get-ChildItem | Where-Object {$_.LastWriteTime -lt (Get-Date "26/06/2020")  
```  
  
### Selon la taille    
  
```console  
Get-ChildItem | Where-Object {$_.Length -gt 50KB}  
```  

### Rechercher un dossier ou un fichier (Find)  

#### Dossier  
```powershell
Get-ChildItem <path> -recurse | Where-Object {$_.PSIsContainer -eq $true -and $_.Name -match "keyword"}  
```

#### Fichier  
```powershell
Get-ChildItem <path> -recurse | Where-Object {$_.Name -match "keyword"}  
```
  
### Supprimer les fichiers retournés    
  
```console  
<commandes> | Remove-Item -Forse -Recurse -ErrorAction SilentlyContinue  
```  
  
### Agir sur chaque retour de la recherche    
  
```console  
Get-ChildItem | Where-Object {$_.LastWriteTime -lt (Get-Date "26/06/2020")} | ForEach-Object{$_.LastWriteTime=$(Get-Date "27/06/2020 9:30 pm")}  
```  

## Boucle    
  
### For    
  
> Syntaxe `For` :  
  
```console  
for ($i=0;$i -lt 10;$i++){  
    <action>  
}  
```  

