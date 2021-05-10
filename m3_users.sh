#!/bin/bash

echo 'Suppression utilisateurs, groupes, dossiers /home'

userdel lucie

groupdel Comptabilite
groupdel Scolarite
groupdel Secretariat

rm -rf /home/*

groupadd -g 2100 Comptabilite
groupadd -g 2200 Scolarite
groupadd -g 2300 Secretariat

mkdir /home/scolarite
chown root:Scolarite /home/scolarite
mkdir /home/comptabilite
chown root:Comptabilite /home/comptabilite
chmod 775 /home/*

useradd -d /home/lucie -s /bin/bash -g 2300 -m -u 2301 lucie
echo 'Creation utilisateur : lucie'
echo lucie:luc123 | chpasswd
#passwd lucie

chmod 700 /home/lucie

mkdir /home/lucie/reporting
chown lucie:Secretariat /home/lucie/reporting
chmod 770 /home/lucie/reporting
