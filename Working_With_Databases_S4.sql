/*  1.  Create a table named MusicPlaylist with columns: id, song_name, artist, genre, and duration.
 Insert at least 5 records representing songs from your favorite Spotify playlist, then write a SELECT statement to retrieve 
 all columns for all songs.
*/

create table MusicPlaylist
(
id int PRIMARY KEY,
song_name varchar(25),
artist varchar(35),
genre varchar(15),
duration time
);

insert into MusicPlaylist VALUES(1,'Blinding Lights','The Weeknd','Pop','00:03:20'),
(2,'Shape of You','Ed Sheeran','Pop','00:03:53'),
(3,'Believer','Imagine Dragons','Rock','00:03:24'),
(4,'Perfect','Ed Sheeran','Romantic','00:04:23'),
(5,'Levitating','Dua Lipa','Pop','00:03:23');

select * from MusicPlaylist;


----------------------------------------------------------------------------------------


/*2.   Write a SQL query to display only the song_name and artist columns from the MusicPlaylist table,
 showing just the first 3 records using the LIMIT keyword.
*/

select song_name,artist from musicplaylist LIMIT 3;


----------------------------------------------------------------------------------------



/*  3.  Suppose you have a table named FoodOrders with columns:id, restaurant, food_item, and order_date. 
Write a SQL query to list all unique restaurant names where you have placed orders, using the DISTINCT keyword.
*/

CREATE TABLE FoodOrders (
    id int PRIMARY KEY,
    restaurant varchar(100),
    food_item varchar(100),
    order_date date
);

INSERT INTO FoodOrders (id, restaurant, food_item, order_date)
VALUES(1, 'Spice Garden', 'Paneer Tikka', '2026-08-25'),
(2, 'Pizza Hub', 'Margherita Pizza', '2026-08-26'),
(3, 'South Treat', 'Masala Dosa', '2026-08-26'),
(4, 'Burger Point', 'Veg Burger', '2026-08-27'),
(5, 'Food Corner', 'Biryani', '2026-08-28'),
(6, 'Spice Garden', 'Butter Naan', '2026-08-28'),
(7, 'Pizza Hub', 'Farmhouse Pizza', '2026-08-29'),
(8, 'South Treat', 'Idli Sambar', '2026-08-30');


select distinct restaurant from FoodOrders;


----------------------------------------------------------------------------------------


/* 4.  Write a SQL query on the FoodOrders table to select food_item as 'Dish' and order_date as 'Date Ordered', 
displaying only these two columns with the column aliases in the output.
*/

select food_item as 'Dish',order_date as 'Date Ordered' from FoodOrders;


----------------------------------------------------------------------------------------


/*   5. You tried running this query: SELECT DISTINCT food_item, restaurant FROM FoodOrders LIMIT 2,
 but it returns an error or doesn't work as expected. Identify and fix the mistake in the query.<br><br><em><strong>Hint:</strong> 
 Check the correct placement and usage of the LIMIT keyword in SQL syntax.</em>
*/

SELECT DISTINCT food_item,restaurant FROM FoodOrders LIMIT 2;
