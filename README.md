# Projet Administration Linux
## Yann Douailly, Simon Tancev, Antoine Ansari, Hugo Vovard
### Le projet est également téléchargeable via le lien suivant : https://www.swisstransfer.com/d/d92e5e60-a83a-4729-9ead-e6d01d123b52

Ce projet a été réalisé en groupe de 4 sur Marionnet. L’objectif du projet est de réaliser une infrastructure d’entreprise mêlant plusieurs élements communément utilisés.
- VLAN
- DHCP
- DNS
- Firewall
- NFS
- Serveur WEB
- Backup

## Avant de commencer

> Notre projet est composé de différents fichiers
> nous vous avons mis à disposition tous les fichiers.
> Le rapport et les fichiers sont trouvable dans le repository suivant.

Pour lancer notre projet, il vous faut d'abord posséder le logiciel Marionnet.

## Lancement

Une fois le fichier .mar lancé, les machines sont à démarrer dans un ordre particulier :

1. Les switchs, exécuter les commandes suivantes sur le switch 1 :
```	
vlan/create 10
vlan/addport 10 4
port/setvlan 1 10
port/setvlan 2 10
vlan/create 20
vlan/addport 20 4
port/setvlan 3 20
```
2. Le serveur DHCP
3. Le serveur DNS
4. Le pare-feu
5. Le gateway G1
6. Le webGateway
7. Le serveur NFS
8. Les machines m1, 2, 3, 4

## Lancement des scripts

Sur chaque machine m1, m2, m3 et m4, lancez les scripts associés (ex :m1_users.sh) présents dans le dossier /root.
Faites de même sur le serveur NFS, nfs_users.sh.
``` 
./m1_users.sh
./m2_users.sh
./m3_users.sh
./m4_users.sh
./nfs_users.sh
```

## Installation du serveurWeb

Lancer sur votre machine hôte le script SiteWEB_HOST.sh présent dans le repository.

```
./SiteWEB_HOST.sh
```

Vous pouvez ensuite accéder au serveur web via une des machines Marionnet en saisissant l'adresse ip de votre hôte via votre navigateur ou en utilisant la commande links.

## Pour éteindre les machines

Pour éteindre les machines, veuillez tout d'abord utiliser la commande suivante sur le firewall :
```
/bin/bash /etc/fwflush.conf
```

Cela permet d'éviter tout problème d'arrêt de Marionnet.

**Enjoy à l'école Saint-Potache**