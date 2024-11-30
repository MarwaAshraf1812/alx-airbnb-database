-- SQL script to populate the Airbnb-like database with sample data

-- Insert sample data for User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('00000000-0000-0000-0000-000000000001', 'John', 'Doe', 'john.doe@example.com', 'hashedpassword123', '1234567890', 'guest', CURRENT_TIMESTAMP),
('00000000-0000-0000-0000-000000000002', 'Jane', 'Smith', 'jane.smith@example.com', 'hashedpassword456', '9876543210', 'host', CURRENT_TIMESTAMP),
('00000000-0000-0000-0000-000000000003', 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashedpassword789', '5432167890', 'admin', CURRENT_TIMESTAMP);

-- Insert sample data for Location table
INSERT INTO Location (location_id, location_name) VALUES
('00000000-0000-0000-0000-000000000101', 'New York City'),
('00000000-0000-0000-0000-000000000102', 'Los Angeles'),
('00000000-0000-0000-0000-000000000103', 'San Francisco');

-- Insert sample data for Property table
INSERT INTO Property (property_id, host_id, name, description, location_id, price_per_night, created_at, updated_at) VALUES
('00000000-0000-0000-0000-000000000201', '00000000-0000-0000-0000-000000000001', 'Cozy Apartment in NYC', 'A comfortable 1-bedroom apartment in the heart of the city.', '00000000-0000-0000-0000-000000000101', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('00000000-0000-0000-0000-000000000202',  '00000000-0000-0000-0000-000000000002', 'Luxury Villa in LA', 'Spacious villa with ocean views and modern amenities.', '00000000-0000-0000-0000-000000000102', 500.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('00000000-0000-0000-0000-000000000203', '00000000-0000-0000-0000-000000000003', 'Penthouse with City View', 'Exclusive penthouse with a breathtaking cityscape view.', '00000000-0000-0000-0000-000000000103', 750.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert sample data for Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status, created_at) VALUES
('00000000-0000-0000-0000-000000000301', '00000000-0000-0000-0000-000000000201', '00000000-0000-0000-0000-000000000001', '2024-12-01', '2024-12-05', 'confirmed', CURRENT_TIMESTAMP),
('00000000-0000-0000-0000-000000000302', '00000000-0000-0000-0000-000000000202', '00000000-0000-0000-0000-000000000002', '2024-12-10', '2024-12-15', 'pending', CURRENT_TIMESTAMP),
('00000000-0000-0000-0000-000000000303', '00000000-0000-0000-0000-000000000203', '00000000-0000-0000-0000-000000000003', '2024-11-25', '2024-12-01', 'canceled', CURRENT_TIMESTAMP);

-- Insert sample data for Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('00000000-0000-0000-0000-000000000401', '00000000-0000-0000-0000-000000000301', 750.00, CURRENT_TIMESTAMP, 'credit_card'),
('00000000-0000-0000-0000-000000000402', '00000000-0000-0000-0000-000000000302', 1000.00, CURRENT_TIMESTAMP, 'paypal'),
('00000000-0000-0000-0000-000000000403', '00000000-0000-0000-0000-000000000303', 0.00, CURRENT_TIMESTAMP, 'stripe');

-- Insert sample data for Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('00000000-0000-0000-0000-000000000501', '00000000-0000-0000-0000-000000000201', '00000000-0000-0000-0000-000000000001', 4, 'Nice apartment, great location.', CURRENT_TIMESTAMP),
('00000000-0000-0000-0000-000000000502', '00000000-0000-0000-0000-000000000202', '00000000-0000-0000-0000-000000000002', 5, 'Amazing villa, perfect for families!', CURRENT_TIMESTAMP),
('00000000-0000-0000-0000-000000000503', '00000000-0000-0000-0000-000000000203', '00000000-0000-0000-0000-000000000003', 3, 'Great view, but too pricey.', CURRENT_TIMESTAMP);

-- Insert sample data for Message table
INSERT INTO Message (message_id, sender_id, receiver_id, message, sent_at) VALUES
('00000000-0000-0000-0000-000000000601', '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000002', 'Is this property available for next weekend?', CURRENT_TIMESTAMP),
('00000000-0000-0000-0000-000000000602', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Yes, it is available. Would you like to book it?', CURRENT_TIMESTAMP),
('00000000-0000-0000-0000-000000000603', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000003', 'Thank you for your feedback!', CURRENT_TIMESTAMP);
