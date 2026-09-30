/*   1.  Write an SQL query to display all products from a 'products' table and sort them by price in ascending order,
 similar to how Flipkart lists items from lowest to highest price.
*/

select * from products 
order by price;


-----------------------------------------------------------------------------------------------------



/*   2.  Modify your previous query to show the top 5 most expensive products using ORDER BY with DESC and LIMIT.*/

select * from products 
order by price desc
limit 5;



-----------------------------------------------------------------------------------------------------


/*  3. Given a 'movies' table with columns 'title', 'release_year', and 'rating', 
write an SQL query to list all movies sorted first by release_year in descending order (latest first), 
then by rating in descending order (highest rated first).
*/

select title from movies 
order by release_year desc,rating desc;




-----------------------------------------------------------------------------------------------------



/*  4. Write an SQL query to display the first 10 restaurants from a 'restaurants' table, 
sorted alphabetically by name, just like Zomato's A-Z listing.<br><br><em><strong>Hint:</strong> Use ORDER BY with LIMIT.</em>
*/


select name from restaurants 
order by name 
limit 10;


-----------------------------------------------------------------------------------------------------


/*  5.  Suppose you want to display the top 3 trending songs from a 'songs' table based on play_count, 
but if two songs have the same play_count, the more recently added song should come first. 
Write the SQL query to achieve this.<br><br><em><strong>Hint:</strong> Use ORDER BY with multiple columns.</em>
*/

select songs_name from songs
order by play_count desc,songs_date desc
limit 3;

