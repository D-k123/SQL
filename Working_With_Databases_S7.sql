/*  1.  Create a table called Orders with columns: order_id, user_name, total_amount, and order_date. 
Insert 5 sample rows with different users and order amounts, including at least one NULL value for total_amount.
*/

create table Orders
(
order_id int PRIMARY KEY,
user_name varchar(20),
total_amount int,
order_date date
);

insert into Orders VALUES(1,'dhruv',0,'2026-08-06'),
(2,'tanish','211','2026-09-12'),
(3,'garima',364,'2026-08-17'),
(4,'gracia','350','2026-09-18'),
(5,'rahul','200','2026-08-06'),
(6,'rahul',250,'2026-08-02');

select * from Orders;


----------------------------------------------------------------------------------------------

/*  2.  Write a SQL query to count how many orders were placed by each user in the Orders table, 
displaying user_name and the number of orders as order_count.
*/


select user_name,Count(*) as order_count from Orders group by user_name;



----------------------------------------------------------------------------------------------


/*  3.  Write a SQL query to calculate the average total_amount of all orders in the Orders table, 
making sure to ignore any NULL values.
*/

select avg(total_amount) from Orders where total_amount>0;


----------------------------------------------------------------------------------------------


/*  4.  Suppose you are building a Flipkart-style dashboard: Write a SQL query to 
find the highest and lowest order amounts (MAX and MIN) from the Orders table, and display both values in a single result row.
*/

select max(total_amount),min(total_amount) from Orders;



----------------------------------------------------------------------------------------------


/*  5.  Write a SQL query to calculate the total sales (SUM of total_amount) for all orders, 
but only include orders where total_amount is not NULL.<br><br><em><strong>Hint:</strong>
 Use a WHERE clause to filter out NULL values before applying the SUM function.</em>
*/

select sum(total_amount) from Orders where total_amount>0;


