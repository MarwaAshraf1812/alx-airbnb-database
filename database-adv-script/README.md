# SQL Queries and Indexing Task

## Objective

The goal of this project is to practice writing and optimizing SQL queries using different techniques, including joins, subqueries, window functions, and indexing. Additionally, query performance improvements are measured using tools like `EXPLAIN` or `ANALYZE`.

---

## Tasks and Highlights

### 1. **Joins**

- **INNER JOIN**: This query retrieves all bookings and the respective users who made those bookings. The query connects the `Booking` and `User` tables by matching the `user_id` in both tables. This ensures that only records with matching values in both tables are returned.

- **LEFT JOIN**: This query retrieves all properties and their reviews, including properties that have no reviews. It uses a `LEFT JOIN` between the `Property` and `Review` tables, ensuring that even properties with no corresponding reviews are included in the results.

- **FULL OUTER JOIN**: This query retrieves all users and all bookings, even if the user has no booking or if a booking is not linked to a user. The query connects the `User` and `Booking` tables using a `FULL OUTER JOIN`, which includes all records from both tables, even when there is no match.

### 2. **Subqueries**

- **Non-Correlated Subquery**: A non-correlated subquery is used to find all properties where the average rating is greater than 4.0. The subquery calculates the average rating for each property, and the main query filters for properties where this value exceeds 4.0.

- **Correlated Subquery**: A correlated subquery finds users who have made more than 3 bookings. The subquery is linked to the outer query via a correlation to the `user_id`, allowing it to count the number of bookings for each user and filter those who have more than 3.

### 3. **Aggregation and Window Functions**

- **Aggregation**: Using the `COUNT` function and `GROUP BY` clause, we can find the total number of bookings made by each user. This aggregation helps in summarizing the data based on specific attributes, like `user_id`.

- **Window Function**: A `RANK()` window function is used to rank properties based on the total number of bookings they have received. The `COUNT` function calculates the total bookings for each property, and the `RANK()` function assigns a rank to each property based on this count.

### 4. **Indexing**

- **Identifying High-Usage Columns**: To optimize query performance, we identify columns frequently used in `WHERE`, `JOIN`, and `ORDER BY` clauses. Common high-usage columns include `email` in the `User` table, `user_id` and `property_id` in the `Booking` table, and `location` in the `Property` table.

- **Creating Indexes**: Appropriate indexes are created on these columns to speed up data retrieval. For example, an index on `User.email` improves performance for lookups, while indexes on `Booking.user_id` and `Booking.property_id` speed up joins.

- **Measuring Performance**: To measure performance improvements, the `EXPLAIN` or `ANALYZE` command is used before and after creating indexes. This allows us to observe the impact of indexes on query execution time and optimize performance.

### 5. **Optimizing Queries**

- **EXPLAIN and ANALYZE**: These commands are used to analyze the query execution plan and capture performance metrics. By comparing the performance before and after adding indexes, we can determine how much improvement has been made.

---

## Files

- `database_index.sql`: Contains the `CREATE INDEX` statements for the identified high-usage columns.
- `joins_queries.sql`: Contains the SQL queries for INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.
- `README.md`: This file with task details and instructions.

---

## Conclusion

By following these steps, we have created optimized queries using various join types, subqueries, aggregation, and window functions. Additionally, the use of indexing has helped improve the performance of high-usage queries, and the effectiveness of these optimizations can be measured using `EXPLAIN` or `ANALYZE`.
