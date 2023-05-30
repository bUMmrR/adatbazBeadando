-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Máj 03. 17:48
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `uthalozat`
--
CREATE DATABASE IF NOT EXISTS `uthalozat` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `uthalozat`;
-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `europa`
--

CREATE TABLE `europa` (
  `ut` varchar(250) NOT NULL,
  `eurout` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `europa`
--

INSERT INTO `europa` (`ut`, `eurout`) VALUES
('M0', 'E60'),
('M0', 'E71'),
('M0', 'E75'),
('M0', 'E77'),
('M1', 'E60'),
('M1', 'E65'),
('M1', 'E75'),
('M15', 'E65'),
('M15', 'E75'),
('M2', 'E77'),
('M3', 'E573'),
('M3', 'E579'),
('M3', 'E71'),
('M3', 'E79'),
('M30', 'E71'),
('M30', 'E79'),
('M31', 'E71'),
('M34', 'E573'),
('M35', 'E573'),
('M35', 'E79'),
('M4', 'E60'),
('M4', 'E79'),
('M43', 'E68'),
('M5', 'E66'),
('M5', 'E75'),
('M6', 'E66'),
('M6', 'E73'),
('M7', 'E65'),
('M7', 'E66'),
('M7', 'E71'),
('M70', 'E653'),
('M8', 'E66'),
('M80', 'E66'),
('M86', 'E65'),
('M90', 'E661');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `palya`
--

CREATE TABLE `palya` (
  `ut` varchar(250) NOT NULL,
  `kesz` int(24) DEFAULT NULL,
  `epul` int(24) DEFAULT NULL,
  `terv` int(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `palya`
--

INSERT INTO `palya` (`ut`, `kesz`, `epul`, `terv`) VALUES
('M0', 76, 0, 32),
('M1', 159, 0, 0),
('M100', 0, 0, 126),
('M15', 14, 0, 0),
('M19', 9, 0, 0),
('M2', 30, 0, 38),
('M25', 18, 0, 0),
('M3', 269, 0, 27),
('M30', 28, 56, 0),
('M31', 12, 0, 0),
('M32', 0, 0, 63),
('M34', 0, 0, 36),
('M35', 67, 0, 0),
('M4', 98, 27, 97),
('M43', 57, 0, 0),
('M44', 76, 14, 20),
('M49', 0, 0, 45),
('M5', 160, 0, 0),
('M51', 4, 0, 0),
('M6', 175, 19, 0),
('M60', 31, 0, 66),
('M7', 226, 0, 0),
('M70', 21, 0, 0),
('M76', 6, 3, 74),
('M8', 10, 0, 153),
('M80', 7, 21, 0),
('M81', 0, 0, 114),
('M83', 0, 36, 0),
('M85', 89, 6, 0),
('M86', 64, 0, 58),
('M87', 1, 0, 21),
('M9', 21, 0, 10),
('M90', 0, 0, 221);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `telepules`
--

CREATE TABLE `telepules` (
  `id` int(24) NOT NULL,
  `ut` varchar(250) DEFAULT NULL,
  `nev` varchar(250) DEFAULT NULL,
  `hatar` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `telepules`
--

INSERT INTO `telepules` (`id`, `ut`, `nev`, `hatar`) VALUES
(1, 'M32', 'Abony', NULL),
(2, 'M4', 'Abony', NULL),
(3, 'M8', 'Abony', NULL),
(4, 'M100', 'Albertirsa', NULL),
(5, 'M4', 'Albertirsa', NULL),
(6, 'M7', 'Balatonfőkajár', NULL),
(7, 'M8', 'Balatonfőkajár', NULL),
(8, 'M60', 'Barcs', 'Horvátország'),
(9, 'M44', 'Békéscsaba', NULL),
(10, 'M3', 'Beregdaróc', 'Ukrajna'),
(11, 'M35', 'Berettyóújfalu', NULL),
(12, 'M4', 'Berettyóújfalu', NULL),
(13, 'M0', 'Biatorbágy', NULL),
(14, 'M1', 'Biatorbágy', NULL),
(15, 'M6', 'Bóly', NULL),
(16, 'M60', 'Bóly', NULL),
(17, 'M90', 'Bóly', NULL),
(18, 'M0', 'Budafok-Tétény', NULL),
(19, 'M6', 'Budafok-Tétény', NULL),
(20, 'M0', 'Budaörs', NULL),
(21, 'M1', 'Budapest', NULL),
(22, 'M3', 'Budapest', NULL),
(23, 'M4', 'Budapest', NULL),
(24, 'M5', 'Budapest', NULL),
(25, 'M51', 'Budapest', NULL),
(26, 'M7', 'Budapest', NULL),
(27, 'M43', 'Csanádpalota', 'Románia'),
(28, 'M49', 'Csenger', 'Románia'),
(29, 'M85', 'Csorna', NULL),
(30, 'M86', 'Csorna', NULL),
(31, 'M35', 'Debrecen', NULL),
(32, 'M0', 'Dunaharaszti', NULL),
(33, 'M51', 'Dunaharaszti', NULL),
(34, 'M0', 'Dunakeszi', NULL),
(35, 'M2', 'Dunakeszi', NULL),
(36, 'M6', 'Dunaújváros', NULL),
(37, 'M8', 'Dunaújváros', NULL),
(38, 'M25', 'Eger', NULL),
(39, 'M3', 'Emőd', NULL),
(40, 'M30', 'Emőd', NULL),
(41, 'M100', 'Ercsi', NULL),
(42, 'M6', 'Ercsi', NULL),
(43, 'M100', 'Esztergom', 'Szlovákia'),
(44, 'M3', 'Gödöllő', NULL),
(45, 'M31', 'Gödöllő', NULL),
(46, 'M3', 'Görbeháza', NULL),
(47, 'M35', 'Görbeháza', NULL),
(48, 'M0', 'Gyál', NULL),
(49, 'M5', 'Gyál', NULL),
(50, 'M1', 'Győr', NULL),
(51, 'M19', 'Győr', NULL),
(52, 'M83', 'Győr', NULL),
(53, 'M85', 'Győr', NULL),
(54, 'M1', 'Hegyeshalom', 'Ausztria'),
(55, 'M7', 'Hollád', NULL),
(56, 'M76', 'Hollád', NULL),
(57, 'M90', 'Hollád', NULL),
(58, 'M2', 'Hont', NULL),
(59, 'M6', 'Ivándárda', 'Horvátország'),
(60, 'M25', 'Kál', NULL),
(61, 'M3', 'Kál', NULL),
(62, 'M32', 'Kál', NULL),
(63, 'M90', 'Kaposvár', NULL),
(64, 'M5', 'Kecskemét', NULL),
(65, 'M8', 'Kecskemét', NULL),
(66, 'M76', 'Keszthely', NULL),
(67, 'M1', 'Kisigmánd', NULL),
(68, 'M81', 'Kisigmánd', NULL),
(69, 'M81', 'Komárom', 'Szlovákia'),
(70, 'M76', 'Körmend', NULL),
(71, 'M80', 'Körmend', NULL),
(72, 'M86', 'Körmend', NULL),
(73, 'M87', 'Kőszeg', 'Ausztria'),
(74, 'M7', 'Letenye', 'Horvátország'),
(75, 'M70', 'Letenye', NULL),
(76, 'M1', 'Levél', NULL),
(77, 'M15', 'Levél', NULL),
(78, 'M86', 'Levél', NULL),
(79, 'M43', 'Makó', NULL),
(80, 'M100', 'Martonvásár', NULL),
(81, 'M49', 'Mátészalka', NULL),
(82, 'M30', 'Miskolc', NULL),
(83, 'M7', 'Nagykanizsa', NULL),
(84, 'M4', 'Nagykereki', 'Románia'),
(85, 'M44', 'Nagykőrös', NULL),
(86, 'M8', 'Nagykőrös', NULL),
(87, 'M0', 'Nagytarcsa', NULL),
(88, 'M31', 'Nagytarcsa', NULL),
(89, 'M9', 'Nemesnádudvar', NULL),
(90, 'M3', 'Nyíregyháza', NULL),
(91, 'M3', 'Őr', NULL),
(92, 'M49', 'Őr', NULL),
(93, 'M83', 'Pápa', NULL),
(94, 'M2', 'Parasapuszta', 'Szlovákia'),
(95, 'M60', 'Pécs', NULL),
(96, 'M80', 'Rábafüzes', 'Ausztria'),
(97, 'M15', 'Rajka', 'Szlovákia'),
(98, 'M2', 'Rétság', NULL),
(99, 'M5', 'Röszke', 'Szerbia'),
(100, 'M8', 'Sárbogárd', NULL),
(101, 'M81', 'Sárbogárd', NULL),
(102, 'M7', 'Siófok', NULL),
(103, 'M85', 'Sopron', 'Ausztria'),
(104, 'M44', 'Szarvas', NULL),
(105, 'M43', 'Szeged', NULL),
(106, 'M5', 'Szeged', NULL),
(107, 'M90', 'Szeged', NULL),
(108, 'M7', 'Székesfehérvár', NULL),
(109, 'M81', 'Székesfehérvár', NULL),
(110, 'M6', 'Szekszárd', NULL),
(111, 'M9', 'Szekszárd', NULL),
(112, 'M60', 'Szigetvár', NULL),
(113, 'M90', 'Szigetvár', NULL),
(114, 'M86', 'Szombathely', NULL),
(115, 'M87', 'Szombathely', NULL),
(116, 'M90', 'Tompa', NULL),
(117, 'M70', 'Tornyiszentmiklós', 'Szlovénia'),
(118, 'M30', 'Tornyosnémeti', 'Szlovákia'),
(119, 'M0', 'Törökbálint', NULL),
(120, 'M7', 'Törökbálint', NULL),
(121, 'M100', 'Újhartyán', NULL),
(122, 'M5', 'Újhartyán', NULL),
(123, 'M0', 'Újpalota', NULL),
(124, 'M3', 'Újpalota', NULL),
(125, 'M0', 'Üröm', NULL),
(126, 'M2', 'Vác', NULL),
(127, 'M3', 'Vásárosnamény', NULL),
(128, 'M34', 'Vásárosnamény', NULL),
(129, 'M0', 'Vecsés', NULL),
(130, 'M4', 'Vecsés', NULL),
(131, 'M34', 'Záhony', 'Ukrajna'),
(132, 'M76', 'Zalaegerszeg', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vege`
--

CREATE TABLE `vege` (
  `id` int(24) NOT NULL,
  `ut` varchar(250) DEFAULT NULL,
  `telepid` int(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `vege`
--

INSERT INTO `vege` (`id`, `ut`, `telepid`) VALUES
(1, 'M0', 13),
(2, 'M0', 20),
(3, 'M1', 21),
(4, 'M1', 54),
(5, 'M2', 34),
(6, 'M2', 94),
(7, 'M3', 22),
(8, 'M3', 10),
(9, 'M4', 23),
(10, 'M4', 84),
(11, 'M5', 24),
(12, 'M5', 99),
(13, 'M6', 19),
(14, 'M6', 59),
(15, 'M7', 26),
(16, 'M7', 74),
(17, 'M8', 6),
(18, 'M8', 3),
(19, 'M9', 111),
(20, 'M9', 89),
(21, 'M15', 77),
(22, 'M15', 97),
(23, 'M19', 51),
(24, 'M19', 51),
(25, 'M25', 60),
(26, 'M25', 38),
(27, 'M30', 40),
(28, 'M30', 118),
(29, 'M31', 88),
(30, 'M31', 45),
(31, 'M32', 1),
(32, 'M32', 62),
(33, 'M34', 128),
(34, 'M34', 131),
(35, 'M35', 47),
(36, 'M35', 11),
(37, 'M43', 105),
(38, 'M43', 27),
(39, 'M44', 85),
(40, 'M44', 9),
(41, 'M49', 92),
(42, 'M49', 28),
(43, 'M51', 25),
(44, 'M51', 33),
(45, 'M60', 16),
(46, 'M60', 8),
(47, 'M70', 75),
(48, 'M70', 117),
(49, 'M76', 56),
(50, 'M76', 70),
(51, 'M80', 96),
(52, 'M80', 71),
(53, 'M81', 69),
(54, 'M81', 101),
(55, 'M83', 52),
(56, 'M83', 93),
(57, 'M85', 53),
(58, 'M85', 103),
(59, 'M86', 72),
(60, 'M86', 78),
(61, 'M87', 115),
(62, 'M87', 73),
(63, 'M90', 57),
(64, 'M90', 107),
(65, 'M100', 43),
(66, 'M100', 4);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `europa`
--
ALTER TABLE `europa`
  ADD PRIMARY KEY (`ut`,`eurout`);

--
-- A tábla indexei `palya`
--
ALTER TABLE `palya`
  ADD PRIMARY KEY (`ut`);

--
-- A tábla indexei `telepules`
--
ALTER TABLE `telepules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_telepules_palya` (`ut`);

--
-- A tábla indexei `vege`
--
ALTER TABLE `vege`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vege_palya` (`ut`),
  ADD KEY `fk_vege_telepules` (`telepid`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `europa`
--
ALTER TABLE `europa`
  ADD CONSTRAINT `fk_europa_palya` FOREIGN KEY (`ut`) REFERENCES `palya` (`ut`);

--
-- Megkötések a táblához `telepules`
--
ALTER TABLE `telepules`
  ADD CONSTRAINT `fk_telepules_palya` FOREIGN KEY (`ut`) REFERENCES `palya` (`ut`);

--
-- Megkötések a táblához `vege`
--
ALTER TABLE `vege`
  ADD CONSTRAINT `fk_vege_palya` FOREIGN KEY (`ut`) REFERENCES `palya` (`ut`),
  ADD CONSTRAINT `fk_vege_telepules` FOREIGN KEY (`telepid`) REFERENCES `telepules` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
