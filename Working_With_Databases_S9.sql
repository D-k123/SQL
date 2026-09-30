/*  1. Create two tables in your database: 'restaurants' (id, name, city) and 'dishes' (id, restaurant_id, dish_name, price). 
Insert at least 3 restaurants and 2-3 dishes for each restaurant.*/



CREATE TABLE restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50) 
);

CREATE TABLE dishes (
    dish_id INT PRIMARY KEY,
    dish_name VARCHAR(100),
    price DECIMAL(8, 2),
	restaurant_id INT ,
	foreign key(restaurant_id) references restaurants(id)
);


INSERT INTO restaurants VALUES
(1,'Trattoria Bella','Rome'),
(2,'Sakura Ramen','Tokyo'),
(3,'Le Petit Bistro','Paris'),
(4,'harikrushna','surat');

INSERT INTO dishes VALUES	
(1,'Margherita Pizza',489,1),
(2,'Cacio e Pepe',489,1),
(3,'Tiramisu',859,1),
(4,'Matcha Ice Cream',878,2),
(5,'Pork Gyoza',756,2),
(6,'Tonkotsu Ramen',456,2),
(7,'Crème Brûlée',897,3),
(8,'French Onion Soup',897,3),
(9,'Duck Confit',456,3),
(10,'pizza',789,4);




-------------------------------------------------------------------------------------------------------------


/* 2. Write an SQL INNER JOIN query to display each dish along with its restaurant name and city, 
similar to how Zomato shows dish details with the restaurant info.*/

select d.dish_name,r.name,r.city from restaurants r
INNER join dishes d
ON r.id=d.restaurant_id;


-------------------------------------------------------------------------------------------------------------



/*  3. Write an SQL LEFT JOIN query to list all restaurants and their dishes, showing restaurants even if they 
currently have no dishes on the menu.<br><br><em><strong>Hint:</strong> Use LEFT JOIN so restaurants without dishes 
still appear in the results with NULL for dish columns.</em>*/


select r.name,d.dish_name from restaurants r
LEFT JOIN dishes d
ON r.id=d.restaurant_id;




-------------------------------------------------------------------------------------------------------------




/*  4. Write an SQL RIGHT JOIN query to display all dishes and their restaurant names, including any dishes that might not
 be linked to a restaurant (simulate a data error where a dish has a restaurant_id that doesn't match any restaurant).*/
 
 
 
 
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
-- (`dishes`, CONSTRAINT `fk_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`))



-------------------------------------------------------------------------------------------------------------



/* 5. Given this scenario: You want to show a list of all playlists and the songs inside them, 
like Spotify. Explain which JOIN type (INNER, LEFT, or RIGHT) you would use to show all playlists, 
even if some are empty, and write the SQL query for it.*/

SELECT p.playlist_name, s.songs_name FROM playlists p
LEFT JOIN songs s
ON p.playlist_id = s.playlist_id;




