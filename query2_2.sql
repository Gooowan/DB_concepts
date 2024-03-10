SELECT
    u.id AS user_id,
    u.email,
    t.id AS trail_id,
    t.name AS trail_name,
    rev.title AS review_title,
    rev.content AS review_content
FROM
    users u
    INNER JOIN reviews rev ON u.id = rev.user_id
    INNER JOIN trails t ON t.id = rev.trail_id
WHERE
    u.profile_type = 'pro'
ORDER BY
	trail_name;
