-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Stř 13. zář 2023, 00:13
-- Verze serveru: 10.4.28-MariaDB
-- Verze PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `muzika`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `album`
--

CREATE TABLE `album` (
  `id_album` int(11) NOT NULL,
  `id_typ_zanr` int(11) DEFAULT NULL,
  `nazev_album` text DEFAULT NULL,
  `datum_vydani` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `album`
--

INSERT INTO `album` (`id_album`, `id_typ_zanr`, `nazev_album`, `datum_vydani`) VALUES
(1, 2, 'Modrá je dobrá', '1999-01-01'),
(2, 3, 'Zelená není špatná', '2000-11-09'),
(3, 1, 'Žlutá je nejhorší ', '2005-02-19');

-- --------------------------------------------------------

--
-- Struktura tabulky `album_interpret`
--

CREATE TABLE `album_interpret` (
  `id_album_interpret` int(11) NOT NULL,
  `id_album` int(11) DEFAULT NULL,
  `id_interpret` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `album_interpret`
--

INSERT INTO `album_interpret` (`id_album_interpret`, `id_album`, `id_interpret`) VALUES
(1, 1, 13),
(2, 2, 11),
(3, 3, 12),
(4, 1, 13),
(5, 1, 13);

-- --------------------------------------------------------

--
-- Struktura tabulky `album_skladba`
--

CREATE TABLE `album_skladba` (
  `id_album_skladba` int(11) NOT NULL,
  `cislo_stopy` int(11) DEFAULT NULL,
  `id_album` int(11) DEFAULT NULL,
  `id_skladba` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `album_skladba`
--

INSERT INTO `album_skladba` (`id_album_skladba`, `cislo_stopy`, `id_album`, `id_skladba`) VALUES
(1, 12, 1, 1),
(2, 8, 2, 3),
(3, 13, 3, 2),
(5, 6, 1, 7),
(6, 2, 1, 4);

-- --------------------------------------------------------

--
-- Struktura tabulky `interpret`
--

CREATE TABLE `interpret` (
  `id_interpret` int(11) NOT NULL,
  `nazev_interpret` text DEFAULT NULL,
  `id_typ_narodnost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `interpret`
--

INSERT INTO `interpret` (`id_interpret`, `nazev_interpret`, `id_typ_narodnost`) VALUES
(11, 'Michal David', 3),
(12, 'Rytmus', 2),
(13, 'Black Sabbath', 1),
(14, 'Dan Nekonečný ', 1),
(15, 'Majk Spirit', 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `skladba`
--

CREATE TABLE `skladba` (
  `id_skladba` int(11) NOT NULL,
  `nazev_skladba` text DEFAULT NULL,
  `delka` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `skladba`
--

INSERT INTO `skladba` (`id_skladba`, `nazev_skladba`, `delka`) VALUES
(1, 'Být stále mlád', 94),
(2, 'Žijeme len raz ', 123),
(3, 'Hells Bells', 154),
(4, 'PrimeTime ', 460),
(7, 'Hype', 56);

-- --------------------------------------------------------

--
-- Struktura tabulky `typ_narodnost`
--

CREATE TABLE `typ_narodnost` (
  `id_typ_narodnost` int(11) NOT NULL,
  `nazev_narodnost` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `typ_narodnost`
--

INSERT INTO `typ_narodnost` (`id_typ_narodnost`, `nazev_narodnost`) VALUES
(1, 'Česko'),
(2, 'Slovensko'),
(3, 'Polsko');

-- --------------------------------------------------------

--
-- Struktura tabulky `typ_zanr`
--

CREATE TABLE `typ_zanr` (
  `id_typ_zanr` int(11) NOT NULL,
  `nazev_zanr` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `typ_zanr`
--

INSERT INTO `typ_zanr` (`id_typ_zanr`, `nazev_zanr`) VALUES
(1, 'Rock'),
(2, 'Blues'),
(3, 'Rap');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`) USING BTREE,
  ADD KEY `Relace2` (`id_typ_zanr`);

--
-- Indexy pro tabulku `album_interpret`
--
ALTER TABLE `album_interpret`
  ADD PRIMARY KEY (`id_album_interpret`),
  ADD KEY `Relace10` (`id_album`),
  ADD KEY `Relace11` (`id_interpret`);

--
-- Indexy pro tabulku `album_skladba`
--
ALTER TABLE `album_skladba`
  ADD PRIMARY KEY (`id_album_skladba`),
  ADD KEY `Relace7` (`id_album`),
  ADD KEY `Relace8` (`id_skladba`);

--
-- Indexy pro tabulku `interpret`
--
ALTER TABLE `interpret`
  ADD PRIMARY KEY (`id_interpret`),
  ADD KEY `Relace9` (`id_typ_narodnost`);

--
-- Indexy pro tabulku `skladba`
--
ALTER TABLE `skladba`
  ADD PRIMARY KEY (`id_skladba`);

--
-- Indexy pro tabulku `typ_narodnost`
--
ALTER TABLE `typ_narodnost`
  ADD PRIMARY KEY (`id_typ_narodnost`);

--
-- Indexy pro tabulku `typ_zanr`
--
ALTER TABLE `typ_zanr`
  ADD PRIMARY KEY (`id_typ_zanr`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `album`
--
ALTER TABLE `album`
  MODIFY `id_album` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `album_interpret`
--
ALTER TABLE `album_interpret`
  MODIFY `id_album_interpret` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `album_skladba`
--
ALTER TABLE `album_skladba`
  MODIFY `id_album_skladba` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pro tabulku `interpret`
--
ALTER TABLE `interpret`
  MODIFY `id_interpret` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pro tabulku `skladba`
--
ALTER TABLE `skladba`
  MODIFY `id_skladba` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pro tabulku `typ_narodnost`
--
ALTER TABLE `typ_narodnost`
  MODIFY `id_typ_narodnost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `typ_zanr`
--
ALTER TABLE `typ_zanr`
  MODIFY `id_typ_zanr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `Relace2` FOREIGN KEY (`id_typ_zanr`) REFERENCES `typ_zanr` (`id_typ_zanr`);

--
-- Omezení pro tabulku `album_interpret`
--
ALTER TABLE `album_interpret`
  ADD CONSTRAINT `Relace10` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`),
  ADD CONSTRAINT `Relace11` FOREIGN KEY (`id_interpret`) REFERENCES `interpret` (`id_interpret`);

--
-- Omezení pro tabulku `album_skladba`
--
ALTER TABLE `album_skladba`
  ADD CONSTRAINT `Relace7` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`),
  ADD CONSTRAINT `Relace8` FOREIGN KEY (`id_skladba`) REFERENCES `skladba` (`id_skladba`);

--
-- Omezení pro tabulku `interpret`
--
ALTER TABLE `interpret`
  ADD CONSTRAINT `Relace9` FOREIGN KEY (`id_typ_narodnost`) REFERENCES `typ_narodnost` (`id_typ_narodnost`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
