-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3308
-- Generation Time: Mar 02, 2024 at 01:28 PM
-- Server version: 8.3.0
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `netercorp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `firstname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lastname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `admin_email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `admin_password` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `firstname`, `lastname`, `image`, `admin_email`, `admin_password`) VALUES
(1, '', 'Admin', 'jamesavatar.png', 'admin@goldenstone.online', '$2y$10$zfj2exOs9sT9IJv3qGl/reczotOimfIedXGe.ySadMRjxyWS/UxeC');

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `device` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ipAddress` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `datenow` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `user_id`, `device`, `ipAddress`, `datenow`) VALUES
(1, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', '105.112.102.202', '2023-04-02 20:33:26'),
(2, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', '105.112.214.65', '2023-04-03 06:22:55'),
(3, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '154.160.22.195', '2023-04-12 09:36:51'),
(4, 3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '154.160.22.195', '2023-04-13 07:57:38'),
(5, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', '105.112.212.173', '2023-04-14 05:04:10'),
(6, 4, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.2 Mobile/15E148 Safari/604.1', '102.91.5.91', '2023-08-12 08:44:38'),
(7, 4, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_1_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Mobile/15E148 Safari/604.1', '197.210.70.227', '2023-08-12 08:54:16'),
(8, 4, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) FxiOS/110.1  Mobile/15E148 Safari/605.1.15', '102.91.5.91', '2023-08-12 08:58:44'),
(9, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0', '102.89.32.87', '2023-08-12 09:15:12'),
(10, 4, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) FxiOS/110.1  Mobile/15E148 Safari/605.1.15', '197.210.70.82', '2023-08-12 09:36:22'),
(11, 4, 'Mozilla/5.0 (Linux; Android 13; SM-N986N Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/115.0.5790.166 Mobile Safari/537.36 Line/13.12.0/IAB', '116.44.147.184', '2023-08-12 09:57:21'),
(12, 4, 'Mozilla/5.0 (Linux; Android 13; SM-N986N Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/115.0.5790.166 Mobile Safari/537.36 Line/13.12.0/IAB', '116.44.147.184', '2023-08-12 09:57:25'),
(13, 4, 'Mozilla/5.0 (Linux; Android 13; SM-N986N Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/115.0.5790.166 Mobile Safari/537.36;KAKAOTALK 2410330', '116.44.147.184', '2023-08-12 10:00:12'),
(14, 4, 'Mozilla/5.0 (Linux; Android 13; SM-N986N Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/115.0.5790.166 Mobile Safari/537.36;KAKAOTALK 2410330', '116.44.147.184', '2023-08-12 10:00:17'),
(15, 4, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0', '102.91.5.90', '2023-08-13 04:05:35'),
(16, 5, 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.2 Mobile/15E148 Safari/604.1', '197.210.71.140', '2023-08-13 04:52:17'),
(17, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0', '105.112.211.3', '2023-08-14 10:35:48'),
(18, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0', '105.112.211.249', '2023-08-14 13:55:47'),
(19, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '::1', '2024-03-01 07:08:37'),
(20, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '::1', '2024-03-01 09:44:04'),
(21, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '127.0.0.1', '2024-03-01 14:03:35'),
(22, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '127.0.0.1', '2024-03-01 14:49:03'),
(23, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '127.0.0.1', '2024-03-02 10:28:41'),
(24, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '127.0.0.1', '2024-03-02 10:35:54'),
(25, 6, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '127.0.0.1', '2024-03-02 11:17:25'),
(26, 6, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '127.0.0.1', '2024-03-02 11:39:47'),
(27, 6, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '127.0.0.1', '2024-03-02 11:40:22'),
(28, 6, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '127.0.0.1', '2024-03-02 11:40:56'),
(29, 2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '127.0.0.1', '2024-03-02 11:41:08'),
(30, 6, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '127.0.0.1', '2024-03-02 11:43:37'),
(31, 6, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '127.0.0.1', '2024-03-02 11:47:06');

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `id` int NOT NULL,
  `seria_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `card_number` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `card_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `card_expiration` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `card_security` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `card_limit` double NOT NULL DEFAULT '5000',
  `card_limit_remain` double NOT NULL DEFAULT '5000',
  `card_status` int NOT NULL DEFAULT '2' COMMENT '1=Active,2=Process,3=hold, 4=PAUSE',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`id`, `seria_key`, `user_id`, `card_number`, `card_name`, `card_expiration`, `card_security`, `card_limit`, `card_limit_remain`, `card_status`, `createdAt`) VALUES
(1, 'CARD6436846598f32', 3, '6294 1986 7045 8927', 'Lukas W Maurer', '07/26', '897', 5000, 5000, 4, '2023-04-12 10:13:57'),
(2, 'CARD64368535230f3', 3, '6294 1986 7045 8927', 'Lukas W Maurer', '07/26', '897', 5000, 5000, 4, '2023-04-12 10:17:25');

-- --------------------------------------------------------

--
-- Table structure for table `card_request`
--

CREATE TABLE `card_request` (
  `id` int NOT NULL,
  `reference_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `card_type` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `card_reason` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `card_request_status` int NOT NULL DEFAULT '2',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `card_request`
--

INSERT INTO `card_request` (`id`, `reference_id`, `user_id`, `card_type`, `card_reason`, `card_request_status`, `createdAt`) VALUES
(1, 'card64368493e63b5', 3, 'mastercard', 'I need that for my international transactions', 2, '2023-04-12 10:14:43'),
(2, 'card643684c69be2b', 3, 'mastercard', 'I need that for my international transactions', 2, '2023-04-12 10:15:34');

-- --------------------------------------------------------

--
-- Table structure for table `crypto_currency`
--

CREATE TABLE `crypto_currency` (
  `id` int NOT NULL,
  `crypto_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `wallet_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `crypto_currency`
--

INSERT INTO `crypto_currency` (`id`, `crypto_name`, `wallet_address`, `created_at`) VALUES
(1, 'Bitcoin', 'sfsdfsfsd', '2021-10-08 11:05:42'),
(43, 'Dogecoin', 'sfsfsdf', '2021-11-01 15:39:41'),
(46, 'Paxful Wallet', 'sfsdfsdf', '2021-11-03 10:59:51'),
(47, 'Paypal', 'pafapdfasd', '2021-11-11 13:26:42');

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `d_id` int NOT NULL,
  `user_id` int NOT NULL,
  `refrence_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `amount` double NOT NULL,
  `wallet_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `crypto_id` int NOT NULL,
  `crypto_status` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `domestic_transfer`
--

CREATE TABLE `domestic_transfer` (
  `dom_id` int NOT NULL,
  `acct_id` int DEFAULT NULL,
  `refrence_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `bank_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `acct_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `acct_number` int NOT NULL,
  `trans_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'domestic transfer',
  `acct_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acct_remarks` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `dom_status` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `domestic_transfer`
--

INSERT INTO `domestic_transfer` (`dom_id`, `acct_id`, `refrence_id`, `amount`, `bank_name`, `acct_name`, `acct_number`, `trans_type`, `acct_type`, `acct_remarks`, `dom_status`, `created_at`) VALUES
(11, 2, '642a71c92323e', 100, 'Standard chartered bank', 'Daniel Josh', 2147483647, 'domestic transfer', 'Savings', 'Your school fees', 1, '2023-04-03 06:27:21'),
(12, 3, '6436864132c4e', 40000, 'VACU', 'James Thomas', 2147483647, 'domestic transfer', 'Checking', 'Paid for my machinery maintenance.', 1, '2023-04-12 10:21:53'),
(13, 3, '643686af68775', 40000, 'VACU', 'James Thomas', 2147483647, 'domestic transfer', 'Checking', 'Paid for my machinery maintenance.', 1, '2023-04-12 10:23:43'),
(14, 3, '643688025fc80', 54000, 'VACU', 'James Thomas', 2147483647, 'domestic transfer', 'Checking', 'Machinery bills', 1, '2023-04-12 10:29:22'),
(15, 2, '64da129a9194c', 1234, 'ss', 'sss', 324532534, 'domestic transfer', 'Online Banking', 'sfds', 0, '2023-08-14 12:40:10');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan_id` int NOT NULL,
  `loan_reference_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `acct_id` int NOT NULL,
  `amount` double DEFAULT '0',
  `loan_remarks` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `loan_status` int NOT NULL DEFAULT '0',
  `loan_message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `about_us` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `url_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `url_tel` varchar(15) DEFAULT NULL,
  `url_email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `trans_limit_min` double DEFAULT NULL,
  `trans_limit_max` double DEFAULT NULL,
  `livechat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Live Widget'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `image`, `about_us`, `url_name`, `url_tel`, `url_email`, `trans_limit_min`, `trans_limit_max`, `livechat`) VALUES
(1, 'favicon.png', 'Online Banking With Cot, Imf, Tax & Token Code', 'Goldenstone', '+1469 218-9994', 'support@goldenstonefinance.online', 500, 500000, 'https://code.tidio.co/kfbwher8c2u39zo5o9pnxxcx1aunk8o3.js');

-- --------------------------------------------------------

--
-- Table structure for table `temp_trans`
--

CREATE TABLE `temp_trans` (
  `wire_id` int NOT NULL,
  `acct_id` int DEFAULT NULL,
  `trans_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `bank_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `acct_name_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `acct_number` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `trans_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'wire transfer',
  `acct_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `acct_country` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `acct_swift` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `acct_routing` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `acct_remarks` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `wire_status` int NOT NULL DEFAULT '0',
  `trans_otp` int DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `temp_trans`
--

INSERT INTO `temp_trans` (`wire_id`, `acct_id`, `trans_id`, `amount`, `bank_name`, `acct_name_id`, `acct_number`, `trans_type`, `acct_type`, `acct_country`, `acct_swift`, `acct_routing`, `acct_remarks`, `wire_status`, `trans_otp`, `createdAt`) VALUES
(1, 2, '642a71b771f39', 100, 'Standard chartered bank', 'Daniel Josh', '6789456732', 'domestic transfer', 'Savings', NULL, NULL, NULL, 'Your school fees', 0, 247480, '2023-04-03 06:27:03'),
(2, 2, '642a73b37684e', 500, 'Standard chartered bank', 'Daniel Josh', '3245235234', 'wire transfer', 'Fixed Deposit', 'Belgium', '2345345', '23453245', 'Flight funds', 0, 212287, '2023-04-03 06:35:31'),
(3, 3, '643682cac5d63', 100000, 'Chase', 'James Thomas', '9765436984', 'domestic transfer', 'Checking', NULL, NULL, NULL, 'Space project tools', 0, 219350, '2023-04-12 10:07:06'),
(4, 3, '643686029400b', 40000, 'VACU', 'James Thomas', '9875836345', 'domestic transfer', 'Checking', NULL, NULL, NULL, 'Paid for my machinery maintenance.', 0, 289347, '2023-04-12 10:20:50'),
(5, 3, '643687d90dc23', 54000, 'VACU', 'James Thomas', '7654568766', 'domestic transfer', 'Checking', NULL, NULL, NULL, 'Machinery bills', 0, 328255, '2023-04-12 10:28:41'),
(6, 3, '64368aed10d19', 250000, 'Woodforest', 'Wilson Peters', '0875847474', 'wire transfer', 'Current', 'United States of America', '37826', '465734678', 'Space machinery', 0, 316941, '2023-04-12 10:41:49'),
(7, 4, '64d865686a73e', 2000, 'central bank', 'john yen', '78387489', 'wire transfer', 'Savings', 'China', 'dkidsxxx', '44332', 'personal business', 0, 348688, '2023-08-13 06:08:56'),
(8, 2, '64da12510ba7e', 1234, 'ss', 'sss', '324532534', 'domestic transfer', 'Online Banking', NULL, NULL, NULL, 'sfds', 0, 138155, '2023-08-14 12:38:57');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `trans_id` int NOT NULL,
  `user_id` int NOT NULL,
  `refrence_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `trans_type` int NOT NULL,
  `sender_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `trans_status` int NOT NULL DEFAULT '0',
  `created_at` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `time_created` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`trans_id`, `user_id`, `refrence_id`, `amount`, `trans_type`, `sender_name`, `description`, `trans_status`, `created_at`, `time_created`) VALUES
(1, 2, '642a7155cb8a8', 100000, 1, 'John Wills', 'for your flight tickek', 0, '2020-10-04', '12:56'),
(2, 3, '6436821fb758e', 5490000, 1, 'ESA contractors', 'Project contract', 0, '2018-10-23', '12:54'),
(3, 3, '643682922d5da', 2500000, 1, 'IAF space suits contract ltd', 'Contracts for spacesuit provision for National Space agencies', 0, '2022-12-01', '03:34'),
(4, 4, '64d7556213201', 2500000, 1, 'Kim won ', 'NEW YEAR CONTRACT ', 0, '2023-08-11', '14:47'),
(5, 4, '64d75689ba5c6', 500000, 2, 'Elton Parker ', 'For oil and gas ', 0, '2023-08-01', '05:52'),
(6, 4, '64d7612c810a7', 2000000, 1, 'CANADA ', 'FOR RUBBY ', 0, '2023-07-20', '18:37'),
(7, 2, '64da11f2b1860', 1000, 1, 'admin', 'd', 0, '2023-08-14', '16:37'),
(8, 2, '64da12267fad4', 400000000000, 1, 'ss', 's', 0, '2023-08-09', '12:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `acct_username` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `firstname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lastname` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `acct_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `billing_code` int NOT NULL DEFAULT '0' COMMENT '0=deactive,1=active',
  `acct_balance` double DEFAULT '0',
  `loan_balance` double DEFAULT '0',
  `acct_limit` double DEFAULT NULL,
  `limit_remain` double DEFAULT NULL,
  `acct_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `acct_gender` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `marital_status` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `acct_currency` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `acct_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'active' COMMENT 'active, hold',
  `acct_email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `acct_phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `acct_occupation` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `acct_dob` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `ssn` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `frontID` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `backID` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `country` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `state` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `acct_password` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `acct_pin` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `acct_otp` int DEFAULT NULL,
  `acct_cot` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `acct_imf` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `acct_tax` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mgr_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `mgr_no` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `mgr_email` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `mgr_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `mgr_image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `acct_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `acct_username`, `firstname`, `lastname`, `image`, `acct_no`, `billing_code`, `acct_balance`, `loan_balance`, `acct_limit`, `limit_remain`, `acct_type`, `acct_gender`, `marital_status`, `acct_currency`, `acct_status`, `acct_email`, `acct_phone`, `acct_occupation`, `acct_dob`, `ssn`, `frontID`, `backID`, `country`, `state`, `acct_password`, `acct_pin`, `acct_otp`, `acct_cot`, `acct_imf`, `acct_tax`, `mgr_name`, `mgr_no`, `mgr_email`, `mgr_id`, `mgr_image`, `acct_address`, `createdAt`) VALUES
(2, 'bryte', 'Bright', 'david', '1680502888d.jpeg', '1234567890', 1, 399999, 0, 0, -1834, 'Savings', 'male', '', 'USD', 'active', 'brytedree@gmail.com', '23407038367621', 'web developer', '2023-04-02', '1234567890', '1680502888d.jpeg', '1680502888d.jpeg', 'Nigeria', 'manchester', '$2y$10$zfj2exOs9sT9IJv3qGl/reczotOimfIedXGe.ySadMRjxyWS/UxeC', '1234', 355043, '3434', '5656', '2323', '', '', '', '', NULL, 'wishville 44 london manchester 34543', '2023-04-03 06:21:28'),
(3, 'lukasmaurer', 'Lukas W', 'Maurer', '1681290892WhatsApp Image 2023-03-04 at 6.24.39 AM (5).jpeg', '9909341545', 0, NULL, 0, 500000, 116000, 'Savings', 'male', '', 'USD', 'active', 'lukaswmaurer@gmail.com', '3237962085', 'Spaceman, Engineer..', '1960-10-01', '594988519', '1681290892WhatsApp Image 2023-03-04 at 6.24.42 AM (1).jpeg', '1681290892WhatsApp Image 2023-03-04 at 6.18.46 AM (4).jpeg', 'United States of America', 'California ', '$2y$10$.gVqJJpzZN2ZSUiBaOkoV.KYqh4afNbGnAMfroNd0S.lx8.A52Xwi', '1234', 304014, '', '', '', '', '', '', '', NULL, '4330 Rosemont Avenue 102 Long Beach California  90802', '2023-04-12 09:14:52'),
(4, '', 'David', 'Hyun', '9909290604DDD5E26A-E035-4792-BF7A-10587319D282.jpeg', '9909290604', 1, NULL, 0, 31500000, 31500000, 'Savings', 'Select Gender', 'single', 'USD', 'active', 'davidhyun71@gmail.com', '18125595266', 'BUSINESS', '1981-07-19', '855', NULL, NULL, 'United States of America', 'NEW YORK', '$2y$10$aMt05bFvLk9EMak4ZepkveBCTetjdvyVtDv8.vuM05KT.D5ZNinv.', '9587', 279667, '5242', '21692', '10001', 'David', '682936628', 'davidhyun71@gmail.com', '5242', 'account1.png', '12 East 63rd Street, Upper East Side, Manhattan New York.', '2023-08-12 10:39:24'),
(5, '', 'Kyong', 'jeong', '9909153242FD6F6E2C-842A-4993-8C97-B30D509D458C.jpeg', '9909153242', 0, NULL, 0, 50500000, 50500000, 'Savings', 'male', 'single', 'USD', 'active', 'kyongjeong7@gmail.com', '283939651', 'BUSINESS', '1980-12-29', '10001', NULL, NULL, 'Canada', 'Toronto', '$2y$10$PnoaJ84XPJEh7TKESi4XRuJke.9LupaI3BRZfGK2b1C7zvBmELR2u', '5242', 791892, '524', '261', '1234', 'Kyong jeong', '692936652', 'kyongjeong7@gmail.com', '66527', 'account1.png', 'Ontario', '2023-08-13 06:48:25'),
(6, 'perryweb', 'Arthur', 'Rougher', '1709381598code.png', '9909194680', 0, 0, 0, NULL, NULL, 'Savings', 'male', NULL, 'USD', 'active', 'perryweb17@gmail.com', '0904533872', 'Photographer ', '2024-03-03', '1234567890', '1709381598code.png', '1709381598excel.png', 'Tahiti', 'lagos', '$2y$10$cdMkPjuGU2lKEfZj23p1Gei.NEeo0AWXOi9sLdCFiqx90DXs6PPti', '1234', 227891, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Park side EMP building ikeja lagos 23345', '2024-03-02 13:13:18');

-- --------------------------------------------------------

--
-- Table structure for table `virtual`
--

CREATE TABLE `virtual` (
  `id` int NOT NULL,
  `bank_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `routine_no` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acct_no` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `swift_code` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `virtual`
--

INSERT INTO `virtual` (`id`, `bank_name`, `routine_no`, `acct_no`, `swift_code`, `created_at`) VALUES
(1, 'Usa Bank', '637363636', '764229211', 'SFDHHS86X', '2021-10-08 11:05:42');

-- --------------------------------------------------------

--
-- Table structure for table `wire_transfer`
--

CREATE TABLE `wire_transfer` (
  `wire_id` int NOT NULL,
  `acct_id` int NOT NULL,
  `refrence_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `bank_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `acct_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `acct_number` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `trans_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'wire transfer',
  `acct_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acct_country` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `acct_swift` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `acct_routing` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acct_remarks` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `wire_status` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `wire_transfer`
--

INSERT INTO `wire_transfer` (`wire_id`, `acct_id`, `refrence_id`, `amount`, `bank_name`, `acct_name`, `acct_number`, `trans_type`, `acct_type`, `acct_country`, `acct_swift`, `acct_routing`, `acct_remarks`, `wire_status`, `created_at`) VALUES
(2, 2, '642a73f83347a', 500, 'Standard chartered bank', 'Daniel Josh', '3245235234', 'wire transfer', 'Fixed Deposit', 'Belgium', '2345345', '23453245', 'Flight funds', 1, '2023-04-03 06:36:40'),
(3, 3, '64368b11b6d58', 250000, 'Woodforest', 'Wilson Peters', '0875847474', 'wire transfer', 'Current', 'United States of America', '37826', '465734678', 'Space machinery', 1, '2023-04-12 10:42:25');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal`
--

CREATE TABLE `withdrawal` (
  `id` int NOT NULL,
  `reference_id` varchar(200) NOT NULL,
  `user_id` int NOT NULL,
  `amount` float NOT NULL,
  `withdraw_method` varchar(200) NOT NULL,
  `wallet_address` text NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `card_request`
--
ALTER TABLE `card_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crypto_currency`
--
ALTER TABLE `crypto_currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `domestic_transfer`
--
ALTER TABLE `domestic_transfer`
  ADD PRIMARY KEY (`dom_id`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_trans`
--
ALTER TABLE `temp_trans`
  ADD PRIMARY KEY (`wire_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `virtual`
--
ALTER TABLE `virtual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wire_transfer`
--
ALTER TABLE `wire_transfer`
  ADD PRIMARY KEY (`wire_id`);

--
-- Indexes for table `withdrawal`
--
ALTER TABLE `withdrawal`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `card_request`
--
ALTER TABLE `card_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `crypto_currency`
--
ALTER TABLE `crypto_currency`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `deposit`
--
ALTER TABLE `deposit`
  MODIFY `d_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `domestic_transfer`
--
ALTER TABLE `domestic_transfer`
  MODIFY `dom_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `loan_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `temp_trans`
--
ALTER TABLE `temp_trans`
  MODIFY `wire_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `trans_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `virtual`
--
ALTER TABLE `virtual`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wire_transfer`
--
ALTER TABLE `wire_transfer`
  MODIFY `wire_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
