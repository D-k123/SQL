

/*  1.  Install MySQL or PostgreSQL on your system and create a new database named 'music_streaming_app' using the command line or 
GUI tool of your choice.*/

create database music_streaming_app;
use music_streaming_app;

--------------------------------------------------------------------------------------



/* 2.  Inside the 'music_streaming_app' database, create a table called 'playlists' with columns:
 playlist_id (integer, primary key), name (varchar), and created_by (varchar).
*/

create table playlists
(
playlist_id int PRIMARY KEY,
name varchar(20),
created_by varchar(20)
);

--------------------------------------------------------------------------------------




/*  3.   Insert three sample rows into the 'playlists' table representing playlists like 'Bollywood Hits', 'Chill Vibes', and
 'Workout Mix', each created by a different user.
*/

insert into playlists VALUES(1,'Bollywood Hits','dhruvil'),
(2,'Chill Vibes','Garima'),
(3,'Workout Mix','Amit');


select * from playlists;


--------------------------------------------------------------------------------------



/*  4.  Write an SQL SELECT query to display all playlists created by the user 'Amit' from the 'playlists' 
table.<br><br><em><strong>Hint:</strong> Use the WHERE clause to filter by the 'created_by' column.</em>
*/

select name from playlists where created_by='Amit';


-------------------------------------------------------------------------------------- 

 
 
/*  5.  Open ChatGPT or Copilot and ask it to explain the difference between a table, a row, and a column in SQL 
using an example from a food delivery app like Zomato. Paste the explanation you receive into your assignment.
*/



/*In a food delivery app like Zomato, SQL can be used to store and organize information about restaurants, customers, orders, and food items.

Table: A table is a collection of related data organized into rows and columns. For example, a Restaurants table could store information about different restaurants.

Row: A row represents one complete record in a table. For example, one row in the Restaurants table could contain information about a single restaurant, such as its name, location, and rating.

Column: A column represents a specific type of information stored for every record. For example, the Restaurants table might have columns such as Restaurant_ID, Name, Location, and Rating.

For example:

Restaurant_ID	Name	Location	Rating
101	        Spice Garden  Surat	      4.5
102	         Pizza Hub	  Surat	      4.2
103	        South Treat	  Surat	      4.6

Here, the entire table contains information about restaurants. The first row represents Spice Garden, so it is one record. The Name column contains the names of restaurants, while the Rating column contains their ratings.

In simple terms, a table is like a spreadsheet, a row is one record, and a column is one category of information about that record.*/