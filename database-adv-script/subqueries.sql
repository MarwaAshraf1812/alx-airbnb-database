-- Non-correlated subquery
SELECT
    p.property_id,
    p.name AS property_name,
    p.description,
    p.price_per_night
FROM Property p
WHERE
    (SELECT AVG(r.rating)
     FROM Review r
     WHERE r.property_id = p.property_id) > 4.0;

-- Correlated subquery
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM [User] u
WHERE
    (SELECT COUNT(*)
     FROM Booking b
     WHERE b.user_id = u.user_id) > 3;
