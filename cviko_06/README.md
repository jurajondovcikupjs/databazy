# Teória relačných databáz a funkčných závislostí

Materiál obsahuje definície základných pojmov z oblasti relačných databáz, dôkazy vlastností funkčných závislostí pomocou Armstrongových pravidiel a riešené príklady na určovanie kľúčov a normálnych foriem.

---

## 1. Definície pojmov

* **Normalizácia (normalization):** Proces organizácie dát v databáze, ktorého cieľom je znížiť duplicitu (redundanciu) dát a eliminovať anomálie pri vkladaní, aktualizácii a mazaní (*Insert, Update, Delete anomalies*) rozdelením veľkých tabuliek na menšie a definovaním vzťahov medzi nimi.
* **Denormalizácia (denormalization):** Zámerný proces spájania menších tabuliek do väčších (vnesenie redundancie) s cieľom zrýchliť čítanie dát a znížiť potrebu zložito vykonávaných operácií `JOIN`.
* **Dekompozícia (decomposition):** Rozloženie jednej relačnej schémy na dve alebo viac menších relačných schém bez straty informácií (bezstratová dekompozícia) alebo závislostí.
* **Relačná schéma (relation schema):** Množinový popis štruktúry relácie tvorený názvom relácie a množinou jej atribútov, napr. $R(A_1, A_2, \dots, A_n)$.
* **Relácia (relation):** Podmnožina kartézskeho súčinu domén jednotlivých atribútov; v praktickom databázovom poňatí ide o tabuľku, kde riadky predstavujú entity (tuply) a stĺpce atribúty.
* **Funkčná závislosť (functional dependency):** Vzťah medzi dvoma množinami atribútov $X$ a $Y$ v relácii (zápis $X \rightarrow Y$), kedy hodnoty atribútov zo skupiny $X$ jednoznačne určujú hodnoty atribútov zo skupiny $Y$ (ak sa zhodujú hodnoty dvoch riadkov v $X$, musia sa zhodovať aj v $Y$).
* **Triviálna funkčná závislosť (trivial functional dependency):** Funkčná závislosť $X \rightarrow Y$, kde množina $Y$ je podmnožinou množiny $X$ ($Y \subseteq X$), napr. $\{id, meno\} \rightarrow \{meno\}$.
* **Kľúčový atribút (key attribute):** Atribút, ktorý je súčasťou aspoň jedného kandidátneho kľúča.
* **Nekľúčový atribút (non-key attribute):** Atribút, ktorý nie je súčasťou žiadneho kandidátneho kľúča.
* **Kandidátny kľúč (candidate key):** Minimálny nadkľúč – množina atribútov, ktorá jednoznačne identifikuje každý riadok v relácii a z ktorej nie je možné odobrať žiaden atribút bez straty tejto jednoznačnosti.
* **Kompozitný kľúč (composite key):** Kľúč (kandidátny alebo primárny), ktorý pozostáva z dvoch alebo viacerých atribútov.
* **Primárny kľúč (primary key):** Zvolený kandidátny kľúč, ktorý slúži ako hlavný unikátny identifikátor riadkov v tabuľke (nesmie obsahovať `NULL` hodnoty).
* **Nadkľúč (super-key):** Ľubovoľná množina atribútov, ktorá jednoznačne identifikuje každý riadok v relácii (môže obsahovať aj nadbytočné atribúty naviac k kandidátnemu kľúču).
* **Podkľúč (sub-key):** Vlastná podmnožina nejakého kľúča. Sám o sebe nestačí na jednoznačnú identifikáciu riadku.
* **1NF (1. normálna forma):** Relácia je v 1NF, ak sú všetky jej atribúty atomárne (nedeliteľné hodnoty) a tabuľka neobsahuje opakovateľné skupiny atribútov.
* **2NF (2. normálna forma):** Relácia je v 2NF, ak je v 1NF a každý nekľúčový atribút je plne funkčne závislý od celého kandidátneho kľúča (neexistuje čiastočná závislosť od časti kompozitného kľúča).
* **3NF (3. normálna forma):** Relácia je v 3NF, ak je v 2NF a žiaden nekľúčový atribút nie je tranzitívne závislý od kandidátneho kľúča (pre každú netriviálnu závislosť $X \rightarrow Y$ platí, že $X$ je nadkľúč alebo $Y$ je kľúčový atribút).
* **HBCNF / BCNF (Heath-Boyce-Codd Normal Form):** Sprísnená verzia 3NF. Relácia je v BCNF, ak pre každú netriviálnu funkčnú závislosť $X \rightarrow Y$ platí, že $X$ je nadkľúč (aj pre kľúčové atribúty na pravej strane).

