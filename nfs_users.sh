#!/bin/bash

echo 'Suppression utilisateurs, groupes, dossiers /home'

groupdel Comptabilite
groupdel Scolarite
groupdel Secretariat
groupdel Direction

rm -rf /home/*

groupadd -g 2100 Comptabilite
groupadd -g 2200 Scolarite
groupadd -g 2300 Secretariat
groupadd -g 2400 Direction

mkdir /home/share

mkdir /home/share/scolarite
chown root:Scolarite /home/share/scolarite
chmod 775 /home/share/scolarite

mkdir /home/share/comptabilite
chown root:Comptabilite /home/share/comptabilite 
chmod 775 /home/share/comptabilite

mkdir /home/share/reporting
chown root:Secretariat /home/share/reporting 
chmod 775 /home/share/reporting