-- Inner
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM Booking b
INNER JOIN [User] u ON b.user_id = u.user_id;

-- Left
SELECT
    p.property_id,
    p.name AS property_name,
    p.description,
    p.price_per_night,
    r.review_id,
    r.rating,
    r.comment
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id
ORDER BY p.name, r.rating DESC;

-- Full Outer
SELECT
    u.user_id AS user_id,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    b.booking_id AS booking_id,
    b.start_date AS booking_start_date,
    b.end_date AS booking_end_date,
    b.total_price AS booking_total_price
FROM [User] u
FULL OUTER JOIN Booking b ON u.user_id = b.user_id;