---

## 2. Analýza tabuľky `Osoba(id, meno, pohlavie)`

- **Funkčné závislosti:** $id \rightarrow meno$, $id \rightarrow pohlavie$, resp. $id \rightarrow \{meno, pohlavie\}$. *(Meno ani pohlavie nedokážu jednoznačne určiť id, pretože viacerí ľudia sa môžu volať rovnako alebo mať rovnaké pohlavie).*
- **Kandidátny kľúč:** $\{id\}$ *(je minimálny a jednoznačne určuje celý riadok)*.
- **Nadkľúč:** Akákoľvek množina obsahujúca $id$, napr. $\{id\}$, $\{id, meno\}$, $\{id, pohlavie\}$, $\{id, meno, pohlavie\}$.
- **Podkľúč:** Prázdna množina $\emptyset$ *(keďže kľúč $\{id\}$ má dĺžku 1, jeho vlastná podmnožina neobsahuje žiaden atribút)*.

---

## 3. Dôkazy pomocou Armstrongových pravidiel a definície

### 3.1 $(x \rightarrow y) \land (x \rightarrow z) \Rightarrow x \rightarrow yz$ *(Pravidlo zjednotenia / Union Rule)*

* **Dôkaz pomocou Armstrongových pravidiel:**
  1. $x \rightarrow y$ *(dané)*
  2. $x \rightarrow z$ *(dané)*
  3. Aplikáciou pravidla rozšírenia (Augmentation) na (1) s $x$ dostaneme: $xx \rightarrow xy$, čo je $x \rightarrow xy$.
  4. Aplikáciou pravidla rozšírenia na (2) s $y$ dostaneme: $xy \rightarrow yz$.
  5. Aplikáciou tranzitívneho pravidla (Transitivity) na $x \rightarrow xy$ a $xy \rightarrow yz$ dostaneme: **$x \rightarrow yz$**.

* **Dôkaz pomocou definície:**
  Nech $t_1, t_2$ sú dva riadky v relácii také, že $t_1[x] = t_2[x]$.
  - Z $x \rightarrow y$ vyplýva, že $t_1[y] = t_2[y]$.
  - Z $x \rightarrow z$ vyplýva, že $t_1[z] = t_2[z]$.
  - Preto $t_1[yz] = t_2[yz]$, z čoho vyplýva **$x \rightarrow yz$**.

---

### 3.2 $(x \rightarrow y) \land (wy \rightarrow z) \Rightarrow wx \rightarrow wz$ *(Pseudotranzitívne pravidlo / Pseudo-transitivity)*

* **Dôkaz pomocou Armstrongových pravidiel:**
  1. $x \rightarrow y$ *(dané)*
  2. $wy \rightarrow z$ *(dané)*
  3. Aplikáciou pravidla rozšírenia na (1) s $w$ dostaneme: $wx \rightarrow wy$.
  4. Aplikáciou tranzitívneho pravidla na $wx \rightarrow wy$ a $wy \rightarrow z$ dostaneme: **$wx \rightarrow wz$**.

* **Dôkaz pomocou definície:**
  Nech $t_1, t_2$ sú dva riadky také, že $t_1[wx] = t_2[wx]$ (teda $t_1[w] = t_2[w]$ a $t_1[x] = t_2[x]$).
  - Z $x \rightarrow y$ a $t_1[x] = t_2[x]$ dostávame $t_1[y] = t_2[y]$.
  - Keďže $t_1[w] = t_2[w]$ aj $t_1[y] = t_2[y]$, platí $t_1[wy] = t_2[wy]$.
  - Z $wy \rightarrow z$ potom vyplýva $t_1[z] = t_2[z]$.
  - Spolu máme $t_1[w] = t_2[w]$ a $t_1[z] = t_2[z]$, teda $t_1[wz] = t_2[wz]$. Platí **$wx \rightarrow wz$**.

---

### 3.3 $(x \rightarrow y) \land (z \subseteq y) \Rightarrow x \rightarrow z$ *(Pravidlo dekompozície / Decomposition)*

* **Dôkaz pomocou Armstrongových pravidiel:**
  1. $x \rightarrow y$ *(dané)*
  2. Aplikáciou reflexívneho pravidla na $z \subseteq y$ dostaneme: $y \rightarrow z$.
  3. Aplikáciou tranzitívneho pravidla na $x \rightarrow y$ a $y \rightarrow z$ dostaneme: **$x \rightarrow z$**.

