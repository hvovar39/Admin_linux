#!/bin/bash

echo 'Suppression utilisateurs, groupes, dossiers /home'

userdel marc
userdel salif
userdel georges

groupdel Scolarite

rm -rf /home/*

groupadd -g 2200 Scolarite

mkdir /home/scolarite
chown root:Scolarite /home/scolarite
chmod 770 /home/scolarite

useradd -d /home/scolarite -s /bin/bash -g 2200 -u 2201 marc
echo 'Creation utilisateur : marc'
echo marc:mar123 | chpasswd

useradd -d /home/scolarite -s /bin/bash -g 2200 -u 2202 salif
echo 'Creation utilisateur : salif'
echo salif:sal123 | chpasswd

useradd -d /home/scolarite -s /bin/bash -g 2200 -u 2203 georges
echo 'Creation utilisateur : georges'
echo georges:geo123 | chpasswd

mkdir /home/scolarite/sharing
chown root:Scolarite /home/scolarite/sharing
chmod 770 /home/scolarite/sharing
