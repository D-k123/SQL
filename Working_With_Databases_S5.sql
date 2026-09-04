/*  1. Create a table called Restaurants with columns: id, name, cuisine, rating, and city. 
Insert at least 5 sample records representing real or fictional restaurants you might find on Zomato.
*/

CREATE TABLE Restaurants (
    id INT,
    name varchar(100),
    cuisine varchar(100),
    rating decimal(2,1),
    city varchar(50)
);


INSERT INTO Restaurants
VALUES
(1, 'Spice Garden', 'North Indian', 4.5, 'Surat'),
(2, 'Pizza Hub', 'Italian', 4.2, 'Surat'),
(3, 'South Treat', 'South Indian', 4.6, 'Ahmedabad'),
(4, 'Burger Point', 'Fast Food', 4.3, 'Mumbai'),
(5, 'Food Corner', 'Chinese', 4.4, 'Pune');

select * from Restaurants;


-----------------------------------------------------------------------------------------------------------------------

/*   2.  Write a SQL query to find all restaurants in the Restaurants table that have a rating greater 
than 4.0 and are located in either 'Ahmedabad' or 'Surat'.
*/

select name from Restaurants where rating>'4.0' and city in('Ahmedabad','Surat');



-----------------------------------------------------------------------------------------------------------------------


/*  3. Using the LIKE operator, write a query to select all restaurants whose names 
start with 'Swa' (for example, 'Swagat', 'Swadisht') from the Restaurants table.<br><br><em><strong>Hint:</strong> Use LIKE 'Swa%'.</em>
*/

select name from Restaurants where name LIKE 'Swa%';


-----------------------------------------------------------------------------------------------------------------------




/*  4.  Write a SQL query using the BETWEEN keyword to find all restaurants
 in the Restaurants table with a rating between 3.5 and 4.5 (inclusive).
*/

select name from Restaurants where rating between 3.5 and 4.5; 



-----------------------------------------------------------------------------------------------------------------------





/*   5.  Write a query to find all restaurants whose cuisine is either 'Chinese', 'Italian', or 'South Indian' using the IN operator.*/

select name from Restaurants where cuisine In('Chinese', 'Italian', 'South Indian');

