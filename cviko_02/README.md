## Úloha 1: Novšie Sci-Fi knihy

**Zadanie:**

Vypíš názov (`Title`), autora (`Author`) a rok vydania (`YearPublished`) pre všetky knihy, ktoré patria do žánru `'Sci-fi'` a boli vydané **po roku 2020** (vrátane). Výsledok **zoraď podľa roku vydania od najnovších po najstaršie** (zostupne).

<details>
<summary>Zobraziť riešenie</summary>

```sql
SELECT Title, Author, YearPublished
FROM books
WHERE Genre = 'Sci-fi' AND YearPublished >= 2020
ORDER BY YearPublished DESC;
```

</details>

---

## Úloha 2: Zachovalé odborné knihy

**Zadanie:**

Zobraz názov (`Title`) a stav knihy (`BookCondition`) pre knihy so žánrom `'Odborné a naučné'`, ktorých stav (`BookCondition`) je **vyšší alebo rovný ako 70**. Výsledný zoznam **zotrieď abecedne podľa názvu knihy**.

<details>
<summary>Zobraziť riešenie</summary>

```sql
SELECT Title, BookCondition
FROM books
WHERE Genre = 'Odborné a naučné' AND BookCondition >= 70
ORDER BY Title ASC;
```

</details>

---

## Úloha 3: Historické a klasické diela

**Zadanie:**

Vyber medzinárodné číslo knihy (`ISBN`), názov (`Title`) a rok vydania (`YearPublished`) pre všetky knihy, ktoré boli **vydané pred rokom 2000**. Výsledky **zorad od najstarších po najnovšie** podľa roku vydania.

<details>
<summary>Zobraziť riešenie</summary>

```sql
SELECT ISBN, Title, YearPublished
FROM books
WHERE YearPublished < 2000
ORDER BY YearPublished ASC;
```

</details>

---

## Úloha 4: Knihy od konkrétneho autora

**Zadanie:**

Vyhľadaj názov (`Title`), žáner (`Genre`) a stav knihy (`BookCondition`) pre všetky knihy, ktorých autorom je **Neal Shusterman**. Výsledky **zotrieď podľa stavu knihy od najlepšieho po najhorší** (zostupne).

<details>
<summary>Zobraziť riešenie</summary>

```sql
SELECT Title, Genre, BookCondition
FROM books
WHERE Author = 'Neal Shusterman'
ORDER BY BookCondition DESC;
```

</details>

---

## Úloha 5: Knihy vo výbornom stave (Top Condition)

**Zadanie:**

Vypíš názov (`Title`), autora (`Author`) a žáner (`Genre`) pre knihy, ktorých stav (`BookCondition`) je **90 a viac**. Výsledky **zorad abecedne podľa autora**.

<details>
<summary>Zobraziť riešenie</summary>

```sql
SELECT Title, Author, Genre
FROM books
WHERE BookCondition >= 90
ORDER BY Author ASC;
```

</details>
