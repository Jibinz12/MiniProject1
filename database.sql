CREATE DATABASE Prospera;
USE Prospera;

CREATE TABLE User_Data (
   -- User Information (login ke liye)
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(30) NOT NULL,
   username VARCHAR(30) NOT NULL UNIQUE,
   email VARCHAR(20) NOT NULL UNIQUE,
   
   -- Income Information (5 types ka)
   i1 INT NOT NULL, -- Yeh Salary ke liye
   i2 INT, -- Bonus
   i3 INT, -- Investment
   i4 INT, -- Gift
   i5 INT, -- Others
   
   -- Expense Information (5 types ka)
   e1 INT, -- Groceries
   e2 INT, -- Entertainment
   e3 INT, -- Education
   e4 INT, -- Rent
   e5 INT -- Others
);

ALTER TABLE User_Data AUTO_INCREMENT=20240;

-- Adding total_income and total_expense columns
ALTER TABLE User_Data
ADD total_income INT GENERATED ALWAYS AS (i1 + IFNULL(i2, 0) + IFNULL(i3, 0) + IFNULL(i4, 0) + IFNULL(i5, 0)) STORED;

ALTER TABLE User_Data
ADD total_expense INT GENERATED ALWAYS AS (e1 + IFNULL(e2, 0) + IFNULL(e3, 0) + IFNULL(e4, 0) + IFNULL(e5, 0)) STORED;
