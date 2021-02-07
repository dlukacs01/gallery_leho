-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2021. Feb 07. 17:15
-- Kiszolgáló verziója: 10.4.14-MariaDB
-- PHP verzió: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `gallery_db_leho`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `comments`
--

INSERT INTO `comments` (`id`, `photo_id`, `author`, `body`) VALUES
(4, 6, 'EDWIN INSTUCTOR', 'Some comment'),
(5, 9, 'EDWIN INSTUCTOR', 'some comment');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `folders`
--

CREATE TABLE `folders` (
  `id` int(11) NOT NULL,
  `title_hu` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  `ordinal_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `folders`
--

INSERT INTO `folders` (`id`, `title_hu`, `title_en`, `parent_id`, `photo_id`, `ordinal_number`) VALUES
(1, 'Kör', 'Circle', 0, 68, 1),
(2, 'Dobok-napok', 'Drums-Suns', 0, 78, 2),
(3, 'Ágyak', 'Beds', 0, 100, 3),
(4, 'Szelek', 'Winds', 0, 101, 4),
(5, 'Más', 'Other', 0, 118, 5),
(6, 'Tus', 'Ink', 0, 133, 6),
(7, 'Születés-női', 'Birth', 0, 157, 7),
(8, 'Tánc', 'Dance', 0, 161, 8),
(9, 'Szimbólumok', 'Symbols', 0, 168, 9),
(10, 'Tulipánok', 'Tulip', 0, 189, 10),
(11, 'Életfa', 'Tree of life', 0, 196, 11),
(12, 'Madarak', 'Birds', 0, 201, 12),
(13, 'Színerő kurzus Pécs', 'Színerő kurzus Pécs', 0, 218, 13),
(18, 'olaj-merítettpapír', '', 7, 140, 1),
(19, 'olaj-vászon', '', 7, 158, 2),
(20, 'olaj-merítettpapír', '', 9, 172, 2),
(21, 'olaj-vászon', '', 9, 165, 1),
(26, 'olaj-merítettpapír', '', 11, 191, 1),
(27, 'olaj-vászon', '', 11, 195, 2),
(36, 'KIÁLLÍTÁS 2010.09.03', '', 0, 235, 14);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `title_hu` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `filename` varchar(255) NOT NULL,
  `alternate_text` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `ordinal_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `photos`
--

INSERT INTO `photos` (`id`, `title_hu`, `title_en`, `caption`, `description`, `filename`, `alternate_text`, `type`, `size`, `user_id`, `folder_id`, `ordinal_number`) VALUES
(67, 'Belépő I 50x50cm olaj-vászon 2009', '', '', '', 'belp 1 50x50 olaj vszon.jpg.jpg', '', 'image/jpeg', 51431, 1, 1, 1),
(68, 'Belépő II 50x50cm olaj-vászon 2009', '', '', '', 'sejt 1.jpg.jpg', '', 'image/jpeg', 56142, 1, 1, 2),
(69, 'Belépő III 50x50cm olaj-vászon 2010', '', '', '', 'belp 3.jpg.jpg', '', 'image/jpeg', 71378, 1, 1, 3),
(70, 'Belépő IV 50x50cm olaj-vászon 2010', '', '', '', 'belp 4 50x50 olaj vszon.jpg.jpg', '', 'image/jpeg', 57479, 1, 1, 4),
(71, 'Belépő V (zsófi) 50x50cm olaj-vászon 2010', '', '', '', 'zsfi 50x50.jpg.jpg', '', 'image/jpeg', 57611, 1, 1, 5),
(72, 'Belépő VI 50x50 olaj vászon 2010', '', '', '', 'Belp5.jpg.jpg', '', 'image/jpeg', 62914, 1, 1, 6),
(73, 'Mandorla I 100x80 olaj-vászon 2010', '', '', '', 'mandorla1.jpg.jpg', '', 'image/jpeg', 31486, 1, 1, 7),
(74, 'Mandorla II 100x80 olaj-vászon 2010', '', '', '', 'mandorla2.jpg.jpg', '', 'image/jpeg', 32500, 1, 1, 8),
(75, 'Mandorla III 100x80 olaj-vászon 2010', '', '', '', 'mandorla3.jpg.jpg', '', 'image/jpeg', 39181, 1, 1, 9),
(76, 'körös   50x50 olaj vászon 2012', '', '', '', '9_ 50x50 olaj vszon 2012.jpg.jpg', '', 'image/jpeg', 58773, 1, 2, 1),
(77, 'Dob III   280x160 cm olaj-vászon', '', '', '', 'Dob III 160x280.jpg.jpg', '', 'image/jpeg', 86853, 1, 2, 2),
(78, 'Dob I   280x160 cm olaj-vászon', '', '', '', 'Dob I_160x280_olaj-vszon_1996.jpg.jpg', '', 'image/jpeg', 77487, 1, 2, 3),
(79, 'Dob II   280x160 cm olaj-vászon', '', '', '', 'Dob II_160x280_olaj-vszon_1996-1.jpg.jpg', '', 'image/jpeg', 90579, 1, 2, 4),
(80, 'Dobsor   200x60 cm olaj-vászon', '', '', '', 'dobsor_1998_200X60_olajvszon.jpg.jpg', '', 'image/jpeg', 35906, 1, 2, 5),
(81, 'Dobsor/ részlet   200x60 cm olaj-vászon', '', '', '', 'dobsor_1998_200X60_olajvszon_rszlet_kicsi.jpg.jpg', '', 'image/jpeg', 55623, 1, 2, 6),
(82, 'Laza Kelet   100x80 cm olaj-vászon', '', '', '', 'Laza Kelet_80x100_olaj-vszon_1999.jpg.jpg', '', 'image/jpeg', 120839, 1, 2, 7),
(83, 'Sámándob   40x30 cm olaj-vászon', '', '', '', 'smndob 30x40.jpg.jpg', '', 'image/jpeg', 123716, 1, 2, 8),
(84, 'Káni hangok   100x75 cm olaj-vászon', '', '', '', 'Kni hangok_75x100_olaj-vszon_1996.jpg.jpg', '', 'image/jpeg', 142101, 1, 2, 9),
(85, 'Napos   120x100 cm olaj-vászon', '', '', '', 'Napos 120X100_olaj-vszon_2002.jpg.jpg', '', 'image/jpeg', 81855, 1, 2, 10),
(86, 'Sámándobos   80x80 cm olaj-vászon', '', '', '', 'sdob 80x80.jpg.jpg', '', 'image/jpeg', 95039, 1, 2, 11),
(87, 'Újrarendeződés   100x90 cm olaj-vászon', '', '', '', 'jrarendezds 90x100.jpg.jpg', '', 'image/jpeg', 172950, 1, 2, 12),
(88, 'Sámándobok   86x60 cm olaj-papír', '', '', '', 'smndobok  86x60.jpg.jpg', '', 'image/jpeg', 154332, 1, 2, 13),
(89, 'Dobok   70 x 100 cm', '', '', '', 'Dobok70x100.jpg.jpg', '', 'image/jpeg', 27340, 1, 2, 14),
(90, 'Husszonnégy nap   70 x 100 cm, olaj- vászon', '', '', '', 'huszonngy nap 80x100.jpg.jpg', '', 'image/jpeg', 32873, 1, 2, 15),
(91, 'Kék lengék   70x50 cm olaj-vászon', '', '', '', 'kk lengk 70x50.jpg.jpg', '', 'image/jpeg', 79897, 1, 3, 1),
(92, 'Ágyaspár   60x50 cm olaj-vászon', '', '', '', 'gyaspr1 50x60.jpg.jpg', '', 'image/jpeg', 89753, 1, 3, 2),
(93, 'Ágyaspár II   60x50 cm olaj-vászon', '', '', '', 'gyaspr I_50x60_olaj-vszon_2006.jpg.jpg', '', 'image/jpeg', 81273, 1, 3, 3),
(94, 'Ablakos vágy   50x40 cm olaj-vászon', '', '', '', 'Ablakos vgy 40X50 olaj-vszon.jpg.jpg', '', 'image/jpeg', 83079, 1, 3, 4),
(95, 'Két indiánnadrág   100x70 cm olaj-vászon', '', '', '', 'Kt indinnadrg_70x100_olaj-vszon.jpg.jpg', '', 'image/jpeg', 102628, 1, 3, 5),
(96, 'Az ágy teste   80x80 cm olaj-vászon', '', '', '', 'Az gy teste_80x80_olaj-vszon.jpg.jpg', '', 'image/jpeg', 61354, 1, 3, 6),
(97, 'Találka   50x50 cm olaj-vászon', '', '', '', 'tallka_50x50.jpg.jpg', '', 'image/jpeg', 65982, 1, 3, 7),
(98, 'Páros   40x50 cm olaj-vászon', '', '', '', 'Pros III 40X50 olaj-vszon.jpg.jpg', '', 'image/jpeg', 43511, 1, 3, 8),
(99, 'Tizenkét lét   140x160 cm olaj-vászon', '', '', '', 'Tiznkt lt_140x160_olaj-vszon_1998.jpg.jpg', '', 'image/jpeg', 76800, 1, 3, 9),
(100, 'Sejtelmem   100x40 cm olaj-vászon', '', '', '', 'sejtelmem 1999 40x100 olaj vszon.jpg.jpg', '', 'image/jpeg', 39489, 1, 3, 10),
(101, 'Északnyugati szél   120x160 cm olaj-vászon', '', '', '', 'szaknyugati szl_2006_120x160_olaj-vszon.jpg.jpg', '', 'image/jpeg', 40901, 1, 4, 1),
(102, 'Déliszélbelső   100x160 cm olaj-vászon', '', '', '', 'dliszlbels 100x160.jpg.jpg', '', 'image/jpeg', 22175, 1, 4, 2),
(103, 'Szél   80x100 cm olaj-vászon', '', '', '', 'szl 80x100.jpg.jpg', '', 'image/jpeg', 69744, 1, 4, 3),
(104, 'Északkeleti szél   80x100 cm olaj-vászon', '', '', '', 'szakkeleti szl_80x100_olaj-vszon_2006.jpg.jpg', '', 'image/jpeg', 51604, 1, 4, 4),
(105, 'Déliszél   80x100 cm olaj-vászon', '', '', '', 'dliszl 80x100.jpg.jpg', '', 'image/jpeg', 32342, 1, 4, 5),
(106, 'Rózsaszél   80x100 cm olaj-vászon', '', '', '', 'rzsaszl 80x100.jpg.jpg', '', 'image/jpeg', 48522, 1, 4, 6),
(107, 'Szolid   80x100 cm olaj-vászon', '', '', '', 'Szolid_80x100_olaj-vszon_2006.jpg.jpg', '', 'image/jpeg', 45110, 1, 4, 7),
(108, 'Szembeszél   120x120 cm olaj-vászon', '', '', '', 'Szembeszl_120x120_olaj-vszon_2006.jpg.jpg', '', 'image/jpeg', 53052, 1, 4, 8),
(109, 'Orja bája   100x160 cm olaj-vászon', '', '', '', 'Virgos szl_100x160_olaj-vszon_2006.jpg.jpg', '', 'image/jpeg', 32986, 1, 4, 9),
(110, 'Északkeleti díszes I   60x160 cm olaj-vászon', '', '', '', 'szakkeleti dszes1 60x160.jpg.jpg', '', 'image/jpeg', 24649, 1, 4, 10),
(111, 'Északkeleti díszes I részlet   olaj-vászon', '', '', '', 'rszlet Ki dszes.jpg.jpg', '', 'image/jpeg', 78041, 1, 4, 11),
(112, 'Északkeleti díszes II   60x160 cm olaj-vászon', '', '', '', 'szakkeleti dszes2 60x160.jpg.jpg', '', 'image/jpeg', 24463, 1, 4, 12),
(113, 'Szelek I   60x160 cm olaj-vászon', '', '', '', 'szelekI_60x160_olaj-vszon_2006.jpg.jpg', '', 'image/jpeg', 18512, 1, 4, 13),
(114, 'Szelek II   60x160 cm olaj-vászon', '', '', '', 'szelek II 60x160.jpg.jpg', '', 'image/jpeg', 16685, 1, 4, 14),
(115, 'Szelek III   60x160 cm olaj-vászon', '', '', '', 'szelekIII_60x160_olaj-vszon_2006.jpg.jpg', '', 'image/jpeg', 22530, 1, 4, 15),
(116, 'Délnyugati szél   230x450 cm olaj-teherautóponyva', '', '', '', 'Dlnyugati szl_450x230_ponyva_2007.jpg.jpg', '', 'image/jpeg', 44431, 1, 4, 16),
(117, 'Pöttyös   100x160 olaj vászon 2012', '', '', '', 'Nagy abo_ 100x160_olaj vszon 2012.jpg.jpg', '', 'image/jpeg', 59931, 1, 5, 1),
(118, 'Tar II   60x50 cm olaj-vászon', '', '', '', 'tar II_50x60_olaj-vszon_2009.jpg.jpg', '', 'image/jpeg', 66815, 1, 5, 2),
(119, 'Téli olaj/vászon 50X70', '', '', '', 'tli_50x70_olaj vszon.jpg.jpg', '', 'image/jpeg', 47357, 1, 5, 3),
(120, 'Közös   100x70 cm olaj-vászon', '', '', '', 'Kzs munka 70x100 olaj-vszon.jpg.jpg', '', 'image/jpeg', 113066, 1, 5, 4),
(121, 'Kéttó   100x80 cm olaj-vászon', '', '', '', 'ktt 80x100.jpg.jpg', '', 'image/jpeg', 66134, 1, 5, 5),
(122, 'Torzó I   50x60 cm olaj-vászon', '', '', '', 'torz_50x60_olaj-vszon_2009.jpg.jpg', '', 'image/jpeg', 67408, 1, 5, 6),
(123, 'Zsenge torzó   50x60 cm olaj-vászon', '', '', '', 'zsenge torz 50x60 olaj vszon 2010.jpg.jpg', '', 'image/jpeg', 49955, 1, 5, 7),
(124, 'Tar I   50x50 cm olaj-vászon 2009', '', '', '', '013k.jpg.jpg', '', 'image/jpeg', 75048, 1, 5, 8),
(125, 'Tar V   50x50 olaj-vászon 2010', '', '', '', '007k.jpg.jpg', '', 'image/jpeg', 60182, 1, 5, 9),
(126, 'tar III   50x50 cm olaj-vászon', '', '', '', 'tar III_50x50_olaj-vszon_2009.jpg.jpg', '', 'image/jpeg', 92659, 1, 5, 10),
(127, 'Bőgős   30x50 cm tus-papír', '', '', '', 'bgs.jpg.jpg', '', 'image/jpeg', 18189, 1, 6, 1),
(128, 'Gitáros   20x30 cm tus-papír', '', '', '', 'gitros.jpg.jpg', '', 'image/jpeg', 21078, 1, 6, 2),
(129, 'Tánc I   20x30 cm tus-papír', '', '', '', 'tnc1.jpg.jpg', '', 'image/jpeg', 17293, 1, 6, 3),
(130, 'Tánc II   20x30 cm tus-papír', '', '', '', 'tnc2.jpg.jpg', '', 'image/jpeg', 21660, 1, 6, 4),
(131, 'Tánc III   20x30 cm tus-papír', '', '', '', 'tnc3.jpg.jpg', '', 'image/jpeg', 21847, 1, 6, 5),
(132, 'Tánc IV   20x30 cm tus-papír', '', '', '', 'tnc4.jpg.jpg', '', 'image/jpeg', 20046, 1, 6, 6),
(133, 'Tánc V   20x30 cm tus-papír', '', '', '', 'tnc5.jpg.jpg', '', 'image/jpeg', 19911, 1, 6, 7),
(134, 'Tánc VI   20x30 cm tus-papír', '', '', '', 'tnc6.jpg.jpg', '', 'image/jpeg', 20072, 1, 6, 8),
(135, 'Születés 50x70 cm olaj-merítettpapír', '', '', '', 'Szlets 50x70.jpg.jpg', '', 'image/jpeg', 71619, 1, 18, 1),
(136, 'Várandós   50x70 cm olaj-merítettpapír', '', '', '', 'vrands  50x70.jpg.jpg', '', 'image/jpeg', 67815, 1, 18, 2),
(137, 'Asszonytánc   70x50 cm olaj-merítettpapír', '', '', '', 'asszonytnc 70x50.jpg.jpg', '', 'image/jpeg', 87146, 1, 18, 3),
(138, 'Női mandala   50x70 cm olaj-merítettpapír', '', '', '', 'mandala 50x70.jpg.jpg', '', 'image/jpeg', 111282, 1, 18, 4),
(139, 'Női lét   30x75 cm olaj-merítettpapír', '', '', '', 'Ni lt 30x75.jpg.jpg', '', 'image/jpeg', 33296, 1, 18, 5),
(140, 'Istennőfa   50x70 cm olaj-merítettpapír', '', '', '', 'Istennofa 50x70.JPG.jpg', '', 'image/jpeg', 60834, 1, 18, 6),
(141, 'Szeretők   50x70 cm olaj-vászon', '', '', '', 'Szeretk 50x70.jpg.jpg', '', 'image/jpeg', 46960, 1, 18, 7),
(142, 'Várandós II   50x70 cm olaj-vászon', '', '', '', 'vrands 1 50x70.jpg.jpg', '', 'image/jpeg', 57842, 1, 18, 8),
(143, 'Holdnapok 20x50   20x50 cm olaj-merítettpapír', '', '', '', 'Holdnapok 20x50.jpg.jpg', '', 'image/jpeg', 42527, 1, 18, 9),
(144, 'Egység   50x70 cm olaj-merítettpapír', '', '', '', 'egysg 50x70.jpg.jpg', '', 'image/jpeg', 108204, 1, 18, 10),
(145, 'Várandós III   50x70 cm olaj-merítettpapír', '', '', '', 'vrands 2 50x70.jpg.jpg', '', 'image/jpeg', 66300, 1, 18, 11),
(146, 'Ikrek   50x70 cm olaj-merítettpapír', '', '', '', 'ikrek 50x70.jpg.jpg', '', 'image/jpeg', 74268, 1, 18, 12),
(147, 'Várandós IV   50x70 cm olaj-merítettpapír', '', '', '', 'vrands 4 50x70.jpg.jpg', '', 'image/jpeg', 55838, 1, 18, 13),
(148, 'Világra hoz   120x160 cm olaj-vászon', '', '', '', 'Vilgra hoz_160X120_olaj-vszon_2004.jpg.jpg', '', 'image/jpeg', 47058, 1, 19, 1),
(149, 'bab és baba   50x40 cm olaj-vászon', '', '', '', 'bab s baba.jpg.jpg', '', 'image/jpeg', 102123, 1, 19, 2),
(150, 'Test-rész   100x50 cm olaj-vászon', '', '', '', 'Test-rsz_50x100_olaj-vszon.jpg.jpg', '', 'image/jpeg', 44468, 1, 19, 3),
(151, 'Papirusz   150x120 cm olaj-vászon', '', '', '', 'papirusz_120x150_olaj-vszon_2008-2.jpg.jpg', '', 'image/jpeg', 65101, 1, 19, 4),
(152, 'Asszonyok   70x50 cm olaj-vászon', '', '', '', 'asszonyok 50x70.jpg.jpg', '', 'image/jpeg', 72860, 1, 19, 5),
(153, 'Asszonyok II   70x50 cm olaj-vászon', '', '', '', 'asszony 50x70.jpg.jpg', '', 'image/jpeg', 72614, 1, 19, 6),
(154, 'Sejt I   40x40 cm olaj-vászon', '', '', '', 'Sejt_40X40_olaj-vszon.jpg.jpg', '', 'image/jpeg', 90356, 1, 19, 7),
(155, 'Sejt II   50x50 cm olaj-vászon', '', '', '', 'sejt 50x50.jpg.jpg', '', 'image/jpeg', 67913, 1, 19, 8),
(156, 'Ősanya   80x80 cm olaj-vászon', '', '', '', 'sanya 80x80.jpg.jpg', '', 'image/jpeg', 90643, 1, 19, 9),
(157, 'Születés   30x30 cm olaj-vászon', '', '', '', 'Vilgrahoz 30x30.jpg.jpg', '', 'image/jpeg', 103086, 1, 19, 10),
(158, 'Szülő   40x50 cm olaj-vászon', '', '', '', 'szl 40x50 olaj vszon.jpg.jpg', '', 'image/jpeg', 78777, 1, 19, 11),
(159, 'Világra szül   40x50 cm olaj-vászon', '', '', '', 'Vilgra szl 40x50.JPG.jpg', '', 'image/jpeg', 63695, 1, 19, 12),
(160, 'Világra jön   40x50 cm olaj-vászon', '', '', '', 'Vilgra jn 40x50.jpg.jpg', '', 'image/jpeg', 87875, 1, 19, 13),
(161, 'Tánc I 50x70cm olaj-papír', '', '', '', 'tnc.jpg.jpg', '', 'image/jpeg', 67235, 1, 8, 1),
(162, 'Tánc 100x75cm olaj-vászon', '', '', '', 'Dance oilcanvas 75x100.jpg.jpg', '', 'image/jpeg', 53242, 1, 8, 2),
(163, 'Naptánc 140x160cm olaj-vászon', '', '', '', 'naptnc_2003_140X160_olajvszon.jpg.jpg', '', 'image/jpeg', 56524, 1, 8, 3),
(164, 'Ilonának   140x160cm olaj-vászon', '', '', '', 'Ilonnak 140x160 olaj-v 2002.jpg.jpg', '', 'image/jpeg', 60736, 1, 21, 1),
(165, 'Nap-tár   120x80 cm olaj-vászon', '', '', '', 'nap-tr_2003_100X70_olajvszon.jpg.jpg', '', 'image/jpeg', 55223, 1, 21, 2),
(166, 'Elemek   50x70 cm olaj-vászon', '', '', '', 'elemek 50x70.JPG.jpg', '', 'image/jpeg', 55356, 1, 21, 3),
(167, 'Spirál   50x50 cm olaj-vászon', '', '', '', 'Spirl_50x50_olaj-vszon_2006.jpg.jpg', '', 'image/jpeg', 68717, 1, 21, 4),
(168, 'Papirusz   150x120 cm olaj-vászon', '', '', '', 'papirusz_120x150_olaj-vszon_2008-1.jpg.jpg', '', 'image/jpeg', 48865, 1, 21, 5),
(169, 'Triskele   80x80 cm olaj-vászon', '', '', '', 'triskele 80x80.jpg.jpg', '', 'image/jpeg', 54757, 1, 21, 6),
(170, 'Nagykörte   120x160 cm olaj-vászon', '', '', '', 'nagykorte_2002_120X160_olajvszon.jpg.jpg', '', 'image/jpeg', 47119, 1, 21, 7),
(171, 'Alma-körte   100x80 cm olaj-vászon', '', '', '', 'Alma-krte 80x100.jpg.jpg', '', 'image/jpeg', 51825, 1, 21, 8),
(172, 'Amulett   50x70 cm olaj-merítettpapír', '', '', '', 'varzsk 1.jpg.jpg', '', 'image/jpeg', 53230, 1, 20, 1),
(173, 'Íjász   25x25 cm olaj-merítettpapír', '', '', '', 'jsz retus.jpg.jpg', '', 'image/jpeg', 112041, 1, 20, 2),
(174, 'Inka I   25x25 cm olaj-merítettpapír', '', '', '', 'inka retus 1.jpg.jpg', '', 'image/jpeg', 91384, 1, 20, 3),
(175, 'Inka II   25x25 cm olaj-merítettpapír', '', '', '', 'inka retus 2.jpg.jpg', '', 'image/jpeg', 83468, 1, 20, 4),
(176, 'Gyíkok   25x25 cm olaj-merítettpapír', '', '', '', 'gykok r.jpg.jpg', '', 'image/jpeg', 111189, 1, 20, 5),
(177, 'Kék szarvas   50x70 cm olaj-merítettpapír', '', '', '', 'kk szarvas k.jpg.jpg', '', 'image/jpeg', 17499, 1, 20, 6),
(178, 'Szalagfonás   50x70 cm olaj-merítettpapír', '', '', '', 'szalagfonas_nagy.jpg.jpg', '', 'image/jpeg', 103580, 1, 20, 7),
(179, 'Kelim   50x70 cm olaj-merítettpapír', '', '', '', 'kelim retus.jpg.jpg', '', 'image/jpeg', 44066, 1, 20, 8),
(180, 'Mese   50x70 cm olaj-merítettpapír', '', '', '', 'mese_1r.jpg.jpg', '', 'image/jpeg', 59399, 1, 20, 9),
(181, 'Bordó szarvas   25x25 cm olaj-merítettpapír', '', '', '', 'Bord szarvas.jpg.jpg', '', 'image/jpeg', 79745, 1, 20, 10),
(182, 'Égi vadászok   25x25 cm olaj-merítettpapír', '', '', '', 'gi vadszok.jpg.jpg', '', 'image/jpeg', 77185, 1, 20, 11),
(183, 'Tulip   120x170 cm olaj-vászon', '', '', '', 'tulip_170x120_olaj-vszon_2001.jpg.jpg', '', 'image/jpeg', 43411, 1, 10, 1),
(184, 'Segítők   100x160 cm olaj-vászon', '', '', '', 'Segtk 100x160.jpg.jpg', '', 'image/jpeg', 61935, 1, 10, 2),
(185, 'Tulipánvilág II   100x80 cm olaj-vászon', '', '', '', 'tulipnvilg2 80x100.jpg.jpg', '', 'image/jpeg', 85048, 1, 10, 3),
(186, 'Szívhang   70x50 cm olaj-vászon', '', '', '', 'szvhang 50x70-1.jpg.jpg', '', 'image/jpeg', 124684, 1, 10, 4),
(187, 'Virág   100x40 cm olaj-vászon', '', '', '', 'virg 40x100.jpg.jpg', '', 'image/jpeg', 60596, 1, 10, 5),
(188, 'Korai föld   80x70 cm olaj-vászon', '', '', '', 'Korai fld 70x80.jpg.jpg', '', 'image/jpeg', 121064, 1, 10, 6),
(189, 'Növényi sejt   60x50 cm olaj-vászon', '', '', '', 'Nvnyi sejt 50x60.jpg.jpg', '', 'image/jpeg', 88625, 1, 10, 7),
(190, 'Metszésponton   70x50 cm olaj-vászon', '', '', '', 'Metszsponton 50x70.jpg.jpg', '', 'image/jpeg', 94124, 1, 10, 8),
(191, 'Életfa I   50x70 cm olaj-merítettpapír', '', '', '', 'letfa I 50x70.jpg.jpg', '', 'image/jpeg', 36338, 1, 26, 1),
(192, 'Életfa 50x70cm olaj-merítetpapír', '', '', '', 'letfa II 50x70.jpg.jpg', '', 'image/jpeg', 36226, 1, 26, 2),
(193, 'Papirusz   150x120 cm olaj-vászon', '', '', '', 'papirusz_120x150_olaj-vszon_2008.jpg.jpg', '', 'image/jpeg', 48865, 1, 27, 1),
(194, 'Életfa 70x100cm tus-papír', '', '', '', 'eletfa_tus_nagy_2A.JPG.jpg', '', 'image/jpeg', 50124, 1, 27, 2),
(195, 'Nyílás   100x140 cm olaj-vászon', '', '', '', 'nyls_2004_100X150_olajvszon.jpg.jpg', '', 'image/jpeg', 33807, 1, 27, 3),
(196, 'Lent, mint fent   140x160 cm olaj-vászon', '', '', '', 'Lent mint fent 140X160 olaj-vszon j.jpg.jpg', '', 'image/jpeg', 39997, 1, 27, 4),
(197, 'Életfa   120x160 cm olaj-vászon', '', '', '', 'letfa_2004_120X160_olajvszon.jpg.jpg', '', 'image/jpeg', 38369, 1, 27, 5),
(198, 'Életfák   80x60 cm olaj-vászon', '', '', '', 'letfk 60x80.jpg.jpg', '', 'image/jpeg', 59191, 1, 27, 6),
(199, 'Árnyas I.   50 x 50 cm olaj-vászon', '', '', '', 'rnyas I 50X50 olaj-vszon 2006.jpg.jpg', '', 'image/jpeg', 27631, 1, 12, 1),
(200, 'Árnyas II.   50 x 50 cm olaj-vászon', '', '', '', 'rnyas II 50X50 olaj-vszon.jpg.jpg', '', 'image/jpeg', 31215, 1, 12, 2),
(201, 'Lélekmadarak I   90x30 cm olaj-vászon', '', '', '', 'llekmadarak 1.jpg.jpg', '', 'image/jpeg', 37575, 1, 12, 3),
(202, 'Madarak I   160x50 cm olaj-vászon', '', '', '', 'Madarak II 50X160 olaj-vszon-1.jpg.jpg', '', 'image/jpeg', 28719, 1, 12, 4),
(203, 'Madarak II   160x50 cm olaj-vászon', '', '', '', 'Madarak III 50X160olaj-vszon-1.jpg.jpg', '', 'image/jpeg', 27048, 1, 12, 5),
(204, 'Árnyas III.   50 x 50 cm, olaj- vászon', '', '', '', 'rnyas III 50X50 olaj-vszon.jpg.jpg', '', 'image/jpeg', 22719, 1, 12, 6),
(205, 'Árnyas IV.   50 x 50 cm olaj- vászon', '', '', '', 'rnyas IV 50X50 olaj-vszon 2006.jpg.jpg', '', 'image/jpeg', 27659, 1, 12, 7),
(206, 'Kékmadaras', '', '', '', 'kkmadaras.jpg.jpg', '', 'image/jpeg', 26659, 1, 12, 8),
(207, 'Madárház', '', '', '', 'Madrhz.jpg.jpg', '', 'image/jpeg', 24086, 1, 12, 9),
(208, 'Madarak', '', '', '', 'mad1.jpg.jpg', '', 'image/jpeg', 25485, 1, 12, 10),
(209, 'Lélekmadarak II.', '', '', '', 'llekmadarak 2.jpg.jpg', '', 'image/jpeg', 24201, 1, 12, 11),
(210, 'Lélekmadarak III.', '', '', '', 'llekmadarak 3.jpg.jpg', '', 'image/jpeg', 20582, 1, 12, 12),
(211, 'Üzemi játék I 330x210cm olaj-vászon', '', '', '', 'IMG_9602.JPG.jpg', '', 'image/jpeg', 34615, 1, 13, 1),
(212, 'Üzemi játék II 330x210cm olaj-vászon', '', '', '', 'IMG_9605.JPG.jpg', '', 'image/jpeg', 32053, 1, 13, 2),
(213, 'Üzemi játék III 330x210cm olaj-vászon', '', '', '', 'IMG_9720.JPG.jpg', '', 'image/jpeg', 36834, 1, 13, 3),
(214, 'Üzemi játék I-III 330x210cm olaj-vászon', '', '', '', 'IMG_9704.JPG.jpg', '', 'image/jpeg', 35524, 1, 13, 4),
(215, 'Keserü Ilonával a képek előtt', '', '', '', 'sz2.JPG.jpg', '', 'image/jpeg', 37014, 1, 13, 5),
(216, 'Szél I 330x210cm olaj-vászon 2007', '', '', '', '1szl.jpg.jpg', '', 'image/jpeg', 31872, 1, 13, 6),
(217, 'Szél II 330x210cm olaj-vászon 2007', '', '', '', '2szl.jpg.jpg', '', 'image/jpeg', 29596, 1, 13, 7),
(218, 'Üzemi játék I 330x210cm olaj-vászon/részlet', '', '', '', 'IMG_9603.JPG.jpg', '', 'image/jpeg', 35050, 1, 13, 8),
(219, '1', '', '', '', 'DSC07517.JPG.jpg', '', 'image/jpeg', 24786, 1, 36, 1),
(220, '2', '', '', '', 'DSC07518.JPG.jpg', '', 'image/jpeg', 26034, 1, 36, 2),
(221, '3', '', '', '', 'DSC07524.JPG.jpg', '', 'image/jpeg', 28005, 1, 36, 3),
(222, '4', '', '', '', 'DSC07529.JPG.jpg', '', 'image/jpeg', 28354, 1, 36, 4),
(223, '5', '', '', '', 'DSC07532.JPG.jpg', '', 'image/jpeg', 33625, 1, 36, 5),
(224, '6', '', '', '', 'DSC07533.JPG.jpg', '', 'image/jpeg', 33643, 1, 36, 6),
(225, '7', '', '', '', 'DSC07534.JPG.jpg', '', 'image/jpeg', 34226, 1, 36, 7),
(226, '8', '', '', '', 'DSC07535.JPG.jpg', '', 'image/jpeg', 28715, 1, 36, 8),
(227, '9', '', '', '', 'IMG_4383.JPG.jpg', '', 'image/jpeg', 32537, 1, 36, 9),
(228, '10', '', '', '', 'IMG_4370.JPG.jpg', '', 'image/jpeg', 33405, 1, 36, 10),
(229, '11', '', '', '', 'DSC07540.JPG.jpg', '', 'image/jpeg', 63608, 1, 36, 11),
(230, '12', '', '', '', 'IMG_4374.JPG.jpg', '', 'image/jpeg', 22807, 1, 36, 12),
(231, '13', '', '', '', 'IMG_4376.JPG.jpg', '', 'image/jpeg', 28410, 1, 36, 13),
(232, '14', '', '', '', 'DSC_0223.JPG.jpg', '', 'image/jpeg', 45187, 1, 36, 14),
(233, '15', '', '', '', 'DSC_0230.JPG.jpg', '', 'image/jpeg', 32331, 1, 36, 15),
(234, 'DSC_0204', '', '', '', 'DSC_0204.JPG.jpg', '', 'image/jpeg', 20327, 1, 36, 16),
(235, 'DSC_0283', '', '', '', 'DSC_0283.JPG.jpg', '', 'image/jpeg', 26594, 1, 36, 17),
(236, '18', '', '', '', 'IMG_4450.JPG.jpg', '', 'image/jpeg', 18984, 1, 36, 18),
(237, '19', '', '', '', 'IMG_4452.JPG.jpg', '', 'image/jpeg', 28759, 1, 36, 19),
(238, '20', '', '', '', 'IMG_4472.JPG.jpg', '', 'image/jpeg', 26069, 1, 36, 20),
(239, '21', '', '', '', 'IMG_4470.JPG.jpg', '', 'image/jpeg', 41162, 1, 36, 21),
(240, '22', '', '', '', 'IMG_4446.JPG.jpg', '', 'image/jpeg', 24101, 1, 36, 22);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `user_image` varchar(255) NOT NULL,
  `cv_hu` text NOT NULL,
  `cv_en` text NOT NULL,
  `news_hu` text NOT NULL,
  `news_en` text NOT NULL,
  `bibliography_hu` text NOT NULL,
  `bibliography_en` text NOT NULL,
  `links` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `user_image`, `cv_hu`, `cv_en`, `news_hu`, `news_en`, `bibliography_hu`, `bibliography_en`, `links`, `email`, `phone`) VALUES
