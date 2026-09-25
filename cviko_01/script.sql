USE bookdb;

CREATE TABLE books
(
	ISBN VARCHAR(17) NOT NULL,
    Title VARCHAR(300) NOT NULL,
    Author VARCHAR(300) NOT NULL,
    Genre VARCHAR(300)NOT NULL,
    YearPublished YEAR NOT NULL,
    BeingRead BOOL NOT NULL,
    CurrentPage INT
);

INSERT INTO books VALUES ('978-80-566-1620-8',  'Alchymistova šifra', 'Kevin Sands', 'History/Magic', 2015, false, NULL);
INSERT INTO books VALUES ('978-80-89968-83-1',  'Časonauti', 'Anton Stiffel', 'Sci-fi', 2022, false, NULL);
INSERT INTO books VALUES ('978-80-566-3529-2',  'Posledná šanca', 'Andy Weir', 'Sci-fi', 2021, true, 253);