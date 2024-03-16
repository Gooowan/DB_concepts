CREATE TABLE directors (
  id INTEGER PRIMARY KEY,
  f_name VARCHAR(255) NOT NULL,
  l_name VARCHAR(255) NOT NULL,
  birthday DATE NOT NULL
);

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  nickname VARCHAR(50) NOT NULL
);

CREATE TABLE movies (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  category ENUM ('cartoon', 'fighter', 'detective', 'comedy'),
  director_id INTEGER,
  release_year INTEGER NOT NULL,
  FOREIGN KEY (director_id) REFERENCES directors(id)
);

CREATE TABLE reviews (
  id INTEGER PRIMARY KEY,
  movie_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  score INTEGER CHECK (score BETWEEN 1 AND 10),
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- directors table
INSERT INTO directors (id, f_name, l_name, birthday) VALUES
(1, 'Steven', 'Spielberg', '1946-12-18'),
(2, 'Christopher', 'Nolan', '1970-07-30'),
(3, 'Hayao', 'Miyazaki', '1941-01-05'),
(4, 'Quentin', 'Tarantino', '1963-03-27'),
(5, 'Sofia', 'Coppola', '1971-05-14');
-- users table
INSERT INTO users (id, nickname) VALUES
(1, 'movie_fan'),
(2, 'cinema_lover'),
(3, 'film_critic'),
(4, 'action_hero'),
(5, 'comedy_queen');
-- movies table
INSERT INTO movies (id, title, category, director_id, release_year) VALUES
(1, 'Jurassic Park', 'fighter', 1, 1993),
(2, 'Inception', 'detective', 2, 2010),
(3, 'Spirited Away', 'cartoon', 3, 2001),
(4, 'Pulp Fiction', 'comedy', 4, 1994),
(5, 'Lost in Translation', 'comedy', 5, 2003),
(6, 'Jaws', 'fighter', 1, 1975),
(7, 'The Dark Knight', 'fighter', 2, 2008),
(8, 'My Neighbor Totoro', 'cartoon', 3, 1988),
(9, 'Kill Bill: Vol. 1', 'fighter', 4, 2003),
(10, 'The Virgin Suicides', 'comedy', 5, 1999),
(11, 'E.T. the Extra-Terrestrial', 'cartoon', 1, 1982),
(12, 'Interstellar', 'detective', 2, 2014),
(13, 'Princess Mononoke', 'cartoon', 3, 1997),
(14, 'Django Unchained', 'comedy', 4, 2012),
(15, 'Marie Antoinette', 'comedy', 5, 2006),
(16, 'Schindler''s List', 'fighter', 1, 1993),
(17, 'The Prestige', 'detective', 2, 2006),
(18, 'Howl''s Moving Castle', 'cartoon', 3, 2004),
(19, 'Reservoir Dogs', 'comedy', 4, 1992),
(20, 'The Bling Ring', 'comedy', 5, 2013),
(21, 'Saving Private Ryan', 'fighter', 1, 1998),
(22, 'Memento', 'detective', 2, 2000),
(23, 'Kiki''s Delivery Service', 'cartoon', 3, 1989),
(24, 'Inglourious Basterds', 'comedy', 4, 2009),
(25, 'The Beguiled', 'comedy', 5, 2017),
(26, 'Indiana Jones and the Last Crusade', 'fighter', 1, 1989),
(27, 'Tenet', 'detective', 2, 2020),
(28, 'Castle in the Sky', 'cartoon', 3, 1986),
(29, 'Once Upon a Time in Hollywood', 'comedy', 4, 2019),
(30, 'On the Rocks', 'comedy', 5, 2020);
-- reviews table
INSERT INTO reviews (id, movie_id, user_id, score) VALUES
(1, 1, 1, 9),
(2, 1, 2, 8),
(3, 1, 3, 7),
(4, 1, 4, 10),
-- (5, 1, 5, 6),
(6, 2, 1, 10),
(7, 2, 2, 9),
(8, 2, 3, 8),
(9, 2, 4, 7),
-- (10, 2, 5, 6),
(11, 3, 1, 10),
(12, 3, 2, 10),
(13, 3, 3, 9),
(14, 3, 4, 8),
-- (15, 3, 5, 9),
(16, 4, 1, 8),
(17, 4, 2, 7),
(18, 4, 3, 10),
(19, 4, 4, 9),
-- (20, 4, 5, 8),
(21, 5, 1, 7),
(22, 5, 2, 8),
(23, 5, 3, 7),
(24, 5, 4, 6),
-- (25, 5, 5, 9),
(26, 6, 1, 8),
(27, 6, 2, 9),
(28, 6, 3, 8),
(29, 6, 4, 10),
-- (30, 6, 5, 7),
(31, 7, 1, 10),
(32, 7, 2, 10),
(33, 7, 3, 9),
(34, 7, 4, 9),
-- (35, 7, 5, 8),
(36, 8, 1, 9),
(37, 8, 2, 9),
(38, 8, 3, 10),
(39, 8, 4, 8),
-- (40, 8, 5, 9),
(41, 9, 1, 8),
(42, 9, 2, 7),
(43, 9, 3, 9),
(44, 9, 4, 10),
-- (45, 9, 5, 8),
(46, 10, 1, 7),
(47, 10, 2, 8),
(48, 10, 3, 7),
(49, 10, 4, 6),
(50, 10, 5, 9),
(51, 11, 1, 9),
(52, 11, 2, 8),
(53, 11, 3, 8),
(54, 11, 4, 9),
(55, 11, 5, 7),
(56, 12, 1, 10),
(57, 12, 2, 9),
(58, 12, 3, 9),
(59, 12, 4, 8),
(60, 12, 5, 7),
(61, 13, 1, 10),
(62, 13, 2, 10),
(63, 13, 3, 10),
(64, 13, 4, 9),
(65, 13, 5, 9),
(66, 14, 1, 8),
(67, 14, 2, 7),
(68, 14, 3, 9),
(69, 14, 4, 10),
(70, 14, 5, 8),
(71, 15, 1, 7),
(72, 15, 2, 8),
(73, 15, 3, 7),
(74, 15, 4, 6),
(75, 15, 5, 9),
(76, 16, 1, 9),
(77, 16, 2, 10),
(78, 16, 3, 9),
(79, 16, 4, 9),
(80, 16, 5, 8),
(81, 17, 1, 10),
(82, 17, 2, 10),
(83, 17, 3, 9),
(84, 17, 4, 8),
(85, 17, 5, 7),
(86, 18, 1, 9),
(87, 18, 2, 9),
(88, 18, 3, 10),
(89, 18, 4, 9),
(90, 18, 5, 9),
(91, 19, 1, 8),
(92, 19, 2, 7),
(93, 19, 3, 10),
(94, 19, 4, 9),
(95, 19, 5, 8),
(96, 20, 1, 7),
(97, 20, 2, 8),
(98, 20, 3, 7),
(99, 20, 4, 7);

# 1
SELECT DISTINCT d.l_name
FROM directors d
WHERE (
    SELECT COUNT(*)
    FROM movies m
    WHERE m.director_id = d.id AND m.category = 'cartoon'
) > 2;

# 2
SELECT d.l_name
FROM directors d
WHERE EXISTS(
    SELECT 1
    FROM movies m
    WHERE (m.director_id = d.id AND m.category = 'cartoon')
) AND EXISTS(
    SELECT 1
    FROM movies m
    WHERE (m.director_id = d.id AND m.category = 'fighter')
);

#3
SELECT d.l_name
FROM directors d
INNER JOIN movies m1 ON d.id = m1.director_id AND m1.category = 'fighter'
INNER JOIN movies m2 ON d.id = m2.director_id AND m2.category = 'cartoon'
GROUP BY d.l_name;


#4
SELECT nickname
FROM users
WHERE (
    SELECT COUNT(1)
    FROM reviews r
    INNER JOIN movies m on r.movie_id = m.id
    WHERE r.user_id = users.id AND m.category = 'fighter'

) > 3;

# 3 bonus

SELECT d2.l_name
FROM (
    SELECT d.l_name, m.category
    FROM directors d
    JOIN movies m ON d.id = m.director_id
    WHERE m.category IN ('fighter', 'cartoon')
) AS d2
GROUP BY d2.l_name
HAVING COUNT(DISTINCT d2.category) > 1;