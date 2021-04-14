ALTER TABLE Eleves ADD (CodePostal NUMERIC(5), Ville VARCHAR(50));
ALTER TABLE Eleves MODIFY Poids NUMERIC(3) CHECK(Poids BETWEEN 35 AND
    135);
-- autre solution
-- ALTER TABLE Eleves ADD CONSTRAINT CH_Poids CHECK(Poids >=35 AND Poids <=135);
UPDATE Eleves SET CodePostal=75013, Ville='paris' WHERE Num_Eleve = 1;
UPDATE Eleves SET CodePostal=93800, Ville='EPINAY / seine' WHERE
        Num_Eleve = 3;
UPDATE Eleves SET CodePostal=93800, Ville='EPINAY SUR SEINE' WHERE
        Num_Eleve = 5;
UPDATE Eleves SET CodePostal=91000, Ville='EVRY' WHERE Num_Eleve = 7;
UPDATE Eleves SET CodePostal=94000, Ville='Creteil' WHERE Num_Eleve = 9;
UPDATE Eleves SET CodePostal = 94800, Ville='Villejuif' WHERE Num_Eleve IN(2, 4, 6, 8, 10);
ALTER TABLE Eleves MODIFY COLUMN Ville VARCHAR(60);
ALTER TABLE Eleves MODIFY COLUMN CodePostal NUMERIC(4);
-- on ne peut pas reduire la taille d'un champs dans une table non vide
-- car risque d erreurs dans les donnees
CREATE TABLE Agglomerations
(
    CP Numeric(5) NOT NULL,
    Ville VARCHAR(60) CHECK(Ville = Upper(Ville)),
    Classement ENUM ('PETITE-VILLE', 'GRANDE-VILLE', 'METROPOLE',
'MEGAPOLE'),
 constraint PK_Agglo primary key (CP, Ville)
) engine = 'InnoDB';
INSERT INTO Agglomerations(CP, Ville, Classement)
VALUES (75001, 'PARIS', 'METROPOLE'),
       (75013,'PARIS','METROPOLE'),
       (93800,'EPINAY SUR SEINE','PETITE-VILLE'),
       (93430,'Villetaneuse','PETITE-Ville'),
       (91000,'EVRY','PETITE-VILLE'),
       (94000,'CRETEIL','GRANDE-VILLE'),
       (94800,'VILLEJUIF','GRANDE-VILLE');
UPDATE Eleves SET Ville = (SELECT Ville FROM Agglomerations WHERE CP = CodePostal);
ALTER TABLE Eleves ADD CONSTRAINT FK_Eleves_Agglo FOREIGN KEY(CodePostal, Ville) REFERENCES Agglomerations(CP, Ville) ON DELETE CASCADE;