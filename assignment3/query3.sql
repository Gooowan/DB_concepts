# longer than average trails
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

SELECT name FROM trails
UNION
SELECT name FROM trails_clone;

SELECT name FROM trails
UNION ALL
SELECT name FROM trails_clone;

# intersect
SELECT name FROM trails
WHERE EXISTS (SELECT 1 FROM trails_clone WHERE trails.name = trails_clone.name);

# except
SELECT name FROM trails
WHERE NOT EXISTS (SELECT 1 FROM trails_clone WHERE trails.name = trails_clone.name);
