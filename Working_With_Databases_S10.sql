

-- -- QUESTION 1:
-- -- Create two tables: Influencers (id, name) and Collaborations 
-- -- (id, influencer1_id, influencer2_id, collab_date). Write a SQL FULL JOIN 
-- -- query to list all influencers and show their collaboration partner names 
-- -- if any, including influencers with no collaborations.


CREATE TABLE Influencers (
    id INT PRIMARY KEY,
    name VARCHAR(100) 
);

CREATE TABLE Collaborations (
    id INT PRIMARY KEY,
    influencer1_id INT,
    influencer2_id INT,
    collab_date DATE,
    FOREIGN KEY (influencer1_id) REFERENCES Influencers(id),
    FOREIGN KEY (influencer2_id) REFERENCES Influencers(id)
);

SELECT 
    i1.name AS influencer_name,
    i2.name AS partner_name,
    c.collab_date
FROM Influencers i1
FULL JOIN Collaborations c 
    ON i1.id = c.influencer1_id
FULL JOIN Influencers i2 
    ON c.influencer2_id = i2.id;
    
    


---------------------------------------------------------------------------------------------------------------------





-- QUESTION 2:
-- Using a SELF JOIN, write a query on a table called Playlists 
-- (id, user_id, playlist_name, parent_playlist_id) to display each playlist 
-- alongside its parent playlist name, similar to how Spotify shows nested playlists.
-- Hint: Join Playlists with itself on parent_playlist_id = id.



CREATE TABLE Playlists (
    id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100) NOT NULL,
    parent_playlist_id INT,
    FOREIGN KEY (parent_playlist_id) REFERENCES Playlists(id)
);



SELECT 
    child.playlist_name AS playlist,
    parent.playlist_name AS parent_playlist
FROM Playlists child
LEFT JOIN Playlists parent 
    ON child.parent_playlist_id = parent.id;
    
    
    
    

---------------------------------------------------------------------------------------------------------------------






-- QUESTION 3:
-- Given three tables: Users (id, username), Orders (id, user_id, order_date), 
-- and Payments (id, order_id, amount), write a SQL query using multiple JOINs 
-- to display each username, their order date, and payment amount, showing all 
-- users even if they have no orders or payments.


SELECT 
    u.username,
    o.order_date,
    p.amount AS payment_amount
FROM Users u
LEFT JOIN Orders o 
    ON u.id = o.user_id
LEFT JOIN Payments p 
    ON o.id = p.order_id;



---------------------------------------------------------------------------------------------------------------------



-- QUESTION 4:
-- You notice that your JOIN query between Zomato's Restaurants and Reviews 
-- tables is returning duplicate rows for some restaurants. Modify your query 
-- to eliminate duplicates and explain in one line why the duplicates were happening.
-- Hint: Use DISTINCT or GROUP BY and consider the relationship between restaurants and reviews.

SELECT DISTINCT 
    r.id AS restaurant_id,
    r.name AS restaurant_name,
    r.city
FROM Restaurants r
JOIN Reviews rev 
    ON r.id = rev.restaurant_id;
    

-- Why duplicates happen:
-- Duplicates occur because the relationship is one-to-many (one restaurant has multiple reviews), causing the restaurant row to repeat for every matching review.




---------------------------------------------------------------------------------------------------------------------




-- QUESTION 5:
-- Write two different JOIN queries on a Products and Categories table 
-- (like Flipkart) to list all products with their category names, but use 
-- different join conditions in each. Briefly explain which join condition 
-- is more efficient and why.


SELECT 
    p.id AS product_id,
    p.name AS product_name,
    c.name AS category_name
FROM Products p
INNER JOIN Categories c 
    ON p.category_id = c.id;



-- Efficiency Comparison:
-- (joining on numeric keys like p.category_id = c.id) is significantly faster because integer comparisons are cheap, consume less memory, and primary/foreign keys are indexed by default in relational databases.