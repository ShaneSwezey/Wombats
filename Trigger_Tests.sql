/* Apply these tests after build and insert values into all tables */

/* Trigger 1 Test Throws ERROR */

INSERT INTO wombats (wombat_name,owner_id,birthdate)
VALUES ('Charlie',1,'2006-07-04')

--

/* Tigger2 Test throws ERROR */

INSERT INTO nom_de_course (nom_de_course)
VALUES ('Turtle')

--

/*Trigger 3 Test throws ErrOr */
/* Should be Mary Anderson */

INSERT INTO RACES (meet_host,meet_date,meet_city)
VALUES ('SHANE','2010-01-18','Skamokawa')

-- 

/* Trigger 4 throws Error */
/* throws error on forth call */

INSERT INTO RACES (wombat_id,entered_by,meet_date,meet_city,distance)
VALUES (-1,'SHANE','2016-06-06','Ellensburg',50)
--
INSERT INTO RACES (wombat_id,entered_by,meet_date,meet_city,distance)
VALUES (-2,'SHANE','2016-06-06','Ellensburg',100)
--
INSERT INTO RACES (wombat_id,entered_by,meet_date,meet_city,distance)
VALUES (-3,'SHANE','2016-06-06','Ellensburg',200)
--
INSERT INTO RACES (wombat_id,entered_by,meet_date,meet_city,distance)
VALUES (-4,'SHANE','2016-06-06','Ellensburg',50)

--

delete from races
WHERE entered_by = "SHANE"

--

/* Trigger 5 throws ERROR */

INSERT INTO RACES (wombat_id,entered_by,meet_date,meet_city,distance)
VALUES (-1,'SHANE','2016-06-06','Ellensburg',50)
--
INSERT INTO RACES (wombat_id,entered_by,meet_date,meet_city,distance)
VALUES (-4,'SHANE','2016-06-06','Ellensburg',50)

--


delete from races
WHERE entered_by = "SHANE"

--

/* Trigger 6 throws error */

INSERT INTO Hall_of_fame (wombat_id,induction_to_hall_of_champions_date)
VALUES (-1,'2012-01-01');