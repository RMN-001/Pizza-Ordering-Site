-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2021 at 07:14 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `tbl_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `full_name`, `username`, `password`) VALUES
(1, 'Nagy Sándor', 'sanyi', 'E10ADC3949BA59ABBE56E057F20F883E'),
(4, 'Kiss Géza', 'gezu', 'E10ADC3949BA59ABBE56E057F20F883E'),
(9, 'Kovács Réka', 'reku', 'E10ADC3949BA59ABBE56E057F20F883E'),
(12, 'Administrator', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `image_name`, `featured`, `active`) VALUES
(1, 'Normal', 'normal.jpg', 'Yes', 'Yes'),
(2, 'Italian', 'olasz.jpg', 'Yes', 'Yes'),
(3, 'LowCH', 'csokkentett.jpg', 'Yes', 'Yes')

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food`
--

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

--
-- Dumping data for table `tbl_food`
--

INSERT INTO `tbl_food` (`id`, `title`, `description`, `price`, `image_name`, `category_id`, `featured`, `active`) VALUES
(11, 'Capricciosa Pizza', 'paradicsomos alap, sonka, olajbogyó, gomba, sajt', '1890', 'capricciosa.jpeg', 1, 'Yes', 'Yes'),
(12, 'Lazacos Pizza', 'paradicsomos alap, lazac, sajt, kakukkfű', '2190', 'salmon.jpeg', 1, 'Yes', 'Yes'),
(13, 'Magyaros Pizza', 'paradicsomos alap, kolbász, sonka, sajt, hagyma', '1990', 'hungarian.jpeg', 1, 'Yes', 'Yes'),
(14, 'Húsimádó Pizza', 'paradicsomos alap, kolbász, szalonna, sonka, sajt', '2190', 'husimado.jpeg', 1, 'Yes', 'Yes'),
(15, 'Prosciutto Pizza', 'paradicsomos alap, prosciutto, sajt, rukkola', '2090', 'prosciutto.jpeg', 1, 'Yes', 'Yes'),
(16, 'Négysajtos Pizza', 'paradicsomos alap, parmezán, trappista, edámi, feta', '1890', '4cheese.jpeg', 1, 'Yes', 'Yes'),
(17, 'Négy évszak Pizza', 'paradicsomos alap, sonka, gomba, fagyasztott zöldségek, sajt', '1890', '4season.jpeg', 1, 'Yes', 'Yes'),
(18, 'Hawaii Pizza', 'paradicsomos alap, sonka, ananász, sajt', '1890', 'hawaii.jpeg', 1, 'Yes', 'Yes'),
(19, 'Margaréta Pizza', 'paradicsomos alap, sonka, sajt', '1790', 'margareta.jpeg', 1, 'Yes', 'Yes'),
(20, 'Songoku Pizza', 'paradicsomos alap, sonka, gomba, kukorica, sajt', '1990', 'songoku.jpeg', 1, 'Yes', 'Yes')

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

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

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `food`, `price`, `qty`, `total`, `order_date`, `status`, `customer_name`, `customer_contact`, `customer_email`, `customer_address`) VALUES
(2, 'Best Burger', '4.00', 4, '16.00', '2020-11-30 03:52:43', 'Delivered', 'Kelly Dillard', '7896547800', 'kelly@gmail.com', '308 Post Avenue'),
(3, 'Mixed Pizza', '10.00', 2, '20.00', '2020-11-30 04:07:17', 'Delivered', 'Thomas Gilchrist', '7410001450', 'thom@gmail.com', '1277 Sunburst Drive'),
(4, 'Mixed Pizza', '10.00', 1, '10.00', '2021-05-04 01:35:34', 'Delivered', 'Martha Woods', '78540001200', 'marthagmail.com', '478 Avenue Street'),
(6, 'Chicken Wrap', '7.00', 1, '7.00', '2021-07-20 06:10:37', 'Delivered', 'Charlie', '7458965550', 'charlie@gmail.com', '3140 Bartlett Avenue'),
(7, 'Cheeseburger', '4.00', 2, '8.00', '2021-07-20 06:40:21', 'On Delivery', 'Claudia Hedley', '7451114400', 'hedley@gmail.com', '1119 Kinney Street'),
(8, 'Smoky BBQ Pizza', '6.00', 1, '6.00', '2021-07-20 06:40:57', 'Ordered', 'Vernon Vargas', '7414744440', 'venno@gmail.com', '1234 Hazelwood Avenue'),
(9, 'Chicken Wrap', '5.00', 4, '20.00', '2021-07-20 07:06:06', 'Cancelled', 'Carlos Grayson', '7401456980', 'carlos@gmail.com', '2969 Hartland Avenue'),
(10, 'Grilled Cheese Sandwich', '3.00', 4, '12.00', '2021-07-20 07:11:06', 'Delivered', 'Jonathan Caudill', '7410256996', 'jonathan@gmail.com', '1959 Limer Street');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_food`
--
ALTER TABLE `tbl_food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_food`
--
ALTER TABLE `tbl_food`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
