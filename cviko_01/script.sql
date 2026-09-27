DROP DATABASE IF EXISTS bookdb;

CREATE DATABASE IF NOT EXISTS bookdb;

USE bookdb;

CREATE TABLE books
(
	ISBN VARCHAR(17) NOT NULL, -- Unique ISBN Number
    Title VARCHAR(300) NOT NULL, -- Title of the book
    Author VARCHAR(300) NOT NULL, -- Author of the book
    Genre VARCHAR(300)NOT NULL, -- Genre of the book
    YearPublished YEAR NOT NULL, -- Year of publication
    Used BOOL NOT NULL, -- Whether the book was used or not
    BookCondition TINYINT NOT NULL -- Condition of the book, 0 - 100
    
);

--Ondrej
INSERT INTO books VALUES ('978-80-566-1620-8',  'Alchymistova šifra', 'Kevin Sands', 'History/Magic', 2015, true, 90);
INSERT INTO books VALUES ('978-80-89968-83-1',  'Časonauti', 'Anton Stiffel', 'Sci-fi', 2022, true, 85);
INSERT INTO books VALUES ('978-80-566-3529-2',  'Posledná šanca', 'Andy Weir', 'Sci-fi', 2021, true, 93);

--Matej
INSERT INTO books VALUES ('978-0-451-19115-1', 'The Fountainhead', 'Ayn Rand', 'Philosophical Fiction', 1943, true, 72)	
INSERT INTO books VALUES ('978-0192839572', 'The Charterhouse of Parma', 'Stendhal', 'Psychological Novel', 1839, true, 60)
INSERT INTO books VALUES ('978-80-8179-160-4', 'Myšlienky', 'Blaise Pascal', 'Fragments', 1670, true, 77)	

--Leonard
INSERT INTO books VALUES ('9781529538335', 'Scythe', 'Neal Shusterman', 'Sci-fi', 2018, true, 86)	
INSERT INTO books VALUES ('9781442472464', 'Thunderhead', 'Neal Shusterman', 'Sci-fi', 2019, true, 91)
INSERT INTO books VALUES ('9788089603572', 'Ústavné právo hmotné', 'Ján Drgonec', 'Odborné a naučné', 2018, true, 60)	
	
SELECT * FROM books;
