Poznamky ku scriptu:

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
