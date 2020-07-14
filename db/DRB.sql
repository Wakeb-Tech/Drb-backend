-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 14, 2020 at 09:58 AM
-- Server version: 8.0.17
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DRB`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`id`, `publisher_id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 58, 98, '2020-07-07 21:02:34', '2020-07-07 21:02:34');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Gharbia', '2020-04-23 12:40:38', '2020-04-23 12:40:38'),
(2, 'CA', '2020-04-23 13:20:06', '2020-04-23 13:20:06'),
(3, 'Murzuq', '2020-04-23 13:41:22', '2020-04-23 13:41:22'),
(4, 'Makkah Province', '2020-07-02 08:11:39', '2020-07-02 08:11:39'),
(5, 'Al Madinah Province', '2020-07-02 08:17:09', '2020-07-02 08:17:09'),
(6, 'Jazan', '2020-07-02 08:20:47', '2020-07-02 08:20:47'),
(7, 'Riyadh Province', '2020-07-02 08:24:27', '2020-07-02 08:24:27'),
(8, 'Madrid', '2020-07-07 19:39:08', '2020-07-07 19:39:08'),
(9, 'Cuando Cubango', '2020-07-07 20:38:36', '2020-07-07 20:38:36'),
(10, 'Giza', '2020-07-07 21:51:33', '2020-07-07 21:51:33'),
(11, 'Aswan', '2020-07-07 22:10:28', '2020-07-07 22:10:28'),
(12, 'Riyadh', '2020-07-13 08:41:10', '2020-07-13 08:41:10'),
(13, 'Makkah', '2020-07-13 08:44:09', '2020-07-13 08:44:09'),
(14, 'Aseer Province', '2020-07-13 09:15:42', '2020-07-13 09:15:42');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `spot_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `publisher_id`, `spot_id`, `created_at`, `updated_at`) VALUES
(5, 'comment', 3, 20, '2020-07-07 22:08:23', '2020-07-07 22:08:23'),
(6, 'thanks you', 98, 20, '2020-07-07 22:18:11', '2020-07-07 22:18:22'),
(7, 'hi', 99, 22, '2020-07-08 09:27:52', '2020-07-08 09:27:52'),
(8, 'hello', 99, 22, '2020-07-08 13:20:08', '2020-07-08 13:20:08'),
(9, 'hekko', 99, 22, '2020-07-08 13:31:38', '2020-07-08 13:31:38'),
(10, 'مدينة مزدحمة دائمًا', 101, 24, '2020-07-13 09:01:31', '2020-07-13 09:01:31'),
(11, 'ازيك يا خالد ممكن تقولى الرحلة اتكلفت كام وحجزت من انهى شركة سياحية وشكرا', 99, 26, '2020-07-13 09:17:18', '2020-07-13 09:17:18');

-- --------------------------------------------------------

--
-- Table structure for table `comment_suggests`
--

CREATE TABLE `comment_suggests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `suggest_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` int(11) NOT NULL DEFAULT '0',
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `contact_number`, `email`, `subject`, `desc`, `seen`, `publisher_id`, `created_at`, `updated_at`) VALUES
(2, '201551846840', 'deep2012_1st@yahoo.com', 'test', 'Desc', 0, 98, '2020-07-07 21:03:47', '2020-07-07 21:03:47');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Egypt', '2020-04-23 12:40:38', '2020-04-23 12:40:38'),
(4, 'United States', NULL, NULL),
(5, 'Iraq', NULL, NULL),
(6, 'Saudi Arabia', '2020-07-02 08:11:39', '2020-07-02 08:11:39'),
(7, 'Spain', '2020-07-07 19:39:08', '2020-07-07 19:39:08'),
(8, 'Angola', '2020-07-07 20:38:36', '2020-07-07 20:38:36');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `startAt` datetime DEFAULT NULL,
  `endAt` datetime DEFAULT NULL,
  `startHour` time DEFAULT NULL,
  `endHour` time DEFAULT NULL,
  `lat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `place_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name_ar`, `name_en`, `desc_ar`, `desc_en`, `startAt`, `endAt`, `startHour`, `endHour`, `lat`, `lng`, `address`, `url`, `cost`, `status`, `category_id`, `place_id`, `created_at`, `updated_at`) VALUES
(1, 'ايفنت محمود', 'Mahmoud Event', 'هنا يكون وصف الايفنت بالعربي ويشتغل هذه المساحة', 'here is description of event and take this area', '2020-07-15 22:50:00', '2020-10-20 17:05:00', '13:00:00', '14:45:00', '30.0462', '31.3313', '8 موسى الكاظم، المنطقة الأولى، مدينة نصر، محافظة القاهرة‬، مصر', 'http://drbtravel.com', 200.33, '0', 1, 2, '2020-04-15 18:15:29', '2020-04-15 18:15:29'),
(2, 'ايفينت رقم اتنين', 'Evnet 2', 'ن الوصف هنا يكون الوصف هنا يكون الوصف هنا يكون الوصف هنا يكون الوصف هنا يكون الوصف', 'Description Here Description Here Description Here Des', '2020-02-01 21:05:00', '2020-02-02 21:05:00', '00:00:00', '00:00:00', '30.0441', '31.3341', '43 ذاكر حسين، الحديقة الدولية، مدينة نصر، محافظة القاهرة‬، مصر', 'http://drbtravel.com', 0.00, '0', 1, 6, '2020-04-15 18:36:53', '2020-04-15 18:36:53'),
(3, 'ايفنت تلاته', 'event 3', 'وصف ايفنت  الثلاث', 'description event 3', '1969-01-07 09:05:00', '2018-12-30 04:20:00', '00:00:00', '00:00:00', '30.0446', '31.3304', '24 أحمد فهيم، الحديقة الدولية، مدينة نصر، محافظة القاهرة‬، مصر', 'drb.com', 10.00, '0', 1, 7, '2020-04-15 18:47:14', '2020-04-15 18:47:14'),
(4, 'اخر ايفنت', 'Evnet Last', 'وصف يا معلم', 'desc please', '2020-02-01 21:05:00', '2020-02-02 21:05:00', '00:00:00', '00:00:00', '30.0443', '31.3382', '67 ذاكر حسين، الحديقة الدولية، مدينة نصر، محافظة القاهرة‬، مصر', 'drb.com', 0.00, '0', 1, 8, '2020-04-15 18:51:33', '2020-04-15 18:51:33'),
(5, 'جديد', 'new', 'وصف عام', 'public desc', '2020-05-07 10:10:00', '2020-05-01 14:50:00', '14:14:00', '14:14:00', '30.034024628931657', '31.24238681793213', 'شارع عمر خيرت، سعد زغلول، قسم سعد زغلول، Al Hanafi, El-Sayeda Zainab, Cairo Governorate, Egypt', NULL, NULL, '0', 1, 2, '2020-05-05 12:20:04', '2020-05-05 12:20:04'),
(6, 'ايفنت اليوم العالمي للقطط', 'Event World day for Cats', 'اهلا بكم فى اليوم العالمي للقطط يمكنك مشاركنا فى الايفنت', 'hello this world day for cats you can share with us', '2020-07-07 09:45:00', '2020-07-31 22:50:00', '13:45:00', '22:45:00', '30.043535348000187', '31.234833717346184', 'القاهرة حديق، Qasr Ad Dobarah, Qasr El Nil, Cairo Governorate, Egypt', 'https://google.com', 120.00, '0', 1, 2, '2020-07-07 20:49:51', '2020-07-07 20:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `event_categories`
--

CREATE TABLE `event_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_categories`
--

INSERT INTO `event_categories` (`id`, `name_ar`, `name_en`, `desc_ar`, `desc_en`, `created_at`, `updated_at`) VALUES
(1, 'عام', 'Genral', 'وصف', 'Desc', '2020-04-15 18:07:13', '2020-04-15 18:07:13');

-- --------------------------------------------------------

--
-- Table structure for table `event_files`
--

CREATE TABLE `event_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('image','video') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_files`
--

INSERT INTO `event_files` (`id`, `file`, `type`, `event_id`, `created_at`, `updated_at`) VALUES
(1, 'uploads/events/qjMmw4oivq4EMgXM.jpg', 'image', 1, '2020-04-15 18:15:29', '2020-04-15 18:15:29'),
(2, 'uploads/events/pNRUEJ0LpOJQYOd2.jpg', 'image', 1, '2020-04-15 18:15:29', '2020-04-15 18:15:29'),
(3, 'uploads/events/EKHRsbdIaQabviyG.png', 'image', 1, '2020-04-15 18:15:29', '2020-04-15 18:15:29'),
(4, 'uploads/events/hu8bciQ0reYCo8vo.jpg', 'image', 2, '2020-04-15 18:36:53', '2020-04-15 18:36:53'),
(5, 'uploads/events/xoTR4nI5hulcoHLi.png', 'image', 3, '2020-04-15 18:47:14', '2020-04-15 18:47:14'),
(6, 'uploads/events/wlK7yu4wF6OOA3nm.png', 'image', 4, '2020-04-15 18:51:33', '2020-04-15 18:51:33'),
(7, 'uploads/events/hFlv335itojZUxAq.jpg', 'image', 5, '2020-05-05 12:20:04', '2020-05-05 12:20:04'),
(8, 'uploads/events/1Oo85BXelTiaXT1W.png', 'image', 6, '2020-07-07 20:49:51', '2020-07-07 20:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `event_hash`
--

CREATE TABLE `event_hash` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hash_id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_hash`
--

INSERT INTO `event_hash` (`id`, `hash_id`, `event_id`, `created_at`, `updated_at`) VALUES
(1, 1, 5, '2020-05-05 12:20:04', '2020-05-05 12:20:04');

-- --------------------------------------------------------

--
-- Table structure for table `event_publisher`
--

CREATE TABLE `event_publisher` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_publisher`
--

INSERT INTO `event_publisher` (`id`, `event_id`, `publisher_id`, `created_at`, `updated_at`) VALUES
(3, 1, 2, '2020-04-15 19:04:37', '2020-04-15 19:04:37'),
(4, 1, 37, '2020-04-15 19:06:58', '2020-04-15 19:06:58'),
(34, 1, 67, '2020-04-23 15:59:21', '2020-04-23 15:59:21'),
(36, 6, 98, '2020-07-07 20:51:50', '2020-07-07 20:51:50'),
(38, 3, 98, '2020-07-07 22:21:29', '2020-07-07 22:21:29');

-- --------------------------------------------------------

--
-- Table structure for table `event_topic`
--

CREATE TABLE `event_topic` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `topic_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_topic`
--

INSERT INTO `event_topic` (`id`, `event_id`, `topic_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-04-15 18:15:29', '2020-04-15 18:15:29'),
(2, 2, 3, '2020-04-15 18:36:53', '2020-04-15 18:36:53'),
(3, 2, 2, '2020-04-15 18:36:53', '2020-04-15 18:36:53'),
(4, 3, 2, '2020-04-15 18:47:14', '2020-04-15 18:47:14'),
(5, 5, 2, '2020-05-05 12:20:04', '2020-05-05 12:20:04'),
(6, 6, 2, '2020-07-07 20:49:51', '2020-07-07 20:49:51'),
(7, 6, 1, '2020-07-07 20:49:51', '2020-07-07 20:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `spot_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`id`, `publisher_id`, `spot_id`, `created_at`, `updated_at`) VALUES
(3, 98, 6, '2020-07-07 21:01:50', '2020-07-07 21:01:50'),
(4, 3, 20, '2020-07-07 22:09:02', '2020-07-07 22:09:02');

-- --------------------------------------------------------

--
-- Table structure for table `favourits`
--

CREATE TABLE `favourits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `publishing_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('image','video') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `spot_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `file`, `type`, `spot_id`, `created_at`, `updated_at`) VALUES
(15, 'uploads/spots/Sku3N4rEQmuysLyn.jpeg', 'image', 2, '2020-07-02 08:11:39', '2020-07-02 08:11:39'),
(16, 'uploads/spots/DPyHd6LrWnWmwCOI.jpeg', 'image', 2, '2020-07-02 08:11:39', '2020-07-02 08:11:39'),
(17, 'uploads/spots/Ci5QLCljyHXphAMT.jpeg', 'image', 2, '2020-07-02 08:11:39', '2020-07-02 08:11:39'),
(18, 'uploads/spots/OOWMEQ3hnGf8MF9k.jpeg', 'image', 2, '2020-07-02 08:11:39', '2020-07-02 08:11:39'),
(19, 'uploads/spots/WPEKWdueFxZJp9uZ.jpeg', 'image', 3, '2020-07-02 08:17:09', '2020-07-02 08:17:09'),
(20, 'uploads/spots/hNghiy11eIu55F0D.jpeg', 'image', 3, '2020-07-02 08:17:09', '2020-07-02 08:17:09'),
(21, 'uploads/spots/o3l1JqRU6IBL7slQ.jpeg', 'image', 3, '2020-07-02 08:17:09', '2020-07-02 08:17:09'),
(22, 'uploads/spots/W3iLYl9nAdDmsbqk.jpeg', 'image', 3, '2020-07-02 08:17:09', '2020-07-02 08:17:09'),
(23, 'uploads/spots/OnItxIXTn48tR433.jpeg', 'image', 3, '2020-07-02 08:17:09', '2020-07-02 08:17:09'),
(24, 'uploads/spots/5K8pjXu37K1y2y5U.jpeg', 'image', 4, '2020-07-02 08:20:47', '2020-07-02 08:20:47'),
(25, 'uploads/spots/oTNRrBJzHm6mBhFe.jpeg', 'image', 4, '2020-07-02 08:20:47', '2020-07-02 08:20:47'),
(26, 'uploads/spots/UHYjpb2FLHLtKXcP.jpeg', 'image', 4, '2020-07-02 08:20:47', '2020-07-02 08:20:47'),
(27, 'uploads/spots/z6Dte0GyKdq6LpH1.jpeg', 'image', 4, '2020-07-02 08:20:47', '2020-07-02 08:20:47'),
(28, 'uploads/spots/tZSOHnTcksnj2xgU.jpeg', 'image', 5, '2020-07-02 08:24:27', '2020-07-02 08:24:27'),
(29, 'uploads/spots/2atWIz8LLoNGWqvA.jpeg', 'image', 5, '2020-07-02 08:24:27', '2020-07-02 08:24:27'),
(30, 'uploads/spots/laLF2ijyAKT3GgFA.jpeg', 'image', 5, '2020-07-02 08:24:27', '2020-07-02 08:24:27'),
(31, 'uploads/spots/KK9vd6ckpMfJ1WIJ.jpeg', 'image', 5, '2020-07-02 08:24:27', '2020-07-02 08:24:27'),
(32, 'uploads/spots/9iLDgd2i2rvHyaWV.jpeg', 'image', 5, '2020-07-02 08:24:27', '2020-07-02 08:24:27'),
(33, 'uploads/spots/kYEchTdGTHQqGu4I.jpeg', 'image', 6, '2020-07-02 08:29:17', '2020-07-02 08:29:17'),
(34, 'uploads/spots/m5Xs982ZZGl9lAtF.jpeg', 'image', 6, '2020-07-02 08:29:17', '2020-07-02 08:29:17'),
(35, 'uploads/spots/ZzvNtjH4GIghInhU.jpeg', 'image', 6, '2020-07-02 08:29:17', '2020-07-02 08:29:17'),
(36, 'uploads/spots/yMYX6hHFMhOwAZGJ.jpeg', 'image', 6, '2020-07-02 08:29:17', '2020-07-02 08:29:17'),
(37, 'uploads/spots/yrA1uricWwAsaO0K.jpeg', 'image', 6, '2020-07-02 08:29:17', '2020-07-02 08:29:17'),
(38, 'uploads/spots/cQDwRkEtuMGxxQO4.jpeg', 'image', 7, '2020-07-02 09:58:20', '2020-07-02 09:58:20'),
(39, 'uploads/spots/U7mAOdVa8P5s3cGH.jpeg', 'image', 7, '2020-07-02 09:58:20', '2020-07-02 09:58:20'),
(40, 'uploads/spots/9GbZ6Rk8HrwE6SjP.jpeg', 'image', 7, '2020-07-02 09:58:20', '2020-07-02 09:58:20'),
(41, 'uploads/spots/d3oDS1SzqigprIup.jpeg', 'image', 7, '2020-07-02 09:58:20', '2020-07-02 09:58:20'),
(42, 'uploads/spots/KmfKCF47KHELcVxS.jpeg', 'image', 7, '2020-07-02 09:58:20', '2020-07-02 09:58:20'),
(43, 'uploads/spots/g6oIDbPiKyCRJgCN.jpeg', 'image', 8, '2020-07-02 10:04:06', '2020-07-02 10:04:06'),
(44, 'uploads/spots/xrNBVuzuNU87Kmpi.jpeg', 'image', 8, '2020-07-02 10:04:06', '2020-07-02 10:04:06'),
(45, 'uploads/spots/DZAnUpPJVwXdK8gB.jpeg', 'image', 8, '2020-07-02 10:04:06', '2020-07-02 10:04:06'),
(46, 'uploads/spots/A0GsWKPharbqjLAA.jpeg', 'image', 8, '2020-07-02 10:04:06', '2020-07-02 10:04:06'),
(47, 'uploads/spots/GYG25St3i7Vqmn65.jpeg', 'image', 8, '2020-07-02 10:04:06', '2020-07-02 10:04:06'),
(61, 'uploads/spots/HQEOlfGWAfMpCtlc.png', 'image', 20, '2020-07-07 21:52:28', '2020-07-07 21:52:28'),
(62, 'uploads/spots/5UFSOJ0X9PTQZl2q.png', 'image', 20, '2020-07-07 21:52:28', '2020-07-07 21:52:28'),
(63, 'uploads/spots/ohCdrubk5Cno0JBE.png', 'image', 21, '2020-07-07 22:10:28', '2020-07-07 22:10:28'),
(64, 'uploads/spots/FvMAGQcuQGrfPjhe.png', 'image', 22, '2020-07-07 22:19:43', '2020-07-07 22:19:43'),
(66, 'uploads/spots/IcV4ipouTA0xlwZH.png', 'image', 24, '2020-07-13 08:41:10', '2020-07-13 08:41:10'),
(67, 'uploads/spots/THkbvMlsZviZFdMT.png', 'image', 24, '2020-07-13 08:41:10', '2020-07-13 08:41:10'),
(68, 'uploads/spots/A8sKFaccOqyKAWJ5.png', 'image', 25, '2020-07-13 08:44:09', '2020-07-13 08:44:09'),
(69, 'uploads/spots/qJh3BHyNruDfdocm.jpeg', 'image', 26, '2020-07-13 09:15:42', '2020-07-13 09:15:42'),
(70, 'uploads/spots/yjpYzYqeDHJBACkS.jpeg', 'image', 27, '2020-07-13 09:18:44', '2020-07-13 09:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `follow_id` bigint(20) UNSIGNED NOT NULL,
  `follower_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `follow_id`, `follower_id`, `created_at`, `updated_at`) VALUES
