-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2020 at 01:24 PM
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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `staff` int(10) UNSIGNED NOT NULL,
  `type` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_addresses`
--

INSERT INTO `zik_addresses` (`id`, `street`, `city`, `state`, `country`, `created_at`, `updated_at`, `staff`, `type`) VALUES
(1, 'Ifete', 'Aniocha', 'Anambra', 'Nigerian', '2020-09-10 18:45:05', '2020-09-10 18:45:05', 1, 'origin'),
(2, 'Akolemu Village 3 3', 'Ondo', 'igabe', '', '2020-09-10 19:43:01', '2020-09-13 04:03:11', 1, 'permanent_addres'),
(3, '12 Imanu close', 'Igbaje 2 3', 'Lagos', '', '2020-09-10 19:43:01', '2020-09-13 04:03:11', 1, 'contact_address'),
(4, 'Afagame', 'Ikomele', 'Zanfara', 'Nigerian', '2020-09-11 05:29:56', '2020-09-11 05:29:56', 2, 'origin'),
(5, '10 Chimune Estate', 'Isoke', 'Edo', '', '2020-09-11 05:31:32', '2020-09-11 05:31:32', 2, 'permanent_addres'),
(6, '34 Jim Azolu road', 'Benin', 'Edo', '', '2020-09-11 05:31:33', '2020-09-11 05:31:33', 2, 'contact_address'),
(7, 'Afagame', 'Okuku', 'Anambra', 'Nigerian', '2020-09-12 09:05:27', '2020-09-12 09:05:27', 3, 'origin'),
(8, '10 Chimune Estate', 'Isoke', 'Edo', '', '2020-09-12 09:05:46', '2020-09-12 09:05:46', 3, 'permanent_addres'),
(9, '12 Imanu close', 'Benin', 'Edo', '', '2020-09-12 09:05:47', '2020-09-12 09:05:47', 3, 'contact_address'),
(10, 'Akolemu Village 3 3', 'Ondo', 'igabe', '', '2020-09-12 15:03:02', '2020-09-13 04:03:11', 1, 'permanent_addres'),
(11, '12 Imanu close', 'Igbaje 2 3', 'Lagos', '', '2020-09-12 15:03:03', '2020-09-13 04:03:11', 1, 'contact_address');

-- --------------------------------------------------------

--
-- Table structure for table `zik_admins`
--

CREATE TABLE `zik_admins` (
  `id` int(11) NOT NULL,
  `surname` varchar(64) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `middle_name` varchar(64) NOT NULL,
  `phone_number` varchar(14) NOT NULL,
  `email_address` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
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
-- Table structure for table `zik_admin_role`
--

CREATE TABLE `zik_admin_role` (
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
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_amenities`
--

