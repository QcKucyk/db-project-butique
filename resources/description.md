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
2. Otworzenie zmiany
3. Zakończenie zmiany
4. Sprawdzenie dostępności danego produktu w kolorze 'a' i rozmiarze 'b' wraz z wyswietleniem dostawcy
5. Sprawdzenie dostawcy produktu o nazwie 'a'
6. Sprawdzenie 5 najtanszych produktow z kategorii 'a' dostepnych na sklepie na ktorym znajduje sie kasjer
7. Otworzenie paragonu i sprzedaz produktu, z odjęciem go na stanie
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