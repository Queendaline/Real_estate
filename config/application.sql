-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2020 at 03:16 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `application`
--

-- --------------------------------------------------------

--
-- Table structure for table `zik_addresses`
--

CREATE TABLE `zik_addresses` (
  `id` int(11) NOT NULL,
  `street` varchar(126) NOT NULL,
  `city` varchar(32) NOT NULL,
  `state` varchar(24) NOT NULL,
  `country` varchar(24) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_addresses`
--

INSERT INTO `zik_addresses` (`id`, `street`, `city`, `state`, `country`, `created_at`, `updated_at`) VALUES
(1, '43751 Zboncak Villages', 'North Bransonville', 'Lambert', 'Bulgaria', '2020-09-03 15:00:02', '2020-09-03 15:00:02'),
(2, '817 Anjali Walk Suite 149', 'New Santos', 'Kassandra', 'Taiwan', '2020-09-03 15:00:02', '2020-09-03 15:00:02'),
(3, '84270 Stoltenberg Motorway Suite 270', 'Piercechester', 'Alberta', 'Belarus', '2020-09-03 15:00:02', '2020-09-03 15:00:02'),
(4, '854 Cristobal Extension', 'North Evans', 'Melvina', 'Austria', '2020-09-03 15:00:02', '2020-09-03 15:00:02'),
(5, '09057 Laila Rest', 'Michaelaburgh', 'Irma', 'Nicaragua', '2020-09-03 15:00:02', '2020-09-03 15:00:02'),
(6, '8526 Paris Mountain', 'North Kelley', 'Amie', 'Libyan Arab Jamahiriya', '2020-09-03 15:00:02', '2020-09-03 15:00:02'),
(7, '63867 Skiles Springs Apt. 573', 'Lake Jordy', 'Raheem', 'Venezuela', '2020-09-03 15:00:02', '2020-09-03 15:00:02'),
(8, '085 Audra Springs Suite 760', 'South Thaddeusborough', 'Jennyfer', 'Indonesia', '2020-09-03 15:00:02', '2020-09-03 15:00:02'),
(9, '2560 William Mall', 'Norbertfurt', 'Winona', 'Greece', '2020-09-03 15:00:02', '2020-09-03 15:00:02'),
(10, '97217 Yesenia Village', 'South Alexandra', 'Kelli', 'Sierra Leone', '2020-09-03 15:00:02', '2020-09-03 15:00:02'),
(11, '307 Brown Mission', 'West Alex', 'Enrique', 'French Guiana', '2020-09-03 15:00:03', '2020-09-03 15:00:03'),
(12, '5967 Koss Station', 'Lake Blair', 'Melissa', 'United Arab Emirates', '2020-09-03 15:00:29', '2020-09-03 15:00:29'),
(13, '968 Linnea Forest', 'Spencertown', 'Dayna', 'Morocco', '2020-09-03 15:00:29', '2020-09-03 15:00:29'),
(14, '32443 Missouri Crossing', 'Emanuelborough', 'Annamarie', 'Wallis and Futuna', '2020-09-03 15:00:29', '2020-09-03 15:00:29'),
(15, '02676 Donnelly Mills', 'Fadelfurt', 'Elfrieda', 'French Southern Territor', '2020-09-03 15:00:29', '2020-09-03 15:00:29'),
(16, '02054 Andreane Dale Suite 952', 'Davisview', 'Kacie', 'Burkina Faso', '2020-09-03 15:00:30', '2020-09-03 15:00:30'),
(17, '251 Rylee Lodge Suite 830', 'Port Katharina', 'Janiya', 'Japan', '2020-09-03 15:00:30', '2020-09-03 15:00:30'),
(18, '562 Orrin Curve', 'East Jessemouth', 'Mona', 'Tuvalu', '2020-09-03 15:00:30', '2020-09-03 15:00:30'),
(19, '4145 Turcotte Vista', 'Lamontton', 'Walton', 'Namibia', '2020-09-03 15:00:30', '2020-09-03 15:00:30'),
(20, '85156 Mathilde Terrace Suite 678', 'Jovantown', 'Alexandrine', 'El Salvador', '2020-09-03 15:00:30', '2020-09-03 15:00:30'),
(21, '22053 Eldridge Extensions', 'South Karlee', 'Carlo', 'Singapore', '2020-09-03 15:00:30', '2020-09-03 15:00:30'),
(22, '22662 Erdman Shore', 'Ferrystad', 'Charlene', 'Russian Federation', '2020-09-03 15:00:30', '2020-09-03 15:00:30'),
(23, '69969 Dell Prairie Apt. 188', 'West Carleymouth', 'Jane', 'Honduras', '2020-09-03 15:02:14', '2020-09-03 15:02:14'),
(24, '15553 Tremblay Roads Suite 939', 'New Sheldon', 'Nico', 'Albania', '2020-09-03 15:02:14', '2020-09-03 15:02:14'),
(25, '198 Chance Mount', 'Kertzmannmouth', 'Ricardo', 'Lithuania', '2020-09-03 15:02:14', '2020-09-03 15:02:14'),
(26, '235 Shany Mission Suite 810', 'Lake Jasenport', 'Meta', 'Finland', '2020-09-03 15:02:14', '2020-09-03 15:02:14'),
(27, '9671 Wiza Rue', 'West Cielo', 'Avis', 'Senegal', '2020-09-03 15:02:14', '2020-09-03 15:02:14'),
(28, '40503 Tad Stravenue', 'Kingborough', 'Karine', 'Austria', '2020-09-03 15:02:14', '2020-09-03 15:02:14'),
(29, '907 Medhurst Islands Apt. 020', 'Geraldineborough', 'Rosalinda', 'Namibia', '2020-09-03 15:02:14', '2020-09-03 15:02:14'),
(30, '2807 Laverna Terrace Suite 376', 'Emmerichborough', 'Joany', 'Suriname', '2020-09-03 15:02:15', '2020-09-03 15:02:15'),
(31, '7052 Crona Mission', 'Hauckmouth', 'Lea', 'Poland', '2020-09-03 15:02:15', '2020-09-03 15:02:15'),
(32, '414 Veronica Circle Apt. 347', 'North Kristinaberg', 'Fay', 'Barbados', '2020-09-03 15:02:15', '2020-09-03 15:02:15'),
(33, '3212 Kianna Landing Apt. 862', 'Lake Velvafort', 'Jevon', 'Slovenia', '2020-09-03 15:02:15', '2020-09-03 15:02:15');

-- --------------------------------------------------------

--
-- Table structure for table `zik_admin`
--

CREATE TABLE `zik_admin` (
  `id` int(11) NOT NULL,
  `surname` varchar(64) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `middle_name` varchar(64) NOT NULL,
  `phone_number` varchar(14) NOT NULL,
  `email_address` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_admin_activities`
--

CREATE TABLE `zik_admin_activities` (
  `id` int(11) NOT NULL,
  `admin` int(10) UNSIGNED NOT NULL,
  `activity` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_admin_roles`
--

CREATE TABLE `zik_admin_roles` (
  `id` int(11) NOT NULL,
  `admin` int(10) UNSIGNED NOT NULL,
  `role` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_amenities`
--

CREATE TABLE `zik_amenities` (
  `id` int(11) NOT NULL,
  `name` varchar(24) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_amenities_images`
--

CREATE TABLE `zik_amenities_images` (
  `id` int(11) NOT NULL,
  `amenity` int(10) UNSIGNED NOT NULL,
  `image` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_attendance`
--

CREATE TABLE `zik_attendance` (
  `id` int(11) NOT NULL,
  `staff` int(10) UNSIGNED NOT NULL,
  `remark` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_bed`
--

CREATE TABLE `zik_bed` (
  `id` int(11) NOT NULL,
  `name` varchar(16) NOT NULL,
  `size` varchar(24) NOT NULL,
  `nature` varchar(24) NOT NULL,
  `accommodate` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_booking`
--

CREATE TABLE `zik_booking` (
  `id` int(11) NOT NULL,
  `guest` int(10) UNSIGNED NOT NULL,
  `booking_no` varchar(16) NOT NULL,
  `number_of_adult` int(10) UNSIGNED NOT NULL,
  `number_of_children` int(10) UNSIGNED NOT NULL,
  `check_in` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_out` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` int(10) UNSIGNED NOT NULL,
  `payment_status` tinyint(1) UNSIGNED NOT NULL,
  `platform` varchar(24) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_booking_paid_services`
--

CREATE TABLE `zik_booking_paid_services` (
  `id` int(11) NOT NULL,
  `booking` int(10) UNSIGNED NOT NULL,
  `paid_service` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_booking_rooms`
--

CREATE TABLE `zik_booking_rooms` (
  `id` int(11) NOT NULL,
  `booking` int(10) UNSIGNED NOT NULL,
  `room` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_contacts`
--

CREATE TABLE `zik_contacts` (
  `id` int(11) NOT NULL,
  `surname` varchar(64) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `middle_name` varchar(64) NOT NULL,
  `phone_number` varchar(14) NOT NULL,
  `email_address` varchar(64) NOT NULL,
  `relationship` varchar(24) NOT NULL,
  `type` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_contact_type`
--

CREATE TABLE `zik_contact_type` (
  `id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_coupon`
--

CREATE TABLE `zik_coupon` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(32) NOT NULL,
  `start_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `code` varchar(16) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `percentage` int(10) UNSIGNED NOT NULL,
  `min_amount` int(10) UNSIGNED NOT NULL,
  `max_amount` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_coupon_limit`
--

CREATE TABLE `zik_coupon_limit` (
  `id` int(11) NOT NULL,
  `coupon` int(10) UNSIGNED NOT NULL,
  `use_limit` int(10) UNSIGNED NOT NULL,
  `use_count` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_coupon_services`
--

CREATE TABLE `zik_coupon_services` (
  `id` int(11) NOT NULL,
  `coupon` int(10) UNSIGNED NOT NULL,
  `service` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_coupon_used`
--

CREATE TABLE `zik_coupon_used` (
  `id` int(11) NOT NULL,
  `coupon` int(10) UNSIGNED NOT NULL,
  `guest` int(10) UNSIGNED NOT NULL,
  `service` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_coupon_users`
--

CREATE TABLE `zik_coupon_users` (
  `id` int(11) NOT NULL,
  `coupon` int(10) UNSIGNED NOT NULL,
  `users` varchar(16) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_departments`
--

CREATE TABLE `zik_departments` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_designation`
--

CREATE TABLE `zik_designation` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `job_description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_facilities`
--

CREATE TABLE `zik_facilities` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(24) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_floor`
--

CREATE TABLE `zik_floor` (
  `id` int(11) NOT NULL,
  `name` varchar(24) NOT NULL,
  `number` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_free_items`
--

CREATE TABLE `zik_free_items` (
  `id` int(11) NOT NULL,
  `item` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_guest`
--

CREATE TABLE `zik_guest` (
  `id` int(11) NOT NULL,
  `surname` varchar(64) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `middle_name` varchar(64) NOT NULL,
  `phone_number` varchar(14) NOT NULL,
  `email_address` varchar(64) NOT NULL,
  `address` int(10) UNSIGNED NOT NULL,
  `has_booking` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_guest`
--

INSERT INTO `zik_guest` (`id`, `surname`, `first_name`, `middle_name`, `phone_number`, `email_address`, `address`, `has_booking`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', '', 0, 0, '2020-09-03 17:51:58', '2020-09-03 17:51:58'),
(2, '', '', '', '', '', 0, 0, '2020-09-03 17:52:38', '2020-09-03 17:52:38'),
(3, 'Desmond', 'Okeke', 'Magnus', '09033884885', 'desmond@gmail.com', 0, 0, '2020-09-03 17:55:28', '2020-09-03 17:55:28'),
(4, 'Desmond', 'Okeke', 'Magnus', '09033884884', 'desmond2@gmail.com', 0, 0, '2020-09-03 18:03:49', '2020-09-03 18:03:49'),
(5, '', '', '', '', '', 0, 0, '2020-09-03 20:01:25', '2020-09-03 20:01:25'),
(6, 'Chukwu', 'Michael', 'Madu', '08035844933', 'madumike@gmail.com', 0, 0, '2020-09-04 00:06:19', '2020-09-04 00:06:19');

-- --------------------------------------------------------

--
-- Table structure for table `zik_guest_car`
--

CREATE TABLE `zik_guest_car` (
  `id` int(11) NOT NULL,
  `guest` int(10) UNSIGNED NOT NULL,
  `plate_number` varchar(16) NOT NULL,
  `name` varchar(64) NOT NULL,
  `model` varchar(16) NOT NULL,
  `color` varchar(16) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_guest_request`
--

CREATE TABLE `zik_guest_request` (
  `id` int(11) NOT NULL,
  `booking` int(10) UNSIGNED NOT NULL,
  `time_to_deliver` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `service` int(10) UNSIGNED NOT NULL,
  `special_instruction` text NOT NULL,
  `accepted` tinyint(1) UNSIGNED NOT NULL,
  `staff` int(10) UNSIGNED NOT NULL,
  `delivered` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_hall`
--

CREATE TABLE `zik_hall` (
  `id` int(11) NOT NULL,
  `number` varchar(8) NOT NULL,
  `hall_type` int(10) UNSIGNED NOT NULL,
  `floor` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_hall_booking`
--

CREATE TABLE `zik_hall_booking` (
  `id` int(11) NOT NULL,
  `guest` int(10) UNSIGNED NOT NULL,
  `booking_no` varchar(16) NOT NULL,
  `hall` int(10) UNSIGNED NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `payment_status` tinyint(1) UNSIGNED NOT NULL,
  `platform` varchar(16) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_hall_booking_paid_services`
--

CREATE TABLE `zik_hall_booking_paid_services` (
  `id` int(11) NOT NULL,
  `hall_booking` int(10) UNSIGNED NOT NULL,
  `paid_service` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_hall_house_keeper`
--

CREATE TABLE `zik_hall_house_keeper` (
  `id` int(11) NOT NULL,
  `staff` int(10) UNSIGNED NOT NULL,
  `hall` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_hall_house_state`
--

CREATE TABLE `zik_hall_house_state` (
  `id` int(11) NOT NULL,
  `hall` int(10) UNSIGNED NOT NULL,
  `house_state` int(10) UNSIGNED NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_hall_prices`
--

CREATE TABLE `zik_hall_prices` (
  `id` int(11) NOT NULL,
  `hall_type` int(10) UNSIGNED NOT NULL,
  `day` varchar(16) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_hall_special_prices`
--

CREATE TABLE `zik_hall_special_prices` (
  `id` int(11) NOT NULL,
  `hall_type` int(10) UNSIGNED NOT NULL,
  `day` varchar(16) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `special_day` varchar(24) NOT NULL,
  `description` varchar(255) NOT NULL,
  `state_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_hall_type`
--

CREATE TABLE `zik_hall_type` (
  `id` int(11) NOT NULL,
  `name` varchar(24) NOT NULL,
  `code` varchar(8) NOT NULL,
  `description` text NOT NULL,
  `capacity` int(10) UNSIGNED NOT NULL,
  `max_capacity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_hall_type_amenities`
--

CREATE TABLE `zik_hall_type_amenities` (
  `id` int(11) NOT NULL,
  `room_type` int(10) UNSIGNED NOT NULL,
  `amenity` int(10) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_hall_type_facilities`
--

CREATE TABLE `zik_hall_type_facilities` (
  `id` int(11) NOT NULL,
  `hall_type` int(10) UNSIGNED NOT NULL,
  `facility` int(10) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_hall_type_images`
--

CREATE TABLE `zik_hall_type_images` (
  `id` int(11) NOT NULL,
  `hall_type` int(10) UNSIGNED NOT NULL,
  `image` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_house_keeper`
--

CREATE TABLE `zik_house_keeper` (
  `id` int(11) NOT NULL,
  `staff` int(10) UNSIGNED NOT NULL,
  `room` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_house_state`
--

CREATE TABLE `zik_house_state` (
  `id` int(11) NOT NULL,
  `state` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_laundry_option`
--

CREATE TABLE `zik_laundry_option` (
  `id` int(11) NOT NULL,
  `laundry` int(10) UNSIGNED NOT NULL,
  `option` varchar(32) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_meal_category`
--

CREATE TABLE `zik_meal_category` (
  `id` int(11) NOT NULL,
  `meal` int(10) UNSIGNED NOT NULL,
  `category` varchar(24) NOT NULL,
  `state_at` time NOT NULL,
  `end_at` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_meal_option`
--

CREATE TABLE `zik_meal_option` (
  `id` int(11) NOT NULL,
  `meal` int(10) UNSIGNED NOT NULL,
  `option` varchar(64) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_meal_option_choices`
--

CREATE TABLE `zik_meal_option_choices` (
  `id` int(11) NOT NULL,
  `meal_option` int(10) UNSIGNED NOT NULL,
  `choice` varchar(32) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_order`
--

CREATE TABLE `zik_order` (
  `id` int(11) NOT NULL,
  `product_service` int(10) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `discount` int(10) UNSIGNED NOT NULL,
  `guest_request` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_paid_services`
--

CREATE TABLE `zik_paid_services` (
  `id` int(11) NOT NULL,
  `name` varchar(24) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_products_services`
--

CREATE TABLE `zik_products_services` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `image` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_roles`
--

CREATE TABLE `zik_roles` (
  `id` int(11) NOT NULL,
  `role` varchar(16) NOT NULL,
  `description` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_room`
--

CREATE TABLE `zik_room` (
  `id` int(11) NOT NULL,
  `number` varchar(8) NOT NULL,
  `room_type` int(10) UNSIGNED NOT NULL,
  `floor` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_room_house_keeper`
--

CREATE TABLE `zik_room_house_keeper` (
  `id` int(11) NOT NULL,
  `staff` int(10) UNSIGNED NOT NULL,
  `room` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_room_house_state`
--

CREATE TABLE `zik_room_house_state` (
  `id` int(11) NOT NULL,
  `room` int(10) UNSIGNED NOT NULL,
  `house_state` int(10) UNSIGNED NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_room_prices`
--

CREATE TABLE `zik_room_prices` (
  `id` int(11) NOT NULL,
  `room_type` int(10) UNSIGNED NOT NULL,
  `day` varchar(16) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `extra_bed_price` int(10) UNSIGNED NOT NULL,
  `extra_guest_price` int(10) UNSIGNED NOT NULL,
  `infant_bed_price` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_room_special_prices`
--

CREATE TABLE `zik_room_special_prices` (
  `id` int(11) NOT NULL,
  `room_type` int(10) UNSIGNED NOT NULL,
  `day` varchar(16) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `extra_bed_price` int(10) UNSIGNED NOT NULL,
  `extra_guest_price` int(10) UNSIGNED NOT NULL,
  `infant_bed_price` int(10) UNSIGNED NOT NULL,
  `special_day` varchar(24) NOT NULL,
  `description` varchar(255) NOT NULL,
  `state_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_room_type`
--

CREATE TABLE `zik_room_type` (
  `id` int(11) NOT NULL,
  `name` varchar(24) NOT NULL,
  `code` varchar(8) NOT NULL,
  `description` text NOT NULL,
  `number_of_adult` int(10) UNSIGNED NOT NULL,
  `number_of_children` int(10) UNSIGNED NOT NULL,
  `max_guest` int(10) UNSIGNED NOT NULL,
  `extra_bed` tinyint(1) UNSIGNED NOT NULL,
  `number_of_bed` int(10) UNSIGNED NOT NULL,
  `bed` int(10) UNSIGNED NOT NULL,
  `infant_bed` tinyint(1) UNSIGNED NOT NULL,
  `grace_period` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_room_type_facilities`
--

CREATE TABLE `zik_room_type_facilities` (
  `id` int(11) NOT NULL,
  `room_type` int(10) UNSIGNED NOT NULL,
  `facility` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_room_type_images`
--

CREATE TABLE `zik_room_type_images` (
  `id` int(11) NOT NULL,
  `room_type` int(10) UNSIGNED NOT NULL,
  `image` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_salery`
--

CREATE TABLE `zik_salery` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_services`
--

CREATE TABLE `zik_services` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `service_category` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_service_category`
--

CREATE TABLE `zik_service_category` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `category` varchar(64) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_service_images`
--

CREATE TABLE `zik_service_images` (
  `id` int(11) NOT NULL,
  `service` int(10) UNSIGNED NOT NULL,
  `image` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_staff`
--

CREATE TABLE `zik_staff` (
  `id` int(11) NOT NULL,
  `admin` int(10) UNSIGNED NOT NULL,
  `dob` date NOT NULL,
  `department` int(10) UNSIGNED NOT NULL,
  `designation` int(10) UNSIGNED NOT NULL,
  `religion` varchar(16) NOT NULL,
  `photo` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_staff_academic`
--

CREATE TABLE `zik_staff_academic` (
  `id` int(11) NOT NULL,
  `staff` int(10) UNSIGNED NOT NULL,
  `qualification` varchar(64) NOT NULL,
  `institution` varchar(128) NOT NULL,
  `start_year` year(4) NOT NULL,
  `end_year` year(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_staff_addresses`
--

CREATE TABLE `zik_staff_addresses` (
  `id` int(11) NOT NULL,
  `staff` int(10) UNSIGNED NOT NULL,
  `address` int(10) UNSIGNED NOT NULL,
  `category` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_staff_addresses`
--

INSERT INTO `zik_staff_addresses` (`id`, `staff`, `address`, `category`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'contact', '2020-09-03 15:05:34', '2020-09-03 15:05:34'),
(2, 2, 7, 'contact', '2020-09-03 15:05:34', '2020-09-03 15:05:34'),
(3, 3, 8, 'contact', '2020-09-03 15:05:34', '2020-09-03 15:05:34'),
(4, 4, 6, 'contact', '2020-09-03 15:05:34', '2020-09-03 15:05:34'),
(5, 5, 7, 'contact', '2020-09-03 15:05:35', '2020-09-03 15:05:35'),
(6, 6, 7, 'contact', '2020-09-03 15:05:35', '2020-09-03 15:05:35'),
(7, 7, 7, 'contact', '2020-09-03 15:05:35', '2020-09-03 15:05:35'),
(8, 8, 8, 'contact', '2020-09-03 15:05:35', '2020-09-03 15:05:35'),
(9, 9, 10, 'contact', '2020-09-03 15:05:35', '2020-09-03 15:05:35'),
(10, 10, 8, 'contact', '2020-09-03 15:05:35', '2020-09-03 15:05:35'),
(11, 11, 9, 'contact', '2020-09-03 15:05:35', '2020-09-03 15:05:35'),
(12, 1, 5, 'contact', '2020-09-03 15:47:51', '2020-09-03 15:47:51'),
(13, 2, 2, 'contact', '2020-09-03 15:47:51', '2020-09-03 15:47:51'),
(14, 3, 3, 'contact', '2020-09-03 15:47:51', '2020-09-03 15:47:51'),
(15, 4, 2, 'contact', '2020-09-03 15:47:51', '2020-09-03 15:47:51'),
(16, 5, 7, 'contact', '2020-09-03 15:47:51', '2020-09-03 15:47:51'),
(17, 6, 5, 'contact', '2020-09-03 15:47:51', '2020-09-03 15:47:51'),
(18, 7, 7, 'contact', '2020-09-03 15:47:51', '2020-09-03 15:47:51'),
(19, 8, 3, 'contact', '2020-09-03 15:47:51', '2020-09-03 15:47:51'),
(20, 9, 6, 'contact', '2020-09-03 15:47:52', '2020-09-03 15:47:52'),
(21, 10, 10, 'contact', '2020-09-03 15:47:52', '2020-09-03 15:47:52'),
(22, 11, 4, 'contact', '2020-09-03 15:47:52', '2020-09-03 15:47:52');

-- --------------------------------------------------------

--
-- Table structure for table `zik_staff_contacts`
--

CREATE TABLE `zik_staff_contacts` (
  `id` int(11) NOT NULL,
  `staff` int(10) UNSIGNED NOT NULL,
  `contact` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_staff_salary`
--

CREATE TABLE `zik_staff_salary` (
  `id` int(11) NOT NULL,
  `staff` int(10) UNSIGNED NOT NULL,
  `salary` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_staff_salary_history`
--

CREATE TABLE `zik_staff_salary_history` (
  `id` int(11) NOT NULL,
  `staff` int(10) UNSIGNED NOT NULL,
  `salary` int(10) UNSIGNED NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_users`
--

CREATE TABLE `zik_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `surname` varchar(64) NOT NULL,
  `middle_name` varchar(64) NOT NULL,
  `email_address` varchar(16) NOT NULL,
  `phone_number` varchar(14) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_users`
--

INSERT INTO `zik_users` (`id`, `first_name`, `surname`, `middle_name`, `email_address`, `phone_number`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Antoinette', 'Hegmann', 'Tremaine', 'iturner@weber.bi', '064-689-1438', '$2y$10$VQKfbj2mNZPKbm6lVuee8eQKxQTaYDenm7YgjO5C2Qbkic0bMcGGS', '2020-09-01 07:28:31', '2020-09-01 07:28:31'),
(2, 'Joyce', 'Pollich', 'Lenore', 'qschneider@brown', '987-463-5158x2', '$2y$10$l8ZdAZcpu9QJNzSZfXs0QutPZUlGqEsrDhma6w.nRIqh8.GEwGp2K', '2020-09-01 07:28:31', '2020-09-01 07:28:31'),
(3, 'Aidan', 'O\'Reilly', 'Turner', 'coty.deckow@hill', '855-681-8664x5', '$2y$10$nO6BnMFubkEvP0qKj9DrQeij9s9B29WjAvggIyXgRRGNp4ua30mOa', '2020-09-01 07:28:31', '2020-09-01 07:28:31'),
(4, 'Asa', 'Gutkowski', 'Keith', 'sabina01@heathco', '(687)087-5596x', '$2y$10$cfL1RGrzGAnYdd1LDklW1egxO67INZPtXdb2eull1wDA1sQ4gjuPm', '2020-09-01 07:28:31', '2020-09-01 07:28:31'),
(5, 'Katheryn', 'Gerhold', 'Kiel', 'kevon.toy@pacoch', '733-909-5345x6', '$2y$10$pFrX.MQpC5iPv.dGWl.ASejjYOUFor.9NoKcBcn6MDO.0u0HmV9Oa', '2020-09-01 07:28:32', '2020-09-01 07:28:32'),
(6, 'Alayna', 'Rutherford', 'Leland', 'lkulas@roob.com', '1-674-788-0421', '$2y$10$7QIJTj1BGmL8ULDOFQhdfujAxreZhwrOmQbq9Dq2lX1MOVaHPYsK2', '2020-09-01 07:28:32', '2020-09-01 07:28:32'),
(7, 'Kaylah', 'Boyle', 'Anabel', 'narciso97@gmail.', '1-535-885-3918', '$2y$10$v1zjwnUF9u4fxYkhuQU.0.l1xkDwlOxLGk1OUhrbUzkKG0lBzMJa6', '2020-09-01 07:28:32', '2020-09-01 07:28:32'),
(8, 'Yvonne', 'Lubowitz', 'Joana', 'nader.ollie@gmai', '1-410-110-6674', '$2y$10$2//ndyQZhFi3MXwAu0MfC.GwynMUJkrKdTahBPFi2y1WlYsFwwhCO', '2020-09-01 07:28:32', '2020-09-01 07:28:32'),
(9, 'Alf', 'D\'Amore', 'Remington', 'theodore.hansen@', '1-963-481-0383', '$2y$10$AdCbz7hmmbKUp36LH5Owme./Z2CO1io.NyB4nbLhBLlTDNuWEZkR.', '2020-09-01 07:28:32', '2020-09-01 07:28:32'),
(10, 'Axel', 'Walsh', 'Ramona', 'jose72@handhamme', '595.610.3135', '$2y$10$UzK6zl7d16tsxx8A/D45ROZ2bIshOeOsXYIvvUZ7lfysy2UwdiY7u', '2020-09-01 07:28:32', '2020-09-01 07:28:32'),
(11, 'Vern', 'Hickle', 'Julius', 'unolan@yahoo.com', '(362)165-9846x', '$2y$10$iqMDiCzYzJ.usK3dxq7cn.Cx54s2WE5ZoAjQb9wF8XhT6ouglzkF6', '2020-09-01 07:28:33', '2020-09-01 07:28:33'),
(12, 'Jarret', 'Johnson', 'Karlie', 'mikel.krajcik@ya', '1-909-235-2159', '$2y$10$xb7.8yIgXh.RtRq838.UZ.L46O3QGciDwQPP3/0cQfa94zIizxKei', '2020-09-01 07:28:33', '2020-09-01 07:28:33'),
(13, 'Ken', 'Raynor', 'Libby', 'stephany.gerhold', '08036953378', '$2y$10$R1WHa78EOOOO/zDIjVsr1eT2r3Nz7CSUvO7BALORa8p3NsIv0TbKa', '2020-09-01 07:28:33', '2020-09-01 07:28:33'),
(14, 'Claudia', 'Wunsch', 'Madilyn', 'sfeil@hotmail.co', '179.463.1403', '$2y$10$9ZN/1G6zmC4fUa05ELX/HOtlWXJF585EVGzotHLMAnVs0.gTTV7qG', '2020-09-01 07:28:33', '2020-09-01 07:28:33'),
(15, 'Ardella', 'Hane', 'Kieran', 'emilie48@gmail.c', '1-709-403-2549', '$2y$10$O.OPKBJuteBoeR9weNRSfOmjn1sQ/gOYlMUmBVtx4/cfwmbq4RD4i', '2020-09-01 07:28:33', '2020-09-01 07:28:33'),
(16, 'Emilia', 'Bernier', 'Damian', 'rschaefer@hotmai', '075-176-3115x4', '$2y$10$kQtGYqGg56IVvBoocb7TDOwtqb1nXuzbM65L.yxDb/GqQ32FEL0h.', '2020-09-01 07:28:33', '2020-09-01 07:28:33'),
(17, 'Clarissa', 'Wintheiser', 'Marcella', 'tad.casper@abern', '372.990.2712x0', '$2y$10$a37xOkVczARrob1YZVrqLOU3IvcEy6wDt2wIMyRhpQGOFHGyvKrni', '2020-09-01 07:28:33', '2020-09-01 07:28:33'),
(18, 'Raina', 'Emmerich', 'Jennyfer', 'johns.connie@hot', '1-380-741-3162', '$2y$10$EPtNlSi/gJh08vK61V3kKultQWHHOaMXd8pFC70UOrvJcb1t3dRTG', '2020-09-01 07:28:33', '2020-09-01 07:28:33'),
(19, 'Grant', 'Moore', 'Malachi', 'jamarcus56@hotma', '+72(4)82821088', '$2y$10$2MOmYPVwUleqgYwma4aMC.qSgR/e3xRgWrQw5kDXmuKuapsqXmwpm', '2020-09-01 07:28:34', '2020-09-01 07:28:34'),
(20, 'Damaris', 'Hettinger', 'Jany', 'francisca26@hotm', '1-592-981-6174', '$2y$10$a79X1pJEeTxCv2ENN5sIYe4EPPxKsK/EefVioCUKhwis3Y8ey1a9y', '2020-09-01 07:28:34', '2020-09-01 07:28:34'),
(21, 'Jennings', 'Runte', 'Efrain', 'stracke.benny@ha', '324.792.7559x7', '$2y$10$pzFmXumQ90yMNdLFM/sPMOZhob2ENF8YbSptUv7wrzkpY/VbJ4n3i', '2020-09-01 07:28:34', '2020-09-01 07:28:34'),
(22, 'Tianna', 'Welch', 'Ramon', 'green.alysha@gma', '(148)492-1127', '$2y$10$5MlPnUAG3s0k/TonLGg.nuqA8JNEl4H8C4Bs3up4NEf5wzxZruCFi', '2020-09-01 07:28:34', '2020-09-01 07:28:34'),
(23, 'Haven', 'Schmitt', 'Price', 'epaucek@connelly', '(611)018-8347', '$2y$10$Hubw2aOEOV282/AsS2mobemnIvDXtJUJkJj7Msoiu108zn7y/g9ty', '2020-09-01 07:28:34', '2020-09-01 07:28:34'),
(24, 'Rafael', 'Beer', 'Giovanni', 'lesley69@hotmail', '612.168.8760', '$2y$10$dyQSlnRIjNZ7yUs7piJGhOa8o6rrzz7dTUtmxjryTtA1hXNygPRpy', '2020-09-01 07:28:34', '2020-09-01 07:28:34'),
(25, 'Mike', 'Dickens', 'Daphney', 'daphney.kuhlman@', '1-620-525-4805', '$2y$10$QxGxUMXgMZuoaNkfB5r/t.qL/HGys5tEsbjLXQjf.zBn2jR6TeGaa', '2020-09-01 07:28:34', '2020-09-01 07:28:34'),
(26, 'Berenice', 'Raynor', 'Melvina', 'ali.kovacek@mitc', '(190)723-3745x', '$2y$10$OzCPf8BFbp4WkzXz1VvJ6ek69w.d/4BQFYbL0Mi.iH75FgCpMT5j6', '2020-09-01 07:28:35', '2020-09-01 07:28:35'),
(27, 'Christop', 'Cummings', 'Ruthe', 'colleen.block@mu', '(349)114-6733x', '$2y$10$pDeI14GcpVMMk58sC2qoSuAtMtqVwa/s5JdoEFhUEdvnFYfUOTxDC', '2020-09-01 07:28:35', '2020-09-01 07:28:35'),
(28, 'Hershel', 'Bauch', 'Erik', 'ssawayn@yahoo.co', '(775)099-7745x', '$2y$10$/avCeLV1A8sPfolly3ggL.ZCnekXZFvMBDV9HumKHeW3GEOZdDfTK', '2020-09-01 07:28:35', '2020-09-01 07:28:35'),
(29, 'Donavon', 'Blick', 'Cristobal', 'runolfsson.monte', '066-853-5821', '$2y$10$etdEBXLhMIAJQSgfeXruUOSDpooiXIEs8a6nRbfcxi0/dKBDSzuVa', '2020-09-01 07:28:35', '2020-09-01 07:28:35'),
(30, 'Paris', 'Nikolaus', 'Diana', 'barton.boehm@joh', '581.020.8104x5', '$2y$10$IeXLC/jlos5cNGufKGp03Oksrjrp/YLkM1I6CWbaBEWsW034qh6cy', '2020-09-01 07:28:35', '2020-09-01 07:28:35'),
(31, 'Sebastian', 'Koelpin', 'Jeramy', 'rfarrell@casperf', '1-801-881-5880', '$2y$10$zwAYcyEQan7A5rOyhRdxSuWYaSjO6vuBHotp8FSZ6qO2SS05909KK', '2020-09-01 07:28:35', '2020-09-01 07:28:35'),
(32, 'Iva', 'Ortiz', 'Brooks', 'ulemke@yahoo.com', '1-757-207-6429', '$2y$10$JmKHFebc7YYpTfMWwGj20OEvTMRdZ2pviPUo9o7KT0..UdwXR9R/C', '2020-09-01 07:29:05', '2020-09-01 07:29:05'),
(33, 'Jedidiah', 'Blick', 'Braeden', 'zpacocha@gmail.c', '295.416.2706x1', '$2y$10$.2UVkVJ6bDi/UVwNehePCOjJi53XweVRLrEAt/nzwnguNxL.Rfu0m', '2020-09-01 07:29:05', '2020-09-01 07:29:05'),
(34, 'Dell', 'Hammes', 'Princess', 'coty.kassulke@gm', '(967)231-8600x', '$2y$10$lX6k92UtWdrT1apAkqkwj.BQEge8aYy2uHBQIdLS6zasphygvVpim', '2020-09-01 07:29:05', '2020-09-01 07:29:05'),
(35, 'Anastasia', 'Monahan', 'Nicola', 'predovic.camila@', '460.610.6873x0', '$2y$10$JbPgSGXodgYHXPOIsK.mXOIXZb1FVtVump0vIvW6YGxJXN6uDUmsG', '2020-09-01 07:29:06', '2020-09-01 07:29:06'),
(36, 'Sam', 'Nitzsche', 'Nathen', 'antone.beier@gma', '475.055.7675x1', '$2y$10$0fDeQGGAf3RTO0ZnP5eiJuHFu6SFEdPM0pgB0KhP5XCOyOZPMhsAG', '2020-09-01 07:29:06', '2020-09-01 07:29:06'),
(37, 'Cullen', 'Buckridge', 'Tad', 'leslie.mertz@gma', '+79(9)17013275', '$2y$10$CO0NO7b8OUZm1p2uUPDADeeR15BWMbZFRkSQ6MtdFWh9X0c2PqbQC', '2020-09-01 07:29:06', '2020-09-01 07:29:06'),
(38, 'Kelton', 'Smitham', 'Madie', 'jeremy.stokes@ya', '1-226-611-4896', '$2y$10$b/78XFmXMd6WRiK61nN.meHVDSBmXGAGRZ5EUrnsznNOZ8G77rGVe', '2020-09-01 07:29:06', '2020-09-01 07:29:06'),
(39, 'Ralph', 'Treutel', 'Kira', 'hellen93@yahoo.c', '1-797-133-3958', '$2y$10$xz9JB4l7Eth4M8RqVuahLuGIaSUji/aTKjwG6gin5xnuilq8yaRpm', '2020-09-01 07:29:06', '2020-09-01 07:29:06'),
(40, 'Jazmyne', 'Lehner', 'Tom', 'schultz.jaclyn@r', '(291)834-6647x', '$2y$10$EKsYmymojEznTiF4906eLOVCDH42KICDN1/d4Zpwc0Nor8BD3B496', '2020-09-01 07:29:06', '2020-09-01 07:29:06'),
(41, 'Kamren', 'Bauch', 'Deon', 'gustave.will@yah', '624.454.2677', '$2y$10$86XtVdJtmQ2SFcHfg17mnureNHtZcMWnGC0BAwB9JvpN139BM9wy6', '2020-09-01 07:29:06', '2020-09-01 07:29:06'),
(42, 'Irma', 'Roob', 'Fern', 'zita94@rogahndou', '734.015.2767x6', '$2y$10$MwezC.9Ks7eKiL0pWg3MNOhvuY7Y8FQwDw3F1W9xM6n4cWdKfEwhu', '2020-09-01 07:29:07', '2020-09-01 07:29:07'),
(43, 'Kayley', 'Lindgren', 'Jazlyn', 'owyman@johnson.b', '09989631363', '$2y$10$VHZtNgiZ64/kQjid/XnVq.3kC9jQBIrqdSZuHLkSjSKUNSnw5Xo.S', '2020-09-01 07:29:07', '2020-09-01 07:29:07'),
(44, 'Khalil', 'Kuhic', 'Floy', 'tgreen@emard.org', '319-159-5072x6', '$2y$10$ELc/DA5pxAVDHvOD6hLUWO7mCf8sdxFIKAvwkXMbJ2dqXuzUGYo3y', '2020-09-01 07:29:07', '2020-09-01 07:29:07'),
(45, 'Patience', 'Welch', 'Arnold', 'jgusikowski@ward', '1-900-838-9227', '$2y$10$yd.WFx0ULZCd7MIwdJ/wmeb9Glwno9bJZJFIOqqxgK5wY6GS0SYVG', '2020-09-01 07:29:07', '2020-09-01 07:29:07'),
(46, 'Ardella', 'Cassin', 'Everardo', 'dabernathy@caspe', '(020)440-0868x', '$2y$10$CgszVB9hzDbTaa5DSpEyBuVc9.W2PPnAU8Q7q6U/Itxfe4YcjdnPW', '2020-09-01 07:29:07', '2020-09-01 07:29:07'),
(47, 'Rose', 'Christiansen', 'Jaquan', 'hagenes.maegan@w', '1-652-784-8929', '$2y$10$ynpbnAZ1AERJ2.iIZJKoS.YjZHF9kLhpD1wEZPAVTy3B1FPwPv20G', '2020-09-01 07:29:07', '2020-09-01 07:29:07'),
(48, 'Seamus', 'Spinka', 'Rigoberto', 'demard@kohler.co', '06994038726', '$2y$10$kK69c1ut5BqMXglyy7WOGuoSsVbQFVZE.SXTVAs2aXoD1l5HCeY6.', '2020-09-01 07:29:07', '2020-09-01 07:29:07'),
(49, 'Lisette', 'Hettinger', 'Daisy', 'ywalter@hotmail.', '083-853-2649', '$2y$10$6iNnpFVxhoG9LYFRrWIXoOaQuxn1B2r3BfVNSFoiFutXadQ0Jzv22', '2020-09-01 07:29:08', '2020-09-01 07:29:08'),
(50, 'Cheyenne', 'Fay', 'Irwin', 'pwilliamson@yaho', '+35(4)57653727', '$2y$10$/q2RZ5PSijDk3kqxqOdRnOQ77lTGQLW0aepSwCVBmtn6hC9kfqcS2', '2020-09-01 07:29:08', '2020-09-01 07:29:08'),
(51, 'Willa', 'Kohler', 'Aaron', 'stamm.brielle@ya', '(990)933-1053', '$2y$10$FE/0zd/oKSHlnfbdaPrcoeG3ceRsw7lAxqBCdiWdqEs.AXTWKzLrm', '2020-09-01 07:29:08', '2020-09-01 07:29:08'),
(52, 'Reina', 'Beier', 'Callie', 'jkassulke@hacket', '02383218160', '$2y$10$//Iaur2mq9pe.U6MBJUpE.o.f3p8YfjrMYJie121VxbKv3KF0cO5y', '2020-09-01 07:29:08', '2020-09-01 07:29:08'),
(53, 'Pat', 'Collins', 'Kelvin', 'jbechtelar@hotma', '002-700-4071x1', '$2y$10$LOHs2IOh6V/S3yhPsaaS9.nlqkTRxxIulbS1wW6dRyaK1.Bi3D5J2', '2020-09-01 07:29:08', '2020-09-01 07:29:08'),
(54, 'Hortense', 'McCullough', 'Alfredo', 'lstreich@gmail.c', '734.428.3570x8', '$2y$10$PflH70qfNXIMmi8XwofoD.aENbv8P34JysM2mDakg/SBKfDPb7LKq', '2020-09-01 07:29:08', '2020-09-01 07:29:08'),
(55, 'Lavada', 'Cormier', 'Melissa', 'bosco.sierra@yah', '08140529237', '$2y$10$621SA7GR4DmkL8aDg6pzruwpioj5V9eCOZFBT2Gsg4cn9lhM.atMG', '2020-09-01 07:29:09', '2020-09-01 07:29:09'),
(56, 'Johnny', 'Armstrong', 'Domenick', 'emerson.reichert', '00581104798', '$2y$10$IY7VdmSnwmGH7ssB3EiYh.EHUYCBkdgmQaAe0Pr8dx2.wkbMf9DhC', '2020-09-01 07:29:09', '2020-09-01 07:29:09'),
(57, 'Garret', 'Maggio', 'Rossie', 'elenor.dicki@gma', '362.411.8266', '$2y$10$TicBXtlyyGTSSC3s1lbBQuaBXCrlkxWJbBSNTH3HBoHOhYyO.J5s.', '2020-09-01 07:29:09', '2020-09-01 07:29:09'),
(58, 'Andrew', 'Welch', 'Shania', 'marie45@hotmail.', '717-575-1241x3', '$2y$10$0bZ5c.MMnb9ZYpWWbJ/HPelo..nWCDqZnU.I21neIE7a09JlWlGeW', '2020-09-01 07:29:09', '2020-09-01 07:29:09'),
(59, 'Edmund', 'Jerde', 'Harold', 'lueilwitz.genera', '(449)367-3620x', '$2y$10$K4V8OILgdkiFESmJ/LfjbuZaLlf86HH/uOfGF0ETqda4leFdCSDi.', '2020-09-01 07:29:09', '2020-09-01 07:29:09'),
(60, 'Kianna', 'Deckow', 'Emmitt', 'vesta05@yahoo.co', '06074434318', '$2y$10$XD8zV9D/jcf16bdR6WQEv.mBm2Io515IQChpMVpjxiWDc6G4QutfS', '2020-09-01 07:29:09', '2020-09-01 07:29:09'),
(61, 'Cleta', 'Langosh', 'Jamir', 'wilburn78@gmail.', '1-823-648-0260', '$2y$10$129od25euLxyPK5q1kqhFeiQSgbeIGIHKNm1LZJzHtS8duoUhtsn.', '2020-09-01 07:29:10', '2020-09-01 07:29:10'),
(62, 'Amari', 'Kovacek', 'Dusty', 'rogahn.kariane@g', '(904)145-2002x', '$2y$10$Jws0TRcjpFto4MnOaCmk..Z6uIUHSoMBqSnHsvo4SNsjjRsdtcVL2', '2020-09-01 07:29:10', '2020-09-01 07:29:10'),
(63, 'Adolf', 'Christiansen', 'Alia', 'jaylen.schumm@gm', '1-761-327-9261', '$2y$10$/.NxqSnsK5t.Gx49yaGxJ.quXv2ry5r/CPBej8rKmusYI3fZ5/7U.', '2020-09-01 07:30:18', '2020-09-01 07:30:18'),
(64, 'Kaitlyn', 'Ebert', 'Orland', 'naomie19@lednero', '1-745-242-2552', '$2y$10$zjvUhYtsY9P/GQnyjW9Kru5wZzpymBuLsZfzBvjSKJIV16ifU05aS', '2020-09-01 07:30:18', '2020-09-01 07:30:18'),
(65, 'Jane', 'Fisher', 'Yasmin', 'frances57@kutchf', '1-405-712-4063', '$2y$10$NgBJ5zbHOAMgvLrTD1/oQe92EyG4/ia5u8.VgPSPxL39svjtIavpW', '2020-09-01 07:30:18', '2020-09-01 07:30:18'),
(66, 'Carlotta', 'Roob', 'Wellington', 'clementine.pouro', '1-828-978-5458', '$2y$10$WFoEMDsYSpAz.vKQWOi8LurF2OFBJJmvcu9l4ZQ8dOCNYgFjiSyPi', '2020-09-01 07:30:18', '2020-09-01 07:30:18'),
(67, 'Malvina', 'Gaylord', 'Elyse', 'alice.moen@gmail', '(204)876-3724', '$2y$10$NY/ToaURSlpwWU9hgAoPau9R6uED5C0Ak7UiO7ar791m9IXjHFaty', '2020-09-01 07:30:18', '2020-09-01 07:30:18'),
(68, 'Adam', 'Denesik', 'Rick', 'lbergstrom@thiel', '442-350-0837', '$2y$10$kwyukwXk1/nevPp7s.r8auXyt7QadfBaMMUeH.G52mZCyIEF3bpw.', '2020-09-01 07:30:18', '2020-09-01 07:30:18'),
(69, 'Parker', 'Johnson', 'Emmalee', 'kennedi62@gmail.', '(249)047-1565', '$2y$10$Eb1SC3rttaIrjKxbUYfx2OE2Zu8PirW1S5JdAJx43mBgO7qZSo/72', '2020-09-01 07:30:19', '2020-09-01 07:30:19'),
(70, 'Emmanuel', 'Gorczany', 'Darryl', 'jenkins.otha@hot', '852.406.4795x4', '$2y$10$7XO08VhWATYGD0JT3.5ti.8qALcJjl9QfYTw8bnMA6UeM.Fs9Nwa6', '2020-09-01 07:30:19', '2020-09-01 07:30:19'),
(71, 'Angel', 'Stokes', 'Dejuan', 'ftillman@yahoo.c', '854.735.8267x9', '$2y$10$pg8JEnl8JnVU7x/NJdFoPO7qVMUqyC4QRZYtNQ10MItlfAtOTwEMC', '2020-09-01 07:30:19', '2020-09-01 07:30:19'),
(72, 'Brenna', 'Batz', 'Ashtyn', 'bernardo82@crook', '1-813-333-9473', '$2y$10$VKT1FzicAQ1/5f0Mo/DeQ.ZjowiJFOdPvLQPG4AgmlMwDD29ZtxAW', '2020-09-01 07:30:19', '2020-09-01 07:30:19'),
(73, 'Doug', 'Harvey', 'Newell', 'jaylen.kertzmann', '785.635.6739x3', '$2y$10$zzhKsLn90HM6sBJ/XkuIp.L5f755ct6MNvNiFoRWBOlsTfI3/tQOi', '2020-09-01 07:30:19', '2020-09-01 07:30:19'),
(74, 'Francisco', 'McCullough', 'Jonathon', 'blanca.runte@bar', '+44(2)16847514', '$2y$10$hF3V4m6GeG9xq1hhLLw3YuGvxNbn8IHQkiRRK93tLGCQWGxvfA/3C', '2020-09-01 07:30:19', '2020-09-01 07:30:19'),
(75, 'Elda', 'Botsford', 'Grant', 'kmclaughlin@wuns', '230.756.4245x5', '$2y$10$JjF2ql4T5.B9HTAasR/rseIHh/3IziTTtWbjsotS9ZRjcVGbmdX7i', '2020-09-01 07:30:20', '2020-09-01 07:30:20'),
(76, 'Domenic', 'Shields', 'Trystan', 'leonora21@schimm', '448-691-0017', '$2y$10$M9madNvkjipwkJDe05tpPuhHn5Zs0KmI6m58bEdVVGtWzE3y.IPk6', '2020-09-01 07:30:20', '2020-09-01 07:30:20'),
(77, 'Trystan', 'Conroy', 'Mac', 'arturo25@leannon', '455-434-4269', '$2y$10$PoJJwWZUOXS/S/KIPfj8Oe8bhOjgBVGtDpOu3nZnQfMrOk0A8idky', '2020-09-01 07:30:20', '2020-09-01 07:30:20'),
(78, 'Laurel', 'Deckow', 'Emilio', 'dayana.sipes@yah', '427.433.0217', '$2y$10$qSxX7K4H8HkPEAWTaB5fU.RABoJA01FSeyCjb3Dqj/a6Lilot0p.2', '2020-09-01 07:30:20', '2020-09-01 07:30:20'),
(79, 'Arlie', 'Stanton', 'Jeanie', 'jkonopelski@sanf', '01832860463', '$2y$10$7fr6TQzmDkknJl7d7zka2uHK5U8afVtzNzS0zSRjO/TuFwIPyyt4y', '2020-09-01 07:30:20', '2020-09-01 07:30:20'),
(80, 'Johnpaul', 'Ratke', 'Madaline', 'burley27@schambe', '822-505-0706x3', '$2y$10$4wtkEyIdJ6xu1gb7EomknORi39GXyOj.Tu7vnqMGeW6USo5eKpGNO', '2020-09-01 07:30:20', '2020-09-01 07:30:20'),
(81, 'Jessyca', 'Corkery', 'Remington', 'rohan.lola@hotma', '1-221-057-5990', '$2y$10$z5cmr7zoRNml2qDpUqjxI.x8wu.W9wp7dehWNwD1qtPZD3Q1bpY9W', '2020-09-01 07:30:20', '2020-09-01 07:30:20'),
(82, 'Jacey', 'Cummings', 'Raymundo', 'dorcas.carroll@n', '611-317-2111', '$2y$10$SJY72666042Y3IcY21ke0.hX/WuWdO2SQ5kEkvNG.8X7PyHJ5Tb1m', '2020-09-01 07:30:21', '2020-09-01 07:30:21'),
(83, 'Kaia', 'Schmeler', 'Lillian', 'klocko.cortez@sh', '(634)332-7155', '$2y$10$FedLJ/jjJBNh29tU7S1Kt.uKIs04UUCraHisF9/uPhm2Uohi4N9/.', '2020-09-01 07:30:21', '2020-09-01 07:30:21'),
(84, 'Yasmine', 'Fritsch', 'Lupe', 'cwiegand@hotmail', '269.890.2579x2', '$2y$10$KfSUlaEe.m1c202bsRF2xevPr4EZGxst2yextzik5oV1Wte8IZ6le', '2020-09-01 07:30:21', '2020-09-01 07:30:21'),
(85, 'Mollie', 'Ziemann', 'Savanna', 'rosanna.weimann@', '1-936-403-7206', '$2y$10$Uy2cUSVMl9jlZSAZtcWnWO11lVMdEW1KSGZi49aTc/wESDXa5xIru', '2020-09-01 07:30:21', '2020-09-01 07:30:21'),
(86, 'Clovis', 'Goodwin', 'Dejah', 'bogisich.jerrell', '350-974-8727x8', '$2y$10$8nwHCM/EcaAmzRvBwSvqu.KDM96B/Boi9BZuq7y9dS/1tlU5BaSiu', '2020-09-01 07:30:21', '2020-09-01 07:30:21'),
(87, 'Golda', 'Huel', 'Lavon', 'ubaldo.grady@bra', '+54(6)11928137', '$2y$10$kT613mJ8YkhRaORrIB/vm.cnI17o0lTYmi8Q/B6ma/QwU.VyHesFa', '2020-09-01 07:30:21', '2020-09-01 07:30:21'),
(88, 'Jettie', 'Treutel', 'Buddy', 'jovani.pacocha@y', '(887)909-5894x', '$2y$10$NWyontMQk1OUJFlVnjPL.u.qh2BCiMqSd1mxRdWWRlEOKV.VGFr5m', '2020-09-01 07:30:21', '2020-09-01 07:30:21'),
(89, 'Herman', 'Doyle', 'Florian', 'jovanny.berge@ya', '252.789.6191x9', '$2y$10$2Az2sRUgyJchXwj1d47u3ezQc3uo3IGWevcd6JL1fH8Ovfb6bxlIy', '2020-09-01 07:30:22', '2020-09-01 07:30:22'),
(90, 'Ashlynn', 'Yost', 'Kailyn', 'sage.padberg@kli', '943-888-4928', '$2y$10$HSi80jm2Ima6LQOFJuCW/eps.vjN32FB5Po.RE044ORVZrBCcThnK', '2020-09-01 07:30:22', '2020-09-01 07:30:22'),
(91, 'Henry', 'Mitchell', 'Jimmy', 'missouri41@hotma', '128-850-5528x2', '$2y$10$NTKr15TUAX3MRRU/xnbQJeAe1cUUUF8YUd3USJ9VeLFH3fz5MCtFy', '2020-09-01 07:30:22', '2020-09-01 07:30:22'),
(92, 'Phoebe', 'Kunde', 'Meagan', 'ibrahim.lesch@st', '939-475-7531', '$2y$10$zlC3EZ1KdzoE8UNuwsY89eIOR8B/IBgaufncBMBfbC/cPlW0.WuKq', '2020-09-01 07:30:22', '2020-09-01 07:30:22'),
(93, 'Felicity', 'Welch', 'Johnny', 'sterling41@hotma', '561.039.7041x3', '$2y$10$5Vsk71BvE3APdA8z10xL2OsIt2kje7MvGvpnL1Qc7ZT5xNFBcrp56', '2020-09-01 07:30:22', '2020-09-01 07:30:22'),
(94, 'Steve', 'Labadie', 'Patsy', 'kfeeney@walsh.co', '+71(4)24432977', '$2y$10$RCUhz49em3HuRTOgo9pUiupFmxDLQeY9ak1A3eI8EfKFnFmrPJYOa', '2020-09-01 07:31:27', '2020-09-01 07:31:27'),
(95, 'Cleta', 'Gottlieb', 'Kianna', 'feest.floyd@jaco', '(027)814-4531x', '$2y$10$DwS5LdhOmyV6TiSrfAuN1e6cnuLz3r.A5tXZhESRmJUPGtWoEs5Wm', '2020-09-01 07:31:27', '2020-09-01 07:31:27'),
(96, 'Wade', 'Beahan', 'Kyle', 'doyle.odie@rolfs', '418.225.2679x3', '$2y$10$4yOpfqMfUfOsCtdLvrlgGO/tMaIX6vC31uur9KTZliPZpb3KuJQ/O', '2020-09-01 07:31:27', '2020-09-01 07:31:27'),
(97, 'Rachael', 'Feest', 'Corene', 'jennyfer92@hotma', '1-521-822-9037', '$2y$10$TIWu/IjiugymdRD/VAc4Q.BQf4scBEO0Vcw7lTXn6ZXckujfNH7nG', '2020-09-01 07:31:28', '2020-09-01 07:31:28'),
(98, 'Meagan', 'Wintheiser', 'Estevan', 'lyda.jacobs@paco', '03307898078', '$2y$10$qkE4EiTF7ZcO7vL7zvx8yufnFmQ3zyR8f9abk6eS1j1CTzOTaBxxa', '2020-09-01 07:31:28', '2020-09-01 07:31:28'),
(99, 'Francisca', 'Schaden', 'Royal', 'hubert.adams@dur', '301-855-1309', '$2y$10$0r26y6LF3ys.VZyNRWv0JOIgwEjxgtYhxKDw/UgoYdD9fQdhPQ4Xu', '2020-09-01 07:31:28', '2020-09-01 07:31:28'),
(100, 'Carley', 'Mante', 'Gwen', 'lelah25@gmail.co', '+22(9)39774421', '$2y$10$QkzSsk80p4AICUiptHv.3eS7HeuEvOnWE7LVQkf6qZzYVibbNLcXu', '2020-09-01 07:31:28', '2020-09-01 07:31:28'),
(101, 'Hermina', 'Conn', 'Ruth', 'muller.raleigh@t', '392-325-4829x2', '$2y$10$S8.TObeBBr08CFj/jXDvcewA6fCkIToNKqgw9TM6LThzLM9b4aXiG', '2020-09-01 07:31:28', '2020-09-01 07:31:28'),
(102, 'Casimir', 'VonRueden', 'Salvatore', 'ucrist@marquardt', '997.957.9723x3', '$2y$10$SLhPcFuGeZTgnrPexifkiug5uFGd2EXNb1tR7ZY0o6tNwrpWsJoR6', '2020-09-01 07:31:28', '2020-09-01 07:31:28'),
(103, 'Wilson', 'Collins', 'Ed', 'whowe@yahoo.com', '964-992-3409', '$2y$10$2iq1ltA/LHIHt80KyCX6DOCKOnXc1cfTCKT87TqnnRBz6X8t97zPu', '2020-09-01 07:31:28', '2020-09-01 07:31:28'),
(104, 'Marlin', 'Gutkowski', 'Devante', 'debert@yahoo.com', '07565180237', '$2y$10$TjlEzU4qIJyUE763RpTGe.9a8gFJZW.Y1giLjHCj4mJImewegKSG2', '2020-09-01 07:31:29', '2020-09-01 07:31:29'),
(105, 'Beatrice', 'Grady', 'Viva', 'dlebsack@grady.c', '(425)326-1748', '$2y$10$TzXFkFlBiQQjstyr4G/CXOVjku1jQ/WxDKYZ01Wnycoqyp/QIqDHu', '2020-09-01 07:31:29', '2020-09-01 07:31:29'),
(106, 'Wilford', 'Witting', 'Haylee', 'chauncey.mcglynn', '07828517568', '$2y$10$05VAz0FgDZX9B6wahER62.7G2YNoabQHaWTtDCCcIh6u9VY9DH.0W', '2020-09-01 07:31:29', '2020-09-01 07:31:29'),
(107, 'Aniyah', 'Waters', 'Percy', 'janie.miller@how', '859.887.9649x3', '$2y$10$o0hOGj5LEZKUxuxY1b3puePzP0RIbZZRspkcEDrwLUFDesQC94jIe', '2020-09-01 07:31:29', '2020-09-01 07:31:29'),
(108, 'Micheal', 'Hamill', 'Nicholaus', 'ignatius.reynold', '1-360-085-2300', '$2y$10$Y0RZJ63ZbTxs1zvnkWqHrOU.HZNIvaVEQnmXTPAhYaSEsB5CONjTS', '2020-09-01 07:31:29', '2020-09-01 07:31:29'),
(109, 'Tessie', 'Mueller', 'Candida', 'brook36@hotmail.', '1-590-175-7697', '$2y$10$BZfvUxA3Wsli1le9Y51Ohuwps1pMBAJ2GcSwIKCrWKQOgLk48eh..', '2020-09-01 07:31:29', '2020-09-01 07:31:29'),
(110, 'Kenyatta', 'Dooley', 'Paolo', 'morar.whitney@ch', '717.952.2252', '$2y$10$4Vhq0eXVa.ieY4GgRCm1Tu3O3XAkjTyEsIDQEQq7i/Kp.G/9ndkMi', '2020-09-01 07:31:30', '2020-09-01 07:31:30'),
(111, 'Jarrod', 'Ankunding', 'Heaven', 'hauck.brenda@hes', '552.502.2036x9', '$2y$10$RmIr4FFNupAJf.0uFyIau.tOQtuK7/6YPlcaUVSbRVLEXup5nseCa', '2020-09-01 07:31:30', '2020-09-01 07:31:30'),
(112, 'Carmen', 'Balistreri', 'Elmore', 'wehner.arnoldo@d', '410.064.6146', '$2y$10$Kr7GzEginj29S.ZDBQHYFuYgOyVL3SL6ho1hUWfML7G9RXXhr6UkW', '2020-09-01 07:31:30', '2020-09-01 07:31:30'),
(113, 'Rowland', 'Hickle', 'Mara', 'richmond.rogahn@', '114.242.2368', '$2y$10$xQPR8FhnOK5x9tS2M1j56u6xUVxypVfmsICEmch560/CVjCNzK9hi', '2020-09-01 07:31:31', '2020-09-01 07:31:31'),
(114, 'Kyra', 'Wehner', 'Andy', 'wauer@robelhomen', '(518)186-7907x', '$2y$10$gPWuozM/mpgbT0ciWs.lgewIxfy41p7gxKteazHTsxRGBZS6Eg78q', '2020-09-01 07:31:31', '2020-09-01 07:31:31'),
(115, 'Katheryn', 'Lesch', 'Vergie', 'minerva.hickle@w', '085-435-3957', '$2y$10$ZXxn08N4hO0iaj6Ivd9.TuUXzO6L8g5JRYCOz/jLYmJHrjke7k.Yu', '2020-09-01 07:31:31', '2020-09-01 07:31:31'),
(116, 'Antone', 'O\'Connell', 'Abigail', 'rschuppe@gmail.c', '236.523.2562', '$2y$10$p.CGvBlq8myLAbVISeGE2uECIlQADnuEdUiC40hhamiYL5sj0B5MG', '2020-09-01 07:31:31', '2020-09-01 07:31:31'),
(117, 'Keyon', 'Hoeger', 'Dasia', 'bschoen@volkman.', '(052)971-8316x', '$2y$10$ObrcnEW/PY9cIU3UfjWhGOxzTiOd6ILaKWyazK/jQls26vMWpZfCW', '2020-09-01 07:31:31', '2020-09-01 07:31:31'),
(118, 'Mireya', 'Hammes', 'Flossie', 'estreich@kreiger', '343-143-6662', '$2y$10$7asz0vXOV6fZrc2ZWqWsPOS6kCXq1pYvmyY3UsZZQqX8UwWSjesDG', '2020-09-01 07:31:32', '2020-09-01 07:31:32'),
(119, 'Carey', 'Gaylord', 'Ardith', 'domenick.greenfe', '+09(8)64987783', '$2y$10$kbIDB9FmdD4i221P2ySkPe8ef4hXGFkJkLVxD9hvgxYIW6vQnwK2C', '2020-09-01 07:31:32', '2020-09-01 07:31:32'),
(120, 'Selena', 'Bartell', 'Maximillia', 'buddy.lebsack@gm', '1-977-653-8172', '$2y$10$yiDPyAO/WzqYKHD4ua9bi.gDxaGSabyebp0Xb28yw7LwBghJT9fy2', '2020-09-01 07:31:32', '2020-09-01 07:31:32'),
(121, 'Annamae', 'Farrell', 'Randal', 'mterry@gerlachcr', '289.679.5958x0', '$2y$10$hRBuFulokDdXtLzZC6Gs9uL0SeraSbmyHof2aLPHDejPH.vu7fj3.', '2020-09-01 07:31:32', '2020-09-01 07:31:32'),
(122, 'Lysanne', 'Gorczany', 'Kellie', 'leonardo.wilderm', '06441593958', '$2y$10$O7lW5ZiOEDpFObVi2QWrvuRCAe8wd6/K63wSlONcjPpF/27k66wRe', '2020-09-01 07:31:32', '2020-09-01 07:31:32'),
(123, 'Kristofer', 'Goyette', 'Tyree', 'labadie.rex@flat', '1-368-440-6022', '$2y$10$q2GOdEGOLmKDsVtHWW4YIeARs1RW4JWVWu9WjOv2RwQdCqk4eh4M.', '2020-09-01 07:31:32', '2020-09-01 07:31:32'),
(124, 'Deion', 'Beer', 'Virgie', 'glakin@gmail.com', '(507)092-2299x', '$2y$10$HBbhDmvai9gkNf0X.AVq7.lLPc3.v3/No9p7nxuvVC6dU90M6Fy8S', '2020-09-01 07:31:32', '2020-09-01 07:31:32'),
(125, 'Tyrel', 'Anderson', 'Myrtle', 'mbeer@hayes.info', '089.083.3786', '$2y$10$bpCsMdaMuEVuFBl9amece.HZwtDOdFP6/0V.EcuCYX11B1sgH4NYq', '2020-09-01 07:32:15', '2020-09-01 07:32:15'),
(126, 'Michale', 'Nienow', 'Zion', 'schultz.art@hell', '(005)513-2710x', '$2y$10$YKqpz3oeZfmc3nFiSVyP0u24dfskMG.p18/hWxg5sviBIg0Dz1ruS', '2020-09-01 07:32:15', '2020-09-01 07:32:15'),
(127, 'Esmeralda', 'Kuvalis', 'Carli', 'kimberly.hammes@', '989-556-2018x4', '$2y$10$KhEYsKkSRqiiYMKKRbziJuudLdAH69ZHPIB8Y9PAImwOX.e9kSd.K', '2020-09-01 07:32:15', '2020-09-01 07:32:15'),
(128, 'Helena', 'Gerhold', 'Tabitha', 'polly81@walshlub', '849-836-9437x9', '$2y$10$iM8NkP5DoR2NXE6Xn7Hmo.yWLrIpt4MYIRGpBSOTNCHAuZmLvnybC', '2020-09-01 07:32:15', '2020-09-01 07:32:15'),
(129, 'Lucious', 'Gaylord', 'Dannie', 'cathy99@hotmail.', '239-554-7952x6', '$2y$10$ABQhEBn3zavJogrUdLH5feoqDdrcb7Dy76Ar.8kmi3Iv8GmT/QRhi', '2020-09-01 07:32:50', '2020-09-01 07:32:50'),
(130, 'Lizeth', 'Johnston', 'Wyman', 'aisha29@yahoo.co', '1-049-580-0327', '$2y$10$M1Byd3aX1sdB808l8cgz9.KUCc0YxYuqVMyJdvYiaTpU5q/Wk2YlS', '2020-09-01 07:32:50', '2020-09-01 07:32:50'),
(131, 'Chandler', 'Huel', 'Anais', 'lavina96@hotmail', '09769167623', '$2y$10$8bGZJn2lBhMp8yDxAP0lyeVgNQUbI3n/p7fQuBF.gcyo1DgJnhIQa', '2020-09-01 07:32:50', '2020-09-01 07:32:50'),
(132, 'Ruth', 'Hayes', 'Mavis', 'hazle.keeling@ho', '496.124.3278', '$2y$10$AJD2Lczm9JVcKwJNoEKjO.7hXGGthyVLaOIzCdYw9.Y7BhN0rTWbK', '2020-09-01 07:32:50', '2020-09-01 07:32:50'),
(133, 'Mikayla', 'Bailey', 'Zula', 'sbarton@gmail.co', '(580)672-3593x', '$2y$10$9u85g26OwHiGJD2cZ8QH0eO1Z/ZCphXhrzWzzvKe7wwZxfodp1c5S', '2020-09-01 07:35:09', '2020-09-01 07:35:09'),
(134, 'Daniela', 'Parisian', 'Haylee', 'leland.mraz@gmai', '(092)639-2815x', '$2y$10$/rIaXVX1SHiTG5HsP.146ezjot2xxezIv9Od7XgBlZwGkQAnpaZQ.', '2020-09-01 07:35:09', '2020-09-01 07:35:09'),
(135, 'Treva', 'Kris', 'Omer', 'vhayes@hotmail.c', '646.849.1224x4', '$2y$10$sNX8TB9E/fJXMRkpdstFzeOdIFp45TbtCu3FperDB6vEWjM1k4KKa', '2020-09-01 07:35:09', '2020-09-01 07:35:09'),
(136, 'Alverta', 'Tremblay', 'Verda', 'llind@schroeder.', '1-770-361-0021', '$2y$10$iOq7aZCfDlzB5XfHdyFGs.gIIaTD5DmiQ7GLYS/ATG7zE6Xo2tssa', '2020-09-01 07:35:09', '2020-09-01 07:35:09'),
(137, 'Emeka', 'Solomon', '', '', '', '', '2020-09-03 12:01:37', '2020-09-03 12:01:37'),
(138, 'Polly', 'Fadel', 'Shana', 'leanne71@yahoo.c', '832.843.1469x3', '$2y$10$1n9gZWIEC/toIfMuRa.JZeVmgfCodM1kKuVqe4SDKMIluajrO9.uS', '2020-09-03 14:58:46', '2020-09-03 14:58:46'),
(139, 'Rosalinda', 'Lueilwitz', 'Jedidiah', 'dawson.roob@roob', '09905528191', '$2y$10$k7fClRzuVQ6RGwOoDz3dfuGm3D6mSilZEc3s8xWXqiw7u30aIwbEa', '2020-09-03 14:58:46', '2020-09-03 14:58:46'),
(140, 'Marcel', 'Fadel', 'Ruby', 'hlueilwitz@weiss', '010-857-2808x3', '$2y$10$6zL9GycgpMMnV3QzT/PMJe.e/J8jIBkY1Cs/IOylFmNy.dzgnhbzi', '2020-09-03 14:58:47', '2020-09-03 14:58:47'),
(141, 'Mandy', 'King', 'Marcelino', 'lexi.green@alten', '(711)610-4867x', '$2y$10$8fooYj1XBIuDXhL45GkkLuoJatEo6HU5bpCdssOtTAIfK/QV6hCsy', '2020-09-03 14:58:47', '2020-09-03 14:58:47'),
(142, 'Jordy', 'Jenkins', 'Michaela', 'roberts.eugenia@', '+81(3)84218169', '$2y$10$XvFTedDN6gY8dHdlKuLOI.qCVVvfgGKa6MyNnWqNMIMixbFD6YtT.', '2020-09-03 14:58:47', '2020-09-03 14:58:47'),
(143, 'Cara', 'Christiansen', 'Katarina', 'opouros@parisian', '771.144.6763x3', '$2y$10$b9mCR0yIFizyBMbEvC4gIuw8HAjrlA3.gOUJhhyAZjI4O7CIi7.nW', '2020-09-03 14:58:47', '2020-09-03 14:58:47'),
(144, 'Wilma', 'Dach', 'Elsie', 'xrempel@wisozk.b', '(776)808-7939', '$2y$10$UW.DKuxC0sqqkczaHtkmTuhwftWfq5Kv1rfR4CyZXUkNmiYBbQCNe', '2020-09-03 14:58:47', '2020-09-03 14:58:47'),
(145, 'Moriah', 'Lynch', 'Chelsea', 'raegan46@stamm.c', '137.762.8998x2', '$2y$10$gGSg.4agFbizyOEHbXcNZ.MQN97qoayBRIXx6rAJrBQ/G0tl6PxSy', '2020-09-03 14:58:47', '2020-09-03 14:58:47'),
(146, 'Timmy', 'Corkery', 'Henriette', 'dianna97@kessler', '1-109-833-3649', '$2y$10$Gckvi8zFEHXv4SxybfoPF.X3AoaXXLAO7PELw4OSyl3A04bzCYeHa', '2020-09-03 14:59:27', '2020-09-03 14:59:27'),
(147, 'Mozell', 'Lemke', 'Willy', 'xander.emard@yah', '1-790-438-9709', '$2y$10$GbsU/2bYiDcthQ/SdRToWOy98TlaadGU6sGUiHGooxW8JdzTdtMaC', '2020-09-03 14:59:27', '2020-09-03 14:59:27'),
(148, 'Keegan', 'Langworth', 'Parker', 'david.walsh@zbon', '+38(8)67658132', '$2y$10$s2z8FSlBKrWMJSI6TLDJW.y77XjjCNig9ZvuBoqANF..1KbdLK2Hm', '2020-09-03 14:59:27', '2020-09-03 14:59:27'),
(149, 'Gordon', 'Macejkovic', 'Ezekiel', 'elmer.senger@hot', '(203)648-9197x', '$2y$10$c4hPH0si/Mem6jdk8bzsO.9JmKxNTC/PCVDkLQwg0d6V0AMy5bNaq', '2020-09-03 14:59:28', '2020-09-03 14:59:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `zik_addresses`
--
ALTER TABLE `zik_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_admin`
--
ALTER TABLE `zik_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_admin_activities`
--
ALTER TABLE `zik_admin_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_admin_roles`
--
ALTER TABLE `zik_admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_amenities`
--
ALTER TABLE `zik_amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_amenities_images`
--
ALTER TABLE `zik_amenities_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_attendance`
--
ALTER TABLE `zik_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_bed`
--
ALTER TABLE `zik_bed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_booking`
--
ALTER TABLE `zik_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_booking_paid_services`
--
ALTER TABLE `zik_booking_paid_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_booking_rooms`
--
ALTER TABLE `zik_booking_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_contacts`
--
ALTER TABLE `zik_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_contact_type`
--
ALTER TABLE `zik_contact_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_coupon`
--
ALTER TABLE `zik_coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_coupon_limit`
--
ALTER TABLE `zik_coupon_limit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_coupon_services`
--
ALTER TABLE `zik_coupon_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_coupon_used`
--
ALTER TABLE `zik_coupon_used`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_coupon_users`
--
ALTER TABLE `zik_coupon_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_departments`
--
ALTER TABLE `zik_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_designation`
--
ALTER TABLE `zik_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_facilities`
--
ALTER TABLE `zik_facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_floor`
--
ALTER TABLE `zik_floor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_free_items`
--
ALTER TABLE `zik_free_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_guest`
--
ALTER TABLE `zik_guest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_guest_car`
--
ALTER TABLE `zik_guest_car`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_guest_request`
--
ALTER TABLE `zik_guest_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_hall`
--
ALTER TABLE `zik_hall`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_hall_booking`
--
ALTER TABLE `zik_hall_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_hall_booking_paid_services`
--
ALTER TABLE `zik_hall_booking_paid_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_hall_house_keeper`
--
ALTER TABLE `zik_hall_house_keeper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_hall_house_state`
--
ALTER TABLE `zik_hall_house_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_hall_prices`
--
ALTER TABLE `zik_hall_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_hall_special_prices`
--
ALTER TABLE `zik_hall_special_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_hall_type`
--
ALTER TABLE `zik_hall_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_hall_type_amenities`
--
ALTER TABLE `zik_hall_type_amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_hall_type_facilities`
--
ALTER TABLE `zik_hall_type_facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_hall_type_images`
--
ALTER TABLE `zik_hall_type_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_house_keeper`
--
ALTER TABLE `zik_house_keeper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_house_state`
--
ALTER TABLE `zik_house_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_laundry_option`
--
ALTER TABLE `zik_laundry_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_meal_category`
--
ALTER TABLE `zik_meal_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_meal_option`
--
ALTER TABLE `zik_meal_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_meal_option_choices`
--
ALTER TABLE `zik_meal_option_choices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_order`
--
ALTER TABLE `zik_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_paid_services`
--
ALTER TABLE `zik_paid_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_products_services`
--
ALTER TABLE `zik_products_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_roles`
--
ALTER TABLE `zik_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_room`
--
ALTER TABLE `zik_room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_room_house_keeper`
--
ALTER TABLE `zik_room_house_keeper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_room_house_state`
--
ALTER TABLE `zik_room_house_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_room_prices`
--
ALTER TABLE `zik_room_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_room_special_prices`
--
ALTER TABLE `zik_room_special_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_room_type`
--
ALTER TABLE `zik_room_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_room_type_facilities`
--
ALTER TABLE `zik_room_type_facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_room_type_images`
--
ALTER TABLE `zik_room_type_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_salery`
--
ALTER TABLE `zik_salery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_services`
--
ALTER TABLE `zik_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_service_category`
--
ALTER TABLE `zik_service_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_service_images`
--
ALTER TABLE `zik_service_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_staff`
--
ALTER TABLE `zik_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_staff_academic`
--
ALTER TABLE `zik_staff_academic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_staff_addresses`
--
ALTER TABLE `zik_staff_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_staff_contacts`
--
ALTER TABLE `zik_staff_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_staff_salary`
--
ALTER TABLE `zik_staff_salary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_staff_salary_history`
--
ALTER TABLE `zik_staff_salary_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_users`
--
ALTER TABLE `zik_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `zik_addresses`
--
ALTER TABLE `zik_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `zik_admin`
--
ALTER TABLE `zik_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_admin_activities`
--
ALTER TABLE `zik_admin_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_admin_roles`
--
ALTER TABLE `zik_admin_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_amenities`
--
ALTER TABLE `zik_amenities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_amenities_images`
--
ALTER TABLE `zik_amenities_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_attendance`
--
ALTER TABLE `zik_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_bed`
--
ALTER TABLE `zik_bed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_booking`
--
ALTER TABLE `zik_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_booking_paid_services`
--
ALTER TABLE `zik_booking_paid_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_booking_rooms`
--
ALTER TABLE `zik_booking_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_contacts`
--
ALTER TABLE `zik_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_contact_type`
--
ALTER TABLE `zik_contact_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_coupon`
--
ALTER TABLE `zik_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_coupon_limit`
--
ALTER TABLE `zik_coupon_limit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_coupon_services`
--
ALTER TABLE `zik_coupon_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_coupon_used`
--
ALTER TABLE `zik_coupon_used`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_coupon_users`
--
ALTER TABLE `zik_coupon_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_departments`
--
ALTER TABLE `zik_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_designation`
--
ALTER TABLE `zik_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_facilities`
--
ALTER TABLE `zik_facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_floor`
--
ALTER TABLE `zik_floor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_free_items`
--
ALTER TABLE `zik_free_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_guest`
--
ALTER TABLE `zik_guest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `zik_guest_car`
--
ALTER TABLE `zik_guest_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_guest_request`
--
ALTER TABLE `zik_guest_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_hall`
--
ALTER TABLE `zik_hall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_hall_booking`
--
ALTER TABLE `zik_hall_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_hall_booking_paid_services`
--
ALTER TABLE `zik_hall_booking_paid_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_hall_house_keeper`
--
ALTER TABLE `zik_hall_house_keeper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_hall_house_state`
--
ALTER TABLE `zik_hall_house_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_hall_prices`
--
ALTER TABLE `zik_hall_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_hall_special_prices`
--
ALTER TABLE `zik_hall_special_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_hall_type`
--
ALTER TABLE `zik_hall_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_hall_type_amenities`
--
ALTER TABLE `zik_hall_type_amenities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_hall_type_facilities`
--
ALTER TABLE `zik_hall_type_facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_hall_type_images`
--
ALTER TABLE `zik_hall_type_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_house_keeper`
--
ALTER TABLE `zik_house_keeper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_house_state`
--
ALTER TABLE `zik_house_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_laundry_option`
--
ALTER TABLE `zik_laundry_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_meal_category`
--
ALTER TABLE `zik_meal_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_meal_option`
--
ALTER TABLE `zik_meal_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_meal_option_choices`
--
ALTER TABLE `zik_meal_option_choices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_order`
--
ALTER TABLE `zik_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_paid_services`
--
ALTER TABLE `zik_paid_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_products_services`
--
ALTER TABLE `zik_products_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_roles`
--
ALTER TABLE `zik_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_room`
--
ALTER TABLE `zik_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_room_house_keeper`
--
ALTER TABLE `zik_room_house_keeper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_room_house_state`
--
ALTER TABLE `zik_room_house_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_room_prices`
--
ALTER TABLE `zik_room_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_room_special_prices`
--
ALTER TABLE `zik_room_special_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_room_type`
--
ALTER TABLE `zik_room_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_room_type_facilities`
--
ALTER TABLE `zik_room_type_facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_room_type_images`
--
ALTER TABLE `zik_room_type_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_salery`
--
ALTER TABLE `zik_salery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_services`
--
ALTER TABLE `zik_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_service_category`
--
ALTER TABLE `zik_service_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_service_images`
--
ALTER TABLE `zik_service_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_staff`
--
ALTER TABLE `zik_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_staff_academic`
--
ALTER TABLE `zik_staff_academic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_staff_addresses`
--
ALTER TABLE `zik_staff_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `zik_staff_contacts`
--
ALTER TABLE `zik_staff_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_staff_salary`
--
ALTER TABLE `zik_staff_salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_staff_salary_history`
--
ALTER TABLE `zik_staff_salary_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_users`
--
ALTER TABLE `zik_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