INSERT INTO `zik_amenities` (`id`, `name`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Swimming pool', 'Swimming pool is good', 1, '2020-09-08 11:23:41', '2020-09-08 11:30:08'),
(2, 'Gym', 'Gym every morning and evening', 1, '2020-09-08 11:33:43', '2020-09-08 11:33:43');

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

--
-- Dumping data for table `zik_attendance`
--

INSERT INTO `zik_attendance` (`id`, `staff`, `remark`, `created_at`, `updated_at`) VALUES
(1, 2, 'Reark', '2020-09-11 18:23:48', '2020-09-11 18:23:48');

-- --------------------------------------------------------

--
-- Table structure for table `zik_beds`
--

CREATE TABLE `zik_beds` (
  `id` int(11) NOT NULL,
  `name` varchar(16) NOT NULL,
  `size` varchar(24) NOT NULL,
  `nature` varchar(24) NOT NULL,
  `accommodate` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_beds`
--

INSERT INTO `zik_beds` (`id`, `name`, `size`, `nature`, `accommodate`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Executive', 'Double', 'Natural fibre', 2, 1, '2020-09-13 12:51:36', '2020-09-13 12:51:36'),
(2, 'Premium', 'Single', 'Natural fibre', 2, 1, '2020-09-13 12:51:50', '2020-09-13 12:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `zik_bookings`
--

CREATE TABLE `zik_bookings` (
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
  `active` tinyint(1) UNSIGNED NOT NULL,
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
  `type` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `staff` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_contacts`
--

INSERT INTO `zik_contacts` (`id`, `surname`, `first_name`, `middle_name`, `phone_number`, `email_address`, `relationship`, `type`, `created_at`, `updated_at`, `staff`) VALUES
(1, 'Umenuha', 'Pious', '', '09033110933', 'umenuya@gmail.com', 'Brother', 'Next of kin', '2020-09-11 01:42:47', '2020-09-13 04:18:17', 1),
(2, 'Wukamu', 'Samuel', '', '09038483329', 'samuel@gmail.com', 'Doctore', 'Referee', '2020-09-11 02:42:50', '2020-09-13 10:05:23', 1),
(3, 'Fedinard', 'Cheme', '', '08024849283', 'agness@yahoo.com', 'Lecutere', 'Referee', '2020-09-11 02:42:50', '2020-09-13 10:05:27', 1),
(4, 'Array', 'Partrick', '', '08028492938', 'eban@gmail.com', 'Johel manager', 'Referee', '2020-09-11 05:35:52', '2020-09-11 05:35:52', 2),
(5, 'Array', 'Cheme', '', '08024849283', 'agness@yahoo.com', 'Doctore', 'Referee', '2020-09-12 09:06:45', '2020-09-12 09:06:45', 3),
(6, 'Imamiru', 'Victory', '', '09033110990', 'numanues@gmail.com', 'Brother', 'Next of kin', '2020-09-13 07:45:16', '2020-09-13 07:45:16', 2),
(7, 'Nnamdi', 'Odokwu', '', '09039019394', 'nnamdi@gmail.com', 'Father', 'Next of kin', '2020-09-13 10:21:35', '2020-09-13 10:21:35', 3);

-- --------------------------------------------------------

--
-- Table structure for table `zik_contact_types`
--

CREATE TABLE `zik_contact_types` (
  `id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_coupons`
--

CREATE TABLE `zik_coupons` (
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
  `active` tinyint(1) UNSIGNED NOT NULL,
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
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '255',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_designations`
--

CREATE TABLE `zik_designations` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `job_description` varchar(255) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '255',
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
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_facilities`
--

INSERT INTO `zik_facilities` (`id`, `name`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Sound system', 'nill', 1, '2020-09-13 22:48:51', '2020-09-13 22:48:51'),
(2, 'Flat Screen TV', 'nill', 0, '2020-09-13 22:49:10', '2020-09-13 22:49:10'),
(3, 'Refregerator', 'nill', 0, '2020-09-13 22:49:31', '2020-09-13 22:49:31');

-- --------------------------------------------------------

--
-- Table structure for table `zik_floors`
--

CREATE TABLE `zik_floors` (
  `id` int(11) NOT NULL,
  `name` varchar(24) NOT NULL,
  `number` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_floors`
--

INSERT INTO `zik_floors` (`id`, `name`, `number`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Executive Floor', 3, 0, '2020-09-17 02:40:54', '2020-09-17 02:40:54'),
(2, 'Honey moon floor', 4, 1, '2020-09-17 02:41:07', '2020-09-17 02:41:07'),
(3, 'Standard floor', 1, 0, '2020-09-17 02:41:22', '2020-09-17 02:41:22'),
(4, 'Premium Floor', 2, 1, '2020-09-17 02:41:32', '2020-09-17 02:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `zik_free_items`
--

CREATE TABLE `zik_free_items` (
  `id` int(11) NOT NULL,
  `item` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_free_items`
--

INSERT INTO `zik_free_items` (`id`, `item`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Breakfast', 'nill', 0, '2020-09-13 22:51:04', '2020-09-13 22:51:04'),
(2, 'Bottle water', 'nill', 0, '2020-09-13 22:51:18', '2020-09-13 22:51:18'),
(3, 'Wife network', 'Nill', 1, '2020-09-13 23:10:06', '2020-09-13 23:10:06');

-- --------------------------------------------------------

--
-- Table structure for table `zik_guests`
--

CREATE TABLE `zik_guests` (
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

-- --------------------------------------------------------

--
-- Table structure for table `zik_guest_cars`
--

CREATE TABLE `zik_guest_cars` (
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
-- Table structure for table `zik_guest_requests`
--

CREATE TABLE `zik_guest_requests` (
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
-- Table structure for table `zik_halls`
--

CREATE TABLE `zik_halls` (
  `id` int(11) NOT NULL,
  `number` varchar(8) NOT NULL,
  `hall_type` int(10) UNSIGNED NOT NULL,
  `floor` int(10) UNSIGNED NOT NULL,
  `active` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_hall_bookings`
--

CREATE TABLE `zik_hall_bookings` (
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
  `active` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_hall_house_keepers`
--

CREATE TABLE `zik_hall_house_keepers` (
  `id` int(11) NOT NULL,
  `staff` int(10) UNSIGNED NOT NULL,
  `hall` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_hall_house_states`
--

CREATE TABLE `zik_hall_house_states` (
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
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_hall_types`
--

CREATE TABLE `zik_hall_types` (
  `id` int(11) NOT NULL,
  `name` varchar(24) NOT NULL,
  `code` varchar(8) NOT NULL,
  `description` text NOT NULL,
  `capacity` int(10) UNSIGNED NOT NULL,
  `max_capacity` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
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
  `active` tinyint(1) UNSIGNED NOT NULL,
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
  `active` tinyint(1) UNSIGNED NOT NULL,
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
-- Table structure for table `zik_house_keepers`
--

CREATE TABLE `zik_house_keepers` (
  `id` int(11) NOT NULL,
  `staff` int(10) UNSIGNED NOT NULL,
  `room` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_house_keepers`
--

INSERT INTO `zik_house_keepers` (`id`, `staff`, `room`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 0, '2020-09-17', '2020-09-17 07:46:29', '2020-09-17 07:46:29');

-- --------------------------------------------------------

--
-- Table structure for table `zik_house_keeping_items`
--

CREATE TABLE `zik_house_keeping_items` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `image` varchar(32) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_house_states`
--

CREATE TABLE `zik_house_states` (
  `id` int(11) NOT NULL,
  `state` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_house_states`
--

INSERT INTO `zik_house_states` (`id`, `state`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Clean', 'The place is clean', 1, '2020-09-17 06:31:40', '2020-09-17 06:31:40'),
(2, 'Dirty', 'The place is very dirty', 1, '2020-09-17 06:32:07', '2020-09-17 06:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `zik_laundry_options`
--

CREATE TABLE `zik_laundry_options` (
  `id` int(11) NOT NULL,
  `service` int(10) UNSIGNED NOT NULL,
  `option` varchar(32) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_laundry_services`
--

CREATE TABLE `zik_laundry_services` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `image` varchar(32) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `service` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_meals`
--

CREATE TABLE `zik_meals` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `image` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `meal_category` int(10) UNSIGNED NOT NULL,
  `service` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_meals`
--

INSERT INTO `zik_meals` (`id`, `name`, `price`, `image`, `description`, `meal_category`, `service`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Chicken meal', 7500, '001214329901.jpg', 'Nill', 4, 1, 1, '2020-09-11 09:24:09', '2020-09-11 09:24:09'),
(2, 'Easy Wodka Sauce', 2100, '001214425592.jpg', 'Nill', 2, 1, 1, '2020-09-11 09:25:45', '2020-09-11 09:25:45'),
(3, 'Bacon Egg ', 4200, '001223028195.jpg', 'Nill', 2, 2, 1, '2020-09-11 11:49:08', '2020-09-11 11:49:08'),
(4, 'Vegan Burger ', 3100, '001223129608.jpg', 'Nill', 4, 2, 1, '2020-09-11 11:50:49', '2020-09-11 11:50:49'),
(5, 'Sticky Date Cake ', 1250, '001223247471.jpg', 'Nill', 1, 1, 1, '2020-09-11 11:52:47', '2020-09-11 11:52:47'),
(6, 'Hakka Noodles', 1700, '001223286357.jpg', 'Nill', 3, 1, 0, '2020-09-11 11:53:26', '2020-09-11 11:53:26'),
(7, 'Lil Johnny', 3200, '001223545892.jpg', 'Nill', 1, 1, 1, '2020-09-11 11:57:45', '2020-09-11 11:57:45'),
(8, 'Big Bites', 2400, '001223591294.jpg', 'Nill', 4, 2, 0, '2020-09-11 11:58:31', '2020-09-11 11:58:31'),
(9, 'NewYork Bagels', 9700, '001223684173.jpg', 'Nill', 3, 1, 1, '2020-09-11 12:00:04', '2020-09-11 12:00:04'),
(10, 'Sunset Soup', 6300, '001223773663.jpg', 'Nill', 4, 2, 0, '2020-09-11 12:01:33', '2020-09-11 12:01:33'),
(11, 'Crispy Chicky', 1900, '001223815825.jpg', 'Nill', 4, 1, 0, '2020-09-11 12:02:15', '2020-09-11 12:02:15');

-- --------------------------------------------------------

--
-- Table structure for table `zik_meal_categories`
--

CREATE TABLE `zik_meal_categories` (
  `id` int(11) NOT NULL,
  `category` varchar(24) NOT NULL,
  `image` varchar(32) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_meal_categories`
--

INSERT INTO `zik_meal_categories` (`id`, `category`, `image`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Breakfast', '001213798918.jpg', 1, '2020-09-11 09:15:19', '2020-09-11 09:15:19'),
(2, 'Launch', '001213874417.jpg', 1, '2020-09-11 09:16:34', '2020-09-11 09:16:34'),
(3, 'Dinner', '001213909176.jpg', 1, '2020-09-11 09:17:09', '2020-09-11 09:17:09'),
(4, 'All day meal', '001213930570.jpg', 1, '2020-09-11 09:17:30', '2020-09-11 09:17:30'),
(5, 'Alcoholic drinks', '001214088450.png', 1, '2020-09-11 09:20:08', '2020-09-11 09:20:08'),
(6, 'Soft Drinks', '001214118714.jpeg', 1, '2020-09-11 09:20:38', '2020-09-11 09:20:38'),
(7, 'Cocktaile Drinks', '001214156335.jpg', 1, '2020-09-11 09:21:16', '2020-09-11 09:21:16'),
(8, 'Other Drinks', '001214179461.jpg', 1, '2020-09-11 09:21:39', '2020-09-11 09:21:39');

-- --------------------------------------------------------

--
-- Table structure for table `zik_meal_options`
--

CREATE TABLE `zik_meal_options` (
  `id` int(11) NOT NULL,
  `meal` int(10) UNSIGNED NOT NULL,
  `option` varchar(64) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_meal_options`
--

INSERT INTO `zik_meal_options` (`id`, `meal`, `option`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 'French sauce', 1, '2020-09-11 12:03:57', '2020-09-11 12:03:57'),
(2, 2, 'Meat', 1, '2020-09-11 12:04:27', '2020-09-11 12:04:27'),
(3, 3, 'Noddles', 1, '2020-09-11 12:04:51', '2020-09-11 12:04:51'),
(4, 7, 'French sauce', 1, '2020-09-11 12:05:06', '2020-09-11 12:05:06');

-- --------------------------------------------------------

--
-- Table structure for table `zik_meal_option_choices`
--

CREATE TABLE `zik_meal_option_choices` (
  `id` int(11) NOT NULL,
  `meal_option` int(10) UNSIGNED NOT NULL,
  `choice` varchar(32) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_orders`
--

CREATE TABLE `zik_orders` (
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
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_paul`
--

CREATE TABLE `zik_paul` (
  `id` int(11) NOT NULL,
  `surname` varchar(12) NOT NULL,
  `username` varchar(16) NOT NULL,
  `age` int(10) UNSIGNED NOT NULL,
  `dob` date NOT NULL,
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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_rooms`
--

CREATE TABLE `zik_rooms` (
  `id` int(11) NOT NULL,
  `room_number` varchar(8) NOT NULL,
  `room_type` int(10) UNSIGNED NOT NULL,
  `floor` int(10) UNSIGNED NOT NULL,
  `active` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_rooms`
--

INSERT INTO `zik_rooms` (`id`, `room_number`, `room_type`, `floor`, `active`, `created_at`, `updated_at`) VALUES
(1, 'RT-093', 1, 2, 1, '2020-09-17 02:47:19', '2020-09-17 03:22:13'),
(2, 'RT-012', 1, 3, 0, '2020-09-17 02:48:02', '2020-09-17 03:22:24'),
(3, 'ST-042', 3, 1, 1, '2020-09-17 02:48:23', '2020-09-17 03:22:32'),
(4, 'PR-033', 1, 1, 1, '2020-09-17 03:19:15', '2020-09-17 03:22:55'),
(5, 'ST-022', 3, 1, 0, '2020-09-17 08:36:24', '2020-09-17 08:36:24');

-- --------------------------------------------------------

--
-- Table structure for table `zik_room_house_keepers`
--

CREATE TABLE `zik_room_house_keepers` (
  `id` int(11) NOT NULL,
  `staff` int(10) UNSIGNED NOT NULL,
  `room` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_room_house_states`
--

CREATE TABLE `zik_room_house_states` (
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

--
-- Dumping data for table `zik_room_prices`
--

INSERT INTO `zik_room_prices` (`id`, `room_type`, `day`, `price`, `extra_bed_price`, `extra_guest_price`, `infant_bed_price`, `created_at`, `updated_at`) VALUES
(1, 1, 'monday', 39000, 2000, 3000, 1200, '2020-09-14 14:07:58', '2020-09-14 14:07:58'),
(2, 1, 'tuesday', 13000, 2000, 3000, 1200, '2020-09-14 14:07:59', '2020-09-15 23:50:57'),
(3, 1, 'wednesday', 56000, 2000, 3000, 1200, '2020-09-14 14:07:59', '2020-09-15 23:50:57'),
(4, 1, 'thursday', 12000, 2000, 3000, 1200, '2020-09-14 14:07:59', '2020-09-15 23:50:57'),
(5, 1, 'friday', 42000, 2000, 3000, 1200, '2020-09-14 14:08:00', '2020-09-15 23:50:57'),
(6, 1, 'saturday', 66000, 2000, 3000, 1200, '2020-09-14 14:08:00', '2020-09-15 23:50:58'),
(7, 1, 'sunday', 38478, 2000, 3000, 1200, '2020-09-14 14:08:00', '2020-09-15 23:50:58'),
(15, 2, 'monday', 2100, 3000, 1200, 200, '2020-09-16 01:50:15', '2020-09-16 01:50:15'),
(16, 2, 'tuesday', 2100, 3000, 1200, 200, '2020-09-16 01:50:17', '2020-09-16 01:50:17'),
(17, 2, 'wednesday', 2100, 3000, 1200, 200, '2020-09-16 01:50:17', '2020-09-16 01:50:17'),
(18, 2, 'thursday', 2100, 3000, 1200, 200, '2020-09-16 01:50:17', '2020-09-16 01:50:17'),
(19, 2, 'friday', 2100, 3000, 1200, 200, '2020-09-16 01:50:17', '2020-09-16 01:50:17'),
(20, 2, 'saturday', 2100, 3000, 1200, 200, '2020-09-16 01:50:17', '2020-09-16 01:50:17'),
(21, 2, 'sunday', 2100, 3000, 1200, 200, '2020-09-16 01:50:17', '2020-09-16 01:50:17');

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

--
-- Dumping data for table `zik_room_special_prices`
--

INSERT INTO `zik_room_special_prices` (`id`, `room_type`, `day`, `price`, `extra_bed_price`, `extra_guest_price`, `infant_bed_price`, `special_day`, `description`, `state_at`, `end_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'monday', 2500, 1000, 1000, 500, 'New year', 'We are happy', '2020-11-12 03:09:00', '2020-09-16 04:05:00', '2020-09-14 16:06:14', '2020-09-16 00:19:33'),
(2, 1, 'tuesday', 2500, 1000, 1000, 500, 'New year', 'We are happy', '2020-11-12 03:09:00', '2020-09-16 04:05:00', '2020-09-14 16:06:15', '2020-09-16 00:19:33'),
(3, 1, 'wednesday', 2500, 1000, 1000, 500, 'New year', 'We are happy', '2020-11-12 03:09:00', '2020-09-16 04:05:00', '2020-09-14 16:06:15', '2020-09-16 00:19:33'),
(4, 1, 'thursday', 2500, 1000, 1000, 500, 'New year', 'We are happy', '2020-11-12 03:09:00', '2020-09-16 04:05:00', '2020-09-14 16:06:16', '2020-09-16 00:19:33'),
(5, 1, 'friday', 2500, 1000, 1000, 500, 'New year', 'We are happy', '2020-11-12 03:09:00', '2020-09-16 04:05:00', '2020-09-14 16:06:16', '2020-09-16 00:19:33'),
(6, 1, 'saturday', 2500, 1000, 1000, 500, 'New year', 'We are happy', '2020-11-12 03:09:00', '2020-09-16 04:05:00', '2020-09-14 16:06:16', '2020-09-16 00:19:33'),
(7, 1, 'sunday', 2500, 1000, 1000, 500, 'New year', 'We are happy', '2020-11-12 03:09:00', '2020-09-16 04:05:00', '2020-09-14 16:06:17', '2020-09-16 00:19:33');

-- --------------------------------------------------------

--
-- Table structure for table `zik_room_types`
--

CREATE TABLE `zik_room_types` (
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
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_room_types`
--

INSERT INTO `zik_room_types` (`id`, `name`, `code`, `description`, `number_of_adult`, `number_of_children`, `max_guest`, `extra_bed`, `number_of_bed`, `bed`, `infant_bed`, `grace_period`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Executive', 'ETV', 'Nill', 2, 1, 3, 1, 1, 1, 1, 2, 0, '2020-09-13 13:12:52', '2020-09-13 13:12:52'),
(3, 'Standard', 'STD', 'null', 2, 1, 2, 1, 2, 1, 1, 2, 0, '2020-09-14 01:37:00', '2020-09-14 01:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `zik_room_type_facilities`
--

CREATE TABLE `zik_room_type_facilities` (
  `id` int(11) NOT NULL,
  `room_type` int(10) UNSIGNED NOT NULL,
  `facility` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_room_type_facilities`
--

INSERT INTO `zik_room_type_facilities` (`id`, `room_type`, `facility`, `active`, `created_at`, `updated_at`) VALUES
(1, 2, 0, 0, '2020-09-14 01:31:30', '2020-09-14 01:31:30'),
(2, 2, 0, 0, '2020-09-14 01:31:30', '2020-09-14 01:31:30'),
(3, 3, 2, 0, '2020-09-14 01:37:01', '2020-09-14 01:37:01'),
(4, 3, 3, 0, '2020-09-14 01:37:01', '2020-09-14 01:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `zik_room_type_free_items`
--

CREATE TABLE `zik_room_type_free_items` (
  `id` int(11) NOT NULL,
  `room_type` int(10) UNSIGNED NOT NULL,
  `free_item` varchar(64) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_room_type_free_items`
--

INSERT INTO `zik_room_type_free_items` (`id`, `room_type`, `free_item`, `created_at`, `updated_at`) VALUES
(1, 2, '2', '2020-09-14 01:31:30', '2020-09-14 01:37:17'),
(2, 3, '1', '2020-09-14 01:37:01', '2020-09-14 01:37:01'),
(3, 3, '2', '2020-09-14 01:37:01', '2020-09-14 01:37:01'),
(4, 3, '3', '2020-09-14 01:37:01', '2020-09-14 01:37:01');

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

--
-- Dumping data for table `zik_room_type_images`
--

INSERT INTO `zik_room_type_images` (`id`, `room_type`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '001400852103.jpg', '2020-09-13 13:12:52', '2020-09-13 13:12:52'),
(2, 1, '001400852170.jpg', '2020-09-13 13:12:52', '2020-09-13 13:12:52'),
(3, 1, '001400852181.jpg', '2020-09-13 13:12:52', '2020-09-13 13:12:52'),
(4, 1, '001400852189.jpg', '2020-09-13 13:12:52', '2020-09-13 13:12:52'),
(5, 2, '', '2020-09-14 01:23:46', '2020-09-14 01:23:46'),
(6, 2, '', '2020-09-14 01:26:14', '2020-09-14 01:26:14'),
(7, 3, '001445500809.jpg', '2020-09-14 01:37:01', '2020-09-14 01:37:01'),
(8, 3, '001445500822.jpg', '2020-09-14 01:37:01', '2020-09-14 01:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `zik_salaries`
--

CREATE TABLE `zik_salaries` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_services`
--

CREATE TABLE `zik_services` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `service_category` varchar(256) NOT NULL,
  `image` varchar(256) NOT NULL,
  `active` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_services`
--

INSERT INTO `zik_services` (`id`, `name`, `service_category`, `image`, `active`, `created_at`, `updated_at`) VALUES
(1, 'In-Room Dining', '3', '001205943053.jpg', 'on', '2020-09-11 07:04:23', '2020-09-11 07:04:23'),
(2, 'Resturant', '3', '001206007339.jpg', 'on', '2020-09-11 07:05:27', '2020-09-11 07:05:27'),
(3, 'Wake-up Call', '4', '001206147768.jpg', 'on', '2020-09-11 07:07:48', '2020-09-11 07:07:48'),
(4, 'Pick-up Tray', '4', '001206265209.jpg', 'on', '2020-09-11 07:09:45', '2020-09-11 07:09:45'),
(5, 'House Keeping', '4', '001206312646.jpg', 'on', '2020-09-11 07:10:32', '2020-09-11 07:10:32'),
(6, 'Room Clean-up', '4', '001206583242.jpg', 'on', '2020-09-11 07:15:03', '2020-09-11 07:15:03'),
(7, 'Request Item', '4', '001206932882.jpg', 'on', '2020-09-11 07:20:52', '2020-09-11 07:20:52'),
(8, 'Maintenance', '4', '001208740181.jpg', 'on', '2020-09-11 07:51:00', '2020-09-11 07:51:00'),
(9, 'Taxi', '6', '001208933965.jpg', 'on', '2020-09-11 07:54:14', '2020-09-11 07:54:14'),
(10, 'Car hiring', '6', '001208995796.jpg', 'on', '2020-09-11 07:55:15', '2020-09-11 07:55:15'),
(11, 'Flight Reservation', '6', '001209034037.png', 'on', '2020-09-11 07:55:54', '2020-09-11 07:55:54'),
(12, 'Dry Cleaning', '7', '001209139511.jpg', 'on', '2020-09-11 07:57:39', '2020-09-11 07:57:39'),
(13, 'Ironing', '7', '001209189050.png', 'on', '2020-09-11 07:58:29', '2020-09-11 07:58:29'),
(14, 'Amaizing Rock on water', '9', '001209462856.jpg', 'on', '2020-09-11 08:03:02', '2020-09-11 08:03:02'),
(15, 'Near hotel Enjoyment', '9', '001209592838.jpg', 'on', '2020-09-11 08:05:12', '2020-09-11 08:05:12'),
(16, 'Large bar site pool', '5', '001209702671.jpg', 'on', '2020-09-11 08:07:02', '2020-09-11 08:07:02'),
(17, 'Effective Errand service', '5', '001209752860.jpg', '1', '2020-09-11 08:07:52', '2020-09-12 08:48:30'),
(18, 'Exceptional business centre', '5', '001209834474.jpg', 'on', '2020-09-11 08:09:14', '2020-09-11 08:09:14'),
(19, 'Best Gym centre', '5', '001210021715.jpg', '1', '2020-09-11 08:12:21', '2020-09-12 08:48:36'),
(20, 'Sport for kids', '5', '001210160531.jpg', 'on', '2020-09-11 08:14:40', '2020-09-11 08:14:40');

-- --------------------------------------------------------

--
-- Table structure for table `zik_service_categories`
--

CREATE TABLE `zik_service_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(32) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_service_categories`
--

INSERT INTO `zik_service_categories` (`id`, `name`, `description`, `image`, `active`, `created_at`, `updated_at`) VALUES
(3, 'Dinings', 'Guest can dining in their room or  make special order', '001204440440.jpg', 1, '2020-09-11 06:39:20', '2020-09-17 08:42:04'),
(4, 'In-Room Service', 'Nill', '001204661224.jpg', 1, '2020-09-11 06:43:01', '2020-09-11 06:56:13'),
(5, 'Take a tour', 'Nill', '001204727300.jpg', 1, '2020-09-11 06:44:07', '2020-09-11 06:56:20'),
(6, 'Transportation', 'Nill', '001204860237.jpg', 1, '2020-09-11 06:46:20', '2020-09-11 06:46:20'),
(7, 'Laundry', 'Nill', '001204925486.jpg', 1, '2020-09-11 06:47:25', '2020-09-11 06:56:18'),
(8, 'Management', 'Nill', '001205126340.jpg', 1, '2020-09-11 06:50:46', '2020-09-11 06:56:24'),
(9, 'Recreattion', 'Nill', '001205381314.jpg', 1, '2020-09-11 06:55:01', '2020-09-11 06:55:01'),
(10, 'Errand Service', 'Nill', '001205429240.jpg', 1, '2020-09-11 06:55:49', '2020-09-11 06:55:49');

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
-- Table structure for table `zik_staffs`
--

CREATE TABLE `zik_staffs` (
  `id` int(11) NOT NULL,
  `surname` varchar(64) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `middle_name` varchar(64) NOT NULL,
  `phone_number` varchar(14) NOT NULL,
  `email_address` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `dob` date NOT NULL,
  `religion` varchar(16) NOT NULL,
  `department` int(10) UNSIGNED NOT NULL,
  `designation` int(10) UNSIGNED NOT NULL,
  `photo` varchar(32) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `join_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_staffs`
--

INSERT INTO `zik_staffs` (`id`, `surname`, `first_name`, `middle_name`, `phone_number`, `email_address`, `password`, `gender`, `dob`, `religion`, `department`, `designation`, `photo`, `active`, `created_at`, `updated_at`, `join_date`) VALUES
(1, 'Ubung', 'Philip', 'Chijioke', '09033110933', 'samuel@gmail.com', 'password', 'Male', '2008-09-20', 'Christianity', 0, 0, '001158942700.jpg', 0, '2020-09-10 18:14:02', '2020-09-12 14:26:40', '2008-09-20'),
(2, 'Imamiru', 'Francis', 'Micheal', '09012938493', 'francis@gmail.com', 'password', 'Male', '2000-09-15', 'Christianity', 0, 0, '001200249565.jpg', 0, '2020-09-11 05:29:29', '2020-09-11 05:29:29', '2018-09-08'),
(3, 'Samuel', 'Philip', 'Chijioke', '09063553553', 'samue3l@gmail.com', 'password', 'Male', '2000-09-08', 'Christianity', 0, 0, '001299529795.png', 0, '2020-09-12 09:04:09', '2020-09-12 09:04:09', '2018-09-08');

-- --------------------------------------------------------

--
-- Table structure for table `zik_staff_academic`
--

CREATE TABLE `zik_staff_academic` (
  `id` int(11) NOT NULL,
  `staff` int(10) UNSIGNED NOT NULL,
  `certificate` varchar(64) NOT NULL,
  `institution` varchar(255) NOT NULL,
  `start_year` year(4) NOT NULL,
  `completed_year` year(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_staff_academic`
--

INSERT INTO `zik_staff_academic` (`id`, `staff`, `certificate`, `institution`, `start_year`, `completed_year`, `created_at`, `updated_at`) VALUES
(1, 1, 'SSCE', 'Federal Govt College, Enuguku', 2010, 2015, '2020-09-11 02:12:08', '2020-09-13 05:00:29'),
(2, 1, 'B.sc.', 'Nnamdi Azikiwe university, Awka, Anambra', 2015, 2019, '2020-09-11 02:12:08', '2020-09-13 05:00:30'),
(3, 2, 'NECO', 'Peace Secondary School', 2009, 2005, '2020-09-11 05:33:23', '2020-09-11 05:33:23'),
(4, 2, 'BEngr', 'Enugu state university of Science and Technology, Enugu', 2005, 2019, '2020-09-11 05:33:24', '2020-09-11 05:33:24'),
(5, 3, 'BEngr', 'Enugu state university of Science and Technology, Enugu', 2005, 2019, '2020-09-12 09:06:20', '2020-09-12 09:06:20'),
(6, 3, 'Bsc', 'Enugu state university of Science and Technology, Enugu', 2005, 2002, '2020-09-12 09:06:21', '2020-09-12 09:06:21');

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
-- Table structure for table `zik_staff_salaries`
--

CREATE TABLE `zik_staff_salaries` (
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
  `email_address` varchar(64) NOT NULL,
  `phone_number` varchar(14) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zik_work_experience`
--

CREATE TABLE `zik_work_experience` (
  `id` int(11) NOT NULL,
  `staff` int(10) UNSIGNED NOT NULL,
  `company` varchar(255) NOT NULL,
  `location` varchar(128) NOT NULL,
  `job_position` varchar(32) NOT NULL,
  `period_from` date NOT NULL,
  `period_to` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zik_work_experience`
--

INSERT INTO `zik_work_experience` (`id`, `staff`, `company`, `location`, `job_position`, `period_from`, `period_to`, `created_at`, `updated_at`) VALUES
(1, 1, 'Willia Ltd.', 'Akare, Ondo', 'Manager', '2006-04-20', '2010-09-20', '2020-09-11 02:28:58', '2020-09-13 07:05:57'),
(2, 1, 'Imaje group of company', 'Apapa, Lagos', 'Project manager', '2006-03-20', '2004-09-20', '2020-09-11 02:28:59', '2020-09-13 07:05:57'),
(3, 2, 'Prince Construction Company Ltd', 'Isoke', 'Floor man', '2020-09-02', '2020-09-13', '2020-09-11 05:34:45', '2020-09-13 07:33:02'),
(4, 2, 'Juhel Pharmaciticle', 'Awka', 'Electrician', '2020-09-09', '2020-09-12', '2020-09-11 05:34:46', '2020-09-13 07:33:02'),
(5, 3, 'Imaje group of company', 'Apapa, Lagos', 'Electrician', '0000-00-00', '0000-00-00', '2020-09-12 09:06:31', '2020-09-12 09:06:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `zik_addresses`
--
ALTER TABLE `zik_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_admins`
--
ALTER TABLE `zik_admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_admin_activities`
--
ALTER TABLE `zik_admin_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_admin_role`
--
ALTER TABLE `zik_admin_role`
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
-- Indexes for table `zik_beds`
--
ALTER TABLE `zik_beds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_bookings`
--
ALTER TABLE `zik_bookings`
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
-- Indexes for table `zik_contact_types`
--
ALTER TABLE `zik_contact_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_coupons`
--
ALTER TABLE `zik_coupons`
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
-- Indexes for table `zik_designations`
--
ALTER TABLE `zik_designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_facilities`
--
ALTER TABLE `zik_facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_floors`
--
ALTER TABLE `zik_floors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_free_items`
--
ALTER TABLE `zik_free_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_guests`
--
ALTER TABLE `zik_guests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_guest_cars`
--
ALTER TABLE `zik_guest_cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_guest_requests`
--
ALTER TABLE `zik_guest_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_halls`
--
ALTER TABLE `zik_halls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_hall_bookings`
--
ALTER TABLE `zik_hall_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_hall_booking_paid_services`
--
ALTER TABLE `zik_hall_booking_paid_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_hall_house_keepers`
--
ALTER TABLE `zik_hall_house_keepers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_hall_house_states`
--
ALTER TABLE `zik_hall_house_states`
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
-- Indexes for table `zik_hall_types`
--
ALTER TABLE `zik_hall_types`
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
-- Indexes for table `zik_house_keepers`
--
ALTER TABLE `zik_house_keepers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_house_keeping_items`
--
ALTER TABLE `zik_house_keeping_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_house_states`
--
ALTER TABLE `zik_house_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_laundry_options`
--
ALTER TABLE `zik_laundry_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_laundry_services`
--
ALTER TABLE `zik_laundry_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_meals`
--
ALTER TABLE `zik_meals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_meal_categories`
--
ALTER TABLE `zik_meal_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_meal_options`
--
ALTER TABLE `zik_meal_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_meal_option_choices`
--
ALTER TABLE `zik_meal_option_choices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_orders`
--
ALTER TABLE `zik_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_paid_services`
--
ALTER TABLE `zik_paid_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_paul`
--
ALTER TABLE `zik_paul`
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
-- Indexes for table `zik_rooms`
--
ALTER TABLE `zik_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_room_house_keepers`
--
ALTER TABLE `zik_room_house_keepers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_room_house_states`
--
ALTER TABLE `zik_room_house_states`
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
-- Indexes for table `zik_room_types`
--
ALTER TABLE `zik_room_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_room_type_facilities`
--
ALTER TABLE `zik_room_type_facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_room_type_free_items`
--
ALTER TABLE `zik_room_type_free_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_room_type_images`
--
ALTER TABLE `zik_room_type_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_salaries`
--
ALTER TABLE `zik_salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_services`
--
ALTER TABLE `zik_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_service_categories`
--
ALTER TABLE `zik_service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_service_images`
--
ALTER TABLE `zik_service_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zik_staffs`
--
ALTER TABLE `zik_staffs`
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
-- Indexes for table `zik_staff_salaries`
--
ALTER TABLE `zik_staff_salaries`
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
-- Indexes for table `zik_work_experience`
--
ALTER TABLE `zik_work_experience`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `zik_addresses`
--
ALTER TABLE `zik_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `zik_admins`
--
ALTER TABLE `zik_admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_admin_activities`
--
ALTER TABLE `zik_admin_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_admin_role`
--
ALTER TABLE `zik_admin_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_amenities`
--
ALTER TABLE `zik_amenities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zik_amenities_images`
--
ALTER TABLE `zik_amenities_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_attendance`
--
ALTER TABLE `zik_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `zik_beds`
--
ALTER TABLE `zik_beds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zik_bookings`
--
ALTER TABLE `zik_bookings`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `zik_contact_types`
--
ALTER TABLE `zik_contact_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_coupons`
--
ALTER TABLE `zik_coupons`
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
-- AUTO_INCREMENT for table `zik_designations`
--
ALTER TABLE `zik_designations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_facilities`
--
ALTER TABLE `zik_facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `zik_floors`
--
ALTER TABLE `zik_floors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `zik_free_items`
--
ALTER TABLE `zik_free_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `zik_guests`
--
ALTER TABLE `zik_guests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_guest_cars`
--
ALTER TABLE `zik_guest_cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_guest_requests`
--
ALTER TABLE `zik_guest_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_halls`
--
ALTER TABLE `zik_halls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_hall_bookings`
--
ALTER TABLE `zik_hall_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_hall_booking_paid_services`
--
ALTER TABLE `zik_hall_booking_paid_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_hall_house_keepers`
--
ALTER TABLE `zik_hall_house_keepers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_hall_house_states`
--
ALTER TABLE `zik_hall_house_states`
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
-- AUTO_INCREMENT for table `zik_hall_types`
--
ALTER TABLE `zik_hall_types`
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
-- AUTO_INCREMENT for table `zik_house_keepers`
--
ALTER TABLE `zik_house_keepers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `zik_house_keeping_items`
--
ALTER TABLE `zik_house_keeping_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_house_states`
--
ALTER TABLE `zik_house_states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zik_laundry_options`
--
ALTER TABLE `zik_laundry_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_laundry_services`
--
ALTER TABLE `zik_laundry_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_meals`
--
ALTER TABLE `zik_meals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `zik_meal_categories`
--
ALTER TABLE `zik_meal_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `zik_meal_options`
--
ALTER TABLE `zik_meal_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `zik_meal_option_choices`
--
ALTER TABLE `zik_meal_option_choices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_orders`
--
ALTER TABLE `zik_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_paid_services`
--
ALTER TABLE `zik_paid_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_paul`
--
ALTER TABLE `zik_paul`
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
-- AUTO_INCREMENT for table `zik_rooms`
--
ALTER TABLE `zik_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `zik_room_house_keepers`
--
ALTER TABLE `zik_room_house_keepers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_room_house_states`
--
ALTER TABLE `zik_room_house_states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_room_prices`
--
ALTER TABLE `zik_room_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `zik_room_special_prices`
--
ALTER TABLE `zik_room_special_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `zik_room_types`
--
ALTER TABLE `zik_room_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `zik_room_type_facilities`
--
ALTER TABLE `zik_room_type_facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `zik_room_type_free_items`
--
ALTER TABLE `zik_room_type_free_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `zik_room_type_images`
--
ALTER TABLE `zik_room_type_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `zik_salaries`
--
ALTER TABLE `zik_salaries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_services`
--
ALTER TABLE `zik_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `zik_service_categories`
--
ALTER TABLE `zik_service_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `zik_service_images`
--
ALTER TABLE `zik_service_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_staffs`
--
ALTER TABLE `zik_staffs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `zik_staff_academic`
--
ALTER TABLE `zik_staff_academic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `zik_staff_addresses`
--
ALTER TABLE `zik_staff_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_staff_contacts`
--
ALTER TABLE `zik_staff_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_staff_salaries`
--
ALTER TABLE `zik_staff_salaries`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zik_work_experience`
--
ALTER TABLE `zik_work_experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
