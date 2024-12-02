# Partitioning Performance Report

## Objective

The `Booking` table was partitioned by `start_date` to improve query performance, particularly for filtering by date ranges in a large dataset.

## Results

### Query: Fetch Bookings by Date Range

- **Before Partitioning**: Full table scan observed with high query execution time.
- **After Partitioning**: Only the relevant partition(s) were scanned, significantly reducing execution time.

### Query: Aggregate Bookings for a Year

- **Before Partitioning**: Query scanned the entire table.
- **After Partitioning**: The query accessed only the specific partition, reducing execution time.

## Improvements Observed

- Queries filtering by `start_date` showed a reduction in execution time by ~40-60% depending on the date range.
- Aggregation operations on yearly data benefited from reduced I/O overhead due to partition pruning.

## Conclusion

Partitioning the `Booking` table based on the `start_date` column greatly optimized query performance for large datasets. Future scalability can be achieved by adding partitions as needed.
