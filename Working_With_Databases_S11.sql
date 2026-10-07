
-- QUESTION 1:
-- Create a SQL query using a subquery in the WHERE clause to find all 
-- restaurants from a 'Restaurants' table whose average rating is higher 
-- than the average rating of all restaurants in the city.

SELECT 
    restaurant_name,
    city,
    rating
FROM Restaurants
WHERE rating > (
    SELECT AVG(rating) 
    FROM Restaurants
);



--------------------------------------------------------------------------------------------




-- QUESTION 2:
-- Write a SQL query that uses a subquery in the SELECT statement to 
-- display each user's name from a 'Users' table along with the total number 
-- of orders they have placed from an 'Orders' table, like a summary you 
-- might see in a Zomato user profile.



SELECT 
    u.id AS user_id,
    u.name AS user_name,
    (
        SELECT COUNT(*)
        FROM Orders o
        WHERE o.user_id = u.id
    ) AS total_orders
FROM Users u;



--------------------------------------------------------------------------------------------




-- QUESTION 3:
-- Given a 'Movies' table and a 'Reviews' table, write a SQL query using 
-- IN with a subquery to list all movies that have at least one review with 
-- a rating of 5 stars, as seen in BookMyShow's top-rated section.



SELECT 
    m.id AS movie_id,
    m.title AS movie_title
FROM Movies m
WHERE m.id IN (
    SELECT r.movie_id
    FROM Reviews r
    WHERE r.rating = 5
);



--------------------------------------------------------------------------------------------





-- QUESTION 4:
-- Write a nested SQL query to find the names of all sellers from a 
-- 'Sellers' table on a Flipkart-style platform who have sold products in 
-- every category listed in a 'Categories' table.
-- Hint: Use nested subqueries to compare seller's categories with the complete list of categories.



SELECT 
    s.seller_name
FROM Sellers s
WHERE s.id IN (
    SELECT p.seller_id
    FROM Products p
    GROUP BY p.seller_id
    HAVING COUNT(DISTINCT p.category_id) = (
        SELECT COUNT(*) 
        FROM Categories
    )
);

