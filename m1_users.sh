#!/bin/bash

echo 'Suppression utilisateurs, groupes, dossiers /home'

userdel robert
userdel tatiana

groupdel Comptabilite
groupdel Scolarite

rm -rf /home/*

groupadd -g 2100 Comptabilite
groupadd -g 2200 Scolarite

useradd -d /home/robert  -s /bin/bash -g 2100 -m -u 2101 robert
echo 'Creation utilisateur : robert'
echo robert:rob123 | chpasswd
#passwd robert

useradd -d /home/tatiana  -s /bin/bash -g 2100 -m -u 2102 tatiana
echo 'Creation utilisateur : tatiana'
echo tatiana:tat123 | chpasswd
#passwd tatiana

chmod 700 /home/*

mkdir /home/comptabilite
mkdir /home/scolarite
chown root:Comptabilite /home/comptabilite
chown root:Scolarite /home/scolarite
chmod 770 /home/comptabilite
chmod 775 /home/scolarite
