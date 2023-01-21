DELIMITER $$
CREATE TRIGGER min_student_trigger BEFORE UPDATE ON SECTION
FOR EACH ROW
BEGIN
    IF NEW.status = 'open?' AND (SELECT COUNT(*) FROM TAKES WHERE TAKES.SecId = NEW.SecId) < 5 THEN 
		SET NEW.status = 'cant open';
    ELSEIF NEW.status = 'open?' AND (SELECT COUNT(*) FROM TAKES WHERE TAKES.SecId = NEW.SecId) > 5 THEN
        SET NEW.status = 'opened.';
    END IF;
END$$
DELIMITER;
-- daha sonra cant open statusune sahip sectionları bu update ile kapatıyoruz
/*  
UPDATE SECTION
SET status = 'opened';

SELECT * FROM SECTION;
DELETE FROM SECTION WHERE status = 'cant open';

 */



DELIMITER $$
CREATE TRIGGER day_sec BEFORE UPDATE ON SECTION
FOR EACH ROW
BEGIN
    IF NEW.DaysTime = 'Saturday'  THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'there cant be saturday section';
    ELSEIF NEW.DaysTime = 'Sunday' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'there cant be sunday section';
    END IF;
END$$

DELIMITER  $$
CREATE TRIGGER CONTROL_SUPERCLASS
BEFORE INSERT ON PROFESSOR
FOR EACH ROW
BEGIN
	IF 
    NEW.lecid not IN (
    SELECT lecturer.lecid
    FROM lecturer
    WHERE lecturer.lecid = NEW.lecid) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insert not allowed, please first insert a superclass tuple';
    END IF;
END$$

DELIMITER  $$
CREATE TRIGGER CONTROL_SUPERCLASS_prof
BEFORE INSERT ON PROFESSOR
FOR EACH ROW
BEGIN
	IF 
    NEW.lecid not IN (
    SELECT lecturer.lecid
    FROM lecturer
    WHERE lecturer.lecid = NEW.lecid) THEN 
    CALL `Insert not allowed, please first insert a superclass tuple`;
    END IF;
 END$$
 
 
 
 
DELIMITER  $$
CREATE TRIGGER CONTROL_SUPERCLASS_insturctor
BEFORE INSERT ON instructor
FOR EACH ROW
BEGIN
	IF 
    NEW.lecid not IN (
    SELECT lecturer.lecid
    FROM lecturer
    WHERE lecturer.lecid = NEW.lecid) THEN 
    CALL `Insert not allowed, please first insert a superclass tuple`;
    END IF;
 END$$
 
 
 
 
 DELIMITER  $$
CREATE TRIGGER CONTROL_SUPERCLASS_ascprof
BEFORE INSERT ON associate_professor
FOR EACH ROW
BEGIN
	IF 
    NEW.lecid not IN (
    SELECT lecturer.lecid
    FROM lecturer
    WHERE lecturer.lecid = NEW.lecid) THEN 
    CALL `Insert not allowed, please first insert a superclass tuple`;
    END IF;
 END$$
 
 
 DELIMITER  $$
CREATE TRIGGER CONTROL_SUPERCLASS_asstprof
BEFORE INSERT ON assistant_professor
FOR EACH ROW
BEGIN
	IF 
    NEW.lecid not IN (
    SELECT lecturer.lecid
    FROM lecturer
    WHERE lecturer.lecid = NEW.lecid) THEN 
    CALL `Insert not allowed, please first insert a superclass tuple`;
    END IF;
 END$$


