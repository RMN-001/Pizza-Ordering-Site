
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `tbl_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- admin adatok

INSERT INTO `tbl_admin` (`id`, `full_name`, `username`, `password`) VALUES
(1, 'Nagy Sándor', 'sanyi', 'E10ADC3949BA59ABBE56E057F20F883E'),
(2, 'Kiss Géza', 'gezuka', 'E10ADC3949BA59ABBE56E057F20F883E'),
(3, 'Kovács Réka', 'rekuci', 'E10ADC3949BA59ABBE56E057F20F883E'),
(4, 'Administrator', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E');


-- kategóriák táblázat

CREATE TABLE `tbl_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- kagegória táblázat adatok

INSERT INTO `tbl_category` (`id`, `title`, `image_name`, `featured`, `active`) VALUES
(99, 'Nomrál tészta', 'normal.jpeg', 'Yes', 'Yes'),
(98, 'Olasz tészta', 'olasz.jpeg', 'Yes', 'Yes'),
(97, 'CH csökkentett', 'csokkentett.jpeg', 'Yes', 'Yes');



-- étlap táblázat

CREATE TABLE `tbl_food` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Étlap táblázat adatok

INSERT INTO `tbl_food` (`id`, `title`, `description`, `price`, `image_name`, `category_id`, `featured`, `active`) VALUES
(11, 'Capricciosa Pizza', 'paradicsomos alap, sonka, olajbogyó, gomba, sajt', '1890', 'capricciosa.jpeg', 1, 'Yes', 'Yes'),
(12, 'Lazacos Pizza', 'paradicsomos alap, lazac, sajt, kakukkfű', '2190', 'salmon.jpeg', 1, 'Yes', 'Yes'),
(13, 'Magyaros Pizza', 'paradicsomos alap, kolbász, sonka, sajt, hagyma', '1990', 'hungarian.jpeg', 1, 'Yes', 'Yes'),
(14, 'Húsimádó Pizza', 'paradicsomos alap, kolbász, szalonna, sonka, sajt', '2190', 'husimado.jpeg', 1, 'Yes', 'Yes'),
(15, 'Prosciutto Pizza', 'paradicsomos alap, prosciutto, sajt, rukkola', '2090', 'prosciutto.jpeg', 1, 'Yes', 'Yes'),
(16, 'Négysajtos Pizza', 'paradicsomos alap, parmezán, trappista, edámi, feta', '1890', '4cheese.jpeg', 1, 'Yes', 'Yes'),
(17, 'Négy évszak Pizza', 'paradicsomos alap, sonka, gomba, fagyasztott zöldségek, sajt', '1890', '4season.jpeg', 1, 'Yes', 'Yes'),
(18, 'Hawaii Pizza', 'paradicsomos alap, sonka, ananász, sajt', '1890', 'hawaii.jpeg', 1, 'Yes', 'Yes'),
(19, 'Margaréta Pizza', 'paradicsomos alap, sonka, sajt', '1790', 'margareta.jpeg', 1, 'Yes', 'Yes');




-- Rendelés táblázat

CREATE TABLE `tbl_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `food` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `customer_contact` varchar(20) NOT NULL,
  `customer_email` varchar(150) NOT NULL,
  `customer_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- Rendelési adatok

INSERT INTO `tbl_order` (`id`, `food`, `price`, `qty`, `total`, `order_date`, `status`, `customer_name`, `customer_contact`, `customer_email`, `customer_address`) VALUES
(101, 'Hawaii Pizza', '1890', 4, '7560', '2020-11-30 03:52:43', 'Szállítva', 'Kiss Ferenc', '301234567', 'kiss.ferenc@gmail.com', '4800 Romai körút 18'),
(102, 'Szalámis Pizza', '1990', 2, '3980', '2020-11-30 04:07:17', 'Szállítva', 'Nagy Béla', '207654321', 'nagy.bela@gmail.com', '6800 Kolozsvári utca 25'),
(103, 'Húsimádó Pizza', '2190', 1, '2190', '2021-05-04 01:35:34', 'Szállítva', 'Kovács Izabella', '701234567', 'kovacs.iza@gmail.com', '6247 Szent István utca 12'),
(104, 'Prosciutto Pizza', '2090', 1, '2090', '2021-07-20 06:10:37', 'Szállítva', 'Jónás István', '501234567', 'jonas.pisti@gmail.com', '7200 Nagy Sándor utca 78'),
(105, 'Margaréta Pizza', '1790', 2, '3580', '2021-07-20 06:40:21', 'Folyamatban', 'Szabó Erika', '201234566', 'szabi.erika@gmail.com', '8600 Szlovák utca 1'),
(106, 'Hawaii Pizza', '1890', 1, '1890', '2021-07-20 06:40:57', 'Megrendelve', 'Varga Rózsa', '201111111', 'varga.rozsa@gmail.com', '7411 Rózsa utca 65'),
(107, 'Magyaros Pizza', '1990', 4, '7960', '2021-07-20 07:06:06', 'Törölve', 'Kovács Károly', '308855224', 'kovacs.karoly@gmail.com', '6555 Kovács utca 18'),
(108, 'Magyaros Pizza', '1990', 4, '7960', '2021-07-20 07:11:06', 'Szállítva', 'Nagy Erzsébet', '302471589', 'nagy.erzsi@gmail.com', '3500 Széles utca 78');



-- INDEXEK: `tbl_admin`

ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);


-- INDEXEK: `tbl_category`

ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);


-- INDEXEK: `tbl_food`

ALTER TABLE `tbl_food`
  ADD PRIMARY KEY (`id`);


-- INDEXEK: for table `tbl_order`

ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);



ALTER TABLE `tbl_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;


ALTER TABLE `tbl_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;


ALTER TABLE `tbl_food`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;


ALTER TABLE `tbl_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
