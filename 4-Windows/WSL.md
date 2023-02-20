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
