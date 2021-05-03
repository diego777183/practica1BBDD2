CREATE TRIGGER evitaBorrar 
    BEFORE DELETE ON pais 
    FOR EACH ROW BEGIN 
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No puedes borrar en esta tabla';  
END;