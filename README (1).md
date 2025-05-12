
# Bus Transport Data SQL Project

This project contains beginner-friendly SQL queries designed to analyze a fictional public bus transport dataset. The dataset includes 400 rows of information about bus trips, routes, stops, and passengers.

## Dataset Overview

**Table Name:** `bus_transport_data`

### Columns:

- `trip_id` (INT): Unique ID for each trip
- `bus_id` (VARCHAR): Bus identifier (e.g., BUS001)
- `route_number` (VARCHAR): Route ID (e.g., R01)
- `stop_name` (VARCHAR): Name of the bus stop
- `arrival_time` (TIME): Scheduled arrival time
- `actual_arrival_time` (TIME): Actual arrival time
- `passengers_boarded` (INT): Number of passengers who boarded
- `date` (DATE): Date of the trip

---

## SQL Topics Covered

This project helps demonstrate knowledge of:

- Basic SELECT queries
- Filtering with WHERE
- Aggregate functions (`COUNT`, `AVG`, `SUM`, `MAX`, `MIN`)
- `GROUP BY` and `ORDER BY`
- `CASE` statements
- String functions (`LIKE`)
- Window functions (`RANK`, `PARTITION BY`)
- Subqueries and derived tables
- Calculating time differences

---

## Query Examples

Below are some examples of the queries in the project:

### 1. Total number of records:
```sql
SELECT COUNT(*) AS total_records FROM bus_transport_data;
```

### 2. Average passengers boarded:
```sql
SELECT AVG(passengers_boarded) AS avg_boarded FROM bus_transport_data;
```

### 3. Most frequently visited stop:
```sql
SELECT stop_name, COUNT(*) AS visits
FROM bus_transport_data
GROUP BY stop_name
ORDER BY visits DESC
LIMIT 1;
```

### 4. Categorize trips based on load:
```sql
SELECT *,
  CASE
    WHEN passengers_boarded >= 25 THEN 'High'
    WHEN passengers_boarded >= 10 THEN 'Medium'
    ELSE 'Low'
  END AS load_category
FROM bus_transport_data;
```

### 5. Rank trips by boarding within each route:
```sql
SELECT *,
       RANK() OVER (PARTITION BY route_number ORDER BY passengers_boarded DESC) AS rank_in_route
FROM bus_transport_data;
```

---

## How to Use

1. Download the `bus_transport_queries.sql` file.
2. Run the SQL file in your favorite SQL client or DBMS (MySQL, PostgreSQL, etc.).
3. Use the queries for practice or interviews.

---

## License

This project is open-source and free to use under the MIT license.
