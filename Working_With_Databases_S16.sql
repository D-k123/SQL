
-- QUESTION 1:
-- Import a CSV file of food delivery orders (with columns like order_id, 
-- restaurant_name, customer_name, order_amount, order_date) into a new 
-- SQL table named FoodOrders using your database tool of choice.

CREATE TABLE FoodOrders (
    order_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    order_amount DECIMAL(10, 2) NOT NULL,
    order_date DATE NOT NULL
);


----------------------------------------------------------------------------------------------------------


-- QUESTION 2:
-- Write SQL statements to create a table called TopSongs with columns: 
-- song_id, song_title, artist, streams, and release_date, then insert 
-- at least 5 records representing popular tracks from Spotify.

CREATE TABLE TopSongs (
    song_id INT PRIMARY KEY,
    song_title VARCHAR(150) NOT NULL,
    artist VARCHAR(100) NOT NULL,
    streams BIGINT NOT NULL,          
    release_date DATE NOT NULL
);

INSERT INTO TopSongs (song_id, song_title, artist, streams, release_date) VALUES
(1, 'Blinding Lights', 'The Weeknd', 4200000000, '2019-11-29'),
(2, 'Shape of You', 'Ed Sheeran', 3900000000, '2017-01-06'),
(3, 'Someone You Loved', 'Lewis Capaldi', 3400000000, '2018-11-08'),
(4, 'Starboy', 'The Weeknd', 3200000000, '2016-09-21'),
(5, 'As It Was', 'Harry Styles', 3100000000, '2022-04-01');



----------------------------------------------------------------------------------------------------------






-- QUESTION 3:
-- Write an SQL query to find the top 3 customers who ordered the most from 
-- the FoodOrders table based on total order_amount, and display their names 
-- and total spent.



SELECT 
    customer_name,
    SUM(order_amount) AS total_spent
FROM FoodOrders
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 3;




----------------------------------------------------------------------------------------------------------





-- QUESTION 4:
-- Generate a product performance report by writing an SQL query that lists 
-- each restaurant_name from FoodOrders, the number of orders, and the total 
-- order_amount, ordered by total order_amount descending.
-- Hint: Use GROUP BY and ORDER BY clauses.



SELECT 
    restaurant_name,
    COUNT(order_id) AS total_orders,
    SUM(order_amount) AS total_revenue
FROM FoodOrders
GROUP BY restaurant_name
ORDER BY total_revenue DESC;




----------------------------------------------------------------------------------------------------------




-- QUESTION 5:
-- Create an SQL query that calculates two KPIs for the FoodOrders table: 
-- (1) average order_amount and (2) total number of unique customers, and 
-- format the output for dashboard display (two columns: kpi_name, kpi_value).


SELECT 
    'Average Order Value' AS kpi_name,
    CAST(ROUND(AVG(order_amount), 2) AS VARCHAR) AS kpi_value
FROM FoodOrders

UNION ALL

SELECT 
    'Total Unique Customers' AS kpi_name,
    CAST(COUNT(DISTINCT customer_name) AS VARCHAR) AS kpi_value
FROM FoodOrders;