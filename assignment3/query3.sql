# longer than average trails
SELECT name, length FROM trails
WHERE length > (SELECT AVG(length) FROM trails);

SELECT name, length FROM trails
WHERE length > (SELECT AVG(length) FROM trails);

# increase length if trail have more than 5 trails
UPDATE trails
SET length = length * 1.10
WHERE location_id IN (SELECT location_id FROM trails GROUP BY location_id HAVING COUNT(*) > 5);

# decrease length (not more than 3 trails)
UPDATE trails
SET length = length * 0.95
WHERE location_id NOT IN (SELECT location_id FROM trails GROUP BY location_id HAVING COUNT(*) < 3);

#delete trails_copy
DELETE FROM trails_copy
WHERE EXISTS (SELECT 1 FROM trails WHERE trails_copy.id = trails.id);

#delete users that have no reviews
DELETE FROM users
WHERE NOT EXISTS (SELECT 1 FROM reviews WHERE users.id = reviews.user_id);

# highest elevation trails
SELECT * FROM locations l
WHERE EXISTS (SELECT 1 FROM trails t WHERE l.id = t.location_id AND t.elevation =
(SELECT MAX(elevation) FROM trails t2 WHERE t2.location_id = l.id));


CREATE TABLE trails_clone LIKE trails;

INSERT INTO trails_clone
SELECT * FROM trails
WHERE length > 12;

#unique
SELECT name FROM trails
UNION
SELECT name FROM trails_clone;

#all with duplicates
SELECT name FROM trails
UNION ALL
SELECT name FROM trails_clone;

#only exist in both
SELECT name FROM trails WHERE 1=1
INTERSECT SELECT name FROM trails_clone;

#exist only in trails
SELECT name FROM trails WHERE 1=1
EXCEPT SELECT name FROM trails_clone;


# NON-CORRELATED SUBQUERY SELECT
#1  with the maximum length
SELECT name
FROM trails
WHERE length = (SELECT MAX(length) FROM trails);

#2  located in the USA
SELECT name
FROM trails
WHERE location_id IN (SELECT id FROM locations WHERE country = 'USA');

#3  not located in the USA
SELECT name
FROM trails
WHERE location_id IN (SELECT id FROM locations WHERE country = 'USA');

#4  that have reviews
SELECT name
FROM trails
WHERE EXISTS (SELECT 1 FROM reviews WHERE trails.id = reviews.trail_id);

#5  that do not have reviews
SELECT name
FROM trails
WHERE NOT EXISTS (SELECT 1 FROM reviews WHERE trails.id = reviews.trail_id);

#CORRELATED SUBQUERY SELECT

#1  that are longer than the maximum length of trails in the same location
SELECT t1.name
FROM trails t1
WHERE length > (SELECT MAX(length) FROM trails t2 WHERE t1.location_id = t2.location_id);

#2  located in the USA
SELECT t1.name
FROM trails t1
WHERE location_id IN (SELECT id FROM locations l WHERE t1.location_id = l.id AND l.country = 'USA');

#3  located in the USA
SELECT t1.name
FROM trails t1
WHERE location_id NOT IN (SELECT id FROM locations l WHERE t1.location_id = l.id AND l.country = 'USA');

#4  that have reviews after '2023-07-20'
SELECT t1.name
FROM trails t1
WHERE EXISTS (SELECT 1 FROM reviews r WHERE t1.id = r.trail_id AND r.review_date > '2023-07-20');

#5  that do not have reviews after '2023-07-20'
SELECT t1.name
FROM trails t1
WHERE NOT EXISTS (SELECT 1 FROM reviews r WHERE t1.id = r.trail_id AND r.review_date > '2023-07-20');

# NON-CORRELATED SUBQUERY UPDATE AND DELETE
#1  the longest trail by 1
UPDATE trails
SET length = length + 1
WHERE length = (SELECT MAX(length) FROM trails);
# deletes the longest trail
DELETE FROM trails
WHERE length = (SELECT MAX(length) FROM trails);

#2  trails located in the USA by 1
UPDATE trails
SET length = length + 1
WHERE location_id IN (SELECT id FROM locations WHERE country = 'USA');
#deletes trails located in the USA
DELETE FROM trails
WHERE location_id IN (SELECT id FROM locations WHERE country = 'USA');

#3  trails not located in the USA by 1
UPDATE trails
SET length = length + 1
WHERE location_id NOT IN (SELECT id FROM locations WHERE country = 'USA');
# deletes trails not located in the USA
DELETE FROM trails
WHERE location_id NOT IN (SELECT id FROM locations WHERE country = 'USA');

#4  trails that have reviews by 1
UPDATE trails
SET length = length + 1
WHERE EXISTS (SELECT 1 FROM reviews WHERE trails.id = reviews.trail_id);
# deletes trails that have reviews
DELETE FROM trails
WHERE EXISTS (SELECT 1 FROM reviews WHERE trails.id = reviews.trail_id);

#5  trails that do not have reviews by 1
UPDATE trails
SET length = length + 1
WHERE NOT EXISTS (SELECT 1 FROM reviews WHERE trails.id = reviews.trail_id);

DELETE FROM trails
WHERE NOT EXISTS (SELECT 1 FROM reviews WHERE trails.id = reviews.trail_id);

# CORRELATED SUBQUERY UPDATE AND DELETE

#1  trails that are longer than the maximum length of trails in the same location by 1
UPDATE trails t1
SET length = length + 1
WHERE length > (SELECT MAX(length) FROM trails t2 WHERE t1.location_id = t2.location_id);

DELETE FROM trails t1
WHERE length > (SELECT MAX(length) FROM trails t2 WHERE t1.location_id = t2.location_id);

#2  trails located in the USA by 1
UPDATE trails t1
SET length = length + 1
WHERE location_id IN (SELECT id FROM locations l WHERE t1.location_id = l.id AND l.country = 'USA');

DELETE FROM trails t1
WHERE location_id IN (SELECT id FROM locations l WHERE t1.location_id = l.id AND l.country = 'USA');

#3  trails not located in the USA by 1
UPDATE trails t1
SET length = length + 1
WHERE location_id NOT IN (SELECT id FROM locations l WHERE t1.location_id = l.id AND l.country = 'USA');

DELETE FROM trails t1
WHERE location_id NOT IN (SELECT id FROM locations l WHERE t1.location_id = l.id AND l.country = 'USA');

#4  trails that have reviews after '2023-07-20' by 1
UPDATE trails t1
SET length = length + 1
WHERE EXISTS (SELECT 1 FROM reviews r WHERE t1.id = r.trail_id AND r.review_date > '2023-07-20');

DELETE FROM trails t1
WHERE EXISTS (SELECT 1 FROM reviews r WHERE t1.id = r.trail_id AND r.review_date > '2023-07-20');

#5  trails that do not have reviews after '2023-07-20' by 1
UPDATE trails t1
SET length = length + 1
WHERE NOT EXISTS (SELECT 1 FROM reviews r WHERE t1.id = r.trail_id AND r.review_date > '2023-07-20');

DELETE FROM trails t1
WHERE NOT EXISTS (SELECT 1 FROM reviews r WHERE t1.id = r.trail_id AND r.review_date > '2023-07-20');
