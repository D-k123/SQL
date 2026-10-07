
-- QUESTION 1:
-- Create a table called Playlist with columns: id (INT, primary key), 
-- song_name (VARCHAR), artist (VARCHAR), and duration (INT, seconds). 
-- Insert a single row for your current favorite song.

CREATE TABLE Playlist (
    id INT PRIMARY KEY,
    song_name VARCHAR(100) NOT NULL,
    artist VARCHAR(100) NOT NULL,
    duration INT NOT NULL -- duration in seconds
);

INSERT INTO Playlist (id, song_name, artist, duration) 
VALUES (1, 'Starboy', 'The Weeknd', 230);


---------------------------------------------------------------------------------------------------



-- QUESTION 2:
-- Insert 3 new rows into the Playlist table for songs you recently listened 
-- to on Spotify, including their song_name, artist, and duration.


INSERT INTO Playlist (id, song_name, artist, duration) VALUES
(2, 'Tum Hi Ho', 'Arjit Singh', 262),      
(3, 'Intro Interlude', 'Various Artists', 105),
(4, 'Brown Munde', 'AP Dhillon', 266);



---------------------------------------------------------------------------------------------------





-- QUESTION 3:
-- Update the artist name for one of your Playlist entries to fix a typo 
-- (for example, change 'Arjit Singh' to 'Arijit Singh') using the UPDATE 
-- statement with a WHERE clause.



UPDATE Playlist
SET artist = 'Arijit Singh'
WHERE artist = 'Arjit Singh';


---------------------------------------------------------------------------------------------------





-- QUESTION 4:
-- Delete a song from the Playlist table where the duration is less than 
-- 120 seconds using the DELETE statement and a WHERE clause.
-- Hint: Make sure your WHERE clause is specific so you don’t accidentally delete all rows.


DELETE FROM Playlist
WHERE duration < 120;




---------------------------------------------------------------------------------------------------




-- QUESTION 5:
-- Write an SQL statement that would update the song_name for all songs by 
-- 'AP Dhillon' in your Playlist to add '(Remix)' at the end of the name, 
-- but only if the duration is more than 180 seconds.
-- Constraint: Combine UPDATE with WHERE to target only the correct rows.



UPDATE Playlist
SET song_name = CONCAT(song_name, ' (Remix)')
WHERE artist = 'AP Dhillon'
  AND duration > 180;

