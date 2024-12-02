
-- Step 1: Drop the original Booking table if partitioning needs to be reimplemented
DROP TABLE IF EXISTS Booking;

-- Step 2: Create a new Booking table as a partitioned table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
PARTITION BY RANGE (start_date);

-- Step 3: Create partitions for the Booking table based on date ranges
CREATE TABLE Booking_2024
PARTITION OF Booking
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2023
PARTITION OF Booking
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2022
PARTITION OF Booking
FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');
