CREATE DATABASE CRIME_DETECTION;
USE CRIME_DETECTION;
CREATE TABLE crime_data (
    id INTEGER PRIMARY KEY 	AUTO_INCREMENT,
    nature_of_crime TEXT CHECK (nature_of_crime IN ('Abuse','Arrest','Arson','Assault','Burglary','Explosion','Fighting','Normal','RoadAccidents','Robbery','Shooting','Shoplifting','Stealing','Vandalism')),
    risk_level decimal(5,2),
    camera_location TEXT
);
DELIMITER $$
CREATE TRIGGER display_message_after_update
AFTER UPDATE ON crime_data
FOR EACH ROW
BEGIN
    DECLARE msg VARCHAR(255);
    SET msg = CONCAT('Row with ID ', NEW.id, ' updated. New nature of crime: ', NEW.nature_of_crime);
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
END$$

DELIMITER ;