(1, 'rico', '$2y$10$lqPCiL7BMSlZRKlqeyl9MOLxyuru1SVa3AMNidZ3chfmrg4.qU6f6', '', '', '46', '<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\"><strong>&Eacute;letrajz</strong></p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\"><strong>&nbsp;</strong></p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1966 sz&uuml;letett Budapesten</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1989-93 Akademie der Bildenden K&uuml;nste M&uuml;nchen/ K&eacute;pzőműv&eacute;szeti Akad&eacute;mia M&uuml;nchen</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Mestere: F.B. Weisshaar</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1993-96 PTE, Műv&eacute;szeti Kar, K&eacute;pzőműv&eacute;szeti Mesteriskola, P&eacute;cs</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Mestere: Keser&uuml; Ilona</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2005- 07&nbsp;PTE Műv&eacute;szeti Kar-&Aacute;OK, K&eacute;pzőműv&eacute;szetter&aacute;pia</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">&nbsp;</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\"><strong>Ki&aacute;ll&iacute;t&aacute;sok</strong></p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\"><strong>&nbsp;</strong></p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\"><em>Egy&eacute;ni</em>&nbsp;( v&aacute;logat&aacute;s )</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1993 Studentenstadt, M&uuml;nchen</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1998 T&ouml;lgyfagal&eacute;ria, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Art&eacute;ria gal&eacute;ria, Szentendre, (Farkas &Aacute;d&aacute;mmal)</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2000 Art&eacute;ria Gal&eacute;ria, Szentendre</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Paracelsusklinik, M&uuml;nchen (Gy&eacute;csek J&oacute;zseffel)</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2002 Art&eacute;ria Gal&eacute;ria, Szentendre</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2004 Aranyt&iacute;z, Budapest, Sz&uuml;let&eacute;shete</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2005 Ekiz Zentrum, Graz</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2006 Saint Gal&eacute;ria, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2007 B&aacute;linth&aacute;z, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2008 Rudh Gallery, Milano</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2009 Őszidő, Szeged</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2010 &Uacute;jbuda Gal&eacute;ria, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Skanzen Gal&eacute;ria, Szentendre</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">&nbsp;</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">&nbsp;</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2013 Lak&aacute;st&aacute;rlat, Baksai J&oacute;zseffel &eacute;s M&aacute;rkus P&eacute;terrel, MJAM, Szentendre</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2016 SZEI, Szentendre</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2017 Neosys ki&aacute;ll&iacute;t&aacute;s, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2018 L&rsquo;ArtT&eacute;r11 Szentendre</p>\r\n<p style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">&nbsp;</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">&nbsp;</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\"><em>Csoportos</em>&nbsp;( v&aacute;logat&aacute;s )</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1992 BRK, M&uuml;nchen</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1994 Magyar Kult&uacute;ra H&aacute;za, Berlin</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1995 Biennale Mladih, Rijeka</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1997 Olaj v&aacute;szon, Műcsarnok, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1999 N&eacute;gy &Eacute;gt&aacute;j, P&aacute;lme H&aacute;z, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">&Aacute;ttűn&eacute;sek, Műv&eacute;szetmalom, Szentendre</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2000 Id&ouml;h&iacute;d 2000, Műv&eacute;szetmalom., Szentendre</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">M&aacute;sik Nem, Ernst M&uacute;zeum, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2002 Art&eacute;ria, Vigad&oacute; Gal&eacute;ria, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2003 Keser&uuml; Tan&iacute;tv&aacute;nyok, P&eacute;csi Gal&eacute;ria, P&eacute;cs</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2004 Templom Gal&eacute;ria, Eger</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2005 Intro-Impro, Saint Gal&eacute;ria, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2006 G&aacute;l Imre Gal&eacute;ria, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2007 L&eacute;pt&eacute;kv&aacute;lt&aacute;s, Zsolnay gy&aacute;r, P&eacute;cs</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Tavaszi t&aacute;rlat, Műv&eacute;szetmalom, Szentendre</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2B Gal&eacute;ria, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2008 Sz&iacute;nerő, Keszthely</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Ponyva, Szentendre, Műv&eacute;szetmalom</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2009 Ponyva, P&aacute;lme H&aacute;z, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">IKON, Rondella, Esztergom</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Sz&iacute;nerő IV, P&eacute;cs, Zsolnay gy&aacute;r</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Szekko, Szentendrei K&eacute;pt&aacute;r</p>\r\n<p style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2011 Sz&iacute;nerő- L&eacute;pt&eacute;kv&aacute;lt&aacute;s, N&aacute;dor Gal&eacute;ria, P&eacute;cs</p>\r\n<p style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Art Market, Millen&aacute;ris, Budapest</p>\r\n<p style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2012 Local Painting, Műv&eacute;szetmalom, Szentendre</p>\r\n<p style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2013 Műhely,m21 Gal&eacute;ria, P&eacute;cs</p>\r\n<p style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2014 P&aacute;rhuzamok &eacute;s Tal&aacute;lkoz&aacute;sok, Szombathelyi K&eacute;pt&aacute;r</p>\r\n<p style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2016 SZEI, Szentendre</p>', '<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\"><strong>Biography</strong></p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">&nbsp;</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1966 Born in Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1989-1993 Attends the Faculty of Painting at the Fine Art Academy in Munich. Her advisor is F.B. Weisshaar</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1993 Receives her Degree in Arts</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1993-1996 Becomes a student at the Fine Arts Master School of Janus Pannonius University in P&eacute;cs</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Her advisor is Ilona Keser&uuml;</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1996 Receives her Master&rsquo;s Degree in Arts</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2004-2007 Becomes a student pursued postgraduate specialised studies in Art Therapy at University of P&eacute;cs</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2007 Receives her Degree in Art Therapy with a specialisation in visual arts</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">&nbsp;</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\"><strong>Individual exhibitions</strong></p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">&nbsp;</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1993 Studentenstadt, Munich</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1998 Arteria Gallery (together with &Aacute;d&aacute;m Farkas), Szentendre</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1998 Oaktree Gallery, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2000 Arteria Gallery, Szentendre</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px 1em 1cm; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Paracelsusklinik, Munich</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2002 Arteria Gallery, Szentendre</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2004 Aranyt&iacute;z, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2005 Ekiz Zentrum, Graz</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2006 Saint Gallery, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2007 B&aacute;linth&aacute;z, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2008 Rudh Gallery, Milano</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2009 Autumntime, Szeged</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2010 New Buda Gallery, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px 1em 1cm; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Skanzen Gallery, Szentendre</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">&nbsp;</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\"><strong>Group exhibitions</strong></p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">&nbsp;</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1992 BRK, Munich</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1994 The House of Hungarian Culture, Berlin</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px 1em 1cm; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">P&eacute;cs Gallery, P&eacute;cs</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1995 Biennale Mladih, Rijeka</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px 1em 1cm; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Art Expo, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1996 Glass painting in architecture, P&eacute;cs Small Gallery</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px 1em 1cm; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">P&eacute;cs Gallery, P&eacute;cs</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1997 Oil Canvas, Exhibition Hall, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">1998 National Theatre, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px 1em 1cm; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Szentendre Art, Art Mill, Szentendre</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px 1em 1cm; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Four Cardinal Points, Palme House, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px 1em 1cm; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">&bdquo;Dissolving&rdquo;, Art Mill, Szentendre</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2000 Timebridge 2000, Art Mill, Szentendre</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px 1em 1cm; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">The other sex, Ernst Museum, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2002Vigad&oacute; Gallery, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2003 P&eacute;cs Gallery, P&eacute;cs</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2004 Church Gallery, Eger</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2005 Intro-Impro, Saint Gallery, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2006 Imre G&aacute;l Gallery, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2007 Change in Scale, Zsolnay Factory, P&eacute;cs</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px 1em 1cm; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Spring Exhibition, Art Mill, Szentendre</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px 1em 1cm; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2B Gallery, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2008 Force of Colours, Keszthely</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px 1em 1cm; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Tarpaulin, Art Mill, Szentendre</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">2009 Tarpaulin, Palme House, Budapest</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px 1em 1cm; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">IKON, Rondella, Esztergom</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px 1em 1cm; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Force of Colours IV, Zsolnay Factory, P&eacute;cs</p>\r\n<p class=\"MsoNormal\" style=\"margin: 1em 0px 1em 1cm; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\">Sekko, Gallery of Szentendre</p>', '<h2 class=\"contentheading\" style=\"font-family: \'Segoe UI\', Arial, Helvetica, sans-serif; font-size: 22px; margin: 0px; padding: 5px 0px 8px; font-weight: normal; color: #333333; background-color: #ffffff;\">Ki&aacute;ll&iacute;t&aacute;s</h2>', '<h2 class=\"contentheading\" style=\"font-family: \'Segoe UI\', Arial, Helvetica, sans-serif; font-size: 22px; margin: 0px; padding: 5px 0px 8px; font-weight: normal; color: #333333; background-color: #ffffff;\">Exhibition</h2>', '<h2 class=\"contentheading\" style=\"font-family: \'Segoe UI\', Arial, Helvetica, sans-serif; font-size: 22px; margin: 0px; padding: 5px 0px 8px; font-weight: normal; color: #333333; background-color: #ffffff;\">Bibliogr&aacute;fia</h2>', '<h2 class=\"contentheading\" style=\"font-family: \'Segoe UI\', Arial, Helvetica, sans-serif; font-size: 22px; margin: 0px; padding: 5px 0px 8px; font-weight: normal; color: #333333; background-color: #ffffff;\">Bibliography</h2>', '<p style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\"><a style=\"color: #333333;\" href=\"http://sites.google.com/site/lehoczkykrisztina/\" target=\"_blank\" rel=\"noopener\">http://sites.google.com/site/lehoczkykrisztina/</a></p>\r\n<p style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\"><a style=\"color: #333333;\" href=\"http://www.artendre.hu/html/lehoczkk/index.html\" target=\"_blank\" rel=\"noopener\">http://www.artendre.hu/html/lehoczkk/index.html</a></p>\r\n<p style=\"margin: 1em 0px; padding: 0px; color: #333333; font-family: Arial, Helvetica, sans-serif; font-size: 11px; background-color: #ffffff;\"><a style=\"color: #333333;\" href=\"http://art.pte.hu/dla/szinero/2007_I/works_in_progress/works_in_progress_lehoczky.html\" target=\"_blank\" rel=\"noopener\">http://art.pte.hu/dla/szinero/2007_I/works_in_progress/works_in_progress_lehoczky.html</a></p>', 'lehokrisz@yahoo.de', '06-30/343-69-96');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photo_id_index` (`photo_id`);

--
-- A tábla indexei `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `folders`
--
ALTER TABLE `folders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT a táblához `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
