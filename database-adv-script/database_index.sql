-- EXPLAIN ANALYZE SELECT
--     u.user_id,
--     u.first_name,
--     u.last_name,
--     COUNT(b.booking_id) AS total_bookings
-- FROM "User" u
-- LEFT JOIN "Booking" b ON u.user_id = b.user_id
-- GROUP BY u.user_id
-- ORDER BY total_bookings DESC;

-- Create indexes
CREATE INDEX idx_user_email ON "User"(email);
CREATE INDEX idx_user_role ON "User"(role);
CREATE INDEX idx_property_property_id ON "Property"(property_id);
CREATE INDEX idx_property_host_id ON "Property"(host_id);
CREATE INDEX idx_property_price_per_night ON "Property"(price_per_night);
CREATE INDEX idx_property_location ON "Property"(location);
CREATE INDEX idx_booking_property_id ON "Booking"(property_id);
CREATE INDEX idx_booking_user_id ON "Booking"(user_id);
CREATE INDEX idx_booking_status ON "Booking"(status);
CREATE INDEX idx_booking_date_range ON "Booking"(start_date, end_date);

-- EXPLAIN ANALYZE SELECT
--     u.user_id,
--     u.first_name,
--     u.last_name,
--     COUNT(b.booking_id) AS total_bookings
-- FROM "User" u
-- LEFT JOIN "Booking" b ON u.user_id = b.user_id
-- GROUP BY u.user_id
-- ORDER BY total_bookings DESC;