* **Dôkaz pomocou definície:**
  Nech $t_1, t_2$ sú dva riadky také, že $t_1[x] = t_2[x]$.
  - Z $x \rightarrow y$ vyplýva $t_1[y] = t_2[y]$.
  - Keďže $z \subseteq y$, pod-záznam $z$ je plne obsiahnutý v $y$, teda aj $t_1[z] = t_2[z]$.
  - Platí **$x \rightarrow z$**.

---

## 4. Dôkaz neplatnosti vyprávania (Kontrapríklad)

**Tvrdenie:** Dokážte, že neplatí: $(AC \rightarrow B) \land (AC \rightarrow D) \Rightarrow B \rightarrow D$

**Dôkaz kontrapríkladom:**
Skonštruujme reláciu s atribútmi $\{A, B, C, D\}$ a dvoma riadkami:

| A | B | C | D |
|---|---|---|---|
| 1 | 2 | 3 | 4 |
| 0 | 2 | 0 | 5 |

* $AC \rightarrow B$ platí (všetky kombinácie $AC$ sú unikátne: $(1,3)$ a $(0,0)$).
* $AC \rightarrow D$ platí (kombinácie $AC$ sú unikátne).
* Avšak $B \rightarrow D$ **NEPLATÍ**, pretože pre rovnakú hodnotu $B = 2$ existujú dve rôzne hodnoty $D$ ($4$ a $5$).

---

## 5. Relačná schéma $\mathcal{R}(\mathcal{A}, \mathcal{F})$

Uvažujme $\mathcal{A} = \{ A, B, C, D, E, F \}$ a $\mathcal{F} = \{ AB \rightarrow C, BC \rightarrow AD, D \rightarrow E, CF \rightarrow B \}$.

1. **Určte $\{AB\}^+$:**
   - Začiatok: $\{AB\}^+ = \{A, B\}$
   - Aplikujeme $AB \rightarrow C$: $\{AB\}^+ = \{A, B, C\}$
   - Aplikujeme $BC \rightarrow AD$: $\{AB\}^+ = \{A, B, C, D\}$
   - Aplikujeme $D \rightarrow E$: $\{AB\}^+ = \{A, B, C, D, E\}$
   - **Výsledok:** $\{AB\}^+ = \{A, B, C, D, E\}$

2. **Vyplývajú z $\mathcal{F}$ funkčné závislosti $AB \rightarrow D$ a $D \rightarrow A$? Prečo?**
   - $AB \rightarrow D$: **Áno**, pretože $D \in \{AB\}^+$.
   - $D \rightarrow A$: **Nie**, uzáver $\{D\}^+ = \{D, E\}$. Keďže $A \notin \{D\}^+$, závislosť neplatí.

3. **Je $AB$ kandidátny kľúč? Prečo?**
   - **Nie**, pretože $\{AB\}^+ = \{A, B, C, D, E\} \neq \mathcal{A}$ (neobsahuje atribút $F$, nevie určiť celú reláciu).

4. **Kandidátne kľúče:**
   - Atribút $F$ sa nenachádza na pravej strane žiadnej funkčnej závislosti, preto musí byť súčasťou každého kľúča.
   - Spočítaním uzáverov dostaneme kandidátne kľúče: **$\{ABF\}, \{BCF\}, \{ACF\}$**.

5. **Je $AB$ primárny kľúč? Prečo?**
   - **Nie**, lebo nie je ani kandidátnym kľúčom.

6. **Je $AB$ kompozitný kľúč? Prečo?**
   - **Nie**, sám o sebe nie je kľúčom (aj keď sa skladá z 2 atribútov).

7. **Nadkľúče $ABF$:**
   - **$\{ABF\}, \{ABFD\}, \{ABFE\}, \{ABFDE\}$**.

8. **Podkľúče $ABF$:**
   - Prázdna množina a vlastné podmnožiny: **$\emptyset, \{A\}, \{B\}, \{F\}, \{A, B\}, \{A, F\}, \{B, F\}$**.

9. **Kľúčové a nekľúčové atribúty:**
   - **Kľúčové atribúty** (obsiahnuté v aspoň jednom KK): **$A, B, C, F$**.
   - **Nekľúčové atribúty:** **$D, E$**.

---

## 6. Dekompozícia tabuľky `ABC`

* **Lossless / Bezstratová dekompozícia:**
  - Ak v `ABC` platí napr. $A \rightarrow B$, bezstratová dekompozícia je: **$R_1(A, B)$** a **$R_2(A, C)$**. Prienik $R_1 \cap R_2 = \{A\}$, čo je kľúčom v $R_1$.
