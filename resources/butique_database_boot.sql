-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               10.4.13-MariaDB - mariadb.org binary distribution
-- Serwer OS:                    Win64
-- HeidiSQL Wersja:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Zrzut struktury bazy danych butique
CREATE DATABASE IF NOT EXISTS `butique` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `butique`;

-- Zrzut struktury tabela butique.dostawca
CREATE TABLE IF NOT EXISTS `dostawca` (
  `NIP` int(10) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(128) NOT NULL,
  `adres` varchar(128) NOT NULL,
  `mail` varchar(128) NOT NULL,
  `telefon` int(12) NOT NULL,
  `CT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`NIP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Eksport danych został odznaczony.

-- Zrzut struktury tabela butique.dostepnosc
CREATE TABLE IF NOT EXISTS `dostepnosc` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `produkt_ID` int(10) NOT NULL,
  `sklep_ID` int(10) NOT NULL,
  `sztuk` int(10) NOT NULL,
  `rozmiar` varchar(128) NOT NULL,
  `kolor` varchar(128) NOT NULL,
  `CT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `produkt_ID` (`produkt_ID`),
  KEY `sklep_ID` (`sklep_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Eksport danych został odznaczony.

-- Zrzut struktury tabela butique.kategoria
CREATE TABLE IF NOT EXISTS `kategoria` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(128) NOT NULL,
  `CT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Eksport danych został odznaczony.

-- Zrzut struktury tabela butique.lista_s_p
CREATE TABLE IF NOT EXISTS `lista_s_p` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `produkt_ID` int(10) NOT NULL,
  `sprzedaz_ID` int(10) NOT NULL,
  `sztuk` int(10) NOT NULL,
  `CT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `UT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `produkt_ID` (`produkt_ID`),
  KEY `sprzedaz_ID` (`sprzedaz_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Eksport danych został odznaczony.

-- Zrzut struktury tabela butique.pracownik
CREATE TABLE IF NOT EXISTS `pracownik` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(128) NOT NULL,
  `adres` varchar(128) NOT NULL,
  `mail` varchar(128) NOT NULL,
  `telefon` int(12) NOT NULL,
  `CT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Eksport danych został odznaczony.

-- Zrzut struktury tabela butique.produkt
CREATE TABLE IF NOT EXISTS `produkt` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `dostawca_ID` int(10) NOT NULL,
  `kategoria_ID` int(10) NOT NULL,
  `nazwa` varchar(128) NOT NULL,
  `cena` double(10,2) NOT NULL,
  `CT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `dostawca_ID` (`dostawca_ID`),
  KEY `kategoria_ID` (`kategoria_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Eksport danych został odznaczony.

-- Zrzut struktury tabela butique.sklep
CREATE TABLE IF NOT EXISTS `sklep` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `imie` varchar(128) NOT NULL,
  `nazwisko` varchar(128) NOT NULL,
  `mail` varchar(128) NOT NULL,
  `login` varchar(128) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `telefon` int(12) NOT NULL,
  `pesel` int(12) NOT NULL,
  `CT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Eksport danych został odznaczony.

-- Zrzut struktury tabela butique.sprzedaz
CREATE TABLE IF NOT EXISTS `sprzedaz` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `zmiana_ID` int(10) NOT NULL,
  `CT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `zmiana_ID` (`zmiana_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Eksport danych został odznaczony.

-- Zrzut struktury tabela butique.zmiana
CREATE TABLE IF NOT EXISTS `zmiana` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `pracownik_ID` int(10) NOT NULL,
  `sklep_ID` int(10) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `CT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `pracownik_ID` (`pracownik_ID`),
  KEY `sklep_ID` (`sklep_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Eksport danych został odznaczony.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