(4, 3, 98, '2020-07-07 19:15:06', '2020-07-07 19:15:06');

-- --------------------------------------------------------

--
-- Table structure for table `hashes`
--

CREATE TABLE `hashes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hashtag` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hashes`
--

INSERT INTO `hashes` (`id`, `hashtag`, `created_at`, `updated_at`) VALUES
(1, '#new', '2020-05-05 12:20:04', '2020-05-05 12:20:04');

-- --------------------------------------------------------

--
-- Table structure for table `hash_spot`
--

CREATE TABLE `hash_spot` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hash_id` bigint(20) UNSIGNED NOT NULL,
  `spot_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `interests`
--

INSERT INTO `interests` (`id`, `publisher_id`, `event_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2020-04-15 19:06:34', '2020-04-15 19:06:34'),
(18, 98, 2, '2020-07-07 22:21:12', '2020-07-07 22:21:12');

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `ended` tinyint(1) NOT NULL DEFAULT '1',
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`id`, `name`, `desc`, `ended`, `publisher_id`, `created_at`, `updated_at`) VALUES
(1, 'Abudhabi', NULL, 1, 75, '2020-03-21 18:17:14', '2020-03-21 18:17:14'),
(3, 'Mahmoud. Journey', 'Deep in travel', 1, 98, '2020-07-07 19:17:35', '2020-07-07 19:17:35'),
(4, 'مكة', 'عمرة', 1, 53, '2020-07-13 08:34:58', '2020-07-13 08:34:58'),
(5, 'رحلة داخل السعودية', 'هذا اول مرة ازور المملكة العربية السعودية الحمد لله 🌹🌹❤️❤️', 1, 99, '2020-07-13 08:39:19', '2020-07-13 08:39:19'),
(6, 'عين قحطان', 'تجربة سفر', 1, 6, '2020-07-13 09:15:03', '2020-07-13 09:15:03');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `spot_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `publisher_id`, `spot_id`, `created_at`, `updated_at`) VALUES
(3, 3, 20, '2020-07-07 22:07:58', '2020-07-07 22:07:58'),
(4, 98, 20, '2020-07-07 22:08:50', '2020-07-07 22:08:50'),
(6, 3, 22, '2020-07-07 22:44:47', '2020-07-07 22:44:47'),
(8, 98, 8, '2020-07-07 22:48:11', '2020-07-07 22:48:11'),
(19, 99, 26, '2020-07-13 09:17:25', '2020-07-13 09:17:25');

-- --------------------------------------------------------

--
-- Table structure for table `like_suggests`
--

CREATE TABLE `like_suggests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `suggest_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `localities`
--

CREATE TABLE `localities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `localities`
--

INSERT INTO `localities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Sedi El Hamouly', '2020-04-23 12:40:38', '2020-04-23 12:40:38'),
(2, 'Minnesota St', '2020-04-23 13:20:06', '2020-04-23 13:20:06'),
(3, 'Kamel Hussein', '2020-04-23 13:20:43', '2020-04-23 13:20:43'),
(4, 'Carolina St', '2020-04-23 13:41:44', '2020-04-23 13:41:44'),
(5, 'Pennsylvania Ave', '2020-04-23 14:31:12', '2020-04-23 14:31:12'),
(6, 'El Qadey Street', '2020-04-23 16:58:17', '2020-04-23 16:58:17'),
(7, 'Makkah', '2020-07-02 08:11:39', '2020-07-02 08:11:39'),
(8, 'Medina', '2020-07-02 08:17:09', '2020-07-02 08:17:09'),
(9, 'Jazan', '2020-07-02 08:20:47', '2020-07-02 08:20:47'),
(10, 'Riyadh', '2020-07-02 08:24:27', '2020-07-02 08:24:27'),
(11, 'Jeddah', '2020-07-02 08:29:17', '2020-07-02 08:29:17'),
(12, 'No 4 Street', '2020-07-07 21:51:33', '2020-07-07 21:51:33'),
(13, 'El Shawarby El Gedid', '2020-07-07 22:10:28', '2020-07-07 22:10:28'),
(14, 'Wadi Hanifah Street', '2020-07-13 08:41:10', '2020-07-13 08:41:10'),
(15, 'Ayn Qahtan', '2020-07-13 09:15:42', '2020-07-13 09:15:42');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name_ar`, `name_en`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'مصر', 'Egypt', NULL, '2020-04-15 18:07:46', '2020-04-15 18:07:46'),
(2, 'طنطا', 'Tanta', 1, '2020-04-15 18:09:06', '2020-04-15 18:09:06'),
(3, 'المملكة السعودية', 'Sudia Arabia', NULL, '2020-04-15 18:25:13', '2020-04-15 18:25:13'),
(4, 'تركيا', 'Turkey', NULL, '2020-04-15 18:25:35', '2020-04-15 18:25:35'),
(5, 'مكة', 'Makka', 3, '2020-04-15 18:26:18', '2020-04-15 18:26:18'),
(6, 'القاهره', 'Cairo', 1, '2020-04-15 18:26:43', '2020-04-15 18:26:43'),
(7, 'الرياض', 'Riyyad', 3, '2020-04-15 18:27:31', '2020-04-15 18:27:31'),
(8, 'طابا', 'Taba', 4, '2020-04-15 18:27:55', '2020-04-15 18:27:55');

-- --------------------------------------------------------

--
-- Table structure for table `log_activities`
--

CREATE TABLE `log_activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('publsihing','publisher','suggest') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publsihing',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_activities`
--

