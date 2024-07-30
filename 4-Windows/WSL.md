# WSL
*Windows Subsystem for Linux*

## Passer des commandes root sans mot de passe  
```shell
echo "$(whoami) ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$(whoami) && sudo chmod 0440 /etc/sudoers.d/$(whoami)
```

## Monter un disque  

```shell
sudo mkdir /mnt/d
sudo mount -t drvfs D: /mnt/d
```

## Modifier la version par défaut  

Dans Powershell :  

```powershell
#Lister les versions installées  
wsl --list verbose  
```

>```
>PS C:\Windows\system32> wsl --list --verbose
>  NAME            STATE           VERSION
>* Ubuntu          Running         1
>  Ubuntu-22.04    Running         1
>```

```powershell
#Changer la version par défaut  

wsl --set-default <Distribution Name>  
```

>```
>PS C:\Windows\system32> wsl --set-default Ubuntu-22.04
>L’opération a réussi.
>```

*Résultat :*  

```
PS C:\Windows\system32> wsl --list --verbose
  NAME            STATE           VERSION
* Ubuntu-22.04    Running         1
  Ubuntu          Running         1
```
