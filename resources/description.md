# Temat projektu
**Butik** Jest to projekt bazy danych butiku z narzędziem typu POS dla kasjerów/pracowników

| Nazwisko i imię | Wydział | Kierunek | Semestr | Grupa | Rok akademicki |
| :-------------: | :-----: | :------: | :-----: | :---: | :------------: |
| Jakub Gawron    | WIMiIP  | IS       |   4     | 52    | 2019/2020      |

## Projekt bazy danych
![Database_ERD](Butique_database_ERD.svg?raw=true "Database_ERD")
Tworzenie wszystkich tabel można znaleźć tym [pliku](butique_database_boot.sql) 

## Implementacja zapytań SQL
1. Zalogowanie kasjera

SELECT  `ID`,  `login`,  `hash` FROM `butique`.`pracownik` WHERE `login` = 'abogucki'

2. Otworzenie zmiany

INSERT INTO `butique`.`zmiana` (`pracownik_ID`, `sklep_ID`, `start_time`, `CT`, `UT`) VALUES ('1', '1', NOW(), NULL,null);

3. Zakończenie zmiany

INSERT INTO `butique`.`zmiana` (`pracownik_ID`, `sklep_ID`, `end_time`, `CT`, `UT`) VALUES ('1', '1', NOW(), NULL,null);

4. Sprawdzenie dostępności danego produktu w kolorze 'a' i rozmiarze 'b' wraz z wyswietleniem dostawcy

SELECT * FROM butique.dostepnosc a LEFT JOIN (SELECT a.`ID` AS produkt_ID, a.nazwa AS produkt_nazwa , b.nazwa AS dostawca_nazwa, b.adres, b.mail, b.telefon  FROM butique.produkt a LEFT JOIN `butique`.`dostawca` b ON a.dostawca_ID = b.NIP) b ON a.produkt_ID = b.produkt_ID WHERE kolor = 'CZARNY' AND rozmiar = "L" 

5. Sprawdzenie dostawcy produktu o nazwie 'a'

SELECT a.`ID` AS produkt_ID, a.nazwa AS produkt_nazwa , b.nazwa AS dostawca_nazwa, b.adres, b.mail, b.telefon  FROM butique.produkt a LEFT JOIN `butique`.`dostawca` b ON a.dostawca_ID = b.NIP WHERE a.nazwa = 'Ubrellati'

6. Sprawdzenie 5 najtanszych produktow z kategorii 'a' dostepnych na sklepie

SELECT a.sklep_ID, a.sztuk, b.produkt_nazwa, b.kategoria_nazwa, b.produkt_cena FROM butique.dostepnosc a LEFT JOIN (SELECT b.nazwa AS produkt_nazwa, b.ID AS produkt_id, b.cena AS produkt_cena ,a.nazwa AS kategoria_nazwa FROM butique.kategoria a INNER JOIN butique.produkt b ON a.ID = b.kategoria_ID WHERE 1 ORDER BY b.cena DESC) b ON a.produkt_ID = b.produkt_id WHERE kategoria_nazwa = "SPODNIE" AND a.sklep_ID = 2

7. Otworzenie paragonu i sprzedaz produktu, z odjęciem go na stanie

START TRANSACTION
INSERT INTO butique.sprzedaz(zmiana_ID, CT, UT) VALUES(1, NULL,NULL)
INSERT INTO butique.lista_s_p()


8. Sprawdzenie kategorii prodoktow sprowadzanych przez dostawce
9. Dodanie produktu na stan sklepu do ktorego przypisany jest kasjer
10. Sprawdzenie najdrozszego paragonu ze zmiany
11. Wylistowanie wszystkich pracownikow sklepu
12. Wylistowanie 5 ostatnich obslugujacych kasjerów

## Aplikacja
Aplikacja ma na celu umożliwienie kasjerowi/sprzedawcy butiku pełną obsługę swojej zmiany, sprzedaży produktów oraz sprawdzanie i modyfikowanie inwentarza.
Napisana w pythonie, bazowana na tekscie zawiera prosty system logowania i ekranów z wyborami akcji.

## Dodatkowe uwagi
Brak