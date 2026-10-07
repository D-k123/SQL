
-- QUESTION 1:
-- Write an SQL query to display the total number of songs uploaded by each 
-- artist from a table 'songs' (columns: song_id, artist_name, title) and 
-- show only those artists who have uploaded more than 3 songs.


SELECT 
    artist_name,
    COUNT(song_id) AS total_songs
FROM songs
GROUP BY artist_name
HAVING COUNT(song_id) > 3;


------------------------------------------------------------------------------------------------------




-- QUESTION 2:
-- Given two tables, 'orders' (order_id, user_id, amount) and 'users' 
-- (user_id, username), write a SQL JOIN query to display each username 
-- along with their total order amount.


SELECT 
    u.username,
    COALESCE(SUM(o.amount), 0) AS total_order_amount
FROM users u
LEFT JOIN orders o 
    ON u.user_id = o.user_id
GROUP BY 
    u.user_id, 
    u.username;


------------------------------------------------------------------------------------------------------
    
    


-- QUESTION 3:
-- Write a SQL subquery to find the names of all restaurants from a 
-- 'restaurants' table (id, name, rating) whose rating is higher than the 
-- average rating of all restaurants.


SELECT 
    name,
    rating
FROM restaurants
WHERE rating > (
    SELECT AVG(rating) 
    FROM restaurants
);



------------------------------------------------------------------------------------------------------



-- QUESTION 4:
-- Using a 'transactions' table (id, user_id, amount, transaction_date), 
-- write a SQL query with a window function to display each user's transaction 
-- amount and their running total (cumulative sum) ordered by transaction_date.

SELECT 
    user_id,
    id AS transaction_id,
    transaction_date,
    amount,
    SUM(amount) OVER (
        PARTITION BY user_id 
        ORDER BY transaction_date ASC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM transactions;



------------------------------------------------------------------------------------------------------




-- QUESTION 5:
-- List two optimizations you would apply to speed up a query that filters 
-- Flipkart products by category and price, and briefly explain how each helps.
-- Hint: Think about indexes and query structure.

/*
1. Create a Composite B-Tree Index on (category_id, price):
   --------------------------------------------------------
   SQL: CREATE INDEX idx_products_cat_price ON products (category_id, price);
   
   How it helps:
   Instead of scanning every single product in the entire catalog (Full Table Scan), 
   the database engine jumps directly to the matching category bucket and then performs 
   a fast binary range scan on the sorted price values. Putting the exact match 
   (category) first and the range filter (price) second yields maximum search speed.

2. Avoid SELECT * by Selecting Only Required Columns (Index-Only / Covering Query):
   --------------------------------------------------------------------------------
   SQL: SELECT product_id, product_name, price FROM products WHERE category_id = 5 AND price <= 1000;
   
   How it helps:
   Requesting only the specific attributes needed saves network bandwidth, lowers memory 
   consumption, and allows the query planner to read data directly from the index cache 
   without having to fetch entire wide rows from disk storage.
*/