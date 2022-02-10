# Windows 11
  
## Remettre la barre d'outil Windows 10 en haut de l'explorateur de fichier  

Dans un terminal Windows en tant qu'admin :  

`reg add "HKCU\Software\Classes\CLSID\{d93ed569-3b3e-4bff-8355-3c44f6a52bb5}\InprocServer32" /f /ve`
Puis redémarrer l'exlorer.exe

Pour revenir à la barre d'outil Windows 11 :  

`reg delete "HKCU\Software\Classes\CLSID\{d93ed569-3b3e-4bff-8355-3c44f6a52bb5}" /f`  
Puis redémarrer l'exlorer.exe

## Changer le menu contextuel pour avoir celui complet par défaut :  

Dans un terminal Windows en tant qu'admin : 

`reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve`  
Puis redémarrer l'exlorer.exe

Pour revenir en arrière : 

`reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f`  
Puis redémarrer l'exlorer.exe

## Redémarrer l'explorer.exe  
Dans un terminal, lancer les commandes suivantes : 
  ```console
  taskkill /f /IM explorer.exe
  start explorer.exe
  ```
