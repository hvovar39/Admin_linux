#!/bin/bash

sudo apt-get update
sudo apt-get -y install links
sudo DEBIAN_FRONTEND="noninteractive" apt-get install -y mysql-server-5.7
mysql_secure_installation
sudo apt-get -y install apache2
sudo apt-get -y install php5
sudo apt-get -y install php5-mysql

sudo cat > /var/www/html/index.html << EOF
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
<title>Saint-Potache</title>
</head>
<body>
<h3>Base de données utilisateurs</h3>
<form action="reponse.php" method="post">
Chercher les utilisateurs dont :
<ul>
<li>
<li>lâge maximal est <input type="text" name="age"/></li>
</li>
</ul>
<input type="submit" value="Rechercher"/>
</body>
</html>
EOF

sudo cat > /var/www/html/reponse.php << EOF
<?php
\$conn=mysqli_connect('127.0.0.1','root','root');
if (!\$conn)
{
die ('Ne peut pas se connecter');
}
mysqli_select_db(\$conn,'ETUDIANT');
\$age_min=\$_POST['age'];
\$requete='SELECT nom,Utilisateurs.prenom,age FROM Utilisateurs, Informations WHERE Utilisateurs.id_users = Informations.id_medic AND age > '.\$age_min.';';
\$resultats=mysqli_query(\$conn,\$requete);
while ( \$personne = mysqli_fetch_assoc(\$resultats))
{
echo "Patient ".\$personne['prenom']." ".\$personne[nom].": ";
echo "son age est ".\$personne['age'];
echo "<br />";
}
mysqli_close(\$conn);
?>
EOF

sudo /etc/init.d/mysql start
sudo /etc/init.d/apache2 start

sudo mysql -u root -proot -e "CREATE DATABASE ETUDIANT;"

sudo cat > db.sql << EOF
CREATE TABLE Utilisateurs(
id_users int(15) NOT NULL AUTO_INCREMENT,
nom varchar(15) NOT NULL,
prenom varchar(50) NOT NULL,
login varchar(50) NOT NULL,
password varchar(500) NOT NULL,
PRIMARY KEY (id_users)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

CREATE TABLE Informations (
id_medic int(15) NOT NULL AUTO_INCREMENT,
prenom varchar(50) NOT NULL,
age int(20) NOT NULL,
poids int(20) NOT NULL,
PRIMARY KEY (id_medic)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

INSERT INTO Utilisateurs (id_users, nom, prenom, login, password) VALUES
(1,'BIDOCHON','Robert','rob_le_ouf','mdrlol'),
(2,'YAU','Tatiana','tatayoyo','mdrlol'),
(3,'OURSON','Winnie','ton_ami','mdrlol'),
(4,'DUPONT','Pierre','pierrot75','mdrlol');

INSERT INTO Informations (id_medic, prenom, age, poids) VALUES
(1,'BIDOCHON',34,100),
(2,'YAU',47,60),
(3,'OURSON',20,110),
(4,'DUPONT',4,20);
EOF

mysql -u root -proot ETUDIANT < db.sql

sudo /etc/init.d/mysql restart
sudo /etc/init.d/apache2 restart