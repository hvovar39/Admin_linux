#!/bin/bash

echo 'Suppression utilisateurs, groupes, dossiers /home'

userdel didier

groupdel Direction
groupdel Secretariat

rm -rf /home/*

groupadd -g 2400 Direction
groupadd -g 2300 Secretariat
useradd -d /home/didier -s /bin/bash -g 2400 -m -u 2401 didier
echo 'Creation utilisateur : didier'
echo didier:did123 | chpasswd
#passwd didier

chmod 700 /home/*

mkdir /home/didier/reporting
chown root:Secretariat /home/didier/reporting
chmod 775 /home/didier/reporting