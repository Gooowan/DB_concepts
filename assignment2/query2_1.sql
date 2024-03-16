SELECT
    t.name,
    t.length,
    t.elevation,
    d.name AS difficulty_name,
    AVG(r.score) AS average_rating
FROM
    trails t
    INNER JOIN difficulties d ON t.difficulty_id = d.id
    INNER JOIN ratings r ON t.id = r.trail_id
GROUP BY
    t.id
ORDER BY
    average_rating DESC, t.name ASC;
