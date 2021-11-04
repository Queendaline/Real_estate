-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2021 at 11:25 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `real_estate`
--

-- --------------------------------------------------------

--
-- Table structure for table `nin_admin`
--

CREATE TABLE `nin_admin` (
  `id` int(11) NOT NULL,
  `token` varchar(32) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(14) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nin_admin`
--

INSERT INTO `nin_admin` (`id`, `token`, `name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Frank Obi', 'frank@gmail.com', '080345678900', '$2y$10$I04fJZ9eOoi5UXwRGBJRkulUH0o96FpjALFvUM1saKpUrmhlg.xwa', '2021-05-24 12:32:20', '2021-05-24 12:32:20'),
(2, NULL, 'helen', 'helen@gmail.com', NULL, '$2y$10$wUyW5QuNyCFeYTrwhewjBOZwo4GYO2jfSmWajDY6ELITG3xhdrcry', '2021-05-24 14:16:12', '2021-05-24 14:16:12'),
(3, 'i5pyvtbd9', 'Chioma Ekema', 'chioma@gmail.com', '08056789422', '$2y$10$YFC43TuBpYsk.PX10wRfMO6wEqzfjaewbsVZqvTYHYut0jsQqMjxK', '2021-05-25 10:54:16', '2021-05-25 10:54:16'),
(4, 'rge0pde7f', 'Egege Uche', 'egegeuche@gmail.com', '09056743211', '$2y$10$2GwXDPLu9CDYxxaOhbWilu5JzIs0N9T0U7JGVi5JhdkbWPP.n8YWu', '2021-06-01 11:19:55', '2021-06-01 11:19:55');

-- --------------------------------------------------------

--
-- Table structure for table `nin_amenities`
--

CREATE TABLE `nin_amenities` (
  `id` int(11) NOT NULL,
  `property` int(10) UNSIGNED DEFAULT NULL,
  `amenity` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nin_amenities`
--

INSERT INTO `nin_amenities` (`id`, `property`, `amenity`, `created_at`, `updated_at`) VALUES
(1, 1, 'Air Conditioning', '2021-05-27 12:17:04', '2021-05-27 12:17:04'),
(2, 1, 'Swimming Pool', '2021-05-27 12:17:04', '2021-05-27 12:17:04'),
(3, 1, 'Electricity', '2021-05-27 12:17:04', '2021-05-27 12:17:04'),
(4, 1, 'Refrigerator', '2021-05-27 12:17:04', '2021-05-27 12:17:04'),
(5, 1, 'TV Cable', '2021-05-27 12:17:04', '2021-05-27 12:17:04'),
(6, 1, 'Water Supply', '2021-05-27 12:17:04', '2021-05-27 12:17:04'),
(7, 2, 'Air Conditioning', '2021-05-27 15:51:04', '2021-05-27 15:51:04'),
(8, 2, 'Swimming Pool', '2021-05-27 15:51:04', '2021-05-27 15:51:04'),
(9, 2, 'Gym', '2021-05-27 15:51:04', '2021-05-27 15:51:04'),
(10, 2, 'Electricity', '2021-05-27 15:51:04', '2021-05-27 15:51:04'),
(11, 2, 'Refrigerator', '2021-05-27 15:51:04', '2021-05-27 15:51:04'),
(12, 2, 'TV Cable', '2021-05-27 15:51:04', '2021-05-27 15:51:04'),
(13, 2, 'Water Supply', '2021-05-27 15:51:04', '2021-05-27 15:51:04'),
(14, 4, 'Air Conditioning', '2021-05-28 10:51:22', '2021-05-28 10:51:22'),
(15, 4, 'Swimming Pool', '2021-05-28 10:51:22', '2021-05-28 10:51:22'),
(16, 4, 'Gym', '2021-05-28 10:51:22', '2021-05-28 10:51:22'),
(17, 4, 'Electricity', '2021-05-28 10:51:22', '2021-05-28 10:51:22'),
(18, 4, 'Refrigerator', '2021-05-28 10:51:22', '2021-05-28 10:51:22'),
(19, 4, 'TV Cable', '2021-05-28 10:51:22', '2021-05-28 10:51:22'),
(20, 4, 'Wifi', '2021-05-28 10:51:22', '2021-05-28 10:51:22'),
(21, 4, 'Water Supply', '2021-05-28 10:51:22', '2021-05-28 10:51:22'),
(22, 5, 'Air Conditioning', '2021-05-28 11:44:00', '2021-05-28 11:44:00'),
(23, 5, 'Electricity', '2021-05-28 11:44:00', '2021-05-28 11:44:00'),
(24, 5, 'Curtains', '2021-05-28 11:44:00', '2021-05-28 11:44:00'),
(25, 5, 'Refrigerator', '2021-05-28 11:44:00', '2021-05-28 11:44:00'),
(26, 5, 'Water Supply', '2021-05-28 11:44:00', '2021-05-28 11:44:00'),
(36, 8, 'Air Conditioning', '2021-06-01 12:56:17', '2021-06-01 12:56:17'),
(37, 8, 'Swimming Pool', '2021-06-01 12:56:17', '2021-06-01 12:56:17'),
(38, 8, 'Gym', '2021-06-01 12:56:17', '2021-06-01 12:56:17'),
(39, 8, 'Electricity', '2021-06-01 12:56:17', '2021-06-01 12:56:17'),
(40, 8, 'Curtains', '2021-06-01 12:56:17', '2021-06-01 12:56:17'),
(41, 8, 'Refrigerator', '2021-06-01 12:56:17', '2021-06-01 12:56:17'),
(42, 8, 'TV Cable', '2021-06-01 12:56:17', '2021-06-01 12:56:17'),
(43, 8, 'Wifi', '2021-06-01 12:56:17', '2021-06-01 12:56:17'),
(44, 8, 'Water Supply', '2021-06-01 12:56:17', '2021-06-01 12:56:17'),
(45, 9, 'Electricity', '2021-06-01 12:59:57', '2021-06-01 12:59:57'),
(46, 7, 'Air Conditioning', '2021-06-07 15:19:56', '2021-06-07 15:19:56'),
(47, 7, 'Swimming Pool', '2021-06-07 15:19:56', '2021-06-07 15:19:56'),
(48, 7, 'TV Cable', '2021-06-07 15:19:56', '2021-06-07 15:19:56'),
(49, 7, 'Wifi', '2021-06-07 15:19:56', '2021-06-07 15:19:56');

-- --------------------------------------------------------

--
-- Table structure for table `nin_location`
--

CREATE TABLE `nin_location` (
  `id` int(11) NOT NULL,
  `property` int(10) UNSIGNED DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nin_location`
--

INSERT INTO `nin_location` (`id`, `property`, `address`, `city`, `state`, `country`, `created_at`, `updated_at`) VALUES
(1, 1, '#65 Odumedu Nkerara Street', 'Awka', 'Anambra', 'Nigeria', '2021-05-27 12:17:03', '2021-05-27 12:17:03'),
(2, 2, '#20 Nevada Drive', 'Rumukwurushi', 'Rivers', 'Nigeria', '2021-05-27 15:51:04', '2021-05-27 15:51:04'),
(3, 3, '#kuji lands Nkwelle', 'Nkwelle', 'Anambra', 'USA', '2021-05-28 10:28:18', '2021-06-01 15:55:08'),
(4, 4, '#155 Adejumi Crescent', 'Victoria Island', 'Lagos', 'Nigeria', '2021-05-28 10:51:22', '2021-05-28 10:51:22'),
(5, 5, '#20 Nevada Drive', 'Wuse', 'Abuja', 'Nigeria', '2021-05-28 11:44:00', '2021-05-28 11:44:00'),
(6, 6, '#173 Owerri-Onitsha Express way', 'Oba', 'Anambra', 'Nigeria', '2021-06-01 11:26:15', '2021-06-01 11:26:15'),
(7, 7, '#155 Adamu Crescent', 'Enugu', 'Enugu', 'Nigeria', '2021-06-01 12:49:22', '2021-06-07 15:19:55'),
(8, 8, '#155 Adejumi Crescent', 'Owerri', 'Imo', 'Nigeria', '2021-06-01 12:56:16', '2021-06-01 12:56:16'),
(9, 9, '#20 Buhari road off NYSC camp', 'Wukari', 'Taraba', 'Nigeria', '2021-06-01 12:59:57', '2021-06-01 12:59:57'),
(10, 10, '#65 Odumedu Nkerara Street', 'Awka', 'Anambra', 'Nigeria', '2021-06-01 13:49:27', '2021-06-01 13:49:27');

-- --------------------------------------------------------

--
-- Table structure for table `nin_property`
--

CREATE TABLE `nin_property` (
  `id` int(11) NOT NULL,
  `propertyid` varchar(16) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `price` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(256) DEFAULT NULL,
  `status` varchar(256) DEFAULT NULL,
  `area` varchar(256) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nin_property`
--

INSERT INTO `nin_property` (`id`, `propertyid`, `title`, `price`, `type`, `status`, `area`, `description`, `created_at`, `updated_at`) VALUES
(1, '82343', 'Swiss House', 320000, 'Duplex', 'sale', '950', 'amenity amenity go to luren what ever amenity amenity go to luren what ever amenity amenity go to luren what ever amenity amenity go to luren what ever amenity amenity go to luren what ever amenity amenity go to luren what ever amenity amenity go to luren what ever amenity amenity go to luren what ever amenity amenity go to luren what ever amenity amenity go to luren what ever amenity amenity go to luren what ever amenity amenity go to luren what ever amenity amenity go to luren what ever amenity amenity go to luren what ever amenity amenity go to luren what ever amenity amenity go to luren what ever amenity amenity go to luren what ever amenity amenity go to luren what ever amenity amenity go to luren what ever ', '2021-05-27 12:17:03', '2021-06-01 15:43:02'),
(2, '66338', 'Swiss Home', 250000, '3-Bedroom Apartment', 'rent', '250', 'how do i describe this lovely property that has captured my heart? how do i describe this lovely property that has captured my heart?  how do i describe this lovely property that has captured my heart?  how do i describe this lovely property that has captured my heart?  how do i describe this lovely property that has captured my heart?  how do i describe this lovely property that has captured my heart? ', '2021-05-27 15:51:03', '2021-05-28 14:03:15'),
(3, '69868', 'Kuji Land', 35000000, 'land', 'sale', '4500', NULL, '2021-05-28 10:28:18', '2021-06-01 15:43:53'),
(4, '08195', 'Arabella&#039;s House', 35000000, 'Duplex', 'sale', '530sqft', 'Arabella&#039;s house is situated in the outskirt of Lagos island with a nice and friendly neighbourhood, it borthered on all sides by flowers and trees on the inside and on the outside by Atlantic ocean by the North, Mainland Bridge by the South, and Sahara desert on the East and West.\r\n Arabella&#039;s house is situated in the outskirt of Lagos island with a nice and friendly neighbourhood, it borthered on all sides by flowers and trees on the inside and on the outside by Atlantic ocean by the North, Mainland Bridge by the South, and Sahara desert on the East and West.\r\n ', '2021-05-28 10:51:21', '2021-05-28 14:03:34'),
(5, '24057', 'Queen&#039;s palace', 250000, '2-Bedroom Apartment', 'rent', '250', 'Queen&#039;s Palace is a beautiful and spacious house    Queen&#039;s Palace is a beautiful and spacious house    Queen&#039;s Palace is a beautiful and spacious house\r\nQueen&#039;s Palace is a beautiful and spacious house  Queen&#039;s Palace is a beautiful and spacious house Queen&#039;s Palace is a beautiful and spacious house', '2021-05-28 11:44:00', '2021-05-28 14:03:42'),
(6, '77547', 'Oba Lands', 45000000, 'Land', 'sale', '7200sqft', 'Oba lands is located on the outskirts of oba, close to the Niger second bridge, its proximity to the new constructed medicine market, provisions and leather materials has increased the rate at which it appreciates. ', '2021-06-01 11:26:15', '2021-06-01 11:26:15'),
(7, '76244', 'New Hello world', 350000, '2-Bedroom Apartment', 'rent', '950sqft', 'describe your propertydescribe your propertydescribe your propertydescribe your propertydescribe your property', '2021-06-01 12:49:22', '2021-06-07 15:19:55'),
(8, '17622', 'Hillscent hotel', 65000000, 'Hotel', 'sale', '986000sqft', 'describe your propertydescribe your property', '2021-06-01 12:56:16', '2021-06-01 13:25:20'),
(9, '39788', 'Wukari Lands', 450000, 'Land', 'sale', '7200sqft', 'describe your property describe your property', '2021-06-01 12:59:57', '2021-06-01 13:25:27'),
(10, '36731', 'Awka Capital City', 250000, 'land', 'sale', '23', ' style=&quot;overflow : auto; position: relative;&quot;', '2021-06-01 13:49:27', '2021-06-01 13:51:07');

-- --------------------------------------------------------

--
-- Table structure for table `nin_property_details`
--

CREATE TABLE `nin_property_details` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `property` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nin_property_details`
--

INSERT INTO `nin_property_details` (`id`, `label`, `detail`, `property`, `created_at`, `updated_at`) VALUES
(1, 'garages', '1', 1, '2021-05-27 12:17:03', '2021-05-27 12:17:03'),
(2, 'bedrooms', '4', 2, '2021-05-27 15:51:04', '2021-05-27 15:51:04'),
(3, 'compound space', '350 metres', 4, '2021-05-28 10:51:22', '2021-05-28 10:51:22'),
(4, 'sitting room', '1', 5, '2021-05-28 11:44:00', '2021-05-28 11:44:00'),
(15, 'bedrooms', '120', 8, '2021-06-01 12:56:16', '2021-06-01 12:56:16'),
(16, 'compound space', '7200 meters', 8, '2021-06-01 12:56:16', '2021-06-01 12:56:16'),
(17, 'sitting room', '40', 8, '2021-06-01 12:56:16', '2021-06-01 12:56:16'),
(18, 'bathroom', '120', 8, '2021-06-01 12:56:16', '2021-06-01 12:56:16'),
(19, 'kitchen', '12', 8, '2021-06-01 12:56:16', '2021-06-01 12:56:16'),
(20, 'balconies', '180', 8, '2021-06-01 12:56:16', '2021-06-01 12:56:16'),
(21, 'garages', '10', 8, '2021-06-01 12:56:16', '2021-06-01 12:56:16'),
(22, 'store', '3', 8, '2021-06-01 12:56:17', '2021-06-01 12:56:17'),
(23, 'basement', '1', 8, '2021-06-01 12:56:17', '2021-06-01 12:56:17'),
(24, 'year built', '2000', 8, '2021-06-01 12:56:17', '2021-06-01 12:56:17'),
(25, 'compound space', '7200 meters', 7, '2021-06-07 15:19:56', '2021-06-07 15:19:56'),
(26, 'bedrooms', '5', 7, '2021-06-07 15:19:56', '2021-06-07 15:19:56'),
(27, 'sitting room', '2', 7, '2021-06-07 15:19:56', '2021-06-07 15:19:56'),
(28, 'bathroom', '4', 7, '2021-06-07 15:19:56', '2021-06-07 15:19:56'),
(29, 'kitchen', '2', 7, '2021-06-07 15:19:56', '2021-06-07 15:19:56'),
(30, 'balconies', '2', 7, '2021-06-07 15:19:56', '2021-06-07 15:19:56'),
(31, 'guest room', '1', 7, '2021-06-07 15:19:56', '2021-06-07 15:19:56'),
(32, 'garages', '1', 7, '2021-06-07 15:19:56', '2021-06-07 15:19:56'),
(33, 'store', '1', 7, '2021-06-07 15:19:56', '2021-06-07 15:19:56'),
(34, 'year built', '2015', 7, '2021-06-07 15:19:56', '2021-06-07 15:19:56'),
(35, 'guest room', '4', 7, '2021-06-07 15:19:56', '2021-06-07 15:19:56');

-- --------------------------------------------------------

--
-- Table structure for table `nin_property_media`
--

CREATE TABLE `nin_property_media` (
  `id` int(11) NOT NULL,
  `property` int(10) UNSIGNED DEFAULT NULL,
  `media` varchar(64) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nin_property_media`
--

INSERT INTO `nin_property_media` (`id`, `property`, `media`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, '023522955384.jpg', 'image', '2021-05-27 14:14:36', '2021-05-27 14:14:36'),
(2, 1, '023522955573.jpg', 'image', '2021-05-27 14:14:36', '2021-05-27 14:14:36'),
(3, 1, '023522955604.jpg', 'image', '2021-05-27 14:14:36', '2021-05-27 14:14:36'),
(4, 1, 'Array', 'video', '2021-05-27 14:16:29', '2021-05-27 14:16:29'),
(5, 1, '023523153750.png', 'plan', '2021-05-27 14:17:53', '2021-05-27 14:17:53'),
(6, 2, '023528764831.jpg', 'image', '2021-05-27 15:51:24', '2021-05-27 15:51:24'),
(7, 2, 'Array', 'video', '2021-05-27 15:52:02', '2021-05-27 15:52:02'),
(8, 2, '023528851824.jpg', 'plan', '2021-05-27 15:52:51', '2021-05-27 15:52:51'),
(9, 4, '023597199373.jpg', 'image', '2021-05-28 10:51:59', '2021-05-28 10:51:59'),
(10, 4, 'Array', 'video', '2021-05-28 10:52:25', '2021-05-28 10:52:25'),
(11, 4, '023597280569.jpg', 'plan', '2021-05-28 10:53:20', '2021-05-28 10:53:20'),
(12, 5, '023600345805.jpg', 'image', '2021-05-28 11:44:25', '2021-05-28 11:44:25'),
(13, 5, 'Array', 'video', '2021-05-28 11:44:44', '2021-05-28 11:44:44'),
(14, 5, '023600403130.jpg', 'plan', '2021-05-28 11:45:23', '2021-05-28 11:45:23'),
(15, 6, '023945341067.jpg', 'image', '2021-06-01 11:34:21', '2021-06-01 11:34:21'),
(16, 6, 'Array', 'video', '2021-06-01 11:34:43', '2021-06-01 11:34:43'),
(17, 6, '023945385155.jpg', 'plan', '2021-06-01 11:35:05', '2021-06-01 11:35:05'),
(19, 7, '023949906424.jpg', 'video', '2021-06-01 12:50:26', '2021-06-01 12:50:26'),
(21, 8, '023950281457.jpg', 'image', '2021-06-01 12:56:41', '2021-06-01 12:56:41'),
(22, 8, '023950291166.jpg', 'video', '2021-06-01 12:56:51', '2021-06-01 12:56:51'),
(23, 8, '023950299693.jpg', 'plan', '2021-06-01 12:56:59', '2021-06-01 12:56:59'),
(24, 9, '023950495251.jpg', 'image', '2021-06-01 13:00:15', '2021-06-01 13:00:15'),
(25, 9, '023950507636.jpg', 'video', '2021-06-01 13:00:27', '2021-06-01 13:00:27'),
(26, 9, '023950520082.jpg', 'plan', '2021-06-01 13:00:40', '2021-06-01 13:00:40'),
(27, 10, '023953483994.jpg', 'image', '2021-06-01 13:50:04', '2021-06-01 13:50:04'),
(28, 10, '023953498703.jpg', 'video', '2021-06-01 13:50:18', '2021-06-01 13:50:18'),
(29, 10, '023953514020.jpg', 'plan', '2021-06-01 13:50:34', '2021-06-01 13:50:34'),
(30, 7, '024652171938.jpg', 'plan', '2021-06-09 15:54:52', '2021-06-09 15:54:52'),
(34, 7, '024652590991.jpg', 'image', '2021-06-09 16:01:51', '2021-06-09 16:01:51'),
(35, 7, '024652591019.jpg', 'image', '2021-06-09 16:01:51', '2021-06-09 16:01:51');

-- --------------------------------------------------------

--
-- Table structure for table `nin_token`
--

CREATE TABLE `nin_token` (
  `id` int(11) NOT NULL,
  `token` varchar(32) DEFAULT NULL,
  `admin` varchar(64) DEFAULT NULL,
  `phone` varchar(14) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nin_token`
--

INSERT INTO `nin_token` (`id`, `token`, `admin`, `phone`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, '2021-05-24 14:56:18', '2021-05-24 14:56:18'),
(2, 'r4zty4820', NULL, '09076543245', '2021-05-24 15:02:20', '2021-05-24 15:02:20'),
(3, 'pqi9ayc8c', '1', '09067844435', '2021-05-24 15:03:32', '2021-05-24 15:03:32'),
(4, 'uieslyf39', '1', '07045456667', '2021-05-25 10:43:05', '2021-05-25 10:43:05'),
(5, 'i5pyvtbd9', '1', '08056789422', '2021-05-25 10:53:23', '2021-05-25 10:53:23'),
(6, 'rge0pde7f', '1', '09056743211', '2021-06-01 11:19:17', '2021-06-01 11:19:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nin_admin`
--
ALTER TABLE `nin_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nin_amenities`
--
ALTER TABLE `nin_amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nin_location`
--
ALTER TABLE `nin_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nin_property`
--
ALTER TABLE `nin_property`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nin_property_details`
--
ALTER TABLE `nin_property_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nin_property_media`
--
ALTER TABLE `nin_property_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nin_token`
--
ALTER TABLE `nin_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nin_admin`
--
ALTER TABLE `nin_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nin_amenities`
--
ALTER TABLE `nin_amenities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `nin_location`
--
ALTER TABLE `nin_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `nin_property`
--
ALTER TABLE `nin_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `nin_property_details`
--
ALTER TABLE `nin_property_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `nin_property_media`
--
ALTER TABLE `nin_property_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `nin_token`
--
ALTER TABLE `nin_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
