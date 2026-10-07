
-- QUESTION 1:
-- Create a table named Playlists with columns: id, user_id, playlist_name, 
-- and total_likes. Insert at least 8 sample rows with different users and 
-- playlists, making sure some playlists have the same user_id.

CREATE TABLE Playlists (
    id INT PRIMARY KEY,
    user_id INT NOT NULL,
    playlist_name VARCHAR(100) NOT NULL,
    total_likes INT NOT NULL DEFAULT 0
);

INSERT INTO Playlists (id, user_id, playlist_name, total_likes) VALUES
(1, 101, 'Lo-Fi Chill Beats', 450),
(2, 101, 'Morning Acoustic', 250),
(3, 101, 'Workout EDM Hype', 620),
(4, 102, 'Bollywood Hits 2024', 980),
(5, 102, 'Indie Road Trip', 250),
(6, 102, 'Late Night Drive', 510),
(7, 103, 'Deep Focus Coding', 800),
(8, 103, 'Classical Study', 340);




--------------------------------------------------------------------------------------------------------------


-- QUESTION 2:
-- Write a SQL query using ROW_NUMBER() and the OVER() clause to assign 
-- a unique row number to each playlist, ordered by total_likes in descending order.


SELECT 
    playlist_name,
    user_id,
    total_likes,
    ROW_NUMBER() OVER (ORDER BY total_likes DESC) AS overall_row_num
FROM Playlists;


--------------------------------------------------------------------------------------------------------------




-- QUESTION 3:
-- Use the RANK() function with the OVER() clause to rank all playlists 
-- by total_likes, and display the playlist_name, user_id, total_likes, 
-- and their rank.



SELECT 
    playlist_name,
    user_id,
    total_likes,
    RANK() OVER (ORDER BY total_likes DESC) AS playlist_rank
FROM Playlists;



--------------------------------------------------------------------------------------------------------------





-- QUESTION 4:
-- Write a SQL query using DENSE_RANK() and PARTITION BY user_id to rank 
-- each user's playlists by total_likes, showing playlist_name, user_id, 
-- total_likes, and dense rank.
-- Hint: This will show how popular each playlist is within each user's account, 
-- similar to how Spotify might rank your top playlists.



SELECT 
    playlist_name,
    user_id,
    total_likes,
    DENSE_RANK() OVER (
        PARTITION BY user_id 
        ORDER BY total_likes DESC
    ) AS user_playlist_rank
FROM Playlists;




--------------------------------------------------------------------------------------------------------------



-- QUESTION 5:
-- Imagine you want to show the top 2 playlists per user based on total_likes, 
-- like Spotify's 'Your Top Playlists' feature. Write a query using a window 
-- function to select only the top 2 playlists for each user.



WITH RankedPlaylists AS (
    SELECT 
        playlist_name,
        user_id,
        total_likes,
        DENSE_RANK() OVER (
            PARTITION BY user_id 
            ORDER BY total_likes DESC
        ) AS playlist_rank
    FROM Playlists
)
SELECT 
    user_id,
    playlist_name,
    total_likes,
    playlist_rank
FROM RankedPlaylists
WHERE playlist_rank <= 2
ORDER BY user_id ASC, playlist_rank ASC;