* **Lossy / Stratová dekompozícia:**
  - Dekompozícia na **$R_1(A, B)$** a **$R_2(B, C)$** pri absencii závislostí $B \rightarrow A$ alebo $B \rightarrow C$ je stratová (vzniknú falošné riadky / *spurious tuples* pri spojení).

---

## 7. Rozklad $\{T_1, T_2\}$ tabuľky $T$

* **Kritériá a SQL pre overenie stratovosti:**
  - *Pomocou kritéria:* Dekompozícia $R$ na $R_1$ a $R_2$ je bezstratová práve vtedy, keď prienik atribútov $R_1 \cap R_2$ funkčne určuje $R_1$ ($R_1 \cap R_2 \rightarrow R_1$) alebo $R_2$ ($R_1 \cap R_2 \rightarrow R_2$). Ak to neplatí, rozklad je stratový.
  - *SQL kódom:*
    ```sql
    -- Ak spojenie T1 a T2 vráti viac riadkov ako pôvodná tabuľka T, ide o stratovú dekompozíciu:
    SELECT COUNT(*) FROM T;
    SELECT COUNT(*) FROM T1 NATURAL JOIN T2;
    ```
* **Úprava hodnoty v tabuľke $T$:**
  - Zmenou hodnoty docielime, aby prienik atribútov obsiahnutý v oboch tabuľkách obsahoval iba unikátne hodnoty určujúce zvyšok atribútov v jednej z tabuliek. Tým sa prienik stane nadkľúčom (NK) danej sub-relácie.

---

## 8. Interpretácia relačných operátorov

* **$R_1 \cup R_2$ (Zjednotenie / Union):** Množina všetkých prkov/riadkov, ktoré sa nachádzajú v $R_1$, v $R_2$ alebo v oboch. Podmienka: $R_1$ a $R_2$ musia mať rovnakú schému (kompatibilné atribúty).
* **$R_1 \times R_2$ (Kartézsky súčin / Cartesian Product):** Množina všetkých možných kombinácií riadkov z $R_1$ s riadkami z $R_2$. Ak $R_1$ má $m$ riadkov a $R_2$ má $n$ riadkov, výsledok má $m \times n$ riadkov.
* **$R_1 \bowtie R_2$ (Prirodzené spojenie / Natural Join):** Spojenie dvoch relácií cez ich spoločné atribúty, pričom vo výsledku sa zhodujú hodnoty na týchto spoločných atribútoch a spoločné atribúty sa neopakujú.

---

## 9. Relačná schéma $\mathcal{R}(\mathcal{A}, \mathcal{F})$ s $\mathcal{A} = \{ A, B, C, D \}$

Zadané funkčné závislosti: $\mathcal{F} = \{ ACD \rightarrow B, AC \rightarrow D, AC \rightarrow B, D \rightarrow C \}$.

1. **Uzáver $\{AC\}^+$ a ďalšie kandidátne kľúče:**
   - $\{AC\}^+ = \{A, B, C, D\} = \mathcal{A}$, teda $AC$ je KK.
   - Ďalší dvojatribútový KK je **$\{AD\}$**, pretože $\{AD\}^+ = \{A, B, C, D\} = \mathcal{A}$.
2. **Je $AC$ kandidátny kľúč?**
   - **Áno**, $\{AC\}^+ = \mathcal{A}$ a žiadna jeho vlastná podmnožina nie je nadkľúčom.
3. **Je $AC$ primárny kľúč?**
   - **Môže byť**, ak je zvolený spomedzi kandidátnych kľúčov $(\{AC\}, \{AD\})$.
4. **Je $AC$ kompozitný kľúč?**
   - **Áno**, skadá sa z dvoch atribútov ($A$ a $C$).
5. **Je $AC$ nadkľúč?**
   - **Áno**, každý kandidátny kľúč je minimálnym nadkľúčom.
6. **Je $AD$ podkľúč?**
   - **Nie**, $AD$ je sám o sebe kandidátnym kľúčom.
7. **Je $\mathcal{R}$ v 2NF?**
   - **Áno**, nekľúčový atribút $B$ závisí od celého kľúča $AC$, neexistujú čiastočné závislosti.
8. **Je $\mathcal{R}$ v 3NF?**
   - **Áno**. Pre $D \rightarrow C$ síce $D$ nie je nadkľúčom, ale $C$ je kľúčový atribút (patrí do KK $\{AC\}$).
9. **Je $\mathcal{R}$ v HBCNF / BCNF?**
   - **Nie**, kvôli závislosti $D \rightarrow C$, kde $D$ nie je nadkľúčom.
```