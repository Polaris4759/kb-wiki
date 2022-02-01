# Commandes SQLPlus et MySql  
  
---  
  
# Création d'une table  
  
	CREATE TABLE IF NOT EXISTS nom_table(  
		id INT AUTO_INCREMENT PRIMARY KEY,  
		champs1 VARCHAR(255) NOT NULL,  
		champs2 VARCHAR(255)  
	) ENGINE=InnoDB;  
  
# Insérer des valeurs dans une table  
  
	INSERT INTO `table` (`col2`, `col4`, `col3`)  
	VALUES (`val1`, `val2`, `val3`),  
	(`val1`, `val2`, `val3`);  
  
# Afficher des valeurs de plusieurs tables avec une tables d'association  
  
	SELECT nom,prenom,titre FROM `stagiaire`,`cours`,`relation` WHERE stagiaire.id=relation.idstagiaire  
	AND cours.id=relation.idcours AND cours.titre="Linux";  
  
# Insérer des valeurs dans une table  
	  
	INSERT INTO table VALUES (valeur1, valeur2, valeur3);  
  
# Ajouter une colonne  
  
	ALTER TABLE nom\_table ADD nom\_colonne type\_colonne;  
  
# Supprimer une colonne  
  
	ALTER TABLE nom\_table DROP COLUMN nom\_colonne;  
  
# Renommer une colonne  
  
	ALTER TABLE nom\_table CHANGE colonne\_ancien\_nom colonne\_nouveau\_nom type\_donnees  
  
# Compter le nombre de lignes dans une table  
  
	SELECT COUNT(*) FROM <nom_table>;  
  
## Compter le nombre de lignes avec jointure de deux tables  
  
	SELECT COUNT(*) FROM <table1>,<table2> WHERE <table1>.<champ1>='valeur' AND (<table1>.<champ_id>=<table2>.<champ_id_1>);  
  
	SELECT COUNT(*) FROM <table1>,<table2> WHERE <table1>.<champ1>='valeur' AND (<table1>.<champ_id>=<table2>.<champ_id_1> OR <table1>.<champ_id>=<table2>.<champ_id_2>);  
  
# Changer une valeur  
  
	UPDATE nom\_table SET nom\_colonne='nouvelle\_valeur' WHERE id='identifiant'  
  
# Incrémenter un champs  
  
	UPDATE nom\_table SET nom\_colonne=nom\_colonne+1 WHERE id='identifiant'  
  
  
# Coder d'un trigger  
  
	CREATE OR REPLACE TRIGGER <nom_trigger>  
	<evenement> (AFTER INSERT, BEFORE UPDATE, ...)  
	ON <table>  
	DECLARE  
		<nom_variable> <type_variable>  
	BEGIN  
		<commande>  
	END;  
	/  
  
#### Par Exemple:  
  
	CREATE OR REPLACE TRIGGER inc_nbr_match  
	AFTER INSERT  
	ON TAB_MATCH  
	DECLARE  
		rangees number;  
		eq_dom number;  
		eq_ext number;  
	BEGIN  
		SELECT COUNT(*) INTO rangees FROM TAB_MATCH;  
		SELECT ID_EQ_DOM INTO eq_dom FROM TAB_MATCH WHERE ID_MATCHS=rangees;  
		SELECT ID_EQ_EXT INTO eq_ext FROM TAB_MATCH WHERE ID_MATCHS=rangees;  
	END;  
	/  
  
# Afficher un trigger  
  
	SELECT TEXT FROM USER_SOURCE WHERE NAME="&trig_name" AND TYPE="TRIGGER";  
  
# Afficher les erreurs  
  
	show errors  
