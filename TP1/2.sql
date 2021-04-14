-- 1.

CREATE OR REPLACE VIEW Eleves_ValDeMarne as
    select * from ELEVES where CodePostal BETWEEN 93999 AND 95000;
UPDATE Eleves_ValDeMarne
    set codePostal = 75013, ville = 'PARIS'
    where NOM = 'Danny' and PRENOM = 'Buck';

-- 2. Mise a jour possible vu que la vue remplit les conditions suffisante de mise a jour
-- (Elle est monotable et renferme les colonnes Nom, Prenom, CodePostal et Ville et Buck est accessible depuis la vue vu qu il habite au 94

-- 3.

DELETE FROM Eleves_ValDeMarne WHERE Prenom ='Gil' AND Nom = 'JOURDAN';

-- NON on ne peut pas supprimer Gil.
-- Parce que la Vue est limitee aux eleves du 94. Hors Gil est du 93 donc non accessible depuis la vue

-- 4.
-- Peut-on ajouter un nouvel élève arrivant à l’ecole et venant de 94000 CRETEIL puis un autre
-- élève venant de 91000 EVRY depuis la vue Eleves_ValDeMarne ? Pourquoi ? Verifier ?
INSERT INTO eleves_valdemarne VALUES (11, 'Aime', 'Jean', '2004-12-12', 68, 2, 'm', 94000, 'CRETEIL');
INSERT INTO eleves_valdemarne VALUES (12, 'Wallace', 'Mike', '2001-01-22', 55, 1, 'm', 91000, 'EVRY');

-- OUI vu que la vue est monotable et renferme toutes les colonnes NOT NULL de la table Eleves

-- 5.
-- En utilisant la vue Eleves_ValDeMarne, donner les noms et prénoms des élèves du Val de
-- Marne qui pratiquent du Tennis et qui ont une moyenne générale supérieure à 10.
SELECT Eleves_ValDeMarne.NOM, PRENOM FROM eleves_valdemarne JOIN RESULTATS R on Eleves_ValDeMarne.NUM_ELEVE = R.NUM_ELEVE JOIN ACTIVITES_PRATIQUEES AP on Eleves_ValDeMarne.NUM_ELEVE = AP.NUM_ELEVE WHERE AP.NOM = 'Tennis' GROUP BY NUM_ELEVE HAVING AVG(R.POINTS) > 10;

-- Correction:
CREATE OR REPLACE VIEW VMoyennes AS SELECT Num_Eleve, Nom, Prenom, AVG(Points) AS Moyenne FROM Eleves_ValDeMarne NATURAL JOIN Resultats GROUP BY Num_Eleve, Nom, Prenom HAVING AVG(Points)>10;
SELECT V.Nom, Prenom FROM VMoyennes V JOIN Activites_Pratiquees AP ON V.Num_Eleve = AP.Num_Eleve WHERE AP.Nom = 'Tennis';

-- 6.
CREATE USER User1 IDENTIFIED BY '123';
grant select on Eleves To User1;