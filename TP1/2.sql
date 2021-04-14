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

