DROP DATABASE IF EXISTS bookdb;

CREATE DATABASE IF NOT EXISTS bookdb;

USE bookdb;

CREATE TABLE books
(
	ISBN VARCHAR(17) NOT NULL, -- Unique ISBN Number
    Title VARCHAR(300) NOT NULL, -- Title of the book
    Author VARCHAR(300) NOT NULL, -- Author of the book
    Genre VARCHAR(300)NOT NULL, -- Genre of the book
    YearPublished INT NOT NULL, -- Year of publication
    Used BOOL NOT NULL, -- Whether the book was used or not
    BookCondition TINYINT NOT NULL -- Condition of the book, 0 - 100
    
);