# TP1  
  
Soit les 3 machines, A, B, et C, ayant pour adresse :  
  
> A: 192.168.0.133 /25  
B: 192.168.0.200 /27  
C: 192.168.0.220 /26  
  
1. Donner l'adresse réseau de chaque machine et idiquez la valeur du masque de sous-réseau sous la forme décimal.  
2. Combien de machines exite t-il dans le réseau de la machine A et B?  
  
---  
   
1.   
  
**A.**    
192.168.0.133 /25      
**11000000.10101000.00000000.1**0000101    
  
> Adresse réseau : 192.168.0.128    
Masque : 255.255.255.128    
  
**B.**    
192.168.0.200 /27    
**11000000.10101000.00000000.110**00101    
  
> Adresse réseau : 192.168.0.192    
Masque : 255.255.255.224    
  
**C.**    
192.168.0.220 /26    
**11000000.10101000.00000000.11**011100    
  
> Adresse réseau : 192.168.0.192    
Masque : 255.255.255.192    
  
2.  
  
**A.** : 2^7^ - 2 = 126    
**B.** : 2^5^ - 2 = 30    
**C.** : 2^6^ - 2 = 62    
  
---  
  
---  
  
# TP2  
  
L'adresse réseau de votre organisme est 150.193.0.0  
  
Vous avez besoin de 50 sous-réseaux. Chaque sous-réseau comporte 750 hôtes.  
  
1. Quelle est la classe d'adresse ?  
2. Quel est le masque par défaut ?  
3. Combien de bits faut-il emprunter à la partie hôte de l'adresse réseau pour créer au moins 50 sous-réseaux ayant chacun au moins 750 hôtes ?  
4. Quel sera le masque de sous-réseau ?  
5. Donnez, pour les 4 premiers sous réseaux, la plage des adresses machines et l'adresse de broadcast.  
    
---   
    
1. Classe B    
2. 255.255.0.0 *(ou /16 en notation CIDR)*    
3. Il faut emprunter 6 bits.    
4. Le masque de sous-réseau sera 255.255.252.0    
5. Plage d'adresses et broadcast  
  
> **150.193.0.0**    
  
>> 150.193.0.1 => 150.193.3.254    
Broadcast : 150.193.3.255    
    
> **150.193.4.0**    
  
>> 150.193.4.1 => 150.193.7.254    
Broadcast : 150.193.7.255    
    
> **150.193.8.0**    
  
>> 150.193.8.1 => 150.193.11.254    
Broadcast : 150.193.11.255    
    
> **150.193.12.0**    
  
>> 150.193.12.1 => 150.193.15.254    
Broadcast : 150.193.15.255     
  
---  
  
---  
  