INSERT INTO `log_activities` (`id`, `publisher_id`, `action_id`, `type`, `status`, `created_at`, `updated_at`) VALUES
(7, 98, 3, 'FOLLOW', 'publisher', '2020-07-07 19:15:06', '2020-07-07 19:15:06'),
(8, 98, 58, 'BLOCK', 'publisher', '2020-07-07 21:02:13', '2020-07-07 21:02:13'),
(9, 98, 58, 'UNBLOCK', 'publisher', '2020-07-07 21:02:25', '2020-07-07 21:02:25'),
(10, 98, 58, 'BLOCK', 'publisher', '2020-07-07 21:02:34', '2020-07-07 21:02:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_06_9_140650_create_risk_types_table', 1),
(4, '2019_06_9_140650_create_store_types_table', 1),
(5, '2019_08_10_133725_create_publishers_table', 1),
(6, '2019_08_10_234340_create_stores', 1),
(7, '2019_08_11_003629_create_trips_table', 1),
(8, '2019_08_11_203950_create_store_places_table', 1),
(9, '2019_08_11_223147_create_trip_resources_table', 1),
(10, '2019_08_12_014436_create_risks_table', 1),
(11, '2019_08_12_014525_create_risk_comments_table', 1),
(12, '2019_08_12_024231_create_publishings_table', 1),
(13, '2019_08_12_100139_create_log_activities_table', 1),
(14, '2019_08_12_182620_create_favourits_table', 1),
(15, '2019_08_12_185528_create_settings_table', 1),
(16, '2019_08_12_185618_create_contacts_table', 1),
(17, '2019_08_13_021934_create_blocks_table', 1),
(18, '2019_08_13_022000_create_followers_table', 1),
(19, '2019_08_16_000256_create_suggests_table', 1),
(20, '2019_08_16_000408_create_like_suggests_table', 1),
(21, '2019_08_16_000424_create_comment_suggests_table', 1),
(22, '2019_08_16_223003_create_notifications_table', 1),
(23, '2019_08_19_214217_create_admin_notifications_table', 1),
(24, '2019_11_12_004218_create_journals_table', 1),
(25, '2019_11_12_004429_create_spots_table', 1),
(26, '2019_11_12_004851_create_files_table', 1),
(27, '2019_11_12_005144_create_tags_table', 1),
(28, '2019_11_12_005332_create_spot_tag_table', 1),
(29, '2019_11_13_125524_create_tag_spot_table', 1),
(30, '2019_11_19_120622_create_favourites_table', 1),
(31, '2019_11_19_133528_create_likes_table', 1),
(32, '2019_11_19_133548_create_comments_table', 1),
(33, '2019_11_24_111112_add_title_to_spots_table', 1),
(34, '2019_11_29_123503_create_countries_table', 1),
(35, '2019_11_29_150514_create_cities_table', 1),
(36, '2019_11_29_150605_create_subcities_table', 1),
(37, '2019_11_29_150639_create_localities_table', 1),
(38, '2019_11_29_150946_add_country_id_city_id_and_subcity_id_and_locality_id_to_spots', 1),
(39, '2020_02_04_084705_create_locations_table', 1),
(40, '2020_02_05_091254_create_event_categories_table', 1),
(41, '2020_02_05_091319_create_events_table', 1),
(42, '2020_02_05_091421_create_event_files_table', 1),
(43, '2020_02_09_152359_create_topics_table', 1),
(44, '2020_02_09_152846_create_event_topic_table', 1),
(45, '2020_02_17_075503_create_event_publisher_table', 1),
(46, '2020_02_18_100358_create_hashes_table', 1),
(47, '2020_02_18_101709_create_event_hash_table', 1),
(48, '2020_02_18_125401_create_hash_spot_table', 1),
(49, '2020_02_25_075610_create_providers_table', 1),
(50, '2020_04_15_110216_create_interests_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('02033520-fafc-4a22-af7a-cf92dd43aaaa', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 98, '{\"pid\":\"20\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  depo \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"depo do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-07 22:08:50', '2020-07-07 22:08:50'),
('0ddba59b-0f61-4f81-9998-16f7156dad17', 'App\\Notifications\\Comment', 'App\\Models\\Publisher', 98, '{\"pid\":\"20\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  Ahmed Taher \\u0628\\u062a\\u0639\\u0644\\u064a\\u0642 \\u0639\\u0644\\u0649 \\u0645\\u0646\\u0634\\u0648\\u0631\\u0643 \",\"title_en\":\"depo do the comment in post\",\"msg_ar\":null,\"msg_en\":null,\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/07-07-201594158013211277597.png\"}', NULL, '2020-07-07 22:08:23', '2020-07-07 22:08:23'),
('0ecafbd0-138b-4e86-99bd-6d5b372ad8eb', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 98, '{\"pid\":\"20\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  Ahmed Taher \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"Ahmed Taher do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/07-07-201594158013211277597.png\"}', NULL, '2020-07-07 22:07:58', '2020-07-07 22:07:58'),
('2301aad2-b16c-40d1-b1c6-583c16a9dd99', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 3, '{\"pid\":\"8\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  depo \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"depo do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-07 22:48:11', '2020-07-07 22:48:11'),
('2304016a-fd1b-465a-b709-305036f358e9', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 98, '{\"pid\":\"22\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  test \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"test do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-08 13:28:17', '2020-07-08 13:28:17'),
('2452ab3b-8cc4-45b6-a3e4-886a58722407', 'App\\Notifications\\Follow', 'App\\Models\\Publisher', 4, '{\"pid\":67,\"type\":\"user\",\"title_ar\":\" \\u0642\\u0627\\u0645  zaki deep \\u0628\\u0639\\u0645\\u0644 \\u0645\\u062a\\u0627\\u0628\\u0639\\u0647 \\u0644\\u0643\",\"title_en\":\"zaki deep follow you\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0645\\u0644\\u0641\\u0647 \\u0627\\u0644\\u0634\\u062e\\u0635\\u0649\",\"msg_en\":\"can see profile\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/23-04-2015876457371033256059.png\"}', NULL, '2020-04-23 16:56:19', '2020-04-23 16:56:19'),
('288ded5f-8fd0-42a0-88d7-3c506d3040fe', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 98, '{\"pid\":\"22\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  test \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"test do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-08 13:31:24', '2020-07-08 13:31:24'),
('355b88d1-f584-4f40-b261-309d0a1abe69', 'App\\Notifications\\Comment', 'App\\Models\\Publisher', 98, '{\"pid\":\"18\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  depo \\u0628\\u062a\\u0639\\u0644\\u064a\\u0642 \\u0639\\u0644\\u0649 \\u0645\\u0646\\u0634\\u0648\\u0631\\u0643 \",\"title_en\":\"depo do the comment in post\",\"msg_ar\":null,\"msg_en\":null,\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', '2020-07-07 20:41:20', '2020-07-07 20:40:16', '2020-07-07 20:41:20'),
('37617988-d614-4106-9aee-0de308dcf11d', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 98, '{\"pid\":\"22\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  test \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"test do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-08 13:20:00', '2020-07-08 13:20:00'),
('37fcf5bc-0837-4f84-8933-0e2b5e4da465', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 98, '{\"pid\":\"18\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  depo \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"depo do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', '2020-07-07 20:41:20', '2020-07-07 20:40:10', '2020-07-07 20:41:20'),
('3b1c1a44-15d3-4ba6-8eee-5a29d5b3fdae', 'App\\Notifications\\Follow', 'App\\Models\\Publisher', 3, '{\"pid\":67,\"type\":\"user\",\"title_ar\":\" \\u0642\\u0627\\u0645  zaki deep \\u0628\\u0639\\u0645\\u0644 \\u0645\\u062a\\u0627\\u0628\\u0639\\u0647 \\u0644\\u0643\",\"title_en\":\"zaki deep follow you\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0645\\u0644\\u0641\\u0647 \\u0627\\u0644\\u0634\\u062e\\u0635\\u0649\",\"msg_en\":\"can see profile\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/23-04-2015876457371033256059.png\"}', NULL, '2020-07-06 05:21:18', '2020-07-06 05:21:18'),
('4181efdd-db8d-42b8-b667-f874b5dcc7e4', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 98, '{\"pid\":\"22\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  test \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"test do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-08 09:22:32', '2020-07-08 09:22:32'),
('49b9058b-ca6b-4a67-8296-39fbe4082a81', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 98, '{\"pid\":\"22\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  Ahmed Taher \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"Ahmed Taher do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/07-07-201594158013211277597.png\"}', NULL, '2020-07-07 22:44:26', '2020-07-07 22:44:26'),
('49fb5de9-ea8b-4780-964c-6dcc32307a43', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 98, '{\"pid\":\"22\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  Ahmed Taher \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"Ahmed Taher do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/07-07-201594158013211277597.png\"}', NULL, '2020-07-07 22:44:48', '2020-07-07 22:44:48'),
('4d677a50-5bf9-455d-8cad-515aed424a2e', 'App\\Notifications\\Comment', 'App\\Models\\Publisher', 98, '{\"pid\":\"20\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  depo \\u0628\\u062a\\u0639\\u0644\\u064a\\u0642 \\u0639\\u0644\\u0649 \\u0645\\u0646\\u0634\\u0648\\u0631\\u0643 \",\"title_en\":\"depo do the comment in post\",\"msg_ar\":null,\"msg_en\":null,\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-07 22:18:11', '2020-07-07 22:18:11'),
('55427a7b-09f1-4eb0-94a1-0e0bf71a584b', 'App\\Notifications\\Comment', 'App\\Models\\Publisher', 98, '{\"pid\":\"22\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  test \\u0628\\u062a\\u0639\\u0644\\u064a\\u0642 \\u0639\\u0644\\u0649 \\u0645\\u0646\\u0634\\u0648\\u0631\\u0643 \",\"title_en\":\"depo do the comment in post\",\"msg_ar\":null,\"msg_en\":null,\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-08 13:20:08', '2020-07-08 13:20:08'),
('62b47a5e-788e-40ab-a36b-9a1fbb9b2ef6', 'App\\Notifications\\Comment', 'App\\Models\\Publisher', 98, '{\"pid\":\"22\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  test \\u0628\\u062a\\u0639\\u0644\\u064a\\u0642 \\u0639\\u0644\\u0649 \\u0645\\u0646\\u0634\\u0648\\u0631\\u0643 \",\"title_en\":\"depo do the comment in post\",\"msg_ar\":null,\"msg_en\":null,\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-08 09:27:52', '2020-07-08 09:27:52'),
('702ebf54-a682-4913-b86f-13c75905a396', 'App\\Notifications\\Comment', 'App\\Models\\Publisher', 98, '{\"pid\":\"18\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  depo \\u0628\\u062a\\u0639\\u0644\\u064a\\u0642 \\u0639\\u0644\\u0649 \\u0645\\u0646\\u0634\\u0648\\u0631\\u0643 \",\"title_en\":\"depo do the comment in post\",\"msg_ar\":null,\"msg_en\":null,\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', '2020-07-07 20:41:20', '2020-07-07 20:40:38', '2020-07-07 20:41:20'),
('7b70155c-ed13-4ca6-aba1-f99cf1a2e0c0', 'App\\Notifications\\Comment', 'App\\Models\\Publisher', 99, '{\"pid\":\"24\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  Khaled \\u0628\\u062a\\u0639\\u0644\\u064a\\u0642 \\u0639\\u0644\\u0649 \\u0645\\u0646\\u0634\\u0648\\u0631\\u0643 \",\"title_en\":\"test do the comment in post\",\"msg_ar\":null,\"msg_en\":null,\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-13 09:01:32', '2020-07-13 09:01:32'),
('992a4b1d-9d91-4a93-8e30-15753fa42993', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 3, '{\"pid\":\"8\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  depo \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"depo do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-07 22:47:56', '2020-07-07 22:47:56'),
('a2741396-f772-41bc-9855-119795177908', 'App\\Notifications\\Comment', 'App\\Models\\Publisher', 98, '{\"pid\":\"22\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  test \\u0628\\u062a\\u0639\\u0644\\u064a\\u0642 \\u0639\\u0644\\u0649 \\u0645\\u0646\\u0634\\u0648\\u0631\\u0643 \",\"title_en\":\"depo do the comment in post\",\"msg_ar\":null,\"msg_en\":null,\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-08 13:31:38', '2020-07-08 13:31:38'),
('a3e2f53e-9262-4ee5-8884-301c075edfa5', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 98, '{\"pid\":\"22\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  test \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"test do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-08 09:12:20', '2020-07-08 09:12:20'),
('b1557466-03bc-447e-860a-8a792097b435', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 67, '{\"pid\":\"1\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  zaki deep \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"zaki deep do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', '2020-04-23 13:00:06', '2020-04-23 12:41:39', '2020-04-23 13:00:06'),
('b327c00d-5b85-49d0-b855-ab1e69e68436', 'App\\Notifications\\Follow', 'App\\Models\\Publisher', 3, '{\"pid\":98,\"type\":\"user\",\"title_ar\":\" \\u0642\\u0627\\u0645  depo \\u0628\\u0639\\u0645\\u0644 \\u0645\\u062a\\u0627\\u0628\\u0639\\u0647 \\u0644\\u0643\",\"title_en\":\"depo follow you\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0645\\u0644\\u0641\\u0647 \\u0627\\u0644\\u0634\\u062e\\u0635\\u0649\",\"msg_en\":\"can see profile\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-07 19:15:06', '2020-07-07 19:15:06'),
('b8add310-84ee-4a0b-b4ba-0ad141af3a66', 'App\\Notifications\\Comment', 'App\\Models\\Publisher', 67, '{\"pid\":\"1\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  zaki deep \\u0628\\u062a\\u0639\\u0644\\u064a\\u0642 \\u0639\\u0644\\u0649 \\u0645\\u0646\\u0634\\u0648\\u0631\\u0643 \",\"title_en\":\"zaki deep do the comment in post\",\"msg_ar\":null,\"msg_en\":null,\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', '2020-04-23 13:00:06', '2020-04-23 12:41:25', '2020-04-23 13:00:06'),
('c03b5072-2881-4ed9-81d8-afe25c278934', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 6, '{\"pid\":\"26\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  test \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"test do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', '2020-07-13 09:23:04', '2020-07-13 09:17:25', '2020-07-13 09:23:04'),
('c5ddd694-bb6f-4700-94ad-a58ff2678512', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 98, '{\"pid\":\"22\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  test \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"test do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-08 09:22:38', '2020-07-08 09:22:38'),
('cccee1b2-1182-4d87-aa05-617de854bc80', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 98, '{\"pid\":\"22\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  test \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"test do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-08 13:21:47', '2020-07-08 13:21:47'),
('d2f164aa-dc2d-4fff-aeea-4e3e12b83f82', 'App\\Notifications\\Follow', 'App\\Models\\Publisher', 36, '{\"pid\":67,\"type\":\"user\",\"title_ar\":\" \\u0642\\u0627\\u0645  zaki deep \\u0628\\u0639\\u0645\\u0644 \\u0645\\u062a\\u0627\\u0628\\u0639\\u0647 \\u0644\\u0643\",\"title_en\":\"zaki deep follow you\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0645\\u0644\\u0641\\u0647 \\u0627\\u0644\\u0634\\u062e\\u0635\\u0649\",\"msg_en\":\"can see profile\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/23-04-2015876457371033256059.png\"}', NULL, '2020-04-28 19:44:37', '2020-04-28 19:44:37'),
('df021b0d-e38f-4e52-828b-16a4eaea05d1', 'App\\Notifications\\Comment', 'App\\Models\\Publisher', 6, '{\"pid\":\"26\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  test \\u0628\\u062a\\u0639\\u0644\\u064a\\u0642 \\u0639\\u0644\\u0649 \\u0645\\u0646\\u0634\\u0648\\u0631\\u0643 \",\"title_en\":\"tolba do the comment in post\",\"msg_ar\":null,\"msg_en\":null,\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', '2020-07-13 09:23:04', '2020-07-13 09:17:18', '2020-07-13 09:23:04'),
('e0a6056b-3433-42a0-8c26-83c2d20a2eaf', 'App\\Notifications\\Comment', 'App\\Models\\Publisher', 98, '{\"pid\":\"18\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  depo \\u0628\\u062a\\u0639\\u0644\\u064a\\u0642 \\u0639\\u0644\\u0649 \\u0645\\u0646\\u0634\\u0648\\u0631\\u0643 \",\"title_en\":\"depo do the comment in post\",\"msg_ar\":null,\"msg_en\":null,\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', '2020-07-07 20:41:20', '2020-07-07 20:40:51', '2020-07-07 20:41:20'),
('e52a93e2-4a7b-4abe-95d0-4671980a1ec1', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 98, '{\"pid\":\"22\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  test \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"test do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-08 09:11:25', '2020-07-08 09:11:25'),
('ef9a0473-b221-4e14-8f00-dc99b563b726', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 98, '{\"pid\":\"22\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  test \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"test do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-08 13:28:47', '2020-07-08 13:28:47'),
('f1599a9f-eb02-488a-977f-ec832065fa83', 'App\\Notifications\\Like', 'App\\Models\\Publisher', 98, '{\"pid\":\"22\",\"type\":\"spot\",\"title_ar\":\" \\u0642\\u0627\\u0645  test \\u0628\\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628  \\u0628\\u0645\\u0646\\u0634\\u0648\\u0631\\u0643\",\"title_en\":\"test do  like to post\",\"msg_ar\":\"\\u064a\\u0645\\u0643\\u0646 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0629 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0639\\u062c\\u0627\\u0628\",\"msg_en\":\"can see all likes\",\"image\":\"http:\\/\\/drbtravel.com\\/uploads\\/publishers\\/default_image.png\"}', NULL, '2020-07-08 13:19:44', '2020-07-08 13:19:44');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_image.png',
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` int(11) NOT NULL DEFAULT '1',
  `bio` text COLLATE utf8mb4_unicode_ci,
  `temporay_password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `phonePrivacy` tinyint(1) NOT NULL DEFAULT '1',
  `accountPrivacy` tinyint(1) NOT NULL DEFAULT '1',
  `emailPrivacy` tinyint(1) NOT NULL DEFAULT '1',
  `followPrivacy` tinyint(1) NOT NULL DEFAULT '1',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `activation_temp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`id`, `display_name`, `username`, `image`, `mobile`, `city`, `email`, `password`, `verified`, `bio`, `temporay_password`, `lang`, `device_id`, `device_type`, `status`, `phonePrivacy`, `accountPrivacy`, `emailPrivacy`, `followPrivacy`, `is_verified`, `activation_temp`, `created_at`, `updated_at`) VALUES
(1, 'safwat', 'ali update', 'default_image.png', '12345622', '996', 'test2@test.com', '$2y$10$nIgnGx90DGReoqDtB1OJcOCOObEcq0Q793FiLqcd15vJ.saPlGvam', 1, NULL, 'gHkIX7c3I0', NULL, 'elmO0e2iYT0:APA91bFiGWN8whofRGWSqUjg8YMbGkFRahrHEqRM4gPYx23xnqIaPvc0Xnwo-viNqPhLDfY1KN9mIIifcVq9dibK3S6zy1V4XAXrRBi_HBqkNmkrTlzxJTzjQO8D8uYWc5cuLO54x0XY', 'android', 0, 0, 0, 0, 0, 0, NULL, '2019-08-28 10:30:02', '2020-03-05 14:15:45'),
(2, 'Ahmed Aly', 'ali update', '02-09-1915674169801836544072.png', '12345621', '996', 'test4@test.com', '$2y$10$Kj3qPyseql4AUlfeUvb3FO/zfhPuvQwoHxdcy5BBz50lafXIZZkJK', 0, 'xxxxx', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, '2019-08-28 11:25:28', '2019-12-09 08:42:17'),
(3, 'Ahmed Taher', 'ahmedtaher', '07-07-201594158013211277597.png', '512345678', '966', 'ahmedtaher376@gmail.com', '$2y$10$n6H5gm7oEz./qIjhvfX.G.qRvSEah46dspcDNE/oKnmqZqXMG7UxG', 1, 'Android  Developer', '875426', 'ar', 'fQ184EhedbU:APA91bHEL_9kTQ4WdEWomVgS69grUDRrr9EhBo9zHTqO3QnW_1XoZVwE1ISQ8bBde_9j87Rn451avRGZDotfureiOz5FK9rh3fz23ubYjlFwkrCBRyGrMxH8OPbYwOuMcp__ocvhnwaI', 'android', 1, 1, 1, 1, 1, 1, '750862', '2019-08-28 11:38:12', '2020-07-07 22:02:24'),
(4, 'klkkk', 'ahmedkamel89@gmail.com', '18-09-19156881730872577286.png', '01111111111', 'EG', 'aaa@bhh.come', '$2y$10$EsF0SPP1X4ChK1QWEIfh0.D3Ft7bffho6zyjox1NrNIWTC4tF6UlW', 1, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, '2019-08-28 12:52:48', '2019-09-18 14:35:51'),
(5, 'akamel', 'Ahmed kamel', 'default_image.png', '1113537732', '20', 'testa@test.com', '$2y$10$5wLgUDNChtCzZKn//yVi6OLaSYc4U4j0LfFtmSldgDGDhHqPTKnJ.', 0, 'Hello my name is ahmed', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, '2019-08-30 10:19:42', '2019-09-07 15:19:01'),
(6, 'tolba', 'khaled test2', '13-07-201594632012605848005.png', '01021030441', '20', 'khaledtolba944@gmail.com', '$2y$10$EimSoSTGvnNiuTgin/nHt.7z8NI7c/vAmDPY/FNiHwrNM..sU1h/.', 1, 'عاشق للسفر', NULL, 'ar', 'f2NLXUq-gU8:APA91bHME8rVeClBhkaIa3OrTdFKvwfOcI7AO1yslvRnJtlxCzjCkpOac6nyH_S064mT1iQBiFALfIdO71JFwgogKFvCSTx7_BcKrdp1X4ZSC_MXVrZTM8Ud4rDsu-22sRnEUfu31A5B', 'android', 1, 0, 0, 0, 0, 1, '169527', '2019-09-01 12:23:30', '2020-07-13 09:20:12'),
(7, 'خالد٢', 'خالد', 'default_image.png', '+101022212993', '966', 'mfathy@wakeb.tech', '$2y$10$kw0pdWNGOHMwrHa7WciN1.pnornk/xzXmYwW4Bp/hTXMTNM0w1hyW', 0, 'Test', NULL, NULL, 'd0oNW9H7nUc:APA91bEhupvsX6f3ThPSJVTmXB_4hCgVtAX7f0rGjkOvIu4OqvSj4Hkv2Vq08x7mbNmzz_yWMmXYahiCvamTPWMZiTL5gbePv5oSeXT6QCDoVtYl9WkHGUiIUKZoaiO-THSiz5ZyAoTY', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-09-02 15:16:14', '2019-09-02 15:16:14'),
(9, 'kamel', 'Ahmed', '15-09-1915685553171696510129.png', '1113537739', '+966', 'test5@test.com', '$2y$10$QlLvjy5niB1Rt5.fztDiNeM7IIrPLFDKAGGtgLFLjbE6ZOmhtvf5u', 0, 'Hello my name is Ahmed', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, '2019-09-07 13:03:15', '2019-09-15 13:48:37'),
(10, 'Kamel', 'ahmedkamel', 'default_image.png', '123456222', '996', 'ahmedkamel89@gmail.com', '$2y$10$NoGzqr7UV.YxtChtAWWrgu5HlrZTVD.kP1QOaNuZO3.FKNF7covVK', 0, NULL, 'zSoN1x', 'ar', NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, '2019-09-08 08:47:04', '2019-10-01 07:20:31'),
(12, 'ASSAF.R', 'Raghid Assaf', 'default_image.png', '562918774', '966', 'raghidassaf992@gmail.com', '$2y$10$CBYDqJrfVpYXqXmOaB6.RO3XPgoxydqj1HfSnZXdTC8ldTLdLwTv.', 0, NULL, NULL, NULL, 'cTu1PCk82mM:APA91bE2uJat3YRm8FvG4gTO7H7dtIzgY-HCzVIpWRCOGtLEBN3tF5QToh2P6SPu1Rl1ArQFGePHow46tfnyg4EYCVhbuY9s0SLuSrDfN6Xpnu8jl_8_K26BYClF0l1Nmr60Od8ExXnU', 'android', 1, 0, 1, 0, 0, 0, NULL, '2019-09-10 12:03:44', '2020-02-20 09:51:48'),
(13, 'teeest', 'teeeest', 'default_image.png', '0120600771333', '966', 'aaa@aaa.com', '$2y$10$P0odq8VULFq8.T7IN6mQWuFPC..at4dFWCTjAWeV8pS6qUPZ8ESEC', 0, NULL, NULL, NULL, 'eiv1hciEVMk:APA91bEs8vs3d82e_JCgJBvmGq9yap34DQ9gPHQ-SEkaAR_NgOzpTy4RDwm4HBaBqZr4d90FjGnQ-YVCnzt0HKQbZc63NjPmlJctdOysD4OHX0JINR9aL0q682M8i4pg2G8zsQJLujvC', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-09-17 09:38:52', '2019-09-17 09:38:52'),
(14, 'h7', 'hamad', 'default_image.png', '531189888', '966', 'hamad.700@hotmail.com', '$2y$10$nB7a97YqqQgenqIShPunu.4e9j3L7eGhQ5Hs6LmQKYBzSoASthBay', 0, NULL, 'vFwJ6G', NULL, 'dndjE7p0p3A:APA91bF1_KsLRoEUEmy-O5nfnB3c1pL4zeOuodD-6F8lnI99iEecPKH9LKqX27_fEgHEL_e0MdqVjVhhfMBseknqhIwStEmWGigpisbsrFbNWldui7_yCNY6L9OMsi5Vdb7kWuVWuQ7M', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-09-23 20:02:30', '2020-02-10 13:56:05'),
(15, 'samar', 'samar', 'default_image.png', '01114557097', '966', 'sammohammed828@gmail.com', '$2y$10$ZaE42YWNK4CteW8/iTKWNeq5Kak.0p6IEt7ET9EK6vA18SpLqnvIa', 0, NULL, NULL, NULL, 'ejs36eWLbyE:APA91bHIUbwjIXinU8kXeenzGWKTReMHvz_HMKAtU1-6GldGWf3UvFIdc56OMMNeyn6YJ8-7bEloIP4sCLMtmDcXAAyDpf6QpqIGJ5aaUxNbnZnVHCuihDYvcBS1_c_X3ifb77Xb1uV-', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-09-25 10:51:57', '2019-09-25 10:51:57'),
(16, 'Mohamed Elhady', 'shiegure', 'default_image.png', '01142765120', '20', 'mohamed-elhady@outlook.com', '$2y$10$8.iLGCvnI0QcLq36joH/Ku0joH7zIJ53lTx1i1EIk2WpMbDTMmNdS', 1, NULL, '6nwdIj', NULL, 'exECLYFLn8E:APA91bGn5Erhgv0gT-ASXV_KQP7optu2OtvcfKrWRD4b7twy-2EzGyIXrLkB_uH_cHiueRqw-ZjpUMfZmO9GjH3xeIXkBlAPdxVJEizNUsJR2DoeCyBYYyfeGMYjjbi8yoz-v-iT0V5k', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-09-25 12:24:40', '2019-10-07 20:23:18'),
(17, 'user123', 'user123', 'default_image.png', '0111332313', '966', 'user@user.com', '$2y$10$WSRbNW.dgP6X0TApZHahyuSRASsLPDILC/6MWAIRjmpZgGynuYRAC', 0, 'hello world', NULL, NULL, 'd6DEvPCoGJg:APA91bGoPMFq7Rl4nf6x1m89MXyKSlMYuC_qhcYibMCaSweSi4Ka3o28pIWU7VqzvNlduN-edTFop4B6SCZSsZV3EPlpsHdYJZ4lPm9jqzSi7lFnJvBOeVMk0dYNjiFf13rTcEVDtVBY', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-09-30 08:54:32', '2019-09-30 08:54:32'),
(18, 'dummy', 'dummy', 'default_image.png', '1234567890000', '966', 'dummy@dummy.com', '$2y$10$it/1rVGQjZ.PkuYJ7FarVO.6fBiQbZkXjN6JsZxkyHrJEgqKUIdKK', 0, NULL, NULL, NULL, 'cfqxzRqe4ds:APA91bFhCUj-KXEtiyT7Z7rZG0_k_LuFiNplMmK3FKLqalgKpZnZEuhf5imFFPY2S5hRTxFEENUQ3LHVpqKNKmVwAhM6q2qJjyztgXpFYCfp_h0-5YhzMdh1GAogPLCLZuwF7awN0m3j', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-09-30 09:53:17', '2019-09-30 09:53:17'),
(19, 'Mohamed Elhady', 'kira', 'default_image.png', '123456789', '20', 'a@a.com', '$2y$10$VfJeJriT8WEiu5QiX/wDGeB3tJW.HPyImi54oNrZp68xI0VMqZ4Si', 0, 'bio ugugr u yvuvyb itcig oyciy it it it it it it it it it it t ititit 8y it it it it itxotd8td8td itcitc8yv itcoyf8t itcitc8 itxitc8tc itcitc8yv itciyc itciyc', NULL, NULL, 'cAcyN0SQmkk:APA91bHdEAI3GiWQpyyxTzWJ4w_8ltRAfQwXb4uAJDbzAdn4cWCZ4gwXl37TtNwalfTea4IfA33vzmVhvq-AhQw682DxVCB_4HLMjYL_9-7sABbcL-XYY2a3T7AS5RIQzJLiA4_jr46I', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-10-01 08:08:31', '2019-10-06 11:52:52'),
(20, 'test', 'test', 'default_image.png', '01022212993', '966', 'ktolba@wakeb.tech', '$2y$10$FgSpFITifKqYoZ8lp1vkC.ljsOMGXo6JCwyCTx1RNqzhTvc/bD5wy', 0, '12345678', 'DACPbO', NULL, 'cF41JqX6Dmg:APA91bGIRaz5rivIkEBM326aHEtVPuyHA74ok0NJPQ-G8qN2C9PivRPbPh6pmbFZd1G3Pp3eGi5Ju9X9Cpt9sI7frOib7B9yxFg-GGaWnwB2mLdCjYR1LSEZh9dy_BjqKGAM1c3nCXrh', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-10-14 14:14:07', '2020-02-10 14:06:04'),
(21, 'Mohsen', 'Ahmed Mohsin', '10-12-191575970028706938857.png', '01019584270', '20', 'dr.abdelmohsin@gmail.com', '$2y$10$h1whuINCWERAyvZ4V4eVmu3idYu4gZorNvlRxb3hg2C.vA5BTPmxO', 0, NULL, '674308', 'en', 'fKgvWd75piI:APA91bG7whTA4NnFEMXwnJ7IlU5SyD_h2bz9KqenoTzXd2gCMqHY89LMFcPalwAhl9AQ0Z7JHDxMJimB_O9jrZK8l13QoxNv078K_DSx0qwAFQY0P2F05shj8SamJnL7k3OHovFHfrzZ', 'android', 1, 0, 0, 0, 0, 0, '804572', '2019-10-15 09:23:22', '2020-07-01 17:40:57'),
(23, 'mf', 'toofan', 'default_image.png', '01126858440', '20', 'm_toofan@outlook.com', '$2y$10$IKfeNtudmxgKr4/3JvJE0OuRKO.UiGV9gP2RjU.X6CSG7wW0EdyCC', 0, NULL, NULL, NULL, 'dcAAYJwH29s:APA91bHkJf0m2rt6nm7Jp-XPaAnKe-xImanPMtMLF_nN7aLdxUJmNzelpetDCdew7kimvWr5PBKOpiObSbD9cj9tjmgKgrSu1av2VJMKDU_Arl38Y2oEXvNz0uCky5yJI6SVI7Zf3aeN', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-10-31 08:13:52', '2019-10-31 08:13:52'),
(24, 'ahmedkm', 'ahmedkm', 'default_image.png', '1122554477', '966', 'kamel@gmail.com', '$2y$10$CqT7YgwFyZrH/8Un8HK8q.JswWG4LlpgMMXKsPlzb7a621UQf95A.', 0, 'Hello my name is Ahmed', NULL, NULL, 'ciBs9dfv_n0:APA91bFiYhtCtLU-JgDWW6EvGQcNqDNjPG0levVmYK8A2mL_DYDGJz5aag3shbQNVXvBcS3VqYQDPGdnwJC1Wg3HycYV1LSaFHT4e4lgcNz4lf18taul8eG_RVCfuu87XZc-_Lwjv4Wb', 'ios', 1, 0, 0, 0, 0, 0, NULL, '2019-11-05 07:50:10', '2019-11-05 07:50:10'),
(25, 'username', 'username', 'default_image.png', '11223344588', '+966', 'usern@user.com', '$2y$10$Q7ttiLPl4zdYteHHl/.y0OFf1H83tvtHHwHDHvg7OYUSwTVb.Y7M6', 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, '2019-11-05 09:03:10', '2019-11-06 10:24:22'),
(26, 'test', 'Amro', 'default_image.png', '01023050716', 'Giza', 'test90@gmail.com', '$2y$10$AR6qQzZmD.1muiGjg9mt2uZKDvawhzF/bjmlcf4xV7MLGPfwAK1ge', 0, 'teest  test', NULL, NULL, '1', 'ios', 1, 0, 0, 0, 0, 0, NULL, '2019-11-14 14:34:10', '2019-11-14 14:34:10'),
(27, 'toofan', 'mfathi', 'default_image.png', '1126858440', '+20', 'mfathi@wakeb.tech', '$2y$10$92W2.YuL6L6LR6lvbn3ynO8mHLPuiUikrLm6kFaZCAjrjtY0RCdtu', 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, '2019-11-19 14:47:28', '2019-11-26 11:48:57'),
(28, 'fei', 'hess', 'default_image.png', '0504265538', '971', 'hessengaliste@gmail.com', '$2y$10$BIym3j1W7JkK..548KNfqOY.JD7FUSmSDm.rVEjZzFmbIExekBBS.', 0, NULL, NULL, NULL, 'dRfR-9SyUHM:APA91bFlg4BdOIK5e_geA6rORRJ9qY_3xFF4s-GqZxa7EjlAslphn6H40mlWrU3HSl6V2iK-yCLUL875wLQGudckPqV6Gz8egXKY1EehAxxsHvc3upPOS7RJyTCdeZNhKsSeU4M5icZf', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-11-24 18:00:54', '2019-11-24 18:00:54'),
(29, 'midooooo', 'ahmedgmal', 'default_image.png', '01016234359', '20', 'elmahy2005@gmail.com', '$2y$10$e3eyGI1HnPYrTTTIDHeY5O41au3olFYPd4SFhT.dIsdIR2.nJZTve', 0, 'hhhh', NULL, NULL, 'fLHxo4A-ITs:APA91bETYvQD6cPRI30sT2MFHb0JOeZ3OEOYdqycGAOWDi5xOPJa-wHVWZ8xQjEUBQo_LsqlwfNrnaYBtWywNwrdsVLfeSYphaEKF2xBExbbTElAhPg09iajSwzXIHAJ_agboOuz_zPh', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-11-25 13:05:00', '2019-11-25 13:05:00'),
(30, 'daved', 'daved555', '26-11-191574782434174486795.jpeg', '010183887770', '20', 'daved555@daved.com', '$2y$10$TAxsWDUzYvKPVHEH37YMq.ICperkkC4aJi6gScdvze.nWaLMrqb0G', 0, NULL, NULL, NULL, 'eRuFPw2nM7I:APA91bEmTjtO26JkHzWPagf3-uPhCWV3SqGBlu0vGDAldIrNkaexZh-WtmffXxdKhXOTyXPBqqlG5a475lwSFntvXnQSqevmsB-pUjekNZ29tDDZGzQD9CnTDDDlATFG16Ci5IaNbp40', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-11-26 14:13:04', '2019-11-26 15:33:54'),
(31, 'harry', 'harry555', '26-11-191574790068415298596.png', '010183887771', '20', 'harry555@gmail.com', '$2y$10$PHXNUZpJkbFgIbvTdx5lsuRSnFX0d7t/V0ojqaqfnVWTFrxKsw3oO', 0, NULL, NULL, NULL, 'cpVX2iGPxPI:APA91bFBxa2L6m0NtT0mszA1Za55hBbGVj-hYbYr5Lf3F2LN3xO9Ylw8Pxi_hhlFWyUXnW2eKuPSoJorOatzUJBmJgS-8ETEuMrW8HNoIrX1JxMxNWSFpR_mMJck6AJ7nzj70WrxzSnK', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-11-26 14:14:02', '2019-11-26 17:41:08'),
(32, 'Saiful Islam', 'Saiful Islam', 'default_image.png', '01732684703', '966', 'Sanbirsohan82@gmail.com', '$2y$10$H98/Lv/kDUddLX/VW7HT1O8cCkeAE/0ZPy5M/d7Q73bbrObBvSYtu', 0, NULL, NULL, NULL, 'fnYGxSqRPwU:APA91bGN0r6Nc377JLBYXj3uD4ThHqHvdctXTD5-9vdFRvydMtJwJwoTkgkiKQMDfdavbWbism5mhCFOo7meFKIVyHkBbNSo7Z36bFUAlm56Ek8iI2VwwM9spGOYnmNuC5TQiUH-u0jh', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-11-30 14:35:49', '2019-11-30 14:35:49'),
(33, 'Ahmed taher 2', 'ahmedtaher3', 'default_image.png', '01206007713', '20', 'drbapp7@gmail.com', '$2y$10$uN/YHefbQk27.EGOXBfqM.YmMI85GTnKFrkvoWlHS9mRk4sWuTxMS', 0, 'Android developer', NULL, NULL, 'c17Sez3iBGg:APA91bHjUBVb3OIBcFxTdv3AtSLmQtwdv8_VAww8tSWkobFJNjQ2gIdLUgTmQnKqrpfhsgyYNsj5BYyFkYvGTTNcKqIa_Bv8bESAmBaiVvT8LYU0-H8LWtnuS6YuwjyfKKgfIJANt_ok', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-12-04 11:26:17', '2019-12-13 18:39:22'),
(34, 'ابو وافي', 'ابو وافي', 'default_image.png', '0503166633', '966', 'wafi1430@hotmail.com', '$2y$10$pQSRsbhrkMyV0yqfaLJGSe9Tvb8J.EOBKMSh.6nTFI3aVdk9L/zmK', 0, NULL, NULL, NULL, 'dD7u1oGLrok:APA91bH59d1AlymTFE_DgTQaMJuZm_QasY5GUBW8KyJaImjNcTFPBluLK6fKyP3NlwHTXTRX_naFj7_SrTQER7CL2gzHpA87k1AB7mapoOsDjTGzVAiSftcr68uZOqh2XMUqbsUxq4d9', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-12-05 16:37:16', '2019-12-05 16:37:16'),
(35, 'emad', 'Mohamed', '09-12-191575900626529566543.png', '1008555665', '+20', 'meltabbakh@wakeb.tech', '$2y$10$ZbMWshq5jLUHSwoB37isruUpJMT5WIseZkDoVjoKZAZBTMwA8EPmW', 0, NULL, NULL, 'en', 'eiUhKC5tkcM:APA91bGizoFWM9m0YpVeKFKTOdn0Rd7AvCnvtVj1tZ6leNzM4JVaQ2HYlJFNwAsuoMKIiuTmuXmaGAQvwApe4-LYQIJryvNCWIJIl7BkDwo4LeuA6sYoTE-BqWxl9s14l6BKwHFwvGMN', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-12-09 07:38:46', '2019-12-10 09:15:49'),
(36, 'Souza', 'kell', 'default_image.png', '92994889443', '55', 'kellsouxa@gmail.com', '$2y$10$emsFkLo7dM9aHcmxmBFWtuTvAd.tayYQ8rrs1FunVPcYTHpa1N/1u', 0, 'jajaj', NULL, NULL, 'cw18DaSbBnU:APA91bGGniNgkWaH_IO-g7K_kNr9fkN5Jm8q-kobnmNTaN4qwkQjke7nSqwCqa_klKtk-6SFCtTTtbOOEJRb2mtoYcnhfutmELu4P1aWw5WzFbsqrOrzQ0ciyuB1F6pPOv2Ej_RNAN2s', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-12-13 01:12:24', '2019-12-13 01:12:24'),
(39, 'mcnnv', 'bxhx', 'default_image.png', '3565', '+966', 'kv@oho.hh', '$2y$10$1vHXJJuFen2Y4FntAYbsU.pE4lTeh1M9s0NXfOuCnzjK09XQVreg.', 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, '2019-12-16 17:22:56', '2019-12-16 17:22:59'),
(40, 'EMcGrapth', 'emcgrapth', 'default_image.png', '5023309531', '966', 'emcgrapth@att.net', '$2y$10$MTIpsjm63FlUVja3Ho6j2uqf40GSbWXm15n3rkZ/UMAdaNDLd4dze', 0, NULL, NULL, NULL, 'cKHMYasivWo:APA91bGBh6xWEz4C-n6EC-KQxAiaRH0QqwE1mQpP9OxyE0YU9AyFYIJtXJJjPbtEXtXsNDhxb188IdppBj8RZaX8BEX0l1xg2sAcsTLwZQdX1WcLXOcWzSftSBBMPFw7EkZu-qORwgCY', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-12-22 21:07:22', '2019-12-22 21:07:22'),
(41, 'Alqahtani', 'Abdullah', 'default_image.png', '553088833', '+966', 'shamer_84@hotmail.com', '$2y$10$6VMW/XlOsaeItcKr.lWmBelS/n4Z8Y5gsoFUhxrDmA0Im6YqXM6By', 0, NULL, NULL, NULL, 'e-G2J6MaRRw:APA91bEE81-wueZiI_dYiYuAk1oub47yI69Ki9vyc-A_8dvWsNTOJcF9_4YzsnrPoZOModEj7jEFmSL-PowaDzBvuja33QHMLYmHp4W1EeAewHx-QohiAcbeBuS1xzh_PCKiP6SSAmWQ', 'ios', 1, 0, 0, 0, 0, 0, NULL, '2019-12-25 07:25:09', '2019-12-25 07:25:09'),
(42, 'cometa', 'Lorena', 'default_image.png', '631039761', '966', 'lorenacometar94@gmail.com', '$2y$10$ZMY6EmJ2STG9hDEFgEsJ3Ojnxi5HN0BArEyYQPCcYbrd8ekq2ElqK', 0, NULL, NULL, NULL, 'cr6_6qmerDw:APA91bGCOBVetXnaNH5U20kVThW3Z7Vge0qgkaDfugXAZvL3-0AQuWYQCnNlYgHZ7GoQSNdAZAWlvhZPy04YuKZjpj4r8sB6Tx6qUWvw7aW4ZT4dyltG0hdINZGtxFwv_iPtriGDTibV', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-12-29 17:37:23', '2019-12-29 17:37:23'),
(43, 'Cristina', 'Cristina', 'default_image.png', '645612174', '34', 'cristinarg1901@gmail.com', '$2y$10$pu2No1U8vV99hoWAsfsFYu4fTaWrpHuCApw2.i5viHj7Hh9HpYEwa', 0, NULL, NULL, NULL, 'dkvqBzH91vc:APA91bHg9s7Qr08o5D13C2xKlLSq4qUU5c3Pt_ET6bGp_XpTXdGQmXsZktRHE43qvemyWwuebpCoXSXsD18DTVciCcKRh9pnYqRCae6fEnZ2fBxZGaA3nTeCGDKRhvUyWq_yY1CkQBzx', 'android', 1, 0, 0, 0, 0, 0, NULL, '2019-12-29 18:18:30', '2019-12-29 18:18:30'),
(45, 'tarek', 'tarek', 'default_image.png', '02111111111', '966', 'tarek@wakeb.tech', '$2y$10$h0uzi6h0Ce87x.D.cul8Dew.ONDf8IS7E.0bMeXJUEQ4NSvhePxde', 0, '111111', NULL, NULL, 'fiTaeCaeZcA:APA91bGWfHJT_60707_lNfvXN-ouuMh4Tnv2PHp0hCUbtS1Bf2MaFEhFLiywNgbw8Ijimo45cnBWn7adwImqN3xTl3rVeFMdQz2RpNQI6cskrR-bLXzCe18L48lXQquBIHYld0InMCH7', 'android', 1, 0, 0, 0, 0, 0, NULL, '2020-01-02 11:16:36', '2020-01-02 11:16:36'),
(46, 'eslam-kamel', 'eslam-mohamed', 'default_image.png', '01099726641', '20', 'eslammuhammedkamel@gmail.com', '$2y$10$p0P0RzsFPCOP0ERfdVjFX.KZidue6bPF8AOY.bkBHFrAcJP1slx02', 0, NULL, NULL, NULL, 'eJWAL4dn75w:APA91bFhlNtUlAD1TCXdpTCguph429DGRhNye0DZacHWUI3U6BGCPWFez_d7-s9-kNQWVGTJJuJoJXRE4s7Qtt6NXa-kzecOgvZtD2DZC-q7s81VuNlNDlCIB_XcFNR8_WNwJ72FANUy', 'android', 1, 0, 0, 0, 0, 0, NULL, '2020-01-08 08:52:11', '2020-01-11 12:14:55'),
(47, 'احمد', 'علي', 'default_image.png', '07812937161', '966', 'kkyan7067@gmail.com', '$2y$10$IhpimblwsY.mSLU2Tgrd5eNrPZCuLY7CCcOJz4tn0WMshALmS8vIu', 0, '1979', NULL, NULL, 'f6t36kA0q7w:APA91bEVfRiDolcHcEYSYs1dmnSiLr2l-pbOshIU2wbhJrertRu6s3uJxGZik70qcmNhV2DuwKw4y5S-1yEe4lQahfGLNe5RSlTvpgSaV7ZOsQUav22t3LHBP8Xq8QBCTSY117U3Mvfj', 'android', 1, 0, 0, 0, 0, 0, NULL, '2020-01-29 19:02:08', '2020-01-29 19:02:08'),
(48, 'Anku_jarvis', 'Ankit', 'default_image.png', '569853242', '966', 'achauhan@wakeb.tech', '$2y$10$oaclhLpVpOMQTjayjXewzOzdo1SnrKx4xuB/Ko6jVLIcycpqPSnXe', 0, NULL, NULL, NULL, 'eW8aPkxXDo4:APA91bE3yJ1cSWdx2u7ROAKBdUbFp-Xczx4TwxVPLmNdZbK4DqYP0Wsi9Z8ilsZgscQoV-90skRNJSO3BtXexbUHDP4L5OG__N3LIrtq9qHB7wPGwA60LJuRnr-ygRa4-g6a0vYClDrx', 'android', 1, 0, 0, 0, 0, 1, '439126', '2020-02-02 09:38:42', '2020-07-13 08:56:59'),
(49, 'رظوان', 'موبليس', 'default_image.png', '0655112008', '213', 'r.massoune@gmail.com', '$2y$10$/mlvGRKjyr8.D2pIxu0MZelC9tHArNHeYlRgZ2ConFWCe1/4ewoC6', 0, 'عبد الجليل رظوان رظوان', 'Iujn5v', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, '2020-02-02 13:38:26', '2020-02-10 11:46:55'),
(51, 'Karoline', 'Ana', 'default_image.png', '092992688257', '966', 'karol.lima103@gmail.com', '$2y$10$vwWt9ndTp9kPg6jG0stmle2WTo8EOx.NdQxTEqiZDC1pk0VgZAVDm', 0, '92992688257', NULL, NULL, 'dsEZUK7PFWk:APA91bHTsFTkGpaNT5JJCa6uNvEezmAlUYZzDq6yNInqS7FzCd9stLKjt980KpQhzwko3Mp2ewl_-ZenI1Z1U6-6Hs-LlJrYMp6lHV7SJGanEIBP_h1207kU1EPi0pnQQlMXF6xIrqzM', 'android', 1, 0, 0, 0, 0, 0, NULL, '2020-02-05 18:51:11', '2020-02-05 18:51:11'),
(52, 'Hassan', 'Mustafa', 'default_image.png', '509016727', '971', 'the_major_kalabala_bond@hotmail.com', '$2y$10$/gteQ0XS0QgBRRmWrPJoAuUhSsfXG4TfpEI7j.tARrhmI83ADGHiG', 0, NULL, NULL, NULL, 'eORGKsC7y6o:APA91bFA4lnmv0oRbwiz_jmnpDY5j8jXVCSdKmDq3m6MLMSyji4Bh7gUu7ZVzWPLpVdXWyIZi4D2dBODk6dHKAoVz-Qq_WlW5z9nnIcFJ2uOrbFdUA340LyA2EOX1OTdv496CMZ4rUl2', 'android', 1, 0, 0, 0, 0, 0, NULL, '2020-02-08 11:08:55', '2020-02-08 11:08:55'),
(53, '7amad', 'Hamad Almunif', 'default_image.png', '506553388', '+966', 'hamad.700@hotmail.co', '$2y$10$CkH.xCDTOByWA/YIHskQH.eke70.zS0pOOcBJ6.0xxNGHUizPGXw.', 0, NULL, NULL, 'ar', 'dndjE7p0p3A:APA91bF1_KsLRoEUEmy-O5nfnB3c1pL4zeOuodD-6F8lnI99iEecPKH9LKqX27_fEgHEL_e0MdqVjVhhfMBseknqhIwStEmWGigpisbsrFbNWldui7_yCNY6L9OMsi5Vdb7kWuVWuQ7M', 'android', 1, 0, 0, 0, 0, 0, NULL, '2020-02-10 14:17:34', '2020-02-10 14:55:35'),
(54, 'mohamed abd elnaby', 'mohamedabdelnaby', 'default_image.png', '01093565730', '20', 'mohamedfullstack@gmail.com', '$2y$10$yrkrvAygLB8UDn.GDlKAtews8h1QvkLchoqCPQI/WUebX1zXxOhmm', 0, NULL, 'htoh3j', NULL, '11111111', 'android', 1, 0, 0, 0, 0, 1, '059136', '2020-02-12 09:17:47', '2020-02-13 09:32:44'),
(55, 'mustafa ali', 'mustafa yas', 'default_image.png', '07825954235', '964', 'mustafa17yas@gmail.com', '$2y$10$BkMikJWoF4.BUw.yzn7nG.B1pCh2iHiaOUhuXDg4PSNHAU2vyj.rG', 0, NULL, NULL, NULL, 'cPf5wTtT6Ow:APA91bEIQYaYDua_01edCGgIf5whPOVWPk3FJj53m9nNYn_OpfxuOLAGnjoGXxLByZL3FFfUAH0--InM1nb2swTNHYpICVhsIR9uE7Rhrzzx6dzX2RHHLOA6djvxE4kjCwWIE4dEjXo0', 'android', 1, 0, 0, 0, 0, 0, NULL, '2020-02-12 18:10:43', '2020-02-12 18:10:43'),
(56, 'drb', 'drb', 'default_image.png', '01206000000', '20', 'develop.jops2018@gmail.com', '$2y$10$2.Xwnh45EacdxHcxDCeopeAfm5NxjE95Z3ygW64e8Lvd.eCrjUxd.', 0, NULL, NULL, NULL, 'dj3oeCeNOzI:APA91bGqkuuF6E8qtoqh_he3Kn52Fa_LcUugRcQAduhUO-OIbEAvWPcOJIWGep9zFIjXm5Kco9g3bt5QDhmCQyPmOvRgNZI1yPSs3dUNu5zHtIc8Bn3gfckS1cfTXqGMyxqo0Xcn9ejp', 'android', 1, 0, 0, 0, 0, 0, '825360', '2020-02-13 12:01:04', '2020-02-13 12:01:04'),
(57, 'drb', 'drbwakeb', 'default_image.png', '01206007729', '966', 'drb.wakeb2020@gmail.com', '$2y$10$9Ojne1V4NrSMVErPhqXUR.UqGIHcRsGlM4yH00mFPdlctOp.QKZ/q', 0, NULL, NULL, NULL, 'dj3oeCeNOzI:APA91bGqkuuF6E8qtoqh_he3Kn52Fa_LcUugRcQAduhUO-OIbEAvWPcOJIWGep9zFIjXm5Kco9g3bt5QDhmCQyPmOvRgNZI1yPSs3dUNu5zHtIc8Bn3gfckS1cfTXqGMyxqo0Xcn9ejp', 'android', 1, 0, 0, 0, 0, 1, '602935', '2020-02-13 18:11:29', '2020-02-13 18:13:17'),
(58, 'test2', 'test2', 'default_image.png', '5585', '966', 'test@test.com', '$2y$10$e4F021UBxgCkdgDc6EOxbunUbMDLUCsUpC2eYdkxJRq7GDLLp.n86', 0, '123456', NULL, NULL, 'dSxAIaU4LtY:APA91bEokO-Idk4zZwHiiqU_c9z3aqPWcWJ9Arw_EijTEGd0EsGUT7kZD85QQQAjHbj67xSeLzy0wKH0ueWu6Cw8Bbl11gBUycnQbccE82Em5hy4FiSxTC8kFXsD04iesZVt2zwN5A2R', 'android', 1, 0, 0, 0, 0, 0, '357296', '2020-02-16 13:59:26', '2020-02-16 13:59:26'),
(60, 'test', 'tsssst', 'default_image.png', '01203300112', '20', 'drab.wakeb2020@gmail.com', '$2y$10$PMwdfwrzyMvjOb/sO2puPe1NUnTNwoDJFOYxuxK2LrTquTwiWENty', 0, NULL, NULL, NULL, 'dOt4omqSTJA:APA91bHqpHEqPE81brqbztdQO4XFU5-uiKyuGxdNJMq_FjS6HQh51Sjs1FBLQwwHJ8kgTLbAx848EY80wGOLiWa1mMvaPOx-sS6ShHgyHzQZkrQ9KxkGHnElpITY78lkI-y6aGWtNpNZ', 'android', 1, 0, 0, 0, 0, 1, '379150', '2020-02-18 15:52:43', '2020-02-20 09:18:28'),
(68, 'mido', 'hamada', 'default_image.png', '01006167858', '20', 'hamadakhaled628@gmail.com', '$2y$10$M95MIWxUGWFn.SsZ0ip3gu6IPggz4aZtLnphCxAVew/rRPCEZnII.', 0, NULL, NULL, NULL, 'd9tF61sV6Vs:APA91bH-v14b7832rgPmJo9fdOnKzETJoqlkWOSandqVO7-RVKmvyNYxTifuJNYjM0LMkmY2JyLf7Lw811wRYmTb1Nf-4VmL0KO90tWMBrk0Lwn-UvN6gZiRHp5uiIo3Dy_Zvy4QQWVW', 'android', 1, 0, 0, 0, 0, 1, '369570', '2020-02-21 12:33:00', '2020-02-21 12:33:37'),
(70, 'ahmed', 'ahmedtaherrr', 'default_image.png', '1018388777', '20', 'ataher@wakeb.tech', '$2y$10$AOv1PkgYJtaQpcgl.fRK6uxrMyVbZi.w9iQPLWHt4O6n.g3.NJ/bC', 0, NULL, NULL, NULL, '7A747997-C150-482F-B83D-C7290D4A4AC6', 'ios', 1, 0, 0, 0, 0, 1, '538049', '2020-02-25 10:50:09', '2020-02-25 10:51:07'),
(71, 'alzahrani', 'saeed', 'default_image.png', '590027229', '966', 's3-11@hotmail.com', '$2y$10$J7m/aQ4tmjuy2WtxSnfmZuktt5wzGtKqN9lHGAyVw1LENIpl41Fpe', 0, NULL, NULL, NULL, 'EEF2770B-8EF5-4291-BF8B-43722979B418', 'ios', 1, 0, 0, 0, 0, 0, '061384', '2020-03-05 15:06:28', '2020-03-05 15:06:28'),
(72, 'Althaf', 'althafhussain412', 'default_image.png', '505435805', '971', 'althafhussain412@gmail.com', '$2y$10$zWnRwIY65FLe78Yd1YJgY.lDYVwf6qQKT6xJZDuBkHBG2eJVDvT6m', 1, NULL, NULL, NULL, 'f61daTU0fW4:APA91bHeT15puddu74wXhKPk6uEMf5c7juBCBdgE8iujd5mdsmcB7pnC8ljmnrt2i7cM8MggjChKdxcHsACyaAG8XKON1E1Hs7MisLYGiaFYpXZd8ScQuBD_DKaZEpchblE34B2oxKMi', 'android', 1, 1, 1, 1, 1, 1, '158374', '2020-03-12 04:17:04', '2020-03-12 04:18:47'),
(73, 'ahha4625@gmail.com', 'ahha4625@gmail.com', 'default_image.png', '711087720', '967', 'ahha4625@gmail.com', '$2y$10$JLLkP2lhjerIDw582UILbu44BIy827dkoSsuU0exButHgaSldMQEK', 1, 'ahha4625@gmail.com', NULL, NULL, 'fkzrcqrghis:APA91bFhdPqpjUJagfGiBzq7rAvz4_nBOk_ravhR575JIMeQfaQRCcb7ef3chhi9mi96xhTkeZrhmzUGQYBJYQugLeQcsYcV8Dql-stMsSRD2pO_nbCOmlPpi2TAXtCa9o9JGszsDa7b', 'android', 1, 1, 1, 1, 1, 0, '065923', '2020-03-17 18:33:34', '2020-03-17 18:33:34'),
(74, 'نورت', 'عراقي', 'default_image.png', '07703744123', '964', 'waftkhra969@gmail.com', '$2y$10$uSCZXD3ZJxcqbajTJesM0eAwMBdDeDpnJXXQDmRqXbu2nND73zt7W', 1, NULL, NULL, NULL, 'd3RosHckBl8:APA91bEsClHpOAK8es_JX0jKbRSqTX4blFTnd09X4atv8DrrPw5JKqY0Z1YQThW_HjPNn5O-PswPsIPqfvp-xLH9-1wGTqjwqR7gZy0O2YAD0QP7P3E1Oan3kFpwW714-VlwtBd3Q21i', 'android', 1, 1, 1, 1, 1, 0, '798624', '2020-03-21 18:10:45', '2020-03-21 18:10:45'),
(75, 'ahmed', 'alsharif.ahmed@yahoo.com', 'default_image.png', '0529777017', '971', 'alsharif.ahmed@yahoo.com', '$2y$10$z2qkDZrkIS2YhPW8YEAtiecC4zlpADl/KWsDhlpMGlBWjmaENxb1m', 1, 'Ahmed', NULL, NULL, 'dLOzu5uYTVs:APA91bF65xadaQYJEuDqfod9g6qm8qq29ePyeEQaWgIsptJkiFw5PqnDcK8hRvuEge7zuh_nkYWCeXa5ikEY4iPC3VaOFGNhNwOvycY8_v_6VESd5vEIHipDwJ2gKES10dw-uSGH0OqJ', 'android', 1, 1, 1, 1, 1, 1, '312694', '2020-03-21 18:16:00', '2020-03-21 18:16:38'),
(76, 'rappchikkbaba', 'aryanjha', 'default_image.png', '8862873853', '91', 'aryanjha24998@gmail.com', '$2y$10$mb7.oZzlbfsCkaXykZD2JeH/xvYg.1sELDeS1XVVk9i2vL92Ax9qO', 1, NULL, NULL, NULL, 'dGWrabSlg6U:APA91bEyXOXQwewhZ-NUtB2wDTIRoO4KBrrJUNjvQ-IQxSyDeQH156P960U7iFbEb5TnTY9tVBpq-WDap9niZjCCkgTcH3dKkx9qiITk-L57y4Yc6Q3_WwDWrpC88s5bL39kXr86fZ4q', 'android', 1, 1, 1, 1, 1, 1, '574319', '2020-03-23 17:12:18', '2020-03-23 17:14:44'),
(77, 'kaddafi', 'muammar', 'default_image.png', '082152588593', '62', 'kaddafiamar59@gmail.com', '$2y$10$Q..9qukSg/8.hRmAt5H5nOkvE5EkAuGrg7bHcNW633R3Y53IxPZPC', 1, 'pembelajaran', NULL, NULL, 'eYBk8XsHE-M:APA91bHMwlDaVOEgabztWWbHjW2gi814O8yQLplu5CCkDU8xz5fin2yRq-OxTwjjO2HPPy0axGkqtn9Q7RIThe_s7bBrtt2Q_aDeu9q4ssdKFIImbndySESVFatYT4T_qTXhRSsf3EhQ', 'android', 1, 1, 1, 1, 1, 0, '426817', '2020-04-01 04:51:01', '2020-04-01 05:40:30'),
(78, 'Nur hafizah', 'Nurhafizah', 'default_image.png', '280320', '62', 'herbiansyahdinar@gmail.com', '$2y$10$QcAv3kYrpZu9hGJyol1r7exIMqLLgaorTKlwMAQG3HPKTFdZBsxo2', 1, 'hafizah', NULL, NULL, 'dYpgxk2NjLc:APA91bFiHu8tvP14JWP6a-wZbhm2slFh9KsFMkO0Hc9mQVWdyprm0hT1Pq6AlouRvyRv-s-EuktUc9fSF7Qj6Xo5P3XlFy_M7eBd56h1YgwZEx4Fq8dXgUKINuHa07TJXdQSW3MlJcMH', 'android', 1, 1, 1, 1, 1, 0, '409372', '2020-04-01 14:17:16', '2020-04-01 14:17:16'),
(79, 'Monica Bahaa', 'Monica', 'default_image.png', '552757875', '971', 'monica_bondok@yahoo.com', '$2y$10$YrpT2eQVI/OQOMqEEOSE7eD7yX/OXQfmkQEKgdZEBft9dvDpv9EsW', 1, NULL, NULL, NULL, 'fsI33MGadEI:APA91bFGecDIXxd9Z2XTburEzBX_1kWfzourjehbvm23ig0pYhjb9rShri_XukEQKCBIS_Dk5qPN4cRG_rIGYM_BAU72kb8iS7HhhN1KXz9fvZfljZ_JG1P3G3bFs7n_90Yny7madVy0', 'android', 1, 1, 1, 1, 1, 1, '435279', '2020-04-02 11:08:05', '2020-04-02 11:08:36'),
(80, 'agil', 'agilkumpang', 'default_image.png', '085752853289', '966', 'aqganteng07@gmail.com', '$2y$10$oe0CfhoWEPcCJ7hDcpjz9e/ECJ2O/n7oqI2lcoOLXi2ikc5MTMh4G', 1, 'seorang pelajar SMP', NULL, NULL, 'csNYGlQ5qzA:APA91bEPCW5pyDRFEgm43dFoc4O_oSoBH88QfwP1TlDto-jgb4x178yYdj-fnMo1sWkynqZu07Ef9I-oMy4LbXq8Gb8IMD1SjjM-vtFZL-Jkp8Ubg_icJ1wECUgm1AJsAXaY8vT-_5rb', 'android', 1, 1, 1, 1, 1, 0, '510436', '2020-04-02 14:44:53', '2020-04-02 14:47:22'),
(81, 's kay silan', 'sachin', 'default_image.png', '9772928401', '966', 'sachinkumar68345@gmail.com', '$2y$10$6xLGx/uOpZBhVEP.2Oosb.BjWuxzREApDXBHeRo0VU3Kvxu3X5GTm', 1, 'good', NULL, NULL, 'c3rb_TAuu0s:APA91bFmrOEN3xRO-GPYzvA0D4MVabQbd9LlNIVlecgXlBvWV2OQBJqL9Lluibn179N6FGo47L1fwt3ZyilP3gIc70-ahYQVkMEIrAV2jMbb3eMEIcBNBWlbMoqVxbeSZhqFrvJKJFHK', 'android', 1, 1, 1, 1, 1, 0, '031849', '2020-04-20 07:49:43', '2020-04-20 07:49:43'),
(82, 'JAM', 'Aljoharahm', 'default_image.png', '550444459', '966', 'al_joharahm@hotmail.com', '$2y$10$zQHSdXwrgaWcdpQ/XsyluuVQmh2QZSz693bqinHlwtTq4bD/Wu0kG', 1, NULL, NULL, NULL, '3BD5E2B0-1E86-44C6-A200-82B7B4CD703F', 'ios', 1, 1, 1, 1, 1, 0, '412968', '2020-07-01 08:22:03', '2020-07-01 08:25:16'),
(83, 'Abdelmohsen', 'Ahmedmohsen', 'default_image.png', '01552004488', '20', 'dr.abdelmohsin@hotmail.com', '$2y$10$.0HOShs.IwJLAIREulUFueV09MB6U3rSCQ/ZcQdOhTBVpN8FL5q7q', 1, NULL, NULL, NULL, 'fKgvWd75piI:APA91bG7whTA4NnFEMXwnJ7IlU5SyD_h2bz9KqenoTzXd2gCMqHY89LMFcPalwAhl9AQ0Z7JHDxMJimB_O9jrZK8l13QoxNv078K_DSx0qwAFQY0P2F05shj8SamJnL7k3OHovFHfrzZ', 'android', 1, 1, 1, 1, 1, 0, '012758', '2020-07-01 17:42:30', '2020-07-01 17:42:30'),
(84, 'Abdelmohsen20', 'Ahmedmohsen20', 'default_image.png', '0100758465', '20', 'a.mohammad@wakeb.tech', '$2y$10$EHjX6A8VhawhewEro6D6deAZdTU4h3AXT9DIJCL.6roSxYx4NFdje', 1, NULL, NULL, NULL, 'fKgvWd75piI:APA91bG7whTA4NnFEMXwnJ7IlU5SyD_h2bz9KqenoTzXd2gCMqHY89LMFcPalwAhl9AQ0Z7JHDxMJimB_O9jrZK8l13QoxNv078K_DSx0qwAFQY0P2F05shj8SamJnL7k3OHovFHfrzZ', 'android', 1, 1, 1, 1, 1, 0, '185072', '2020-07-01 17:43:38', '2020-07-01 17:43:38'),
(85, 'Abdelmohsen2020', 'Ahmedmohsen2020', 'default_image.png', '01007584654', '20', 'aha@hotmail.com', '$2y$10$ef37tgTZIAu.qM5xDcKqUOC83ioRDrvUQTvPd4IdzytXw5MXTcex.', 1, NULL, NULL, NULL, 'fKgvWd75piI:APA91bG7whTA4NnFEMXwnJ7IlU5SyD_h2bz9KqenoTzXd2gCMqHY89LMFcPalwAhl9AQ0Z7JHDxMJimB_O9jrZK8l13QoxNv078K_DSx0qwAFQY0P2F05shj8SamJnL7k3OHovFHfrzZ', 'android', 1, 1, 1, 1, 1, 0, '629570', '2020-07-01 17:53:55', '2020-07-01 17:53:55'),
(86, 'testmohsin', 'testmohsen', 'default_image.png', '01000756034', '20', 'Dr@hotmail.com', '$2y$10$gODI/e/2fmsvNqFmbAuro.bTHkrX3nE3QRxq5znJCazSRJbK9O9Aa', 1, NULL, NULL, NULL, 'fKgvWd75piI:APA91bG7whTA4NnFEMXwnJ7IlU5SyD_h2bz9KqenoTzXd2gCMqHY89LMFcPalwAhl9AQ0Z7JHDxMJimB_O9jrZK8l13QoxNv078K_DSx0qwAFQY0P2F05shj8SamJnL7k3OHovFHfrzZ', 'android', 1, 1, 1, 1, 1, 0, '354967', '2020-07-01 21:57:53', '2020-07-01 21:57:53'),
(87, 'testmohsin', 'testmohsenn', 'default_image.png', '01019584277', '20', 'anasa701@gmail.com', '$2y$10$zfj73i5n4BkKDytyWRvX5O2uHcWggdOoQC17JRsC8uXAdWL5DDaLe', 1, NULL, NULL, NULL, 'fKgvWd75piI:APA91bG7whTA4NnFEMXwnJ7IlU5SyD_h2bz9KqenoTzXd2gCMqHY89LMFcPalwAhl9AQ0Z7JHDxMJimB_O9jrZK8l13QoxNv078K_DSx0qwAFQY0P2F05shj8SamJnL7k3OHovFHfrzZ', 'android', 1, 1, 1, 1, 1, 0, '038759', '2020-07-01 22:45:19', '2020-07-01 22:45:19'),
(88, 'Adam Amr', 'AdamAmr', 'default_image.png', '01554718480', '966', 'adamamrfouad32@gmail.com', '$2y$10$GmypowELVCj.hsF3.n9NNOY5sQkVPOb981ehRg69n0RfEo3AN5wIy', 1, NULL, '104893', NULL, 'fUDvtOQlT7o:APA91bEPGTURJX53rs6P4B17gW-Y_knunOpJe81x1V24T4XceeUjgvJzAZAusUuBsSLWgRAXv0jR9UWfZYKYa0bbFzcXPm0Cm_-Bc5Gls9Da_4BP5mw7YfG0klsgClOOYZSh4Q2yvd0u', 'android', 1, 1, 1, 1, 1, 0, '412803', '2020-07-05 22:27:36', '2020-07-08 17:35:30'),
(98, 'depo', 'MahmoudZaki', 'default_image.png', '155184640', '20', 'deep2012_1st@yahoo.com', '$2y$10$3uGSB9eMH.g74jbWYp2jsuuJjyTa1NYUpYvG3hHr5OyTY3FLlO80S', 1, 'Hi men', NULL, 'en', 'd5-s3_UHXfI:APA91bFx6CPQA8pwBlImy7x1JKIWGphz1Axtk9_YO6JgRz7f_m8u2BBo2dvtAzrVjpu7xP8-5jf1J_ShU1FkWJC5TbOkGes3BuLVgniJ7MQdhyzLDqM6fxEDWN_Qrb9qhDYN2cptgs9p', 'ios', 1, 1, 1, 1, 1, 1, '523078', '2020-07-07 19:11:38', '2020-07-08 19:57:58'),
(99, 'test', 'mahmoud2', 'default_image.png', '1551846802', '20', 'zaki_deep_iphone8@yahoo.com', '$2y$10$d1xrMwwKcJzLNx5yYybNou18Y7H94xFtx25YJMtJj6yQhy5M027Zm', 1, NULL, NULL, NULL, 'fEmKxH0s108:APA91bF0OMnBBgMhqcqUciVdUiA20ZFyBkKfx6Q_Fr0rFljZJnuFoOrJsuNHNb0bYQLZhYz9PPUPFSME29wqyOIlu2UPYzrwoghZi1itvwkuNR0ShoO2r47Pu1lAnpIiR2VbIa3YRNLD', 'ios', 1, 1, 1, 1, 1, 1, '523091', '2020-07-08 08:49:26', '2020-07-09 01:58:58'),
(100, 'eldesoky', 'eldesoky', 'default_image.png', '01118042221', '20', 'eldesoky@gmail.com', '$2y$10$HcFL51MekwEFxDz5EcafJedY0Zm9RjYd0V4atnBlKD7Kkah3hwPeG', 1, NULL, NULL, NULL, 'cP5Gp-Ax90E:APA91bGKcNtlNMwi1-hRTXqh3MtHjCQS-g7ekli6auZVkVxLANYxr0xex399mZeOrDYOjdc0GKzW2Er4Ho6pDfoJcFXQfnNnp33lO4yRbjlWdokgJX_Xqsu99YBL6Id89irSOGQPLBH8', 'android', 1, 1, 1, 1, 1, 1, '038527', '2020-07-10 18:03:24', '2020-07-10 18:04:25'),
(101, 'Khaled', 'Khaled', 'default_image.png', '552050150', '966', 'Kra.1023.km@gmail.com', '$2y$10$XORwy0LjfO3mjkciAUil3uiAsLC2HeY7/bb9iW0TqxeIxiu2/M7iu', 1, NULL, NULL, NULL, 'c4yBuO1iZlg:APA91bFW4b3ec0ktdVKVY8xR4wpm5yzBAdAvSNb7-ASpv3mfsQE0cvN32PR0Od4BsFjL-BA-uf2XzmSQd8XXADZukWwj1lzfTyUDrPIzw-hX4KroQtT1JuhjOTAH6_tLgP5hACptvGL-', 'ios', 1, 1, 1, 1, 1, 1, '538049', '2020-07-13 08:58:50', '2020-07-13 08:59:30');

-- --------------------------------------------------------

--
-- Table structure for table `publishings`
--

CREATE TABLE `publishings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `block` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `privacy` enum('public','private','flowers') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `type` enum('publisher','share') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publisher',
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `trip_id` bigint(20) UNSIGNED NOT NULL,
  `sharer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `risks`
--

CREATE TABLE `risks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_image.png',
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `risk_type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `risk_comments`
--

CREATE TABLE `risk_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vote` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `risk_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `risk_types`
--

CREATE TABLE `risk_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_image.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `risk_types`
--

INSERT INTO `risk_types` (`id`, `name_ar`, `name_en`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'صخره', 'Rock', 'default_image.png', '2020-03-11 18:30:51', '2020-03-11 18:30:51');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `about_ar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms_ar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `whats` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linked` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `about_ar`, `about_en`, `terms_ar`, `terms_en`, `mobile`, `whats`, `youtube`, `facebook`, `twitter`, `linked`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'Test', 'Test', 'Test', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `spots`
--

CREATE TABLE `spots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subcity_id` bigint(20) UNSIGNED DEFAULT NULL,
  `locality_id` bigint(20) UNSIGNED DEFAULT NULL,
  `journal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `spots`
--

INSERT INTO `spots` (`id`, `title`, `publisher_id`, `location`, `desc`, `lat`, `lng`, `country_id`, `city_id`, `subcity_id`, `locality_id`, `journal_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 'مدينة مكة المكرمة', 3, '4829, Ash Shuhada, Makkah 24222 7285, Saudi Arabia', 'مدينة مكة المكرمة أم القري بها المسجد الحرام و الكعبة التي تعد قبلة المسلمين', 21.450790669674053, 39.80911787599325, 6, 4, 4, 7, NULL, 1, '2020-07-02 08:11:39', '2020-07-02 08:11:39'),
(3, 'المدينة المنورة', 3, 'Az Zahrah, Medina Saudi Arabia', 'المدينة المنورة أول عاصمة في تاريخ الإسلام وتاني أقدس الاماكن بعد مكة المكرمة', 24.524169054686823, 39.56918690353632, 6, 5, 5, 8, NULL, 1, '2020-07-02 08:17:09', '2020-07-02 08:17:09'),
(4, 'مدينة جازان', 3, 'Jazan 82722, Saudi Arabia', 'مدينة جازان تقع اقصي الجنوب الغربي للمملكة العربية السعودية', 16.88935852341677, 42.570567391812794, 6, 6, 6, 9, NULL, 1, '2020-07-02 08:20:47', '2020-07-02 08:20:47'),
(5, 'مدينة الدرعية', 3, '8138 سعيد بن زيد، Al Diriyah Al Jadidah, Riyadh 13734 4653, Saudi Arabia', 'تشتهر مدينة الدرعية بعمارتها التقليدية َتعتبر من أهم تراث المملكة العربية السعودية واحد المقاصد السياحية الهامة', 24.748119878551623, 46.536334455013275, 6, 7, 7, 10, NULL, 1, '2020-07-02 08:24:27', '2020-07-02 08:24:27'),
(6, 'مدينة جدة', 3, 'Jeddah Airport، Gvhjkkk، Jeddah 22237, Saudi Arabia', 'مدينة جدة أحدي أهم مدن المملكة العربية السعودية تقع على ساحل البحر الأحمر', 21.485810890733177, 39.1925048455596, 6, 4, 8, 11, NULL, 1, '2020-07-02 08:29:17', '2020-07-02 08:29:17'),
(7, 'جدة', 3, 'Jeddah Airport، Gvhjkkk، Jeddah 22237, Saudi Arabia', 'مدينة جدة من أهم مدن المملكة العربية السعودية تقع على ساحل البحر الأحمر', 21.485810890733177, 39.1925048455596, 6, 4, 8, 11, NULL, 1, '2020-07-02 09:58:20', '2020-07-02 09:58:20'),
(8, 'الدرعية', 3, '8138 سعيد بن زيد، Al Diriyah Al Jadidah, Riyadh 13734 4653, Saudi Arabia', 'مدينة الدرعية أحد أهم المناطق التراثية بالرياض', 24.748119878551623, 46.536334455013275, 6, 7, 7, 10, NULL, 1, '2020-07-02 10:04:06', '2020-07-02 10:04:06'),
(20, 'pyramids', 98, 'Egypt, Giza', 'Wow 🤩 🤩🤩🤩🤩\nEgyptain pyramids is so cool 😎 \nMy friends all must saw this 😍😍😍😍', 30.012264679966776, 31.206629164516922, 1, 10, 11, 12, 3, 1, '2020-07-07 21:51:33', '2020-07-07 21:52:28'),
(21, 'templates', 98, 'Egypt, El Shawarby El Gedid, Sheyakha Olah', 'I really like this app\nI share all my pictures on it \nThanks very much 🌹🌹', 24.08744873793455, 32.899814173579216, 1, 11, 12, 13, 3, 1, '2020-07-07 22:10:28', '2020-07-07 22:10:28'),
(22, 'madrid', 98, 'Spain, Madrid', 'Hala madrid ❤️❤️', 40.46075881427065, -3.749856948852539, 7, 8, 10, NULL, NULL, 1, '2020-07-07 22:19:43', '2020-07-07 22:19:43'),
(24, 'الرياض وجمالها', 99, 'Saudi Arabia, Wadi Hanifah Street, 9159, Riyadh', 'مدينة جميلة واهلها طيبون انبسط كتير الحمد لله ❤️❤️❤️❤️❤️', 24.707781780076143, 46.67529568076134, 6, 12, 13, 14, 5, 1, '2020-07-13 08:41:10', '2020-07-13 08:41:10'),
(25, 'مكة المكرمة اجمل يوم فى عمرى', 99, 'Saudi Arabia, Mecca', 'عن جمال الكعبه اتحدث ربنا ييسر لي امورى 🌹', 21.383168273171723, 39.857911951839924, 6, 13, 14, NULL, 5, 1, '2020-07-13 08:44:09', '2020-07-13 08:44:09'),
(26, 'عين قحطان', 6, 'Unnamed Road, Ayn Qahtan Saudi Arabia', 'مكان رائع جدا', 18.92740575405108, 44.061556085944176, 6, 14, 15, 15, NULL, 1, '2020-07-13 09:15:42', '2020-07-13 09:15:42'),
(27, 'عين جوفية', 6, 'Unnamed Road, Ayn Qahtan Saudi Arabia', 'منظر رائع', 18.92459802052774, 44.06108435243368, 6, 14, 15, 15, NULL, 1, '2020-07-13 09:18:44', '2020-07-13 09:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `spot_tag`
--

CREATE TABLE `spot_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `spot_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_image.png',
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `temporay_password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `verified` int(11) NOT NULL DEFAULT '1',
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_places`
--

CREATE TABLE `store_places` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_image.png',
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_types`
--

CREATE TABLE `store_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_image.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `store_types`
--

INSERT INTO `store_types` (`id`, `name_ar`, `name_en`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'مطاعم', 'restaurnt', 'default_image.png', '2020-03-11 18:30:51', '2020-03-11 18:30:51'),
(2, 'كافيه', 'coffee shop', 'default_image.png', '2020-03-11 18:30:51', '2020-03-11 18:30:51');

-- --------------------------------------------------------

--
-- Table structure for table `subcities`
--

CREATE TABLE `subcities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcities`
--

INSERT INTO `subcities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Tanta', '2020-04-23 12:40:38', '2020-04-23 12:40:38'),
(2, 'Quṭūr', '2020-04-23 12:58:32', '2020-04-23 12:58:32'),
(3, 'San Francisco', '2020-04-23 13:20:06', '2020-04-23 13:20:06'),
(4, 'Makka Almokarama', '2020-07-02 08:11:39', '2020-07-02 08:11:39'),
(5, 'Al Madina Almonoara', '2020-07-02 08:17:09', '2020-07-02 08:17:09'),
(6, 'Gazan', '2020-07-02 08:20:47', '2020-07-02 08:20:47'),
(7, 'Al Riyadh', '2020-07-02 08:24:27', '2020-07-02 08:24:27'),
(8, 'Jeddah', '2020-07-02 08:29:17', '2020-07-02 08:29:17'),
(9, 'Los Altos Hills', '2020-07-07 19:20:35', '2020-07-07 19:20:35'),
(10, 'Madrid', '2020-07-07 19:39:08', '2020-07-07 19:39:08'),
(11, 'Giza', '2020-07-07 21:51:33', '2020-07-07 21:51:33'),
(12, 'Sheyakha Olah', '2020-07-07 22:10:28', '2020-07-07 22:10:28'),
(13, 'Riyadh', '2020-07-13 08:41:10', '2020-07-13 08:41:10'),
(14, 'Mecca', '2020-07-13 08:44:09', '2020-07-13 08:44:09'),
(15, 'Tathlith', '2020-07-13 09:15:42', '2020-07-13 09:15:42');

-- --------------------------------------------------------

--
-- Table structure for table `suggests`
--

CREATE TABLE `suggests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lng` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_image.png',
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tag_spot`
--

CREATE TABLE `tag_spot` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `spot_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name_ar`, `name_en`, `created_at`, `updated_at`) VALUES
(1, 'ترفيهي', 'Entertainment', '2020-04-15 18:09:50', '2020-04-15 18:09:50'),
(2, 'رياضي', 'Sport', '2020-04-15 18:28:37', '2020-04-15 18:28:37'),
(3, 'ثقافي', 'cultural', '2020-04-15 18:29:25', '2020-04-15 18:29:25');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_lat` double NOT NULL,
  `start_lng` double NOT NULL,
  `start_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_lat` double NOT NULL,
  `end_lng` double NOT NULL,
  `end_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map_screen_shot` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_image.png',
  `distance` double NOT NULL,
  `estimated_duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ended_at` timestamp NULL DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `privacy` enum('public','private','flowers') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trip_resources`
--

CREATE TABLE `trip_resources` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('image','vedio') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `resource` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `lat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trip_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'adminstrator', 'admin@admin.com', NULL, '$2y$10$HIfB35woQgppgp51O8dZjeeBVM9YcE.QFuiBgBzyKcAR7N/vNBxAG', NULL, '2020-03-11 18:31:12', '2020-03-11 18:31:12'),
(2, 'adminstrator', 'ad@admin.com', NULL, '$2y$10$uj/YC.21FtWR/kvZAFW/g.b9Mvh5T54NmrFppUXB48Xa6XWLSqDOC', NULL, '2020-04-15 16:42:48', '2020-04-15 16:42:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blocks_user_id_foreign` (`user_id`),
  ADD KEY `blocks_publisher_id_foreign` (`publisher_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cities_name_unique` (`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_publisher_id_foreign` (`publisher_id`),
  ADD KEY `comments_spot_id_foreign` (`spot_id`);

--
-- Indexes for table `comment_suggests`
--
ALTER TABLE `comment_suggests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_suggests_user_id_foreign` (`user_id`),
  ADD KEY `comment_suggests_suggest_id_foreign` (`suggest_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_publisher_id_foreign` (`publisher_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_name_unique` (`name`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_category_id_foreign` (`category_id`),
  ADD KEY `events_place_id_foreign` (`place_id`);

--
-- Indexes for table `event_categories`
--
ALTER TABLE `event_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_files`
--
ALTER TABLE `event_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_files_event_id_foreign` (`event_id`);

--
-- Indexes for table `event_hash`
--
ALTER TABLE `event_hash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_publisher`
--
ALTER TABLE `event_publisher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_topic`
--
ALTER TABLE `event_topic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favourites_publisher_id_foreign` (`publisher_id`),
  ADD KEY `favourites_spot_id_foreign` (`spot_id`);

--
-- Indexes for table `favourits`
--
ALTER TABLE `favourits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favourits_user_id_foreign` (`user_id`),
  ADD KEY `favourits_publishing_id_foreign` (`publishing_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_spot_id_foreign` (`spot_id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `followers_follower_id_foreign` (`follower_id`),
  ADD KEY `followers_follow_id_foreign` (`follow_id`);

--
-- Indexes for table `hashes`
--
ALTER TABLE `hashes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hash_spot`
--
ALTER TABLE `hash_spot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interests_publisher_id_foreign` (`publisher_id`),
  ADD KEY `interests_event_id_foreign` (`event_id`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journals_publisher_id_foreign` (`publisher_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_publisher_id_foreign` (`publisher_id`),
  ADD KEY `likes_spot_id_foreign` (`spot_id`);

--
-- Indexes for table `like_suggests`
--
ALTER TABLE `like_suggests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `like_suggests_user_id_foreign` (`user_id`),
  ADD KEY `like_suggests_suggest_id_foreign` (`suggest_id`);

--
-- Indexes for table `localities`
--
ALTER TABLE `localities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `localities_name_unique` (`name`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locations_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `log_activities`
--
ALTER TABLE `log_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_activities_publisher_id_foreign` (`publisher_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `publishers_email_unique` (`email`),
  ADD UNIQUE KEY `publishers_mobile_unique` (`mobile`);

--
-- Indexes for table `publishings`
--
ALTER TABLE `publishings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `publishings_publisher_id_foreign` (`publisher_id`),
  ADD KEY `publishings_trip_id_foreign` (`trip_id`),
  ADD KEY `publishings_sharer_id_foreign` (`sharer_id`);

--
-- Indexes for table `risks`
--
ALTER TABLE `risks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `risks_publisher_id_foreign` (`publisher_id`),
  ADD KEY `risks_risk_type_id_foreign` (`risk_type_id`);

--
-- Indexes for table `risk_comments`
--
ALTER TABLE `risk_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `risk_comments_publisher_id_foreign` (`publisher_id`),
  ADD KEY `risk_comments_risk_id_foreign` (`risk_id`);

--
-- Indexes for table `risk_types`
--
ALTER TABLE `risk_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spots`
--
ALTER TABLE `spots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `spots_publisher_id_foreign` (`publisher_id`),
  ADD KEY `spots_journal_id_foreign` (`journal_id`),
  ADD KEY `spots_country_id_foreign` (`country_id`),
  ADD KEY `spots_city_id_foreign` (`city_id`),
  ADD KEY `spots_subcity_id_foreign` (`subcity_id`),
  ADD KEY `spots_locality_id_foreign` (`locality_id`);

--
-- Indexes for table `spot_tag`
--
ALTER TABLE `spot_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `spot_tag_tag_id_foreign` (`tag_id`),
  ADD KEY `spot_tag_spot_id_foreign` (`spot_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stores_store_name_unique` (`store_name`),
  ADD UNIQUE KEY `stores_mobile_unique` (`mobile`),
  ADD UNIQUE KEY `stores_email_unique` (`email`),
  ADD KEY `stores_store_type_id_foreign` (`store_type_id`);

--
-- Indexes for table `store_places`
--
ALTER TABLE `store_places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_places_store_id_foreign` (`store_id`);

--
-- Indexes for table `store_types`
--
ALTER TABLE `store_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcities`
--
ALTER TABLE `subcities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subcities_name_unique` (`name`);

--
-- Indexes for table `suggests`
--
ALTER TABLE `suggests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suggests_user_id_foreign` (`user_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_spot`
--
ALTER TABLE `tag_spot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag_spot_spot_id_foreign` (`spot_id`),
  ADD KEY `tag_spot_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trips_publisher_id_foreign` (`publisher_id`);

--
-- Indexes for table `trip_resources`
--
ALTER TABLE `trip_resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trip_resources_trip_id_foreign` (`trip_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `comment_suggests`
--
ALTER TABLE `comment_suggests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `event_categories`
--
ALTER TABLE `event_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event_files`
--
ALTER TABLE `event_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `event_hash`
--
ALTER TABLE `event_hash`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event_publisher`
--
ALTER TABLE `event_publisher`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `event_topic`
--
ALTER TABLE `event_topic`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `favourits`
--
ALTER TABLE `favourits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hashes`
--
ALTER TABLE `hashes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hash_spot`
--
ALTER TABLE `hash_spot`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interests`
--
ALTER TABLE `interests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `like_suggests`
--
ALTER TABLE `like_suggests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `localities`
--
ALTER TABLE `localities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `log_activities`
--
ALTER TABLE `log_activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `publishings`
--
ALTER TABLE `publishings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `risks`
--
ALTER TABLE `risks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `risk_comments`
--
ALTER TABLE `risk_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `risk_types`
--
ALTER TABLE `risk_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `spots`
--
ALTER TABLE `spots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `spot_tag`
--
ALTER TABLE `spot_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_places`
--
ALTER TABLE `store_places`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_types`
--
ALTER TABLE `store_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subcities`
--
ALTER TABLE `subcities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `suggests`
--
ALTER TABLE `suggests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag_spot`
--
ALTER TABLE `tag_spot`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trip_resources`
--
ALTER TABLE `trip_resources`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blocks`
--
ALTER TABLE `blocks`
  ADD CONSTRAINT `blocks_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blocks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_spot_id_foreign` FOREIGN KEY (`spot_id`) REFERENCES `spots` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comment_suggests`
--
ALTER TABLE `comment_suggests`
  ADD CONSTRAINT `comment_suggests_suggest_id_foreign` FOREIGN KEY (`suggest_id`) REFERENCES `suggests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_suggests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `event_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `events_place_id_foreign` FOREIGN KEY (`place_id`) REFERENCES `locations` (`id`);

--
-- Constraints for table `event_files`
--
ALTER TABLE `event_files`
  ADD CONSTRAINT `event_files_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favourites_spot_id_foreign` FOREIGN KEY (`spot_id`) REFERENCES `spots` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favourits`
--
ALTER TABLE `favourits`
  ADD CONSTRAINT `favourits_publishing_id_foreign` FOREIGN KEY (`publishing_id`) REFERENCES `publishings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favourits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_spot_id_foreign` FOREIGN KEY (`spot_id`) REFERENCES `spots` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_follow_id_foreign` FOREIGN KEY (`follow_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `followers_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `interests`
--
ALTER TABLE `interests`
  ADD CONSTRAINT `interests_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `interests_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `journals`
--
ALTER TABLE `journals`
  ADD CONSTRAINT `journals_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_spot_id_foreign` FOREIGN KEY (`spot_id`) REFERENCES `spots` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `like_suggests`
--
ALTER TABLE `like_suggests`
  ADD CONSTRAINT `like_suggests_suggest_id_foreign` FOREIGN KEY (`suggest_id`) REFERENCES `suggests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `like_suggests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `log_activities`
--
ALTER TABLE `log_activities`
  ADD CONSTRAINT `log_activities_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `publishings`
--
ALTER TABLE `publishings`
  ADD CONSTRAINT `publishings_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `publishings_sharer_id_foreign` FOREIGN KEY (`sharer_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `publishings_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `risks`
--
ALTER TABLE `risks`
  ADD CONSTRAINT `risks_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `risks_risk_type_id_foreign` FOREIGN KEY (`risk_type_id`) REFERENCES `risk_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `risk_comments`
--
ALTER TABLE `risk_comments`
  ADD CONSTRAINT `risk_comments_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `risk_comments_risk_id_foreign` FOREIGN KEY (`risk_id`) REFERENCES `risks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `spots`
--
ALTER TABLE `spots`
  ADD CONSTRAINT `spots_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `spots_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `spots_journal_id_foreign` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `spots_locality_id_foreign` FOREIGN KEY (`locality_id`) REFERENCES `localities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `spots_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `spots_subcity_id_foreign` FOREIGN KEY (`subcity_id`) REFERENCES `subcities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `spot_tag`
--
ALTER TABLE `spot_tag`
  ADD CONSTRAINT `spot_tag_spot_id_foreign` FOREIGN KEY (`spot_id`) REFERENCES `spots` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `spot_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_store_type_id_foreign` FOREIGN KEY (`store_type_id`) REFERENCES `store_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `store_places`
--
ALTER TABLE `store_places`
  ADD CONSTRAINT `store_places_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `suggests`
--
ALTER TABLE `suggests`
  ADD CONSTRAINT `suggests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tag_spot`
--
ALTER TABLE `tag_spot`
  ADD CONSTRAINT `tag_spot_spot_id_foreign` FOREIGN KEY (`spot_id`) REFERENCES `spots` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tag_spot_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `trip_resources`
--
ALTER TABLE `trip_resources`
  ADD CONSTRAINT `trip_resources_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
