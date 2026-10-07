
-- QUESTION 1:
-- Create a table called Orders with columns: order_id, user_id, order_date, 
-- and total_amount. Insert at least 7 sample rows representing different users 
-- and dates, similar to how food orders appear in Zomato or Swiggy.

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL
);

INSERT INTO Orders (order_id, user_id, order_date, total_amount) VALUES
(101, 1, '2024-03-01', 350.00),
(102, 1, '2024-03-05', 420.00),
(103, 1, '2024-03-12', 280.00),
(104, 1, '2024-03-18', 550.00),
(105, 2, '2024-03-02', 199.00),
(106, 2, '2024-03-09', 650.00),
(107, 3, '2024-03-04', 499.00);




-----------------------------------------------------------------------------------------------------------------



-- QUESTION 2:
-- Write a SQL query using the LAG() function to show each user's order_id, 
-- order_date, and the total_amount of their previous order (if any), ordered 
-- by user and date.
-- Hint: Use PARTITION BY user_id and ORDER BY order_date in your window function.



SELECT 
    user_id,
    order_id,
    order_date,
    total_amount,
    LAG(total_amount, 1) OVER (
        PARTITION BY user_id 
        ORDER BY order_date ASC
    ) AS previous_order_amount
FROM Orders;




-----------------------------------------------------------------------------------------------------------------



-- QUESTION 3:
-- Using the same Orders table, write a SQL query with the LEAD() function 
-- to display each order_id, order_date, and the next order's total_amount 
-- for the same user.


SELECT 
    user_id,
    order_id,
    order_date,
    total_amount,
    LEAD(total_amount, 1) OVER (
        PARTITION BY user_id 
        ORDER BY order_date ASC
    ) AS next_order_amount
FROM Orders;



-----------------------------------------------------------------------------------------------------------------





-- QUESTION 4:
-- Write a SQL query to calculate the running total of total_amount for each 
-- user, showing order_id, order_date, total_amount, and a column running_total 
-- that accumulates the sum as you move through each user's orders.
-- Hint: Use SUM(total_amount) OVER (PARTITION BY user_id ORDER BY order_date 
-- ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW).



SELECT 
    user_id,
    order_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY user_id 
        ORDER BY order_date ASC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM Orders;



-----------------------------------------------------------------------------------------------------------------




-- QUESTION 5:
-- Write a SQL query to calculate a 3-order moving average of total_amount 
-- for each user, showing order_id, order_date, total_amount, and moving_avg columns.
-- Constraint: Use SUM() OVER() with ROWS BETWEEN 2 PRECEDING AND CURRENT ROW 
-- to compute the moving average.



SELECT 
    user_id,
    order_id,
    order_date,
    total_amount,
    ROUND(
        SUM(total_amount) OVER (
            PARTITION BY user_id 
            ORDER BY order_date ASC
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) / 
        COUNT(*) OVER (
            PARTITION BY user_id 
            ORDER BY order_date ASC
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS moving_avg
FROM Orders;