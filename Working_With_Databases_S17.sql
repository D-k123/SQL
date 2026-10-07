
-- QUESTION 1:
-- Create a SQL table called Restaurant with columns: id, name, cuisine, 
-- location, and average_rating. Insert at least 5 sample rows representing 
-- popular restaurants from Zomato.



CREATE TABLE Restaurant (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cuisine VARCHAR(50) NOT NULL,
    location VARCHAR(100) NOT NULL,
    average_rating DECIMAL(3, 2) NOT NULL
);

INSERT INTO Restaurant (id, name, cuisine, location, average_rating) VALUES
(1, 'Bukhara', 'North Indian', 'ITC Maurya, New Delhi', 4.8),
(2, 'Punjab Grill', 'North Indian', 'Connaught Place, New Delhi', 4.4),
(3, 'Toscano', 'Italian', 'Indiranagar, Bengaluru', 4.5),
(4, 'Chianti', 'Italian', 'Koramangala, Bengaluru', 4.3),
(5, 'Mainland China', 'Chinese', 'Bandra West, Mumbai', 4.2);



--------------------------------------------------------------------------------------------------------


-- QUESTION 2:
-- Write a SQL query to generate a report showing the number of restaurants 
-- for each cuisine type from your Restaurant table, ordered by the count 
-- in descending order.
-- Hint: Use GROUP BY and ORDER BY.


SELECT 
    cuisine,
    COUNT(*) AS restaurant_count
FROM Restaurant
GROUP BY cuisine
ORDER BY restaurant_count DESC;



--------------------------------------------------------------------------------------------------------



-- QUESTION 3:
-- Add a new table called Review with columns: id, restaurant_id, user_name, 
-- rating, and review_date. Insert at least 10 sample reviews, linking them 
-- to restaurants using restaurant_id.

CREATE TABLE Review (
    id INT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    user_name VARCHAR(100) NOT NULL,
    rating DECIMAL(2, 1) NOT NULL,
    review_date DATE NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(id)
);

INSERT INTO Review (id, restaurant_id, user_name, rating, review_date) VALUES
(1, 1, 'Aarav Sharma', 5.0, '2024-03-01'),
(2, 1, 'Priya Patel', 4.5, '2024-03-05'),
(3, 1, 'Rohan Verma', 5.0, '2024-03-10'),
(4, 2, 'Neha Gupta', 4.0, '2024-03-02'),
(5, 2, 'Aditya Rao', 4.5, '2024-03-07'),
(6, 3, 'Kavya Nair', 4.5, '2024-03-03'),
(7, 3, 'Vikram Malhotra', 5.0, '2024-03-08'),
(8, 4, 'Sanya Iyer', 4.0, '2024-03-04'),
(9, 4, 'Ananya Das', 4.5, '2024-03-09'),
(10, 5, 'Rahul Mehta', 4.0, '2024-03-06');



--------------------------------------------------------------------------------------------------------



-- QUESTION 4:
-- Write a SQL query using a JOIN to display each restaurant's name, cuisine, 
-- and its average review rating (from the Review table), ordered by highest 
-- average rating first.
-- Hint: Use JOIN and GROUP BY with aggregate functions.



SELECT 
    r.name AS restaurant_name,
    r.cuisine,
    ROUND(AVG(rev.rating), 2) AS calculated_avg_rating
FROM Restaurant r
JOIN Review rev 
    ON r.id = rev.restaurant_id
GROUP BY 
    r.id, 
    r.name, 
    r.cuisine
ORDER BY calculated_avg_rating DESC;


--------------------------------------------------------------------------------------------------------



-- QUESTION 5:
-- Use a window function to rank restaurants by their average review rating 
-- within each cuisine type, showing the restaurant name, cuisine, average 
-- rating, and rank.
-- Hint: Use the RANK() or DENSE_RANK() window function partitioned by cuisine.


WITH RestaurantRatings AS (
    SELECT 
        r.id,
        r.name AS restaurant_name,
        r.cuisine,
        ROUND(AVG(rev.rating), 2) AS avg_rating
    FROM Restaurant r
    JOIN Review rev 
        ON r.id = rev.restaurant_id
    GROUP BY 
        r.id, 
        r.name, 
        r.cuisine
)
SELECT 
    restaurant_name,
    cuisine,
    avg_rating,
    DENSE_RANK() OVER (
        PARTITION BY cuisine 
        ORDER BY avg_rating DESC
    ) AS cuisine_rank
FROM RestaurantRatings
ORDER BY cuisine ASC, cuisine_rank ASC;