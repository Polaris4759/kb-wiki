# Windows 11
  
## Remettre le ruban Windows 10 en haut de l'explorateur de fichier  

Dans un terminal Windows en tant qu'admin :  

```Batchfile
reg add "HKCU\Software\Classes\CLSID\{d93ed569-3b3e-4bff-8355-3c44f6a52bb5}\InprocServer32" /f /ve
```
Puis redémarrer l'exlorer.exe

Pour revenir au ruban Windows 11 :  

```Batchfile
reg delete "HKCU\Software\Classes\CLSID\{d93ed569-3b3e-4bff-8355-3c44f6a52bb5}" /f
```  
Puis redémarrer l'exlorer.exe


Si cette méthode ne fonctionne pas, tester celle-ci :  

1. Ouvrir un cmd en tant qu'admin  
2. Passer la commande suivante :  
**fsutil hardlink list c:\windows\explorer.exe**  
Cette commande va lister les exécutables d'explorateurs de fichiers disponibles  
3. Ouvrir ensuite l'éditeur de registre et se rendre au chemin suivant :  
**HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon**  
4. Modifier la clé "Shell" et y copier le chemin récupéré à l'étape 2, précédé de "C:"  



## Changer le menu contextuel pour avoir celui complet par défaut :  

Dans un terminal Windows en tant qu'admin : 

```Batchfile
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
```  
Puis redémarrer l'exlorer.exe

Pour revenir en arrière : 

```Batchfile
reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f
```  
Puis redémarrer l'exlorer.exe

## Redémarrer l'explorer.exe  
Dans un terminal, lancer les commandes suivantes : 
  ```Batchfile
  taskkill /f /IM explorer.exe
  start explorer.exe
  ```
