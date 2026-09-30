/*  1. Create a table called Orders with columns: order_id, user_id, payment_method, and amount. 
Insert at least 8 sample records representing different users and payment methods (like UPI, Card, Wallet, COD).
*/



CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT ,
    payment_method VARCHAR(20) ,
    amount DECIMAL(10, 2) 
);


INSERT INTO Orders (order_id, user_id, payment_method, amount) VALUES
(101, 1, 'UPI', 499.00),
(102, 2, 'Card', 1250.50),
(103, 3, 'COD', 799.00),
(104, 1, 'Wallet', 250.00),
(105, 4, 'UPI', 1899.00),
(106, 5, 'Card', 3499.00),
(107, 2, 'COD', 620.00),
(108, 6, 'UPI', 150.00),
(109, 3, 'Wallet', 890.00),
(110, 7, 'Card', 2150.00);


SELECT * FROM Orders;

-----------------------------------------------------------------------------------------------------


/*  2.  Write an SQL query to count how many orders were placed using each payment_method in the Orders table, 
similar to how Zomato shows payment breakdown in analytics.*/



select payment_method,count(*) as total_orders from Orders
group by payment_method;




-----------------------------------------------------------------------------------------------------


/*  3.  Write an SQL query to find the total amount spent by each user_id in the Orders table. Display user_id and their total spend.*/



select user_id,sum(amount) from orders
group by user_id;


-----------------------------------------------------------------------------------------------------



/*  4. Write an SQL query to show only those payment methods where the average order amount is greater than 300, 
using GROUP BY and HAVING.<br><br><em><strong>Hint:</strong> Use AVG(amount) in your HAVING clause.</em>
*/

select payment_method from orders
group by payment_method
having avg(amount)>300; 


-----------------------------------------------------------------------------------------------------


/*  5.  Explain the difference between WHERE and HAVING by giving one example query for each, 
using the Orders table. Your examples should show a scenario where WHERE and HAVING filter different things.
*/



-- WHERE
-- It will filter the data, row by row directly from the existing data present in the table.

-- example:- select * from orders where amount>1200;


-- HAVING
-- It will filter data,from the results coming after using group by and aggreate functions.

-- example:- select payment_method from orders
-- group by payment_method
-- having avg(amount)>300; 

