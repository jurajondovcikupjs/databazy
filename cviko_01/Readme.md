# Úlohy:
1. EASY:
Doplňte vlastný riadok do tabuľky.
<details>
  <summary>Riešenie</summary>
  INSERT INTO books VALUES ('Unique ISBN',  'Name', 'Author', 'Genre', Year, Used?, 0-100);
</details>

2. MEDIUM:
Vypíšte 2 stĺpce podľa seba (napr. názov a rok)
<details>
  <summary>Riešenie</summary>
  SELECT Title,YearPublished FROM books;
</details>

3. HARD:
Vypíšte predošlé 2 stĺpce iba s knihami, ktoré boli vydané po roku 2020.
<details>
  <summary>Riešenie</summary>
  SELECT Title,YearPublished FROM books WHERE YearPublished > 2020;
</details>


# Poznamky ku scriptu:

- vytvorte si ```bookdb``` SCHEME a ```books``` TABLE, tento script patri ```books```,
- ```INSERT INTO``` a ```INSERT``` je toto iste pre MySQL, inde to tak nemusi byt,
- otvoreny script len robi doslova to, co ma napisane a meni TABLE, nezacina stale od znova, ale uz s tym co ma,
- script ocakava pre kazde policko hodnotu, aj ked moze byt NULL, treba to tam napisat ze je tato hodnota je NULL pre kazde policko, teda:
```
INSERT INTO books (ISBN, Title, Author, Genre, YearPublished, BeingRead) 
VALUES ('978-80-566-1620-8', 'Alchymistova šifra', 'Kevin Sands', 'History/Magic', 2015, false);
```
alebo
```
INSERT INTO books VALUES ('978-80-566-1620-8', 'Alchymistova šifra', 'Kevin Sands', 'History/Magic', 2015, false, NULL);
```
- kazdy riadok ocakava bodkociarku na konci
- komentare potrebuju medzeru pred slovami, napr. `-- komentar`
