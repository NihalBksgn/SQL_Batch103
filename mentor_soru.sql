CREATE TABLE family_members
(
id char(3),
name varchar(20),
gender varchar(20),
species varchar(20),
num_books_read int
);
INSERT INTO family_members VALUES(1, 'Dave' , 'male','human', 200);
INSERT INTO family_members VALUES(2, 'Mary' , 'female','human', 180);
INSERT INTO family_members VALUES(3, 'Pickels','male','dog', 0);

--1-Tumverileri tek bir tabloda gosteren query yaziniz
SELECT *FROM family_members;

--2- Name ve species sutunlarini gosteren query yaziniz
SELECT name,species FROM family_members;

--3-Dog a air tum satirlari donduren query yaziniz
SELECT * FROM family_members
WHERE species='dog';

--4-num_books_read degeri 190'dan buyuk olan aile uyelerine ait tum satirlari donduren query yaziniz

SELECT * FROM family_members
WHERE num_books_read>190;

CREATE TABLE character
(
id char(7),
name varchar(30)
);
CREATE TABLE character_tv_show
(
id char(7),
character_id char(7),
tv_show_name varchar(30)
);
CREATE TABLE character_actor
(
id char(7),
character_id char(7),
actor_name varchar(30)
);
INSERT INTO character VALUES(1, 'Doogle Howser');
INSERT INTO character VALUES(2, 'Barney Stinson');
INSERT INTO character VALUES(3, 'Lily Aldrin');
INSERT INTO character VALUES(4, 'Willow Rosenberg');
INSERT INTO character_tv_show VALUES(1, 4, 'Buffy the Vampire Slayer');
INSERT INTO character_tv_show VALUES(2, 3, 'How I Met Your Mother');
INSERT INTO character_tv_show VALUES(3, 2, 'How I Met Your Mother');
INSERT INTO character_tv_show VALUES(4, 1, 'Doogie Howser,M.D.');
INSERT INTO character_actor VALUES(1, 4, 'Alyson Hannigan');
INSERT INTO character_actor VALUES(2, 3, 'Alyson Hannigan');
INSERT INTO character_actor VALUES(3, 2, 'Neil Patrick Harris');
INSERT INTO character_actor VALUES(4, 1, 'Neil Patrick Harris');
SELECT *FROM character
SELECT *FROM character_actor
SELECT *FROM character_tv_show
