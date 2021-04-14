CREATE OR REPLACE VIEW Eleves_ValDeMarne as
    select * from ELEVES where CodePostal BETWEEN 93999 AND 95000;
UPDATE Eleves_ValDeMarne
    set codePostal = 75013, ville = 'PARIS'
    where NOM = 'Danny' and PRENOM = 'Buck';