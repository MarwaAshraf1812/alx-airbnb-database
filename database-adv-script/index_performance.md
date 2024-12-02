# Steps for Identifying High-Usage Columns

1. **User Table:**
   - Columns typically used for filtering, joining, or ordering include:
     - **`user_id`**: Used in joins and where clauses (Primary Key).
     - **`email`**: Frequently queried for user authentication or search.
     - **`role`**: Often filtered to get users with specific roles (admin, guest, host).

2. **Property Table:**
   - Columns frequently involved in filtering, sorting, or joining:
     - **`property_id`**: Used in joins (Primary Key).
     - **`host_id`**: Used to filter properties based on the user (Foreign Key referencing `User`).
     - **`pricepernight`**: Often used for sorting properties by price or filtering in range-based queries.
     - **`location`**: Commonly queried for filtering properties by location.

3. **Booking Table:**
   - Columns involved in filtering, joining, or sorting:
     - **`booking_id`**: Used for referencing specific bookings (Primary Key).
     - **`property_id`**: Used for joining the booking and property tables.
     - **`user_id`**: Used for joining the booking and user tables.
     - **`start_date`, `end_date`**: Commonly queried to find bookings within a specific date range.
     - **`status`**: Used to filter bookings by status (pending, confirmed, canceled).

## SQL CREATE INDEX Commands

Creating indexes on high-usage columns will improve the performance of query operations such as filtering, joining, and sorting.

```sql
-- Index on email in User table (for user authentication and searches)
CREATE INDEX idx_user_email ON "User"(email);

-- Index on role in User table (for filtering users by role)
CREATE INDEX idx_user_role ON "User"(role);

-- Index on property_id in Property table (for joining with Booking and Review)
CREATE INDEX idx_property_property_id ON "Property"(property_id);

-- Index on host_id in Property table (for filtering properties by user)
CREATE INDEX idx_property_host_id ON "Property"(host_id);

-- Index on price_per_night in Property table (for sorting/filtering properties by price)
CREATE INDEX idx_property_price_per_night ON "Property"(price_per_night);

-- Index on location in Property table (for filtering properties by location)
CREATE INDEX idx_property_location ON "Property"(location);

-- Index on property_id in Booking table (for joining with Property)
CREATE INDEX idx_booking_property_id ON "Booking"(property_id);

-- Index on user_id in Booking table (for joining with User)
CREATE INDEX idx_booking_user_id ON "Booking"(user_id);

-- Index on status in Booking table (for filtering bookings by status)
CREATE INDEX idx_booking_status ON "Booking"(status);

-- Index on start_date and end_date in Booking table (for filtering bookings by date range)
CREATE INDEX idx_booking_date_range ON "Booking"(start_date, end_date);
```

## Measuring Query Performance Before and After Adding Indexes

To measure the impact of the indexes, we will use the **EXPLAIN** or **ANALYZE** statement, which provides details about the execution plan and performance of a query.

1. **Before Creating Indexes:**
   Run the following SQL to analyze the query plan for a sample query without indexes.

   ```sql
   EXPLAIN ANALYZE
   SELECT
       u.user_id,
       u.first_name,
       u.last_name,
       COUNT(b.booking_id) AS total_bookings
   FROM "User" u
   LEFT JOIN "Booking" b ON u.user_id = b.user_id
   GROUP BY u.user_id
   ORDER BY total_bookings DESC;
   ```

   This will give you information on how long the query takes to execute and the overall performance, including scan operations that could be improved with indexes.

2. **After Creating Indexes:**
   After creating the indexes, run the same query again and compare the execution plans and query times.

   ```sql
   EXPLAIN ANALYZE
   SELECT
       u.user_id,
       u.first_name,
       u.last_name,
       COUNT(b.booking_id) AS total_bookings
   FROM "User" u
   LEFT JOIN "Booking" b ON u.user_id = b.user_id
   GROUP BY u.user_id
   ORDER BY total_bookings DESC;
   ```

   **Expected Outcome:**
   - The execution time should decrease significantly, especially if there were large tables involved.
   - The query planner should show index scans instead of full table scans, indicating improved performance.
