
-- QUESTION 1:
-- Create a CTE using the WITH clause to select all products with a rating 
-- above 4.5 from a 'Products' table, similar to how Flipkart or Myntra 
-- might highlight top-rated items.


WITH TopRatedProducts AS (
    SELECT 
        product_id,
        product_name,
        category,
        price,
        rating
    FROM Products
    WHERE rating > 4.5
)
SELECT 
    product_name,
    category,
    price,
    rating
FROM TopRatedProducts
ORDER BY rating DESC;



--------------------------------------------------------------------------------------------------------


-- QUESTION 2:
-- Rewrite a query that finds all restaurants in 'Ahmedabad' with delivery 
-- charges under 50 from a 'Restaurants' table, first using a subquery and 
-- then using a CTE. Compare both queries for readability.
-- Hint: Focus on making the CTE version cleaner and easier to understand.

SELECT 
    restaurant_name,
    city,
    delivery_charge
FROM (
    SELECT *
    FROM Restaurants
    WHERE city = 'Ahmedabad'
) AS AhmedabadRestaurants
WHERE delivery_charge < 50;


WITH AhmedabadRestaurants AS (
    SELECT *
    FROM Restaurants
    WHERE city = 'Ahmedabad'
)
SELECT 
    restaurant_name,
    city,
    delivery_charge
FROM AhmedabadRestaurants
WHERE delivery_charge < 50;

-- Readability Comparison:
-- In the subquery version, you have to read "inside-out" starting from the inner parentheses.
-- In the CTE version, logic reads top-to-bottom like regular sentences: define the subset first, then use it.





--------------------------------------------------------------------------------------------------------





-- QUESTION 3:
-- Using two CTEs in a single query, find the top 3 most-followed users 
-- and the top 3 most-liked posts from a 'Users' and 'Posts' table 
-- (think Instagram-style data). Output both lists in the same result set.



WITH TopUsers AS (
    SELECT 
        'User' AS item_type,
        username AS item_name,
        followers_count AS metric_count
    FROM Users
    ORDER BY followers_count DESC
    LIMIT 3
),
TopPosts AS (
    SELECT 
        'Post' AS item_type,
        caption AS item_name,
        likes_count AS metric_count
    FROM Posts
    ORDER BY likes_count DESC
    LIMIT 3
)
SELECT item_type, item_name, metric_count 
FROM TopUsers
UNION ALL
SELECT item_type, item_name, metric_count 
FROM TopPosts;



--------------------------------------------------------------------------------------------------------




-- QUESTION 4:
-- Write a recursive CTE that generates a list of dates for the next 7 days 
-- starting from today, similar to how BookMyShow shows available dates 
-- for movie bookings.
-- Hint: Use a base case for today and recursion to add one day at a time.




WITH RECURSIVE MovieBookingDates AS (
    -- Anchor member: Base case (Day 1 / Today)
    SELECT 
        CURRENT_DATE AS booking_date,
        0 AS day_offset

    UNION ALL

    -- Recursive member: Add 1 day on each iteration
    SELECT 
        booking_date + INTERVAL '1 day',
        day_offset + 1
    FROM MovieBookingDates
    WHERE day_offset < 6
)
SELECT 
    booking_date,
    TO_CHAR(booking_date, 'Dy, DD Mon') AS formatted_day
FROM MovieBookingDates;


--------------------------------------------------------------------------------------------------------



-- QUESTION 5:
-- Given a messy SQL query that finds all users with more than 1000 followers 
-- from a 'Users' table, refactor it to use a CTE for better clarity and maintainability.



WITH ActiveInfluencers AS (
    SELECT 
        id,
        username,
        followers_count,
        account_type
    FROM Users
    WHERE is_active = 1 
      AND is_deleted = 0
      AND account_type IN ('creator', 'influencer')
)
SELECT 
    id,
    username,
    followers_count,
    account_type
FROM ActiveInfluencers
WHERE followers_count > 1000
ORDER BY followers_count DESC;