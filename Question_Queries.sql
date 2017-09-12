/* 1 */

SELECT owner_name,count(Wombats.owner_id) as numberOfWombats from wombats
INNER JOIN Owners ON (Owners.Owner_id = Wombats.Owner_id) 
group by Wombats.owner_id
ORDER BY numberOfWombats DESC
LIMIT 1;
--

/* 2 */

SELECT Wombats.Owner_id,owner_name,count(Wombats.owner_id) as famedWombats from wombats
INNER JOIN hall_of_fame ON (wombats.wombat_id = hall_of_fame.wombat_id)
INNER JOIN Owners ON (Owners.Owner_id = Wombats.Owner_id) 
group by Wombats.Owner_id
ORDER BY famedWombats desc
limit 1
--

/* 3 */


select distinct time,meet_host,nom_de_course From races
inner JOIN Owners ON (meet_host = owner_name AND owner_city='skamokawa' AND Meet_date='2016-04-08' AND distance = 50 )
INNER JOIN nom_de_Course ON (nom_de_course.wombat_id = races.wombat_id)
order BY time asc;

--

/* 4 */

SELECT nom_de_course,time from nom_de_course

INNER JOIN races on (nom_de_course.wombat_id = races.wombat_id AND distance = 200)

ORDER BY time asc
LIMIT 1

--

/* 5 */

SELECT nom_de_course from nom_de_course

INNER JOIN races on (nom_de_course.wombat_id = races.wombat_id)

WHERE meet_date = 0000-00-00

--

/* 6 */

SELECT DISTINCT owners.owner_name,wombats.wombat_name,races.entered_by from owners
INNER JOIN Wombats on (owners.owner_id = wombats.owner_id)
INNER JOIN races on (wombats.wombat_id = races.wombat_id)
WHERE races.entered_by != owners.owner_name AND races.entered_by != ''
ORDER BY owner_name asc;

--

/* 7 */

SELECT Owners.owner_name,COUNT(owners.owner_id) AS Count,
AVG(time) as avg_time 
FROM RACES
INNER JOIN wombats ON (wombats.wombat_id = races.wombat_id)
INNER JOIN owners ON (owners.owner_id = wombats.owner_id)
WHERE DISTANCE = 50
GROUP BY Owners.owner_name ASC;

--

/* 8 */

SELECT Owners.owner_name,COUNT(owners.owner_id) AS Count,
AVG(time) as avg_time 
FROM RACES
INNER JOIN wombats ON (wombats.wombat_id = races.wombat_id)
INNER JOIN owners ON (owners.owner_id = wombats.owner_id)
WHERE DISTANCE = 100
GROUP BY Owners.owner_name ASC;

--

/* 9 */

SELECT Owners.owner_name,COUNT(owners.owner_id) AS Count,
AVG(time) as avg_time 
FROM RACES
INNER JOIN wombats ON (wombats.wombat_id = races.wombat_id)
INNER JOIN owners ON (owners.owner_id = wombats.owner_id)
WHERE DISTANCE = 200
GROUP BY Owners.owner_name ASC;

--

/* 10 */

SELECT meet_city, COUNT(DISTINCT meet_city,meet_date) as count
from races
group by meet_city
order by count desc
LIMIT 1;

--

/* 11 */

select wombat_id,time,meet_date from races
where time = (select min(time) from races as r where distance = 100 AND r.meet_date = races.meet_date)
group by meet_date;

-- 

/* 12 */


select breed_name,count(breed_name) from wombats
INNER JOIN races on (wombats.wombat_id = races.wombat_id)
WHERE time = (select min(time) from races as r where distance = 100 AND r.meet_date = races.meet_date AND r.meet_host = races.meet_host) AND breed_name <> ""
group by breed_name