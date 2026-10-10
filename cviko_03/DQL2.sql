SELECT 
    UPPER(Title) AS Nazov_Velkymi, 
    Author, 
    (2026 - YearPublished) AS Vek_Knihy
FROM books
WHERE YearPublished > 2010
ORDER BY YearPublished DESC;

SELECT Title, Author, Genre
FROM books
WHERE LENGTH(Title) > 15 
  AND (LEFT(Author, 1) = 'A' OR LEFT(Author, 1) = 'J')
ORDER BY Title ASC;

SELECT Title, BookCondition, YearPublished
FROM books
WHERE YearPublished >= 2000
ORDER BY LENGTH(Author) DESC;

SELECT 
    CONCAT(Author, ' - ', Title) AS Kniha_Info,
    ROUND(BookCondition / 10.0, 1) AS Desatinne_Skore
FROM books
WHERE BookCondition < 100
ORDER BY ROUND(BookCondition / 10.0, 1) DESC;

SELECT 
    SUBSTRING(ISBN, 1, 3) AS Prefix_ISBN,
    LOWER(Title) AS Nazov_Malymi
FROM books
WHERE LOWER(Genre) LIKE '%sci%'
ORDER BY LOWER(Title) ASC;

SELECT 
    Genre,
    COUNT(*) AS PocetKnih,
    ROUND(AVG(BookCondition), 1) AS PriemernyStav,
    MAX(YearPublished) AS NajnovsiaKniha
FROM books
WHERE YearPublished >= 2000
GROUP BY Genre
HAVING AVG(BookCondition) > 80 AND COUNT(*) > 1
ORDER BY PriemernyStav DESC;