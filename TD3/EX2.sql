-- 1.	Obtenir la liste des noms, prénom et date de naissance de tous les élèves.
SELECT NOM, PRENOM, DATE_NAISSANCE FROM ELEVES;
-- 2.	Obtenir la liste des spécialités des professeurs avec doublons puis sans doublons.
SELECT SPECIALITE FROM PROFESSEURS;
SELECT DISTINCT SPECIALITE FROM PROFESSEURS;
-- 3.	Obtenir le nom et prénom des élèves pesant entre 40 et 60 kilos et inscrits en 1ère année ou des élèves inscrits en 2ème année.
SELECT NOM, PRENOM FROM ELEVES WHERE (POIDS BETWEEN 40 AND 60) AND ANNEE = 1 OR ANNEE = 2;
-- 4.	Obtenir le nom des élèves dont le poids est compris entre 60 et 80 kilos.
SELECT NOM FROM ELEVES WHERE (POIDS BETWEEN 60 AND 80);
-- Discriminatoire af cette école
-- 5.	Obtenir le nom des élèves dont le nom commence par L.
SELECT NOM FROM ELEVES WHERE NOM LIKE 'L%';
-- 6.	Obtenir le nom des professeurs dont la spécialité est inconnue.
SELECT NOM FROM PROFESSEURS WHERE SPECIALITE IS NULL;
-- 7.	Obtenir, pour chaque professeur, son nom et sa spécialité. Si cette dernière est inconnue, on souhaite afficher la chaîne de caractères : ‘****’.
SELECT NOM, ISNULL(SPECIALITE, "****") FROM PROFESSEURS;
-- 8.	Obtenir les paires de noms de professeurs qui ont la même spécialité.
-- SELECT P1.NOM FROM PROFESSEURS P1 WHERE (SELECT SPECIALITE FROM PROFESSEURS) = P1.SPECIALITE;
-- 9.	Afficher l’âge moyen des élèves. Cet âge moyen sera exprimé en année.
SELECT AVG(AGE) FROM ELEVES;
-- 10.	Obtenir pour chaque élève de 1ère année son nom et sa moyenne.
-- 11.	Obtenir la moyenne des points de chaque élève de 1ère année dont le total des points est supérieur à 40.
-- 12.	Obtenir le maximum parmi les totaux de chaque élève.
-- 13.	Quels sont les élèves de 1ère année dont la moyenne est supérieure à la moyenne de la 1ère année ?
-- 14.	Obtenir le nom et le poids des élèves de 1ère année plus lourds que n’importe quel élève de 2ème année.
-- 15.	Obtenir le nom, le poids et l’année des élèves dont le poids est supérieur au poids moyen des élèves étant dans la même année d’études.
-- 16.	Obtenir le nom des élèves de 1ère année qui ont obtenu plus de 60 % et qui jouent au tennis.
-- 17.	Professeurs qui prennent en charge TOUS les cours de deuxième année ; on demande le Numéro et le nom.
-- 18.	Elèves qui pratiquent TOUTES les activités ; on demande le Numéro et le nom.
-- 19.	Quels sont les noms des élèves qui ne pratiquent aucune activité ? 
-- 20.	Quels sont les noms d’activités pratiquées par tous les élèves ?
