# Q.3.1

Le materiel utilisé est un switch, il permet au machine nommé PC de communiquer entte eux au sein du meme reseau local

# Q.3.2

Le materiel utilisé est un routeur, dans notre cas il connecte au réseaux local (10.10.0.0/16) au réseau (10.12.2.0/24) puis à internet 

# Q.3.3

F 0/0 = F pour fast Ethernet
        0 = numéros de la carte dans le routeur
        0 = le numéros de port sur cette carte

G 1/0 = G pour Gigabit Ethernet
        1 = numéros de la carte dans le routeur
        0 = le numéros de port sur cette carte

# Q.3.5

Cette adresse est la passerelle pour le reseau du PC 2. elle represente le routeur B

# Q.3.6

PC 1

pour le reseaux 10.10.0.0/16

on fait 2^16 = 65536 -1
ce qui fait 65535 adresses disponnible

| *-------------*| *-------- |
| adresse reseau | 10.10.0.0 |
| Premiere adresse disponible | 10.10.0.1 |
| Derniere adresse disponible | 10.10.255.254 |
| adresse de diffusion | 10.10.255.255 |


PC 2 

pour le reseau 10.11.0.0/16

on fait 2^16 = 65536 -1
ce qui fait 65535 adresses disponnible

| *-------------*| *-------- |
| adresse reseau | 10.11.0.0 |
| Premiere adresse disponible | 10.11.0.1 |
| Derniere adresse disponible | 10.11.255.254 |
| adresse de diffusion | 10.11.255.255 |


PC 5

pour le reseaux 10.10.0.0/15

32 -15 = 17
on fait 2^17 = 131072 - 1

| *-------------*| *-------- |
| adresse reseau | 10.10.0.0 |
| Premiere adresse disponible | 10.10.0.1 |
| Derniere adresse disponible | 10.11.255.254 |
| adresse de diffusion | 10.11.255.255 |


# Q.3.7

PC 1, PC 3 et PC 4 peuvent communiquer ensemble car il partagent le meme reseau

PC 2 ne peut communiquer que avec PC 5 car l ne fait pas partie des autre reseau

PC 5 peut communiquer avec tout le monde ca plage englobe tout les sous reseaux des autres PC

# Q.3.8

elles pouront toutes acceder au reseaux 172.16.5.0/24 car il y à un routeur mis en place pour ca

# Q.3.9

la Materiel A est un switch donc si on inverse les ports du PC 2 et PC 3 il ne devrait rien se passer

# Q.3.10

si je veux passer dans une configuration dynamique je peut mettre en place un serveur DHCP

# Q.3.11

Adresse MAC source : 00:50:79:66:68:00

il s'agit du PC 1

# Q.3.12

oui elle a réussi car apres les request on retrouve des reply, on abien le cycle question,reponse

# Q.3.13

Request

nom: PC1
IP: 10.10.4.1
Adresse MAC: 00:50:79:66:68:00

Reply
 nom: PC4
 IP: 10.10.4.2
 adresse MAC: 00:50:79:66:68:03

 
 # Q.3.14

dans le paquets numeros 2 on retrouve le protocole ARP, il est utilise pour resoudre les adresses IP en adresses MAC, on cherche l'adresse MAC corespondant pour l'IP 10.10.4.2

# Q.3.16

le PC 3 qui a pour ip 10.10.80.3


# Q.3.17

le protocole encapsuler est le protocole ICMP, dans notre cas il est utilisé pour envoyer les messages d'erreur et les requets diagnostique

# Q.3.18

non la communication a echouer car le messages (Destination unreachable) indique que les paquest ping de 10.10.80.3 à 10.11.80.2 ne sont pas arriver a destination

# Q.3.19

adresse Sources : 10.10.255.254 (adresse du routeur, qui a determiner que la destination est inaccesible)
adresse Destination : 10.10.80.3 (initiateur de la requete)
Protocole utilisé : ICMP
roles du message : Destination unreachable (informe l'emeteur que la destination n'est pas joignable)

# Q.3.20

Le materiel A à transporter les paquets ICMP entres les differents dispositifs du reseau

Le materiel B il est le routeur entre les sous-reseaux 10.10.0.0 et 10.11.0.0

# Q.3.21

PC 4 qui a pour IP 10.10.4.2

R2 qui a pour IP 10.12.2.253

# Q.3.22

PC 4: ca:03:9e:ef:00:38

materiel A: ca:01:da:dé:00:1c

on peut en deduire que la comunication avec le routeur A fonctionne

# Q.3.23

la communication à été capturer au niveau de l'interface du routeur A car on observe que les adresses MAC et IP correspondent au sous-reseau impliqués