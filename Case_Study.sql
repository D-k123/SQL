
-- QUESTION 1:
-- Write an SQL query to find the top 5 highest-rated restaurants in Koramangala 
-- that serve North Indian cuisine, using the Zomato Bangalore dataset.


SELECT 
    name,
    location,
    cuisines,
    rate AS rating
FROM zomato_bangalore
WHERE location LIKE '%Koramangala%'
  AND cuisines LIKE '%North Indian%'
  AND rate IS NOT NULL
ORDER BY rate DESC
LIMIT 5;


-------------------------------------------------------------------------------------------------------------



-- QUESTION 2:
-- Using SQL, calculate the average cost for two people for each cuisine type 
-- and list the 3 most expensive cuisines to eat in Bangalore.



SELECT 
    cuisines,
    ROUND(AVG(approx_cost), 2) AS avg_cost_for_two
FROM zomato_bangalore
WHERE approx_cost IS NOT NULL
GROUP BY cuisines
ORDER BY avg_cost_for_two DESC
LIMIT 3;



-------------------------------------------------------------------------------------------------------------




-- QUESTION 3:
-- Find all restaurants that offer online delivery but have a rating below 3.0, 
-- and suggest a marketing strategy to improve their ratings based on your findings.
-- Hint: Look for patterns in location, cuisine, or price that might explain the low ratings.

SELECT 
    name,
    location,
    cuisines,
    approx_cost,
    rate AS rating,
    votes
FROM zomato_bangalore
WHERE online_order = 'Yes'
  AND rate < 3.0
ORDER BY rate ASC;

/*
MARKETING & OPERATIONAL STRATEGY:
---------------------------------
1. Root-Cause Delivery Audits:
   Low ratings on delivery orders usually point to delayed delivery, soggy packaging, 
   or missing items. Audit dispatch times and switch to spill-proof/insulated packaging.

2. Menu Engineering for Delivery:
   High-complexity dishes often travel poorly. Prune items with high complaint rates 
   and spotlight sturdy "delivery-friendly" bestsellers with promotional discounts.

3. "Rate & Recover" Closed-Loop Feedback:
   Target dissatisfied users directly with Zomato chat support, offering instant 
   refunds or discount vouchers on their next order to encourage updated ratings.
*/




-------------------------------------------------------------------------------------------------------------



-- QUESTION 4:
-- Write an SQL query to segment restaurants into three market segments 
-- based on average cost for two: budget (below 400), mid-range (400-800), 
-- and premium (above 800). Count how many restaurants fall into each segment.



WITH PriceSegmentation AS (
    SELECT 
        name,
        approx_cost,
        CASE 
            WHEN approx_cost < 400 THEN 'Budget'
            WHEN approx_cost BETWEEN 400 AND 800 THEN 'Mid-Range'
            ELSE 'Premium'
        END AS price_segment
    FROM zomato_bangalore
    WHERE approx_cost IS NOT NULL
)
SELECT 
    price_segment,
    COUNT(*) AS restaurant_count
FROM PriceSegmentation
GROUP BY price_segment
ORDER BY restaurant_count DESC;


-------------------------------------------------------------------------------------------------------------

-- QUESTION 5:
-- Use ChatGPT or Copilot to help you write an SQL query that lists the 
-- top 10 most popular restaurant chains (by number of outlets) in the dataset, 
-- then run and validate the query yourself.
-- Hint: Search for 'SQL group by count example' if you get stuck.



SELECT 
    name AS chain_name,
    COUNT(*) AS total_outlets,
    ROUND(AVG(rate), 2) AS average_chain_rating
FROM zomato_bangalore
WHERE name IS NOT NULL
GROUP BY name
ORDER BY total_outlets DESC
LIMIT 10;