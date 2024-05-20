# Q.1.1

on observe que le ping ne fonctionne pas car les deux machines ne partage pas le meme sous-reseau

![](https://github.com/Lucapouilly/Ckekpoint_2/blob/main/ip/first%20ping%20.png)

on ajoute une IP statique au client en 172.16.10.50 par exemple pour que les deux machines partage le meme sous reseau

![](https://github.com/Lucapouilly/Ckekpoint_2/blob/main/ip/Modif%20IP%20%2B%202%20eme%20ping.png)

# Q.1.2

Le ping ne fonctionne pas car il n'y a pas de resolution d'IP par nom

# Q.1.3

Desactivation de l'IPv6
![](https://github.com/Lucapouilly/Ckekpoint_2/blob/main/ip/desac%20IPV6.png)

si je tent un ping via le nom de la machine ca ne fonctionne pas car la configuration du fichier hosts pour resoudre le nom n'est pas effectuer

sur le serveur, dans le fichier qui se trouve dans C:Windows\System32\drivers\etc\hosts j'ajoute 

![](https://github.com/Lucapouilly/Ckekpoint_2/blob/main/ip/ajout%20de%20la%20resolution%20par%20nom.png)

Test ping via le nom

![](https://github.com/Lucapouilly/Ckekpoint_2/blob/main/ip/ping%20via%20nom.png)

# Q.1.4 

sur le client je modifie modifie la configuration pour qu'il contacte le serveur DHCP

![](https://github.com/Lucapouilly/Ckekpoint_2/blob/main/ip/activation%20dhcp%20client.png)

puis on fait
![](https://github.com/Lucapouilly/Ckekpoint_2/blob/main/ip/ip%20renew.png)

# Q.1.5

il ne prend pas cette adresse IP car on peut observer dans le DHCP Manager que la plage de 172.16.10.1 à 172.16.10.19 est exclue de l'attribution


# Q.1.6

sur le DHCP, se rendre sur le DHCP Manager et y ajouter une reservation pour notre client

![](https://github.com/Lucapouilly/Ckekpoint_2/blob/main/ip/Ajout%20de%20la%20plage%20de%20reservation.png)

![](https://github.com/Lucapouilly/Ckekpoint_2/blob/main/ip/new%20ip.png)

# Q.1.7

oui il y a un interet car L'IPv6 fait de l'autoconfiguration 

# Q.1.8
dans l'idée on a plus besoin du DHCP si nous sommes uniquement en IPv6, mais il permet une meilleur gestion des adresses IP donc il n'est pas completemnt inutile, il suffie de configuer les plages, les reservations, les exclusions dans le DHCP Manager mais dans la categorie IPV6
