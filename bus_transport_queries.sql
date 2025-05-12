
-- 1. Show the first 5 rows from the table.
SELECT * FROM bus_transport_data LIMIT 5;

-- 2. Total number of records in the dataset.
SELECT COUNT(*) AS total_records FROM bus_transport_data;

-- 3. Trips made by BUS005.
SELECT COUNT(*) AS trip_count
FROM bus_transport_data
WHERE bus_id = 'BUS005';

-- 4. Unique bus routes.
SELECT DISTINCT route_number FROM bus_transport_data;

-- 5. Average passengers boarded per trip.
SELECT AVG(passengers_boarded) AS avg_boarded
FROM bus_transport_data;

-- 6. Date with highest total passengers.
SELECT date, SUM(passengers_boarded) AS total_boarded
FROM bus_transport_data
GROUP BY date
ORDER BY total_boarded DESC
LIMIT 1;

-- 7. Trips with more than 25 passengers.
SELECT * FROM bus_transport_data
WHERE passengers_boarded > 25;

-- 8. Most frequently visited stop.
SELECT stop_name, COUNT(*) AS visits
FROM bus_transport_data
GROUP BY stop_name
ORDER BY visits DESC
LIMIT 1;

-- 9. Trips on May 10, 2024.
SELECT * FROM bus_transport_data
WHERE date = '2024-05-10';

-- 10. Maximum and minimum passengers boarded.
SELECT MAX(passengers_boarded) AS max_boarded,
       MIN(passengers_boarded) AS min_boarded
FROM bus_transport_data;

-- 11. Categorize trips by load.
SELECT *,
  CASE
    WHEN passengers_boarded >= 25 THEN 'High'
    WHEN passengers_boarded >= 10 THEN 'Medium'
    ELSE 'Low'
  END AS load_category
FROM bus_transport_data;

-- 12. Top 3 stops by average boarding.
SELECT stop_name, AVG(passengers_boarded) AS avg_boarded
FROM bus_transport_data
GROUP BY stop_name
ORDER BY avg_boarded DESC
LIMIT 3;

-- 13. Calculate delay in minutes.
SELECT *,
  TIMESTAMPDIFF(MINUTE, arrival_time, actual_arrival_time) AS delay_minutes
FROM bus_transport_data;

-- 14. Top 5 routes by total passengers.
SELECT route_number, SUM(passengers_boarded) AS total_passengers
FROM bus_transport_data
GROUP BY route_number
ORDER BY total_passengers DESC
LIMIT 5;

-- 15. Trips with zero passengers.
SELECT COUNT(*) AS zero_passenger_trips
FROM bus_transport_data
WHERE passengers_boarded = 0;

-- 16. Route with most delays over 10 minutes.
SELECT route_number, COUNT(*) AS delayed_trips
FROM (
  SELECT *, TIMESTAMPDIFF(MINUTE, arrival_time, actual_arrival_time) AS delay
  FROM bus_transport_data
) AS delays
WHERE delay > 10
GROUP BY route_number
ORDER BY delayed_trips DESC
LIMIT 1;

-- 17. Total passengers per bus.
SELECT bus_id, SUM(passengers_boarded) AS total_boarded
FROM bus_transport_data
GROUP BY bus_id
ORDER BY total_boarded DESC;

-- 18. Average delay per stop.
SELECT stop_name, AVG(TIMESTAMPDIFF(MINUTE, arrival_time, actual_arrival_time)) AS avg_delay
FROM bus_transport_data
GROUP BY stop_name
ORDER BY avg_delay DESC;

-- 19. Rank each trip by passengers within route.
SELECT *,
       RANK() OVER (PARTITION BY route_number ORDER BY passengers_boarded DESC) AS rank_in_route
FROM bus_transport_data;

-- 20. Stops starting with 'Stop_1'.
SELECT * FROM bus_transport_data
WHERE stop_name LIKE 'Stop_1%';
