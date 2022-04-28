# Powershell    
    
## license  

## Action sur un fichier de type textuel  

### Afficher le contenu d'un fichier  

```powershell
Get-Content -path .\<chemin>\fichier.txt -Raw
```

### Afficher la première ligne d'un fichier  
```powershell
Get-Content .\fichier.txt | Select -First 1
```

### Remplacer une chaine de caractère  

```powershell
# Remplace la chaine1 par la chaine2
(Get-Content .\fichier.txt) -replace 'chaine1','chaine2'
# Remplace la chaine1 par un retour chariot 
(Get-Content .\fichier.txt) -replace 'chaine1','`r`n'
```

### Inscrire le retour d'une commande dans un fichier  
```powershell
[...] | Set-Content fichier.txt
```

### Remplacer une chaine de caractères  

```powershell
# Remplace toto par titi (N'affecte que le texte afficher dans le terminal)
(Get-Content -path .\<chemin>\fichier.txt -Raw) -replace 'toto','titi'
# Remplace toto par titi dans le fichier
(Get-Content -path .\<chemin>\fichier.txt -Raw) -replace 'toto','titi' | Set-Content -Path .\<chemin>\fichier.txt
```
  
## Remplacer une chaine dans une variable  
```powershell
$var2=($var1 -replace 'chaine1','chaine2')
```

## Prompt utilisateur  

```powershell
$var=Read-Host -Prompt "Your input here : "
```

## Supprimer un fichier  

```powershell
Remove-Item -Path .\<chemin>\<fichier>
```

## Changer la date d'un fichier/dossier  
  
>Ceci va lister les options possibles.  
  
```powershell  
Get-Item <fichier> | gm -Name *time  
```  
  
>Ceci va changer la date de création du fichier en mettant la date actuelle.  
  
```powershell  
$a = get-item <fichier>  
$a.CreationTime = (Get-Date)  
```  
  
> Ceci va changer la date de modification du fichier en mettant la date choisie.  
  
```powershell  
$a.LastWriteTime = $(Get-Date "27/06/2020 9:30 pm")  
ou  
$a.LastWriteTime = $(Get-Date "27/06/2020 21:30:20")  
```  
  
## Lister des fichiers selon des critères    
  
### Chercher dans plusieurs emplacmeent    
  
```powershell  
Get-ChildItem -Path Path1, Path2  
```  
  
```powershell  
Get-ChildItem *.txt  
```  
  
### Date de dernière modification    
  
```powershell  
Get-ChildItem | Where-Object {$_.LastWriteTime -lt (Get-Date "26/06/2020")  
```  
  
### Selon la taille    
  
```powershell  
Get-ChildItem | Where-Object {$_.Length -gt 50KB}  
```  
  
### Supprimer les fichiers retournés    
  
```powershell  
<commandes> | Remove-Item -Forse -Recurse -ErrorAction SilentlyContinue  
```  
  
### Agir sur chaque retour de la recherche    
  
```powershell  
Get-ChildItem | Where-Object {$_.LastWriteTime -lt (Get-Date "26/06/2020")} | ForEach-Object{$_.LastWriteTime=$(Get-Date "27/06/2020 9:30 pm")}  
```  
  
## Boucle    
  
### For    
  
> Syntaxe `For` :  
  
```powershell  
for ($i=0;$i -lt 10;$i++){  
    <action>  
}  
```  

> Syntaxe `foreach` : 

```powershell
$file=Get-Content .\fichier.txt
foreach ($line in $file){
    if ($line -like "*%%*") {
        $line | out-file -FilePath .\fichier.txt -Append
        $line2=$line
    }
}
```

## Conditions  

### If  

#### Si un fichier contient une chaine de caractères, on affiche le retour dans un fichier  

```powershell
foreach ($line in $file){
    if ($line -like "*%%*") {
        $line | out-file -FilePath fichier.txt -Append
    }
}
```

#### Si une ligne d'un fichier commence par un caractère  

```powershell
foreach ($line in (Get-Content fichier.txt)) {
    if ($line.StartsWith('e')){
        $line2=$line
    }
}
```
