DELIMITER //

CREATE PROCEDURE getStudyYear (IN eleve_id INT) 
BEGIN
	SELECT ANNEE FROM ecole.Eleves WHERE NUM_ELEVE = eleve_id;
END //

DELIMITER ;

CALL getStudyYear(16);	