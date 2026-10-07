


-- QUESTION 1:
-- Install MySQL Community Server or SQLite on your system and verify the 
-- installation by connecting to the database using the command line or a 
-- GUI tool like MySQL Workbench or DB Browser for SQLite.



SELECT VERSION() AS database_version;


------------------------------------------------------------------------------------------------




-- QUESTION 2:
-- Create a new database named 'foodie_app' to simulate a Zomato-style backend.



CREATE DATABASE IF NOT EXISTS foodie_app;

USE foodie_app;



------------------------------------------------------------------------------------------------





-- QUESTION 3:
-- Write a CREATE TABLE statement to define a 'restaurants' table in the 
-- 'foodie_app' database with the following columns: id (integer, primary key), 
-- name (varchar/character, max 100), cuisine (varchar/character, max 50), 
-- rating (decimal, e.g., 4.5), and location (varchar/character, max 100).



CREATE TABLE restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cuisine VARCHAR(50) NOT NULL,
    rating DECIMAL(2, 1),
    location VARCHAR(100) NOT NULL
);


------------------------------------------------------------------------------------------------


-- QUESTION 4:
-- Design and create a 'users' table for a Flipkart-style app with columns: 
-- user_id (primary key), username, email, phone_number, and created_at (date/time). 
-- Pick appropriate data types for each column.
-- Hint: Think about which columns should be unique and which data types best fit email and phone numbers.



CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


------------------------------------------------------------------------------------------------



-- QUESTION 5:
-- Intentionally make a mistake in your CREATE TABLE statement (such as 
-- missing a comma or using an unsupported data type), run it, and then fix 
-- the error based on the message you receive.

/*

CREATE TABLE invalid_table_demo (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)     
    price DECIMAL(10, 2) NOT NULL
);

DATABASE ERROR MESSAGE:
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual 
that corresponds to your MySQL server version for the right syntax to use 
near 'price DECIMAL(10, 2) NOT NULL)' at line 4.
*/

CREATE TABLE valid_table_demo (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),       
    price DECIMAL(10, 2) NOT NULL
);

