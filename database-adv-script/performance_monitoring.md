
# Performance Monitoring and Refinement

## Objective

To continuously monitor and refine database performance by analyzing query execution plans and making necessary schema adjustments.

## Steps Taken

### 1. Monitoring Query Performance

- **Tools Used:** `SHOW PROFILE`, `EXPLAIN ANALYZE`.
- Frequently used queries were analyzed, including:
  - Queries for retrieving user bookings and property details.
  - Queries for fetching reviews associated with properties.
- Key metrics such as query execution time and resource utilization were recorded.

### 2. Bottleneck Identification

- **Observations:**
  - Slow performance for queries involving large joins (e.g., `User` with `Booking` and `Property`).
  - Full table scans detected for the `Booking` table in date-range queries.
  - Lack of indexing on some columns used in `WHERE` and `ORDER BY` clauses.

### 3. Schema Adjustments

- Added the following indexes to improve performance:
  - Index on `Booking.start_date` to speed up date-range queries.
  - Composite index on `Property.property_id` and `Review.property_id` for join optimization.
- Partitioned the `Booking` table by `start_date` for efficient range queries.

### 4. Query Refinement

- Refactored slow queries to minimize unnecessary joins and leverage indexed columns.
- Replaced some subqueries with joins where feasible.

### 5. Results After Optimization

- **Metrics Improvement:**
  - Queries involving `Booking` date-range searches showed a **40% reduction** in execution time.
  - Joins between `Property` and `Review` showed a **25% improvement** in performance.
- Enhanced scalability for larger datasets.

## Recommendations for Future Monitoring

- Continuously analyze queries using `EXPLAIN ANALYZE` for new usage patterns.
- Periodically update indexes based on query logs.
- Monitor partition sizes to ensure optimal performance.
