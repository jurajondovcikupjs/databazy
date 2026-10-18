DROP DATABASE IF EXISTS bookdb;
CREATE DATABASE IF NOT EXISTS bookdb;
USE bookdb;

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(300) NOT NULL
);

CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE owners (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE books (
    ISBN VARCHAR(17) PRIMARY KEY,
    Title VARCHAR(300) NOT NULL,
    author_id INT NOT NULL,
    genre_id INT NOT NULL,
    owner_id INT NOT NULL,
    YearPublished INT NOT NULL,
    BookCondition TINYINT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id) ON DELETE CASCADE,
    FOREIGN KEY (owner_id) REFERENCES owners(owner_id) ON DELETE CASCADE
);

CREATE TABLE borrowings (
    borrowing_id INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(17) NOT NULL,
    borrower_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE NULL,
    FOREIGN KEY (ISBN) REFERENCES books(ISBN) ON DELETE CASCADE,
    FOREIGN KEY (borrower_id) REFERENCES owners(owner_id) ON DELETE CASCADE
);


-- Majitelia
INSERT INTO owners (name) VALUES ('Juraj'), ('Matej'), ('Leonard'), ('Marcela');

-- Autori
INSERT INTO authors (name) VALUES 
('Kevin Sands'), ('Anton Stiffel'), ('Andy Weir'), 
('Ayn Rand'), ('Stendhal'), ('Blaise Pascal'), 
('Neal Shusterman'), ('Ján Drgonec'), ('Janette Oke'), 
('John Moe'), ('Igor Josifovic, Judith de Graaff'), ('Stephen King');

-- Žánre
INSERT INTO genres (name) VALUES 
('History/Magic'), ('Sci-fi'), ('Philosophical Fiction'), 
('Psychological Novel'), ('Fragments'), ('Odborné a naučné'), 
('History/Romantic'), ('Hobby');

-- Knihy (s odkazmi na autorov, žánre a majiteľov)
INSERT INTO books VALUES 
('978-80-566-1620-8', 'Alchymistova šifra', 1, 1, 1, 2015, 90),
('978-80-89968-83-1', 'Časonauti', 2, 2, 1, 2022, 85),
('978-80-566-3529-2', 'Posledná šanca', 3, 2, 1, 2021, 93),
('978-0-451-19115-1', 'The Fountainhead', 4, 3, 2, 1943, 72),
('978-0192839572', 'The Charterhouse of Parma', 5, 4, 2, 1839, 60),
('978-80-8179-160-4', 'Myšlienky', 6, 5, 2, 1670, 77),
('9781529538335', 'Scythe', 7, 2, 3, 2018, 86),
('9781442472464', 'Thunderhead', 7, 2, 3, 2019, 91),
('9788089603572', 'Ústavné právo hmotné', 8, 6, 3, 2018, 60),
('9788089993239', 'Keď srdce zavolá', 9, 7, 4, 2020, 88),
('9788099925398', 'Úžasný svet depresie', 10, 6, 4, 2020, 78),
('9788027106066', 'Urban Jungle', 11, 8, 4, 2017, 95);

-- Príklady výpožičiek
INSERT INTO borrowings (ISBN, borrower_id, borrow_date, return_date) VALUES 
('978-80-566-1620-8', 2, '2026-01-10', '2026-02-01'), -- Matej si požičal Jurajovu knihu a vrátil ju
('9781529538335', 1, '2026-03-15', NULL);            -- Juraj si požičal Leonardovu knihu a stále ju má