-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2026 at 02:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `browsejobsbackendlaravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('private','group') NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `type`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'group', 'Marketing', 21, '2026-07-06 06:02:51', '2026-07-06 06:02:51'),
(2, 'private', NULL, 21, '2026-07-06 06:02:58', '2026-07-06 06:03:14'),
(3, 'private', NULL, 21, '2026-07-06 06:05:08', '2026-07-06 06:10:20');

-- --------------------------------------------------------

--
-- Table structure for table `conversation_participants`
--

CREATE TABLE `conversation_participants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `last_read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversation_participants`
--

INSERT INTO `conversation_participants` (`id`, `conversation_id`, `user_id`, `is_admin`, `last_read_at`, `created_at`, `updated_at`) VALUES
(1, 1, 28, 0, NULL, '2026-07-06 06:02:51', '2026-07-06 06:02:51'),
(2, 1, 3, 0, NULL, '2026-07-06 06:02:51', '2026-07-06 06:02:51'),
(3, 1, 20, 0, NULL, '2026-07-06 06:02:51', '2026-07-06 06:02:51'),
(4, 1, 21, 1, '2026-07-06 06:16:26', '2026-07-06 06:02:51', '2026-07-06 06:16:26'),
(5, 2, 21, 0, '2026-07-06 06:16:25', '2026-07-06 06:02:58', '2026-07-06 06:16:25'),
(6, 2, 23, 0, NULL, '2026-07-06 06:02:58', '2026-07-06 06:02:58'),
(7, 3, 21, 0, '2026-07-06 06:16:22', '2026-07-06 06:05:08', '2026-07-06 06:16:22'),
(8, 3, 1, 0, '2026-07-06 09:10:20', '2026-07-06 06:05:08', '2026-07-06 09:10:20');

-- --------------------------------------------------------

--
-- Table structure for table `course_catalog`
--

CREATE TABLE `course_catalog` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(120) NOT NULL,
  `title` varchar(200) NOT NULL,
  `short_title` varchar(120) NOT NULL,
  `tagline` varchar(255) DEFAULT NULL,
  `duration` varchar(60) DEFAULT NULL,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `currency` varchar(8) NOT NULL DEFAULT 'INR',
  `emi_text` varchar(120) DEFAULT NULL,
  `status` enum('live','coming_soon') NOT NULL DEFAULT 'live',
  `is_bestseller` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_catalog`
--

INSERT INTO `course_catalog` (`id`, `slug`, `title`, `short_title`, `tagline`, `duration`, `price`, `currency`, `emi_text`, `status`, `is_bestseller`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'data-engineering', 'Data Engineering Certification Program', 'Data Engineering', 'Build the pipelines companies are hiring for right now.', '6 months', 30000, 'INR', '3 × ₹10,000', 'live', 1, 1, '2026-07-15 09:17:25', '2026-07-15 09:17:25'),
(2, 'devops', 'DevOps & Cloud Certification Program', 'DevOps & Cloud', 'Own the pipeline from commit to production.', '6 months', 30000, 'INR', '3 × ₹10,000', 'live', 0, 2, '2026-07-15 09:17:25', '2026-07-15 09:17:25'),
(3, 'python-backend', 'Python Backend Development Program', 'Python Backend', 'Ship the APIs that run real products.', '6 months', 30000, 'INR', '3 × ₹10,000', 'live', 0, 3, '2026-07-15 09:17:25', '2026-07-15 09:17:25'),
(4, 'data-analytics', 'Data Analytics Certification Program', 'Data Analytics', 'From data to decisions. Turn information into impact.', '5-6 months', 30000, 'INR', '3 × ₹10,000', 'live', 0, 4, '2026-07-15 09:17:25', '2026-07-15 09:17:25'),
(5, 'agentic-ai', 'Agentic AI Certification Program', 'Agentic AI', 'Build the AI employees every company will hire next.', '6 months', 30000, 'INR', '3 × ₹10,000', 'coming_soon', 0, 5, '2026-07-15 09:17:25', '2026-07-15 09:17:25'),
(6, 'cyber-security', 'Cyber Security Certification Program', 'Cyber Security', 'Defend the systems the world runs on.', '6 months', 30000, 'INR', '3 × ₹10,000', 'coming_soon', 0, 6, '2026-07-15 09:17:25', '2026-07-15 09:17:25'),
(7, 'servicenow', 'ServiceNow Certification Program', 'ServiceNow', 'Master the platform enterprises run their operations on.', '5-6 months', 30000, 'INR', '3 × ₹10,000', 'coming_soon', 0, 7, '2026-07-15 09:17:25', '2026-07-15 09:17:25');

-- --------------------------------------------------------

--
-- Table structure for table `course_inquiries`
--

CREATE TABLE `course_inquiries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(32) NOT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_slug` varchar(120) DEFAULT NULL,
  `course_title` varchar(200) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(180) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `message` text DEFAULT NULL,
  `status` enum('new','contacted','closed') NOT NULL DEFAULT 'new',
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_inquiries`
--

INSERT INTO `course_inquiries` (`id`, `reference`, `course_id`, `course_slug`, `course_title`, `name`, `email`, `phone`, `message`, `status`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES
(1, 'INQ-K9AIGO', 1, 'data-engineering', 'Data Engineering Certification Program', 'Jyotiranjan Behera', 'jyotiranjanbehera013@gmail.com', '9337367467', 'Inquire', 'new', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '2026-07-15 04:21:49', '2026-07-15 04:21:49'),
(2, 'INQ-3GRAXB', 1, 'data-engineering', 'Data Engineering Certification Program', 'Jyotiranjan Behera', 'jyotiranjanbehera013@gmail.com', '9337367467', 'Inquery', 'new', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '2026-07-15 06:36:01', '2026-07-15 06:36:01'),
(3, 'INQ-57WD7O', 1, 'data-engineering', 'Data Engineering Certification Program', 'Jyotiranjan Behera', 'behera.jyotiranjan2018@gmail.com', '9337367467', 'sdgafg', 'new', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '2026-07-15 06:47:59', '2026-07-15 06:47:59');

-- --------------------------------------------------------

--
-- Table structure for table `course_registrations`
--

CREATE TABLE `course_registrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(32) NOT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_slug` varchar(120) NOT NULL,
  `course_title` varchar(200) NOT NULL,
  `student_name` varchar(150) NOT NULL,
  `email` varchar(180) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `qualification` varchar(150) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(8) NOT NULL DEFAULT 'INR',
  `razorpay_order_id` varchar(64) DEFAULT NULL,
  `razorpay_payment_id` varchar(64) DEFAULT NULL,
  `razorpay_signature` varchar(255) DEFAULT NULL,
  `payment_method` varchar(40) DEFAULT NULL,
  `payment_status` enum('pending','created','paid','failed') NOT NULL DEFAULT 'pending',
  `failure_reason` varchar(255) DEFAULT NULL,
  `invoice_number` varchar(40) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_registrations`
--

INSERT INTO `course_registrations` (`id`, `reference`, `course_id`, `course_slug`, `course_title`, `student_name`, `email`, `phone`, `qualification`, `address`, `amount`, `currency`, `razorpay_order_id`, `razorpay_payment_id`, `razorpay_signature`, `payment_method`, `payment_status`, `failure_reason`, `invoice_number`, `ip_address`, `user_agent`, `paid_at`, `created_at`, `updated_at`) VALUES
(1, 'BJ-260715-1398CA', 1, 'data-engineering', 'Data Engineering Certification Program', 'Jyoti', 'jyotiranjanbehera013@gmail.com', '8114637479', 'BSC', 'Kenderapara', 30000.00, 'INR', 'order_TDlcEDoNOTiOA9', NULL, NULL, NULL, 'created', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, '2026-07-15 06:16:58', '2026-07-15 06:16:59'),
(2, 'BJ-260715-680145', 1, 'data-engineering', 'Data Engineering Certification Program', 'Jyoti', 'jyotiranjanbehera013@gmail.com', '8114637479', 'Graduation', 'gag', 30000.00, 'INR', 'order_TDlfmadABpzmRH', NULL, NULL, NULL, 'created', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, '2026-07-15 06:20:20', '2026-07-15 06:20:20'),
(3, 'BJ-260715-3C8996', 1, 'data-engineering', 'Data Engineering Certification Program', 'Jyoti', 'jyotiranjanbehera013@gmail.com', '8114637479', 'Graduation', NULL, 30000.00, 'INR', 'order_TDliJ3HuBP3zfr', NULL, NULL, NULL, 'created', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, '2026-07-15 06:22:43', '2026-07-15 06:22:44'),
(4, 'BJ-260715-760DB6', 1, 'data-engineering', 'Data Engineering Certification Program', 'Jyoti', 'princejyotiranjanbehera@gmail.com', '8114637479', 'Graduation', 'Bhubaneswar', 30000.00, 'INR', 'order_TDmDjdzc43Ysf5', NULL, NULL, NULL, 'created', NULL, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, '2026-07-15 06:52:28', '2026-07-15 06:52:29');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `student_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `course_slug` varchar(100) NOT NULL,
  `course_title` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL COMMENT 'Registration fee amount in INR',
  `currency` varchar(10) NOT NULL DEFAULT 'INR',
  `razorpay_order_id` varchar(255) DEFAULT NULL,
  `razorpay_payment_id` varchar(255) DEFAULT NULL,
  `razorpay_signature` varchar(255) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `failure_reason` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `payment_status` enum('pending','created','paid','failed','order_failed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `reference`, `student_name`, `email`, `phone`, `qualification`, `address`, `course_slug`, `course_title`, `amount`, `currency`, `razorpay_order_id`, `razorpay_payment_id`, `razorpay_signature`, `payment_method`, `failure_reason`, `ip_address`, `user_agent`, `paid_at`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 'BJ-ED0E98', 'Jyoti', 'jyoti@gmail.com', '8114637479', 'Graduation', 'kk', 'data-engineering', 'Data Engineering Certification Program', 1.00, 'INR', 'order_TCyPdNF4xbqYf4', 'pay_TCyQgnWjh1JqBX', '344273a893122464f53351cd03b2b73c5ec6d2fa0e411738c88478fe09fdfa1e', 'upi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', '2026-07-13 11:40:29', 'paid', '2026-07-13 11:39:03', '2026-07-13 11:40:29'),
(2, 'BJ-81DF10', 'Jyoti', 'jyoti@gmail.com', '8114637479', 'Graduation', 'iupyuip', 'data-engineering', 'Data Engineering Certification Program', 30000.00, 'INR', NULL, NULL, NULL, NULL, 'Authentication failed', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, 'order_failed', '2026-07-13 08:36:26', '2026-07-13 08:36:27'),
(3, 'BJ-8F4C2D', 'Jyoti', 'jyoti@gmail.com', '8114637479', 'Graduation', 'iupyuip', 'data-engineering', 'Data Engineering Certification Program', 30000.00, 'INR', NULL, NULL, NULL, NULL, 'Authentication failed', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, 'order_failed', '2026-07-13 08:36:29', '2026-07-13 08:36:30');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `expense_date` date NOT NULL,
  `payment_method` enum('cash','card','upi','bank_transfer','cheque','other') NOT NULL DEFAULT 'cash',
  `vendor` varchar(255) DEFAULT NULL,
  `status` enum('paid','pending','cancelled') NOT NULL DEFAULT 'paid',
  `notes` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `title`, `category`, `amount`, `expense_date`, `payment_method`, `vendor`, `status`, `notes`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Max Claude', 'AI', 9539.00, '2026-07-06', 'card', 'Krish', 'paid', 'Buy', 1, '2026-07-06 13:59:36', '2026-07-06 13:59:36'),
(2, 'Meta Ads Campaign - July', 'Ads', 15000.00, '2026-07-02', 'card', 'Meta Platforms', 'paid', 'Lead gen campaign for July batch', 1, '2026-07-06 14:02:38', '2026-07-06 14:02:38'),
(3, 'ChatGPT Plus Subscription', 'AI Tools', 1999.00, '2026-07-03', 'card', 'OpenAI', 'paid', 'Monthly subscription for content team', 3, '2026-07-06 14:02:38', '2026-07-06 14:02:38'),
(4, 'Office Rent - July', 'Rent', 45000.00, '2026-07-01', 'bank_transfer', 'Landlord - Mr. Sharma', 'paid', 'Monthly office rent, HSR Layout branch', 1, '2026-07-06 14:02:38', '2026-07-06 14:02:38'),
(5, 'Google Ads Campaign', 'Ads', 8500.00, '2026-07-04', 'card', 'Google LLC', 'pending', 'Awaiting invoice from finance', 4, '2026-07-06 14:02:38', '2026-07-06 14:02:38'),
(6, 'Canva Pro Annual Plan', 'Software', 3999.00, '2026-06-28', 'upi', 'Canva Inc', 'paid', 'Design team annual renewal', 3, '2026-07-06 14:02:38', '2026-07-06 14:02:38'),
(7, 'Office Stationery', 'Office Supplies', 2340.50, '2026-06-25', 'cash', 'Local Stationery Shop', 'paid', 'Pens, notebooks, printer paper', 5, '2026-07-06 14:02:38', '2026-07-06 14:02:38'),
(8, 'Electricity Bill - June', 'Utilities', 6800.00, '2026-06-30', 'bank_transfer', 'BESCOM', 'paid', NULL, 1, '2026-07-06 14:02:38', '2026-07-06 14:02:38'),
(9, 'Zoom Business Plan', 'Software', 1499.00, '2026-07-01', 'card', 'Zoom Video Communications', 'paid', 'Monthly plan for team meetings', 6, '2026-07-06 14:02:38', '2026-07-06 14:02:38'),
(10, 'Client Meeting - Travel', 'Travel', 3200.00, '2026-07-05', 'cash', NULL, 'pending', 'Cab fare for client visit, receipt pending', 21, '2026-07-06 14:02:38', '2026-07-06 14:02:38'),
(11, 'LinkedIn Ads', 'Ads', 12000.00, '2026-06-20', 'card', 'LinkedIn Corporation', 'paid', 'B2B lead campaign', 4, '2026-07-06 14:02:38', '2026-07-06 14:02:38'),
(12, 'Notion Team Plan', 'Software', 2500.00, '2026-06-15', 'upi', 'Notion Labs', 'paid', 'Internal documentation and wiki', 3, '2026-07-06 14:02:38', '2026-07-06 14:02:38'),
(13, 'Internet Bill - July', 'Utilities', 1999.00, '2026-07-03', 'bank_transfer', 'ACT Fibernet', 'paid', NULL, 1, '2026-07-06 14:02:38', '2026-07-06 14:02:38'),
(14, 'Team Lunch - Project Kickoff', 'Miscellaneous', 4500.00, '2026-07-06', 'cash', 'The Food Court', 'paid', 'Celebrating new client onboarding', 5, '2026-07-06 14:02:38', '2026-07-06 14:02:38'),
(15, 'Facebook Boost Post', 'Ads', 1500.00, '2026-06-10', 'card', 'Meta Platforms', 'cancelled', 'Campaign cancelled, budget reallocated', 4, '2026-07-06 14:02:38', '2026-07-06 14:02:38'),
(16, 'AWS Hosting - July', 'Software', 7200.00, '2026-07-04', 'card', 'Amazon Web Services', 'pending', 'Invoice awaited', 1, '2026-07-06 14:02:38', '2026-07-06 14:02:38');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `holiday_date` date NOT NULL,
  `year` smallint(5) UNSIGNED NOT NULL,
  `is_optional` tinyint(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `title`, `holiday_date`, `year`, `is_optional`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Independence Day', '2026-08-15', 2026, 0, 'Independence Day', 1, '2026-07-04 05:41:45', '2026-07-04 05:41:45'),
(2, 'Varasiddhi Vinayaka Vrata (Ganesh Chaturthi)', '2026-09-14', 2026, 0, 'Varasiddhi Vinayaka Vrata (Ganesh Chaturthi)', 1, '2026-07-04 05:42:24', '2026-07-04 05:42:24'),
(3, 'Intigration', '2026-07-09', 2026, 0, 'jhgj', 1, '2026-07-06 10:34:09', '2026-07-06 10:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `campaign_name` varchar(255) DEFAULT NULL,
  `added_by_user_id` bigint(20) UNSIGNED NOT NULL,
  `current_status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_to_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `mobile`, `name`, `email`, `source`, `campaign_name`, `added_by_user_id`, `current_status_id`, `assigned_to_user_id`, `assigned_by_user_id`, `assigned_at`, `created_at`, `updated_at`) VALUES
(4, '9876500001', 'Rahul Sharma', 'rahul.sharma@example.com', 'Meta Ads', 'Diwali Offer', 20, 6, 9, 4, '2026-06-13 05:30:00', '2026-06-13 04:30:00', '2026-07-02 22:27:03'),
(5, '9876500002', 'Priya Verma', 'priya.verma@example.com', 'Google Ads', 'Search - Brand', 20, 6, 10, 4, '2026-06-14 05:30:00', '2026-06-14 04:30:00', '2026-07-02 22:27:03'),
(6, '9876500003', 'Amit Yadav', 'amit.yadav@example.com', 'Meta Ads', 'Summer Sale', 20, 6, 11, 4, '2026-06-15 05:30:00', '2026-06-15 04:30:00', '2026-07-02 22:27:03'),
(7, '9876500004', 'Sneha Kulkarni', 'sneha.kulkarni@example.com', 'Website', NULL, 20, 6, 12, 4, '2026-06-16 05:30:00', '2026-06-16 04:30:00', '2026-07-02 22:27:03'),
(8, '9876500005', 'Karan Malhotra', 'karan.malhotra@example.com', 'Google Ads', 'New Year Promo', 20, 6, 13, 4, '2026-06-17 05:30:00', '2026-06-17 04:30:00', '2026-07-02 22:27:03'),
(9, '9876500006', 'Anjali Singh', 'anjali.singh@example.com', 'Meta Ads', 'Diwali Offer', 20, 7, 14, 4, '2026-06-18 05:30:00', '2026-06-18 04:30:00', '2026-07-02 22:27:03'),
(10, '9876500007', 'Vikas Gupta', 'vikas.gupta@example.com', 'Google Ads', 'Search - Brand', 20, 7, 15, 4, '2026-06-19 05:30:00', '2026-06-19 04:30:00', '2026-07-02 22:27:03'),
(11, '9876500008', 'Neha Reddy', 'neha.reddy@example.com', 'Meta Ads', 'Summer Sale', 20, 7, 16, 4, '2026-06-20 05:30:00', '2026-06-20 04:30:00', '2026-07-02 22:27:03'),
(12, '9876500009', 'Suresh Patil', 'suresh.patil@example.com', 'Website', NULL, 20, 7, 17, 4, '2026-06-21 05:30:00', '2026-06-21 04:30:00', '2026-07-02 22:27:03'),
(13, '9876500010', 'Divya Nair', 'divya.nair@example.com', 'Google Ads', 'New Year Promo', 20, 7, 18, 4, '2026-06-22 05:30:00', '2026-06-22 04:30:00', '2026-07-02 22:27:03'),
(14, '9876500011', 'Rohit Chawla', 'rohit.chawla@example.com', 'Meta Ads', 'Diwali Offer', 20, 3, 9, 4, '2026-06-23 05:30:00', '2026-06-23 04:30:00', '2026-07-02 22:27:03'),
(15, '9876500012', 'Pooja Iyer', 'pooja.iyer@example.com', 'Google Ads', 'Search - Brand', 20, 3, 10, 4, '2026-06-24 05:30:00', '2026-06-24 04:30:00', '2026-07-02 22:27:03'),
(16, '9876500013', 'Manish Joshi', 'manish.joshi@example.com', 'Website', NULL, 20, 3, 11, 4, '2026-06-25 05:30:00', '2026-06-25 04:30:00', '2026-07-02 22:27:03'),
(17, '9876500014', 'Kavita Desai', 'kavita.desai@example.com', 'Meta Ads', 'Summer Sale', 20, 3, 12, 4, '2026-06-26 05:30:00', '2026-06-26 04:30:00', '2026-07-02 22:27:03'),
(18, '9876500015', 'Arjun Menon', 'arjun.menon@example.com', 'Google Ads', 'New Year Promo', 20, 2, 13, 4, '2026-06-27 05:30:00', '2026-06-27 04:30:00', '2026-07-02 22:27:03'),
(19, '9876500016', 'Shweta Rao', 'shweta.rao@example.com', 'Meta Ads', 'Diwali Offer', 20, 2, 14, 4, '2026-06-28 05:30:00', '2026-06-28 04:30:00', '2026-07-02 22:27:03'),
(20, '9876500017', 'Deepak Mishra', 'deepak.mishra@example.com', 'Website', NULL, 20, 2, 15, 4, '2026-06-29 05:30:00', '2026-06-29 04:30:00', '2026-07-02 22:27:03'),
(21, '9876500018', NULL, NULL, 'Google Ads', 'Search - Brand', 20, 5, 16, 4, '2026-06-30 05:30:00', '2026-06-30 04:30:00', '2026-07-02 22:27:03'),
(22, '9876500019', NULL, NULL, 'Meta Ads', 'Summer Sale', 20, 5, 17, 4, '2026-07-01 05:30:00', '2026-07-01 04:30:00', '2026-07-02 22:27:03'),
(23, '9876500020', NULL, NULL, 'Website', NULL, 20, 1, NULL, NULL, NULL, '2026-07-02 04:30:00', '2026-07-02 22:27:03');

-- --------------------------------------------------------

--
-- Table structure for table `lead_assignments`
--

CREATE TABLE `lead_assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_to_user_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_by_user_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_assignments`
--

INSERT INTO `lead_assignments` (`id`, `lead_id`, `assigned_to_user_id`, `assigned_by_user_id`, `assigned_at`, `created_at`, `updated_at`) VALUES
(1, 4, 9, 4, '2026-06-13 05:30:00', '2026-06-13 05:30:00', '2026-06-13 05:30:00'),
(2, 5, 10, 4, '2026-06-14 05:30:00', '2026-06-14 05:30:00', '2026-06-14 05:30:00'),
(3, 6, 11, 4, '2026-06-15 05:30:00', '2026-06-15 05:30:00', '2026-06-15 05:30:00'),
(4, 7, 12, 4, '2026-06-16 05:30:00', '2026-06-16 05:30:00', '2026-06-16 05:30:00'),
(5, 8, 13, 4, '2026-06-17 05:30:00', '2026-06-17 05:30:00', '2026-06-17 05:30:00'),
(6, 9, 14, 4, '2026-06-18 05:30:00', '2026-06-18 05:30:00', '2026-06-18 05:30:00'),
(7, 10, 15, 4, '2026-06-19 05:30:00', '2026-06-19 05:30:00', '2026-06-19 05:30:00'),
(8, 11, 16, 4, '2026-06-20 05:30:00', '2026-06-20 05:30:00', '2026-06-20 05:30:00'),
(9, 12, 17, 4, '2026-06-21 05:30:00', '2026-06-21 05:30:00', '2026-06-21 05:30:00'),
(10, 13, 18, 4, '2026-06-22 05:30:00', '2026-06-22 05:30:00', '2026-06-22 05:30:00'),
(11, 14, 9, 4, '2026-06-23 05:30:00', '2026-06-23 05:30:00', '2026-06-23 05:30:00'),
(12, 15, 10, 4, '2026-06-24 05:30:00', '2026-06-24 05:30:00', '2026-06-24 05:30:00'),
(13, 16, 11, 4, '2026-06-25 05:30:00', '2026-06-25 05:30:00', '2026-06-25 05:30:00'),
(14, 17, 12, 4, '2026-06-26 05:30:00', '2026-06-26 05:30:00', '2026-06-26 05:30:00'),
(15, 18, 13, 4, '2026-06-27 05:30:00', '2026-06-27 05:30:00', '2026-06-27 05:30:00'),
(16, 19, 14, 4, '2026-06-28 05:30:00', '2026-06-28 05:30:00', '2026-06-28 05:30:00'),
(17, 20, 15, 4, '2026-06-29 05:30:00', '2026-06-29 05:30:00', '2026-06-29 05:30:00'),
(18, 21, 16, 4, '2026-06-30 05:30:00', '2026-06-30 05:30:00', '2026-06-30 05:30:00'),
(19, 22, 17, 4, '2026-07-01 05:30:00', '2026-07-01 05:30:00', '2026-07-01 05:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `lead_conversations`
--

CREATE TABLE `lead_conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` bigint(20) UNSIGNED NOT NULL,
  `channel` enum('call','whatsapp','email','sms') NOT NULL,
  `direction` enum('inbound','outbound') NOT NULL,
  `transcript` longtext NOT NULL,
  `duration_seconds` int(10) UNSIGNED DEFAULT NULL,
  `recording_url` varchar(255) DEFAULT NULL,
  `handled_by_user_id` bigint(20) UNSIGNED NOT NULL,
  `occurred_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_conversations`
--

INSERT INTO `lead_conversations` (`id`, `lead_id`, `channel`, `direction`, `transcript`, `duration_seconds`, `recording_url`, `handled_by_user_id`, `occurred_at`, `created_at`, `updated_at`) VALUES
(1, 4, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Meta Ads. Are you still interested?\nLead: Yes, tell me more about the offer.', 194, NULL, 9, '2026-06-13 07:30:00', '2026-06-13 07:30:00', '2026-06-13 07:30:00'),
(2, 4, 'call', 'outbound', 'HR: Great news, we can get you started right away. Shall I proceed with enrollment?\nLead: Yes, please go ahead.', 110, NULL, 9, '2026-06-15 07:30:00', '2026-06-15 07:30:00', '2026-06-15 07:30:00'),
(3, 5, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Google Ads. Are you still interested?\nLead: Yes, tell me more about the offer.', 99, NULL, 10, '2026-06-14 07:30:00', '2026-06-14 07:30:00', '2026-06-14 07:30:00'),
(4, 5, 'call', 'outbound', 'HR: Great news, we can get you started right away. Shall I proceed with enrollment?\nLead: Yes, please go ahead.', 384, NULL, 10, '2026-06-16 07:30:00', '2026-06-16 07:30:00', '2026-06-16 07:30:00'),
(5, 6, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Meta Ads. Are you still interested?\nLead: Yes, tell me more about the offer.', 296, NULL, 11, '2026-06-15 07:30:00', '2026-06-15 07:30:00', '2026-06-15 07:30:00'),
(6, 6, 'call', 'outbound', 'HR: Great news, we can get you started right away. Shall I proceed with enrollment?\nLead: Yes, please go ahead.', 128, NULL, 11, '2026-06-17 07:30:00', '2026-06-17 07:30:00', '2026-06-17 07:30:00'),
(7, 7, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Website. Are you still interested?\nLead: Yes, tell me more about the offer.', 276, NULL, 12, '2026-06-16 07:30:00', '2026-06-16 07:30:00', '2026-06-16 07:30:00'),
(8, 7, 'call', 'outbound', 'HR: Great news, we can get you started right away. Shall I proceed with enrollment?\nLead: Yes, please go ahead.', 254, NULL, 12, '2026-06-18 07:30:00', '2026-06-18 07:30:00', '2026-06-18 07:30:00'),
(9, 8, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Google Ads. Are you still interested?\nLead: Yes, tell me more about the offer.', 134, NULL, 13, '2026-06-17 07:30:00', '2026-06-17 07:30:00', '2026-06-17 07:30:00'),
(10, 8, 'call', 'outbound', 'HR: Great news, we can get you started right away. Shall I proceed with enrollment?\nLead: Yes, please go ahead.', 234, NULL, 13, '2026-06-19 07:30:00', '2026-06-19 07:30:00', '2026-06-19 07:30:00'),
(11, 9, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Meta Ads. Are you still interested?\nLead: Yes, tell me more about the offer.', 252, NULL, 14, '2026-06-18 07:30:00', '2026-06-18 07:30:00', '2026-06-18 07:30:00'),
(12, 9, 'call', 'outbound', 'HR: Just checking in again, are you looking to move forward?\nLead: Price too high', 237, NULL, 14, '2026-06-20 07:30:00', '2026-06-20 07:30:00', '2026-06-20 07:30:00'),
(13, 10, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Google Ads. Are you still interested?\nLead: Yes, tell me more about the offer.', 119, NULL, 15, '2026-06-19 07:30:00', '2026-06-19 07:30:00', '2026-06-19 07:30:00'),
(14, 10, 'call', 'outbound', 'HR: Just checking in again, are you looking to move forward?\nLead: Joined a competitor', 160, NULL, 15, '2026-06-21 07:30:00', '2026-06-21 07:30:00', '2026-06-21 07:30:00'),
(15, 11, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Meta Ads. Are you still interested?\nLead: Yes, tell me more about the offer.', 151, NULL, 16, '2026-06-20 07:30:00', '2026-06-20 07:30:00', '2026-06-20 07:30:00'),
(16, 11, 'call', 'outbound', 'HR: Just checking in again, are you looking to move forward?\nLead: No response after follow-ups', 234, NULL, 16, '2026-06-22 07:30:00', '2026-06-22 07:30:00', '2026-06-22 07:30:00'),
(17, 12, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Website. Are you still interested?\nLead: Yes, tell me more about the offer.', 259, NULL, 17, '2026-06-21 07:30:00', '2026-06-21 07:30:00', '2026-06-21 07:30:00'),
(18, 12, 'call', 'outbound', 'HR: Just checking in again, are you looking to move forward?\nLead: Not interested in offer', 348, NULL, 17, '2026-06-23 07:30:00', '2026-06-23 07:30:00', '2026-06-23 07:30:00'),
(19, 13, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Google Ads. Are you still interested?\nLead: Yes, tell me more about the offer.', 156, NULL, 18, '2026-06-22 07:30:00', '2026-06-22 07:30:00', '2026-06-22 07:30:00'),
(20, 13, 'call', 'outbound', 'HR: Just checking in again, are you looking to move forward?\nLead: Location / timing not suitable', 396, NULL, 18, '2026-06-24 07:30:00', '2026-06-24 07:30:00', '2026-06-24 07:30:00'),
(21, 14, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Meta Ads. Are you still interested?\nLead: Yes, tell me more about the offer.', 256, NULL, 9, '2026-06-23 07:30:00', '2026-06-23 07:30:00', '2026-06-23 07:30:00'),
(22, 14, 'whatsapp', 'outbound', 'HR: Hi, just following up on our call. Do you have any questions about the plan?\nLead: I need a bit more time to decide.', NULL, NULL, 9, '2026-06-24 07:30:00', '2026-06-24 07:30:00', '2026-06-24 07:30:00'),
(23, 15, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Google Ads. Are you still interested?\nLead: Yes, tell me more about the offer.', 128, NULL, 10, '2026-06-24 07:30:00', '2026-06-24 07:30:00', '2026-06-24 07:30:00'),
(24, 15, 'whatsapp', 'outbound', 'HR: Hi, just following up on our call. Do you have any questions about the plan?\nLead: I need a bit more time to decide.', NULL, NULL, 10, '2026-06-25 07:30:00', '2026-06-25 07:30:00', '2026-06-25 07:30:00'),
(25, 16, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Website. Are you still interested?\nLead: Yes, tell me more about the offer.', 292, NULL, 11, '2026-06-25 07:30:00', '2026-06-25 07:30:00', '2026-06-25 07:30:00'),
(26, 16, 'whatsapp', 'outbound', 'HR: Hi, just following up on our call. Do you have any questions about the plan?\nLead: I need a bit more time to decide.', NULL, NULL, 11, '2026-06-26 07:30:00', '2026-06-26 07:30:00', '2026-06-26 07:30:00'),
(27, 17, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Meta Ads. Are you still interested?\nLead: Yes, tell me more about the offer.', 63, NULL, 12, '2026-06-26 07:30:00', '2026-06-26 07:30:00', '2026-06-26 07:30:00'),
(28, 17, 'whatsapp', 'outbound', 'HR: Hi, just following up on our call. Do you have any questions about the plan?\nLead: I need a bit more time to decide.', NULL, NULL, 12, '2026-06-27 07:30:00', '2026-06-27 07:30:00', '2026-06-27 07:30:00'),
(29, 18, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Google Ads. Are you still interested?\nLead: Yes, tell me more about the offer.', 249, NULL, 13, '2026-06-27 07:30:00', '2026-06-27 07:30:00', '2026-06-27 07:30:00'),
(30, 18, 'whatsapp', 'outbound', 'HR: Hi, just following up on our call. Do you have any questions about the plan?\nLead: I need a bit more time to decide.', NULL, NULL, 13, '2026-06-28 07:30:00', '2026-06-28 07:30:00', '2026-06-28 07:30:00'),
(31, 19, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Meta Ads. Are you still interested?\nLead: Yes, tell me more about the offer.', 133, NULL, 14, '2026-06-28 07:30:00', '2026-06-28 07:30:00', '2026-06-28 07:30:00'),
(32, 19, 'whatsapp', 'outbound', 'HR: Hi, just following up on our call. Do you have any questions about the plan?\nLead: I need a bit more time to decide.', NULL, NULL, 14, '2026-06-29 07:30:00', '2026-06-29 07:30:00', '2026-06-29 07:30:00'),
(33, 20, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Website. Are you still interested?\nLead: Yes, tell me more about the offer.', 261, NULL, 15, '2026-06-29 07:30:00', '2026-06-29 07:30:00', '2026-06-29 07:30:00'),
(34, 20, 'whatsapp', 'outbound', 'HR: Hi, just following up on our call. Do you have any questions about the plan?\nLead: I need a bit more time to decide.', NULL, NULL, 15, '2026-06-30 07:30:00', '2026-06-30 07:30:00', '2026-06-30 07:30:00'),
(35, 21, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Google Ads. Are you still interested?\nLead: [Number unreachable / switched off]', 0, NULL, 16, '2026-06-30 07:30:00', '2026-06-30 07:30:00', '2026-06-30 07:30:00'),
(36, 22, 'call', 'outbound', 'HR: Hi, this is regarding your enquiry from Meta Ads. Are you still interested?\nLead: [Number unreachable / switched off]', 0, NULL, 17, '2026-07-01 07:30:00', '2026-07-01 07:30:00', '2026-07-01 07:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `lead_conversation_tags`
--

CREATE TABLE `lead_conversation_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_conversation_tags`
--

INSERT INTO `lead_conversation_tags` (`id`, `conversation_id`, `tag`, `created_at`, `updated_at`) VALUES
(1, 12, 'price_objection', '2026-06-20 07:30:00', '2026-06-20 07:30:00'),
(2, 14, 'lost_to_competitor', '2026-06-21 07:30:00', '2026-06-21 07:30:00'),
(3, 16, 'no_answer', '2026-06-22 07:30:00', '2026-06-22 07:30:00'),
(4, 18, 'not_interested', '2026-06-23 07:30:00', '2026-06-23 07:30:00'),
(5, 20, 'timing_issue', '2026-06-24 07:30:00', '2026-06-24 07:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `lead_notifications`
--

CREATE TABLE `lead_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` bigint(20) UNSIGNED NOT NULL,
  `notify_user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `channel` varchar(255) NOT NULL DEFAULT 'system',
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_notifications`
--

INSERT INTO `lead_notifications` (`id`, `lead_id`, `notify_user_id`, `type`, `channel`, `is_read`, `sent_at`, `created_at`, `updated_at`) VALUES
(1, 4, 4, 'lead_created', 'whatsapp', 1, '2026-06-13 04:30:00', '2026-06-13 04:30:00', '2026-06-13 04:30:00'),
(2, 4, 9, 'lead_assigned', 'whatsapp', 1, '2026-06-13 05:30:00', '2026-06-13 05:30:00', '2026-06-13 05:30:00'),
(3, 5, 4, 'lead_created', 'whatsapp', 1, '2026-06-14 04:30:00', '2026-06-14 04:30:00', '2026-06-14 04:30:00'),
(4, 5, 10, 'lead_assigned', 'whatsapp', 1, '2026-06-14 05:30:00', '2026-06-14 05:30:00', '2026-06-14 05:30:00'),
(5, 6, 4, 'lead_created', 'whatsapp', 1, '2026-06-15 04:30:00', '2026-06-15 04:30:00', '2026-06-15 04:30:00'),
(6, 6, 11, 'lead_assigned', 'whatsapp', 1, '2026-06-15 05:30:00', '2026-06-15 05:30:00', '2026-06-15 05:30:00'),
(7, 7, 4, 'lead_created', 'whatsapp', 1, '2026-06-16 04:30:00', '2026-06-16 04:30:00', '2026-06-16 04:30:00'),
(8, 7, 12, 'lead_assigned', 'whatsapp', 1, '2026-06-16 05:30:00', '2026-06-16 05:30:00', '2026-06-16 05:30:00'),
(9, 8, 4, 'lead_created', 'whatsapp', 1, '2026-06-17 04:30:00', '2026-06-17 04:30:00', '2026-06-17 04:30:00'),
(10, 8, 13, 'lead_assigned', 'whatsapp', 1, '2026-06-17 05:30:00', '2026-06-17 05:30:00', '2026-06-17 05:30:00'),
(11, 9, 4, 'lead_created', 'whatsapp', 1, '2026-06-18 04:30:00', '2026-06-18 04:30:00', '2026-06-18 04:30:00'),
(12, 9, 14, 'lead_assigned', 'whatsapp', 1, '2026-06-18 05:30:00', '2026-06-18 05:30:00', '2026-06-18 05:30:00'),
(13, 10, 4, 'lead_created', 'whatsapp', 1, '2026-06-19 04:30:00', '2026-06-19 04:30:00', '2026-06-19 04:30:00'),
(14, 10, 15, 'lead_assigned', 'whatsapp', 1, '2026-06-19 05:30:00', '2026-06-19 05:30:00', '2026-06-19 05:30:00'),
(15, 11, 4, 'lead_created', 'whatsapp', 1, '2026-06-20 04:30:00', '2026-06-20 04:30:00', '2026-06-20 04:30:00'),
(16, 11, 16, 'lead_assigned', 'whatsapp', 1, '2026-06-20 05:30:00', '2026-06-20 05:30:00', '2026-06-20 05:30:00'),
(17, 12, 4, 'lead_created', 'whatsapp', 1, '2026-06-21 04:30:00', '2026-06-21 04:30:00', '2026-06-21 04:30:00'),
(18, 12, 17, 'lead_assigned', 'whatsapp', 1, '2026-06-21 05:30:00', '2026-06-21 05:30:00', '2026-06-21 05:30:00'),
(19, 13, 4, 'lead_created', 'whatsapp', 1, '2026-06-22 04:30:00', '2026-06-22 04:30:00', '2026-06-22 04:30:00'),
(20, 13, 18, 'lead_assigned', 'whatsapp', 1, '2026-06-22 05:30:00', '2026-06-22 05:30:00', '2026-06-22 05:30:00'),
(21, 14, 4, 'lead_created', 'whatsapp', 1, '2026-06-23 04:30:00', '2026-06-23 04:30:00', '2026-06-23 04:30:00'),
(22, 14, 9, 'lead_assigned', 'whatsapp', 1, '2026-06-23 05:30:00', '2026-06-23 05:30:00', '2026-06-23 05:30:00'),
(23, 15, 4, 'lead_created', 'whatsapp', 1, '2026-06-24 04:30:00', '2026-06-24 04:30:00', '2026-06-24 04:30:00'),
(24, 15, 10, 'lead_assigned', 'whatsapp', 1, '2026-06-24 05:30:00', '2026-06-24 05:30:00', '2026-06-24 05:30:00'),
(25, 16, 4, 'lead_created', 'whatsapp', 1, '2026-06-25 04:30:00', '2026-06-25 04:30:00', '2026-06-25 04:30:00'),
(26, 16, 11, 'lead_assigned', 'whatsapp', 1, '2026-06-25 05:30:00', '2026-06-25 05:30:00', '2026-06-25 05:30:00'),
(27, 17, 4, 'lead_created', 'whatsapp', 1, '2026-06-26 04:30:00', '2026-06-26 04:30:00', '2026-06-26 04:30:00'),
(28, 17, 12, 'lead_assigned', 'whatsapp', 1, '2026-06-26 05:30:00', '2026-06-26 05:30:00', '2026-06-26 05:30:00'),
(29, 18, 4, 'lead_created', 'whatsapp', 1, '2026-06-27 04:30:00', '2026-06-27 04:30:00', '2026-06-27 04:30:00'),
(30, 18, 13, 'lead_assigned', 'whatsapp', 1, '2026-06-27 05:30:00', '2026-06-27 05:30:00', '2026-06-27 05:30:00'),
(31, 19, 4, 'lead_created', 'whatsapp', 1, '2026-06-28 04:30:00', '2026-06-28 04:30:00', '2026-06-28 04:30:00'),
(32, 19, 14, 'lead_assigned', 'whatsapp', 1, '2026-06-28 05:30:00', '2026-06-28 05:30:00', '2026-06-28 05:30:00'),
(33, 20, 4, 'lead_created', 'whatsapp', 1, '2026-06-29 04:30:00', '2026-06-29 04:30:00', '2026-06-29 04:30:00'),
(34, 20, 15, 'lead_assigned', 'whatsapp', 1, '2026-06-29 05:30:00', '2026-06-29 05:30:00', '2026-06-29 05:30:00'),
(35, 21, 4, 'lead_created', 'whatsapp', 1, '2026-06-30 04:30:00', '2026-06-30 04:30:00', '2026-06-30 04:30:00'),
(36, 21, 16, 'lead_assigned', 'whatsapp', 1, '2026-06-30 05:30:00', '2026-06-30 05:30:00', '2026-06-30 05:30:00'),
(37, 22, 4, 'lead_created', 'whatsapp', 1, '2026-07-01 04:30:00', '2026-07-01 04:30:00', '2026-07-01 04:30:00'),
(38, 22, 17, 'lead_assigned', 'whatsapp', 1, '2026-07-01 05:30:00', '2026-07-01 05:30:00', '2026-07-01 05:30:00'),
(39, 23, 4, 'lead_created', 'whatsapp', 1, '2026-07-02 04:30:00', '2026-07-02 04:30:00', '2026-07-02 04:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `lead_statuses`
--

CREATE TABLE `lead_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_statuses`
--

INSERT INTO `lead_statuses` (`id`, `name`, `slug`, `color`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'New', 'new', NULL, 1, '2026-07-02 09:49:58', '2026-07-02 09:49:58'),
(2, 'Interested', 'interested', NULL, 2, '2026-07-02 09:49:58', '2026-07-02 09:49:58'),
(3, 'Follow-up', 'follow_up', NULL, 3, '2026-07-02 09:49:58', '2026-07-02 09:49:58'),
(4, 'Not Interested', 'not_interested', NULL, 4, '2026-07-02 09:49:58', '2026-07-02 09:49:58'),
(5, 'Invalid Number', 'invalid_number', NULL, 5, '2026-07-02 09:49:58', '2026-07-02 09:49:58'),
(6, 'Joined', 'joined', NULL, 6, '2026-07-02 09:49:58', '2026-07-02 09:49:58'),
(7, 'Lost', 'lost', NULL, 7, '2026-07-02 09:49:58', '2026-07-02 09:49:58');

-- --------------------------------------------------------

--
-- Table structure for table `lead_status_history`
--

CREATE TABLE `lead_status_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` bigint(20) UNSIGNED NOT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `lost_reason_id` bigint(20) UNSIGNED DEFAULT NULL,
  `changed_by_user_id` bigint(20) UNSIGNED NOT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_status_history`
--

INSERT INTO `lead_status_history` (`id`, `lead_id`, `status_id`, `lost_reason_id`, `changed_by_user_id`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 4, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-13 05:30:00', '2026-06-13 05:30:00'),
(2, 4, 2, NULL, 9, 'Lead responded positively on first call.', '2026-06-13 07:40:00', '2026-06-13 07:40:00'),
(3, 4, 6, NULL, 9, 'Lead confirmed and enrolled.', '2026-06-15 07:35:00', '2026-06-15 07:35:00'),
(4, 5, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-14 05:30:00', '2026-06-14 05:30:00'),
(5, 5, 2, NULL, 10, 'Lead responded positively on first call.', '2026-06-14 07:40:00', '2026-06-14 07:40:00'),
(6, 5, 6, NULL, 10, 'Lead confirmed and enrolled.', '2026-06-16 07:35:00', '2026-06-16 07:35:00'),
(7, 6, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-15 05:30:00', '2026-06-15 05:30:00'),
(8, 6, 2, NULL, 11, 'Lead responded positively on first call.', '2026-06-15 07:40:00', '2026-06-15 07:40:00'),
(9, 6, 6, NULL, 11, 'Lead confirmed and enrolled.', '2026-06-17 07:35:00', '2026-06-17 07:35:00'),
(10, 7, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-16 05:30:00', '2026-06-16 05:30:00'),
(11, 7, 2, NULL, 12, 'Lead responded positively on first call.', '2026-06-16 07:40:00', '2026-06-16 07:40:00'),
(12, 7, 6, NULL, 12, 'Lead confirmed and enrolled.', '2026-06-18 07:35:00', '2026-06-18 07:35:00'),
(13, 8, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-17 05:30:00', '2026-06-17 05:30:00'),
(14, 8, 2, NULL, 13, 'Lead responded positively on first call.', '2026-06-17 07:40:00', '2026-06-17 07:40:00'),
(15, 8, 6, NULL, 13, 'Lead confirmed and enrolled.', '2026-06-19 07:35:00', '2026-06-19 07:35:00'),
(16, 9, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-18 05:30:00', '2026-06-18 05:30:00'),
(17, 9, 2, NULL, 14, 'Lead responded positively on first call.', '2026-06-18 07:40:00', '2026-06-18 07:40:00'),
(18, 9, 7, 1, 14, 'Lead marked as lost: Price too high', '2026-06-20 07:35:00', '2026-06-20 07:35:00'),
(19, 10, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-19 05:30:00', '2026-06-19 05:30:00'),
(20, 10, 2, NULL, 15, 'Lead responded positively on first call.', '2026-06-19 07:40:00', '2026-06-19 07:40:00'),
(21, 10, 7, 2, 15, 'Lead marked as lost: Joined a competitor', '2026-06-21 07:35:00', '2026-06-21 07:35:00'),
(22, 11, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-20 05:30:00', '2026-06-20 05:30:00'),
(23, 11, 2, NULL, 16, 'Lead responded positively on first call.', '2026-06-20 07:40:00', '2026-06-20 07:40:00'),
(24, 11, 7, 3, 16, 'Lead marked as lost: No response after follow-ups', '2026-06-22 07:35:00', '2026-06-22 07:35:00'),
(25, 12, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-21 05:30:00', '2026-06-21 05:30:00'),
(26, 12, 2, NULL, 17, 'Lead responded positively on first call.', '2026-06-21 07:40:00', '2026-06-21 07:40:00'),
(27, 12, 7, 5, 17, 'Lead marked as lost: Not interested in offer', '2026-06-23 07:35:00', '2026-06-23 07:35:00'),
(28, 13, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-22 05:30:00', '2026-06-22 05:30:00'),
(29, 13, 2, NULL, 18, 'Lead responded positively on first call.', '2026-06-22 07:40:00', '2026-06-22 07:40:00'),
(30, 13, 7, 6, 18, 'Lead marked as lost: Location / timing not suitable', '2026-06-24 07:35:00', '2026-06-24 07:35:00'),
(31, 14, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-23 05:30:00', '2026-06-23 05:30:00'),
(32, 14, 2, NULL, 9, 'Lead responded positively on first call.', '2026-06-23 07:40:00', '2026-06-23 07:40:00'),
(33, 14, 3, NULL, 9, 'Lead asked for more time, scheduled follow-up.', '2026-06-24 07:35:00', '2026-06-24 07:35:00'),
(34, 15, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-24 05:30:00', '2026-06-24 05:30:00'),
(35, 15, 2, NULL, 10, 'Lead responded positively on first call.', '2026-06-24 07:40:00', '2026-06-24 07:40:00'),
(36, 15, 3, NULL, 10, 'Lead asked for more time, scheduled follow-up.', '2026-06-25 07:35:00', '2026-06-25 07:35:00'),
(37, 16, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-25 05:30:00', '2026-06-25 05:30:00'),
(38, 16, 2, NULL, 11, 'Lead responded positively on first call.', '2026-06-25 07:40:00', '2026-06-25 07:40:00'),
(39, 16, 3, NULL, 11, 'Lead asked for more time, scheduled follow-up.', '2026-06-26 07:35:00', '2026-06-26 07:35:00'),
(40, 17, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-26 05:30:00', '2026-06-26 05:30:00'),
(41, 17, 2, NULL, 12, 'Lead responded positively on first call.', '2026-06-26 07:40:00', '2026-06-26 07:40:00'),
(42, 17, 3, NULL, 12, 'Lead asked for more time, scheduled follow-up.', '2026-06-27 07:35:00', '2026-06-27 07:35:00'),
(43, 18, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-27 05:30:00', '2026-06-27 05:30:00'),
(44, 18, 2, NULL, 13, 'Lead responded positively on first call.', '2026-06-27 07:40:00', '2026-06-27 07:40:00'),
(45, 19, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-28 05:30:00', '2026-06-28 05:30:00'),
(46, 19, 2, NULL, 14, 'Lead responded positively on first call.', '2026-06-28 07:40:00', '2026-06-28 07:40:00'),
(47, 20, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-29 05:30:00', '2026-06-29 05:30:00'),
(48, 20, 2, NULL, 15, 'Lead responded positively on first call.', '2026-06-29 07:40:00', '2026-06-29 07:40:00'),
(49, 21, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-06-30 05:30:00', '2026-06-30 05:30:00'),
(50, 21, 5, NULL, 16, 'Number unreachable after multiple attempts.', '2026-06-30 07:35:00', '2026-06-30 07:35:00'),
(51, 22, 1, NULL, 4, 'Lead assigned to HR Executive.', '2026-07-01 05:30:00', '2026-07-01 05:30:00'),
(52, 22, 5, NULL, 17, 'Number unreachable after multiple attempts.', '2026-07-01 07:35:00', '2026-07-01 07:35:00');

-- --------------------------------------------------------

--
-- Table structure for table `leave_balances`
--

CREATE TABLE `leave_balances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `leave_type_id` bigint(20) UNSIGNED NOT NULL,
  `year` smallint(5) UNSIGNED NOT NULL,
  `allocated_days` decimal(5,1) NOT NULL DEFAULT 0.0,
  `used_days` decimal(5,1) NOT NULL DEFAULT 0.0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_balances`
--

INSERT INTO `leave_balances` (`id`, `user_id`, `leave_type_id`, `year`, `allocated_days`, `used_days`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2026, 12.0, 0.0, '2026-07-03 11:50:46', '2026-07-03 11:50:46'),
(2, 1, 3, 2026, 15.0, 0.0, '2026-07-03 11:50:46', '2026-07-03 11:50:46'),
(3, 1, 4, 2026, 90.0, 0.0, '2026-07-03 11:50:46', '2026-07-03 11:50:46'),
(4, 1, 5, 2026, 7.0, 0.0, '2026-07-03 11:50:46', '2026-07-03 11:50:46'),
(5, 1, 2, 2026, 10.0, 0.0, '2026-07-03 11:50:46', '2026-07-03 11:50:46'),
(6, 1, 6, 2026, 0.0, 0.0, '2026-07-03 11:50:46', '2026-07-03 11:50:46'),
(7, 3, 1, 2026, 12.0, 0.0, '2026-07-03 13:26:00', '2026-07-03 13:26:00'),
(8, 3, 3, 2026, 15.0, 0.0, '2026-07-03 13:26:00', '2026-07-03 13:26:00'),
(9, 3, 4, 2026, 90.0, 0.0, '2026-07-03 13:26:00', '2026-07-03 13:26:00'),
(10, 3, 5, 2026, 7.0, 0.0, '2026-07-03 13:26:00', '2026-07-03 13:26:00'),
(11, 3, 2, 2026, 10.0, 0.0, '2026-07-03 13:26:00', '2026-07-03 13:26:00'),
(12, 3, 6, 2026, 0.0, 0.0, '2026-07-03 13:26:00', '2026-07-03 13:26:00'),
(13, 21, 1, 2026, 12.0, 4.0, '2026-07-03 14:14:25', '2026-07-03 14:32:46'),
(14, 21, 3, 2026, 15.0, 6.0, '2026-07-03 14:14:25', '2026-07-04 09:47:17'),
(15, 21, 4, 2026, 90.0, 0.0, '2026-07-03 14:14:25', '2026-07-03 14:14:25'),
(16, 21, 5, 2026, 7.0, 0.0, '2026-07-03 14:14:25', '2026-07-03 14:14:25'),
(17, 21, 2, 2026, 10.0, 0.0, '2026-07-03 14:14:25', '2026-07-03 14:14:25'),
(18, 21, 6, 2026, 0.0, 0.0, '2026-07-03 14:14:25', '2026-07-03 14:14:25'),
(19, 19, 1, 2026, 12.0, 0.0, '2026-07-03 14:48:34', '2026-07-03 14:48:34'),
(20, 19, 3, 2026, 15.0, 0.0, '2026-07-03 14:48:34', '2026-07-03 14:48:34'),
(21, 19, 4, 2026, 90.0, 29.0, '2026-07-03 14:48:34', '2026-07-03 14:49:18'),
(22, 19, 5, 2026, 7.0, 0.0, '2026-07-03 14:48:34', '2026-07-03 14:48:34'),
(23, 19, 2, 2026, 10.0, 0.0, '2026-07-03 14:48:34', '2026-07-03 14:48:34'),
(24, 19, 6, 2026, 0.0, 0.0, '2026-07-03 14:48:34', '2026-07-03 14:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `leave_type_id` bigint(20) UNSIGNED NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `is_half_day` tinyint(1) NOT NULL DEFAULT 0,
  `total_days` decimal(5,1) NOT NULL,
  `reason` text NOT NULL,
  `status` enum('pending','approved','rejected','cancelled') NOT NULL DEFAULT 'pending',
  `applied_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reviewed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `review_remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `user_id`, `leave_type_id`, `from_date`, `to_date`, `is_half_day`, `total_days`, `reason`, `status`, `applied_at`, `reviewed_by`, `reviewed_at`, `review_remarks`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2026-07-03', '2026-07-07', 0, 5.0, 'Demo', 'approved', '2026-07-03 11:53:54', 3, '2026-07-03 11:53:42', NULL, '2026-07-03 11:52:19', '2026-07-03 11:52:19'),
(2, 1, 1, '2026-07-03', '2026-07-06', 0, 4.0, 'Test Data', 'rejected', '2026-07-03 13:12:51', 3, '2026-07-03 13:12:51', 'Not Now', '2026-07-03 13:00:56', '2026-07-03 13:12:51'),
(3, 21, 1, '2026-07-03', '2026-07-06', 0, 4.0, 'demo', 'approved', '2026-07-03 14:32:45', 1, '2026-07-03 14:32:45', 'ok', '2026-07-03 14:14:57', '2026-07-03 14:32:45'),
(4, 1, 2, '2026-07-07', '2026-07-09', 0, 3.0, 'Test', 'rejected', '2026-07-03 14:49:50', 3, '2026-07-03 14:49:50', 'N', '2026-07-03 14:35:15', '2026-07-03 14:49:50'),
(5, 21, 2, '2026-07-06', '2026-07-10', 0, 5.0, 'Testing', 'cancelled', '2026-07-04 06:41:23', NULL, NULL, NULL, '2026-07-03 14:42:35', '2026-07-04 06:41:23'),
(6, 19, 4, '2026-07-01', '2026-07-29', 0, 29.0, 'TEST', 'approved', '2026-07-03 14:49:18', 1, '2026-07-03 14:49:18', 'KK', '2026-07-03 14:48:58', '2026-07-03 14:49:18'),
(7, 21, 1, '2026-07-01', '2026-07-03', 0, 3.0, 'Testing', 'cancelled', '2026-07-04 07:14:34', NULL, NULL, NULL, '2026-07-04 06:38:49', '2026-07-04 07:14:34'),
(8, 21, 1, '2026-07-01', '2026-07-03', 0, 3.0, 'kk', 'cancelled', '2026-07-04 06:40:54', NULL, NULL, NULL, '2026-07-04 06:39:40', '2026-07-04 06:40:54'),
(9, 21, 1, '2026-07-01', '2026-07-02', 0, 2.0, 'Testing', 'pending', '2026-07-04 07:15:30', NULL, NULL, NULL, '2026-07-04 07:15:30', '2026-07-04 07:15:30'),
(10, 21, 1, '2026-07-01', '2026-07-03', 0, 3.0, 'Text', 'pending', '2026-07-04 07:22:39', NULL, NULL, NULL, '2026-07-04 07:22:39', '2026-07-04 07:22:39'),
(11, 21, 2, '2026-07-06', '2026-07-08', 0, 3.0, 'DDD', 'pending', '2026-07-04 07:56:52', NULL, NULL, NULL, '2026-07-04 07:56:52', '2026-07-04 07:56:52'),
(12, 21, 1, '2026-07-01', '2026-07-03', 0, 3.0, 'ccc', 'pending', '2026-07-04 07:59:01', NULL, NULL, NULL, '2026-07-04 07:59:01', '2026-07-04 07:59:01'),
(13, 21, 2, '2026-07-01', '2026-07-02', 0, 2.0, 'dd', 'pending', '2026-07-04 08:09:14', NULL, NULL, NULL, '2026-07-04 08:09:14', '2026-07-04 08:09:14'),
(14, 21, 1, '2026-07-01', '2026-07-02', 0, 2.0, 'A', 'pending', '2026-07-04 08:15:35', NULL, NULL, NULL, '2026-07-04 08:15:35', '2026-07-04 08:15:35'),
(15, 21, 1, '2026-07-01', '2026-07-01', 0, 1.0, 'hh', 'pending', '2026-07-04 09:10:36', NULL, NULL, NULL, '2026-07-04 09:10:36', '2026-07-04 09:10:36'),
(16, 21, 1, '2026-07-01', '2026-07-03', 0, 3.0, 'A', 'pending', '2026-07-04 09:12:01', NULL, NULL, NULL, '2026-07-04 09:12:01', '2026-07-04 09:12:01'),
(17, 21, 1, '2026-07-06', '2026-07-07', 0, 2.0, 'uu', 'pending', '2026-07-04 09:29:57', NULL, NULL, NULL, '2026-07-04 09:29:57', '2026-07-04 09:29:57'),
(18, 21, 1, '2026-07-02', '2026-07-03', 0, 2.0, 'AAA', 'pending', '2026-07-04 09:31:23', NULL, NULL, NULL, '2026-07-04 09:31:23', '2026-07-04 09:31:23'),
(19, 21, 1, '2026-07-01', '2026-07-02', 0, 2.0, 'a', 'pending', '2026-07-04 09:35:16', NULL, NULL, NULL, '2026-07-04 09:35:16', '2026-07-04 09:35:16'),
(20, 21, 1, '2026-07-02', '2026-07-03', 0, 2.0, 'k', 'pending', '2026-07-04 09:42:08', NULL, NULL, NULL, '2026-07-04 09:42:08', '2026-07-04 09:42:08'),
(21, 21, 3, '2026-07-02', '2026-07-06', 0, 5.0, 'Demo', 'pending', '2026-07-04 09:42:51', NULL, NULL, NULL, '2026-07-04 09:42:51', '2026-07-04 09:42:51'),
(22, 21, 3, '2026-07-01', '2026-07-06', 0, 6.0, 'DD', 'approved', '2026-07-04 09:47:17', 3, '2026-07-04 09:47:17', 'Yes', '2026-07-04 09:47:00', '2026-07-04 09:47:17');

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `default_days_per_year` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `name`, `code`, `default_days_per_year`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Casual Leave', 'casual', 12, 1, '2026-07-03 11:41:47', '2026-07-03 11:41:47'),
(2, 'Sick Leave', 'sick', 10, 1, '2026-07-03 11:41:47', '2026-07-03 11:41:47'),
(3, 'Earned Leave', 'earned', 15, 1, '2026-07-03 11:41:47', '2026-07-03 11:41:47'),
(4, 'Maternity Leave', 'maternity', 90, 1, '2026-07-03 11:41:47', '2026-07-03 11:41:47'),
(5, 'Paternity Leave', 'paternity', 7, 1, '2026-07-03 11:41:47', '2026-07-03 11:41:47'),
(6, 'Unpaid Leave', 'unpaid', 0, 1, '2026-07-03 11:41:47', '2026-07-03 11:41:47');

-- --------------------------------------------------------

--
-- Table structure for table `lost_reasons`
--

CREATE TABLE `lost_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lost_reasons`
--

INSERT INTO `lost_reasons` (`id`, `reason`, `created_at`, `updated_at`) VALUES
(1, 'Price too high', '2026-07-02 09:49:58', '2026-07-02 09:49:58'),
(2, 'Joined a competitor', '2026-07-02 09:49:58', '2026-07-02 09:49:58'),
(3, 'No response after follow-ups', '2026-07-02 09:49:58', '2026-07-02 09:49:58'),
(4, 'Wrong / invalid number', '2026-07-02 09:49:58', '2026-07-02 09:49:58'),
(5, 'Not interested in offer', '2026-07-02 09:49:58', '2026-07-02 09:49:58'),
(6, 'Location / timing not suitable', '2026-07-02 09:49:58', '2026-07-02 09:49:58'),
(7, 'Other', '2026-07-02 09:49:58', '2026-07-02 09:49:58');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `menu_group` varchar(255) DEFAULT NULL,
  `permission_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `parent_id`, `title`, `icon`, `url`, `menu_group`, `permission_id`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Dashboard', 'ti ti-dashboard', NULL, 'Main Menu', NULL, 10, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(2, 1, 'Dashboard', NULL, 'dashboard', 'Main Menu', 1, 20, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(3, 1, 'Leads Dashboard', NULL, 'leads-dashboard', 'Main Menu', 2, 30, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(4, 1, 'Revenue Summary', NULL, 'revenue-summary-dashboard', 'Main Menu', 3, 40, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(5, 1, 'Growth Dashboard', NULL, 'growth-dashboard', 'Main Menu', 4, 50, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(6, NULL, 'Applications', 'ti ti-brand-airtable', NULL, 'Main Menu', NULL, 60, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(7, 6, 'Chat', NULL, 'chat', 'Main Menu', 5, 70, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(8, 6, 'Social Feed', NULL, NULL, 'Main Menu', NULL, 80, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(9, 8, 'Instagram', NULL, 'social-accounts/instagram', 'Main Menu', 6, 90, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(10, 8, 'LinkedIn', NULL, 'audio-call', 'Main Menu', 7, 100, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(11, 8, 'Youtube', NULL, 'social-accounts/youtube', 'Main Menu', 8, 110, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(12, 6, 'Calendar', NULL, 'calendar', 'Main Menu', 9, 120, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(13, 6, 'Email', NULL, 'email', 'Main Menu', 10, 130, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(14, 6, 'To Do', NULL, 'todo', 'Main Menu', 11, 140, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(15, 6, 'Notes', NULL, 'notes', 'Main Menu', 12, 150, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(16, 6, 'File Manager', NULL, 'file-manager', 'Main Menu', 13, 160, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(17, NULL, 'Leads', 'ti ti-chart-arcs', 'leads', 'CRM', 14, 10, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(18, NULL, 'Payments', 'ti ti-report-money', 'expenses', 'CRM', 15, 20, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(19, NULL, 'Analytics', 'ti ti-chart-bar', 'expenses-analytics', 'CRM', 16, 30, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(20, NULL, 'Tasks', 'ti ti-list-check', 'tasks', 'PROJECTS', 17, 10, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(21, NULL, 'Milestones', 'ti ti-stack-2', 'milestones', 'PROJECTS', 18, 20, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(23, NULL, 'Campaigns', 'ti ti-brand-campaignmonitor', NULL, 'MARKETING', NULL, 10, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(24, 23, 'Campaigns', NULL, 'campaign', 'MARKETING', 20, 20, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(25, 23, 'Email Campaigns', NULL, 'email-campaign', 'MARKETING', 21, 30, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(26, 23, 'SMS Campaigns', NULL, 'sms-campaign', 'MARKETING', 22, 40, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(27, 23, 'Social Campaigns', NULL, 'social-campaign', 'MARKETING', 23, 50, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(28, 23, 'WhatsApp Campaigns', NULL, 'whatsapp-campaign', 'MARKETING', 24, 60, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(30, NULL, 'Email Engagement', 'ti ti-mail-dollar', 'email-engagement', 'MARKETING', 26, 80, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(31, NULL, 'Manage Users', 'ti ti-users', 'manage-users', 'User Management', 27, 10, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(32, NULL, 'Roles & Permissions', 'ti ti-user-shield', 'roles-permissions', 'User Management', 28, 20, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(35, NULL, 'Attendance', 'ti ti-article', 'attendance', 'HRM', 31, 10, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(36, NULL, 'Leave Requests', 'ti ti-message-star', 'leave-requests', 'HRM', 32, 20, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(37, NULL, 'Holidays', 'ti ti-stack', 'holidays', 'HRM', 33, 30, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(38, NULL, 'Company Report', 'ti ti-building-estate', 'company-reports', 'Reports', 34, 10, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(39, NULL, 'Revenue Report', 'ti ti-file-dollar', 'revenue-report', 'Reports', 35, 20, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(40, NULL, 'HRM', 'ti ti-script', NULL, 'Reports', NULL, 30, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(41, 40, 'Attendance Summary', NULL, 'attendance-summary-report', 'Reports', 36, 40, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(42, 40, 'Leave Balance Summary', NULL, 'leave-balance-summary-report', 'Reports', 37, 50, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(43, NULL, 'Pages', 'ti ti-page-break', 'pages', 'Content', 38, 10, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(44, NULL, 'Blog', 'ti ti-brand-blogger', NULL, 'Content', NULL, 20, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(45, 44, 'All Blogs', NULL, 'blogs', 'Content', 39, 30, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(46, 44, 'Blog Categories', NULL, 'blog-categories', 'Content', 40, 40, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(47, 44, 'Blog Comments', NULL, 'blog-comments', 'Content', 41, 50, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(48, 44, 'Blog Tags', NULL, 'blog-tags', 'Content', 42, 60, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(49, NULL, 'Location', 'ti ti-map-pin-pin', NULL, 'Content', NULL, 70, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(50, 49, 'Countries', NULL, 'countries', 'Content', 43, 80, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(51, 49, 'States', NULL, 'states', 'Content', 44, 90, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(52, 49, 'Cities', NULL, 'cities', 'Content', 45, 100, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(53, NULL, 'Testimonials', 'ti ti-quote', 'testimonials', 'Content', 46, 110, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(54, NULL, 'FAQ', 'ti ti-question-mark', 'faq', 'Content', 47, 120, 1, '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(55, NULL, 'Student Management', 'ti ti-school', NULL, 'Student Management', 49, 130, 1, '2026-07-07 05:24:36', '2026-07-07 05:24:36'),
(56, 55, 'Students', 'ti ti-users', 'students', 'Student Management', 49, 10, 1, '2026-07-07 05:24:36', '2026-07-07 05:24:36'),
(57, 55, 'Masterclass', 'ti ti-presentation', 'masterclasses', 'Student Management', 50, 20, 1, '2026-07-07 05:24:36', '2026-07-07 05:24:36'),
(58, 55, 'Live Batches', 'ti ti-broadcast', 'live-batches', 'Student Management', 51, 30, 1, '2026-07-07 05:24:36', '2026-07-07 05:24:36'),
(59, 55, 'Class Attendance', 'ti ti-checklist', 'class-attendance', 'Student Management', 52, 40, 1, '2026-07-07 05:24:36', '2026-07-07 05:24:36'),
(60, 55, 'Mock Test Result', 'ti ti-clipboard-check', 'mock-test-results', 'Student Management', 53, 50, 1, '2026-07-07 05:24:36', '2026-07-07 05:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `sender_id`, `body`, `created_at`, `updated_at`) VALUES
(1, 2, 21, 'Hii', '2026-07-06 06:03:04', '2026-07-06 06:03:04'),
(2, 2, 21, 'Hii', '2026-07-06 06:03:07', '2026-07-06 06:03:07'),
(3, 2, 21, 'Hi', '2026-07-06 06:03:14', '2026-07-06 06:03:14'),
(4, 3, 1, 'Hi', '2026-07-06 06:10:08', '2026-07-06 06:10:08'),
(5, 3, 21, 'Hii', '2026-07-06 06:10:20', '2026-07-06 06:10:20');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2026_07_02_120350_create_roles_table', 2),
(4, '2026_07_02_122655_create_user_login_logs_table', 3),
(6, '0001_01_01_000000_create_users_table', 4),
(7, '2026_07_02_151533_create_lead_statuses_table', 5),
(8, '2026_07_02_151602_create_lost_reasons_table', 5),
(9, '2026_07_02_151629_create_leads_table', 5),
(10, '2026_07_02_151714_create_lead_status_history_table', 5),
(11, '2026_07_02_151803_create_lead_conversations_table', 5),
(12, '2026_07_02_151829_create_lead_notifications_table', 5),
(13, '2026_07_02_151857_create_lead_assignments_table', 5),
(14, '2026_07_02_152130_create_lead_conversation_tags_table', 6),
(15, '2026_07_03_054931_create_permissions_table', 7),
(16, '2026_07_03_054937_create_role_permissions_table', 7),
(17, '2026_07_03_054942_create_menu_items_table', 7),
(18, '2026_07_03_105318_update_user_log_table', 8),
(19, '2026_07_03_170922_create_leave_types_table', 9),
(20, '2026_07_03_170926_create_leave_balances_table', 9),
(21, '2026_07_03_170931_create_leave_requests_table', 9),
(22, '2026_07_04_110326_create_holidays_table', 10),
(23, '2026_07_04_114707_create_notifications_table', 11),
(24, '2026_07_04_123735_create_push_subscriptions_table', 12),
(25, '2026_07_04_191639_create_tasks_table', 13),
(26, '2026_07_04_191646_create_task_assignees_table', 13),
(27, '2026_07_06_100759_add_last_reminded_at_to_task_assignees_table', 14),
(28, '2026_07_06_112818_create_conversations_table', 15),
(29, '2026_07_06_112824_create_conversation_participants_table', 15),
(30, '2026_07_06_112829_create_messages_table', 15),
(31, '2026_07_06_115442_create_social_accounts_table', 16),
(32, '2026_07_06_115451_create_social_media_stats_table', 16),
(33, '2026_07_06_132827_add_profile_fields_to_social_accounts_table', 17),
(34, '2026_07_06_133315_widen_profile_picture_url_column', 18),
(35, '2026_07_06_135610_add_youtube_support_to_social_accounts_table', 19),
(36, '2026_07_06_140000_add_youtube_support_to_social_accounts_table', 19),
(37, '2026_07_06_192430_create_expenses_table', 20),
(38, '2026_07_07_101418_create_students_table', 21),
(39, '2026_07_13_000000_create_enrollments_table', 22);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('019463da-2ebf-463a-93a2-ed92caf3ef86', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 3, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Earned Leave (6.0 day(s), 01 Jul 2026 to 06 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/22\",\"icon\":\"ti ti-calendar-event\"}', NULL, '2026-07-04 09:47:01', '2026-07-04 09:47:01'),
('077e82b3-caea-4a60-951b-764294bdd0b7', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 1, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 01 Jul 2026 to 02 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/19\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 15:43:42', '2026-07-04 09:35:16', '2026-07-04 15:43:42'),
('0866e4a8-4f50-48aa-a0ba-400d713cec3a', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 1, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 02 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/18\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 15:43:42', '2026-07-04 09:31:23', '2026-07-04 15:43:42'),
('0b6c71cd-a993-45e4-983c-68279fddf06c', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 1, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Sick Leave (3.0 day(s), 06 Jul 2026 to 08 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/11\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 08:09:56', '2026-07-04 07:56:52', '2026-07-04 08:09:56'),
('0d7eca50-1596-463f-80a5-5003aa9a9175', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 1, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/10\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 07:53:03', '2026-07-04 07:22:39', '2026-07-04 07:53:03'),
('14d6517c-e1c9-43e4-8db2-920e177a7d41', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 3, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/16\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 09:42:29', '2026-07-04 09:12:01', '2026-07-04 09:42:29'),
('15c1e80f-721e-4a4c-a985-645268832f89', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 3, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 01 Jul 2026 to 02 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/19\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 09:42:29', '2026-07-04 09:35:17', '2026-07-04 09:42:29'),
('1da4f207-5176-4cb9-a2e2-5a716b575b50', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 21, '{\"title\":\"New Task Assigned\",\"message\":\"\\\"Varasiddhi Vinayaka Vrata (Ganesh Chaturthi)\\\" \\u2014 due 07 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\",\"icon\":\"ti ti-clipboard-list\"}', '2026-07-06 04:30:10', '2026-07-04 14:43:56', '2026-07-06 04:30:10'),
('1e925b5c-c687-4383-97bb-86bd808472da', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 21, '{\"title\":\"New Task Assigned\",\"message\":\"\\\"Independence Day\\\" \\u2014 due 10 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\",\"icon\":\"ti ti-clipboard-list\"}', '2026-07-06 04:30:10', '2026-07-04 14:27:26', '2026-07-06 04:30:10'),
('2c428bc4-2507-4ce6-aa9c-d87e52329b0c', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 10, '{\"title\":\"New Task Assigned\",\"message\":\"\\\"Whatsapp  Intigration\\\" \\u2014 due 06 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/2\",\"icon\":\"ti ti-clipboard-list\"}', NULL, '2026-07-04 14:01:17', '2026-07-04 14:01:17'),
('2de899cb-967e-4eae-9477-c7878e8b079e', 'App\\Notifications\\NewChatMessage', 'App\\Models\\User', 23, '{\"title\":\"Iyyapan\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=2\",\"icon\":\"ti ti-message-circle\"}', NULL, '2026-07-06 06:03:07', '2026-07-06 06:03:07'),
('32a7c47c-3c7e-4ae7-9d58-874ecf06a8c7', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 3, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Earned Leave (5.0 day(s), 02 Jul 2026 to 06 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/21\",\"icon\":\"ti ti-calendar-event\"}', NULL, '2026-07-04 09:42:52', '2026-07-04 09:42:52'),
('3441d235-85b3-40e7-807a-c5fee1436fa3', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 21, '{\"title\":\"New Task Assigned\",\"message\":\"\\\"heryu\\\" \\u2014 due 06 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/8\",\"icon\":\"ti ti-clipboard-list\"}', '2026-07-06 04:30:09', '2026-07-04 15:48:08', '2026-07-06 04:30:09'),
('3839c199-9d24-440f-a4e6-209df076737f', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 1, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/8\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 06:40:01', '2026-07-04 06:39:40', '2026-07-04 06:40:01'),
('38a699ef-141d-424b-bba6-4eca88ebd53e', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 1, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 02 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/20\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 15:43:42', '2026-07-04 09:42:08', '2026-07-04 15:43:42'),
('394f3c8b-80f5-44b1-9bbf-fb77dc0d22f9', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 21, '{\"title\":\"New Task Assigned\",\"message\":\"\\\"Whatsapp  Intigration\\\" \\u2014 due 06 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/2\",\"icon\":\"ti ti-clipboard-list\"}', '2026-07-04 14:17:24', '2026-07-04 14:01:17', '2026-07-04 14:17:24'),
('3df1e3d8-a4b2-481c-a3e7-10c2e634f88b', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 1, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/7\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 06:39:07', '2026-07-04 06:38:50', '2026-07-04 06:39:07'),
('427d03a6-58ba-468c-83d7-94d6d6b760d1', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 19, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 02 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/20\",\"icon\":\"ti ti-calendar-event\"}', NULL, '2026-07-04 09:42:08', '2026-07-04 09:42:08'),
('46ab9433-c711-4b90-82a6-d0da57f1e848', 'App\\Notifications\\NewChatMessage', 'App\\Models\\User', 23, '{\"title\":\"Iyyapan\",\"message\":\"Hi\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=2\",\"icon\":\"ti ti-message-circle\"}', NULL, '2026-07-06 06:03:14', '2026-07-06 06:03:14'),
('4a78833e-611e-4726-a092-3e7b0aad2ac6', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 3, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Sick Leave (3.0 day(s), 06 Jul 2026 to 08 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/11\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 09:42:29', '2026-07-04 07:56:52', '2026-07-04 09:42:29'),
('563b1ef1-5271-46b0-8b6e-9ac11651f151', 'App\\Notifications\\NewChatMessage', 'App\\Models\\User', 1, '{\"title\":\"Iyyapan\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=3\",\"icon\":\"ti ti-message-circle\"}', '2026-07-06 06:13:50', '2026-07-06 06:10:20', '2026-07-06 06:13:50'),
('5658c6f6-e212-4dbe-8895-b6d6a9847d49', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 3, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 01 Jul 2026 to 02 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/9\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 07:22:02', '2026-07-04 07:15:30', '2026-07-04 07:22:02'),
('5bf0e93a-5641-4fbc-a2b1-ad558b6f7531', 'App\\Notifications\\LeaveRequestReviewed', 'App\\Models\\User', 21, '{\"title\":\"Leave Request Approved\",\"message\":\"Your Earned Leave request has been approved.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/22\",\"icon\":\"ti ti-check\"}', '2026-07-06 04:30:10', '2026-07-04 09:47:41', '2026-07-06 04:30:10'),
('5c441492-079b-4969-bc67-7b0d59db3698', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 1, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 06 Jul 2026 to 07 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/17\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 15:43:42', '2026-07-04 09:29:57', '2026-07-04 15:43:42'),
('60ef47a8-236c-4c7a-9afd-ca5f05cacbd7', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 3, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 01 Jul 2026 to 02 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/14\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 09:42:29', '2026-07-04 08:15:35', '2026-07-04 09:42:29'),
('613328e0-2f92-4381-b4b7-6095747cb27b', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 3, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Sick Leave (2.0 day(s), 01 Jul 2026 to 02 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/13\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 09:42:29', '2026-07-04 08:09:15', '2026-07-04 09:42:29'),
('65beff3c-ce4d-443e-af0c-cd4111ca41bc', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 1, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/12\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 08:09:56', '2026-07-04 07:59:01', '2026-07-04 08:09:56'),
('693e916b-1268-4605-8088-bf74f3e5d19a', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 19, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Earned Leave (5.0 day(s), 02 Jul 2026 to 06 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/21\",\"icon\":\"ti ti-calendar-event\"}', NULL, '2026-07-04 09:42:51', '2026-07-04 09:42:51'),
('6b50a041-d5b7-43e3-b7db-b0bc6355e5a4', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 1, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Earned Leave (6.0 day(s), 01 Jul 2026 to 06 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/22\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 15:43:42', '2026-07-04 09:47:00', '2026-07-04 15:43:42'),
('6ccbb71f-9bfa-4156-aaf5-e209eecc71b4', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 1, '{\"title\":\"New Task Assigned\",\"message\":\"\\\"Intigration\\\" \\u2014 due 07 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/9\",\"icon\":\"ti ti-clipboard-list\"}', '2026-07-06 04:26:15', '2026-07-04 15:49:08', '2026-07-06 04:26:15'),
('75531630-39e7-4af1-88ff-ee86e933e30d', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 3, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 06 Jul 2026 to 07 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/17\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 09:42:29', '2026-07-04 09:29:58', '2026-07-04 09:42:29'),
('770686da-a2e6-4db9-a6e8-e16f3b3068f7', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 23, '{\"title\":\"New Task Assigned\",\"message\":\"\\\"Independence Day\\\" \\u2014 due 10 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\",\"icon\":\"ti ti-clipboard-list\"}', NULL, '2026-07-04 14:27:26', '2026-07-04 14:27:26'),
('7dca0cc6-4b5c-4e7e-92ac-d3a9e863f2aa', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 19, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Earned Leave (6.0 day(s), 01 Jul 2026 to 06 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/22\",\"icon\":\"ti ti-calendar-event\"}', NULL, '2026-07-04 09:47:00', '2026-07-04 09:47:00'),
('807ff97f-d7e8-4897-9237-9de5a7b4cc4d', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 1, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Earned Leave (5.0 day(s), 02 Jul 2026 to 06 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/21\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 15:43:42', '2026-07-04 09:42:51', '2026-07-04 15:43:42'),
('8784dfea-683d-4169-afa0-ddc365036d9f', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 3, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 02 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/18\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 09:42:29', '2026-07-04 09:31:24', '2026-07-04 09:42:29'),
('8a9bd7a9-7753-4906-92e0-eaea711ba55b', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 3, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 02 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/20\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 09:42:29', '2026-07-04 09:42:09', '2026-07-04 09:42:29'),
('8cc607b4-3302-492d-9844-ec52856cdd40', 'App\\Notifications\\NewChatMessage', 'App\\Models\\User', 21, '{\"title\":\"Krish Bhargav\",\"message\":\"Hi\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=3\",\"icon\":\"ti ti-message-circle\"}', '2026-07-06 06:14:15', '2026-07-06 06:10:08', '2026-07-06 06:14:15'),
('99f377f0-e50e-4c7d-b08a-a911cc70242f', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 21, '{\"title\":\"New Task Assigned\",\"message\":\"\\\"Whatsapp  Intigration\\\" \\u2014 due 09 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/3\",\"icon\":\"ti ti-clipboard-list\"}', '2026-07-06 04:30:10', '2026-07-04 14:25:43', '2026-07-06 04:30:10'),
('9ca9a7b6-1979-442e-8f43-06ec669a754c', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 3, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/8\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 06:43:37', '2026-07-04 06:39:40', '2026-07-04 06:43:37'),
('9d88f6c4-3210-47b6-adde-bf0dffde8d1f', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 19, '{\"title\":\"New Task Assigned\",\"message\":\"\\\"Independence Day\\\" \\u2014 due 08 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/7\",\"icon\":\"ti ti-clipboard-list\"}', NULL, '2026-07-04 14:59:05', '2026-07-04 14:59:05'),
('a8e6f6d5-310d-45b5-981a-f7d8a050b178', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 1, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (1.0 day(s), 01 Jul 2026 to 01 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/15\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 15:43:42', '2026-07-04 09:10:36', '2026-07-04 15:43:42'),
('ab3ed2c6-8ac6-4e45-bff3-038336e6c49b', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 3, '{\"title\":\"New Task Assigned\",\"message\":\"\\\"Independence Day\\\" \\u2014 due 10 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\",\"icon\":\"ti ti-clipboard-list\"}', NULL, '2026-07-04 14:27:21', '2026-07-04 14:27:21'),
('aed5d005-026e-41d2-9ea3-119de7b5e5e4', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 1, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 01 Jul 2026 to 02 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/14\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 15:43:42', '2026-07-04 08:15:35', '2026-07-04 15:43:42'),
('b8ff2c2c-c276-4acd-a1a3-cbdfcf3c0c2c', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 1, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Sick Leave (2.0 day(s), 01 Jul 2026 to 02 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/13\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 08:09:56', '2026-07-04 08:09:14', '2026-07-04 08:09:56'),
('bc2e5895-0730-4d3f-a933-b42f786b1133', 'App\\Notifications\\NewChatMessage', 'App\\Models\\User', 23, '{\"title\":\"Iyyapan\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=2\",\"icon\":\"ti ti-message-circle\"}', NULL, '2026-07-06 06:03:06', '2026-07-06 06:03:06'),
('bfee2a43-efd0-4608-a7c5-55d723251de9', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 3, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (1.0 day(s), 01 Jul 2026 to 01 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/15\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 09:42:29', '2026-07-04 09:10:36', '2026-07-04 09:42:29'),
('c03d3a43-5356-4588-976a-05073e71b973', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 21, '{\"title\":\"New Task Assigned\",\"message\":\"\\\"Varasiddhi Vinayaka Vrata (Ganesh Chaturthi)\\\" \\u2014 due 01 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/6\",\"icon\":\"ti ti-clipboard-list\"}', '2026-07-06 04:30:09', '2026-07-04 14:57:13', '2026-07-06 04:30:09'),
('d3c2f8e4-abb3-4629-b921-aaf718f215e5', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 1, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/16\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 15:43:42', '2026-07-04 09:12:01', '2026-07-04 15:43:42'),
('d406393e-b5aa-4807-a03f-169e24b5c988', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 3, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/12\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 09:42:29', '2026-07-04 07:59:01', '2026-07-04 09:42:29'),
('d8177cb9-13be-48d4-857f-4a30e0c6267e', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 1, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 01 Jul 2026 to 02 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/9\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 07:16:45', '2026-07-04 07:15:30', '2026-07-04 07:16:45'),
('e273e184-f2d6-4256-8fff-aa815d8bd384', 'App\\Notifications\\TaskAssigned', 'App\\Models\\User', 23, '{\"title\":\"New Task Assigned\",\"message\":\"\\\"Whatsapp  Intigration\\\" \\u2014 due 06 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/2\",\"icon\":\"ti ti-clipboard-list\"}', NULL, '2026-07-04 14:01:18', '2026-07-04 14:01:18'),
('e449820e-7d84-4c59-bbcc-186d48f9ebcc', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 3, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/7\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 06:43:37', '2026-07-04 06:38:50', '2026-07-04 06:43:37'),
('f7cdaad3-037a-4c9a-8007-5bcaf0aaa1ba', 'App\\Notifications\\LeaveRequestSubmitted', 'App\\Models\\User', 3, '{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/10\",\"icon\":\"ti ti-calendar-event\"}', '2026-07-04 09:42:30', '2026-07-04 07:22:39', '2026-07-04 09:42:30');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_transactions`
--

CREATE TABLE `payment_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `registration_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `source` enum('checkout','webhook','reconcile','manual') NOT NULL DEFAULT 'checkout',
  `event` varchar(60) DEFAULT NULL,
  `razorpay_order_id` varchar(64) DEFAULT NULL,
  `razorpay_payment_id` varchar(64) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `raw_payload` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_transactions`
--

INSERT INTO `payment_transactions` (`id`, `registration_id`, `reference`, `source`, `event`, `razorpay_order_id`, `razorpay_payment_id`, `status`, `amount`, `raw_payload`, `created_at`) VALUES
(1, 1, 'BJ-260715-1398CA', 'checkout', 'order.created', 'order_TDlcEDoNOTiOA9', NULL, 'created', 30000.00, '{\"amount\":3000000,\"amount_due\":3000000,\"amount_paid\":0,\"attempts\":0,\"created_at\":1784116018,\"currency\":\"INR\",\"entity\":\"order\",\"id\":\"order_TDlcEDoNOTiOA9\",\"notes\":{\"course\":\"Data Engineering Certification Program\",\"name\":\"Jyoti\",\"phone\":\"8114637479\",\"reference\":\"BJ-260715-1398CA\"},\"offer_id\":null,\"receipt\":\"BJ-260715-1398CA\",\"status\":\"created\"}', '2026-07-15 06:16:59'),
(2, 2, 'BJ-260715-680145', 'checkout', 'order.created', 'order_TDlfmadABpzmRH', NULL, 'created', 30000.00, '{\"amount\":3000000,\"amount_due\":3000000,\"amount_paid\":0,\"attempts\":0,\"created_at\":1784116220,\"currency\":\"INR\",\"entity\":\"order\",\"id\":\"order_TDlfmadABpzmRH\",\"notes\":{\"course\":\"Data Engineering Certification Program\",\"name\":\"Jyoti\",\"phone\":\"8114637479\",\"reference\":\"BJ-260715-680145\"},\"offer_id\":null,\"receipt\":\"BJ-260715-680145\",\"status\":\"created\"}', '2026-07-15 06:20:20'),
(3, 3, 'BJ-260715-3C8996', 'checkout', 'order.created', 'order_TDliJ3HuBP3zfr', NULL, 'created', 30000.00, '{\"amount\":3000000,\"amount_due\":3000000,\"amount_paid\":0,\"attempts\":0,\"created_at\":1784116363,\"currency\":\"INR\",\"entity\":\"order\",\"id\":\"order_TDliJ3HuBP3zfr\",\"notes\":{\"course\":\"Data Engineering Certification Program\",\"name\":\"Jyoti\",\"phone\":\"8114637479\",\"reference\":\"BJ-260715-3C8996\"},\"offer_id\":null,\"receipt\":\"BJ-260715-3C8996\",\"status\":\"created\"}', '2026-07-15 06:22:44'),
(4, 4, 'BJ-260715-760DB6', 'checkout', 'order.created', 'order_TDmDjdzc43Ysf5', NULL, 'created', 30000.00, '{\"amount\":3000000,\"amount_due\":3000000,\"amount_paid\":0,\"attempts\":0,\"created_at\":1784118148,\"currency\":\"INR\",\"entity\":\"order\",\"id\":\"order_TDmDjdzc43Ysf5\",\"notes\":{\"course\":\"Data Engineering Certification Program\",\"name\":\"Jyoti\",\"phone\":\"8114637479\",\"reference\":\"BJ-260715-760DB6\"},\"offer_id\":null,\"receipt\":\"BJ-260715-760DB6\",\"status\":\"created\"}', '2026-07-15 06:52:29');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `module` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `module`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'view_dashboard', 'Main Menu', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(2, 'Leads Dashboard', 'view_leads_dashboard', 'Main Menu', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(3, 'Revenue Summary', 'view_revenue_summary_dashboard', 'Main Menu', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(4, 'Growth Dashboard', 'view_growth_dashboard', 'Main Menu', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(5, 'Chat', 'view_chat', 'Main Menu', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(6, 'Instagram', 'view_video_call', 'Main Menu', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(7, 'LinkedIn', 'view_audio_call', 'Main Menu', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(8, 'Youtube', 'view_call_history', 'Main Menu', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(9, 'Calendar', 'view_calendar', 'Main Menu', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(10, 'Email', 'view_email', 'Main Menu', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(11, 'To Do', 'view_todo', 'Main Menu', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(12, 'Notes', 'view_notes', 'Main Menu', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(13, 'File Manager', 'view_file_manager', 'Main Menu', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(14, 'Leads', 'view_leads', 'CRM', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(15, 'Payments', 'view_payments', 'CRM', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(16, 'Analytics', 'view_analytics', 'CRM', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(17, 'Tasks', 'view_tasks', 'PROJECTS', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(18, 'Milestones', 'view_milestones', 'PROJECTS', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(20, 'Campaigns', 'view_campaign', 'MARKETING', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(21, 'Email Campaigns', 'view_email_campaign', 'MARKETING', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(22, 'SMS Campaigns', 'view_sms_campaign', 'MARKETING', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(23, 'Social Campaigns', 'view_social_campaign', 'MARKETING', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(24, 'WhatsApp Campaigns', 'view_whatsapp_campaign', 'MARKETING', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(25, 'Email Marketing', 'view_email_marketing', 'MARKETING', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(26, 'Email Engagement', 'view_email_engagement', 'MARKETING', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(27, 'Manage Users', 'manage_users', 'User Management', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(28, 'Roles & Permissions', 'manage_roles', 'User Management', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(31, 'Attendance', 'view_attendance', 'HRM', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(32, 'Leave Requests', 'view_leave_requests', 'HRM', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(33, 'Holidays', 'view_holidays', 'HRM', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(34, 'Company Report', 'view_company_reports', 'Reports', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(35, 'Revenue Report', 'view_reports', 'Reports', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(36, 'Attendance Summary', 'view_attendance_summary_report', 'Reports', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(37, 'Leave Balance Summary', 'view_leave_balance_summary_report', 'Reports', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(38, 'Pages', 'view_pages', 'Content', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(39, 'All Blogs', 'view_blogs', 'Content', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(40, 'Blog Categories', 'view_blog_categories', 'Content', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(41, 'Blog Comments', 'view_blog_comments', 'Content', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(42, 'Blog Tags', 'view_blog_tags', 'Content', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(43, 'Countries', 'view_countries', 'Content', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(44, 'States', 'view_states', 'Content', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(45, 'Cities', 'view_cities', 'Content', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(46, 'Testimonials', 'view_testimonials', 'Content', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(47, 'FAQ', 'view_faq', 'Content', '2026-07-03 09:28:00', '2026-07-03 09:28:00'),
(48, 'Manage Holidays', 'manage_holidays', 'HRM', '2026-07-04 05:39:30', '2026-07-04 05:39:30'),
(49, 'View Students', 'view_students', 'Student Management', '2026-07-07 05:24:36', '2026-07-07 05:24:36'),
(50, 'Manage Masterclass', 'manage_masterclass', 'Student Management', '2026-07-07 05:24:36', '2026-07-07 05:24:36'),
(51, 'Manage Live Batches', 'manage_live_batches', 'Student Management', '2026-07-07 05:24:36', '2026-07-07 05:24:36'),
(52, 'Manage Class Attendance', 'manage_class_attendance', 'Student Management', '2026-07-07 05:24:36', '2026-07-07 05:24:36'),
(53, 'Manage Mock Test Results', 'manage_mock_test_results', 'Student Management', '2026-07-07 05:24:36', '2026-07-07 05:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `push_subscriptions`
--

CREATE TABLE `push_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscribable_type` varchar(255) NOT NULL,
  `subscribable_id` bigint(20) UNSIGNED NOT NULL,
  `endpoint` text NOT NULL,
  `public_key` varchar(255) DEFAULT NULL,
  `auth_token` varchar(255) DEFAULT NULL,
  `content_encoding` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `push_subscriptions`
--

INSERT INTO `push_subscriptions` (`id`, `subscribable_type`, `subscribable_id`, `endpoint`, `public_key`, `auth_token`, `content_encoding`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'https://fcm.googleapis.com/fcm/send/dZQY425aHhU:APA91bHWvHwDMA_ODb_47zQZiWv5Z8-G1gml3DxTvQPJBU_EbBz5W2pGN2j-cTvHTtLjMUpAmQsEzVKQlGiIR-yk-K4VHxY6sPMH9ciI2ljoBuMz5QdSqsniiA32IIKZDAqIAw7CK8Vt', 'BCdsltvgpMPm5-968kJS6tZPCSrJxlMFWW2yyc1Elr4oQd1fEYgPwhsP3Ub_Bt0iiibf6XGObiGKxnRZdxSa-ZQ', 'SCH0heEGenah8BtJ9VgNuA', NULL, '2026-07-04 15:45:13', '2026-07-04 15:45:13'),
(2, 'App\\Models\\User', 21, 'https://updates.push.services.mozilla.com/wpush/v2/gAAAAABqSSsHGZiFy9_EsPE13om7THGE6XQ41emd2B7DceKGTkDqzuADPctA_amLesX8rV-8KaY_JnHkXHIqOEdM2cYlu5UrEy-QYLf9K5kwGUZ0hgpkZPsB6fOvKIKosfZzcLgjMS7veC7hOsCX3U6n_pZH1xhYNiDRGuTttWYsfj0mkod_qtw', 'BBRQFXZN0dxA5wEEy-zqXGFDyf85jTmhNDTL_-QbVHUvo_cTn4iMYWjSRx3kmkT-HByTPFzu2yEN5tksCi0jIIQ', 'si6B-flzgMOgXCXls3WWDg', NULL, '2026-07-04 15:47:24', '2026-07-04 15:47:24'),
(3, 'App\\Models\\User', 1, 'https://updates.push.services.mozilla.com/wpush/v2/gAAAAABqSy8ZmK0AsH2SiIAgl2raBvKe9XV66D8ZmyA6UUiCN1O_yLS5TQkXO5ZeRi1lDrBkwMvc1zRcf19-sIXm9V10dq6meQqcWhSK5gLvM6HYimQetOoc3jUkqnEHX1u8fGhB8B9CwrPg7yV-TLqivShHbjcHOBX37YiNV1b2mhDiqD8Qzag', 'BHD8e1zii4HR3iWNF1pBBXZ6XHs0L-68Cqns8IS9An3SDmI5XuszOuxjLgn8e33ukC76K565hs9Ws7wJXQBaNXk', 'YWseCUqy6bJ0ipEtf_fN8g', NULL, '2026-07-06 04:29:17', '2026-07-06 04:29:17'),
(4, 'App\\Models\\User', 21, 'https://updates.push.services.mozilla.com/wpush/v2/gAAAAABqS0UyWrstjSxYX-Vgz5dkk-3LY259Q0kEHd-KUFomoOk3B-d686hRkcEmcCjrn-KZ7vKaQHhz-otilyjG8FRy-qFT5WU-L6p_l0zoh7fx8ekO9FbNlUbjOwr-8cC34Z8V2GjcF99GOmKR3LJ2jSUfkEKI494-Ggen93vVv6slNTlZDb4', 'BGLVhsg-psYYHKXK0wgJFogs0C50CRqAWjp06oBLlVD4wcuXH2B_oY6UdRU2WzPL4G76Z7wiExOUKJFuLrGNRCs', 'ID9yuW6qSJTZOgi7KFOTZA', NULL, '2026-07-06 06:03:32', '2026-07-06 06:03:32');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `role_code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `role_code`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'SUPER_ADMIN', 'Full system access', 1, '2026-07-02 06:34:30', '2026-07-02 06:34:30'),
(2, 'Admin', 'ADMIN', 'System Administrator', 1, '2026-07-02 06:34:30', '2026-07-02 06:34:30'),
(3, 'HR', 'HR', 'Human Resources', 1, '2026-07-02 06:34:30', '2026-07-02 06:34:30'),
(4, 'Sales Manager', 'SALES_MANAGER', 'Sales Team Manager', 1, '2026-07-02 06:34:30', '2026-07-02 06:34:30'),
(5, 'Sales Executive', 'SALES_EXECUTIVE', 'Sales Executive', 1, '2026-07-02 06:34:30', '2026-07-02 06:34:30'),
(6, 'Marketing Manager', 'MARKETING_MANAGER', 'Marketing Manager', 1, '2026-07-02 06:34:30', '2026-07-02 06:34:30'),
(7, 'Marketing Executive', 'MARKETING_EXECUTIVE', 'Marketing Executive', 1, '2026-07-02 06:34:30', '2026-07-02 06:34:30'),
(8, 'Trainer', 'TRAINER', 'Trainer', 1, '2026-07-02 06:34:30', '2026-07-02 06:34:30'),
(9, 'Student Counselor', 'STUDENT_COUNSELOR', 'Student Counselor', 1, '2026-07-02 06:34:30', '2026-07-02 06:34:30'),
(10, 'Support Executive', 'SUPPORT_EXECUTIVE', 'Support Executive', 1, '2026-07-02 06:34:30', '2026-07-02 06:34:30'),
(11, 'Accountant', 'ACCOUNTANT', 'Accounts Department', 1, '2026-07-02 06:34:30', '2026-07-02 06:34:30'),
(12, 'Employee', 'EMPLOYEE', 'General Employee', 1, '2026-07-02 06:34:30', '2026-07-02 06:34:30'),
(14, 'Head Of Operations', 'HEAD_OF_OPERATIONS', 'Oversees overall company operations', 1, '2026-07-02 15:29:48', '2026-07-02 15:29:48'),
(15, 'HR Manager', 'HR_MANAGER', 'Manages HR team and lead assignments', 1, '2026-07-02 15:29:48', '2026-07-02 15:29:48'),
(16, 'HR - Team Lead', 'HR_TEAM_LEAD', 'Leads a team of HR executives', 1, '2026-07-02 15:29:48', '2026-07-02 15:29:48'),
(17, 'HR Admin', 'HR_ADMIN', 'Handles HR administrative tasks', 1, '2026-07-02 15:29:48', '2026-07-02 15:29:48'),
(18, 'Social Media Manager', 'SOCIAL_MEDIA_MANAGER', 'Manages social media presence', 1, '2026-07-02 15:29:48', '2026-07-02 15:29:48'),
(19, 'Media Strategist', 'MEDIA_STRATEGIST', 'Runs ad campaigns and adds leads', 1, '2026-07-02 15:29:48', '2026-07-02 15:29:48'),
(20, 'Data Engineer Trainer', 'DATA_ENGINEER_TRAINER', 'Trains students in data engineering', 1, '2026-07-02 15:29:48', '2026-07-02 15:29:48'),
(21, 'Tech Manager', 'TECH_MANAGER', 'Manages the technical team', 1, '2026-07-02 15:29:48', '2026-07-02 15:29:48'),
(22, 'Tech Mentor', 'TECH_MENTOR', 'Mentors students on technical topics', 1, '2026-07-02 15:29:48', '2026-07-02 15:29:48');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(760, 14, 39, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(761, 14, 40, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(762, 14, 41, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(763, 14, 42, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(764, 14, 45, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(765, 14, 43, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(766, 14, 47, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(767, 14, 38, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(768, 14, 44, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(769, 14, 46, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(770, 14, 16, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(771, 14, 14, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(772, 14, 15, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(773, 14, 31, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(774, 14, 33, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(775, 14, 32, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(776, 14, 48, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(777, 14, 9, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(778, 14, 5, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(779, 14, 1, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(780, 14, 10, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(781, 14, 13, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(782, 14, 4, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(783, 14, 6, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(784, 14, 2, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(785, 14, 7, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(786, 14, 12, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(787, 14, 3, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(788, 14, 11, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(789, 14, 8, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(790, 14, 20, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(791, 14, 21, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(792, 14, 26, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(793, 14, 25, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(794, 14, 22, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(795, 14, 23, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(796, 14, 24, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(797, 14, 18, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(798, 14, 17, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(800, 14, 36, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(801, 14, 34, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(802, 14, 37, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(803, 14, 35, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(804, 14, 27, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(805, 14, 28, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(806, 1, 39, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(807, 1, 40, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(808, 1, 41, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(809, 1, 42, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(810, 1, 45, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(811, 1, 43, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(812, 1, 47, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(813, 1, 38, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(814, 1, 44, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(815, 1, 46, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(816, 1, 16, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(817, 1, 14, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(818, 1, 15, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(819, 1, 31, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(820, 1, 33, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(821, 1, 32, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(822, 1, 48, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(823, 1, 9, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(824, 1, 5, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(825, 1, 1, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(826, 1, 10, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(827, 1, 13, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(828, 1, 4, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(829, 1, 6, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(830, 1, 2, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(831, 1, 7, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(832, 1, 12, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(833, 1, 3, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(834, 1, 11, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(835, 1, 8, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(836, 1, 20, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(837, 1, 21, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(838, 1, 26, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(839, 1, 25, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(840, 1, 22, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(841, 1, 23, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(842, 1, 24, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(843, 1, 18, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(844, 1, 17, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(846, 1, 36, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(847, 1, 34, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(848, 1, 37, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(849, 1, 35, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(850, 1, 27, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(851, 1, 28, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(852, 11, 16, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(853, 11, 14, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(854, 11, 9, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(855, 11, 5, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(856, 11, 10, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(857, 11, 13, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(858, 11, 12, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(859, 11, 11, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(860, 15, 16, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(861, 15, 14, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(862, 15, 15, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(863, 15, 31, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(864, 15, 33, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(865, 15, 32, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(866, 15, 9, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(867, 15, 5, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(868, 15, 10, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(869, 15, 13, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(870, 19, 16, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(871, 19, 14, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(872, 19, 33, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(873, 19, 32, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(874, 19, 9, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(875, 19, 5, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(876, 19, 10, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(877, 19, 13, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(878, 19, 12, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(879, 19, 11, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(880, 19, 17, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(881, 18, 33, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(882, 18, 32, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(883, 18, 9, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(884, 18, 5, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(885, 18, 10, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(886, 18, 13, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(887, 18, 4, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(888, 18, 6, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(889, 18, 7, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(890, 18, 12, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(891, 18, 11, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(892, 18, 8, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(893, 18, 17, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(894, 2, 48, '2026-07-04 14:55:55', '2026-07-04 14:55:55'),
(895, 1, 49, '2026-07-07 05:24:36', '2026-07-07 05:24:36'),
(896, 1, 50, '2026-07-07 05:24:36', '2026-07-07 05:24:36'),
(897, 1, 51, '2026-07-07 05:24:36', '2026-07-07 05:24:36'),
(898, 1, 52, '2026-07-07 05:24:36', '2026-07-07 05:24:36'),
(899, 1, 53, '2026-07-07 05:24:36', '2026-07-07 05:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('xhn79zuyNRfa9Sz82TEnUwl8g8t2Xc9z9ld2WLMY', 21, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkFUMzFsSnoydVVucWZSOEhtSXN1YTVWejhlUm5tZjkwNlJpNTBFdCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjE7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783950503),
('Xr7B1on7Z1kRCJyJPGA07ZSQjeTT0rJvjRExoTxo', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSlEwZ1ZsNnlwNmtDTHRuTjh0d1dNT2pva2dmUFc1bW1tdlR3YlFkQiI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2V4cGVuc2VzIjtzOjU6InJvdXRlIjtzOjE0OiJleHBlbnNlcy5pbmRleCI7fX0=', 1783950498),
('zAIfrNt4SdnspUvI1Eq22WMNP26yCkg4JaMUAn6G', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWG5VZkdxb2xSSVkwMVBnMlQ5UTAzWm13c0NCdldkUlQ0OEZFVTJObSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo4OiJ3aXNobGlzdCI7YToyOntpOjA7czoxNDoiZGF0YS1hbmFseXRpY3MiO2k6MTtzOjEwOiJhZ2VudGljLWFpIjt9fQ==', 1784118149);

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `platform` enum('instagram','youtube') NOT NULL DEFAULT 'instagram',
  `label` varchar(255) NOT NULL,
  `ig_user_id` varchar(255) DEFAULT NULL,
  `channel_id` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `profile_picture_url` text DEFAULT NULL,
  `biography` text DEFAULT NULL,
  `following_count` int(10) UNSIGNED DEFAULT NULL,
  `access_token` text NOT NULL,
  `token_expires_at` timestamp NULL DEFAULT NULL,
  `last_synced_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `last_error` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_accounts`
--

INSERT INTO `social_accounts` (`id`, `platform`, `label`, `ig_user_id`, `channel_id`, `username`, `account_type`, `profile_picture_url`, `biography`, `following_count`, `access_token`, `token_expires_at`, `last_synced_at`, `is_active`, `last_error`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'instagram', 'Krish Personal', '37644210048499313', NULL, 'drkrishbharggav6666', 'MEDIA_CREATOR', 'https://scontent.cdninstagram.com/v/t51.82787-19/616172023_18551678605059790_7845932485370873259_n.jpg?stp=dst-jpg_s206x206_tt6&_nc_cat=110&ccb=7-5&_nc_sid=bf7eb4&efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLnd3dy4xMDgwLkMzIn0%3D&_nc_ohc=Eifq2uQvaEoQ7kNvwHUjw2s&_nc_oc=AdoDecjF61FdawuXJ7W7ZvIOHi2jDBN9O_mrNnePqHCaIUu0q56Km7E0nZIWipKS5TY&_nc_zt=24&_nc_ht=scontent.cdninstagram.com&edm=AP4hL3IEAAAA&_nc_gid=IvA-sfKR-1R-ITZ3VnP_rw&_nc_tpa=Q5bMBQGlI1w0g7JHGHlU0KFWhGF89OspzqjqKbfaMLsGjWEpAPB0f9EfLY28s3ZwaVrM6Bgo5eHPBpQk-g&oh=00_AQCne7_gBQjl2SBFssL1B3GSsBzxL4vRn8kpWzWWCZq-Rw&oe=6A5266F4', 'A page dedicated for human values and emotions.  \nFounder @taurus_ai & @browsejobs_6666  & @theofferletter6\nMama\'s boy forever!', 864, 'eyJpdiI6Ik1IS3pBMnpSVHZkOU14RWE0WFB4ZVE9PSIsInZhbHVlIjoiTnNwb1hEL1ZMSGJuNDVmbytVMHZTQlNDT2M0T0tuMm5pL3drUVlicGNZb2xxdlU5eUZZdEtJcC9lMWozMUEyMy9Ya2VjMmVjSHhqSW41cWp4QUxTNVQ5cmdnUmZMSjh0SEorTjVwTGlvU2VoeUFoc0xYelE5SHpZeTFMNlg2ZlhBU2ErWDQ2elpLbTBmVndxV0U3eWx0WWhmOUxGTG5GN3RjOTUraUs2U2ZtcHF5Mm1lWTRVY0xTL0tvK0QvTWNZc3BLUWRMMTFuUXRzVXA0LzFXV3NjTlQzU3FuOXAwWlpDUUNFN252eThrNEhtMlZzV0VZTGc3SVJjTVM1NVFyYyIsIm1hYyI6IjMxYjJkNjlhYTc4OGNhZGM0MTA0NWM1ZmNmODcxYjQzYTk4Y2YyYjY4OTM1YzU5ZjcxYWY3YWQwNzIxNmIxZjYiLCJ0YWciOiIifQ==', NULL, '2026-07-07 04:35:26', 1, NULL, 1, '2026-07-06 08:03:36', '2026-07-07 04:35:26'),
(3, 'instagram', 'The offer letter', '27488886024101191', NULL, 'theofferletter6', 'MEDIA_CREATOR', 'https://scontent.cdninstagram.com/v/t51.82787-19/683688805_18121153342566765_4727707177300800385_n.jpg?stp=dst-jpg_s206x206_tt6&_nc_cat=103&ccb=7-5&_nc_sid=bf7eb4&efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLnd3dy4xMDgwLkMzIn0%3D&_nc_ohc=huAptaolG5MQ7kNvwFVg4d7&_nc_oc=Adouic1wUcpAsb7lKNJncusfVQj_41uC2z9U_MuTY8J986kHZwRAtaWrXt5B2P_SdsA&_nc_zt=24&_nc_ht=scontent.cdninstagram.com&edm=AP4hL3IEAAAA&_nc_gid=vmpNisB3Z3OxSpoyO9r_Ug&_nc_tpa=Q5bMBQEH-k8D5StBtybT4oxqbGnll-7FDZc3EmZ9px3L6dj-N4erTYRTZrMC3AA0JmuFx7r61IdwaT4oLA&oh=00_AQCrtr5t1Q2_CijQujL6f4i337b1MGU3r6NnTM7yIbTM2g&oe=6A52CB1E', 'Where offers are earned.\nCHROs, CEOs & Founders. Unfiltered. Unapologetic\n🎙️@drkrishbharggav6666 | CEO, Browsejobs, Taurus AI\n📺 New ep every week ↓', 25, 'eyJpdiI6IlBRY3hjRjUxSEkwSGx0Skg2MlVPR1E9PSIsInZhbHVlIjoidXFrY0c4ZEt3QWpmRHplc1VWcmpwSmt0NEdlbDJrV0orSUVyeFZYWnFPTXJ5QWM2MEVtSmhhWU83Z1FjL3FJT3BmZ215SmVYNFpxZVc2bUJhbFNXeVFQdDVTL24zOENZVmhkRHlYWGx0cnJPKy95UndMY0d3VzBHTEpvdlgwM0ZMT21oTVVOVFNxL01tZVZvNHZqeDNKY1NqTmtvRm0yTjc0T1dnblRLYUtxWnZ5MGRPMEJhRWpUc0xwQlF4RklSK0psVVZXbU9OVGtPVEIzOW1DY0I1em94NmYzczJVeWxaNTdtblVmWStNSnZVTUZ3WmJHWWZCMUJnbGcwbmQ0KyIsIm1hYyI6IjM3NWZhYTc5NGE3ZWFlZTY5YTQ0YWIyNjcwZWVhYzJlOTc5MDk5ZmE0NWU2NTY0NTBmMTAwZjFhMWI2MzZjYTciLCJ0YWciOiIifQ==', NULL, '2026-07-07 12:30:41', 1, NULL, 1, '2026-07-06 08:04:21', '2026-07-07 12:30:41'),
(4, 'instagram', 'Browsejobs', '27660677360211322', NULL, 'browsejobs_6666', 'MEDIA_CREATOR', 'https://scontent.cdninstagram.com/v/t51.2885-19/409344802_3611604122492242_4313746897220759078_n.jpg?stp=dst-jpg_s206x206_tt6&_nc_cat=107&ccb=7-5&_nc_sid=bf7eb4&efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLnd3dy4xMDgwLkMzIn0%3D&_nc_ohc=OuqhPytQovsQ7kNvwEcw8Qo&_nc_oc=Adr6S5hE0iApBvYLaxJ-3QJVbFjqowIcxbaDel64J8O4h6D-Op_NZ2DvMP7o5riOkQE&_nc_zt=24&_nc_ht=scontent.cdninstagram.com&edm=AP4hL3IEAAAA&_nc_tpa=Q5bMBQGq1T_W2U6ka8Q8l9xTZ0nIpPndzxKSrZrB9r6-LKK-RrDLvsRx7-iBlqseZdkzeN6Z-QBv0Y1b8g&oh=00_AQBosMdNVuNDhBrekQHYfhgH8fNajbEuoAB8oaF7kW9OSw&oe=6A524C79', 'India\'s #1 Platform in Tech Upskilling​\nFrom Non-Tech to Tech | 1L+ Alumni | 1000+ Companies \nCourses, Mock Interviews & Job Leads \nStart Today!', 33, 'eyJpdiI6IjY2emgxaW05YXZOT3NyL2V1RXp0anc9PSIsInZhbHVlIjoicGhsR3ViYXRXU0dTT2hYd1NBcUFobUM0RGl1MDRHK05HcFhTSk9MOW1ac2lHRUMzaC9HWURRbkhHUGpWcitORWt3RFd6QTN1OWFtTVJOZFNWS3ZHVUpRbVBhZGNnWkdRVG1rZ0tNQjJKVGlWd3VZR0JJQWUydVQ0NTNKQmxoZjFrY2R6eUc2SmcxUTlzVnllaHVHQng0Z2NkaFRnTWZBZWg2bVowYXBSVDROcSsxZ29FOTNLOWtWQzdKckhJWTd5M2xhOEV6N1RKZ0NQY1o0WjN1ZDNET2drMTBKRHI4VVNMOFdKS0FmV0dLck54TTVIN1UvL1BxWUw2NVJyNkVJMCIsIm1hYyI6ImQzODE1M2M2ZDhkYjQwN2U0NWZmZmQxMGRhNGY3MTJkYjYwYjA0ODdlN2FjZTcyMDQ3N2UzYTAyMjZhOGY3N2EiLCJ0YWciOiIifQ==', NULL, '2026-07-07 04:35:32', 1, NULL, 1, '2026-07-06 08:04:57', '2026-07-07 04:35:32'),
(6, 'youtube', 'The Offer Letter with Dr. Krish Bharggav', NULL, 'UClTUoH9pkYdDcCxBbAI7kLg', 'The Offer Letter with Dr. Krish Bharggav', NULL, 'https://yt3.ggpht.com/VbfqLYO69tmlWaN0LIf7knLDNrhtt_kUF1o6TUElmwG2j3hK3Oblkzj042yTcdK7I-rkd4HQpTU=s88-c-k-c0x00ffffff-no-rj', 'The Offer Letter | Hosted by Dr. Krish Bharggav. A podcast where India\'s top business leaders tell the story that never makes it onto the resume. \n\nThe real version — the failures, the pivots, the decisions that kept them up at night.\n\nHosted by Dr. Krish Bharggav  entrepreneur, talent disruptor, and founder of BrowseJobs and Taurus AI sitting across from the CEOs, CHRO\'s, and Founders actually building India\'s workforce. \n\nAsking the questions everyone else is too polished to ask.These guests have managed thousands of people, survived industry collapses, and built companies from scratch. \n\nThey\'re here to tell you exactly how they did it. And what they wish someone had told them. No scripts. No PR answers. No carefully managed narratives. \n\nJust two people in a room and the truth between them.New episodes every week.\n\n Subscribe so you don\'t miss a conversation that could change how you think about your career.\n\n\n🎙️ The Offer Letter — India\'s most honest career conversations.\n', 199, 'eyJpdiI6IlNkRCt6YVdlUFBqQTdqZXdHbzlIaGc9PSIsInZhbHVlIjoiNUdKZi8rbys3N3lITHpBcGdtdGVTczg5QW1DNElEMjZOV3F6cExrQmVaOGtHRWswVm9aRy9YTW0yaitQU2xiTiIsIm1hYyI6ImMwYmUzOWVkOTQzMjAwZGJkY2JhNDI4NjE2M2YyZTJiZjQ3NGVlNGJiM2E4YmJlYWM2ZTQ1M2FhOTRhYjU0ZmMiLCJ0YWciOiIifQ==', NULL, '2026-07-08 05:33:10', 1, NULL, 1, '2026-07-06 08:55:00', '2026-07-08 05:33:10');

-- --------------------------------------------------------

--
-- Table structure for table `social_media_stats`
--

CREATE TABLE `social_media_stats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `social_account_id` bigint(20) UNSIGNED NOT NULL,
  `stat_date` date NOT NULL,
  `followers_count` int(10) UNSIGNED DEFAULT NULL,
  `posts_today` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reach` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_media_stats`
--

INSERT INTO `social_media_stats` (`id`, `social_account_id`, `stat_date`, `followers_count`, `posts_today`, `reach`, `created_at`, `updated_at`) VALUES
(1, 2, '2026-07-06', 162589, 0, 134, '2026-07-06 08:03:38', '2026-07-06 09:20:53'),
(2, 3, '2026-07-06', 2731, 5, 592, '2026-07-06 08:04:24', '2026-07-06 12:11:13'),
(3, 4, '2026-07-06', 10439, 0, 1815, '2026-07-06 08:05:00', '2026-07-06 12:11:07'),
(5, 6, '2026-07-06', 279, 5, 37763, '2026-07-06 08:55:01', '2026-07-06 10:59:42'),
(6, 3, '2026-07-07', 2728, 0, 43, '2026-07-07 04:35:21', '2026-07-07 12:30:32'),
(7, 2, '2026-07-07', 162551, 0, 1507, '2026-07-07 04:35:26', '2026-07-07 04:35:26'),
(8, 4, '2026-07-07', 10444, 0, 4203, '2026-07-07 04:35:32', '2026-07-07 04:35:32'),
(9, 6, '2026-07-07', 281, 0, 37940, '2026-07-07 12:31:19', '2026-07-07 12:31:19'),
(10, 6, '2026-07-08', 284, 0, 38195, '2026-07-08 05:33:10', '2026-07-08 05:33:10');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `external_id`, `first_name`, `last_name`, `full_name`, `email`, `phone_number`, `status`, `created_at`, `updated_at`) VALUES
(1, '6a4784bb39db0a2f1f864f93', 'test', 'user', 'test user', 'test@123.com', '99999999999', 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(2, '6a476733ab176e4034a51a08', 'Ishu', 'User', 'Ishu User', 'ethickerhumanoid@gmail.com', '', 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(3, '6a47672a661f9d48e2fcc533', 'Krishna', 'Bharggav', 'Krishna Bharggav', 'jyoti1@gmail.com', '+919337367467', 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(4, '6a4766d7661f9d48e2fca53f', 'Krishna', 'Bharggav', 'Krishna Bharggav', 'krishnabharggav@gmail.com', '+918114637479', 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(5, '6a4762fe13cd70499eaa98ad', 'Test', 'Student', 'Test Student', 'student@test.com', '+919999999993', 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(6, '6a44ff660532b93120969d88', 'Kunal', 'Behera', 'Kunal Behera', 'princejyotiranjanbehera@gmail.com', NULL, 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(7, '6a44ff260532b93120969d25', 'Jyotiranjan', 'Behera', 'Jyotiranjan Behera', 'behera.jyotiranjan2018@gmail.com', NULL, 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(8, '6a449ed80532b93120945957', 'Jyotiranjan', 'Behera', 'Jyotiranjan Behera', 'jyotiranjanbehera013@gmail.com', '08114637479', 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(9, '6a42a1c60532b93120923fbf', 'Test', 'User01', 'Test User01', 'testuser01@example.com', '1111111111', 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(10, '6a405f910532b931208e397c', 'Azaan', 'Rehman', 'Azaan Rehman', 'azee.rehman@outlook.com', '6476558116', 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(11, '6a3e1d870532b931208bfe07', 'Mohd Akram', 'Khan', 'Mohd Akram Khan', 'akramkh2407backup@gmail.com', NULL, 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(12, '6a3a2d9f0532b9312085d9ff', 'RENUKA', 'KARADAGI', 'RENUKA KARADAGI', 'renukakaradagi12@gmail.com', '8618757075', 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(13, '6a3409acf5221f8780aa3a36', 'Martina', 'Ottieri', 'Martina Ottieri', 'martina.ottieri@gmail.com', NULL, 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(14, '6a2ea5ddf5221f8780a2132e', 'Jagdish', 'Patil', 'Jagdish Patil', 'patiljagadish5636@gmail.com', '+917378875636', 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(15, '6a298678f5221f87809a0dc8', 'BALACHANDRA SRIRAM M', '717822I106', 'BALACHANDRA SRIRAM M 717822I106', '717822i106@kce.ac.in', NULL, 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(16, '6a22f608f7e94a0d6d7f6375', 'Thiago', 'Barros Silva', 'Thiago Barros Silva', 'thiago992017@gmail.com', NULL, 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(17, '6a21434ff7e94a0d6d7d22a3', 'Balu', 'Gharat', 'Balu Gharat', 'balugharat01@gmail.com', '+918605067148', 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(18, '6a205596f7e94a0d6d7b42dd', 'Gem', 'Saphira', 'Gem Saphira', 'gemsaphira1@gmail.com', NULL, 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(19, '6a1a54dbf7e94a0d6d71087b', 'Neeraj', 'Walasang', 'Neeraj Walasang', 'neerajsw9@gmail.com', NULL, 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(20, '6a191234f7e94a0d6d6f02f1', 'Nitin', 'Tambe', 'Nitin Tambe', 'nitinct1@gmail.com', '7208863743', 'active', '2026-07-07 05:02:46', '2026-07-07 05:02:46'),
(21, '6a169c85f7e94a0d6d6cb106', 'Samrat', 'Abcd', 'Samrat Abcd', 'samratabcd4@gmail.com', NULL, 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(22, '6a15b402f7e94a0d6d6ad003', 'Sanathoi', 'Wahengbam', 'Sanathoi Wahengbam', 'sanathoiwahengbam1826@gmail.com', NULL, 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(23, '6a139630f7e94a0d6d66a584', 'zeyyora_', 'Name', 'zeyyora_ Name', 'gangbora2@gmail.com', NULL, 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(24, '6a0d91c8f7e94a0d6d5e3048', 'Abhijit', 'Dutta', 'Abhijit Dutta', 'abhijit2dutta@gmail.com', NULL, 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(25, '6a0d5badf7e94a0d6d5e12d3', 'Chaitrali', 'Madane', 'Chaitrali Madane', 'chaitralimadane22@gmail.com', NULL, 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(26, '6a0b4c0af7e94a0d6d5a2f5c', 'Gouttam', 'kumar', 'Gouttam kumar', 'gouttamkumar014@gmail.com', '+919938289179', 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(27, '6a08abe2f7e94a0d6d560ca6', 'Joys', 'Disc', 'Joys Disc', 'tutorialchanel8090@gmail.com', NULL, 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(28, '6a0741a2f7e94a0d6d5401e7', 'Sreeja', 'J', 'Sreeja J', 'srijajacob@gmail.com', '9384128448', 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(29, '6a034f02f7e94a0d6d4dee6c', 'A', 'Kumar', 'A Kumar', 'ajay.iihs@gmail.com', '+918218537743', 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(30, '6a022f50f7e94a0d6d4bed34', 'Himanshu', 'Bhosale', 'Himanshu Bhosale', 'himanshubhosale045@gmail.com', '+917757965090', 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(31, '6a01e32bf7e94a0d6d4be160', 'Sarah', 'Ayamba', 'Sarah Ayamba', 'ayambasarah7@gmail.com', NULL, 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(32, '6a015214f7e94a0d6d49f0c3', 'Dibbyo', 'Bhattacharjee', 'Dibbyo Bhattacharjee', 'bhatt9652db@gmail.com', NULL, 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(33, '69fe3735f7e94a0d6d45d8ff', 'Pallavi', 'Dasari', 'Pallavi Dasari', 'dasaripallavi2113@gmail.com', NULL, 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(34, '69fcc53df7e94a0d6d43d178', 'Tanmayee', 'Rathod', 'Tanmayee Rathod', 'rtanmayee.28@gmail.com', '+919423397012', 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(35, '69fc4fe1da026fa96f0f9109', 'Lakshmi', 'R', 'Lakshmi R', 'lakshmiramesh202004@gmail.com', NULL, 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(36, '69fb2e5a415467e0a6c2efd6', 'SHUBHAM', 'SINDHU', 'SHUBHAM SINDHU', 'shubhamsindhu2712@gmail.com', NULL, 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(37, '69fb0f16415467e0a6c2d328', 'Avijit', 'Das', 'Avijit Das', 'ad094653@gmail.com', '8917483255', 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(38, '69fb04ee415467e0a6c2d1c7', 'Aravind', 'j', 'Aravind j', 'japaravind@gmail.com', NULL, 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(39, '69fb0416415467e0a6c2d17d', 'Ritesh gupta', 'gupta', 'Ritesh gupta gupta', 'rajaguptagupta518@gmail.com', NULL, 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(40, '69faf9ed415467e0a6c2cefe', 'Pavan', 'Setty', 'Pavan Setty', 'pavansetty361@gmail.com', NULL, 'active', '2026-07-07 05:02:47', '2026-07-07 05:02:47'),
(41, '69faf771415467e0a6c2cd6d', 'Sanika', 'karande', 'Sanika karande', 'sanikakarande108@gmail.com', '8624918593', 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(42, '69faf6b5415467e0a6c2cd18', 'Gaurav', 'Mishra', 'Gaurav Mishra', 'gauravmishra.m123@gmail.com', NULL, 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(43, '69faf64a415467e0a6c2cc81', 'Reddy', 'Kumar', 'Reddy Kumar', 'kumarreddy1898@gmail.com', NULL, 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(44, '69f9cbc4415467e0a6c0b3a0', 'Dhass', 'Pp', 'Dhass Pp', 'dhasspp259@gmail.com', NULL, 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(45, '69f8a262415467e0a6bec847', 'Sanket', 'Sambhaji Desai', 'Sanket Sambhaji Desai', 'dsanket173@gmail.com', '+919921743083', 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(46, '69f65ba1415467e0a6ba3b0c', 'VSP', 'Kumar', 'VSP Kumar', 'vspkumar1998@gmail.com', NULL, 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(47, '69f597f5415467e0a6b99130', 'Vinod', 'Bodke', 'Vinod Bodke', 'vinodbodke.dev@gmail.com', '+919307670345', 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(48, '69f597d9415467e0a6b98fcc', 'Vaishnavi', 'Dhimate', 'Vaishnavi Dhimate', 'vaishnavidhimate@gmail.com', '+917498135151', 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(49, '69f597bb415467e0a6b98e60', 'VAIISHAALINI', 'Unknown', 'VAIISHAALINI Unknown', 'vaiishaalini2001@gmail.com', '+919790011928', 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(50, '69f597a4415467e0a6b98d05', 'Sai', 'Charitha', 'Sai Charitha', 'saicharithathalapaneni149@gmail.com', '+917075750278', 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(51, '69f59795415467e0a6b98ba9', 'TANMAY', 'JAGNADE', 'TANMAY JAGNADE', 'tanmayjagnade2000@gmail.com', '+918408995833', 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(52, '69f59774415467e0a6b98a2f', 'Suvankar', 'Dey', 'Suvankar Dey', 'suvankarkumardey@gmail.com', '+917478152564', 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(53, '69f59759415467e0a6b988c5', 'Suma', 'S T', 'Suma S T', 'suma72047@gmail.com', '+917204759154', 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(54, '69f59749415467e0a6b98771', 'Siddharth', 'Shinde', 'Siddharth Shinde', 'shinderanjeet100@gmail.com', '+918291769027', 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(55, '69f59732415467e0a6b97cc1', 'SHAM', 'Unknown', 'SHAM Unknown', 'bsham2296@gmail.com', '+919113894835', 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(56, '69f59718415467e0a6b970d0', 'SATISH', 'KOTADIYA', 'SATISH KOTADIYA', 'satishkotadiya2013@gmail.com', '+919724791735', 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(57, '69f59703415467e0a6b9679f', 'Sanskar', 'Jeswani', 'Sanskar Jeswani', 'sanskarjeswani4501@gmail.com', '+917895866251', 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(58, '69f596ea415467e0a6b95ccd', 'Sanjay', 'Prajapati', 'Sanjay Prajapati', 'sp9790447@gmail.com', '+918881262370', 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(59, '69f596d7415467e0a6b9545b', 'SAI', 'VAIBHAV', 'SAI VAIBHAV', 'vaibhavsarala785@gmail.com', '+918088939931', 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(60, '69f596af415467e0a6b943ab', 'Sahana', 'HS', 'Sahana HS', 'hssahana05@gmail.com', '+918867568587', 'active', '2026-07-07 05:02:48', '2026-07-07 05:02:48'),
(61, '69f5969a415467e0a6b93a7f', 'SAGAR', 'Unknown', 'SAGAR Unknown', 'sagarp.info@gmail.com', '+918310516998', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(62, '69f5967e415467e0a6b92e97', 'Rajasekhar', 'Reddy Pappireddy', 'Rajasekhar Reddy Pappireddy', 'rajasekhar3889@gmail.com', '+917095806126', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(63, '69f59645415467e0a6b904ac', 'Priyanka', 'V', 'Priyanka V', 'priyankaharish2002@gmail.com', '+919591420092', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(64, '69f59632415467e0a6b8fbe9', 'PRASHANTH', 'GATTU', 'PRASHANTH GATTU', 'prashanthgattu70@gmail.com', '+917396990894', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(65, '69f59621415467e0a6b8f46d', 'Pradyuman', 'Asore', 'Pradyuman Asore', 'asorepradyuman@gmail.com', '+919527125118', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(66, '69f595f8415467e0a6b8e2a7', 'NAGACHAITHANYA', 'EDIGA RAMESH', 'NAGACHAITHANYA EDIGA RAMESH', 'chaithanya1181@gmail.com', '+918328508554', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(67, '69f595e8415467e0a6b8db54', 'Monika', 'S', 'Monika S', 'smonika.ae@gmail.com', '+916361431610', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(68, '69f595d7415467e0a6b8d35a', 'Laharika', 'Somareddy', 'Laharika Somareddy', 'somareddylaharika@gmail.com', '+919618741977', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(69, '69f595c9415467e0a6b8ccf3', 'Kshitij', 'Bobade', 'Kshitij Bobade', 'bobadekshitij6@gmail.com', '+918805943209', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(70, '69f595af415467e0a6b8c1d4', 'BHARATH', 'SIMHA REDDY', 'BHARATH SIMHA REDDY', 'bharathgangireddy15@gmail.com', '+919133606284', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(71, '69f5959f415467e0a6b8ba8e', 'Durga', 'Devi J', 'Durga Devi J', 'durgadevi28032005@gmail.com', '+918825468400', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(72, '69f59586415467e0a6b8afd3', 'Aditya', 'Mane', 'Aditya Mane', 'adityamane1503@gmail.com', '+918856896552', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(73, '69f46932415467e0a6b6db49', 'Sakshi', 'Goral', 'Sakshi Goral', 'sakshigoral37@gmail.com', NULL, 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(74, '69f44557415467e0a6b6a437', 'Adnan', 'Ansari', 'Adnan Ansari', 'adnansaifa826@gmail.com', '+919162770545', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(75, '69f44533415467e0a6b691f0', 'Gagan', 'Kumar H P', 'Gagan Kumar H P', 'gagan.hp02@gmail.com', '+919449137408', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(76, '69f44522415467e0a6b68909', 'Ajith', 'George', 'Ajith George', 'ajithcheeramkunnel@gmail.com', '+917012474084', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(77, '69f44513415467e0a6b6813a', 'PARAMESWARA', 'REDDY DUGGI', 'PARAMESWARA REDDY DUGGI', 'parameshduggi51962@gmail.com', '+919390834783', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(78, '69f444fa415467e0a6b6631a', 'Mayur', 'Wagh', 'Mayur Wagh', 'mayurwagh2001@gmail.com', '+917385360404', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(79, '69f444d3415467e0a6b64f55', 'Kirty', 'Vijay', 'Kirty Vijay', 'kirtyvijay999@gmail.com', '+917665214431', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(80, '69f444c4415467e0a6b6478e', 'SAURABH', 'DUTT', 'SAURABH DUTT', 'saurabhdutt1365@gmail.com', '+919971901540', 'active', '2026-07-07 05:02:49', '2026-07-07 05:02:49'),
(81, '69f4447c415467e0a6b62269', 'MANAV', 'RAUT', 'MANAV RAUT', 'manav.p.raut27@gmail.com', '+919823966682', 'active', '2026-07-07 05:02:50', '2026-07-07 05:02:50'),
(82, '69f44468415467e0a6b618a1', 'LAKSHMI', 'VISHNAVI', 'LAKSHMI VISHNAVI', 'lakshmishnavig@gmail.com', '+919010960069', 'active', '2026-07-07 05:02:50', '2026-07-07 05:02:50'),
(83, '69f4443f415467e0a6b60444', 'TEJASHWINI', 'Unknown', 'TEJASHWINI Unknown', 'tejashwinit2899@gmail.com', '+919380845199', 'active', '2026-07-07 05:02:50', '2026-07-07 05:02:50'),
(84, '69f44433415467e0a6b5fdb4', 'Bibhash', 'Kumar', 'Bibhash Kumar', 'bibhash4846@gmail.com', '+918102461350', 'active', '2026-07-07 05:02:50', '2026-07-07 05:02:50'),
(85, '69f44423415467e0a6b5f524', 'SIRISETI', 'SAIKUMAR', 'SIRISETI SAIKUMAR', 'saisiriseti0@gmail.com', '+917893974699', 'active', '2026-07-07 05:02:50', '2026-07-07 05:02:50'),
(86, '69f443f6415467e0a6b5df3e', 'Yogesh', 'Heddure', 'Yogesh Heddure', 'yogeshheddure@gmail.com', '+916360455839', 'active', '2026-07-07 05:02:50', '2026-07-07 05:02:50'),
(87, '69f443ce415467e0a6b5cb55', 'Aarushi', 'Agarwal', 'Aarushi Agarwal', 'aarushiag26@gmail.com', '+918954977045', 'active', '2026-07-07 05:02:50', '2026-07-07 05:02:50'),
(88, '69f443ba415467e0a6b5c192', 'Shreyansh', 'Deep', 'Shreyansh Deep', 'shreyanshojha123@gmail.com', '+916387474765', 'active', '2026-07-07 05:02:50', '2026-07-07 05:02:50'),
(89, '69f443aa415467e0a6b5b919', 'SWAPNALI', 'GHOGARE', 'SWAPNALI GHOGARE', 'swapnalighogare7@gmail.com', '+917249845671', 'active', '2026-07-07 05:02:50', '2026-07-07 05:02:50'),
(90, '69f4439f415467e0a6b5b2e9', 'Prathmesh', 'Kasar', 'Prathmesh Kasar', 'kasarprathmesh18@gmail.com', '+917498590643', 'active', '2026-07-07 05:02:50', '2026-07-07 05:02:50'),
(91, '69f4438c415467e0a6b5a999', 'Isha', 'Ojha', 'Isha Ojha', 'ishaojha2@gmail.com', '+918767083105', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(92, '69f44378415467e0a6b59f72', 'Shaik', 'Sadak Valli', 'Shaik Sadak Valli', 'shaiksadak1919@gmail.com', '+917013351605', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(93, '69f44368415467e0a6b59774', 'Yuvraj', 'Mishra', 'Yuvraj Mishra', 'yuvrajmishra199@gmail.com', '+917887266279', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(94, '69f4435b415467e0a6b59062', 'Vinayak', 'Kusabi', 'Vinayak Kusabi', 'vinaykusabi96@gmail.com', '+919591057373', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(95, '69f4434b415467e0a6b58822', 'Kiran', 'Bodake', 'Kiran Bodake', 'kiranbodake5373@gmail.com', '+919579366686', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(96, '69f44339415467e0a6b57f21', 'Hrshal', 'Umare', 'Hrshal Umare', 'hrshalumare@gmail.com', '+917558538984', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(97, '69f4432c415467e0a6b5780f', 'ABHAY', 'KUMAR', 'ABHAY KUMAR', '12abhay12@gmail.com', '+919525494817', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(98, '69f44321415467e0a6b571ca', 'Vishal', 'Patil', 'Vishal Patil', 'vishal.patil.career@gmail.com', '+919972406939', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(99, '69f4430f415467e0a6b568c1', 'JAYESH', 'SAWANT', 'JAYESH SAWANT', 'jayeshsawant226@gmail.com', '+919665220543', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(100, '69f442ea415467e0a6b55609', 'PRATIK', 'JADHAO', 'PRATIK JADHAO', 'jadhaopratik999@gmail.com', '+918767595648', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(101, '69f442de415467e0a6b54f57', 'PRUTHVISH', 'V', 'PRUTHVISH V', 'pruthvish01@gmail.com', '+919345105717', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(102, '69f442d4415467e0a6b5498b', 'Pankaj', 'Thakur', 'Pankaj Thakur', 'thakurpankaj9540@gmail.com', '+917982539656', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(103, '69f442c5415467e0a6b5417e', 'Naina', 'Sharma', 'Naina Sharma', '608naina.2020@gmail.com', '+919667859982', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(104, '69f442ad415467e0a6b5361e', 'SAMRUDDHI', 'REDIJ', 'SAMRUDDHI REDIJ', 'redijsamruddhi2903@email.com', '+917378991238', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(105, '69f4429e415467e0a6b52e2a', 'Balaji', 'Unknown', 'Balaji Unknown', 'bala.ten10@gmail.com', '+918056594495', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(106, '69f4427f415467e0a6b52008', 'Sharvani', 'CH', 'Sharvani CH', 'sharvanichandragiri@gmail.com', '+917732030632', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(107, '69f4426f415467e0a6b517cf', 'SANDRA', 'SAJI', 'SANDRA SAJI', 'sandrasaji0709@gmail.com', '+916238917823', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(108, '69f4425b415467e0a6b50df9', 'Shivi', 'Agarwal', 'Shivi Agarwal', 'shivi05081999@gmail.com', '+917302540929', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(109, '69f44248415467e0a6b50492', 'Harshul', 'Gupta', 'Harshul Gupta', 'harshulgupt@gmail.com', '+918209412638', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(110, '69f44229415467e0a6b4f667', 'AYUSHMAN', 'GUPTA', 'AYUSHMAN GUPTA', 'guptaayushman036@gmail.com', '+917977709629', 'active', '2026-07-07 05:02:51', '2026-07-07 05:02:51'),
(111, '69f4420c415467e0a6b4e906', 'Aditi', 'Shirbhate', 'Aditi Shirbhate', 'aditishirbhate711@gmail.com', '+917021731824', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(112, '69f441f5415467e0a6b4de06', 'Vishwesh', 'Rushi', 'Vishwesh Rushi', 'rushivishwesh02@gmail.com', '+918530776774', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(113, '69f441d7415467e0a6b4d051', 'DEEPIKA', 'V', 'DEEPIKA V', 'deepikavenugopal3182002@gmail.com', '+919025872234', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(114, '69f421eb415467e0a6b49b2f', 'Shashanka', 'K U', 'Shashanka K U', 'shashankabhatsringeri@gmail.com', '+919110695404', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(115, '69f421cc415467e0a6b498d4', 'Rahul', 'Ranjan', 'Rahul Ranjan', 'rahulrs.0265@gmail.com', '+917708116339', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(116, '69f421b9415467e0a6b49689', 'Rutuja', 'Nagrale', 'Rutuja Nagrale', 'rutujanagrale15@gmail.com', '+918080581948', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(117, '69f421a3415467e0a6b4942a', 'MEGHANA', 'Unknown', 'MEGHANA Unknown', 'meghana.1029s@gmail.com', '+919632797096', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(118, '69f42173415467e0a6b491d0', 'ANAGHA', 'NAVALE', 'ANAGHA NAVALE', 'navaleanaghanitin@gmail.com', '+919588676935', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(119, '69f42155415467e0a6b48f82', 'Deepak', 'Karamala', 'Deepak Karamala', 'deepakachari90@gmail.com', '+916304524346', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(120, '69f42145415467e0a6b48d37', 'MUSAWIR', 'AHMED SHAIK', 'MUSAWIR AHMED SHAIK', 'musawirahmedshaik@gmail.com', '+919010971082', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(121, '69f42126415467e0a6b48ad6', 'Amit', 'Singh', 'Amit Singh', 'amitrameshsingh4@gmail.com', '+917021274359', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(122, '69f4210c415467e0a6b48893', 'Zubair', 'Solanki', 'Zubair Solanki', 'zubairsolanki9634@gmail.com', '+917983946636', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(123, '69f420ec415467e0a6b4862f', 'Rahul', 'Rajput', 'Rahul Rajput', 'rahul.rajput14062001@gmail.com', '+919422632750', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(124, '69f420db415467e0a6b483e2', 'TEJAS', 'MAHAKAL', 'TEJAS MAHAKAL', 'tejsmahakal740@gmail.com', '+917218072175', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(125, '69f420b8415467e0a6b47f48', 'Rashmi', 'V', 'Rashmi V', 'rashmichetu9@gmail.com', '+919066117894', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(126, '69f4207b415467e0a6b47a96', 'PRAVEEN', 'S', 'PRAVEEN S', 'praveenpraveen05923@gmail.com', '+917339656613', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(127, '69f4205d415467e0a6b4783e', 'KUSHAGRA', 'AGARWAL', 'KUSHAGRA AGARWAL', 'kushagraagarwalwork@gmail.com', '+918005788560', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(128, '69f42044415467e0a6b475fc', 'Y.', 'SATEESH', 'Y. SATEESH', 'sateesh.yenda18@gmail.com', '+919014613807', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(129, '69f4203a415467e0a6b473ba', 'Harsh', 'Kansal', 'Harsh Kansal', 'kansalhk2001@gmail.com', '+919997695362', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(130, '69f41fe1415467e0a6b46cae', 'Vivek', 'Methuku', 'Vivek Methuku', 'vivekmethuku2@gmail.com', '+919505392120', 'active', '2026-07-07 05:02:52', '2026-07-07 05:02:52'),
(131, '69f41fcf415467e0a6b465a9', 'Candidate', 'Unknown', 'Candidate Unknown', 'pompibasumatary05@gmail.com', '+918638908280', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(132, '69f41fbe415467e0a6b4635a', 'Vishruti', 'Mathur', 'Vishruti Mathur', 'vishrutimathur@gmail.com', '+919407464871', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(133, '69f41fac415467e0a6b46116', 'BHAVESH', 'RATHOD', 'BHAVESH RATHOD', 'bhaveshurathod13@gmail.com', '+919067373321', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(134, '69f41f97415467e0a6b45e5b', 'ABHISHEK', 'CHAVAN', 'ABHISHEK CHAVAN', 'abhishekchavan9270@gmail.com', '+919270130162', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(135, '69f41f76415467e0a6b45c01', 'Swapnil', 'Nagare', 'Swapnil Nagare', 'nagareswapnil01@gmail.com', '+917972245101', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(136, '69f41f58415467e0a6b45760', 'Madamanchi', 'Venkatanarayana', 'Madamanchi Venkatanarayana', 'madamanchi.venkat500@gmail.com', '+919502152367', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(137, '69f41f37415467e0a6b454f7', 'Mrinal', 'Bhoumick', 'Mrinal Bhoumick', 'mrinalbhoumick0610@gmail.com', '+916290877836', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(138, '69f41f1e415467e0a6b45280', 'Pratik', 'Pimpale', 'Pratik Pimpale', 'pratikpimpale2@gmail.com', '+919881419790', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(139, '69f41f05415467e0a6b45023', 'Kali', 'Saikiran', 'Kali Saikiran', 'saikiran2k25@gmail.com', '+919160382920', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(140, '69f41ef4415467e0a6b44dc8', 'Md', 'Danish Quraishie', 'Md Danish Quraishie', 'dquraishie@gmail.com', '+919038359992', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(141, '69f41ed5415467e0a6b44b64', 'Nupur', 'Bag', 'Nupur Bag', 'bagnupur123@gmail.com', '+919112647978', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(142, '69f41ec0415467e0a6b448dc', 'RIYA', 'KUMARI', 'RIYA KUMARI', 'imriya.rk14@gmail.com', '+917549189612', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(143, '69f41eab415467e0a6b4468b', 'Shivani', 'Pidurkar', 'Shivani Pidurkar', 'shivanipidurkar04@gmail.com', '+919284146826', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(144, '69f41e9c415467e0a6b44438', 'ABIN', 'SINGH K', 'ABIN SINGH K', 'abinsingh2016@gmail.com', '+919489562810', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(145, '69f41e8d415467e0a6b441ea', 'Akash', 'Bora', 'Akash Bora', 'akashbora0082@gmail.com', '+917057100082', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(146, '69f41e74415467e0a6b43f88', 'Akash', 'Patil', 'Akash Patil', 'akash.patilx7@gmail.com', '+918767169452', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(147, '69f41e48415467e0a6b43d06', 'Prajwal', 'Borse', 'Prajwal Borse', 'prajwalborse101@gmail.com', '+919175508968', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(148, '69f41e2d415467e0a6b43a94', 'Rahul', 'Dhokale', 'Rahul Dhokale', 'rahulsdhokale15@gmail.com', '+918390215090', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(149, '69f41e09415467e0a6b43604', 'Rucha', 'Thakare', 'Rucha Thakare', 'ruchathakare1404@gmail.com', '+917666987966', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(150, '69f41def415467e0a6b43339', 'Srushti', 'Bhosale', 'Srushti Bhosale', 'srushtibhosale98765@gmail.com', '+919294777734', 'active', '2026-07-07 05:02:53', '2026-07-07 05:02:53'),
(151, '69f41dda415467e0a6b430dc', 'Manjunath', 'A', 'Manjunath A', 'manjunath20017@gmail.com', '+919384347885', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(152, '69f41dc9415467e0a6b42e86', 'Ruturaj', 'Tekale', 'Ruturaj Tekale', 'ruturajtekale56@gmail.com', '+917448012371', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(153, '69f41dad415467e0a6b42c17', 'Nehal', 'Khan', 'Nehal Khan', 'geek.nehal@gmail.com', '+919696738826', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(154, '69f1f836415467e0a6b1921e', 'Kavya', 'Yeddu', 'Kavya Yeddu', 'kavya.srinivasarao28@gmail.com', '+919391536778', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(155, '69f1f82a415467e0a6b18fce', 'Vishal', 'Chand', 'Vishal Chand', 'vishalchand0808@gmail.com', '+919023453724', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(156, '69f1f812415467e0a6b18d81', 'Valluru', 'charishma', 'Valluru charishma', 'vallurucharishma@gmail.com', '+919391374449', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(157, '69f1f7fd415467e0a6b18b29', 'Vaishnavi', 'Shinde', 'Vaishnavi Shinde', 'shindevaishanvi2@gmail.com', '+919356654810', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(158, '69f1f7e1415467e0a6b188c9', 'Sujith', 'Unknown', 'Sujith Unknown', 'sujith07062002@gmail.com', '+919150667620', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(159, '69f1f7cd415467e0a6b18671', 'Subasree', 'Subramanian', 'Subasree Subramanian', 'subasree0110@gmail.com', '+919344733583', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(160, '69f1f7b9415467e0a6b18429', 'Soumya', 'Marol', 'Soumya Marol', 'soumyamarol@gmail.com', '+919620599502', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(161, '69f1f7a8415467e0a6b181d7', 'Sooraj', 'Aryan', 'Sooraj Aryan', 'soorajaryan123@gmail.com', '+917340089930', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(162, '69f1f78f415467e0a6b17f83', 'Snehendu', 'Das', 'Snehendu Das', 'snehendu100@gmail.com', '+917908526645', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(163, '69f1f774415467e0a6b17d2e', 'Simhadri', 'Saimani', 'Simhadri Saimani', 'svssaimani2003@gmail.com', '+918520983998', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(164, '69f1f756415467e0a6b17ab4', 'SHUBHAM', 'BIRARI', 'SHUBHAM BIRARI', 'birarishubham5@gmail.com', '+918308705518', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(165, '69f1f740415467e0a6b1786b', 'Shruti', 'Kumari', 'Shruti Kumari', 'shrutikumari.220802@gmail.com', '+918789094752', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(166, '69f1f728415467e0a6b1760b', 'Shrilaxmi', 'Byali', 'Shrilaxmi Byali', 'shrilaxmib9591@gmail.com', '+917338598283', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(167, '69f1f70e415467e0a6b173c8', 'Shivakumar', 'Subbapurmath', 'Shivakumar Subbapurmath', 'shivakumarsubbapurmath@gmail.com', '+919108662337', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(168, '69f1f6e5415467e0a6b16f0e', 'SHAIK', 'MOHAMMAD YUNUS', 'SHAIK MOHAMMAD YUNUS', 'mohammadyunusshaik8@gmail.com', '+919490426119', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(169, '69f1f6cd415467e0a6b16cb5', 'MUHAMMED', 'SHABIN I K', 'MUHAMMED SHABIN I K', 'muhammedshabin2001@gmail.com', '+918086403552', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(170, '69f1f6bd415467e0a6b16a6f', 'Sajit', 'Uddin', 'Sajit Uddin', 'sajituddin13@gmail.com', '+917606012533', 'active', '2026-07-07 05:02:54', '2026-07-07 05:02:54'),
(171, '69f1f6b4415467e0a6b16822', 'Rishabh', 'Mehrotra', 'Rishabh Mehrotra', 'mehrotrarishabh100@gmail.com', '+919118384760', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(172, '69f1f691415467e0a6b165d9', 'Rakshitha', 'N K', 'Rakshitha N K', 'nkrakshitha129@gmail.com', '+918792567935', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(173, '69f1f66e415467e0a6b16355', 'Pratiksha', 'Danavale', 'Pratiksha Danavale', 'pratikshadanavale@gmail.com', '+919867939427', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(174, '69f1f660415467e0a6b16102', 'Prateek', 'Unknown', 'Prateek Unknown', 'prateekjha777@gmail.com', '+917488360807', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(175, '69f1f651415467e0a6b15ea8', 'Pawan', 'Nagar', 'Pawan Nagar', 'pa211nagar@gmail.com', '+917898188149', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(176, '69f1f63f415467e0a6b15c34', 'Pavan', 'Kumar J', 'Pavan Kumar J', 'pavankumarj275@gmail.com', '+918660537002', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(177, '69f1f62e415467e0a6b159ed', 'GURU SAI PRAKASH', 'NINDRA', 'GURU SAI PRAKASH NINDRA', 'nindragurusaiprakash@gmail.com', '+919553847363', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(178, '69f1f61b415467e0a6b15798', 'Pranitha', 'Nallapureddy', 'Pranitha Nallapureddy', 'pranithanallapureddy3@gmail.com', '+917569500300', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(179, '69f1f5d8415467e0a6b151b3', 'Likhith', 'Mattapalli', 'Likhith Mattapalli', 'likhithmattapalli@gmail.com', '+916303969607', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(180, '69f1f5c5415467e0a6b14f61', 'Rupesh', 'K', 'Rupesh K', 'rupeshkummari223@gmail.com', '+917995406231', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(181, '69f1f5ae415467e0a6b14d15', 'Kishor', 'Jha', 'Kishor Jha', 'envelopedathkishor@gmail.com', '+918540938717', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(182, '69f1f59a415467e0a6b14abb', 'Karthik', 'K H', 'Karthik K H', 'khkarthik28@gmail.com', '+919113087315', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(183, '69f1f587415467e0a6b14864', 'Kamalraj', 'D', 'Kamalraj D', 'kamalrajdevaraj.14@gmail.com', '+916374364725', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(184, '69f1f57a415467e0a6b14607', 'ISWAR', 'KUMAR SAHOO', 'ISWAR KUMAR SAHOO', 'iswarkumarsahoo02@gmail.com', '+918114984043', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(185, '69f1f559415467e0a6b1438e', 'Harshitha', 'R M', 'Harshitha R M', 'harshithayadav021@gmail.com', '+919513886483', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(186, '69f1f548415467e0a6b14129', 'Tatikonda', 'Harika', 'Tatikonda Harika', 'thatikondaharika069@gmail.com', '+919154900489', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(187, '69f1f53d415467e0a6b13ed6', 'CHAYA', 'G P', 'CHAYA G P', 'chayagp3@gmail.com', '+917676145842', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(188, '69f1f528415467e0a6b13c80', 'Chanjal', 'CM', 'Chanjal CM', 'chanjalcm2019@gmail.com', '+919946813101', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(189, '69f1f506415467e0a6b13a14', 'B.K.', 'Sravani', 'B.K. Sravani', 'sravanibk5050@gmail.com', '+919353847855', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(190, '69f1f4f1415467e0a6b137c6', 'Bhoomika', 'T', 'Bhoomika T', 'bhoomikathyagaraj29@gmail.com', '+918277667188', 'active', '2026-07-07 05:02:55', '2026-07-07 05:02:55'),
(191, '69f1f4d1415467e0a6b1356c', 'BHASKAR', 'K G', 'BHASKAR K G', 'bhaskarkg20@gmail.com', '+917483061496', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(192, '69f1f498415467e0a6b13057', 'Basavaraj', 'Gonageri', 'Basavaraj Gonageri', 'gonagerib@gmail.com', '+918150932188', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(193, '69f1f478415467e0a6b12e06', 'BALMUKUND', 'SHUKLA', 'BALMUKUND SHUKLA', 'shuklabalmukund0@gmail.com', '+918928259110', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(194, '69f1f464415467e0a6b12ba9', 'Anusha', 'V S', 'Anusha V S', 'anushavs195@gmail.com', '+917625056315', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(195, '69f1f454415467e0a6b12918', 'Ankit', 'Kumar', 'Ankit Kumar', 'ak8303643@gmail.com', '+918709579128', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(196, '69f1f438415467e0a6b126bc', 'Amalendu', 'Hareesh', 'Amalendu Hareesh', 'amalenduhareesh3@gmail.com', '+919496201063', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(197, '69f1f424415467e0a6b12460', 'Kosuru', 'Akash', 'Kosuru Akash', 'akashroyal2514@gmail.com', '+919885435155', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(198, '69f1f40f415467e0a6b121f2', 'Akash', 'Kumar', 'Akash Kumar', 'akash22836@gmail.com', '+919508729933', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(199, '69f1aaa4415467e0a6b0ab43', 'Vishwanath', 'S U', 'Vishwanath S U', 'vishwanathsu32@gmail.com', '+917899052603', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(200, '69f1aa84415467e0a6b0a903', 'Mandava', 'Vineetha', 'Mandava Vineetha', 'vineethamandava123@gmail.com', '+919392463524', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(201, '69f1aa4a415467e0a6b0a49a', 'TEJAS', 'M S', 'TEJAS M S', 'tejas22appu@gmail.com', '+919964640577', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(202, '69f1aa14415467e0a6b0a119', 'Sindhu', 'Sudanagunta', 'Sindhu Sudanagunta', 'sindhusudanagunta11@gmail.com', '+919848584916', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(203, '69f1a9f4415467e0a6b09edc', 'Srinivas', 'B C', 'Srinivas B C', 'srinivasbc018@gmail.com', '+918660809251', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(204, '69f1a9c8415467e0a6b09ca2', 'Sidra', 'Momin', 'Sidra Momin', 'sidramomin8310@gmail.com', '+918310959384', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(205, '69f1a9ad415467e0a6b09a61', 'Sai', 'Swetha', 'Sai Swetha', 'saiswetha0520@gmail.com', '+918870313062', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(206, '69f1a993415467e0a6b09825', 'Sai Charan', 'Chowdary Vattikunta', 'Sai Charan Chowdary Vattikunta', 'saicharanchowdary9347@gmail.com', '+917013655421', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(207, '69f1a982415467e0a6b095f9', 'Sahil', 'Srivastava', 'Sahil Srivastava', 'aradhyy076@gmail.com', '+919120398855', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(208, '69f1a957415467e0a6b0928c', 'RAKESH', 'P', 'RAKESH P', 'srivenkatesh8050@gmail.com', '+917349469375', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(209, '69f1a941415467e0a6b0904f', 'PRIYA', 'P S', 'PRIYA P S', 'psp074327@gmail.com', '+918867581252', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(210, '69f1a933415467e0a6b08e22', 'Pramod', 'Sanodiya', 'Pramod Sanodiya', 'pramodsanodiya0@gmail.com', '+916268809135', 'active', '2026-07-07 05:02:56', '2026-07-07 05:02:56'),
(211, '69f1a82a415467e0a6b08bb4', 'Paripalli', 'Ganesh', 'Paripalli Ganesh', 'ganesh.paripalli.18.04.2001@gmail.com', '+917989916566', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(212, '69f1a803415467e0a6b08965', 'NELAVAI', 'KUMAR', 'NELAVAI KUMAR', 'naveenkumarnelavai@gmail.com', '+918317677436', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(213, '69f1a7e6415467e0a6b08728', 'Meghana', 'Unknown', 'Meghana Unknown', 'meghanavswamy1662@gmail.com', '+919035580041', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(214, '69f1a7d5415467e0a6b084eb', 'Mayur', 'Shirsat', 'Mayur Shirsat', 'mayurshirsat1999@gmail.com', '+919067611982', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(215, '69f1a7ae415467e0a6b082a8', 'Hemant', 'Reddy', 'Hemant Reddy', 'hemanthreddy.mat@gmail.com', '+917981272361', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(216, '69f1a78e415467e0a6b0806d', 'Manjunath', 'Karaguppi', 'Manjunath Karaguppi', 'manju.r.k9446@gmail.com', '+919068373423', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(217, '69f1a77d415467e0a6b07e31', 'MANISABARI', 'S', 'MANISABARI S', 'sabariskrms2839@gmail.com', '+918072113094', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(218, '69f1a767415467e0a6b07c00', 'Kunal', 'Kashyap', 'Kunal Kashyap', 'kunalkashyap.v@gmail.com', '+917033561046', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(219, '69f1a747415467e0a6b079a1', 'KUMMETHA', 'SRIKANTH REDDY', 'KUMMETHA SRIKANTH REDDY', 'k.srikanth1075@gmail.com', '+917672002738', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(220, '69f1a739415467e0a6b07770', 'Kausika', 'R S', 'Kausika R S', 'kausika21@gmail.com', '+917395854722', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(221, '69f1a72e415467e0a6b07542', 'Jillivari', 'Kuruva Prasad', 'Jillivari Kuruva Prasad', 'prasadjk2241@gmail.com', '+917386759664', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(222, '69f1a71c415467e0a6b0730a', 'Himanshu', 'Maheshwari', 'Himanshu Maheshwari', 'himanshumaheshwari1058@gmail.com', '+919054831434', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(223, '69f1a708415467e0a6b070c6', 'HARSHITHA', 'Unknown', 'HARSHITHA Unknown', 'harshithamahadev011@gmail.com', '+919148751424', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(224, '69f1a6f0415467e0a6b06e8d', 'Harsha', 'Vardhan G', 'Harsha Vardhan G', 'harshavardhn.g@gmail.com', '+918095650189', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(225, '69f1a6dd415467e0a6b06c4a', 'GUNDLURI', 'MAHESH', 'GUNDLURI MAHESH', 'reddymaheshgundluri@gmail.com', '+918341137303', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(226, '69f1a6cf415467e0a6b06a10', 'Mahidhar', 'Kumaraswamy', 'Mahidhar Kumaraswamy', 'mahidhargudivada2005@gmail.com', '+918008171347', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(227, '69f1a6bf415467e0a6b067d6', 'Gangesh', 'Chaurasiya', 'Gangesh Chaurasiya', 'gangesh8447@gmail.com', '+918447542073', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(228, '69f1a6ac415467e0a6b06586', 'GANDHODI', 'KALYANI', 'GANDHODI KALYANI', 'kalyanikalyani2654@gmail.com', '+916281685705', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(229, '69f1a69f415467e0a6b0633c', 'DUMPALAVENKATARENUKADEVI', 'Unknown', 'DUMPALAVENKATARENUKADEVI Unknown', 'dumpalarenukadevi7@gmail.com', '+917330825532', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(230, '69f1a68f415467e0a6b060e8', 'Dinesh', 'A', 'Dinesh A', 'dineshkarthik9903@gmail.com', '+919686257115', 'active', '2026-07-07 05:02:57', '2026-07-07 05:02:57'),
(231, '69f1a67f415467e0a6b05e9d', 'Dadapeer', 'Khazi', 'Dadapeer Khazi', 'dadapeerkhazi469@gmail.com', '+917624833796', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(232, '69f1a66c415467e0a6b05c5a', 'Balaji', 'Chandrasekaran', 'Balaji Chandrasekaran', 'balajichandrasekaran17@gmail.com', '+916383867611', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(233, '69f1a65c415467e0a6b03a78', 'Ayush', 'Vibhute', 'Ayush Vibhute', 'ayushvib27@gmail.com', '+918956555402', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(234, '69f1a642415467e0a6b03811', 'Atharva', 'Mudgal', 'Atharva Mudgal', 'atharvamudgal1@gmail.com', '+918690595217', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(235, '69f1a630415467e0a6b035d1', 'APARNA', 'KRISHNAN', 'APARNA KRISHNAN', 'aparnakris01@gmail.com', '+918547094107', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(236, '69f1a61e415467e0a6b03381', 'Anjali', 'Chinnakondala', 'Anjali Chinnakondala', 'keerthianjali505@gmail.com', '+916305662668', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(237, '69f1a608415467e0a6b0313a', 'ANIRUDDHA', 'BHATTACHARYYA', 'ANIRUDDHA BHATTACHARYYA', 'aniruddha7mail@gmail.com', '+916290505746', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(238, '69f1a5f5415467e0a6b02f01', 'Akash', 'Nilkanth', 'Akash Nilkanth', 'theakashnilkanth07@gmail.com', '+918530174715', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(239, '69f1a5e6415467e0a6b02cce', 'Agnus', 'Chacko', 'Agnus Chacko', 'agneschacko66@gmail.com', '+917306258391', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(240, '69f1a5cf415467e0a6b02a88', 'AGGALA', 'HARSHITA', 'AGGALA HARSHITA', 'harshi.aggala@gmail.com', '+917013387528', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(241, '69f1a5b0415467e0a6b02832', 'Aditya', 'Tiwari', 'Aditya Tiwari', 'aditiva.2712@gmail.com', '+919111799895', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(242, '69f1a5a2415467e0a6b025f3', 'ADHYA', 'K S', 'ADHYA K S', 'adhyaks7@gmail.com', '+917975089729', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(243, '69f1a595415467e0a6b023b9', 'Abhijeet', 'Srivastava', 'Abhijeet Srivastava', 'ranjanabhijeet2407@gmail.com', '+917091403819', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(244, '69f15f8e415467e0a6ae41c8', 'Aruna', 'G', 'Aruna G', 'arunagani1910@gmail.com', '+917904023241', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(245, '69f15f7f415467e0a6ae3f7b', 'SUSHANT', 'AHER', 'SUSHANT AHER', 'sushantaherofficial@gmail.com', '+917757862265', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(246, '69f15f5a415467e0a6ae3892', 'Rishabh', 'Yadav', 'Rishabh Yadav', 'rishabhyadav15396@gmail.com', '+918755239056', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(247, '69f15f47415467e0a6ae3645', 'Rushali', 'Moon', 'Rushali Moon', 'rushalimoon2018@gmail.com', '+919156845635', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(248, '69f15f3c415467e0a6ae33f3', 'SONU', 'YADAV', 'SONU YADAV', 'sonu560139@gmail.com', '+918130266520', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(249, '69f15f2d415467e0a6ae319b', 'Revan', 'Siddeshwar', 'Revan Siddeshwar', 'siddeshwerrevan@gmail.com', '+919010879351', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(250, '69f15f1f415467e0a6ae2f4b', 'R', 'Ramya', 'R Ramya', 'ramya.dilli537@gmail.com', '+917780789580', 'active', '2026-07-07 05:02:58', '2026-07-07 05:02:58'),
(251, '69f15f14415467e0a6ae2ce6', 'Keerthi', 'G', 'Keerthi G', 'saikeerthi808@gmail.com', '+918639246916', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(252, '69f15f05415467e0a6ae2a96', 'Mahesh', 'Maurya', 'Mahesh Maurya', 'mahesh9bca@gmail.com', '+918172840538', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(253, '69f15efb415467e0a6ae2848', 'Rahul', 'Thakare', 'Rahul Thakare', 'rahulthakre38@gmail.com', '+919730017428', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(254, '69f15eee415467e0a6ae2600', 'Kollu', 'Vazra Reddy', 'Kollu Vazra Reddy', 'kolluvazrareddy009@gmail.com', '+919347929041', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(255, '69f15ee4415467e0a6ae23b6', 'Dhruval', 'Bhau', 'Dhruval Bhau', 'dhruvalbhau@gmail.com', '+919326349182', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(256, '69f15ed6415467e0a6ae2161', 'TANNERU', 'PRIYANKA', 'TANNERU PRIYANKA', 'tannerupriyanka712@gmail.com', '+917382722306', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(257, '69f15ecc415467e0a6ae1a64', 'Candidate', 'Unknown', 'Candidate Unknown', 'vishal.vj0123@gmail.com', '+919755257682', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(258, '69f15ec2415467e0a6ae181e', 'MANIVANNAN', 'S SA', 'MANIVANNAN S SA', 'manivannan70057@gmail.com', '+917092070057', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(259, '69f15eb5415467e0a6ae15cf', 'Tushar', 'Chaudhari', 'Tushar Chaudhari', 'tusharchaudhari312002@gmail.com', '+919767042849', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(260, '69f15ea4415467e0a6ae1376', 'Arham', 'Khan', 'Arham Khan', 'arhmmkhan@gmail.com', '+919098261722', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(261, '69f15e95415467e0a6ae1122', 'HARSHAD', 'CHAVAN', 'HARSHAD CHAVAN', 'harshadchavan92@gmail.com', '+917666114184', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(262, '69f15e86415467e0a6ae0ed2', 'SHIVAM', 'MANTRELU', 'SHIVAM MANTRELU', 'shivammantrelu2026@gmail.com', '+919518705566', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(263, '69f15e7a415467e0a6ae0c8d', 'Shubham', 'Nalhe', 'Shubham Nalhe', 'shubham.nalhe2163@gmail.com', '+919579501889', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(264, '69f15e69415467e0a6ae0a4d', 'Rajat', 'Choudhary', 'Rajat Choudhary', 'rajat812001@gmail.com', '+918219489465', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(265, '69f15e4b415467e0a6ae07fc', 'GAURAV', 'JAIN', 'GAURAV JAIN', 'gauravjain2498@gmail.com', '+917611967100', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(266, '69f15e31415467e0a6ae0468', 'Sahithi', 'Pasupuleti', 'Sahithi Pasupuleti', 'sahithi.pasupuleti178@gmail.com', '+919390391504', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(267, '69f15e26415467e0a6ae021e', 'Vishakha', 'Singh', 'Vishakha Singh', 'vishakhasingh261@gmail.com', '+919939782923', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(268, '69f15e14415467e0a6adffcc', 'Shubham', 'Kajale', 'Shubham Kajale', 'shubhamkajale1345@gmail.com', '+919146583087', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(269, '69f15de4415467e0a6adf666', 'DIKSHA', 'WANKAR', 'DIKSHA WANKAR', 'wankardiksha14@gmail.com', '+917264046184', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(270, '69f15dd7415467e0a6adf40e', 'Jatin', 'Rai', 'Jatin Rai', 'jatinrai00j@gmail.com', '+919137223537', 'active', '2026-07-07 05:02:59', '2026-07-07 05:02:59'),
(271, '69f15dcf415467e0a6adf1b6', 'Keshav', 'Jadhav', 'Keshav Jadhav', 'keshav.jadhav9496@gmail.com', '+918378060516', 'active', '2026-07-07 05:03:00', '2026-07-07 05:03:26'),
(272, '69f15dc4415467e0a6adef6b', 'BHUSHAN', 'POTE', 'BHUSHAN POTE', 'bhushanpote12@gmail.com', '+918766742484', 'active', '2026-07-07 05:03:00', '2026-07-07 05:03:00'),
(273, '69f15dbc415467e0a6aded02', 'Shivam', 'Pal', 'Shivam Pal', 'pals55002@gmail.com', '+919082966402', 'active', '2026-07-07 05:03:00', '2026-07-07 05:03:00'),
(274, '69f15dac415467e0a6adeaa8', 'RAHUL', 'DHOLE', 'RAHUL DHOLE', 'rahuldhole516@gmail.com', '+919272592662', 'active', '2026-07-07 05:03:00', '2026-07-07 05:03:00'),
(275, '69f15da5415467e0a6ade856', 'HARSH', 'RATHORE', 'HARSH RATHORE', 'rathoreharsh304@gmail.com', '+919691112300', 'active', '2026-07-07 05:03:00', '2026-07-07 05:03:00'),
(276, '69f15d8d415467e0a6ade5ec', 'Sayali', 'Jadhav', 'Sayali Jadhav', 'jadhavsayali570@gmail.com', '+919665611153', 'active', '2026-07-07 05:03:00', '2026-07-07 05:03:00'),
(277, '69f15d7b415467e0a6ade383', 'Vishakha', 'Pande', 'Vishakha Pande', 'pandevishakha100@gmail.com', '+918080956788', 'active', '2026-07-07 05:03:00', '2026-07-07 05:03:00'),
(278, '69f15d65415467e0a6ade118', 'Apoorva', 'Pathak', 'Apoorva Pathak', 'apoorva10696@gmail.com', '+919935710820', 'active', '2026-07-07 05:03:00', '2026-07-07 05:03:00'),
(279, '69f15d57415467e0a6addec1', 'Nikhil', 'Jha', 'Nikhil Jha', 'nikhiljha9sep@gmail.com', '+919304718831', 'active', '2026-07-07 05:03:00', '2026-07-07 05:03:00'),
(280, '69f15d42415467e0a6addc5d', 'HARISH', 'KUMAR', 'HARISH KUMAR', 'kumarharishsrp15@gmail.com', '+917295091976', 'active', '2026-07-07 05:03:00', '2026-07-07 05:03:00'),
(281, '69f15d22415467e0a6add794', 'Vedant', 'Dongre', 'Vedant Dongre', 'vedantdongre10@gmail.com', '+918149274127', 'active', '2026-07-07 05:03:01', '2026-07-07 05:03:01'),
(282, '69f15d19415467e0a6add541', 'Saksham', 'Kumar', 'Saksham Kumar', 'sakshamyukesh15@gmail.com', '+918935959970', 'active', '2026-07-07 05:03:01', '2026-07-07 05:03:01'),
(283, '69f15d02415467e0a6add0ad', 'SAGAR', 'DURGUDE', 'SAGAR DURGUDE', 'sagardurgude777@gmail.com', '+919168273900', 'active', '2026-07-07 05:03:01', '2026-07-07 05:03:01'),
(284, '69f15cf7415467e0a6adce56', 'Rutuja', 'Chavan', 'Rutuja Chavan', 'rutu1872000@gmail.com', '+918104939437', 'active', '2026-07-07 05:03:01', '2026-07-07 05:03:01'),
(285, '69f15cdb415467e0a6adcbe7', 'Tejas', 'Patil', 'Tejas Patil', 'tppatil910@gmail.com', '+919325675998', 'active', '2026-07-07 05:03:01', '2026-07-07 05:03:01'),
(286, '69f0f740415467e0a6ad9c9d', 'Prasanna', 'Mehata', 'Prasanna Mehata', 'prasannamehata6@gmail.com', NULL, 'active', '2026-07-07 05:03:01', '2026-07-07 05:03:01'),
(287, '69f0f19a415467e0a6ad9baf', 'YASWANTH', 'GUTTAPUDI', 'YASWANTH GUTTAPUDI', 'guttapudiyaswanth2003@gmail.com', '+918121044207', 'active', '2026-07-07 05:03:01', '2026-07-07 05:03:01'),
(288, '69f0b238415467e0a6ad9252', 'Agili', 'Vishnu Sai', 'Agili Vishnu Sai', 'vishnusai3105@gmail.com', '+918847434579', 'active', '2026-07-07 05:03:01', '2026-07-07 05:03:01'),
(289, '69f0b21e415467e0a6ad8fed', 'Kandukuru', 'Vinay Kumar', 'Kandukuru Vinay Kumar', 'kvkr282@gmail.com', '+919347612765', 'active', '2026-07-07 05:03:01', '2026-07-07 05:03:01'),
(290, '69f0b214415467e0a6ad8dac', 'Vinanti', 'Thakre', 'Vinanti Thakre', 'vthakre1999@gmail.com', '+919096400751', 'active', '2026-07-07 05:03:01', '2026-07-07 05:03:01');
INSERT INTO `students` (`id`, `external_id`, `first_name`, `last_name`, `full_name`, `email`, `phone_number`, `status`, `created_at`, `updated_at`) VALUES
(291, '69f0b202415467e0a6ad8b58', 'SWAMY', 'YATA', 'SWAMY YATA', 'yataswamy11@gmail.com', '+919346794778', 'active', '2026-07-07 05:03:02', '2026-07-07 05:03:02'),
(292, '69f0b1f1415467e0a6ad890a', 'Suyash', 'Tiwari', 'Suyash Tiwari', 'suayashtiwari0209@gmail.com', '+918957512828', 'active', '2026-07-07 05:03:02', '2026-07-07 05:03:02'),
(293, '69f0b1e1415467e0a6ad86b5', 'Chinninnigari', 'Suryakartheek', 'Chinninnigari Suryakartheek', 'chinninnigarikartheek@gmail.com', '+919100510700', 'active', '2026-07-07 05:03:02', '2026-07-07 05:03:02'),
(294, '69f0b1d7415467e0a6ad8472', 'SURENDRA', 'Unknown', 'SURENDRA Unknown', 'surendra621n@gmail.com', '+918217712798', 'active', '2026-07-07 05:03:02', '2026-07-07 05:03:02'),
(295, '69f0b1c8415467e0a6ad821a', 'Siddesha', 'K R', 'Siddesha K R', 'siddeshkr03@gmail.com', '+916361245952', 'active', '2026-07-07 05:03:02', '2026-07-07 05:03:02'),
(296, '69f0b1b3415467e0a6ad7fcb', 'Safa', 'Khalid', 'Safa Khalid', 'safapkhalid@gmail.com', '+916235099390', 'active', '2026-07-07 05:03:02', '2026-07-07 05:03:02'),
(297, '69f0b1a1415467e0a6ad7d6b', 'Rishav', 'Komal', 'Rishav Komal', 'rishavk3106@gmail.com', '+918092808642', 'active', '2026-07-07 05:03:02', '2026-07-07 05:03:02'),
(298, '69f0b190415467e0a6ad7b15', 'Riddhisatwa', 'Ghosh', 'Riddhisatwa Ghosh', 'ghoshriddhisatwa@qmaii.com', '+917010443280', 'active', '2026-07-07 05:03:02', '2026-07-07 05:03:02'),
(299, '69f0b170415467e0a6ad78c1', 'RAJAT', 'PRATAP SINGH', 'RAJAT PRATAP SINGH', 'singh.003rajat@gmail.com', '+919411911000', 'active', '2026-07-07 05:03:02', '2026-07-07 05:03:02'),
(300, '69f0b15c415467e0a6ad7674', 'RAJASHREE', 'THARMALINGAM', 'RAJASHREE THARMALINGAM', 'rajashree0023@gmail.com', '+919384434540', 'active', '2026-07-07 05:03:02', '2026-07-07 05:03:02'),
(301, '69f0b13a415467e0a6ad7422', 'Raghavendra', 'K B', 'Raghavendra K B', 'raghukb94@gmail.com', '+919480055941', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(302, '69f0b125415467e0a6ad71c9', 'PRIYANGA', 'A', 'PRIYANGA A', 'priyanga070302@gmail.com', '+918921919301', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(303, '69f0b10d415467e0a6ad6f6f', 'Pragati', 'Khare', 'Pragati Khare', 'pragatikhare.148@gmail.com', '+919506333410', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(304, '69f0b0f7415467e0a6ad6d27', 'Prachi', 'Panwar', 'Prachi Panwar', 'prachipanwar06@gmail.com', '+918287586612', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(305, '69f0b0e4415467e0a6ad6ae5', 'PRACHI', 'KHAJURIA', 'PRACHI KHAJURIA', 'khajuriaprachi074@gmail.com', '+916239430485', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(306, '69f0b09b415467e0a6ad6751', 'Polamraju', 'Surya Karthikesh', 'Polamraju Surya Karthikesh', 'pskarthikesh@gmail.com', '+916301219834', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(307, '69f0b06d415467e0a6ad64df', 'Piyush', 'Rana', 'Piyush Rana', 'piyush222rana@gmail.com', '+917004803654', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(308, '69f0b053415467e0a6ad6298', 'Penikalapati', 'Premnath', 'Penikalapati Premnath', 'ppremnath@50gmai.com', '+919390817593', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(309, '69f0b045415467e0a6ad604f', 'Pallavi', 'S', 'Pallavi S', 'pallavispavikgl@gmail.com', '+917022084297', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(310, '69f0b030415467e0a6ad5df4', 'Pallavi', 'Jattu Gowda', 'Pallavi Jattu Gowda', 'pallavigouda1@gmail.com', '+919591902766', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(311, '69f0b015415467e0a6ad5b97', 'NITESH', 'KUMAR', 'NITESH KUMAR', 'nk1711336@gmail.com', '+919334129956', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(312, '69f0afe0415467e0a6ad5937', 'KRISHNA TEJA PHANI', 'MANIKANTAREDDY MEDAPATI', 'KRISHNA TEJA PHANI MANIKANTAREDDY MEDAPATI', 'tejareddy4547@gmail.com', '+919553093459', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(313, '69f0afb9415467e0a6ad548e', 'Marripudi', 'Sai Chandana', 'Marripudi Sai Chandana', 'saichandana352@gmail.com', '+917093095937', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(314, '69f0afa9415467e0a6ad5241', 'Manoranjan', 'Jena', 'Manoranjan Jena', 'manoranjanjena0003@gmail.com', '+918093640493', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(315, '69f0af96415467e0a6ad4ffe', 'MALLIKA', 'LAKSHMESHWARAMATHA', 'MALLIKA LAKSHMESHWARAMATHA', 'mallikalakshmeshwaramatha@gmail.com', '+918970973822', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(316, '69f0af7b415467e0a6ad4dac', 'LOKESH', 'B', 'LOKESH B', 'lokesh1227.b@gmail.com', '+919353175172', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(317, '69f0af59415467e0a6ad4b59', 'Kunal', 'Das', 'Kunal Das', 'dashingkunal143@gmail.com', '+917250748954', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(318, '69f0af44415467e0a6ad48ee', 'KRUTHIKASHREE', 'S K', 'KRUTHIKASHREE S K', 'kruthikaasgowda@gmail.com', '+918496901991', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(319, '69f0af30415467e0a6ad46a0', 'Kishore', 'Jha', 'Kishore Jha', 'kishorejha321999@gmail.com', '+919798157213', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(320, '69f0af20415467e0a6ad444e', 'Kiran', 'Kadappanavar', 'Kiran Kadappanavar', 'kirankadappanavar820@gmail.com', '+919380553976', 'active', '2026-07-07 05:03:03', '2026-07-07 05:03:03'),
(321, '69f0af03415467e0a6ad41fc', 'KHUSHI', 'TALWAR', 'KHUSHI TALWAR', 'kntalwar04@gmail.com', '+916366281124', 'active', '2026-07-07 05:03:04', '2026-07-07 05:03:04'),
(322, '69f0aef4415467e0a6ad3faf', 'Haseena', 'Guntakalla', 'Haseena Guntakalla', 'guntakallahaseenabhanu@gmail.com', '+919182281369', 'active', '2026-07-07 05:03:04', '2026-07-07 05:03:04'),
(323, '69f0aedd415467e0a6ad3d68', 'Harshil', 'Gupta', 'Harshil Gupta', 'harshilgupta562@gmail.com', '+919610554797', 'active', '2026-07-07 05:03:04', '2026-07-07 05:03:04'),
(324, '69f0aeba415467e0a6ad39d3', 'Divyashree', 'Unknown', 'Divyashree Unknown', 'dividivyasakthi@gmail.com', '+918015799451', 'active', '2026-07-07 05:03:04', '2026-07-07 05:03:04'),
(325, '69f0aeaa415467e0a6ad3786', 'Keerthisree', 'Chiruvulu', 'Keerthisree Chiruvulu', 'keerthisreechiruvolu@gmail.com', '+918639947822', 'active', '2026-07-07 05:03:04', '2026-07-07 05:03:04'),
(326, '69f0ae92415467e0a6ad3526', 'Bhoomika', 'Rajaput', 'Bhoomika Rajaput', 'bhoomisinghr@gmail.com', '+917892312355', 'active', '2026-07-07 05:03:04', '2026-07-07 05:03:04'),
(327, '69f0ae87415467e0a6ad32e1', 'BHARATHRAJ', 'P', 'BHARATHRAJ P', 'rbharathrajp.2523@gmail.com', '+916374657388', 'active', '2026-07-07 05:03:04', '2026-07-07 05:03:04'),
(328, '69f0ae6f415467e0a6ad3093', 'Bhanupriya', 'SD', 'Bhanupriya SD', 'bhanusd2003@gmail.com', '+918618429453', 'active', '2026-07-07 05:03:04', '2026-07-07 05:03:04'),
(329, '69f0ae52415467e0a6ad2e28', 'Balaji', 'Devtar', 'Balaji Devtar', 'balajidevtar.dev@gmail.com', '+917038575658', 'active', '2026-07-07 05:03:04', '2026-07-07 05:03:04'),
(330, '69f0ae44415467e0a6ad2bd7', 'Vishnuvardhan', 'Reddy Avula', 'Vishnuvardhan Reddy Avula', 'vishnureddyavula04@gmail.com', '+919014183577', 'active', '2026-07-07 05:03:04', '2026-07-07 05:03:04'),
(331, '69f0ae2d415467e0a6ad2734', 'ANUJ', 'AGARWAL', 'ANUJ AGARWAL', 'agarwalanuj900@gmail.com', '+916386271161', 'active', '2026-07-07 05:03:05', '2026-07-07 05:03:05'),
(332, '69f0ae1d415467e0a6ad24c6', 'SYED', 'AMAN ALI', 'SYED AMAN ALI', 'syedaman475@gmail.com', '+919036217758', 'active', '2026-07-07 05:03:05', '2026-07-07 05:03:05'),
(333, '69f0ae07415467e0a6ad2266', 'ADITYA', 'SHEKHAR', 'ADITYA SHEKHAR', 'adityashekhar04@gmail.com', '+916299589415', 'active', '2026-07-07 05:03:05', '2026-07-07 05:03:05'),
(334, '69f09c31415467e0a6ac8a7e', 'Yamini', 'Sai Bandike', 'Yamini Sai Bandike', 'yaminisaibandike@gmail.com', '+917396406564', 'active', '2026-07-07 05:03:05', '2026-07-07 05:03:05'),
(335, '69f09c0a415467e0a6ac85de', 'Vishnu', 'Pillai', 'Vishnu Pillai', 'vishnupillai2001@gmail.com', '+919643813306', 'active', '2026-07-07 05:03:05', '2026-07-07 05:03:05'),
(336, '69f09be8415467e0a6ac8388', 'Vasant', 'Jyoti', 'Vasant Jyoti', 'vasantjyoti36@gmail.com', '+918268484218', 'active', '2026-07-07 05:03:05', '2026-07-07 05:03:05'),
(337, '69f09bd9415467e0a6ac8131', 'Varun', 'Saxena', 'Varun Saxena', 'varunsaxena1332001@gmail.com', NULL, 'active', '2026-07-07 05:03:05', '2026-07-07 05:03:05'),
(338, '69f09bcb415467e0a6ac7ee0', 'Mora', 'Vamsi', 'Mora Vamsi', 'vamsimora21@gmail.com', '+917993693429', 'active', '2026-07-07 05:03:05', '2026-07-07 05:03:05'),
(339, '69f09bbf415467e0a6ac7c93', 'PRASANTH', 'KUMAR', 'PRASANTH KUMAR', 't.prasanthkumar00@gmail.com', '+919392847209', 'active', '2026-07-07 05:03:05', '2026-07-07 05:03:05'),
(340, '69f09bab415467e0a6ac7a4e', 'Tharun', 'Peram', 'Tharun Peram', 'tharunperam19@gmail.com', '+916301290719', 'active', '2026-07-07 05:03:05', '2026-07-07 05:03:05'),
(341, '69f09b9e415467e0a6ac77eb', 'Swarnima', 'Gupta', 'Swarnima Gupta', 'guptaswarnima24@gmail.com', '+918670514941', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(342, '69f09b89415467e0a6ac759b', 'SUJAY', 'S', 'SUJAY S', 'sujaygowdas2003@gmail.com', '+917619463388', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(343, '69f09b76415467e0a6ac734d', 'Sonukumar', 'Thakur', 'Sonukumar Thakur', 'sonukumarthakur094@gmail.com', '+917397952960', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(344, '69f09b66415467e0a6ac70fd', 'Shivani', 'R', 'Shivani R', 'shivani53286@gmail.com', '+918867582038', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(345, '69f09b49415467e0a6ac6ea0', 'Shivam', 'Mishra', 'Shivam Mishra', 'shivam.mishra02014@gmail.com', '+919165810865', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(346, '69f09b39415467e0a6ac6c49', 'SHAIK', 'FIRDAUZE FATHIMA', 'SHAIK FIRDAUZE FATHIMA', 'shaikfirdauzefathima@gmail.com', '+917815974622', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(347, '69f09b21415467e0a6ac69ee', 'ANAM', 'SAYYED', 'ANAM SAYYED', 'sayyedanam2510@gmail.com', '+917769901286', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(348, '69f09b11415467e0a6ac67a0', 'Saurabh', 'Tripathi', 'Saurabh Tripathi', 'trisau38@gmail.com', '+917355216317', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(349, '69f09afd415467e0a6ac654e', 'Riza', 'Mansuri', 'Riza Mansuri', 'riza.mansuri11@gmail.com', '+918530537037', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(350, '69f09aec415467e0a6ac62f0', 'Raghavendra', 'Pulugu', 'Raghavendra Pulugu', 'raghavapulugu@gmail.com', '+919392894959', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(351, '69f09ade415467e0a6ac60a2', 'Pritirekha', 'Panda', 'Pritirekha Panda', 'iampritirekha@gmail.com', '+917657053698', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(352, '69f09ab2415467e0a6ac5b70', 'PRASHANTH', 'K V', 'PRASHANTH K V', 'prashanthkvp98@gmail.com', '+919986561833', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(353, '69f09a92415467e0a6ac58cf', 'Neha', 'Kumari', 'Neha Kumari', 'techieneha.it@gmail.com', '+917903910247', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(354, '69f09a84415467e0a6ac5675', 'NAVYA', 'GOUNIVARI', 'NAVYA GOUNIVARI', 'gnavya7777@gmail.com', '+919182421782', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(355, '69f09a72415467e0a6ac542c', 'MANASA', 'G', 'MANASA G', 'manasa.g5639@gmail.com', '+918639824034', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(356, '69f09a5f415467e0a6ac51d8', 'Kuppili', 'Venkata Ramana', 'Kuppili Venkata Ramana', 'kuppilivenkataramana100@gmail.com', '+919392851746', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(357, '69f09a4e415467e0a6ac4f93', 'Nandini', 'Kunchapu', 'Nandini Kunchapu', 'nandinikunchapu312@gmail.com', '+918977061407', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(358, '69f09a3e415467e0a6ac4d42', 'KEERTHANA', 'V S', 'KEERTHANA V S', 'keerthana16vs@gmail.com', '+919361159589', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(359, '69f09a29415467e0a6ac4abc', 'KANISHK', 'Y', 'KANISHK Y', 'kanishk1ga22is071@gmail.com', '+919019487266', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(360, '69f09a1a415467e0a6ac4861', 'Jaya', 'Srivastava', 'Jaya Srivastava', 'jsrivastavapy.135@gmail.com', '+919818312123', 'active', '2026-07-07 05:03:06', '2026-07-07 05:03:06'),
(361, '69f09a0b415467e0a6ac45fd', 'HITESH', 'GM', 'HITESH GM', 'hiteshgm28@gmail.com', '+918884659330', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(362, '69f099f9415467e0a6ac43a3', 'Hemapriya', 'J', 'Hemapriya J', 'hemapriya.2604@gmail.com', '+918660387371', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(363, '69f099e9415467e0a6ac4157', 'GOGI', 'ROHITH', 'GOGI ROHITH', 'gredyrohith21@gmail.com', '+919177021921', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(364, '69f099d6415467e0a6ac3f06', 'Bhanu', 'Gangishetty', 'Bhanu Gangishetty', 'bhanugangishetty0@gmail.com', '+919347750536', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(365, '69f0999f415467e0a6ac3c87', 'Gagan', 'G D', 'Gagan G D', 'gagangowda9313@gmail.com', '+916362964878', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(366, '69f0998a415467e0a6ac3a2b', 'FAISAL', 'SOHAIL', 'FAISAL SOHAIL', 'faisalsohail782@gmail.com', '+918873459519', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(367, '69f09973415467e0a6ac37c1', 'Dudekula', 'Malik Basha', 'Dudekula Malik Basha', 'dudekulamalikbasha6@gmail.com', '+919704147626', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(368, '69f0996b415467e0a6ac36da', 'K', 'V Chiranjeevi', 'K V Chiranjeevi', 'vekomiri16@gmail.com', '+919121191793', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(369, '69f09961415467e0a6ac34d0', 'Divya', 'U', 'Divya U', 'divyaumashankar777@gmail.com', '+919019205669', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(370, '69f0994d415467e0a6ac3277', 'Chandrahas', 'Gunda', 'Chandrahas Gunda', 'gchandrahas23@gmail.com', '+919492990322', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(371, '69f0993c415467e0a6ac315d', 'Balaram', 'Pradhan', 'Balaram Pradhan', 'balarampradhan806@gmail.com', '+917377292891', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(372, '69f0993a415467e0a6ac2f5a', 'BHAVANA', 'Unknown', 'BHAVANA Unknown', 'bastibhanu@gmail.com', '+917338445827', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(373, '69f0992a415467e0a6ac2e57', 'ABINAYA', 'KANNAN', 'ABINAYA KANNAN', 'kabinayakannan.kk@gmail.com', '+918925018397', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(374, '69f09923415467e0a6ac2c53', 'Bharath', 'GS', 'Bharath GS', 'bharath.g.s177@gmail.com', '+917619374546', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(375, '69f0991a415467e0a6ac2b67', 'Manamma', 'Kella', 'Manamma Kella', 'manikella1999@gmail.om', NULL, 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(376, '69f09911415467e0a6ac296e', 'BODIGUTTA', 'BHANU PRAKASH', 'BODIGUTTA BHANU PRAKASH', 'bp202918@gmail.com', '+919704633694', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(377, '69f098fe415467e0a6ac264c', 'Avinash', 'Kumar', 'Avinash Kumar', 'brijors26may2000@gmail.com', '+918076346429', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(378, '69f098fa415467e0a6ac255e', 'Priya', 'Bhalerao', 'Priya Bhalerao', 'bhaleraopriya2002@gmail.com', '+918975505222', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(379, '69f098ea415467e0a6ac2348', 'ASHUTOSH', 'RAWAT', 'ASHUTOSH RAWAT', 'ashutosh.r20@iiits.in', '+918143817676', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(380, '69f098e8415467e0a6ac222d', 'Ajay', 'Kumar', 'Ajay Kumar', 'ajaykumarpilli799@gmail.com', '+916301601118', 'active', '2026-07-07 05:03:07', '2026-07-07 05:03:07'),
(381, '69f098d3415467e0a6ac2006', 'ASHIS', 'BISI', 'ASHIS BISI', 'aswinibishi02@gmail.com', '+917684880988', 'active', '2026-07-07 05:03:08', '2026-07-07 05:03:08'),
(382, '69f098d1415467e0a6ac1f18', 'Kalpak', 'D T', 'Kalpak D T', 'kalpakdt@gmail.com', '+917022722603', 'active', '2026-07-07 05:03:08', '2026-07-07 05:03:08'),
(383, '69f098c3415467e0a6ac1d01', 'Anusha', 'Nunna', 'Anusha Nunna', 'nunna7735@gmail.com', '+917671935976', 'active', '2026-07-07 05:03:08', '2026-07-07 05:03:08'),
(384, '69f098b9415467e0a6ac1c08', 'Pamu', 'Sainagaharshavardhan', 'Pamu Sainagaharshavardhan', 'pamusainagaharshavardhan1234@gmail.com', '+919392834907', 'active', '2026-07-07 05:03:08', '2026-07-07 05:03:08'),
(385, '69f098b0415467e0a6ac19ee', 'ANUPAM', 'CHAND', 'ANUPAM CHAND', 'anupamchand5577@gmail.com', '+918755891489', 'active', '2026-07-07 05:03:08', '2026-07-07 05:03:08'),
(386, '69f0989a415467e0a6ac18d5', 'HARISH', 'D', 'HARISH D', 'mailboxharish96@gmail.com', '+918807261096', 'active', '2026-07-07 05:03:08', '2026-07-07 05:03:08'),
(387, '69f09892415467e0a6ac16be', 'ANKITHA', 'Unknown', 'ANKITHA Unknown', 'ankithaa989@gmail.com', '+917795458969', 'active', '2026-07-07 05:03:08', '2026-07-07 05:03:08'),
(388, '69f09883415467e0a6ac15b3', 'ASHISH', 'JHA', 'ASHISH JHA', 'ashishjha4527@gmail.com', '+917667871713', 'active', '2026-07-07 05:03:08', '2026-07-07 05:03:08'),
(389, '69f0987a415467e0a6ac13a7', 'ANIL', 'SABAVAT', 'ANIL SABAVAT', 'anilsabavat512@gmail.com', '+918767658203', 'active', '2026-07-07 05:03:08', '2026-07-07 05:03:08'),
(390, '69f09864415467e0a6ac1284', 'Ganji', 'Lokesh Kumar', 'Ganji Lokesh Kumar', 'ganjilokesh8582@gmail.com', '+919959308582', 'active', '2026-07-07 05:03:08', '2026-07-07 05:03:08'),
(391, '69f09853415467e0a6ac105f', 'Akash', 'Mole', 'Akash Mole', 'akashmole1@gmail.com', '+916360091939', 'active', '2026-07-07 05:03:09', '2026-07-07 05:03:09'),
(392, '69f0962c415467e0a6ac0c5d', 'Sammed', 'Jinrale', 'Sammed Jinrale', 'sammedj06@gmail.com', '+917767040375', 'active', '2026-07-07 05:03:09', '2026-07-07 05:03:09'),
(393, '69f09618415467e0a6ac09fa', 'Jagadeesh', 'Kumar', 'Jagadeesh Kumar', 'jagadeesh.neesu.devops@gmail.com', '+917981338865', 'active', '2026-07-07 05:03:09', '2026-07-07 05:03:09'),
(394, '69f09608415467e0a6ac07b6', 'Ashish', 'Dubey', 'Ashish Dubey', 'ashish.dubey273402@gmail.com', '+916392938143', 'active', '2026-07-07 05:03:09', '2026-07-07 05:03:09'),
(395, '69f095f5415467e0a6ac0563', 'ASHWIN', 'R', 'ASHWIN R', 'ashwinr1805@gmail.com', '+919944344743', 'active', '2026-07-07 05:03:09', '2026-07-07 05:03:09'),
(396, '69f095c4415467e0a6ac00bc', 'Shirisha', 'Unknown', 'Shirisha Unknown', 'eshirisha1234@gmail.com', '+917893077109', 'active', '2026-07-07 05:03:09', '2026-07-07 05:03:09'),
(397, '69f095a9415467e0a6abfe6d', 'Sushant', 'Singh', 'Sushant Singh', 'sushantsingh5409@gmail.com', '+916387732907', 'active', '2026-07-07 05:03:09', '2026-07-07 05:03:09'),
(398, '69f0959f415467e0a6abfc22', 'Anushka', 'Patil', 'Anushka Patil', 'anushkap0912@gmail.com', '+918080198285', 'active', '2026-07-07 05:03:09', '2026-07-07 05:03:09'),
(399, '69f09585415467e0a6abf9ba', 'Manasi', 'Rasal', 'Manasi Rasal', 'rasalmanasi25@gmail.com', '+919307923954', 'active', '2026-07-07 05:03:09', '2026-07-07 05:03:09'),
(400, '69f09572415467e0a6abf772', 'Teja', 'Kumar T', 'Teja Kumar T', 'tejaabhiram2908@gmail.com', '+917675032504', 'active', '2026-07-07 05:03:09', '2026-07-07 05:03:09'),
(401, '69f0955a415467e0a6abf519', 'AJINKYA', 'SURYAWANSHI', 'AJINKYA SURYAWANSHI', 'suryawanshiajinkya05@gmail.com', '+917499381039', 'active', '2026-07-07 05:03:10', '2026-07-07 05:03:10'),
(402, '69f09549415467e0a6abf2d3', 'Dhinesh', 'M', 'Dhinesh M', 'dhinesh88825@gmail.com', '+919345774767', 'active', '2026-07-07 05:03:10', '2026-07-07 05:03:10'),
(403, '69f09530415467e0a6abf087', 'Aditi', 'Kalaskar', 'Aditi Kalaskar', 'aditikalaskar44@gmail.com', '+918983186228', 'active', '2026-07-07 05:03:10', '2026-07-07 05:03:10'),
(404, '69f094f9415467e0a6abebe2', 'Prashanth', 'Reddy', 'Prashanth Reddy', 'prashanthreddykotireddy@gmail.com', '+917702756596', 'active', '2026-07-07 05:03:10', '2026-07-07 05:03:10'),
(405, '69f094e1415467e0a6abe98b', 'PAVAN', 'KUMAR CHINNAMSETTI', 'PAVAN KUMAR CHINNAMSETTI', 'pavankumarch912@gmail.com', '+916309866397', 'active', '2026-07-07 05:03:10', '2026-07-07 05:03:10'),
(406, '69f094c6415467e0a6abe746', 'Karthik', 'Nadimpalli', 'Karthik Nadimpalli', 'karthiknadimpalli2000@gmail.com', '+919491951083', 'active', '2026-07-07 05:03:10', '2026-07-07 05:03:10'),
(407, '69f094ba415467e0a6abe4f8', 'SURESH', 'KUMAR R', 'SURESH KUMAR R', 'rsureshkumar85317@gmail.com', '+918695433236', 'active', '2026-07-07 05:03:10', '2026-07-07 05:03:10'),
(408, '69f09490415467e0a6abe29b', 'Hariprasath', 'Kalvi', 'Hariprasath Kalvi', 'hariprasathkalvi@gmail.com', '+918220090982', 'active', '2026-07-07 05:03:10', '2026-07-07 05:03:10'),
(409, '69f0947d415467e0a6abe04f', 'KANDIBEDALA', 'AJAY', 'KANDIBEDALA AJAY', 'ajaychowdary1221@gmail.com', '+919150579503', 'active', '2026-07-07 05:03:10', '2026-07-07 05:03:10'),
(410, '69f0945b415467e0a6abdbb1', 'YOGESHWARAN', 'S', 'YOGESHWARAN S', 'yogeshwaransiva0105@gmail.com', '+917550107118', 'active', '2026-07-07 05:03:10', '2026-07-07 05:03:10'),
(411, '69f0944b415467e0a6abd958', 'Shikha', 'Tripathi', 'Shikha Tripathi', 'shikhatripathi732@gmail.com', '+917268923948', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(412, '69f09433415467e0a6abd713', 'Piyush', 'Kadam', 'Piyush Kadam', 'kadampiyush001@gmail.com', '+918010179156', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(413, '69f09422415467e0a6abd4b8', 'Nikhil', 'Kumar A P', 'Nikhil Kumar A P', 'nikhilkumarap034@gmail.com', '+916360131265', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(414, '69f09407415467e0a6abd260', 'Sai', 'Kumar Sakinam', 'Sai Kumar Sakinam', 'sai.sakinam@gmail.com', '+918121965536', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(415, '69f093f7415467e0a6abd01d', 'Samreen', 'Arshad', 'Samreen Arshad', 'arshad18samreen@gmail.com', '+918799441392', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(416, '69f093e3415467e0a6abcdd1', 'AMAN', 'JHA', 'AMAN JHA', 'amanjha7004121@gmail.com', '+917004853121', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(417, '69f093c7415467e0a6abcb72', 'MEHUL', 'GAGNANI', 'MEHUL GAGNANI', 'mehulgagnani12@gmail.com', '+919898887505', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(418, '69f093b2415467e0a6abc914', 'Siddhesh', 'Dhamone', 'Siddhesh Dhamone', 'siddhesh3692@gmail.com', '+919579033692', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(419, '69f093a2415467e0a6abc6b2', 'Mohamad', 'Hamdhan HM', 'Mohamad Hamdhan HM', 'mohamadhamdhanhm6@gmail.com', '+919585772632', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(420, '69f09390415467e0a6abc45e', 'Rahul', 'Bagal', 'Rahul Bagal', 'rahulbagal20@gmail.com', '+918369263722', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(421, '69f0937c415467e0a6abc1e4', 'Shubham', 'Pandey', 'Shubham Pandey', 'shubhampandey8756@gmail.com', '+918756025258', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(422, '69f09354415467e0a6abbcd7', 'Zeeshan', 'Ulla A', 'Zeeshan Ulla A', 'ulla96@gmail.com', '+918792962149', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(423, '69f0933e415467e0a6abba8a', 'Rutuja', 'Singru', 'Rutuja Singru', 'rutuks1506@gmail.com', '+917770020507', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(424, '69f09317415467e0a6abb5b4', 'Sandeep', 'Kumar', 'Sandeep Kumar', 'sandeepk.dataeng@gmail.com', '+917233994264', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(425, '69f092ce415467e0a6abac6b', 'Anita', 'Murale', 'Anita Murale', 'anitamurale7@gmail.com', '+917259226733', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(426, '69f092b8415467e0a6abaa0f', 'SAI', 'THANAY', 'SAI THANAY', 'thanayvallamkonda@gmail.com', '+919494909560', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(427, '69f092a8415467e0a6aba7bd', 'PRATHAMESH', 'PANDHARE', 'PRATHAMESH PANDHARE', 'pandhareprathamesh13@gmail.com', '+919270753962', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(428, '69f0929a415467e0a6aba565', 'HAPPY', 'SAHU', 'HAPPY SAHU', 'happysahu69@gmail.com', '+918117876097', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(429, '69f09286415467e0a6aba301', 'Chinna', 'Raja Reddy Maraka', 'Chinna Raja Reddy Maraka', 'marakachinnarajareddy154@gmail.com', '+916300051360', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(430, '69f09279415467e0a6aba0a5', 'Sai Charan', 'Reddy CH', 'Sai Charan Reddy CH', 'saicharanchelmalla18@gmail.com', '+917674943059', 'active', '2026-07-07 05:03:11', '2026-07-07 05:03:11'),
(431, '69f09255415467e0a6ab9be2', 'Shreya', 'Dhore', 'Shreya Dhore', 'shredhore6@gmail.com', '+919588443889', 'active', '2026-07-07 05:03:12', '2026-07-07 05:03:12'),
(432, '69f0923f415467e0a6ab991f', 'Yash', 'Prashar', 'Yash Prashar', 'yashprashar22@gmail.com', '+919588748177', 'active', '2026-07-07 05:03:12', '2026-07-07 05:03:12'),
(433, '69f09227415467e0a6ab96e9', 'Yajnesh', 'Chandrashekar', 'Yajnesh Chandrashekar', 'yajneshshetty000@gmail.com', '+916363234811', 'active', '2026-07-07 05:03:12', '2026-07-07 05:03:12'),
(434, '69f09210415467e0a6ab94b2', 'Dugyala', 'Vamshidharrao', 'Dugyala Vamshidharrao', 'vamshidharrao1725@gmail.com', '+919059031725', 'active', '2026-07-07 05:03:12', '2026-07-07 05:03:12'),
(435, '69f091fc415467e0a6ab926b', 'Vaishali', 'Tiwari', 'Vaishali Tiwari', 'tiwarivaishali78@gmail.com', '+916394574407', 'active', '2026-07-07 05:03:12', '2026-07-07 05:03:12'),
(436, '69f091e8415467e0a6ab9024', 'Triveni', 'Unknown', 'Triveni Unknown', 'trivenirvp@gmail.com', '+918431035012', 'active', '2026-07-07 05:03:12', '2026-07-07 05:03:12'),
(437, '69f091d9415467e0a6ab8de9', 'SWETHA', 'B', 'SWETHA B', 'swethabala2808@gmail.com', '+919025795145', 'active', '2026-07-07 05:03:12', '2026-07-07 05:03:12'),
(438, '69f091ca415467e0a6ab8bb4', 'SUMANTH', 'GOWDA Y K', 'SUMANTH GOWDA Y K', 'sumanthgowda062003@gmail.com', '+917899944566', 'active', '2026-07-07 05:03:12', '2026-07-07 05:03:12'),
(439, '69f091b5415467e0a6ab8972', 'Sreeya', 'Dora', 'Sreeya Dora', 'sreeya.dr@gmail.com', '+919591987914', 'active', '2026-07-07 05:03:12', '2026-07-07 05:03:12'),
(440, '69f091a4415467e0a6ab873a', 'Somesh', 'Bhosale', 'Somesh Bhosale', 'someshbhosale06@gmail.com', '+918149731406', 'active', '2026-07-07 05:03:12', '2026-07-07 05:03:12'),
(441, '69f0918c415467e0a6ab84fc', 'Siddharth', 'Kumar', 'Siddharth Kumar', 'sidkr00ara@gmail.com', '+917050606576', 'active', '2026-07-07 05:03:13', '2026-07-07 05:03:13'),
(442, '69f09177415467e0a6ab82c0', 'SHREEJIT', 'MAGADUM', 'SHREEJIT MAGADUM', 'shreejitmagadum2003@gmail.com', '+918618729579', 'active', '2026-07-07 05:03:13', '2026-07-07 05:03:13'),
(443, '69f09153415467e0a6ab808b', 'Shibu', 'Mohapatra', 'Shibu Mohapatra', 'mohapatrashibu@gmail.com', '+918208213211', 'active', '2026-07-07 05:03:13', '2026-07-07 05:03:13'),
(444, '69f09129415467e0a6ab7e3a', 'Khadar', 'Basha shaik', 'Khadar Basha shaik', 'shaik786thameem@gmail.com', '+918522900280', 'active', '2026-07-07 05:03:13', '2026-07-07 05:03:13'),
(445, '69f0911a415467e0a6ab7c02', 'SATVIK', 'SHRIVASTAVA', 'SATVIK SHRIVASTAVA', 'satvikshrivastav1103@gmail.com', '+917250381555', 'active', '2026-07-07 05:03:13', '2026-07-07 05:03:13'),
(446, '69f090fa415467e0a6ab79bd', 'Rugved', 'Chandekar', 'Rugved Chandekar', 'rugvedchandekar@gmail.com', '+919284357740', 'active', '2026-07-07 05:03:13', '2026-07-07 05:03:13'),
(447, '69f090e2415467e0a6ab778c', 'RAMANJALI', 'CHATTU', 'RAMANJALI CHATTU', 'ramanjalichattu@gmail.com', '+918106697523', 'active', '2026-07-07 05:03:13', '2026-07-07 05:03:13'),
(448, '69f090d4415467e0a6ab7532', 'Rakshitha', 'Murthy', 'Rakshitha Murthy', '05rakshum@gmail.com', '+918217266327', 'active', '2026-07-07 05:03:13', '2026-07-07 05:03:13'),
(449, '69f090b5415467e0a6ab72ef', 'Rachna', 'Unknown', 'Rachna Unknown', 'rachnavermasv369@gmail.com', '+919817498116', 'active', '2026-07-07 05:03:13', '2026-07-07 05:03:13'),
(450, '69f0909c415467e0a6ab70c1', 'Prasad', 'Hiremath', 'Prasad Hiremath', 'prasadhiremath1443@gmail.com', '+919110279636', 'active', '2026-07-07 05:03:13', '2026-07-07 05:03:13'),
(451, '69f09080415467e0a6ab6e84', 'POOJA', 'BENAKATTI', 'POOJA BENAKATTI', 'benakattipooja@gmail.com', '+916361268553', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(452, '69f09059415467e0a6ab6c39', 'Pavitra', 'Chillal', 'Pavitra Chillal', 'pavitrachillal@gmail.com', '+919739918599', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(453, '69f09042415467e0a6ab6a01', 'PADMASHREE', 'Unknown', 'PADMASHREE Unknown', 'padmashreekulal26@gmail.com', '+919743606711', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(454, '69f0902e415467e0a6ab67c4', 'Nithin', 'P K', 'Nithin P K', 'nithinpk136@gmail.com', '+918660459019', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(455, '69f09009415467e0a6ab6353', 'Nattala', 'Manisha', 'Nattala Manisha', 'nattalamanisha@gmail.com', '+919441060577', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(456, '69f08ffa415467e0a6ab6119', 'MOHAMED', 'HUSSAIN', 'MOHAMED HUSSAIN', 'p.a.hussain543@gmail.com', '+919500212986', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(457, '69f08fe8415467e0a6ab5ecb', 'Tanneeru', 'Madhubala', 'Tanneeru Madhubala', 'tanirumadhu903@gmail.com', '+919032013086', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(458, '69f08fdc415467e0a6ab5c8e', 'Devi', 'Sundari Koppana', 'Devi Sundari Koppana', 'devikoppana42@gmail.com', '+916305497278', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(459, '69f08fcc415467e0a6ab5a5b', 'Karthikayini', 'Ayyappan', 'Karthikayini Ayyappan', 'karthikayini04122001@gmail.com', '+918438320946', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(460, '69f08fb9415467e0a6ab5819', 'Sanjay', 'Kumar', 'Sanjay Kumar', 'kamanisanju2705@gmail.com', '+918520932705', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(461, '69f08fa0415467e0a6ab55d0', 'JANHAVI', 'BORSE', 'JANHAVI BORSE', 'borsejanhavi20022@gmail.com', '+917743967205', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(462, '69f08f8e415467e0a6ab539a', 'HEMANTH', 'MANNEM', 'HEMANTH MANNEM', 'hemanthmannem1@gmail.com', '+919182441569', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(463, '69f08f77415467e0a6ab5153', 'Harsha', 'Vardhan', 'Harsha Vardhan', 'harshabandi.b@gmail.com', '+919553053893', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(464, '69f08f64415467e0a6ab4f1a', 'Sri Eswara Sairam', 'Unknown', 'Sri Eswara Sairam Unknown', 'eswarsai527@gmail.com', '+919063504608', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(465, '69f08f57415467e0a6ab4ce3', 'Gaurav', 'Ganguly', 'Gaurav Ganguly', 'gangulygaurav166@gmail.com', '+917066457141', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(466, '69f08f36415467e0a6ab45fc', 'Candidate', 'Unknown', 'Candidate Unknown', 'ganeshprasad8732@gmail.com', '+918105707057', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(467, '69f08f25415467e0a6ab43aa', 'VARUN', 'Unknown', 'VARUN Unknown', 'varunesarapu@gmail.com', '+919742212496', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(468, '69f08efc415467e0a6ab3f01', 'Meghana', 'Epuri', 'Meghana Epuri', 'meghanaepuri02@gmail.com', '+916305688309', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(469, '69f08eee415467e0a6ab3cae', 'DUMPA', 'KARTHIK REDDY', 'DUMPA KARTHIK REDDY', 'karthikreddydumpa8688@gmail.com', '+918688244275', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(470, '69f08ee2415467e0a6ab3a78', 'Dinesh', 'kumar P L', 'Dinesh kumar P L', 'dineshkumarlsdd@gmail.com', '+919150720946', 'active', '2026-07-07 05:03:14', '2026-07-07 05:03:14'),
(471, '69f08ed0415467e0a6ab3830', 'Bharath', 'S N', 'Bharath S N', 'bharathbattasn@gmail.com', '+919164411656', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(472, '69f08eac415467e0a6ab35d4', 'Ashok', 'Boinpally', 'Ashok Boinpally', 'boinpallyashokgoud@gmail.com', '+916303095407', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(473, '69f08e9b415467e0a6ab338d', 'Anmol', 'Gaikwad', 'Anmol Gaikwad', 'ganmol700@gmail.com', '+917756050736', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(474, '69f08e7b415467e0a6ab300c', 'Akshay', 'Raaj C S', 'Akshay Raaj C S', 'akshay.raaj124@gmail.com', '+918217525356', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(475, '69f08e6b415467e0a6ab2dc5', 'ABRAR', 'IBRAHIM SHEIKH', 'ABRAR IBRAHIM SHEIKH', 'abraris2021@gmail.com', '+919061816824', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(476, '69f08e57415467e0a6ab2b7f', 'ABHIJITH', 'JR', 'ABHIJITH JR', 'jrabhijithktd@gmail.com', '+916282783939', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(477, '69f07fc5415467e0a6aa6ec3', 'ASHATAI', 'JAGTAP', 'ASHATAI JAGTAP', 'ashakpatil2025@gmail.com', '+919156592330', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(478, '69f07fad415467e0a6aa6c70', 'Bhaskar', 'Rao Sireddy', 'Bhaskar Rao Sireddy', 'sireddybhaskar88@gmail.com', '+919515475018', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(479, '69f07f8f415467e0a6aa68d3', 'Snehal', 'Kadam', 'Snehal Kadam', 'snehalkadamm05@gmail.com', '+919923945537', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(480, '69f07f81415467e0a6aa668f', 'Swaroop', 'S', 'Swaroop S', 'keshavswaroop.s@gmail.com', '+918296342910', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(481, '69f07f45415467e0a6aa609e', 'VINAYAK', 'KULKARNI', 'VINAYAK KULKARNI', 'vinayakkulkarni4998@gmail.com', '+918793883223', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(482, '69f07f33415467e0a6aa5e41', 'RENUKA', 'GAVATE', 'RENUKA GAVATE', 'grenuka856@gmail.com', '+919423051274', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(483, '69f07f1d415467e0a6aa5bf0', 'Komal', 'Darekar', 'Komal Darekar', 'komaldarekar1302@gmail.com', '+919623617692', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(484, '69f07f0a415467e0a6aa598e', 'Kaustubh', 'Biradar', 'Kaustubh Biradar', 'biradarkaustubh@gmail.com', '+919403856400', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(485, '69f07efc415467e0a6aa573d', 'ANURATH', 'DAPKE', 'ANURATH DAPKE', 'anurath6819@gmail.com', '+917048963743', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(486, '69f07ef0415467e0a6aa54e5', 'Siva', 'Peethani', 'Siva Peethani', 'sivasatyap1@gmail.com', '+917396341126', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(487, '69f07ee6415467e0a6aa52a0', 'KALPITHA', 'SRINIVAS', 'KALPITHA SRINIVAS', 'kalpithaasrinivas@gmail.com', '+918431973076', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(488, '69f07ed4415467e0a6aa5054', 'Chirag', 'Suthar', 'Chirag Suthar', 'chiragsuthar2001@gmail.com', '+918000854732', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(489, '69f07ebd415467e0a6aa4df4', 'ATHARVA', 'PANDE', 'ATHARVA PANDE', 'atharvapande1298@gmail.com', '+919960533644', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(490, '69f07eb1415467e0a6aa4bb3', 'Yaswanth', 'Kumar', 'Yaswanth Kumar', 'yaswanthkumar2198@gmail.com', '+918019604494', 'active', '2026-07-07 05:03:15', '2026-07-07 05:03:15'),
(491, '69f07e9f415467e0a6aa496e', 'Tejas', 'Randhe', 'Tejas Randhe', 'tejasrandhe.official@gmail.com', '+919356015885', 'active', '2026-07-07 05:03:16', '2026-07-07 05:03:16'),
(492, '69f07e8d415467e0a6aa4719', 'DEBABRATA', 'MOHAPATRA', 'DEBABRATA MOHAPATRA', 'debabratamohapatra47@gmail.com', '+91918093334843', 'active', '2026-07-07 05:03:16', '2026-07-07 05:03:16'),
(493, '69f07e50415467e0a6aa4275', 'MANASA', 'REDDY', 'MANASA REDDY', 'padigapatim@gmail.com', '+919177445346', 'active', '2026-07-07 05:03:16', '2026-07-07 05:03:16'),
(494, '69f07e3d415467e0a6aa4028', 'Jeeva', 'Bharathi', 'Jeeva Bharathi', 'jeevanithya5@gmail.com', '+919789452807', 'active', '2026-07-07 05:03:16', '2026-07-07 05:03:16'),
(495, '69f07e26415467e0a6aa3dd0', 'AMIR', 'ANSARI', 'AMIR ANSARI', 'amirsohailansari3555@gmail.com', '+919205973410', 'active', '2026-07-07 05:03:16', '2026-07-07 05:03:16'),
(496, '69f07e14415467e0a6aa3b69', 'Yokesh', 'V', 'Yokesh V', 'yokeshv35@gmail.com', NULL, 'active', '2026-07-07 05:03:16', '2026-07-07 05:03:16'),
(497, '69f07e08415467e0a6aa3927', 'Srinivas', 'Tombadi', 'Srinivas Tombadi', 'srinivastom0812@gmail.com', '+919182284507', 'active', '2026-07-07 05:03:16', '2026-07-07 05:03:16'),
(498, '69f07df0415467e0a6aa36d9', 'Nikhil', 'Bhosale', 'Nikhil Bhosale', 'nikhil.sbhosale3@gmail.com', '+918177813006', 'active', '2026-07-07 05:03:16', '2026-07-07 05:03:16'),
(499, '69f07ddf415467e0a6aa348c', 'Kishore', 'Bonthu', 'Kishore Bonthu', 'kishorebonthu06@gmail.com', '+919642123070', 'active', '2026-07-07 05:03:16', '2026-07-07 05:03:16'),
(500, '69f07dca415467e0a6aa323d', 'RIYA', 'DHUMAL', 'RIYA DHUMAL', 'riyadhumal369@gmail.com', '+919579253731', 'active', '2026-07-07 05:03:16', '2026-07-07 05:03:16'),
(501, '69f07db5415467e0a6aa2fee', 'PRACHI', 'SHARMA', 'PRACHI SHARMA', 'prachisharma309709@gmail.com', '+918273609992', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(502, '69f07da2415467e0a6aa2da0', 'Jalandhar', 'Bheemaraju', 'Jalandhar Bheemaraju', 'jalandhar.bheemaraju2@gmail.com', '+919652951909', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(503, '69f07d8e415467e0a6aa2b4a', 'BHAVYA', 'REDDY', 'BHAVYA REDDY', 'bhavyareddydayyala@gmail.com', '+919381221143', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(504, '69f07d79415467e0a6aa28fc', 'Sourav', 'Naagar', 'Sourav Naagar', 'souravnaagar11@gmail.com', '+919877494969', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(505, '69f07d54415467e0a6aa26a4', 'D.', 'Dilip Kumar', 'D. Dilip Kumar', 'dilip.dara9121@gmail.com', '+16305920586', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(506, '69f07d43415467e0a6aa2457', 'Harshvardhan', 'Patil', 'Harshvardhan Patil', 'harshvardhanpatil2555@gmail.com', '+918530986513', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(507, '69f07d2b415467e0a6aa1fca', 'AMARNATH', 'DIXIT', 'AMARNATH DIXIT', 'amarnathyou@gmail.com', '+918887903856', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(508, '69f07cf6415467e0a6aa1c38', 'Sudharsun', 'Unknown', 'Sudharsun Unknown', 'sudharsan7786@gmail.com', '+917339190889', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(509, '69f07ce4415467e0a6aa19d5', 'CHITRANSH', 'DWIVEDI', 'CHITRANSH DWIVEDI', 'chitransh09.29@gmail.com', '+917013864697', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(510, '69f07ca2415467e0a6aa12de', 'Sravani', 'Siragam', 'Sravani Siragam', 'sravanisiragam1705@gmail.com', '+919113552378', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(511, '69f07c8f415467e0a6aa109b', 'VENKAT', 'JOSHI YERRAGUNTLA', 'VENKAT JOSHI YERRAGUNTLA', 'venkatjoshi08@gmail.com', '+919502959205', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(512, '69f07c83415467e0a6aa0e4f', 'Pavithra', 'Shanmugavelu', 'Pavithra Shanmugavelu', 'pavishanmuga92@gmail.com', '+919345364447', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(513, '69f07c6a415467e0a6aa0c03', 'Pavani', 'Bandi', 'Pavani Bandi', 'pavanibandi2000@gmail.com', '+918106976029', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(514, '69f07c56415467e0a6aa09ae', 'Chandan', 'Kushwaha', 'Chandan Kushwaha', 'chandankushwahacsk@gmail.com', '+918112571260', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(515, '69f07c46415467e0a6aa0765', 'Aravindharajan', 'S S', 'Aravindharajan S S', 'saravanan.aravindh02@gmail.com', '+919894011418', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(516, '69f07c16415467e0a6aa02b6', 'Nikhil', 'Maroju', 'Nikhil Maroju', 'marojunikhil2002@gmail.com', '+918179049021', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(517, '69f07bff415467e0a6aa0068', 'S', 'DEVI', 'S DEVI', 'deviselva2204@gmail.com', '+919626734769', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(518, '69f06a9e415467e0a6a9fb76', 'Vaibhav', 'More', 'Vaibhav More', 'vaibhavmore262003@gmail.com', '+917823822679', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(519, '69f06a87415467e0a6a9f91a', 'SHASHIKANT', 'RAUT', 'SHASHIKANT RAUT', 'shashikantraut06130@gmail.com', '+918805456337', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(520, '69f06a72415467e0a6a9f6c4', 'Shilpa', 'Papagari', 'Shilpa Papagari', 'shilpapapagari0409@gmail.com', '+916303703573', 'active', '2026-07-07 05:03:17', '2026-07-07 05:03:17'),
(521, '69f06a61415467e0a6a9f471', 'ANJALI', 'Unknown', 'ANJALI Unknown', 'anj22ail@gmail.com', '+916203951702', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(522, '69f06a52415467e0a6a9f221', 'SHANTHI', 'CHINTHALA', 'SHANTHI CHINTHALA', 'chinthala944@gmail.com', '+919381897354', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(523, '69f06a1f415467e0a6a9ed58', 'PRAVEEN', 'KUMAR', 'PRAVEEN KUMAR', 'kumarv53528@gmail.com', '+917093561848', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(524, '69f06a06415467e0a6a9eb0f', 'SRINIVAS', 'KUMAR GORLE', 'SRINIVAS KUMAR GORLE', 'kumargorle95@gmail.com', '+917993547072', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(525, '69f069d9415467e0a6a9e668', 'CHAITHALI', 'BHANDARKAR', 'CHAITHALI BHANDARKAR', 'bchaithali@gmail.com', '+917411838425', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(526, '69f069c3415467e0a6a9e411', 'Rohan', 'Sonawane', 'Rohan Sonawane', 'rohansonawane7798@gmail.com', '+917798159817', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(527, '69f069ae415467e0a6a9e1c1', 'NEHA', 'V', 'NEHA V', 'nehaburug@gmail.com', '+919113634937', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(528, '69f069a1415467e0a6a9df6c', 'Abhishek', 'Kumbhar', 'Abhishek Kumbhar', 'abhishekumbhar7@gmail.com', '+919156192359', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(529, '69f0698c415467e0a6a9dd28', 'Rizwana', 'Unknown', 'Rizwana Unknown', 'rizwanav2001@gmail.com', '+919703908374', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(530, '69f0694e415467e0a6a9d630', 'Umesh', 'Talekar', 'Umesh Talekar', 'umeshtalekar7777@gmail.com', '+919673787873', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(531, '69f06937415467e0a6a9d3d8', 'Nikhil', 'Jadhav', 'Nikhil Jadhav', 'nikhiljadhav00077@gmail.com', '+919657639884', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(532, '69f06921415467e0a6a9d187', 'Shukil', 'R', 'Shukil R', 'shukil0098@gmail.com', '+919035191099', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(533, '69f06916415467e0a6a9cf32', 'Lokesh', 'Unknown', 'Lokesh Unknown', 'lokeshdev323@gmail.com', '+919110423668', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(534, '69f06909415467e0a6a9ccef', 'Nishanth', 'Moorthy', 'Nishanth Moorthy', 'nishanthmoorthy99@gmail.com', '+917094222246', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(535, '69f068f3415467e0a6a9ca79', 'Shivam', 'Gupta', 'Shivam Gupta', 'sks.shivam339@zohomail.in', '+919140889870', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(536, '69f068d8415467e0a6a9c823', 'Savita', 'Khandaskar', 'Savita Khandaskar', 'khandaskarsavita48@gmail.com', '+917262042076', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(537, '69f068c6415467e0a6a9c5e1', 'ANUSHA', 'JAMMULA', 'ANUSHA JAMMULA', 'anushajammula02@gmail.com', '+917995297700', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(538, '69f0689e415467e0a6a9c389', 'Vijay', 'Chaudhary', 'Vijay Chaudhary', 'chaudharyvijay861@gmail.com', '+919415163483', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(539, '69f06887415467e0a6a9c129', 'Benazeer', 'Banu', 'Benazeer Banu', 'benazeer0808@gmail.com', '+918428797834', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(540, '69f06878415467e0a6a9bed9', 'Akash', 'Verma', 'Akash Verma', 'akash.verma698@gmail.com', '+919109809800', 'active', '2026-07-07 05:03:18', '2026-07-07 05:03:18'),
(541, '69f06863415467e0a6a9bc8c', 'Buluranjan', 'Bhatta', 'Buluranjan Bhatta', 'buluranjan97@gmail.com', '+918904843804', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(542, '69f06850415467e0a6a9ba3d', 'HARSHIT', 'GOYAL', 'HARSHIT GOYAL', 'scshgoyal@gmail.com', '+917508082622', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(543, '69f0683f415467e0a6a9b7e3', 'Priyanshu', 'Lakra', 'Priyanshu Lakra', 'priyanshulakra9988@gmail.com', '+919268369733', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(544, '69f06822415467e0a6a9b56c', 'Madhavi', 'Jarugu', 'Madhavi Jarugu', 'madhavilathaj7@gmail.com', '+919390699282', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(545, '69f06814415467e0a6a9ae76', 'Candidate', 'Unknown', 'Candidate Unknown', 'nileshgk13199895@gmail.com', '+918152085774', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(546, '69f06808415467e0a6a9ac1b', 'AKASH', 'GUPTA', 'AKASH GUPTA', 'akashg14998@gmail.com', '+917376278185', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(547, '69f067e5415467e0a6a9a87e', 'ARYAMOL', 'REJI', 'ARYAMOL REJI', 'aryamolreji29@gmail.com', '+918156896331', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(548, '69f067cd415467e0a6a9a62a', 'Rahulbalaji', 'Unknown', 'Rahulbalaji Unknown', 'rahulbalajigb@gmail.com', '+919790457667', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(549, '69f067b9415467e0a6a9a3de', 'SAHAN', 'KAMANI', 'SAHAN KAMANI', 'sahankumar222@gmail.com', '+919347873736', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(550, '69f0679b415467e0a6a9a181', 'Sumit', 'Mane', 'Sumit Mane', 'sumitawsdevops@gmail.com', '+919326388564', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(551, '69f0678d415467e0a6a99f26', 'ANIKET', 'KHONDEKAR', 'ANIKET KHONDEKAR', 'aniketkhondekar26@gmail.com', '+917709712656', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(552, '69f06781415467e0a6a99ce3', 'AYUSH', 'SUROTHIYA', 'AYUSH SUROTHIYA', 'surothiya@gmail.com', '+919462316794', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(553, '69f06764415467e0a6a99850', 'Akash', 'Srivastava', 'Akash Srivastava', 'akash6833sky@gmail.com', '+917078437740', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(554, '69f0674b415467e0a6a99600', 'RAKESH', 'KUMAR NAYAK', 'RAKESH KUMAR NAYAK', 'smrakeshkumarnayak99@gmail.com', '+918088029016', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(555, '69f06737415467e0a6a993b9', 'Karthik', 'Surya J', 'Karthik Surya J', 'karthiksuryaarasan10@gmail.com', '+918660620403', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(556, '69f066f8415467e0a6a98efc', 'Spandana', 'Rapaka', 'Spandana Rapaka', 'spandanarapaka2@gmail.com', '+918247205804', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(557, '69f066df415467e0a6a98cad', 'Vishnupriya', 'Gajula', 'Vishnupriya Gajula', 'vishnupriyagajula@gmail.com', '+18639113668', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(558, '69f066d2415467e0a6a98a60', 'Nilabh', 'Waingankar', 'Nilabh Waingankar', 'nilabhwaingankar59@gmail.com', '+918668523339', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(559, '69f066c4415467e0a6a9881e', 'Akansha', 'Tripathi', 'Akansha Tripathi', 'takansha0505@gmail.com', '+916290839047', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(560, '69f066a7415467e0a6a985a9', 'M', 'VARUN', 'M VARUN', 'm.j.varun14@gmail.com', '+918825319959', 'active', '2026-07-07 05:03:19', '2026-07-07 05:03:19'),
(561, '69f065bf415467e0a6a982c2', 'RAHULSINGAM', 'Unknown', 'RAHULSINGAM Unknown', 'rahulsingam1789@gmail.com', '+919133111789', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(562, '69f065ac415467e0a6a98065', 'ANISHA', 'KALE', 'ANISHA KALE', 'anishakale01w@gmail.com', '+916266321810', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(563, '69f06596415467e0a6a97e16', 'Nagapranav', 'Pallapu', 'Nagapranav Pallapu', 'nagapranavpallapu19@gmail.com', '+916305477362', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(564, '69f06578415467e0a6a97966', 'Anbu', 'Selvan R', 'Anbu Selvan R', 'anbuias328@gmail.com', '+919080583376', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(565, '69f06565415467e0a6a9771d', 'K', 'PRAVEEN KUMAR', 'K PRAVEEN KUMAR', 'pk634219@gmail.com', '+917995655826', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(566, '69f06554415467e0a6a974ce', 'Nimish', 'Pandey', 'Nimish Pandey', 'pandeynimish2001@gmail.com', '+918850128485', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(567, '69f06539415467e0a6a97282', 'S.', 'Sneha', 'S. Sneha', 'snehamca123@gmail.com', '+917795053503', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(568, '69f06514415467e0a6a97021', 'Dipak', 'Waghmare', 'Dipak Waghmare', 'deepakkw3@gmail.com', '+918390797870', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(569, '69f064f7415467e0a6a96dd4', 'Yashraj', 'Shitre', 'Yashraj Shitre', 'yashrajshitre2310@gmail.com', '+917020579352', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(570, '69f064e4415467e0a6a96b86', 'Yogita', 'Wagh', 'Yogita Wagh', 'yogitawagh950@gmail.com', '+917620816225', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(571, '69f064cd415467e0a6a96939', 'SWATHI', 'SOORA', 'SWATHI SOORA', 'sooraswathi@gmail.com', '+917702384805', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(572, '69f064bd415467e0a6a966e1', 'DIVYA', 'R', 'DIVYA R', 'divyararam2901@gmail.com', '+916369000897', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(573, '69f0649d415467e0a6a96247', 'Vasantha', 'Kumar K S', 'Vasantha Kumar K S', 'vasanth.vasanth.163@gmail.com', '+918072147576', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(574, '69f0648f415467e0a6a95ffc', 'REVANTH', 'PERUMANDLA', 'REVANTH PERUMANDLA', 'revanthperumandla001@gmail.com', '+919182739544', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(575, '69f0647d415467e0a6a95daa', 'Priyanka', 'Kumari', 'Priyanka Kumari', 'priyankasharma930511@gmail.com', '+919631227187', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20');
INSERT INTO `students` (`id`, `external_id`, `first_name`, `last_name`, `full_name`, `email`, `phone_number`, `status`, `created_at`, `updated_at`) VALUES
(576, '69f0646a415467e0a6a95b62', 'Siddhgopal', 'Unknown', 'Siddhgopal Unknown', 'siddhgopalsoni@gmail.com', '+918871972936', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(577, '69f06458415467e0a6a9590d', 'SANTHOSH', 'KUMAR L', 'SANTHOSH KUMAR L', 'santhoshkumartech27@gmail.com', '+919790802054', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(578, '69f0644b415467e0a6a956a3', 'DONTHIREDDY', 'BHAVITHA', 'DONTHIREDDY BHAVITHA', 'dbhavitha15@gmail.com', '+918688445581', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(579, '69f0642e415467e0a6a95205', 'Lakshmipriya', 'Turaka', 'Lakshmipriya Turaka', 'lakshmipriyaturaka7@gmail.com', '+919741495672', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(580, '69f0641c415467e0a6a94fc1', 'Yerradoddi', 'Jeevan Sai Teja Reddy', 'Yerradoddi Jeevan Sai Teja Reddy', 'jeevansai944@gmail.com', '+919515915190', 'active', '2026-07-07 05:03:20', '2026-07-07 05:03:20'),
(581, '69f06407415467e0a6a94d74', 'SHIVPRASAD', 'KADAM', 'SHIVPRASAD KADAM', 'homishivba@gmail.com', '+918668339397', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(582, '69f063f1415467e0a6a94b29', 'Sharanaya', 'Gupta', 'Sharanaya Gupta', 'sharanayagupta94@gmail.com', '+917455017421', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(583, '69f063dc415467e0a6a948dc', 'Baldeep', 'Khurana', 'Baldeep Khurana', 'baldeepsingh0100@gmail.com', '+919536038777', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(584, '69f063c6415467e0a6a94683', 'Balkrushna', 'Ingale', 'Balkrushna Ingale', 'balkrushna6321@gmail.com', '+917709460923', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(585, '69f063b2415467e0a6a94429', 'Daniel', 'Bernard', 'Daniel Bernard', 'info.danielbernard@gmail.com', '+919845253501', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(586, '69f063a6415467e0a6a941bd', 'NEHA', 'KUMARI', 'NEHA KUMARI', 'nehakumariyadav13081997@gmail.com', '+918114482899', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(587, '69f0638d415467e0a6a93d35', 'LIYANDOR', 'MOONSON', 'LIYANDOR MOONSON', 'liyanderlio@gmail.com', '+919597026274', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(588, '69f06365415467e0a6a93897', 'Dipak', 'Choudhary', 'Dipak Choudhary', 'dipakchoudhary144@gmail.com', '+919340697824', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(589, '69f06350415467e0a6a93638', 'Nikhil', 'Carpenter', 'Nikhil Carpenter', 'nikhilcarpenter2104@gmail.com', '+919630666851', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(590, '69f06340415467e0a6a933f3', 'Pratik', 'Kapare', 'Pratik Kapare', 'pratikrk6004@gmail.com', '+919607076004', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(591, '69f06335415467e0a6a931a2', 'DEEPAK', 'CHARAN KOMMIREDDY', 'DEEPAK CHARAN KOMMIREDDY', 'charankommireddy7@gmail.com', '+919441984169', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(592, '69f06323415467e0a6a92f48', 'Yatharth', 'Sharma', 'Yatharth Sharma', 'sharmayatharth85@gmail.com', '+918319169978', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(593, '69f06311415467e0a6a92cf1', 'Mahendra', 'Reddy Julumudi', 'Mahendra Reddy Julumudi', 'julumudi.m@gmail.com', '+919493150504', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(594, '69f06303415467e0a6a92aa9', 'Faizan', 'Khan', 'Faizan Khan', 'faizaanmkkhan@gmail.com', '+919827097683', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(595, '69f062d9415467e0a6a925fe', 'sumanth', 'kondakavuru', 'sumanth kondakavuru', 'sumanthkondakavuru00@gmail.com', '+919652857420', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(596, '69f062c1415467e0a6a923ad', 'Aishwarya', 'Kankanwadi', 'Aishwarya Kankanwadi', 'aishwaryakkw@gmail.com', '+919483275383', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(597, '69f062b3415467e0a6a9215f', 'Vikash', 'Shaw', 'Vikash Shaw', 'shaw.vikash2608@gmail.com', '+917980286364', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(598, '69f0629c415467e0a6a91ee6', 'Pavan', 'Kumar', 'Pavan Kumar', 'pavanvadapalli28@gmail.com', '+916304363557', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(599, '69f0628a415467e0a6a917e7', 'Candidate', 'Unknown', 'Candidate Unknown', 'kabilkabil667@gmail.com', '+917502087632', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(600, '69f06277415467e0a6a9158f', 'SATHIYANATH', 'M P', 'SATHIYANATH M P', 'sathiyanathmp@gmail.com', '+916382467648', 'active', '2026-07-07 05:03:21', '2026-07-07 05:03:21'),
(601, '69f06268415467e0a6a91336', 'NANCY', 'SEVANNA D', 'NANCY SEVANNA D', 'nancydsevanna12@gmail.com', '+918838619402', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(602, '69f06253415467e0a6a910d2', 'VELISHALA', 'RAMABRAHMACHARI', 'VELISHALA RAMABRAHMACHARI', 'velishalaramm@gmail.com', '+918919634439', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(603, '69f0623a415467e0a6a90e6a', 'Jagadeswar', 'Reddy Puthi', 'Jagadeswar Reddy Puthi', 'jagadeswarputhi@gmail.com', '+918523011401', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(604, '69f0622c415467e0a6a90c0f', 'Prashant', 'Kashyap', 'Prashant Kashyap', 'prashantpk.kashyap.1999@gmail.com', '+919560621855', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(605, '69f05fec415467e0a6a908ca', 'Bhavesh', 'Jaiswal', 'Bhavesh Jaiswal', 'bhaveshsandip@gmail.com', '+919503017674', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(606, '69f05fde415467e0a6a9067a', 'Ayushi', 'Prasad', 'Ayushi Prasad', 'ayushiprasad8@gmail.com', '+919661527759', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(607, '69f05fd1415467e0a6a90437', 'Himkanya', 'Arsode', 'Himkanya Arsode', 'himkanya.arsode@gmail.com', '+918999855800', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(608, '69f05fbb415467e0a6a901de', 'Arjun', 'Karekar', 'Arjun Karekar', 'arjunkarekar1002@gmail.com', '+916366005540', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(609, '69f05fac415467e0a6a8ff91', 'Vicky', 'Pandhare', 'Vicky Pandhare', 'vickypandhare2508@gmail.com', '+919175358636', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(610, '69f05fa3415467e0a6a8fd42', 'Vaibhav', 'Singh', 'Vaibhav Singh', 'iamvaibhavsingh09@gmail.com', '+918266832080', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(611, '69f05f7e415467e0a6a8f889', 'Simran', 'Rajput', 'Simran Rajput', 'rajput97sim@gmail.com', '+919119911132', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(612, '69f05f71415467e0a6a8f633', 'Srikant', 'Rajan', 'Srikant Rajan', 'srikanth34164@gmail.com', '+919047030619', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(613, '69f05f62415467e0a6a8f3ed', 'K', 'AJAY', 'K AJAY', 'ajaykotakonda222@gmail.com', '+916302296087', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(614, '69f05f57415467e0a6a8f19f', 'Pavan', 'Rathod', 'Pavan Rathod', 'rathodpavan108@gmail.com', '+917058533161', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(615, '69f05f3f415467e0a6a8ef3e', 'Charanya', 'N', 'Charanya N', 'charanyas14@gmail.com', '+917892782754', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(616, '69f05f34415467e0a6a8ecfc', 'Arun', 'Sharma', 'Arun Sharma', 'sharma.arun2732002@gmail.com', '+918273625703', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(617, '69f05f28415467e0a6a8eab6', 'Kuchi', 'Saikumar', 'Kuchi Saikumar', 'saikumar2562@gmail.com', '+919182273126', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(618, '69f05f1a415467e0a6a8e863', 'OM', 'PRAKASH BHARTI', 'OM PRAKASH BHARTI', 'ombharti268@gmail.com', '+918051785814', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(619, '69f05eec415467e0a6a8e173', 'Yash', 'Tarale', 'Yash Tarale', 'yashtaralep@gmail.com', '+917498122393', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(620, '69f05edb415467e0a6a8df1d', 'Nelluri', 'Mahesh Babu', 'Nelluri Mahesh Babu', 'maheshnelluri650@gmail.com', '+918008568663', 'active', '2026-07-07 05:03:22', '2026-07-07 05:03:22'),
(621, '69f05ecd415467e0a6a8dcd8', 'ANUBHAV', 'SHARMA', 'ANUBHAV SHARMA', 'anubhavsharma.ps18@gmail.com', '+919368513701', 'active', '2026-07-07 05:03:23', '2026-07-07 05:03:23'),
(622, '69f05ebd415467e0a6a8da74', 'Shoaib', 'Sheikh', 'Shoaib Sheikh', 'shoaib.sheikh0724@gmail.com', '+918400350486', 'active', '2026-07-07 05:03:23', '2026-07-07 05:03:23'),
(623, '69f05eab415467e0a6a8d81c', 'Sumanth', 'Ponnapoola', 'Sumanth Ponnapoola', 's.ponnapoola@gmail.com', '+917989964621', 'active', '2026-07-07 05:03:23', '2026-07-07 05:03:23'),
(624, '69f05e9c415467e0a6a8d5d9', 'Abhishek', 'Khadse', 'Abhishek Khadse', 'abhishekkhadsee@gmail.com', '+919588651053', 'active', '2026-07-07 05:03:23', '2026-07-07 05:03:23'),
(625, '69f05e8d415467e0a6a8d38b', 'RAKESH', 'NAYAK', 'RAKESH NAYAK', 'nayakrakeshkumar9777@gmail.com', '+916370154210', 'active', '2026-07-07 05:03:23', '2026-07-07 05:03:23'),
(626, '69f05e79415467e0a6a8d13e', 'Akhilesh', 'Lad', 'Akhilesh Lad', 'akhileshlad98@gmail.com', '+919270285474', 'active', '2026-07-07 05:03:23', '2026-07-07 05:03:23'),
(627, '69f05e66415467e0a6a8cedd', 'Harshit', 'Khare', 'Harshit Khare', 'harshit.khare1@gmail.com', '+916393223360', 'active', '2026-07-07 05:03:23', '2026-07-07 05:03:23'),
(628, '69f05e50415467e0a6a8cc92', 'Hania', 'Mirza', 'Hania Mirza', 'haniamirza0411@gmail.com', '+919685408960', 'active', '2026-07-07 05:03:23', '2026-07-07 05:03:23'),
(629, '69f05e1e415467e0a6a8c7e9', 'Lipsa', 'Bal', 'Lipsa Bal', 'lipsabal.info@gmail.com', '+918917460881', 'active', '2026-07-07 05:03:23', '2026-07-07 05:03:23'),
(630, '69f05e09415467e0a6a8c59a', 'Chethan', 'L', 'Chethan L', 'chethanmarkz202@gmail.com', '+919108219324', 'active', '2026-07-07 05:03:23', '2026-07-07 05:03:23'),
(631, '69f05dee415467e0a6a8c34b', 'YOGENDRA', 'PRATAP MISHRA', 'YOGENDRA PRATAP MISHRA', 'mishrayogendra2001@gmail.com', '+919296304170', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(632, '69f05dd5415467e0a6a8c0ff', 'Nalluri', 'Venkata Vamsi Krishna', 'Nalluri Venkata Vamsi Krishna', 'vamsi19.nalluri@gmail.com', '+917997944061', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(633, '69f05dbf415467e0a6a8bea8', 'Deepak', 'Lodhi', 'Deepak Lodhi', 'dlodhi123456@gmail.com', '+919566074726', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(634, '69f05d86415467e0a6a8ba0e', 'Thirumalai', 'Srinivas', 'Thirumalai Srinivas', 'thirumalaisrinivas104@gmail.com', '+916383334230', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(635, '69f05d6c415467e0a6a8b7bf', 'Vikas', 'Keshari', 'Vikas Keshari', 'vikas.keshari02@gmail.com', '+918806315164', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(636, '69f05d4d415467e0a6a8b322', 'P', 'Babajan', 'P Babajan', 'shaikbabajan04041998@gmail.com', '+917204204742', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(637, '69f05d38415467e0a6a8b0a7', 'Tejas', 'Khairnar', 'Tejas Khairnar', 'tejasvkhairnar@gmail.com', '+917776003315', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(638, '69f05d1a415467e0a6a8abf7', 'Surarapu', 'Naga Durga Srinu', 'Surarapu Naga Durga Srinu', 'surarapusrinu6133@gmail.com', '+919701884377', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(639, '69f05cfd415467e0a6a8a98e', 'Harsh', 'Agarwal', 'Harsh Agarwal', 'kartikkg44200@gmail.com', '+917817868883', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(640, '69f05cdd415467e0a6a8a71d', 'Akshada', 'Shinde', 'Akshada Shinde', 'akshada.shinde2016@gmail.com', '+919561163369', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(641, '69f05cbf415467e0a6a8a4bc', 'Shivam', 'Ishan', 'Shivam Ishan', 'ishivam2401@gmail.com', '+918770386229', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(642, '69f05ca8415467e0a6a8a26b', 'Dhanushiya', 'G', 'Dhanushiya G', 'dhanushiya510@gmail.com', '+916382972411', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(643, '69f05c62415467e0a6a89b74', 'Abhishek', 'Mishra', 'Abhishek Mishra', 'abhishek.116m@gmail.com', '+918318379964', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(644, '69f05a0e415467e0a6a8975c', 'ANSAR', 'BASHA SHAIK', 'ANSAR BASHA SHAIK', 'ansarbasha.shaik1897@gmail.com', '+917337461811', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(645, '69f059fa415467e0a6a89511', 'Astha', 'Jain', 'Astha Jain', 'asthaj256@gmail.com', '+918839077489', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(646, '69f059e6415467e0a6a892c3', 'NAZAKAT', 'ALI SOFI', 'NAZAKAT ALI SOFI', 'aleesoffy786@gmail.com', '+9666005456285', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(647, '69f059ad415467e0a6a88bc9', 'Ramalingeswar', 'Ch', 'Ramalingeswar Ch', 'ramch2820@gmail.com', '+917989846100', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(648, '69f0599a415467e0a6a8897a', 'Ansh', 'Tyagi', 'Ansh Tyagi', 'anshtyagi1818@gmail.com', '+919667765242', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(649, '69f05985415467e0a6a88717', 'Nitish', 'Maheshwari', 'Nitish Maheshwari', 'nitishmaheshwari224@gmail.com', '+917351716427', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(650, '69f05971415467e0a6a884d0', 'Rashi', 'Rani', 'Rashi Rani', 'rashiiir23@gmail.com', '+919523120310', 'active', '2026-07-07 05:03:24', '2026-07-07 05:03:24'),
(651, '69f05960415467e0a6a88276', 'Swapneswar', 'Das', 'Swapneswar Das', 'swapneswardascsk07@gmail.com', '+916370698903', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(652, '69f058d6415467e0a6a87445', 'Rajinikanth', 'Nukala', 'Rajinikanth Nukala', 'rajnikanth.nukala12@gmail.com', '+919676226240', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(653, '69f058c1415467e0a6a871f6', 'Surender', 'Yadav', 'Surender Yadav', 'surendery623@gmail.com', '+917011752356', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(654, '69f058a4415467e0a6a86fa7', 'AKASH', 'KHARE', 'AKASH KHARE', 'akashkhare135@gmail.com', '+916397355155', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(655, '69f05889415467e0a6a86d41', 'SHUBHAM', 'SHINGTE', 'SHUBHAM SHINGTE', 'shubhamshingtesm@gmail.com', '+917039021191', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(656, '69f0586b415467e0a6a86aff', 'Sukitha', 'A', 'Sukitha A', 'sukithaamar12@gmail.com', '+917892481871', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(657, '69f0580b415467e0a6a85f61', 'MANSHI', 'SINGH', 'MANSHI SINGH', 'singhmansi3909@gmail.com', '+917470651820', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(658, '69f057f5415467e0a6a85882', 'Candidate', 'Unknown', 'Candidate Unknown', 'lokesh.c1622@gmail.com', '+918073115812', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(659, '69f057cc415467e0a6a853dd', 'Isha', 'Patil', 'Isha Patil', 'patilisha119@gmail.com', '+919284819924', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(660, '69f0578b415467e0a6a84f2d', 'Sanketh', 'Kumar Kondu', 'Sanketh Kumar Kondu', 'sankethkondu@gmail.com', '+919908768023', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(661, '69f0577c415467e0a6a84ce7', 'SANTHOSH', 'BOWROTHU', 'SANTHOSH BOWROTHU', 'santoshkumar311999@gmail.com', '+918919890826', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(662, '69f05752415467e0a6a8484a', 'Aadarsh', 'Ankit', 'Aadarsh Ankit', 'aadarshankit8696@gmail.com', '+918696877749', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(663, '69f0572b415467e0a6a844b8', 'Sanskar', 'Sinha', 'Sanskar Sinha', 'sinhasanskarr05@gmail.com', '+917007050874', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(664, '69f05716415467e0a6a8426a', 'Sai', 'Kumar Singari', 'Sai Kumar Singari', 'srv.nagasaikumar@gmail.com', '+919676145002', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(665, '69f056f6415467e0a6a84013', 'Aditi', 'Unknown', 'Aditi Unknown', 'aditi8701@gmail.com', '+919373371886', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(666, '69f056ce415467e0a6a83c5c', 'Sachin', 'Soam', 'Sachin Soam', 'sachinsoam8869@gmail.com', '+918869836996', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(667, '69f056b9415467e0a6a839ec', 'Rushikesh', 'Deore', 'Rushikesh Deore', 'deorerushi7852@gmail.com', '+917350807185', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(668, '69f056aa415467e0a6a83799', 'Bhushan', 'Surve', 'Bhushan Surve', 'survebhushan012@gmail.com', '+919359454357', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(669, '69f05679415467e0a6a830b8', 'Syed', 'Umar', 'Syed Umar', 'syedumar24@gmail.com', '+918270218276', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(670, '69f05657415467e0a6a82c16', 'Gayathri', 'D', 'Gayathri D', 'gayathrid1303@gmail.com', '+918056656170', 'active', '2026-07-07 05:03:25', '2026-07-07 05:03:25'),
(671, '69f05632415467e0a6a82821', 'SRUTHI', 'NARENDAR', 'SRUTHI NARENDAR', 'sruthinarendar12@gmail.com', '+918610790969', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(672, '69f0560a415467e0a6a82373', 'Aahsvin', 'Joe', 'Aahsvin Joe', 'aahsvinjoe98@gmail.com', '+916385716908', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(673, '69f0532b415467e0a6a8203d', 'Ajay', 'Chitte', 'Ajay Chitte', 'chitteajay024@gmail.com', '+917219302098', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(674, '69f0531c415467e0a6a81df6', 'Sanket', 'Pawar', 'Sanket Pawar', 'pawarsanket1999@gmail.com', '+917021386845', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(675, '69f052fa415467e0a6a81ba4', 'TANISHA', 'SINGH', 'TANISHA SINGH', 'tanisha29oct@gmail.com', '+919406543474', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(676, '69f052ea415467e0a6a81952', 'Mukund', 'Kale', 'Mukund Kale', 'mukund1997kale@gmail.com', '+919561687215', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(677, '69f052b1415467e0a6a816eb', 'Preethi', 'Rajagopalan', 'Preethi Rajagopalan', 'preethi11w@gmail.com', '+917760069393', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(678, '69f05297415467e0a6a8149b', 'Prerana', 'Subhanji', 'Prerana Subhanji', 'preranasubhanji@gmail.com', '+919535951659', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(679, '69f05277415467e0a6a81241', 'KINGSLY', 'M', 'KINGSLY M', 'kingslydevops@gmail.com', '+919500444953', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(680, '69f0525a415467e0a6a80fea', 'Prabavathi', 'S', 'Prabavathi S', 'prabavathis0402@gmail.com', '+919363387938', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(681, '69f05247415467e0a6a80da4', 'M', 'Ramana Murthy', 'M Ramana Murthy', 'ramanamurthy4488@gmail.com', '+917997479787', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(682, '69f0522c415467e0a6a80b4e', 'ADNAN', 'SHEIKH', 'ADNAN SHEIKH', 'adnansheikh79230@gmail.com', '+919307404784', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(683, '69f05202415467e0a6a808ee', 'RAHUL', 'RAUT', 'RAHUL RAUT', 'rahulraut250712@gmail.com', '+919860183289', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(684, '69f051f4415467e0a6a806a2', 'Ajinkya', 'Mente', 'Ajinkya Mente', 'ajinkyamente06@gmail.com', '+919270416096', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(685, '69f051e1415467e0a6a80456', 'Sai', 'Vamshi Allanki', 'Sai Vamshi Allanki', 'saivamshi0910@gmail.com', '+919014184720', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(686, '69f051cd415467e0a6a80208', 'Hemalatha', 'Unknown', 'Hemalatha Unknown', 'kundahemalatha9@gmail.com', NULL, 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(687, '69f051c1415467e0a6a7ffbd', 'Shailendra', 'Unknown', 'Shailendra Unknown', 'shailendras.work@gmail.com', '+918756498287', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(688, '69f051a8415467e0a6a7fd70', 'Mohammed', 'Khatib', 'Mohammed Khatib', 'engadnaan96@gmail.com', '+917349569696', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(689, '69f0519a415467e0a6a7fb22', 'Priyansh', 'Goyal', 'Priyansh Goyal', 'goyalpriyansh50@gmail.com', '+916375854221', 'active', '2026-07-07 05:03:26', '2026-07-07 05:03:26'),
(691, '69f05173415467e0a6a7f66f', 'Manish', 'Singh', 'Manish Singh', 'kumarmanish7375@gmail.com', '+919307547376', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(692, '69f05157415467e0a6a7f42a', 'SEJAL', 'GAIKWAD', 'SEJAL GAIKWAD', 'sejalg279@gmail.com', '+917588227472', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(693, '69f05146415467e0a6a7f1d7', 'VARUN', 'SHARMA', 'VARUN SHARMA', 'varun.sharma9866@gmail.com', '+917667860082', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(694, '69f0512a415467e0a6a7e7c3', 'Shubham', 'Gujarati', 'Shubham Gujarati', 'shubham.mgujarati@gmail.com', '+919307285603', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(695, '69f05105415467e0a6a7d458', 'Sujit', 'Mendhe', 'Sujit Mendhe', 'sujit.mendhe@gmail.com', '+917385006915', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(696, '69f050ef415467e0a6a7c8f3', 'Rachita', 'Taneja', 'Rachita Taneja', 'patirachitataneja@gmail.com', '+917204269442', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(697, '69f050d9415467e0a6a7be0f', 'VIGNESHWAR', 'Unknown', 'VIGNESHWAR Unknown', 'vignzhv9@gmail.com', '+918148091388', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(698, '69f050cb415467e0a6a7b662', 'Samridh', 'Kumar', 'Samridh Kumar', 'samridhk07@gmail.com', '+916239060169', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(699, '69f05074415467e0a6a78d1f', 'Mohd', 'Noor Aman', 'Mohd Noor Aman', 'nooraman5718@gmail.com', '+919205475718', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(700, '69f0504e415467e0a6a7701b', 'RAJESHWAR', 'Unknown', 'RAJESHWAR Unknown', 'rajeshwarn309@gmail.com', '+917299246716', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(701, '69f05035415467e0a6a7602e', 'Sai', 'Babu M', 'Sai Babu M', 'saibabu.m215@gmail.com', '+918519882480', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(702, '69f05006415467e0a6a74962', 'Rakesh', 'Sangeetham', 'Rakesh Sangeetham', 'rakeshsangeetham@email.com', '+919705711215', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(703, '69f04ff0415467e0a6a73ed6', 'Rakesh', 'Kandunoori', 'Rakesh Kandunoori', 'rakeshkandunoori4421@gmail.com', '+917993841180', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(704, '69f04fdc415467e0a6a73517', 'Prashant', 'Roundal', 'Prashant Roundal', 'prashantroundal007@gmail.com', '+919702771011', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(705, '69f04fcc415467e0a6a72cd6', 'Vandana', 'Rai', 'Vandana Rai', 'raivandana9999@gmail.com', '+918382816330', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(706, '69f04fb9415467e0a6a71efb', 'Candidate', 'Unknown', 'Candidate Unknown', 'vinayakmh108@gmail.com', '+918050520132', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(707, '69f04f86415467e0a6a70483', 'Karthick', 'Kumaravelu', 'Karthick Kumaravelu', 'k.karthick2104@gmail.com', '+919095722271', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(708, '69f04f71415467e0a6a6fa1b', 'Amartya', 'Khan', 'Amartya Khan', 'amartyakhan1110@gmail.com', '+918250163105', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(709, '69f04f5e415467e0a6a6f0c7', 'Pradnyesh', 'Banait', 'Pradnyesh Banait', 'itspradnyesh@gmail.com', '+918408046722', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(710, '69f04f4b415467e0a6a6e76e', 'Santhilakshmi', 'Bojja', 'Santhilakshmi Bojja', 'shanbojja@gmail.com', '+917731042590', 'active', '2026-07-07 05:03:27', '2026-07-07 05:03:27'),
(711, '69f04f33415467e0a6a6dc02', 'Jameela', 'Mohammad', 'Jameela Mohammad', 'mohammadjameelafarhad1671@gmail.com', '+916303014078', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(712, '69f04f17415467e0a6a6cf13', 'SURESH', 'SEKAR', 'SURESH SEKAR', 'sureshbanu28@gmail.com', '+918098393890', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(713, '69f04ed6415467e0a6a6af33', 'MADINENI', 'VENKATA SASIBALA', 'MADINENI VENKATA SASIBALA', 'madinenisasibala04@gmail.com', '+919346410494', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(714, '69f04ec3415467e0a6a6a5df', 'ACHAL', 'PDMGIRWAR', 'ACHAL PDMGIRWAR', 'achalpadamgirwar21@gmail.com', '+917775070163', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(715, '69efd4d5415467e0a6a5c03d', 'RENAN', 'REJAS', 'RENAN REJAS', 'nanersajer4@gmail.com', NULL, 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(716, '69edf436415467e0a6a37bc7', 'Rohit', 'Patil', 'Rohit Patil', 'patilrohit41293@gmail.com', NULL, 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(717, '69ece0e6415467e0a6a19e3b', 'ARUN', 'S', 'ARUN S', 'arun.sbecse@gmail.com', '6360588469', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(718, '69eccfef415467e0a6a19a7c', 'Yash', 'Patil', 'Yash Patil', 'yashpatil1711@gmail.com', '+919552184742', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(719, '69eccfdb415467e0a6a19817', 'VEERLA', 'SAILAJA', 'VEERLA SAILAJA', 'veerlasailajayadav@gmail.com', '+919030942770', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(720, '69eccfab415467e0a6a195ad', 'UTTAM', 'KUMAR RAJWAR', 'UTTAM KUMAR RAJWAR', 'uttamkumarrajwar13@gmail.com', '+918271900336', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(721, '69eccf96415467e0a6a19356', 'SUMATHI', 'SHIVE GOWDA', 'SUMATHI SHIVE GOWDA', 'sumathisgowda2004@gmail.com', '+917975434857', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(722, '69eccf7e415467e0a6a190f3', 'Sumanth', 'A', 'Sumanth A', 'sumanthgowda254@gmail.com', '+916363702206', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(723, '69eccf6a415467e0a6a18e8e', 'Suma', 'Shavi', 'Suma Shavi', 'sumashavi09@gmail.com', '+916361535394', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(724, '69eccf58415467e0a6a18c41', 'SUBHRA', 'KANTA SAHOO', 'SUBHRA KANTA SAHOO', 'subhrakanta2025@gmail.com', '+917735438946', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(725, '69eccf42415467e0a6a189f2', 'Subhajit', 'Kar', 'Subhajit Kar', 'subhajeetkar449@gmail.com', '+918327719122', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(726, '69eccf1d415467e0a6a1877a', 'SRADHA', 'S', 'SRADHA S', 'sradha.sdas@gmail.com', '+918157816514', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(727, '69eccf07415467e0a6a18516', 'Soubhagya', 'Ghoshal', 'Soubhagya Ghoshal', 'soubhagyag73@gmail.com', '+916295932396', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(728, '69ecceee415467e0a6a182bc', 'SNEHA', 'JADHAV', 'SNEHA JADHAV', 'snehaj9045@gmail.com', '+918080157309', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(729, '69eccedf415467e0a6a18069', 'SHWETHA', 'PATIL', 'SHWETHA PATIL', 'shwethapatil257@gmail.com', '+918217740013', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(730, '69eccec4415467e0a6a17e19', 'SHREYA', 'GHUMTANE', 'SHREYA GHUMTANE', 'ghumtanes@gmail.com', '+918421491573', 'active', '2026-07-07 05:03:28', '2026-07-07 05:03:28'),
(731, '69ecceac415467e0a6a17bc2', 'Shashank', 'R', 'Shashank R', 'shashankr1904@gmail.com', '+917996633124', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(732, '69ecce90415467e0a6a17959', 'Sayad', 'Md Anisur Rahman', 'Sayad Md Anisur Rahman', 'alexanis120@gmail.com', '+916002566386', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(733, '69ecce79415467e0a6a176ef', 'SANJEV', 'KUMAR', 'SANJEV KUMAR', 'sanjevkumar961@gmail.com', '+917094744049', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(734, '69ecce63415467e0a6a174a0', 'Samatha', 'Reddy', 'Samatha Reddy', 'samathareddy2611@gmail.com', '+16281144096', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(735, '69ecce54415467e0a6a1724e', 'ADDANKI', 'SAI KEERTHI', 'ADDANKI SAI KEERTHI', 'saikeerthiaddanki99@gmail.com', '+919908048808', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(736, '69ecce3a415467e0a6a16fe7', 'Rohan', 'Agarwal', 'Rohan Agarwal', 'rohanagarwal24.02@gmail.com', '+919083130712', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(737, '69ecce21415467e0a6a16d25', 'RAKSHITHA', 'B K', 'RAKSHITHA B K', 'rakshitha.rakshii03@gmail.com', '+917204180106', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(738, '69ecce06415467e0a6a16ab9', 'RAHUL', 'ROKADE', 'RAHUL ROKADE', 'rvarokade@gmail.com', '+918080930876', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(739, '69eccdd8415467e0a6a165fc', 'Prashanth', 'Unknown', 'Prashanth Unknown', 'prashupk2002@gmail.com', '+917090635079', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(740, '69eccdc9415467e0a6a163a1', 'Prashant', 'Choudhary', 'Prashant Choudhary', 'prashant.p.c1404@gmail.com', '+918894381565', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(741, '69eccdb4415467e0a6a16148', 'Pavan', 'Joshi', 'Pavan Joshi', 'pavanjoshi2311@gmail.com', '+919845554827', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(742, '69eccda6415467e0a6a15ef8', 'NEHA', 'SHARMA', 'NEHA SHARMA', 'nehsharma28@gmail.com', '+919845471308', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(743, '69eccd84415467e0a6a15c6a', 'Nagma', 'Siddiqui', 'Nagma Siddiqui', 'nagmasaleem99@gmail.com', '+916395938011', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(744, '69eccd75415467e0a6a15a1d', 'SNEHANJALI', 'MUNIGANTI', 'SNEHANJALI MUNIGANTI', 'snehanjalimuniganti@gmail.com', '+918247408483', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(745, '69eccd4f415467e0a6a1555e', 'MANIKANDAN', 'A', 'MANIKANDAN A', 'angalan1207@gmail.com', '+917871332195', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(746, '69eccd3c415467e0a6a1530d', 'Mangal', 'Siddannavar', 'Mangal Siddannavar', 'mangalsiddannavar2@gmail.com', '+919380026304', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(747, '69eccd2d415467e0a6a150bc', 'Madhav', 'Bhanot', 'Madhav Bhanot', 'mdhvbhanot@gmail.com', '+918928434920', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(748, '69eccd17415467e0a6a14e5f', 'KULDEEP', 'RATHORE', 'KULDEEP RATHORE', 'rathore.kuldeep2018@gmail.com', '+91809943505', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(749, '69eccd08415467e0a6a14c24', 'Karthik', 'K M', 'Karthik K M', 'karthikkm1925@gmail.com', '+918310663174', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(750, '69ecccf7415467e0a6a149c7', 'Karan', 'Pandhare', 'Karan Pandhare', 'pandharekaran02@gmail.com', '+917821053575', 'active', '2026-07-07 05:03:29', '2026-07-07 05:03:29'),
(751, '69eccce3415467e0a6a1476d', 'Jeevan', 'TO', 'Jeevan TO', 'jeevanjaggu159@gmail.com', '+919353380159', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(752, '69ecccd1415467e0a6a1451f', 'Harshita', 'Mishra', 'Harshita Mishra', 'harshitamishra755@gmail.com', '+919078277882', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(753, '69ecccbc415467e0a6a142c7', 'Gunasekhar', 'C', 'Gunasekhar C', 'gunasekhar.c2002@gmail.com', '+918012517500', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(754, '69eccc9f415467e0a6a14050', 'G', 'Geetha Durga Bhavani', 'G Geetha Durga Bhavani', 'pgangabathula@gmail.com', '+919640729994', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(755, '69eccc8e415467e0a6a13e09', 'DIPANSHU', 'KESHARWANI', 'DIPANSHU KESHARWANI', 'dipanshu940749@gmail.com', '+917489035271', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(756, '69eccc83415467e0a6a13bc8', 'Asmita', 'Pandey', 'Asmita Pandey', 'asmitapandey580@gmail.com', '+919572141110', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(757, '69eccc6a415467e0a6a13972', 'ASHISH', 'SHARMA', 'ASHISH SHARMA', 'as4446013@gmail.com', '+917017511942', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(758, '69eccc59415467e0a6a1372b', 'Anjali', 'Singh', 'Anjali Singh', 'anjalisingh1727@gmail.com', '+919369571252', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(759, '69eccc50415467e0a6a134e8', 'ANANYA', 'MANDRE', 'ANANYA MANDRE', 'ananyamandre@gmail.com', '+919972350648', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(760, '69eccc37415467e0a6a13174', 'Aluri', 'HarithaArun', 'Aluri HarithaArun', 'harithaarunaluri@gmail.com', '+91891980467', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(761, '69eccc1e415467e0a6a12f1b', 'AKASH', 'KUMAR S', 'AKASH KUMAR S', 'akashsqa94@gmail.com', '+918095033834', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(762, '69eccbfd415467e0a6a12cc2', 'ADITYA', 'MISHRA', 'ADITYA MISHRA', 'adityamishra.7165@gmail.com', '+919892516168', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(763, '69ec5d85415467e0a6a09eaa', 'rado', 'duga', 'rado duga', 'radoslav.duga@gmail.com', NULL, 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(764, '69eb615c415467e0a69ebee0', 'Yogiraj', 'Khalate', 'Yogiraj Khalate', 'yogirajkhalate.nbnssoe.it@gmail.com', '+917620499643', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(765, '69eb614e415467e0a69ebc9d', 'P.', 'YAMINI DEVI', 'P. YAMINI DEVI', 'yaminidevi.poojari@gmail.com', '+919014077942', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(766, '69eb613f415467e0a69eb9eb', 'Theja', 'Unknown', 'Theja Unknown', 'gowdathejak@gmail.com', '+918553328123', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(767, '69eb612c415467e0a69eb7a2', 'Suraj', 'Yadav', 'Suraj Yadav', 'surajyadavs789@gmail.com', '+919511989682', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(768, '69eb611e415467e0a69eb555', 'Suleman', 'Navalur', 'Suleman Navalur', 'sulemannavalur@gmail.com', '+919632900201', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(769, '69eb610d415467e0a69eb305', 'SIDHARTH', 'SATRUSALYA', 'SIDHARTH SATRUSALYA', 'sidhsatru143@gmail.com', '+919912776687', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(770, '69eb6104415467e0a69eb0c4', 'ShriRaja', 'Rao', 'ShriRaja Rao', 'shrirajasrao@gmail.com', '+919880903205', 'active', '2026-07-07 05:03:30', '2026-07-07 05:03:30'),
(771, '69eb60f2415467e0a69eae84', 'Shreya', 'Sharma', 'Shreya Sharma', 'shreyasharma.1510001@gmail.com', '+918918606248', 'active', '2026-07-07 05:03:31', '2026-07-07 05:03:31'),
(772, '69eb60de415467e0a69eac2a', 'Savitha', 'Unknown', 'Savitha Unknown', 'savitha7722@gmail.com', '+918884944535', 'active', '2026-07-07 05:03:31', '2026-07-07 05:03:31'),
(773, '69eb60be415467e0a69ea9ec', 'Rumana', 'Nachiyar', 'Rumana Nachiyar', 'rumanamubarak25@gmail.com', '+918122442307', 'active', '2026-07-07 05:03:31', '2026-07-07 05:03:31'),
(774, '69eb60a8415467e0a69ea797', 'Rayan', 'Shazlee', 'Rayan Shazlee', 'rayanshazli@gmail.com', '+918969040731', 'active', '2026-07-07 05:03:31', '2026-07-07 05:03:31'),
(775, '69eb609a415467e0a69ea546', 'Rakshitha', 'Suguru', 'Rakshitha Suguru', 'rakshitasuguru@gmail.com', '+918073076185', 'active', '2026-07-07 05:03:31', '2026-07-07 05:03:31'),
(776, '69eb608e415467e0a69ea30b', 'Rajkishor', 'Behera', 'Rajkishor Behera', 'rajkishorb2002@gmail.com', '+917077141395', 'active', '2026-07-07 05:03:31', '2026-07-07 05:03:31'),
(777, '69eb6087415467e0a69ea0c5', 'Raghvendra', 'Verma', 'Raghvendra Verma', 'vraghvendrakumar@gmail.com', '+918827506244', 'active', '2026-07-07 05:03:31', '2026-07-07 05:03:31'),
(778, '69eb607a415467e0a69e9e7f', 'Rachagiri', 'Sireesha', 'Rachagiri Sireesha', 'sireesharachagiri55@gmail.com', '+917075307890', 'active', '2026-07-07 05:03:31', '2026-07-07 05:03:31'),
(779, '69eb606d415467e0a69e9c3d', 'PRATIKSHA', 'HARODE', 'PRATIKSHA HARODE', 'pratikshaharode0@gmail.com', '+916268164429', 'active', '2026-07-07 05:03:31', '2026-07-07 05:03:31'),
(780, '69eb6062415467e0a69e99f4', 'PRASANTA', 'KUMAR SETHI', 'PRASANTA KUMAR SETHI', 'sethip52@gmail.com', '+917978692005', 'active', '2026-07-07 05:03:31', '2026-07-07 05:03:31'),
(781, '69eb604f415467e0a69e97b7', 'Prajwal', 'R', 'Prajwal R', 'rprajwal365@gmail.com', '+916361328198', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(782, '69eb603f415467e0a69e9566', 'Prajwal', 'Khavatkopp', 'Prajwal Khavatkopp', 'prajwal7010@gmail.com', '+917676330406', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(783, '69eb602d415467e0a69e9321', 'Piyush', 'Upadhyay', 'Piyush Upadhyay', 'upadhyaypiyush1234@gmail.com', '+919784310051', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(784, '69eb601d415467e0a69e90e8', 'Shailaja', 'Reddy Peddolla', 'Shailaja Reddy Peddolla', 'shailajareddypeddolla@gmail.com', '+919014778350', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(785, '69eb600a415467e0a69e8e9a', 'Paras', 'Shresth', 'Paras Shresth', 'parasshresth82@gmail.com', '+918905833101', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(786, '69eb5ffb415467e0a69e8c50', 'Nagaraj', 'Patil', 'Nagaraj Patil', 'nagarajpatil2129@gmail.com', '+918660826020', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(787, '69eb5fed415467e0a69e8a00', 'MEGHANA', 'MN', 'MEGHANA MN', 'meghanamnm@gmail.com', '+917019211348', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(788, '69eb5fdf415467e0a69e87b2', 'Md', 'Ezaj', 'Md Ezaj', 'mdezajansari123@gmail.com', '+917667752208', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(789, '69eb5fce415467e0a69e8575', 'Mayuri', 'Chandure', 'Mayuri Chandure', 'chanduremayuri10@gmail.com', '+916361963350', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(790, '69eb5fc4415467e0a69e831a', 'Manohara', 'B K', 'Manohara B K', 'manoharabk99@gmail.com', '+917204022678', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(791, '69eb5fb4415467e0a69e80e2', 'Lolla', 'Anirudh', 'Lolla Anirudh', 'lollaanirudh88@gmail.com', '+916303443407', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(792, '69eb5fad415467e0a69e7ea6', 'Dubakula', 'Lavanya', 'Dubakula Lavanya', 'lavanya0269@gmail.com', '+919912743474', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(793, '69eb5f9d415467e0a69e7c5f', 'Kovvuri', 'Aditya Reddy', 'Kovvuri Aditya Reddy', 'adityareddykovvuri4310@gmail.com', '+917382333893', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(794, '69eb5f87415467e0a69e79f6', 'KOLLAPRATHYUSHA', 'Unknown', 'KOLLAPRATHYUSHA Unknown', 'kollaprathyusha156@gmail.com', '+917842577947', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(795, '69eb5f77415467e0a69e7798', 'Jadi', 'kirankumar', 'Jadi kirankumar', 'jkirankumar963@gmail.com', '+917675973511', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(796, '69eb5f6c415467e0a69e754c', 'JAGADEESH', 'GOUD M', 'JAGADEESH GOUD M', 'jagadeeshgoud96180@gmail.com', '+919618020118', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(797, '69eb5f60415467e0a69e7306', 'Harshit', 'Parashar', 'Harshit Parashar', 'harshitparashar474@gmail.com', '+917061433766', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(798, '69eb5f52415467e0a69e70b6', 'HARITHA', 'NAGAMALLA', 'HARITHA NAGAMALLA', 'sreeharitha8143@gmail.com', '+919347672997', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(799, '69eb5f39415467e0a69e6e57', 'Goudu', 'Sahana', 'Goudu Sahana', 'gksahana3@gmai.com', '+919347802828', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(800, '69eb5f2b415467e0a69e6c1c', 'Dhanush', 'B M', 'Dhanush B M', 'dhanushmysore14@gmail.com', '+917411628211', 'active', '2026-07-07 05:03:32', '2026-07-07 05:03:32'),
(801, '69eb5f1d415467e0a69e69da', 'Chakradhar', 'Reddy', 'Chakradhar Reddy', 'chakradhar7456@gmail.com', '+916364574780', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(802, '69eb5f08415467e0a69e6793', 'CHAITRA', 'K KABADE', 'CHAITRA K KABADE', 'chaitrakabade212@gmail.com', '+919108112643', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(803, '69eb5ef3415467e0a69e64e1', 'Bidala', 'Achyutha', 'Bidala Achyutha', 'achyuthabidala@gmail.com', '+918431443880', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(804, '69eb5ee1415467e0a69e629e', 'Bhaishnav', 'D', 'Bhaishnav D', 'bhaishnavd@gmail.com', '+917569437232', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(805, '69eb5ebe415467e0a69e5efd', 'ARYAN', 'SURYAWANSHI', 'ARYAN SURYAWANSHI', 'aryanvgsurya@gmail.com', '+919022949931', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(806, '69eb5e8b415467e0a69e5a2f', 'ANANTHA', 'REDDY GURRALA', 'ANANTHA REDDY GURRALA', 'ananthareddy194@gmail.com', '+917660963412', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(807, '69eb5e7e415467e0a69e57d7', 'Akarsh', 'Mishra', 'Akarsh Mishra', 'akarshmishraji23@gmail.com', '+919506089589', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(808, '69eb5e6e415467e0a69e558f', 'ADISH', 'MODI', 'ADISH MODI', 'modiadish16@gmail.com', '+918770839965', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(809, '69eb5c71415467e0a69e4f77', 'VARSHA', 'D', 'VARSHA D', 'varsha1ga22ai056@gmail.com', '+919066765481', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(810, '69eb5c51415467e0a69e4a50', 'Vallari', 'Patil', 'Vallari Patil', 'vallaripatil19@gmail.com', '+919152256543', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(811, '69eb5c26415467e0a69e42dd', 'Sumit', 'Kapse', 'Sumit Kapse', 'kapsesumit14@gmail.com', '+918989413277', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(812, '69eb5c17415467e0a69e3f43', 'Suchitra', 'Hammannavar', 'Suchitra Hammannavar', 'hammannavarsuchitra@gmail.com', '+916361937349', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(813, '69eb5bef415467e0a69e3830', 'Shubhanshu', 'Navadiya', 'Shubhanshu Navadiya', 'subhnavadiya@gmail.com', '+919031132507', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(814, '69eb5bc0415467e0a69e31a2', 'Shravani', 'Murabatte', 'Shravani Murabatte', 'shravani.s.murabatte@gmail.com', '+919021896763', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(815, '69eb5ba0415467e0a69e2c6f', 'SHIVAM', 'BHATTACHARYA', 'SHIVAM BHATTACHARYA', 'shivambhattacharya14@gmail.com', '+918384849772', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(816, '69eb5b8c415467e0a69e2862', 'Sharadhi', 'K R', 'Sharadhi K R', 'sharadhi4002@gmail.com', '+919901987962', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(817, '69eb5b79415467e0a69e246e', 'Satyam', 'Patel', 'Satyam Patel', 'satyampatel2748@gamil.com', '+917582829394', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(818, '69eb5b68415467e0a69e209e', 'Sarita', 'Padhi', 'Sarita Padhi', 'saritapadhi25051992@gmail.com', '+917008115285', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(819, '69eb5b58415467e0a69e1ce8', 'Sanjana', 'S', 'Sanjana S', 'shivakumarsanjana21@gmail.com', '+918660184001', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(820, '69eb5b40415467e0a69e18a4', 'Ritik', 'Varshney', 'Ritik Varshney', 'ritikvarshney036@gmail.com', '+919149071821', 'active', '2026-07-07 05:03:33', '2026-07-07 05:03:33'),
(821, '69eb5b2f415467e0a69e162e', 'Reshma', 'G S', 'Reshma G S', 'reshmayadav210@gmail.com', '+917483122369', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(822, '69eb5b1a415467e0a69e13bd', 'Rajat', 'Unknown', 'Rajat Unknown', 'rajatthakur12354@gmail.com', '+918433037463', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(823, '69eb5b01415467e0a69e0efe', 'Priyanshu', 'Saini', 'Priyanshu Saini', 'priyanshusaini258@gmail.com', '+919031109640', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(824, '69eb5af3415467e0a69e0cb0', 'Praveen', 'Ravichandran', 'Praveen Ravichandran', 'praveenravichandran5@gmail.com.com', '+917671002249', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(825, '69eb5ae5415467e0a69e0a5b', 'Prashansa', 'Kamalpuriya', 'Prashansa Kamalpuriya', 'kamalpuriyaprashansa2108@gmail.com', '+919993693112', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(826, '69eb5ad3415467e0a69e0801', 'PRANATHI', 'K P', 'PRANATHI K P', 'pranathigowda987@gmail.com', '+919741798307', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(827, '69eb5ac4415467e0a69e05aa', 'Prajyot', 'Pawer', 'Prajyot Pawer', 'prajyotpawar.work@gmail.com', '+919860891420', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(828, '69eb5ab8415467e0a69e035d', 'Pavithra', 'R', 'Pavithra R', 'pavithra.r.viji@gmail.com', '+918610780437', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(829, '69eb5aab415467e0a69e010a', 'Nisarga', 'C M', 'Nisarga C M', 'nisarga.mohanraj@gmail.com', '+919740141767', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(830, '69eb5a94415467e0a69dfe13', 'Manisha', 'Dongre', 'Manisha Dongre', 'manisha40354@gmail.com', '+918329672183', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(831, '69eb5a84415467e0a69dfbbe', 'Madhushree', 'Ontagodi', 'Madhushree Ontagodi', 'madhushreeontagodi@gmail.com', '+916362826657', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(832, '69eb5a76415467e0a69df95f', 'Laxmi', 'Sonnad', 'Laxmi Sonnad', 'laxmisonnad14@gmail.com', '+917795094914', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(833, '69eb5a61415467e0a69df704', 'LAVISHA', 'BHATIA', 'LAVISHA BHATIA', 'lavishabhatia1012@gmail.com', '+919131309097', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(834, '69eb5a48415467e0a69df496', 'Kirthiga', 'M', 'Kirthiga M', 'kirthigamanivannan05@gmail.com', '+919360374006', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(835, '69eb5a29415467e0a69df220', 'Srilatha', 'Unknown', 'Srilatha Unknown', 'dlatha549@gmail.com', '+919573401944', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(836, '69eb5a1b415467e0a69defcf', 'Jakeer', 'Unknown', 'Jakeer Unknown', 'jakeer2205@gmail.com', '+916374643388', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(837, '69eb5a09415467e0a69ded62', 'ISHAAN', 'BARDE', 'ISHAAN BARDE', 'ishaanbarde.work@gmail.com', '+919664477008', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(838, '69eb59f5415467e0a69deb02', 'Himanshu', 'Jha', 'Himanshu Jha', 'himanshujha7489@gmail.com', '+917879897374', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(839, '69eb59df415467e0a69de89a', 'HARSH', 'KUMAR', 'HARSH KUMAR', 'harshgmaxwell@gmail.com', '+916205436310', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(840, '69eb59cf415467e0a69de633', 'Hani', 'Roshan CK', 'Hani Roshan CK', 'haniroshan2002@gmail.com', '+918129782177', 'active', '2026-07-07 05:03:34', '2026-07-07 05:03:34'),
(841, '69eb59bf415467e0a69de3c9', 'Govind', 'Rathod', 'Govind Rathod', 'govindjairam.cs23@bmsce.ac.in', '+916366564107', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(842, '69eb59ac415467e0a69de169', 'Harshitha', 'Gosala', 'Harshitha Gosala', 'harshithagosala2105@gmail.com', '+916301131988', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(843, '69eb5987415467e0a69ddc3e', 'Chandra', 'Sekhar', 'Chandra Sekhar', 'gattuchandrasekhar7@gmail.com', '+918639288845', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(844, '69eb5978415467e0a69dd9e1', 'CHANDANA', 'B G', 'CHANDANA B G', 'chandanac641@gmail.com', '+919535599391', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(845, '69eb5962415467e0a69dd770', 'Lalitha', 'Devi Bollineni', 'Lalitha Devi Bollineni', 'bollinenilalithadevi@gmail.com', '+919948904242', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(846, '69eb5954415467e0a69dd50e', 'Binnitha', 'Medikurthi', 'Binnitha Medikurthi', 'binithaabinni@gmail.com', '+918328171437', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(847, '69eb5943415467e0a69dd2b1', 'Anishka', 'Shrivastava', 'Anishka Shrivastava', 'anishka.mits2020@gmail.com', '+919174651486', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(848, '69eb5932415467e0a69dd03b', 'Aniket', 'Nayak', 'Aniket Nayak', 'aniket.nayak96@gmail.com', '+919777870771', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(849, '69eb5913415467e0a69dcb86', 'ANANTHASHAYANA', 'S V', 'ANANTHASHAYANA S V', 'ananthkuppur@gmail.com', '+918095314501', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(850, '69eb5902415467e0a69dc922', 'AMOGH', 'MALVIYA', 'AMOGH MALVIYA', 'amoghmalviyawork@gmail.com', '+917302756927', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(851, '69eb58ea415467e0a69dc6c3', 'Ahmad', 'Nabeel', 'Ahmad Nabeel', 'ahmadnabeel.official@gmail.com', '+919369308787', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(852, '69eb58ac415467e0a69dc3ab', 'Swastik', 'Sharma', 'Swastik Sharma', 'sswastik2002@gmail.com', '+919728617595', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(853, '69eb5889415467e0a69dc123', 'SPANDANA', 'M B', 'SPANDANA M B', 'spandanambaiml2026@gmail.com', '+918310299014', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(854, '69eb587a415467e0a69dbed1', 'Sourav', 'Saha', 'Sourav Saha', 'souravnita25@gmail.com', '+916009964678', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(855, '69eb5863415467e0a69dbc61', 'Soumyadipta', 'Bose', 'Soumyadipta Bose', 'diptabose484@gmail.com', '+919381327381', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(856, '69eb5849415467e0a69db9f3', 'Soujanya', 'SP', 'Soujanya SP', 'spsoujanya02@gmail.com', '+918088091773', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(857, '69eb5830415467e0a69db782', 'SNEHA', 'Unknown', 'SNEHA Unknown', 'snehakrishna255@gmail.com', '+917892150639', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(858, '69eb5823415467e0a69db524', 'Shwetha', 'k', 'Shwetha k', 'shwethakulk143@gmail.com', '+917330904133', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(859, '69eb5814415467e0a69db2c6', 'Sharayu', 'Kharde', 'Sharayu Kharde', 'sharayukharde2002@gmail.com', '+919307804541', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(860, '69eb5806415467e0a69db068', 'Sarvesh', 'Choudhary', 'Sarvesh Choudhary', 'sarveshc111@gmail.com', '+918827034174', 'active', '2026-07-07 05:03:35', '2026-07-07 05:03:35'),
(861, '69eb57f4415467e0a69dadff', 'Sandesh', 'Pabitwar', 'Sandesh Pabitwar', 'sandeshpabitwar@gmail.com', '+918806264710', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36');
INSERT INTO `students` (`id`, `external_id`, `first_name`, `last_name`, `full_name`, `email`, `phone_number`, `status`, `created_at`, `updated_at`) VALUES
(862, '69eb57e3415467e0a69daba9', 'Sajal', 'Chauhan', 'Sajal Chauhan', 'chauhansajal11@gmail.com', '+918394944196', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(863, '69eb57ce415467e0a69da8ab', 'SACHIN', 'P S', 'SACHIN P S', 'sachinpsajeev12@gmail.com', '+919483762498', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(864, '69eb57bc415467e0a69da647', 'Ruchismita', 'Sarangi', 'Ruchismita Sarangi', 'ruchismitasarangi31@gmail.com', '+919668732955', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(865, '69eb57aa415467e0a69da3cc', 'PRASANNA', 'M R', 'PRASANNA M R', 'prasannamrevankar@gmail.com', '+919164219140', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(866, '69eb5793415467e0a69d9f15', 'Pragathi', 'G R', 'Pragathi G R', 'pragathigr31@gmail.com', '+919019554886', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(867, '69eb5788415467e0a69d9cad', 'PRABHAVATI', 'SAGAR', 'PRABHAVATI SAGAR', 'prabhavatisagar21@gmail.com', '+916363099554', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(868, '69eb5776415467e0a69d9a44', 'Pavani', 'Sireesha Relangi', 'Pavani Sireesha Relangi', 'pavanisireesharelangi@gmail.com', '+919346335594', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(869, '69eb576b415467e0a69d97f7', 'Paritosh', 'Mishra', 'Paritosh Mishra', 'paritosh1999mishra@gmail.com', '+916375995783', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(870, '69eb575a415467e0a69d959c', 'Pallavi', 'Golar', 'Pallavi Golar', 'pallavialai123@gmail.com', '+919011971295', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(871, '69eb5743415467e0a69d932b', 'Nitin', 'Gupta', 'Nitin Gupta', 'niting7464@gmail.com', '+917404574175', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(872, '69eb5732415467e0a69d90ba', 'Kummari', 'Naveen', 'Kummari Naveen', 'kummarinaveen525@gmail.com', '+918688220210', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(873, '69eb5724415467e0a69d8e6c', 'Nagesh', 'B S', 'Nagesh B S', 'nageshbs0817@gmail.com', '+919110203949', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(874, '69eb5711415467e0a69d8c1a', 'N.', 'LEELAVATHI', 'N. LEELAVATHI', 'leelavathinare630@gmail.com', '+917013058685', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(875, '69eb5702415467e0a69d89af', 'Madhushree', 'Unknown', 'Madhushree Unknown', 'msbadiger7676@gmail.com', '+917676400320', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(876, '69eb56ec415467e0a69d874b', 'LAKSHMI', 'KANTH SV', 'LAKSHMI KANTH SV', 'lakshmikanthkanth568@gmail.com', '+918088079716', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(877, '69eb56da415467e0a69d84e1', 'Kunal', 'Pawar Dahare', 'Kunal Pawar Dahare', 'kunalpawar793@gmail.com', '+917223033967', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(878, '69eb56ca415467e0a69d8283', 'Keerthi', 'Chiranjeevi', 'Keerthi Chiranjeevi', 'keerthi05.niru@gmail.com', '+919742359445', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(879, '69eb56bd415467e0a69d8034', 'Kaustubh', 'Indraganti Sastry', 'Kaustubh Indraganti Sastry', 'sastry2003@gmail.com', '+919533106333', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(880, '69eb56a5415467e0a69d7dc0', 'Jitesh', 'Chauhan', 'Jitesh Chauhan', 'jiteshchauhan281@gmail.com', '+918477069788', 'active', '2026-07-07 05:03:36', '2026-07-07 05:03:36'),
(881, '69eb5692415467e0a69d7b69', 'Jesnamol', 'Thomas', 'Jesnamol Thomas', 'jesnamol1112@gmail.com', '+917907744006', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(882, '69eb5683415467e0a69d78f5', 'Gitesh', 'Mane', 'Gitesh Mane', 'giteshmane013@gmail.com', '+919764525006', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(883, '69eb5672415467e0a69d7688', 'CHENNUPATI', 'GANESH', 'CHENNUPATI GANESH', 'ganeshc2103@gmail.com', '+916300950802', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(884, '69eb5665415467e0a69d7432', 'Durgadevi', 'Nayak', 'Durgadevi Nayak', 'durganayak2727@gmail.com', '+918317350684', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(885, '69eb5658415467e0a69d71d7', 'Dibyarup', 'Dhar', 'Dibyarup Dhar', 'dharbittu6@gmail.com', '+917430909592', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(886, '69eb5644415467e0a69d6f62', 'Dharani', 'Unknown', 'Dharani Unknown', 'mdharani1104@gmail.com', '+917981471557', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(887, '69eb5637415467e0a69d6d13', 'Devi', 'Satapathy', 'Devi Satapathy', 'deviprasadsatapathy1005@gmail.com', '+918260426845', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(888, '69eb5625415467e0a69d6abc', 'Darshan', 'V', 'Darshan V', 'darshanvgowda12@gmail.com', '+918431751992', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(889, '69eb5606415467e0a69d66c7', 'CHANDAN', 'M.P', 'CHANDAN M.P', 'chandanmp12602@gmail.com', '+918296656005', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(890, '69eb55fb415467e0a69d646c', 'BRINDHA', 'Unknown', 'BRINDHA Unknown', 'brindhar4061@gmail.com', '+919361364061', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(891, '69eb55ea415467e0a69d620b', 'BRANDA', 'HIJAM', 'BRANDA HIJAM', 'brandahijam@gmail.com', '+919862062498', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(892, '69eb55d3415467e0a69d5f9d', 'Ashik', 'George', 'Ashik George', 'ashikgeorgec@gmail.com', '+919778195448', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(893, '69eb55c7415467e0a69d5d40', 'Arpitha', 'A K', 'Arpitha A K', 'arpithaak72@gmail.com', '+918867648836', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(894, '69eb55bc415467e0a69d5af3', 'Akshith', 'Karanam', 'Akshith Karanam', 'akshithkaranam@gmail.com', '+919347753205', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(895, '69eb55ac415467e0a69d5890', 'Ajay', 'Kalshetty', 'Ajay Kalshetty', 'ajaykalshetty1717@gmail.com', '+917038021717', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(896, '69eb5597415467e0a69d55c2', 'Addhyan', 'Das', 'Addhyan Das', 'dasaddhyan5@gmail.com', '+918670267198', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(897, '69eb558b415467e0a69d536f', 'ABDUL', 'KADAR', 'ABDUL KADAR', 'saytokadar@gmail.com', '+918015820910', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(898, '69eb532b415467e0a69d0274', 'Udit', 'Sanadhya', 'Udit Sanadhya', 'uditsanadya@email.com', '+919782816000', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(899, '69eb5314415467e0a69cf77f', 'TEJAS', 'GOWDA', 'TEJAS GOWDA', 'tejasgowda628@gmail.com', '+916360533532', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(900, '69eb5308415467e0a69cf0fd', 'Tanvi', 'Kokitkar', 'Tanvi Kokitkar', 'tanvikokitkar30@gmail.com', '+919986320679', 'active', '2026-07-07 05:03:37', '2026-07-07 05:03:37'),
(901, '69eb52f1415467e0a69ce5ec', 'Tanushree', 'P', 'Tanushree P', 'shreeptanu74@gmail.com', '+916361510791', 'active', '2026-07-07 05:03:38', '2026-07-07 05:03:38'),
(902, '69eb52de415467e0a69cdc70', 'Suryakiran', 'R', 'Suryakiran R', 'suryakiranr07@gmail.com', '+919629491879', 'active', '2026-07-07 05:03:38', '2026-07-07 05:03:38'),
(903, '69eb52cb415467e0a69cd4d0', 'Surya', 'Gangadhar Pantham', 'Surya Gangadhar Pantham', 'psuryagangadhar@gmail.com', '+918970589848', 'active', '2026-07-07 05:03:38', '2026-07-07 05:03:38'),
(904, '69eb52ab415467e0a69cb01f', 'Candidate', 'Unknown', 'Candidate Unknown', 'sudhanshuroy.97@gmail.com', '+919304499354', 'active', '2026-07-07 05:03:38', '2026-07-07 05:03:38'),
(905, '69eb52a4415467e0a69cab54', 'Soham', 'Chakraborty', 'Soham Chakraborty', 'sohamchakraborty154@gmail.com', '+918431544804', 'active', '2026-07-07 05:03:38', '2026-07-07 05:03:38'),
(906, '69eb5291415467e0a69ca1df', 'Shubham', 'Nijhawan', 'Shubham Nijhawan', 'shubhamnijhawan17@gmail.com', '+919266970904', 'active', '2026-07-07 05:03:38', '2026-07-07 05:03:38'),
(907, '69eb527f415467e0a69c98c9', 'SHRAVYASHREE', 'DJ', 'SHRAVYASHREE DJ', 'djshravya462@gmail.com', '+918431132486', 'active', '2026-07-07 05:03:38', '2026-07-07 05:03:38'),
(908, '69eb5270415467e0a69c90f1', 'SANJAI', 'SABARI', 'SANJAI SABARI', 'sanjai3254@gmail.com', '+919360773254', 'active', '2026-07-07 05:03:38', '2026-07-07 05:03:38'),
(909, '69eb5262415467e0a69c8985', 'Samyukth', 'Dharmarajan', 'Samyukth Dharmarajan', 'drajsamyukth@gmail.com', '+919207456310', 'active', '2026-07-07 05:03:38', '2026-07-07 05:03:38'),
(910, '69eb524e415467e0a69c7fa3', 'Rohan', 'Pandey', 'Rohan Pandey', 'pandeyrohankumar@gmail.com', '+919472152820', 'active', '2026-07-07 05:03:38', '2026-07-07 05:03:38'),
(911, '69eb523c415467e0a69c7690', 'Rachana', 'C U', 'Rachana C U', 'rachanaumeshcu296@gmail.com', '+918792093245', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(912, '69eb5232415467e0a69c70ab', 'PURUSHOTHAMAN', 'Unknown', 'PURUSHOTHAMAN Unknown', 'purushothamand.dev@gmail.com', '+918220575572', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(913, '69eb5225415467e0a69c6996', 'Prasath', 'KP', 'Prasath KP', 'prasath10416@gmail.com', '+919443397239', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(914, '69eb5218415467e0a69c6275', 'Parmeshwar', 'Nagapalle', 'Parmeshwar Nagapalle', 'nagapalleparam45@gmail.com', '+918767640954', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(915, '69eb5209415467e0a69c5aa0', 'ANJALI', 'NAYAKULA', 'ANJALI NAYAKULA', 'nayakulaanjali8723@gmail.com', '+917259880309', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(916, '69eb51f8415467e0a69c51bb', 'NAVANEETH', 'S', 'NAVANEETH S', 'navaneeths077@gmail.com', '+916385456556', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(917, '69eb51e8415467e0a69c4972', 'MOHD', 'FAIZ SHAIKH', 'MOHD FAIZ SHAIKH', 'mgsfaizshaikh9892@gmail.com', '+919892033626', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(918, '69eb51d7415467e0a69c40ca', 'Manoj', 'G', 'Manoj G', 'manojgowda9891@gmail.com', '+916363230223', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(919, '69eb51c7415467e0a69c389a', 'Mangalapuri', 'Avinash', 'Mangalapuri Avinash', 'avinashmangalapuri@gmail.com', '+919391466759', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(920, '69eb51b5415467e0a69c2f40', 'MAHESWARAN', 'R M', 'MAHESWARAN R M', 'mahesrmm05@gmail.com', '+919677571902', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(921, '69eb51a3415467e0a69c2648', 'Kota', 'Pragathi', 'Kota Pragathi', 'pragathikota003@gmail.com', '+916304098175', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(922, '69eb5195415467e0a69c1ea2', 'Karthik', 'S L', 'Karthik S L', 'sl.karthik02@gmail.com', '+916362093617', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(923, '69eb5188415467e0a69c1784', 'Kuchula', 'Archana', 'Kuchula Archana', 'archanareddy0204@gmail.com', '+919390599840', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(924, '69eb516c415467e0a69c0852', 'G', 'SAKTHIVEL', 'G SAKTHIVEL', 'sakthimanubolu143@gmail.com', '+916374771049', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(925, '69eb515a415467e0a69bff50', 'Nandu', 'Gatla', 'Nandu Gatla', 'gatlanandhu756@gmail.com', '+919704772004', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(926, '69eb514b415467e0a69bf71d', 'Ganesh', 'Nerakar', 'Ganesh Nerakar', 'ganeshnerakar987@gmail.com', '+919353639295', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(927, '69eb5133415467e0a69beb7a', 'Eshna', 'Jain', 'Eshna Jain', 'jaineshna9@gmail.com', '+918769473646', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(928, '69eb5120415467e0a69be21b', 'DHARUNKUMAR', 'V', 'DHARUNKUMAR V', 'vdharunkumar04@gmail.com', '+918220588049', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(929, '69eb510e415467e0a69bd926', 'DEEPAK', 'RAUTELA', 'DEEPAK RAUTELA', 'rautela265@gmail.com', '+919045066401', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(930, '69eb50fe415467e0a69bd08d', 'CHHANDAK', 'MUKHERJEE', 'CHHANDAK MUKHERJEE', 'chhandakmukherjee14@gmail.com', '+917319108277', 'active', '2026-07-07 05:03:39', '2026-07-07 05:03:39'),
(931, '69eb50ee415467e0a69bc868', 'Chetan', 'Kushwaha', 'Chetan Kushwaha', 'ckushwaha536@gmail.com', '+919424788675', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(932, '69eb50d9415467e0a69bbde9', 'Kishore', 'Baddiputi', 'Kishore Baddiputi', 'baddiputikishore@gmail.com', '+919392861605', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(933, '69eb50cb415467e0a69bb682', 'ASHIS', 'KUMAR ROUT', 'ASHIS KUMAR ROUT', 'ashisrout541@gmail.com', '+918917439096', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(934, '69eb50b8415467e0a69bad02', 'Arnnab', 'Chakra', 'Arnnab Chakra', 'chakraarnnab@gmail.com', '+917852999356', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(935, '69eb50a4415467e0a69ba326', 'Aparna', 'Kumari', 'Aparna Kumari', 'kumarisahaparna@gmail.com', '+918660895780', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(936, '69eb5090415467e0a69b9969', 'ANSH', 'SINGH', 'ANSH SINGH', 'anshsingh25bd@gmail.com', '+916359451876', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(937, '69eb5076415467e0a69b8ce0', 'AKSHAY', 'KUMAR BV', 'AKSHAY KUMAR BV', 'akshay66700@gmail.com', '+919606274615', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(938, '69eb506a415467e0a69b8638', 'Akshata', 'Unknown', 'Akshata Unknown', 'akshatapatil2773@gmail.com', '+919731739097', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(939, '69eb505c415467e0a69b7ec3', 'Aditya', 'Patil', 'Aditya Patil', 'adityapatil9173@gmail.com', '+919731335263', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(940, '69eb504c415467e0a69b7682', 'Abhinav', 'Krishna V', 'Abhinav Krishna V', 'abnvv07@gmail.com', '+918139065847', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(941, '69eb502d415467e0a69b672b', 'ABBIRAMY', 'Unknown', 'ABBIRAMY Unknown', 'abbianandan@gmail.com', '+919600371880', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(942, '69eb501b415467e0a69b5dd1', 'Aashwini', 'Patil', 'Aashwini Patil', 'patilashwini191010@gmail.com', '+919146153185', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(943, '69e9f9553a1f05053bffb1d9', 'SARVESH', 'KARADE', 'SARVESH KARADE', 'sarveshkarade@gmail.com', '+919380083215', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(944, '69e9f9493a1f05053bffaf97', 'Sanjai', 'Rajasekaran', 'Sanjai Rajasekaran', 'sanjairajasekaran70@gmail.com', '+16382718455', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(945, '69e9f93e3a1f05053bffad45', 'SAISREEJA', 'NALLAPAREDDY', 'SAISREEJA NALLAPAREDDY', 'saisreejanallapareddy@gmail.com', '+919949240261', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(946, '69e9f92b3a1f05053bffaaf5', 'Sadhak', 'Banerjee', 'Sadhak Banerjee', 'sadhakbanerjee@gmail.com', '+919642093652', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(947, '69e9f91d3a1f05053bffa89f', 'Rishabh', 'Negi', 'Rishabh Negi', 'rishinegi27062001@gmail.com', '+918847259971', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(948, '69e9f90f3a1f05053bffa65b', 'REVANTH', 'DANDUBOINA', 'REVANTH DANDUBOINA', 'revanth.danduboina@gmail.com', '+917702010349', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(949, '69e9f9003a1f05053bffa404', 'REDDAPPA', 'M R', 'REDDAPPA M R', 'reddymr2018@gmail.com', '+919980792638', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(950, '69e9f8f23a1f05053bffa1ad', 'RAMYASHREE', 'V', 'RAMYASHREE V', 'papiramya123@gmail.com', '+918431297209', 'active', '2026-07-07 05:03:40', '2026-07-07 05:03:40'),
(951, '69e9f8e53a1f05053bff9ef8', 'Rakshit', 'Devra', 'Rakshit Devra', 'rakshitdevra968@gmail.com', '+917300597225', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(952, '69e9f8d83a1f05053bff9ca3', 'RAKESH', 'B R', 'RAKESH B R', 'rakeshbr2003@gmail.com', '+917026610512', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(953, '69e9f8c93a1f05053bff9a42', 'Rahul', 'Mali', 'Rahul Mali', 'rahulramumali2001@gmail.com', '+917259203966', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(954, '69e9f8ba3a1f05053bff97f8', 'PRAJWAL', 'SHANKARSHETTY', 'PRAJWAL SHANKARSHETTY', 'prajwal56203@gmail.com', '+919019052138', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(955, '69e9f8aa3a1f05053bff95aa', 'NagaCharan', 'Tanguturu', 'NagaCharan Tanguturu', 'tanguturunagacharan@gmail.com', '+919908153099', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(956, '69e9f8943a1f05053bff9350', 'MUKESH', 'NAIK', 'MUKESH NAIK', 'mukeshvnaik5@gmail.com', '+917022822238', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(957, '69e9f8863a1f05053bff910f', 'MOHAMED', 'RIAZ AHAMED', 'MOHAMED RIAZ AHAMED', 'mohamednawfal3@gmail.com', '+919786143430', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(958, '69e9f8783a1f05053bff8eb5', 'MALLI', 'VAMSIKRISHNA', 'MALLI VAMSIKRISHNA', 'vamsimalle1717@gmail.com', '+916303010373', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(959, '69e9f85c3a1f05053bff8c36', 'LIKITHA', 'V', 'LIKITHA V', 'likisheethal@gmail.com', '+917483987738', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(960, '69e9f84f3a1f05053bff89e2', 'Lavannya', 'Pradeep Rathod', 'Lavannya Pradeep Rathod', 'lavannyaprathod@gmail.com', '+919902755917', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(961, '69e9f83e3a1f05053bff8789', 'Kiran', 'M B', 'Kiran M B', 'kiraj8899@gmail.com', '+918867324156', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(962, '69e9f8253a1f05053bff851d', 'G', 'Arpitha', 'G Arpitha', 'garpitha2111@gmail.com', '+916363135520', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(963, '69e9f8193a1f05053bff82d7', 'Ganavi', 'Unknown', 'Ganavi Unknown', 'ganavir1999@gmail.com', '+919741109179', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(964, '69e9f80d3a1f05053bff807f', 'Devamma', 'ITI', 'Devamma ITI', 'itidevamma@gmail.com', '+917204978289', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(965, '69e9f7f83a1f05053bff7e2f', 'Deepa', 'Gangwar', 'Deepa Gangwar', 'deepagangwar078@gmail.com', '+918439234078', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(966, '69e9f7ec3a1f05053bff7be1', 'Davis', 'Arnold M', 'Davis Arnold M', 'davis9535505788@gmail.com', '+917892191027', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(967, '69e9f7d63a1f05053bff798a', 'Dampetla', 'Vishnu Vardhan', 'Dampetla Vishnu Vardhan', 'dampetlavishnu44@gmail.com', '+919701831704', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(968, '69e9f7c73a1f05053bff773f', 'Bhushan', 'Dandavate', 'Bhushan Dandavate', 'bhushan752002@gmail.com', '+919145789762', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(969, '69e9f7ba3a1f05053bff74f2', 'ASHWINI', 'THAKARE', 'ASHWINI THAKARE', 'ashwinithakare333@gmail.com', '+918850033781', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(970, '69e9f7a33a1f05053bff726f', 'ASHISH', 'KUMAR', 'ASHISH KUMAR', 'ashishkumar875504@gmail.com', '+918755048224', 'active', '2026-07-07 05:03:41', '2026-07-07 05:03:41'),
(971, '69e9f7963a1f05053bff7020', 'ARKADUMUNIKRISHNA', 'Unknown', 'ARKADUMUNIKRISHNA Unknown', 'arkadumunikrishna@gmail.com', '+917032687702', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(972, '69e9f7883a1f05053bff6dcd', 'ANANYA', 'NAGARAJ', 'ANANYA NAGARAJ', 'mca.ananyanagaraj@gmail.com', '+919986488057', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(973, '69e9f77a3a1f05053bff6b8c', 'Anand', 'Jha', 'Anand Jha', 'anand18402@gmail.com', '+916290459797', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(974, '69e9f7673a1f05053bff6932', 'Akash', 'Aaryan', 'Akash Aaryan', 'akasharyan.aryan@gmail.com', '+918002806797', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(975, '69e9f74d3a1f05053bff66d1', 'Aftab', 'IsmailSab Dharwad', 'Aftab IsmailSab Dharwad', 'aftabdharwad40@gmail.com', '+917019930536', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(976, '69e9e4963a1f05053bff5e71', 'Vishnu', 'D', 'Vishnu D', 'vishnud3966@gmail.com', '+918289873966', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(977, '69e9e4883a1f05053bff5bfb', 'Vikas', 'Bandi', 'Vikas Bandi', 'vikasmb2000@gmail.com', '+918951450245', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(978, '69e9e4593a1f05053bff57ff', 'Vijay', 'Jeughale', 'Vijay Jeughale', 'vijaykj65@gmail.com', '+917218160207', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(979, '69e9e4403a1f05053bff550f', 'Upendra', 'Javvaji', 'Upendra Javvaji', 'upendrajavvaji1646@gmail.com', '+919494232474', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(980, '69e9e4313a1f05053bff529e', 'UDAYKUMAR', 'M R', 'UDAYKUMAR M R', 'udaykumarmr94@gmail.com', '+917676323894', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(981, '69e9e4193a1f05053bff5048', 'Thejaswini', 'Unknown', 'Thejaswini Unknown', 'teju751.ab@gmail.com', '+917349717148', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(982, '69e9e40d3a1f05053bff4dcd', 'TEJASWINI', 'C', 'TEJASWINI C', 'tejaswini.20201c@gmail.com', '+919980559935', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(983, '69e9e3ff3a1f05053bff4b82', 'Sweta', 'Kumari', 'Sweta Kumari', 'skg000012@gmail.com', '+919804879644', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(984, '69e9e3f63a1f05053bff4913', 'Sushma', 'Bendre', 'Sushma Bendre', 'sushmabendre197@gmail.com', '+919591621445', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(985, '69e9e3da3a1f05053bff453c', 'Skanda', 'Prasad K S', 'Skanda Prasad K S', 'skandaprasad7@email.com', '+917353011412', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(986, '69e9e3d03a1f05053bff42ee', 'Simran', 'Walia', 'Simran Walia', 'siliaaa223@gmail.com', '+917027170234', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(987, '69e9e3bf3a1f05053bff4079', 'Shubham', 'Dhanwate', 'Shubham Dhanwate', 'shubhamdhanwate312@gmail.com', '+919011990473', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(988, '69e9e3ac3a1f05053bff3e2a', 'Shreyas', 'Nagashetti', 'Shreyas Nagashetti', 'shreyassbasavaraj@gmail.com', '+918904889387', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(989, '69e9e39a3a1f05053bff3bd4', 'Salla', 'Chandrakala', 'Salla Chandrakala', 'chandrakalasalla12@gmail.com', '+919912162503', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(990, '69e9e3843a1f05053bff3970', 'Reddisekhar', 'Yarramaddu', 'Reddisekhar Yarramaddu', 'reddisekharreddyyarramaddu@gmail.com', '+919845859204', 'active', '2026-07-07 05:03:42', '2026-07-07 05:03:42'),
(991, '69e9e36c3a1f05053bff370a', 'RAHUL', 'TIWARI', 'RAHUL TIWARI', 'tiwarirahul479@gmail.com', '+917532075688', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(992, '69e9e3573a1f05053bff3491', 'Qusai', 'Ezzy', 'Qusai Ezzy', 'qusaiezzy53@gmail.com', '+918852985211', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(993, '69e9e3433a1f05053bff322c', 'Pavithra', 'K', 'Pavithra K', 'pavithrak1723@gmail.com', '+918095563658', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(994, '69e9e3323a1f05053bff2fba', 'Nikita', 'Kamat', 'Nikita Kamat', 'nikitakamat36@gmail.com', '+917715895361', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(995, '69e9e3193a1f05053bff2d5f', 'NIHARIKA', 'Unknown', 'NIHARIKA Unknown', 'niharikavummadi@gmail.com', '+917801024312', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(996, '69e9e3113a1f05053bff2b0d', 'Neelapala', 'Siva Rama Krishna Babu', 'Neelapala Siva Rama Krishna Babu', 'sivaneelapala994@gmail.com', '+919701773636', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(997, '69e9e2ff3a1f05053bff2894', 'Mubbassirkhan', 'Jahagirdar', 'Mubbassirkhan Jahagirdar', 'mubbassirkhan96@gmail.com', '+917619175596', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(998, '69e9e2ea3a1f05053bff2612', 'MOHAN', 'DOSS', 'MOHAN DOSS', 'mohandoss9976@gmail.com', '+919363260968', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(999, '69e9e2dc3a1f05053bff23bf', 'Mohammed', 'Faizan Khan', 'Mohammed Faizan Khan', 'faizankhanyahoou@gmail.com', '+919751527326', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(1000, '69e9e2c93a1f05053bff2133', 'Mamatha', 'Unknown', 'Mamatha Unknown', 'mamatha06rk@gmail.com', '+916363034988', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(1001, '69e9e2b93a1f05053bff1ec8', 'Mallikarjun', 'Talawar', 'Mallikarjun Talawar', 'mallikarjuntalawar620@gmail.com', '+918867352855', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(1002, '69e9e2a93a1f05053bff1c4e', 'Lakshmisreddy', 'Unknown', 'Lakshmisreddy Unknown', 'lakshmireddy.16609@gmail.com', '+916383116609', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(1003, '69e9e28a3a1f05053bff1885', 'K', 'CHINMAYI', 'K CHINMAYI', 'kcchinmayi@gmail.com', '+919900963037', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(1004, '69e9e2783a1f05053bff15e4', 'Karthik', 'Nichenametla', 'Karthik Nichenametla', 'nkarthikraja46@gmail.com', '+919494999834', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(1005, '69e9e2633a1f05053bff137a', 'Jyothi', 'Pandey', 'Jyothi Pandey', 'jyothipandey2@gmail.com', '+918618194686', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(1006, '69e9e2533a1f05053bff1120', 'Jathin', 'Reddy', 'Jathin Reddy', 'jathinreddy804@gmail.com', '+918247708516', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(1007, '69e9e2433a1f05053bff0ebc', 'Himanshu', 'Vats', 'Himanshu Vats', 'himanshu15638@gmail.com', '+918950251524', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(1008, '69e9e22f3a1f05053bff0c59', 'Ganesh', 'Rongala', 'Ganesh Rongala', 'ganeshrongala89@gmail.com', '+918985805797', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(1009, '69e9e2263a1f05053bff0a0b', 'Mothilal', 'Chowdary', 'Mothilal Chowdary', 'mothilalchowdary99@gmail.com', '+919573464113', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(1010, '69e9e2113a1f05053bff079f', 'D', 'Anirudh Karthik', 'D Anirudh Karthik', 'anirudh211202@gmail.com', '+917022101454', 'active', '2026-07-07 05:03:43', '2026-07-07 05:03:43'),
(1011, '69e9e2053a1f05053bff054d', 'SAI', 'GANESH BHASKARUNI', 'SAI GANESH BHASKARUNI', 'saiganesh.bhaskaruni@gmail.com', '+916303355162', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1012, '69e9e1ef3a1f05053bff02dd', 'Anu', 'Kumari', 'Anu Kumari', 'anu821931@gmail.com', '+919608747316', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1013, '69e9e1e33a1f05053bff006d', 'VENKATA', 'KAVYAANNAVARAPU', 'VENKATA KAVYAANNAVARAPU', 'venkatakavyaannavarapu21@gmail.com', '+916301954046', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1014, '69e9e1cd3a1f05053bfefe0a', 'Amitosh', 'Das', 'Amitosh Das', 'amitosh1206@gmail.com', '+16291148553', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1015, '69e9e1bd3a1f05053bfefba4', 'Ambika', 'Unknown', 'Ambika Unknown', 'ambikanv73@gmail.com', '+919591170845', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1016, '69e9e1b23a1f05053bfef93f', 'AKASH', 'TP', 'AKASH TP', 'akashrajakashuser25000@gmail.com', '+918754900459', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1017, '69e9e1a83a1f05053bfef6f4', 'Aishwarya', 'Kumbar', 'Aishwarya Kumbar', 'aishwaryakumbar1998@gmail.com', '+919686107748', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1018, '69e9e1963a1f05053bfef4a1', 'Abhishek', 'Shetti', 'Abhishek Shetti', 'abhishekshetti28@gmail.com', '+918904877498', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1019, '69e9e1843a1f05053bfef245', 'Abhishek', 'Ranjan', 'Abhishek Ranjan', 'ranjanabhishek.0209@gmail.com', '+919307883566', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1020, '69e9e1703a1f05053bfeefde', 'Abhishek', 'Raj', 'Abhishek Raj', 'abhishekraj31020@gmail.com', '+918076189845', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1021, '69e9e1613a1f05053bfeed82', 'ABHINAV', 'KUMAR SINGH', 'ABHINAV KUMAR SINGH', 'abhinav80096@gmail.com', '+918853100431', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1022, '69e9deed3a1f05053bfeea55', 'Tushar', 'Raj Choudhary', 'Tushar Raj Choudhary', 'tusharraj781@gmail.com', '+919525589282', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1023, '69e9deda3a1f05053bfee80c', 'TANUSHREE', 'K S', 'TANUSHREE K S', 'kstanushree7@gmail.com', '+919740639466', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1024, '69e9decb3a1f05053bfee5c1', 'Sushant', 'Yelurkar', 'Sushant Yelurkar', 'yelurkarsushant@gmail.com', '+919594236104', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1025, '69e9deba3a1f05053bfee367', 'Sumanth', 'N S', 'Sumanth N S', 'sumanthnsacharya@gmail.com', '+919945986388', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1026, '69e9dea73a1f05053bfee11c', 'Subhajyoti', 'Mohanta', 'Subhajyoti Mohanta', 'subhajyotimohanta47@gmail.com', '+919800515488', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1027, '69e9de803a1f05053bfedc6f', 'Srikantakumar', 'Unknown', 'Srikantakumar Unknown', 'kumarsrikanta012@gmail.com', '+917411770552', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1028, '69e9de683a1f05053bfeda1b', 'GAMIDI', 'LAKSHMI SOWMIKA', 'GAMIDI LAKSHMI SOWMIKA', 'sowmikagamidi2004@gmail.com', '+918639995359', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1029, '69e9de583a1f05053bfed7b4', 'Siyona', 'Sebastian', 'Siyona Sebastian', 'siyonasebastian2001@gmail.com', '+917483439285', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1030, '69e9de4a3a1f05053bfed563', 'Shridhar', 'Kalasannavar', 'Shridhar Kalasannavar', 'sridharkalasannavar5@gmail.com', '+919482217316', 'active', '2026-07-07 05:03:44', '2026-07-07 05:03:44'),
(1031, '69e9de3f3a1f05053bfed31d', 'Sarthak', 'Shandilya', 'Sarthak Shandilya', 'sarthaksandilyakm@gmail.com', '+917320047161', 'active', '2026-07-07 05:03:45', '2026-07-07 05:03:45'),
(1032, '69e9de2f3a1f05053bfed0bc', 'SANGEETHA', 'Unknown', 'SANGEETHA Unknown', 'sangeethag3003@gmail.com', '+919148542677', 'active', '2026-07-07 05:03:45', '2026-07-07 05:03:45'),
(1033, '69e9de1b3a1f05053bfece64', 'Sai Shruti', 'Irigireddy', 'Sai Shruti Irigireddy', 'saishruti05@gmail.com', '+917727840307', 'active', '2026-07-07 05:03:45', '2026-07-07 05:03:45'),
(1034, '69e9de073a1f05053bfecc16', 'SAI', 'SATHWIK SAMUDRAM', 'SAI SATHWIK SAMUDRAM', 'saisathwik012@gmail.com', '+917013377564', 'active', '2026-07-07 05:03:45', '2026-07-07 05:03:45'),
(1035, '69e9ddf03a1f05053bfec9c4', 'Sahana', 'K R', 'Sahana K R', 'ramusahana008@gmail.com', '+919108361566', 'active', '2026-07-07 05:03:45', '2026-07-07 05:03:45'),
(1036, '69e9dddd3a1f05053bfec769', 'Rani', 'Dasar', 'Rani Dasar', 'ranidasar67@gmail.com', '+918971157892', 'active', '2026-07-07 05:03:45', '2026-07-07 05:03:45'),
(1037, '69e9ddcd3a1f05053bfec51a', 'Ramaiah', 'Unknown', 'Ramaiah Unknown', 'ramub7569@gmail.com', '+917569833959', 'active', '2026-07-07 05:03:45', '2026-07-07 05:03:45'),
(1038, '69e9ddbc3a1f05053bfec2d0', 'Ramapati', 'Tripathi', 'Ramapati Tripathi', 'tripathi.rp24@gmail.com', '+917376743432', 'active', '2026-07-07 05:03:45', '2026-07-07 05:03:45'),
(1039, '69e9ddab3a1f05053bfec07b', 'Rahul', 'Gogoi', 'Rahul Gogoi', 'gogoi.rahul.official@gmail.com', '+918761081284', 'active', '2026-07-07 05:03:45', '2026-07-07 05:03:45'),
(1040, '69e9dd8e3a1f05053bfebe21', 'Puneethy', 'Unknown', 'Puneethy Unknown', 'punithkondana123@gmail.com', '+918431873704', 'active', '2026-07-07 05:03:45', '2026-07-07 05:03:45'),
(1041, '69e9dd7a3a1f05053bfebbbd', 'Priyanshu', 'Singh', 'Priyanshu Singh', 'priyanshuds001@gmail.com', '+918982188518', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1042, '69e9dd643a1f05053bfeb4f7', 'Candidate', 'Unknown', 'Candidate Unknown', 'praveenkumarchalla20@gmail.com', '+919494583647', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1043, '69e9dd5a3a1f05053bfeb2a6', 'Prarthana', 'B K', 'Prarthana B K', 'prarthanabidergodu@gmail.com', '+917899419718', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1044, '69e9dd3f3a1f05053bfeb051', 'Pranav', 'Kumar Kashyap', 'Pranav Kumar Kashyap', 'pranavkumarkashyap@gmail.com', '+917620054375', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1045, '69e9dd113a1f05053bfeab94', 'Piyush', 'Barasker', 'Piyush Barasker', 'piyushbarasker11@gmail.com', '+918319912092', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1046, '69e9dd003a1f05053bfea94b', 'PIYUSH', 'AGARWAL', 'PIYUSH AGARWAL', 'piyushagr2.0@gmail.com', '+919559052074', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1047, '69e9dcf03a1f05053bfea6ff', 'Nikhil', 'Kumar Sahu', 'Nikhil Kumar Sahu', 'nikhilsahu1312@gmail.com', '+919556709942', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1048, '69e9dcdd3a1f05053bfea4a5', 'N', 'Dileep', 'N Dileep', 'dileepgowda2708@gmail.com', '+917013312278', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1049, '69e9dcc93a1f05053bfea251', 'JANNU', 'NAGA SRI HARSHITHA', 'JANNU NAGA SRI HARSHITHA', 'hariharshitha56@gmail.com', '+916300649154', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1050, '69e9dcbc3a1f05053bfea005', 'Muskan', 'Karodiya', 'Muskan Karodiya', 'muskankarodiya123@gmail.com', '+919575649622', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1051, '69e9dca23a1f05053bfe9db0', 'Muppudathi', 'Unknown', 'Muppudathi Unknown', 'muppudathi1410@gmail.com', '+918610133201', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1052, '69e9dc8b3a1f05053bfe9b5f', 'Mohak', 'Bhatia', 'Mohak Bhatia', 'bhatiamohak1702@gmail.com', '+917988715303', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1053, '69e9dc763a1f05053bfe990e', 'MITTE', 'SRAVANI', 'MITTE SRAVANI', '229x1a3271@gmail.com', '+919391629558', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1054, '69e9dc653a1f05053bfe96b5', 'MANJUNATH', 'Unknown', 'MANJUNATH Unknown', 'rishireddy11957@gmail.com', '+919353534792', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1055, '69e9dc543a1f05053bfe9465', 'LOKESH', 'MELLAKANTI', 'LOKESH MELLAKANTI', 'vasudevaya854@gmail.com', '+916309609554', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1056, '69e9dc433a1f05053bfe920e', 'Kumar', 'Saurav', 'Kumar Saurav', 'rkrsaurav14@gmail.com', '+918084041484', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1057, '69e9dc1d3a1f05053bfe8d60', 'ISUKAPALLI', 'SURYA BANGAR RAJU', 'ISUKAPALLI SURYA BANGAR RAJU', 'isukapallisurya9@gmail.com', '+917993991539', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1058, '69e9dc043a1f05053bfe8b06', 'HARSH', 'BANSAL', 'HARSH BANSAL', 'harshhb6@gmail.com', '+919899907180', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1059, '69e9dbee3a1f05053bfe88b3', 'Jeevana', 'Priya Gunta', 'Jeevana Priya Gunta', 'jeevanapriyagunta3014@gmail.com', '+917337400350', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1060, '69e9dbe23a1f05053bfe8664', 'Chinmay', 'Naik', 'Chinmay Naik', 'chinmaynaik211@gmail.com', '+918073805178', 'active', '2026-07-07 05:03:46', '2026-07-07 05:03:46'),
(1061, '69e9dbca3a1f05053bfe8409', 'CHAITHANYA', 'K V', 'CHAITHANYA K V', 'chaithanyavenkat@gmail.com', '+918660112461', 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1062, '69e9dbbc3a1f05053bfe81ad', 'CHAITALI', 'SONARE', 'CHAITALI SONARE', 'chaitalisonare2003@gmail.com', '+919179717689', 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1063, '69e9dbaa3a1f05053bfe7f58', 'Bhuvaneshwari', 'Badni', 'Bhuvaneshwari Badni', 'bhuvaneshwarikbadni@gmail.com', '+918431064305', 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1064, '69e9db9d3a1f05053bfe7d0f', 'BALAMURUGAN', 'S', 'BALAMURUGAN S', 'callbalamurugan2002@gmail.com', '+919500810424', 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1065, '69e9db8b3a1f05053bfe7abe', 'Balaji', 'Vinothkumar', 'Balaji Vinothkumar', 'balajivinothkumar.dev@gmail.com', '+919500547928', 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1066, '69e9db743a1f05053bfe786a', 'Anusha', 'K', 'Anusha K', 'anushagowda1815@gmail.com', '+919535228063', 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1067, '69e9db593a1f05053bfe7603', 'ANKITA', 'SAHU', 'ANKITA SAHU', 'ankitasahu360@gmail.com', '+919340333563', 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1068, '69e9db4d3a1f05053bfe73ab', 'Abhinav', 'Mishra', 'Abhinav Mishra', 'abmishra.alld@gmail.com', '+916392990785', 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1069, '69e9d99b3a1f05053bfe2ee1', 'sanket', 'dwivedi', 'sanket dwivedi', 'sanketdwevedi54@gmail.com', NULL, 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1070, '69e98e213a1f05053bfc31de', 'samael', 'camargo', 'samael camargo', 'sama.mostasa123@gmail.com', NULL, 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1071, '69e8e5653a1f05053bfc1d23', 'Bhargavi', 'B', 'Bhargavi B', 'bhargaviarya3@gmail.com', '8660938770', 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1072, '69e8c6aa3a1f05053bfc1296', 'Anant', 'Mehrotra', 'Anant Mehrotra', 'mehrotraanant10@gmail.com', NULL, 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1073, '69e8bf5c3a1f05053bfbe306', 'Ayush', 'Bachan', 'Ayush Bachan', 'bachanayush3@gmail.com', '+917014606986', 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1074, '69e8b8243a1f05053bfb7d84', 'Vyomesh', 'Singh', 'Vyomesh Singh', 'singhvyom.99@gmail.com', '+917355667807', 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1075, '69e8b80e3a1f05053bfb76ad', 'Candidate', 'Unknown', 'Candidate Unknown', 'veshugangrade18@gmail.com', '+917049537942', 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1076, '69e8b8053a1f05053bfb7468', 'Vaishali', 'Sharma', 'Vaishali Sharma', 'vaishalisharma9005@gmail.com', '+916395231928', 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1077, '69e8b7f93a1f05053bfb7215', 'TUSHAR', 'SRIVASTAVA', 'TUSHAR SRIVASTAVA', 'tushar070801@gmail.com', '+918707413158', 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1078, '69e8b7e23a1f05053bfb6fc4', 'Syed', 'Imran R', 'Syed Imran R', 'rsyedimran27@gmail.com', '+919846723027', 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1079, '69e8b7cf3a1f05053bfb6d6c', 'Sushree', 'Pani', 'Sushree Pani', 'sushree716@gmail.com', '+918117057007', 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1080, '69e8b7ba3a1f05053bfb6aa7', 'Shibashis', 'Dey', 'Shibashis Dey', 'shibashis.dey5@gmail.com', '+918017447627', 'active', '2026-07-07 05:03:47', '2026-07-07 05:03:47'),
(1081, '69e8b7a83a1f05053bfb6850', 'Saurav', 'Dhauria', 'Saurav Dhauria', 'dhauria.33@gmail.com', '+918789594886', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1082, '69e8b7913a1f05053bfb65d5', 'SATYAGOPAL', 'DEY', 'SATYAGOPAL DEY', 'satyagopaldey11@gmail.com', '+918984933652', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1083, '69e8b7863a1f05053bfb638b', 'SANDEEP', 'TOMAR', 'SANDEEP TOMAR', 'tsandeep996@gmail.com', '+917049840621', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1084, '69e8b7793a1f05053bfb6129', 'Sabyasachi', 'Ghosh', 'Sabyasachi Ghosh', 'sabyasachighosh008@gmail.com', '+916371045804', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1085, '69e8b7683a1f05053bfb5edf', 'PRASHANT', 'Unknown', 'PRASHANT Unknown', 'prashantguttedar2322@gmail.com', '+917795170672', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1086, '69e8b75b3a1f05053bfb5c8f', 'Poojith', 'Gubbala', 'Poojith Gubbala', 'poojithsai764@gmail.com', '+917337312699', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1087, '69e8b7473a1f05053bfb5a34', 'Sarayu', 'Polepalli', 'Sarayu Polepalli', 'polepallisarayu@gmail.com', '+919381130650', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1088, '69e8b7373a1f05053bfb57dc', 'Pavitra', 'Patrimath', 'Pavitra Patrimath', 'pavitrapatrimath7@gmail.com', '+916366280387', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1089, '69e8b72b3a1f05053bfb558c', 'Parinitha', 'M', 'Parinitha M', 'parinitha.mohankumar@gmail.com', '+918971517442', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1090, '69e8b71e3a1f05053bfb5344', 'Nikhil', 'Paga', 'Nikhil Paga', 'nikhilpaga8@gmail.com', '+919901627911', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1091, '69e8b70e3a1f05053bfb4c6b', 'Candidate', 'Unknown', 'Candidate Unknown', 'dodwadmuktha@gmail.com', '+918762773163', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1092, '69e8b7023a1f05053bfb4a26', 'M E', 'IRFAN BASHA', 'M E IRFAN BASHA', 'irfanbasha8019@gmail.com', '+917893079790', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1093, '69e8b6f43a1f05053bfb47cb', 'Saikalyan', 'Labhishetty', 'Saikalyan Labhishetty', 'labhishettysaikalyan@gmail.com', '+919182445012', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1094, '69e8b6e03a1f05053bfb4579', 'Kunal', 'Kushalappa P N', 'Kunal Kushalappa P N', 'kunalkushalappa24@gmail.com', '+918317473329', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1095, '69e8b6d53a1f05053bfb432d', 'Kola', 'Raveendra', 'Kola Raveendra', 'kolaraveendra66@gmail.com', '+919392342155', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1096, '69e8b6b23a1f05053bfb3e7b', 'Ishan', 'Chinchghare', 'Ishan Chinchghare', 'ishanchinchghare@gmail.com', '+919356948199', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1097, '69e8b68c3a1f05053bfb39d7', 'Harshith', 'Prathi', 'Harshith Prathi', 'harshithyker43@gmail.com', '+918096234717', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1098, '69e8b67a3a1f05053bfb3776', 'HARSHITHA', 'K', 'HARSHITHA K', 'krishnappaharshitha17@gmail.com', '+918971342669', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1099, '69e8b6613a1f05053bfb351e', 'Vaishnavi', 'Gonuru', 'Vaishnavi Gonuru', 'vaishnavisaikrishna18@gmail.com', '+919490551843', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1100, '69e8b6543a1f05053bfb31f9', 'Gayatri', 'Gunjakar', 'Gayatri Gunjakar', 'gayatrigunjkar2304@gmail.com', '+918669080169', 'active', '2026-07-07 05:03:48', '2026-07-07 05:03:48'),
(1101, '69e8b64a3a1f05053bfb2fb5', 'Durkadevi', 'Selvaraj', 'Durkadevi Selvaraj', 'durkadevis13@gmail.com', '+919080330579', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1102, '69e8b63a3a1f05053bfb2d60', 'DIVYA', 'RANI', 'DIVYA RANI', 'divyarani9107@gmail.com', '+916360854875', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1103, '69e8b6203a1f05053bfb2b13', 'Dhiraj', 'Darakhe', 'Dhiraj Darakhe', 'dhirajdarakhe03@gmail.com', '+917218724337', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1104, '69e8b60d3a1f05053bfb28ba', 'Dharsan', 'V', 'Dharsan V', 'dharsanvenkatachalam2001@gmail.com', '+918220181138', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1105, '69e8b5ff3a1f05053bfb2669', 'Prakash', 'Unknown', 'Prakash Unknown', 'dharavathprakash22@gmail.com', '+919390052076', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1106, '69e8b5f23a1f05053bfb2415', 'Chinmay', 'Bhat', 'Chinmay Bhat', 'chinmayc200@gmail.com', '+919448572938', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1107, '69e8b5e13a1f05053bfb21a0', 'CHANDRA', 'SHEKAR BM', 'CHANDRA SHEKAR BM', 'chandrashekhar90084@gmail.com', '+919008412498', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1108, '69e8b5d43a1f05053bfb1f59', 'Bhoomi', 'Verma', 'Bhoomi Verma', 'bhoomiv2020@gmail.com', NULL, 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1109, '69e8b5c53a1f05053bfb1d0d', 'BENAKARAJ', 'GOWDA S U', 'BENAKARAJ GOWDA S U', 'benakarajgowdasu@gmail.com', '+918123677627', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1110, '69e8b5b73a1f05053bfb1abc', 'Dinesh', 'B', 'Dinesh B', 'dinesh1850017@gqmail.com', '+919445296093', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1111, '69e8b5a63a1f05053bfb186e', 'ANUPAMA', 'G A', 'ANUPAMA G A', 'harshithaanupama0@gmail.com', '+916360593247', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1112, '69e8b5953a1f05053bfb161d', 'Anitha', 'Bavirisetti', 'Anitha Bavirisetti', 'anithabavirisetti2001@gmail.com', '+917993541490', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1113, '69e8b58b3a1f05053bfb13c8', 'Ananya', 'R', 'Ananya R', 'ananyaaradya02@gmail.com', '+917795921520', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1114, '69e8b57b3a1f05053bfb1174', 'ADARSH', 'UGARE', 'ADARSH UGARE', 'adarshugare@gmail.com', '+918197321950', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1115, '69e8b56d3a1f05053bfb0f2a', 'ABUBAKKAR', 'SIDDEEQ', 'ABUBAKKAR SIDDEEQ', 'siddiqkaithodu007@gmail.com', '+918606732122', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1116, '69e8b55d3a1f05053bfb0cdc', 'Abhilash', 'Konda', 'Abhilash Konda', 'abhilashkonda11@gmail.com', '+16303871757', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1117, '69e8b54c3a1f05053bfb0a8e', 'Aaron', 'Gurram', 'Aaron Gurram', 'aarongurram21@gmail.com', '+916304550660', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1118, '69e8b53b3a1f05053bfb0841', 'Aakash', 'RB', 'Aakash RB', 'aakash.revankaar@gmail.com', NULL, 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1119, '69e8afd43a1f05053bfb04c1', 'Venkata', 'Haranadh Kummari', 'Venkata Haranadh Kummari', 'haranadhhari123456@email.com', '+916309349225', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1120, '69e8afbf3a1f05053bfb0256', 'VARSHITH', 'THANUKU', 'VARSHITH THANUKU', 'varshiththanuku@gmail.com', '+16301910596', 'active', '2026-07-07 05:03:49', '2026-07-07 05:03:49'),
(1121, '69e8afb03a1f05053bfafffb', 'MEENAN', 'VADDEPALLY', 'MEENAN VADDEPALLY', 'vaddepallymeenan@gmail.com', '+916305781534', 'active', '2026-07-07 05:03:50', '2026-07-07 05:03:50'),
(1122, '69e8afa13a1f05053bfafda7', 'TEJUS', 'Unknown', 'TEJUS Unknown', 'tejus20028@gmail.com', '+918105641164', 'active', '2026-07-07 05:03:50', '2026-07-07 05:03:50'),
(1123, '69e8af953a1f05053bfafb63', 'Tanniru', 'Durga Pavan', 'Tanniru Durga Pavan', 'pa1tanniru1999@gmail.com', '+917330810575', 'active', '2026-07-07 05:03:50', '2026-07-07 05:03:50'),
(1124, '69e8af833a1f05053bfaf905', 'SHUBHAM', 'SINGH', 'SHUBHAM SINGH', 'shubhamsingh5662@gmail.com', '+918470887235', 'active', '2026-07-07 05:03:50', '2026-07-07 05:03:50'),
(1125, '69e8af673a1f05053bfaf6b1', 'Shaik', 'Firdose', 'Shaik Firdose', 'shaikfirdose0007@gmail.com', '+919398519527', 'active', '2026-07-07 05:03:50', '2026-07-07 05:03:50'),
(1126, '69e8af513a1f05053bfaf456', 'Sethupathi', 'S', 'Sethupathi S', 'sethupathi.developer@gmail.com', '+916382147575', 'active', '2026-07-07 05:03:50', '2026-07-07 05:03:50'),
(1127, '69e8af2e3a1f05053bfaf0bb', 'Satyam', 'Kumar', 'Satyam Kumar', 'skoff1302@gmail.com', '+916200808292', 'active', '2026-07-07 05:03:50', '2026-07-07 05:03:50'),
(1128, '69e8af1b3a1f05053bfaee58', 'SATISH', 'DAS', 'SATISH DAS', 'dasskumar7909@gmail.com', '+919801956353', 'active', '2026-07-07 05:03:50', '2026-07-07 05:03:50'),
(1129, '69e8af0a3a1f05053bfaec04', 'Saransh', 'Singh', 'Saransh Singh', 'saransh2009singh@gmail.com', '+917880811831', 'active', '2026-07-07 05:03:50', '2026-07-07 05:03:50'),
(1130, '69e8aef93a1f05053bfae9a3', 'Sanchit', 'Kathpalia', 'Sanchit Kathpalia', 'sanchitkhthpalia@gmail.com', '+919811015181', 'active', '2026-07-07 05:03:50', '2026-07-07 05:03:50'),
(1131, '69e8aee63a1f05053bfae730', 'R.', 'Chitrashree', 'R. Chitrashree', 'chitrashree713@gmail.com', '+919916551662', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1132, '69e8aed13a1f05053bfae4b6', 'Ramya', 'kolli', 'Ramya kolli', 'ramyakolli06@gmail.com', '+917670985327', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1133, '69e8aec63a1f05053bfae25d', 'RAMESH', 'KANNAN G', 'RAMESH KANNAN G', 'rameshkannan8178@gmail.com', '+919500755440', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1134, '69e8aeba3a1f05053bfae00d', 'Priyadharshini', 'T', 'Priyadharshini T', 't.priyadharshini1995@gmail.com', '+919597585393', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1135, '69e8aea43a1f05053bfadda9', 'Pranjal', 'Kumari', 'Pranjal Kumari', 'pranjalk195@gmail.com', '+917257858441', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1136, '69e8ae7e3a1f05053bfad9f6', 'Nithin', 'Y M', 'Nithin Y M', 'nithinym34@gmail.com', '+918867241603', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1137, '69e8ae6d3a1f05053bfad7a5', 'Nithin', 'Kurra', 'Nithin Kurra', 'nithinkurra7803@gmail.com', '+918099697134', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1138, '69e8ae443a1f05053bfad51f', 'Nibedita', 'Bala', 'Nibedita Bala', 'nibeditabala2000@gmail.com', '+918144776731', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1139, '69e8ae2f3a1f05053bfad2b6', 'Nandhagopal', 'M', 'Nandhagopal M', 'marimuthunandhagopal@gmail.com', '+919994974546', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1140, '69e8ae133a1f05053bfad037', 'Nandan', 'Unknown', 'Nandan Unknown', 'nandankundapura777@gmail.com', '+916363389689', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1141, '69e8adeb3a1f05053bfacb63', 'Monisha', 'Selvam', 'Monisha Selvam', 'monishaperl18@gmail.com', '+919360127182', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1142, '69e8add03a1f05053bfac901', 'Mohith', 'Voorandoori', 'Mohith Voorandoori', 'voorandoorimohith@gmail.com', '+919390031471', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1143, '69e8ada63a1f05053bfac664', 'Mohit', 'Bisaria', 'Mohit Bisaria', 'mohitbisaria30@gmail.com', '+918957164413', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1144, '69e8ad923a1f05053bfac40c', 'Md Abdul Rahman', 'Ali S', 'Md Abdul Rahman Ali S', 'smdarahman55@gmail.com', '+917396879893', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1145, '69e8ad7e3a1f05053bfac1a9', 'MANSHI', 'RAJ', 'MANSHI RAJ', 'mahiraj172002@gmail.com', '+918858006151', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51');
INSERT INTO `students` (`id`, `external_id`, `first_name`, `last_name`, `full_name`, `email`, `phone_number`, `status`, `created_at`, `updated_at`) VALUES
(1146, '69e8ad653a1f05053bfabf2f', 'Kabita', 'Kumari', 'Kabita Kumari', 'kabita.1822000@gmail.com', '+918264892349', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1147, '69e8ad413a1f05053bfaba75', 'HRITIK', 'SINGH PAL', 'HRITIK SINGH PAL', 'hritikpal48@gmail.com', '+918126281410', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1148, '69e8ad2d3a1f05053bfab809', 'HITHASHREE', 'H R', 'HITHASHREE H R', 'hithashreehrhithashreehr@gmail.com', '+917975972567', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1149, '69e8ad213a1f05053bfab5af', 'Guruprasad', 'Patil', 'Guruprasad Patil', 'patilguruprasad45@gmail.com', '+919731325783', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1150, '69e8ad183a1f05053bfab35b', 'Gowtham', 'B', 'Gowtham B', 'gouthambraj66@gmail.com', '+918792179383', 'active', '2026-07-07 05:03:51', '2026-07-07 05:03:51'),
(1151, '69e8ad063a1f05053bfab10d', 'GAYATRI', 'SHINDE', 'GAYATRI SHINDE', 'shindegs4976@gmail.com', '+918792459540', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1152, '69e8acf33a1f05053bfaaeb8', 'Mounika', 'Gadde', 'Mounika Gadde', 'mounigadde30@gmail.com', '+918985941207', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1153, '69e8acda3a1f05053bfaac69', 'KENGANA', 'DIVYA TEJA', 'KENGANA DIVYA TEJA', 'divyatejasivala@gmail.com', '+917794811637', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1154, '69e8accd3a1f05053bfaaa19', 'DHANUSH', 'M', 'DHANUSH M', 'dhanushmaranii@gmail.com', '+918884730739', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1155, '69e8acb53a1f05053bfaa7cc', 'Bhavadharshini', 'Veeramuthu', 'Bhavadharshini Veeramuthu', 'vvbhavadharshini@gmail.com', '+919360355187', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1156, '69e8aca23a1f05053bfaa56f', 'Bhanu', 'Prakash', 'Bhanu Prakash', 'bhanu.prakash.build@gmail.com', '+917369810613', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1157, '69e8ac8d3a1f05053bfaa328', 'Aditya', 'Ram', 'Aditya Ram', 'adityarambachina2@gmail.com', '+919391285507', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1158, '69e8ac7c3a1f05053bfaa0bc', 'Ayush', 'Chute', 'Ayush Chute', 'chuteayush23@gmail.com', '+919371000193', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1159, '69e8ac613a1f05053bfa9e6b', 'Anurag', 'Thakur', 'Anurag Thakur', 'anuragthakur383@gmail.com', '+918668592139', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1160, '69e8ac4d3a1f05053bfa9c11', 'Anita', 'Kumari', 'Anita Kumari', 'anita.m.kumari546@gmail.com', '+919155859635', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1161, '69e8ac373a1f05053bfa99c0', 'ANIRUTH', 'SHRIRAM', 'ANIRUTH SHRIRAM', 'm.aniruthshriram2000@gmail.com', '+918667414995', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1162, '69e8ac293a1f05053bfa977e', 'Akshay', 'Rahangdale', 'Akshay Rahangdale', 'aksrahangdale@gmail.com', '+919845834242', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1163, '69e8ac173a1f05053bfa9518', 'ADITYA', 'KUMAR', 'ADITYA KUMAR', 'aditya0112kumar@gmail.com', '+918797099308', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1164, '69e8ac063a1f05053bfa92be', 'ABHINAV', 'KUMAR', 'ABHINAV KUMAR', 'abhinavkr2505@gmail.com', '+919304069450', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1165, '69e886d6c53d28866dc4f747', 'SaiKiran', 'Vankudoth', 'SaiKiran Vankudoth', 'vankudothsaikiran1@gmail.com', '+916304820428', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1166, '69e886cac53d28866dc4f502', 'VAISHNAVI', 'LAKHARA', 'VAISHNAVI LAKHARA', 'vishu.lakhara@gmail.com', '+916367916678', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1167, '69e886bfc53d28866dc4f2c1', 'THUMULURI', 'USHA', 'THUMULURI USHA', 'thumuluriusha@gmail.com', '+917036581556', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1168, '69e886b3c53d28866dc4f059', 'ANIL', 'KUMAR', 'ANIL KUMAR', 'tangellakumar77@gmail.com', '+917730909980', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1169, '69e8869cc53d28866dc4edfb', 'Talupula', 'Jahnavi', 'Talupula Jahnavi', 'jahnavitalupula3004@gmail.com', '+917780711255', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1170, '69e8868ac53d28866dc4e743', 'Candidate', 'Unknown', 'Candidate Unknown', 'sushmaprakasa25@gmail.com', '+919182813493', 'active', '2026-07-07 05:03:52', '2026-07-07 05:03:52'),
(1171, '69e88685c53d28866dc4e4f1', 'Sourav', 'Prusti', 'Sourav Prusti', 'souravprusti6@gmail.com', '+919337036139', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1172, '69e88668c53d28866dc4e2a0', 'Sneha', 'Kirtikumar Kamble', 'Sneha Kirtikumar Kamble', 'ksnehakirti123@gmail.com', '+917038841339', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1173, '69e88653c53d28866dc4e050', 'Siddhi', 'Suman', 'Siddhi Suman', 'siddhisuman112005@gmail.com', '+919993540057', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1174, '69e88640c53d28866dc4ddf8', 'Shreya', 'Waghamode', 'Shreya Waghamode', 'shreyawaghamode1214@gmail.com', '+917219715433', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1175, '69e8862bc53d28866dc4dba4', 'Shreelakshmi', 'DM', 'Shreelakshmi DM', 'dmshreelakshmi@gmail.com', '+919113247295', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1176, '69e8861fc53d28866dc4d960', 'Sapna', 'Pandey', 'Sapna Pandey', 'sumansapna2001@gmail.com', '+919082343802', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1177, '69e88609c53d28866dc4d6f2', 'SAKTHIVEL', 'Unknown', 'SAKTHIVEL Unknown', 'sakthivel24498@gmail.com', '+916380350108', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1178, '69e885f0c53d28866dc4d4a9', 'Sai', 'Swetha Mathamsetti', 'Sai Swetha Mathamsetti', 'saiswethamathamsetti@gmail.com', '+917036437166', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1179, '69e885dfc53d28866dc4d25b', 'Sachin', 'Dongare', 'Sachin Dongare', 'sachindonagare131@gmail.com', '+918956762769', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1180, '69e885c9c53d28866dc4cff6', 'Rutvik', 'Sonawane', 'Rutvik Sonawane', 'rutviksonawane1363@gmail.com', '+918208767912', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1181, '69e885b7c53d28866dc4cdb0', 'Rajesh', 'Nayak', 'Rajesh Nayak', 'rajeshanayak30@gmail.com', '+917675550379', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1182, '69e885aec53d28866dc4cb6c', 'Pritiranjan', 'Jena', 'Pritiranjan Jena', 'rjenapritiranjan957@gmail.com', '+919337871792', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1183, '69e8846fc53d28866dc4c8db', 'Pratima', 'Deshpande', 'Pratima Deshpande', 'prathimadeshpande14@gmail.com', '+916361196313', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1184, '69e88460c53d28866dc4c680', 'POORNIMA', 'R J', 'POORNIMA R J', 'poornima.jayaraj01@gmail.com', '+919188543348', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1185, '69e88452c53d28866dc4c43a', 'Nagaratna', 'Patil', 'Nagaratna Patil', 'patilnagaratna11@gmail.com', '+918792732274', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1186, '69e88446c53d28866dc4c1e6', 'Muneeb', 'Firdous Dar', 'Muneeb Firdous Dar', 'muneebfirdous51@gmail.com', '+916006444878', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1187, '69e88407c53d28866dc4bae9', 'Manoj', 'Srirapu', 'Manoj Srirapu', 'manojkumar.srirapu@gmail.com', '+918074245686', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1188, '69e883f1c53d28866dc4b89a', 'Madhusudhana', 'Naidu', 'Madhusudhana Naidu', 'mnaidu1025@gmail.com', '+919321451547', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1189, '69e883d3c53d28866dc4b3f9', 'Jyothsna', 'Mamidi', 'Jyothsna Mamidi', 'jyothsna2125@gmail.com', '+91917207289313', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1190, '69e883bec53d28866dc4b1a1', 'Kunal', 'Singh', 'Kunal Singh', 'kunalsinghguitar30@gmail.com', '+916287858883', 'active', '2026-07-07 05:03:53', '2026-07-07 05:03:53'),
(1191, '69e883b4c53d28866dc4af55', 'KRISHNA', 'KUMAR M', 'KRISHNA KUMAR M', 'krishnakumarcoder@gmail.com', '+919786075085', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1192, '69e8839fc53d28866dc4ad04', 'K', 'Malathi', 'K Malathi', 'kmalathi3002@gmail.com', '+916362549078', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1193, '69e88390c53d28866dc4aaac', 'KHYATI', 'NANDHA', 'KHYATI NANDHA', 'khyatinandha026@gmail.com', '+918329472540', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1194, '69e8837cc53d28866dc4a84c', 'Karthik', 'K', 'Karthik K', 'kaarthiii1112@gmail.com', '+919035377301', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1195, '69e8836fc53d28866dc4a601', 'Ipsita', 'Priyadarshini', 'Ipsita Priyadarshini', 'ipsitapuja408@gmail.com', '+918114963034', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1196, '69e8835dc53d28866dc4a3af', 'HARISH', 'TIPPANNAVAR', 'HARISH TIPPANNAVAR', 'tippannavarharish@gmail.com', '+919620095296', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1197, '69e8834ac53d28866dc4a151', 'HARIKA', 'Unknown', 'HARIKA Unknown', 'harikabathini758@gmail.com', '+918977240324', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1198, '69e8833dc53d28866dc49efa', 'CHILAKAPATI', 'GURU HARISH', 'CHILAKAPATI GURU HARISH', 'harishchilakapati3@gmail.com', '+919347488237', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1199, '69e88321c53d28866dc49a64', 'Chhavi', 'Lal Prajapat', 'Chhavi Lal Prajapat', 'chhavilalpraja@gmail.com', '+916261820047', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1200, '69e88305c53d28866dc49814', 'Businayani', 'Sowmya', 'Businayani Sowmya', 'sowmyabusinayani2717@gmail.com', '+919618066970', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1201, '69e882f3c53d28866dc495c5', 'Bhumika', 'Jagadeesh', 'Bhumika Jagadeesh', 'bhumikajagadeesh9@gmail.com', '+918073357718', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1202, '69e882dac53d28866dc49372', 'Atharva', 'Tandale', 'Atharva Tandale', 'tandaleatharva91203@gmail.com', '+918698286950', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1203, '69e882c9c53d28866dc4911c', 'ARUN', 'S P', 'ARUN S P', 'arunsp0627@gmail.com', '+919113834174', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1204, '69e882b3c53d28866dc48ecd', 'ANUSHKA', 'PANDEY', 'ANUSHKA PANDEY', 'pandeyanushka2000@gmail.com', '+918709349702', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1205, '69e8829bc53d28866dc48c6f', 'ANULEKHASAI', 'Unknown', 'ANULEKHASAI Unknown', 'anulekhasaia@gmail.com', '+919014922541', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1206, '69e8828bc53d28866dc48a1f', 'Anuj', 'Kumar', 'Anuj Kumar', 'anujkr.cgc@gmail.com', '+919934456724', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1207, '69e8827bc53d28866dc487d5', 'Anshul', 'Gupta', 'Anshul Gupta', 'anshul2606gupta@gmail.com', '+919462719609', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1208, '69e8825cc53d28866dc48583', 'AMIT', 'KUMAR JANGIR', 'AMIT KUMAR JANGIR', 'amiteng5472@gmail.com', '+919602947279', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1209, '69e8823bc53d28866dc481cf', 'Aditya', 'S N', 'Aditya S N', 'adityagowda31@gmail.com', '+917259447717', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1210, '69e875bbc53d28866dc38888', 'Mahendra', 'Suvarnaganti', 'Mahendra Suvarnaganti', 'mahendraleo28@gmail.com', '+917306306828', 'active', '2026-07-07 05:03:54', '2026-07-07 05:03:54'),
(1211, '69e875a8c53d28866dc3862f', 'SHAIK', 'REENA', 'SHAIK REENA', 'reenazoyashaik@gmail.com', '+917093094753', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1212, '69e87596c53d28866dc383d6', 'Sejal', 'Gupta', 'Sejal Gupta', 'sejalg96@gmail.com', '+918369520468', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1213, '69e87583c53d28866dc38185', 'Bhagyashri', 'Kadam', 'Bhagyashri Kadam', 'bhagyashridjadhav72@gmail.com', '+918799948843', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1214, '69e87578c53d28866dc37f39', 'Yukti', 'Grover', 'Yukti Grover', 'yuktigroverr@gmail.com', '+917056446372', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1215, '69e8756bc53d28866dc37cde', 'Swarnalatha', 'Subramaniam', 'Swarnalatha Subramaniam', 'swarnalathasubramaniam@gmail.com', '+916383520684', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1216, '69e87550c53d28866dc37849', 'Vaibhav', 'Bokade', 'Vaibhav Bokade', 'vaibhavbokade844@gmail.com', '+917020555784', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1217, '69e87543c53d28866dc37608', 'Sravani', 'Mallula', 'Sravani Mallula', 'sravanimallula5@gmail.com', '+919542455561', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1218, '69e87536c53d28866dc373a0', 'Prakash', 'Yadav', 'Prakash Yadav', 'prakashyadav512@gmail.com', '+918655762755', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1219, '69e87524c53d28866dc3715c', 'Rohan', 'Kate', 'Rohan Kate', 'rohankate48@gmail.com', '+918087430831', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1220, '69e87519c53d28866dc36f11', 'Mehul', 'Unknown', 'Mehul Unknown', 'mehulkhanna1999@gmail.com', '+919138177715', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1221, '69e874f5c53d28866dc36cb0', 'ANURAG', 'PATEL', 'ANURAG PATEL', 'patelanuragkumar79@gmail.com', '+918319114834', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1222, '69e874e3c53d28866dc36a60', 'Sudhir', 'Kumar', 'Sudhir Kumar', 'sudhirkumar1211998@gmail.com', '+918809916688', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1223, '69e874c1c53d28866dc367fe', 'PRATEEK', 'KOUL', 'PRATEEK KOUL', 'prateekkoul13@gmail.com', '+918899100708', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1224, '69e874afc53d28866dc365ae', 'MAHESH', 'POTDAR', 'MAHESH POTDAR', 'mmaheshpodtar@gmail.com', '+917507060475', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1225, '69e8749dc53d28866dc36356', 'Vikram', 'Singhal', 'Vikram Singhal', 'vsinghal277@gmail.com', '+916005023123', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1226, '69e87480c53d28866dc36104', 'SUMAN', 'Unknown', 'SUMAN Unknown', 'itz.suman.dev@gmail.com', '+917986860278', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1227, '69e8745ac53d28866dc35c5c', 'Kamal', 'Jha', 'Kamal Jha', 'kamaljha2407@gmail.com', '+919540264237', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1228, '69e87445c53d28866dc359e7', 'Sneha', 'S.', 'Sneha S.', 'nehaaa4720@gmail.com', '+919049523911', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1229, '69e87434c53d28866dc3579c', 'Rohit', 'Unknown', 'Rohit Unknown', 'rohitrajesh5080@gmail.com', '+919961873352', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1230, '69e87423c53d28866dc3553e', 'PRASHANT', 'GANI', 'PRASHANT GANI', 'prashantgani005@gmail.com', '+917019855397', 'active', '2026-07-07 05:03:55', '2026-07-07 05:03:55'),
(1231, '69e87409c53d28866dc351b0', 'PRATHAMESH', 'VASEKAR', 'PRATHAMESH VASEKAR', 'prathameshvasekar2@gmail.com', '+919518975193', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1232, '69e873f8c53d28866dc34f4f', 'ADITI', 'SONI', 'ADITI SONI', 'aditisoni1903@gmail.com', '+918964988217', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1233, '69e873d2c53d28866dc2ed33', 'Soubhagya', 'Ranjan Samal', 'Soubhagya Ranjan Samal', 'samalsoubhagya1997@gmail.com', '+917008861896', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1234, '69e873b8c53d28866dc2d21d', 'Shreesh', 'Arya', 'Shreesh Arya', 'shreesharya20@gmail.com', '+919987362295', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1235, '69e873a4c53d28866dc2cfc1', 'Pravin', 'Deore', 'Pravin Deore', 'pravindeore04@gmail.com', '+918805842139', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1236, '69e87392c53d28866dc2cd7a', 'Dharamvir', 'Singh', 'Dharamvir Singh', 'singhdharamm1@gmail.com', '+917699099116', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1237, '69e8737cc53d28866dc2cb35', 'Yogita', 'Sharma', 'Yogita Sharma', 'connect2yogita2001@gmail.com', '+918448216866', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1238, '69e87369c53d28866dc2c8e6', 'Anirban', 'Ta', 'Anirban Ta', 'taanirban30@gmail.com', '+916294366524', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1239, '69e87346c53d28866dc2c67d', 'Anshuman', 'Vatts', 'Anshuman Vatts', 'vattsanshuman30@gmail.com', '+917991122367', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1240, '69e8732ec53d28866dc2c42b', 'Naveena', 'Apthiri', 'Naveena Apthiri', 'naveenaapthiri711@gmail.com', '+917995756272', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1241, '69e87312c53d28866dc2bfee', 'Yuvasri', 'KB', 'Yuvasri KB', 'yuvasribalamurugan@gmail.com', '+918838117392', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1242, '69e87304c53d28866dc2bda8', 'Deepchand', 'Unknown', 'Deepchand Unknown', 'writetodeepchand@gmail.com', '+919050343911', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1243, '69e872fdc53d28866dc2bb68', 'VIDHUSHINI', 'Unknown', 'VIDHUSHINI Unknown', 'vidhushininarayanan@gmail.com', '+916385857255', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1244, '69e872eac53d28866dc2b90a', 'Tanushree', 'Miskin', 'Tanushree Miskin', 'tanushreemiskin@gmail.com', '+918095515572', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1245, '69e872e8c53d28866dc2b6ce', 'Manjunath', 'Unknown', 'Manjunath Unknown', 'pmanjunath486@gmail.com', '+919535447770', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1246, '69e872d6c53d28866dc2b475', 'Swastik', 'Unknown', 'Swastik Unknown', 'raiswastik599@gmail.com', '+917665514490', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1247, '69e872c9c53d28866dc2b21c', 'AVINASH', 'KUMAR', 'AVINASH KUMAR', 'avinashrishav123@gmail.com', '+917979045634', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1248, '69e872c1c53d28866dc2afdc', 'Sushmitha', 'H S', 'Sushmitha H S', 'sushmitha.hs2001@gmail.com', '+919916569718', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1249, '69e872adc53d28866dc2ad89', 'Biswaranjan', 'Sahoo', 'Biswaranjan Sahoo', 'brsahoo1414@gmail.com', '+918249502729', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1250, '69e872a9c53d28866dc2ab42', 'Sujinitha', 'S', 'Sujinitha S', 'sujinithasundaram@gmail.com', '+919342672964', 'active', '2026-07-07 05:03:56', '2026-07-07 05:03:56'),
(1251, '69e87297c53d28866dc2a8f8', 'ABHIJITH', 'RAJ', 'ABHIJITH RAJ', 'abhijith4595@gmail.com', '+918111903675', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1252, '69e8728fc53d28866dc2a6b7', 'Subhrajit', 'Sen', 'Subhrajit Sen', 'subhrajitsen080@gmail.com', '+917002250294', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1253, '69e87283c53d28866dc2a46a', 'SMRUTI', 'RANJAN BISWAL', 'SMRUTI RANJAN BISWAL', 'smrutiranjanb781@gmail.com', '+917436920107', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1254, '69e87281c53d28866dc2a227', 'SOMESHWARA', 'P H', 'SOMESHWARA P H', 'someshwarph@gmail.com', '+916366698281', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1255, '69e8726fc53d28866dc29e48', 'Sheik', 'Husain', 'Sheik Husain', 'developer.sheikhusain@gmail.com', '+916383199414', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1256, '69e8726ec53d28866dc29da6', 'Balwir', 'Soni', 'Balwir Soni', 'sonybalwir@yahoo.com', '+919096947665', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1257, '69e87255c53d28866dc29b33', 'SHANKRAMMA', 'BHAGASHETTI', 'SHANKRAMMA BHAGASHETTI', 'shankrammabhagashetti7377@gmail.com', '+917975044689', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1258, '69e87239c53d28866dc29693', 'SHAKAMBHARI', 'Unknown', 'SHAKAMBHARI Unknown', 'shakambharihitft36@gmail.com', '+917979083315', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1259, '69e87235c53d28866dc29454', 'Jagdish', 'Bornare', 'Jagdish Bornare', 'jagdishbornare0408@gmail.com', '+917387961084', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1260, '69e8722cc53d28866dc29203', 'Satyabrata', 'Prusty', 'Satyabrata Prusty', 'satyabrataprusty23@gmail.com', '+916371684898', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1261, '69e87218c53d28866dc28f9d', 'Sanjay', 'S', 'Sanjay S', 'sanjayshanthraju123@gmail.com', '+917483695676', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1262, '69e87216c53d28866dc28d60', 'Chirag', 'Ambwani', 'Chirag Ambwani', 'cambwani22@gmail.com', '+916263193707', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1263, '69e87205c53d28866dc28a98', 'Sai', 'Ganesh Pinnam', 'Sai Ganesh Pinnam', 'saiganeshpinnam41@gmail.com', '+916305043191', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1264, '69e87200c53d28866dc28856', 'Aniket', 'Mahure', 'Aniket Mahure', 'ani.mahure@gmail.com', '+918459881944', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1265, '69e871efc53d28866dc285d7', 'Sahil', 'Bhoite', 'Sahil Bhoite', 'work.sahilbhoite@gmail.com', '+919673832433', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1266, '69e871e5c53d28866dc28389', 'Darshan', 'KM', 'Darshan KM', 'darshankm319@gmail.com', '+917406854965', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1267, '69e871d9c53d28866dc2812e', 'Sachin', 'Prasad', 'Sachin Prasad', 'sachinprasad2001@gmail.com', '+919951442035', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1268, '69e871d4c53d28866dc27ee7', 'SHUBHAM', 'YADAV', 'SHUBHAM YADAV', 'shubhamyadav2816@gmail.com', '+919926146617', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1269, '69e871bac53d28866dc27975', 'Raman', 'Kumar', 'Raman Kumar', 'kumarraman9934057@gmail.com', '+917759804442', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1270, '69e871aac53d28866dc27712', 'Ragavan', 'Annadurai', 'Ragavan Annadurai', 'ragavanannadurai@gmail.com', '+919047127191', 'active', '2026-07-07 05:03:57', '2026-07-07 05:03:57'),
(1271, '69e8719dc53d28866dc274cd', 'PUSHPA', 'Unknown', 'PUSHPA Unknown', 'pushpapushpar13@gmail.com', '+916362598087', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1272, '69e8718fc53d28866dc27273', 'Priyansh', 'Porwal', 'Priyansh Porwal', 'priyanshporwal28@gmail.com', '+918463812220', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1273, '69e87178c53d28866dc27001', 'Prasanth', 'Baskar', 'Prasanth Baskar', 'prasanthbaskar360@gmail.com', '+918838889738', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1274, '69e87165c53d28866dc26da1', 'Rajvardhan', 'Patil', 'Rajvardhan Patil', 'rajvardhan2273@gmail.com', '+919307834969', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1275, '69e8714cc53d28866dc26b26', 'NEHA', 'K B', 'NEHA K B', 'nehakb02@gmail.com', '+919880984079', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1276, '69e87141c53d28866dc268c5', 'NANCY', 'JOYCE', 'NANCY JOYCE', 'nancyjjoyce2003@gmail.com', '+917019162356', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1277, '69e8711cc53d28866dc26486', 'Shubham', 'Morghade', 'Shubham Morghade', 'shubhammorghade25@gmail.com', '+919164757808', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1278, '69e8710dc53d28866dc26229', 'NAMAN', 'UPRETI', 'NAMAN UPRETI', 'namanupreti02@gmail.com', '+918839344883', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1279, '69e87107c53d28866dc25ff2', 'ARVIND', 'CHANDRAKAR', 'ARVIND CHANDRAKAR', 'arch9805@gmail.com', '+918103302154', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1280, '69e870f7c53d28866dc25d9c', 'Bhavesh', 'Zope', 'Bhavesh Zope', 'bhaveshzope01@gmail.com', '+917066515743', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1281, '69e870f2c53d28866dc25b59', 'Mohammad', 'Qureshi', 'Mohammad Qureshi', 'rehqureshi01@gmail.com', '+917389173617', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1282, '69e870e3c53d28866dc258fb', 'Shubham', 'Jadhav', 'Shubham Jadhav', 'shubhamjadhav5101@gmail.com', '+917776865388', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1283, '69e870d4c53d28866dc25471', 'AJIT', 'KUMAR', 'AJIT KUMAR', 'ajitkumargz19@gmail.com', '+919693588616', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1284, '69e870cfc53d28866dc25225', 'Mansi', 'Chauhan', 'Mansi Chauhan', 'mansichauhan0380@gmail.com', '+918920670380', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1285, '69e870c6c53d28866dc24fe9', 'Rakshita', 'Agarwal', 'Rakshita Agarwal', 'agarakshita01@gmail.com', '+917014194580', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1286, '69e870bec53d28866dc24d9c', 'Manas', 'Unknown', 'Manas Unknown', 'itsmanas30@gmail.com', '+916364381389', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1287, '69e870b3c53d28866dc24b68', 'POOJA', 'C M', 'POOJA C M', 'poojagowda0953@gmail.com', '+918147414668', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1288, '69e870aec53d28866dc24920', 'NEERAJA', 'MALLI', 'NEERAJA MALLI', 'mallineeraja@gmail.com', '+916304514065', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1289, '69e870a9c53d28866dc246fb', 'KOLISETTY', 'SURYA MAHESH', 'KOLISETTY SURYA MAHESH', 'suryamaheshkolisetty@gmail.com', '+917893705103', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1290, '69e8709bc53d28866dc244be', 'Sandip', 'Chaudhary', 'Sandip Chaudhary', 'sandipchaudhary.k@gmail.com', '+919727937829', 'active', '2026-07-07 05:03:58', '2026-07-07 05:03:58'),
(1291, '69e8709ac53d28866dc24275', 'Lekkala', 'Ganesh', 'Lekkala Ganesh', 'lekkalaganesh14@gmail.com', '+918688479455', 'active', '2026-07-07 05:03:59', '2026-07-07 05:03:59'),
(1292, '69e8708dc53d28866dc24050', 'Rakshith', 'M', 'Rakshith M', 'rakshithmanjunath20@gmail.com', '+917406416766', 'active', '2026-07-07 05:03:59', '2026-07-07 05:03:59'),
(1293, '69e87083c53d28866dc23dfb', 'Kunika', 'Thakur', 'Kunika Thakur', 'kunikathakur02@gmail.com', '+918770677044', 'active', '2026-07-07 05:03:59', '2026-07-07 05:03:59'),
(1294, '69e87081c53d28866dc23bd5', 'Deepanshu', 'Manocha', 'Deepanshu Manocha', 'dmanocha464@gmail.com', '+919321822600', 'active', '2026-07-07 05:03:59', '2026-07-07 05:03:59'),
(1295, '69e87073c53d28866dc23984', 'Kundan', 'Kumar Mandal', 'Kundan Kumar Mandal', 'kundanhappy123@gmail.com', '+918521674004', 'active', '2026-07-07 05:03:59', '2026-07-07 05:03:59'),
(1296, '69e8706dc53d28866dc2375c', 'Bhimashankar', 'Dhotre', 'Bhimashankar Dhotre', 'bhimadhotre2416@gmail.com', '+917219792416', 'active', '2026-07-07 05:03:59', '2026-07-07 05:03:59'),
(1297, '69e87061c53d28866dc234fd', 'Ippili', 'Gupta', 'Ippili Gupta', 'ippilirahulgupta@gmail.com', '+916305649809', 'active', '2026-07-07 05:03:59', '2026-07-07 05:03:59'),
(1298, '69e8705ec53d28866dc232d9', 'ROHIT', 'MADDERLAWAR', 'ROHIT MADDERLAWAR', 'rohitmadderlawar18@gmail.com', '+918668990922', 'active', '2026-07-07 05:03:59', '2026-07-07 05:03:59'),
(1299, '69e87055c53d28866dc23091', 'CHIRANTH', 'KANTH', 'CHIRANTH KANTH', 'chiranth.shashikanth@gmail.com', '+916364146196', 'active', '2026-07-07 05:03:59', '2026-07-07 05:03:59'),
(1300, '69e8704dc53d28866dc22e4f', 'Arjun', 'Dhatbale', 'Arjun Dhatbale', 'arjundhatbale543210@gmail.com', '+917758081668', 'active', '2026-07-07 05:03:59', '2026-07-07 05:03:59'),
(1301, '69e87049c53d28866dc22c0e', 'BALUUMESH', 'CHANDU', 'BALUUMESH CHANDU', 'umeshdmc7@gmail.com', '+919959966921', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1302, '69e8703bc53d28866dc22861', 'Avdhesh', 'Bhardwaj', 'Avdhesh Bhardwaj', 'avdheshbhardwaj2004@gmail.com', '+917409793240', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1303, '69e87039c53d28866dc22786', 'AKSHAT', 'BAKSHI', 'AKSHAT BAKSHI', 'akshatabakshi09@gmail.com', '+917887869074', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1304, '69e87030c53d28866dc22550', 'Ganesh', 'Daund', 'Ganesh Daund', 'daundganesh496@gmail.com', '+919834890840', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1305, '69e87023c53d28866dc222f1', 'Aryan', 'Shrivastava', 'Aryan Shrivastava', 'itsaryan1shrivastava@gmail.com', '+919039867683', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1306, '69e8701ec53d28866dc220bf', 'Monika', 'K', 'Monika K', 'monikakumar4466@gmail.com', '+919591223668', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1307, '69e87012c53d28866dc21e6b', 'Aparna', 'Shahare', 'Aparna Shahare', 'aparnawork4@gmail.com', '+916366012482', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1308, '69e8700fc53d28866dc21c2f', 'SREYA', 'SARKAR', 'SREYA SARKAR', 'sreyakoyel@gmail.com', '+916290536437', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1309, '69e87002c53d28866dc219fa', 'Shital', 'Bhosale', 'Shital Bhosale', 'sbhosale0567@gmail.com', '+917745086775', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1310, '69e87000c53d28866dc2179b', 'ANKITA', 'PATIL', 'ANKITA PATIL', 'ankitapatil762001@gmail.com', '+917410705064', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1311, '69e86ff0c53d28866dc213af', 'ANANYA', 'Unknown', 'ANANYA Unknown', 'ananyashetty88688@gmail.com', '+918951606972', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1312, '69e86fefc53d28866dc2130b', 'Anil', 'Reddy', 'Anil Reddy', 'anil.java304@gmail.com', '+918074363097', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1313, '69e86fe0c53d28866dc210d7', 'Sushmitha', 'Hosur', 'Sushmitha Hosur', 'aarya.sushmi@gmail.com', '+917013505785', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1314, '69e86fddc53d28866dc20e98', 'Akash', 'G', 'Akash G', 'akashguntakal23@gmail.com', '+919392323021', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1315, '69e86fd3c53d28866dc20c5c', 'SHIVANG', 'GUPTA', 'SHIVANG GUPTA', 'st.shivanggupta2@gmail.com', '+918009823184', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1316, '69e86fd0c53d28866dc20a16', 'AJAY', 'KR', 'AJAY KR', 'mailmeajayrkrishnan@gmail.com', '+917305550277', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1317, '69e86fc5c53d28866dc2052d', 'PRASHANT', 'SARADE', 'PRASHANT SARADE', 'prashantsarade12@gmail.com', '+919922954524', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1318, '69e86fb9c53d28866dc202c7', 'Aditi', 'Arya', 'Aditi Arya', 'aditiarya954@gmail.com', '+917493989575', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1319, '69e86fb7c53d28866dc2009e', 'Priyanka', 'R', 'Priyanka R', 'priyankar2909@gmail.com', '+919108122236', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1320, '69e86fa8c53d28866dc1fc91', 'Chikyala', 'Navyasri', 'Chikyala Navyasri', 'navyasri.chikyala@gmail.com', '+919440566816', 'active', '2026-07-07 05:04:00', '2026-07-07 05:04:00'),
(1321, '69e86fa7c53d28866dc1fc09', 'Abhishek', 'Yadav', 'Abhishek Yadav', 'abhishek.yadav.coder@gmail.com', '+917987037305', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1322, '69e86f9ec53d28866dc1f9c2', 'Kushagra', 'Aman', 'Kushagra Aman', 'kushagra.aman.inbox@gmail.com', '+919457441876', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1323, '69e86f9ac53d28866dc1f77e', 'Abhijeet', 'Anand', 'Abhijeet Anand', 'anandabhijeet098@gmail.com', '+916202746213', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1324, '69e86f8bc53d28866dc1f524', 'Udaybhan', 'Sahni', 'Udaybhan Sahni', 'udaybhansahni756@gmail.com', '+918577848174', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1325, '69e86f76c53d28866dc1f1ff', 'Yash', 'Pandey', 'Yash Pandey', 'yashupandey00@gmail.com', '+917049611055', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1326, '69e86f6bc53d28866dc1efd1', 'PRATIK', 'BHAND', 'PRATIK BHAND', 'bhandpratik1310@gmail.com', '+919529896450', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1327, '69e86f5fc53d28866dc1ed67', 'Rishabh', 'Mishra', 'Rishabh Mishra', 'rishabhmishra1699@gmail.com', NULL, 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1328, '69e86f56c53d28866dc1eb16', 'ABDUL', 'KHALIQ', 'ABDUL KHALIQ', 'ak882710@gmail.com', '+918130704359', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1329, '69e86f44c53d28866dc1e8b0', 'ANANT', 'DEVMORE', 'ANANT DEVMORE', 'devmoreanant@gmail.com', '+917758011975', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1330, '69e86f29c53d28866dc1e457', 'Laila', 'Unknown', 'Laila Unknown', 'lailakuttibabu1510@gmail.com', '+919360003845', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1331, '69e86f1bc53d28866dc1e20d', 'Avadhut', 'Patil', 'Avadhut Patil', 'avadhutpatil17340@gmail.com', '+919284588030', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1332, '69e86f0dc53d28866dc1dfd0', 'Aakash', 'I', 'Aakash I', 'aakashilango10@gmail.com', '+917358515358', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1333, '69e86f01c53d28866dc1dd98', 'AMAR', 'BAMBALAWADE', 'AMAR BAMBALAWADE', 'bambalawadeamar@gmail.com', '+917483865981', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1334, '69e86ef1c53d28866dc1db5d', 'Murari', 'More', 'Murari More', 'murari2more@gmail.com', '+919665963542', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1335, '69e86ee8c53d28866dc1d929', 'Rohitha', 'Rama', 'Rohitha Rama', 'rohitharama8@gmail.com', '+917842985429', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1336, '69e86eddc53d28866dc1d6f1', 'Ishika', 'Aggarwal', 'Ishika Aggarwal', 'ishikaagg1325@gmail.com', '+919910150257', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1337, '69e86ecac53d28866dc1d4bc', 'MANIKANDAN', 'P', 'MANIKANDAN P', 'manikcareers@gmail.com', '+918610654514', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1338, '69e86ebcc53d28866dc1d278', 'Yash', 'Sharma', 'Yash Sharma', 'yashsharma7798.ys@gmail.com', '+919953779833', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1339, '69e86ea5c53d28866dc1d028', 'Abhishek', 'Pandey', 'Abhishek Pandey', 'pandeyabhi1572000@gmail.com', '+917355725894', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1340, '69e86e99c53d28866dc1cdf4', 'NITISH', 'KUMAR BEHERA', 'NITISH KUMAR BEHERA', 'nitishbehera64@gmail.com', '+918296048337', 'active', '2026-07-07 05:04:01', '2026-07-07 05:04:01'),
(1341, '69e86e81c53d28866dc1cbb0', 'PRACHI', 'KIRPANE', 'PRACHI KIRPANE', 'prachikirpane@gmail.com', '+919579487824', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1342, '69e86e77c53d28866dc1c982', 'Aman', 'Unknown', 'Aman Unknown', 'amaaanahmedkhan987@gmail.com', '+919953237327', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1343, '69e86d3ec53d28866dc1c681', 'Sudhanshu', 'Mandhania', 'Sudhanshu Mandhania', 'mandhaniasudhanshu@gmail.com', '+918626011777', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1344, '69e86d31c53d28866dc1c43d', 'Nitin', 'Garg', 'Nitin Garg', 'nitingarg691@gmail.com', '+919074314690', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1345, '69e86d20c53d28866dc1c200', 'Karansing', 'Rajput', 'Karansing Rajput', 'karansingrajput1502@gmail.com', '+919860429344', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1346, '69e86d05c53d28866dc1bf92', 'JAI', 'CHAVAN', 'JAI CHAVAN', 'chavanjai168@gmail.com', '+918856091773', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1347, '69e86cf9c53d28866dc1bd5e', 'Neha', 'Thakur', 'Neha Thakur', 'thakurneha1110@gmail.com', '+918839759097', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1348, '69e86cebc53d28866dc1bb20', 'Pankaj', 'Kumar', 'Pankaj Kumar', 'pankajkumar09653@gmail.com', '+917294902243', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1349, '69e86cddc53d28866dc1b8f5', 'VAISHNAVI', 'UBHAD', 'VAISHNAVI UBHAD', 'vaishnaviubhad869@gmail.com', '+919322528690', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1350, '69e86cd3c53d28866dc1b6ad', 'Priti', 'Avaghade', 'Priti Avaghade', 'pritiavaghade95@gmail.com', '+919561357475', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1351, '69e86cc3c53d28866dc1b415', 'Shubham', 'Kumar', 'Shubham Kumar', 'shubham.kumar3088@gmail.com', '+918676824400', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1352, '69e86cb8c53d28866dc1b1d5', 'Devarshi', 'Lunge', 'Devarshi Lunge', 'lungedevarshi@gmail.com', '+919834430946', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1353, '69e86caac53d28866dc1af8d', 'LAVANKUMAR', 'H J', 'LAVANKUMAR H J', 'lavankumarhj11@gmail.com', '+918095815791', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1354, '69e86c9ec53d28866dc1ad50', 'Harshith', 'V', 'Harshith V', 'harshithvishwanathan28@gmail.com', '+918073993822', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1355, '69e86c8ec53d28866dc1aac9', 'Ankit', 'Kumar', 'Ankit Kumar', 'ankit888233@gmail.com', '+919058019749', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1356, '69e86c80c53d28866dc1a88b', 'Abhishek', 'Chauhan', 'Abhishek Chauhan', 'abhishekchauhan.ic@gmail.com', '+919512431327', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1357, '69e86c75c53d28866dc1a643', 'Preethi', 'B R', 'Preethi B R', 'preethiams111@gmail.com', '+918884984047', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1358, '69e86c68c53d28866dc1a3fe', 'Shubham', 'Nehete', 'Shubham Nehete', 'shubhnehete21@gmail.com', '+919970190166', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1359, '69e86c5cc53d28866dc1a1be', 'Amit', 'Thipe', 'Amit Thipe', 'amitthipe2014@gmail.com', '+919921013192', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1360, '69e86c4ec53d28866dc19f71', 'Apurva', 'Zurmure', 'Apurva Zurmure', 'apurva.zurmure@gmail.com', '+919372668372', 'active', '2026-07-07 05:04:02', '2026-07-07 05:04:02'),
(1361, '69e86c3dc53d28866dc19d12', 'Sunil', 'Kumar', 'Sunil Kumar', 'sunil61k83@gmail.com', '+918310974374', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1362, '69e86c31c53d28866dc19ad0', 'ASHITA', 'YADAV', 'ASHITA YADAV', 'ashita14yadav@gmail.com', '+919098685982', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1363, '69e86c27c53d28866dc1989f', 'Akash', 'Bendre', 'Akash Bendre', 'akashbendre37@gmail.com', '+919359975131', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1364, '69e86c17c53d28866dc19641', 'PRAGNA', 'GANGIREDDYGARI', 'PRAGNA GANGIREDDYGARI', 'pragnagvr@gmail.com', '+918317575860', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1365, '69e86c0fc53d28866dc193fe', 'Mansi', 'Sharma', 'Mansi Sharma', 'mansisharma02207@gmail.com', '+919340862461', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1366, '69e86c05c53d28866dc191b6', 'CHAITRA', 'RITTI', 'CHAITRA RITTI', 'cdritti18@gmail.com', '+919008409447', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1367, '69e86bf4c53d28866dc18f69', 'Shivalingappa', 'Unknown', 'Shivalingappa Unknown', 'shivalingappagudagi@gmail.com', '+918431335313', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1368, '69e86be3c53d28866dc18d12', 'Atharv', 'Pandit', 'Atharv Pandit', 'atharvpandit810@gmail.com', '+919834587465', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1369, '69e86bd8c53d28866dc18acb', 'Amarjit', 'Chopade', 'Amarjit Chopade', 'chopadeamarjit01@gmail.com', '+918605997201', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1370, '69e86bcfc53d28866dc18891', 'Rishabh', 'Goyal', 'Rishabh Goyal', 'goyalrishabh2222@gmail.com', '+919896698354', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1371, '69e86bbec53d28866dc18630', 'Mohammed', 'Suhel', 'Mohammed Suhel', 'suhelshaik236@gmail.com', '+918639521186', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1372, '69e86ba2c53d28866dc18195', 'Atul', 'Dhole', 'Atul Dhole', 'atulrd011@outlook.com', '+918806199737', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1373, '69e86b99c53d28866dc17f51', 'Apurva', 'Solanke', 'Apurva Solanke', 'apurvasolanke09@gmail.com', '+919545183127', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1374, '69e86b8cc53d28866dc17d03', 'D', 'Kalpana', 'D Kalpana', 'dhulipallakalpana16@gmail.com', '+917815896994', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1375, '69e86b80c53d28866dc17acd', 'Adnan', 'Khan', 'Adnan Khan', 'adnanmohammadk@gmail.com', '+917024599909', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1376, '69e86b71c53d28866dc17881', 'Ravi', 'Girhe', 'Ravi Girhe', 'ravi.girhe06@gmail.com', '+919146672569', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1377, '69e86b65c53d28866dc17645', 'Shitanshu', 'Ranjan Srivastava', 'Shitanshu Ranjan Srivastava', 'shitanshu519@gmail.com', '+917483960019', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1378, '69e86b5cc53d28866dc173ea', 'BHAVANI', 'KUMAR', 'BHAVANI KUMAR', 'sbhavanikumar2016@gmail.com', '+917013167289', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1379, '69e86b4cc53d28866dc171ac', 'Sachin', 'Kokare', 'Sachin Kokare', 'sachinkokare1975@gmail.com', '+919527961975', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1380, '69e86b3cc53d28866dc16ae7', 'Candidate', 'Unknown', 'Candidate Unknown', 'navalev475@gmail.com', '+919595864727', 'active', '2026-07-07 05:04:03', '2026-07-07 05:04:03'),
(1381, '69e86b2ac53d28866dc1682f', 'Ajay', 'Kosta', 'Ajay Kosta', 'ajay.97kosta@gmail.com', '+917974860464', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1382, '69e86b28c53d28866dc16650', 'Nagesha', 'KM', 'Nagesha KM', 'nagesha1996km@gmail.com', '+916370943833', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1383, '69e86b1ac53d28866dc163f1', 'ABUBAKER', 'KHAN', 'ABUBAKER KHAN', 'abubakerkhan786@gmail.com', '+917303933575', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1384, '69e86b15c53d28866dc161ae', 'Sreeramulu', 'Unknown', 'Sreeramulu Unknown', 'rajusreeramulu599@gmail.com', '+918019884135', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1385, '69e86b0bc53d28866dc15f5d', 'Manovikash', 'Unknown', 'Manovikash Unknown', 'manovikash01@gmail.com', '+916369158400', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1386, '69e86b09c53d28866dc15d22', 'Sanket', 'Thorat', 'Sanket Thorat', 'sanketthorat2025@gmail.com', '+919604079492', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1387, '69e86afec53d28866dc15ac5', 'SIDDHANTA', 'BISWAS', 'SIDDHANTA BISWAS', 'siddhantabiswas@gmail.com', '+919475372931', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1388, '69e86afcc53d28866dc15891', 'Suraj', 'Bhoi', 'Suraj Bhoi', 'bhoisuraj.dev@gmail.com', '+919187667891', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1389, '69e86aeec53d28866dc15640', 'Namita', 'Singh', 'Namita Singh', '26namitasingh@gmail.com', '+919821012778', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1390, '69e86ae8c53d28866dc153ea', 'MOUMITA', 'DHARA', 'MOUMITA DHARA', 'mdhara658@gmail.com', '+917004188036', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1391, '69e86adec53d28866dc15190', 'RAJA', 'WASIM ASHRAF', 'RAJA WASIM ASHRAF', 'wasimashraf273@gmail.com', '+919135815430', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1392, '69e86adcc53d28866dc14f5b', 'KAUSTUBH', 'GITEKAR', 'KAUSTUBH GITEKAR', 'kaustubhkishor308@gmail.com', '+919187140902', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1393, '69e86ad2c53d28866dc14d04', 'SATENDRA', 'SINGH', 'SATENDRA SINGH', 'satendra1009singh@gmail.com', '+918130460138', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1394, '69e86ac5c53d28866dc14ab4', 'Teja', 'Unknown', 'Teja Unknown', 'bhavanasitheja99@gmail.com', '+918019319548', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1395, '69e86abac53d28866dc146cb', 'Pra$k', 'Purbuj', 'Pra$k Purbuj', 'pratikpurbuj18@yahoo.com', '+919834341019', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1396, '69e86ab9c53d28866dc1462d', 'Md', 'Hasnain Raza', 'Md Hasnain Raza', 'mdhasnainraza669@gmail.com', '+919608291269', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1397, '69e86aa6c53d28866dc142fc', 'Dileep', 'Kumar', 'Dileep Kumar', 'dileepkumar1823@gmail.com', '+917061414109', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1398, '69e86a96c53d28866dc14096', 'Rajendra', 'Patel', 'Rajendra Patel', 'patelrajendra.2001@gmail.com', '+919521802285', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1399, '69e86a88c53d28866dc13e04', 'Shubham', 'Kumar', 'Shubham Kumar', 'shubhamkupadhyay7@gmail.com', '+918275183771', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1400, '69e86a72c53d28866dc13b7b', 'Rachel', 'Chadalavada', 'Rachel Chadalavada', 'racheljoych@gmail.com', '+917702664561', 'active', '2026-07-07 05:04:04', '2026-07-07 05:04:04'),
(1401, '69e86a66c53d28866dc13913', 'Yash', 'Gupta', 'Yash Gupta', 'yashg7842@gmail.com', '+918765650878', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1402, '69e86a58c53d28866dc136ad', 'Rishabh', 'Gurjar', 'Rishabh Gurjar', 'rishabhgurjar575@gmail.com', '+917770897807', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1403, '69e86a48c53d28866dc13448', 'SHUBHANGI', 'KAVTEKAR', 'SHUBHANGI KAVTEKAR', 'shubhangikavtekar93@gmail.com', '+919604514602', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1404, '69e86a36c53d28866dc131de', 'Mayuri', 'Patil', 'Mayuri Patil', 'mayuri.patil0391@gmail.com', '+918055521145', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1405, '69e86a2cc53d28866dc12f8b', 'Md', 'Wasim', 'Md Wasim', 'wasimmd050@gmail.com', '+917481090424', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1406, '69e86a1bc53d28866dc12d32', 'Nagaraj', 'D', 'Nagaraj D', 'nagarajd4884@gmail.com', '+919944982134', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1407, '69e86a02c53d28866dc12ab2', 'Dipesh', 'Desale', 'Dipesh Desale', 'dipesh.desale12@gmail.com', '+917776064408', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1408, '69e869efc53d28866dc1283e', 'Ganesh', 'Ettaboina', 'Ganesh Ettaboina', 'ettaboinaganeshyadav@gmail.com', '+918499097992', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1409, '69e869e4c53d28866dc125c5', 'Krishna', 'Kumar', 'Krishna Kumar', 'krishnakumar.kk886@gmail.com', '+919032340161', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1410, '69e869cbc53d28866dc1210a', 'MOHAMMAD', 'REHAN', 'MOHAMMAD REHAN', 'mohd.rehan.dev@gmail.com', '+919690861297', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1411, '69e869bac53d28866dc11eb3', 'Bheemanapalli', 'Dhyaneswar', 'Bheemanapalli Dhyaneswar', 'dhyaneswarbheemanapalli@gmail.com', '+917483112194', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1412, '69e869aec53d28866dc11c4f', 'Megavath', 'Haritha Bai', 'Megavath Haritha Bai', 'megavathharitha819@gmail.com', '+918688050726', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1413, '69e869a0c53d28866dc119fc', 'Manish', 'Dongarekar', 'Manish Dongarekar', 'manishdongarekar@gmail.com', '+918660431106', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1414, '69e86989c53d28866dc1179d', 'Sneha', 'Kundgol', 'Sneha Kundgol', 'ksneha5548@gmail.com', '+919035385548', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1415, '69e86978c53d28866dc11526', 'Rohan', 'Kurade', 'Rohan Kurade', 'kuraderohan12@gmail.com', '+918261839293', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1416, '69e86949c53d28866dc10f02', 'Krishan', 'Kumawat', 'Krishan Kumawat', 'krishangopalkumawat123@gmail.com', '+916367376463', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1417, '69e86948c53d28866dc10e5f', 'Vijay', 'K', 'Vijay K', 'bheemavijaykrvt@gmail.com', '+918778177718', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1418, '69e8693bc53d28866dc10c0e', 'Sanjay', 'Honmane', 'Sanjay Honmane', 'sanjayhonmane45@gmail.com', '+918007286643', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1419, '69e86939c53d28866dc109ce', 'Rehana', 'Khatoon', 'Rehana Khatoon', 'rehanakhatoon84099@gmail.com', '+918409910403', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1420, '69e8692dc53d28866dc10775', 'Ranjith', 'Babu P S', 'Ranjith Babu P S', 'ranjithbabu.ps@gmail.com', '+919600447893', 'active', '2026-07-07 05:04:05', '2026-07-07 05:04:05'),
(1421, '69e8691fc53d28866dc1052d', 'Kolluru', 'Siva Sai', 'Kolluru Siva Sai', 'sivaecesai@gmail.com', '+917013375807', 'active', '2026-07-07 05:04:06', '2026-07-07 05:04:06'),
(1422, '69e8690ec53d28866dc102cd', 'Freethi', 'RJ', 'Freethi RJ', 'freethi.rj001@gmail.com', '+916379336758', 'active', '2026-07-07 05:04:06', '2026-07-07 05:04:06'),
(1423, '69e8690dc53d28866dc10093', 'MAHESH', 'KUMAR G', 'MAHESH KUMAR G', 'gmahesh.mk55@gmail.com', NULL, 'active', '2026-07-07 05:04:06', '2026-07-07 05:04:06'),
(1424, '69e868ffc53d28866dc0fe30', 'Tejaswi', 'Koppuravuri', 'Tejaswi Koppuravuri', 'koppuravuritezaswi01@gmail.com', '+917013186600', 'active', '2026-07-07 05:04:06', '2026-07-07 05:04:06'),
(1425, '69e868fec53d28866dc0fbec', 'ANIL', 'ROOGI', 'ANIL ROOGI', 'anilroogi767@gmail.com', '+916362691609', 'active', '2026-07-07 05:04:06', '2026-07-07 05:04:06'),
(1426, '69e868ebc53d28866dc0f984', 'Prajwal', 'B R', 'Prajwal B R', 'prajwalbr1110@gmail.com', '+919148169659', 'active', '2026-07-07 05:04:06', '2026-07-07 05:04:06'),
(1427, '69e868d7c53d28866dc0f2e8', 'Nitesh', 'Pant', 'Nitesh Pant', 'nitesh.2000pant@gmail.com', '+917078871849', 'active', '2026-07-07 05:04:06', '2026-07-07 05:04:06'),
(1428, '69e868cbc53d28866dc0ee3c', 'Satyam', 'Birar', 'Satyam Birar', 'satyambirar105@gmail.com', '+918551059749', 'active', '2026-07-07 05:04:06', '2026-07-07 05:04:06'),
(1429, '69e868c2c53d28866dc0e9b4', 'LIKHITH', 'KUMAR', 'LIKHITH KUMAR', 'likhithkumarnallani@gmail.com', '+917780157426', 'active', '2026-07-07 05:04:06', '2026-07-07 05:04:06'),
(1430, '69e868b3c53d28866dc0e50e', 'Vaibhav', 'Gaikwad', 'Vaibhav Gaikwad', 'gaikwadvr50@gmail.com', '+919579119850', 'active', '2026-07-07 05:04:06', '2026-07-07 05:04:06');
INSERT INTO `students` (`id`, `external_id`, `first_name`, `last_name`, `full_name`, `email`, `phone_number`, `status`, `created_at`, `updated_at`) VALUES
(1431, '69e868a0c53d28866dc0de1f', 'Tattaputikala', 'Viswa Amit', 'Tattaputikala Viswa Amit', 'viswaamittattaputikala@gmail.com', '+916282353445', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1432, '69e8689bc53d28866dc0dbdb', 'SUNIL', 'YADAV', 'SUNIL YADAV', 'tech.sunilyadav@gmail.com', '+919082509647', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1433, '69e8688ec53d28866dc0d94e', 'Janani', 'Srinivasan', 'Janani Srinivasan', 'jananisrinivasan269@gmail.com', '+916380564517', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1434, '69e8687fc53d28866dc0d4a5', 'Harshit', 'Mishra', 'Harshit Mishra', 'harshitgrd@gmail.com', '+916206839547', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1435, '69e86877c53d28866dc0d00a', 'Bidyut', 'Bhattacharjee', 'Bidyut Bhattacharjee', 'bidyut.bhattacharjee.info@gmail.com', '+916001398524', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1436, '69e8686dc53d28866dc0cdbc', 'Rohit', 'Bhoite', 'Rohit Bhoite', 'rohitbhoite26@gmail.com', '+917066532220', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1437, '69e86862c53d28866dc0ca73', 'Ravinder', 'Singh', 'Ravinder Singh', 'rawatravinder115@gmail.com', '+919555699542', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1438, '69e86854c53d28866dc0c6d4', 'Pintu', 'Kumar', 'Pintu Kumar', 'pintukrss4321@gmail.com', '+917782937104', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1439, '69e8684fc53d28866dc0c483', 'Gajanan', 'Bachate', 'Gajanan Bachate', 'gajananbachate7@gmail.com', '+917620730328', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1440, '69e86837c53d28866dc0bd6e', 'Dishant', 'Gaikwad', 'Dishant Gaikwad', 'dishantgaikwad21@gmail.com', '+919503464613', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1441, '69e86836c53d28866dc0baeb', 'AJAY', 'GOGIA', 'AJAY GOGIA', 'ajaygogia26@gmail.com', '+919876224430', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1442, '69e8681ec53d28866dc0af8a', 'DIVYA', 'BOTTA', 'DIVYA BOTTA', 'divyasaibotta@gmail.com', '+918639498998', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1443, '69e86818c53d28866dc0a892', 'Madhuri', 'Govind Jadhav', 'Madhuri Govind Jadhav', 'madhurijadhav9902@gmail.com', '+919503924086', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1444, '69e8680ac53d28866dc0a120', 'Abhilash', 'Mahajan', 'Abhilash Mahajan', 'mahajanabhi.5288@gmail.com', '+917354030701', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1445, '69e86808c53d28866dc09e6e', 'Vishal', 'Kumar Saw', 'Vishal Kumar Saw', 'vishalraj27599@gmail.com', '+919348201189', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1446, '69e867edc53d28866dc08fa8', 'Sudam', 'Mohapatra', 'Sudam Mohapatra', 'smjavadev26@gmail.com', '+919937233272', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1447, '69e867e3c53d28866dc08789', 'Akash', 'Rajbhoj', 'Akash Rajbhoj', 'akashrajbhoj30@gmail.com', '+917620902434', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1448, '69e867dec53d28866dc08360', 'Shivam', 'Gupta', 'Shivam Gupta', 'shivam.gupta123.sg24@gmail.com', '+919737057357', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1449, '69e867cbc53d28866dc07a03', 'Vikash', 'Unknown', 'Vikash Unknown', 'vikas1.yadav95@gmail.com', '+918005727386', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1450, '69e867c1c53d28866dc07191', 'PRASHANT', 'SINGH', 'PRASHANT SINGH', 'prashant0821.d@gmail.com', '+917206883845', 'active', '2026-07-07 05:04:07', '2026-07-07 05:04:07'),
(1451, '69e867a5c53d28866dc06266', 'AMIT', 'CHINARA', 'AMIT CHINARA', 'amitchinara@gmail.com', '+918093386767', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1452, '69e86783c53d28866dc04dd7', 'VENKATASALAM', 'Unknown', 'VENKATASALAM Unknown', 'venkatmohandass29@gmail.com', '+919944656190', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1453, '69e86763c53d28866dc03aab', 'Brahmaiah', 'Kuricheti', 'Brahmaiah Kuricheti', 'brahmaiahk8372@gmail.com', '+919441794056', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1454, '69e8674bc53d28866dc02752', 'ROHIT', 'MORE', 'ROHIT MORE', 'rohittmore17@gmail.com', '+919168603125', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1455, '69e86730c53d28866dc01481', 'BHARATH', 'KUMAR KANKARLA', 'BHARATH KUMAR KANKARLA', 'bharath.kankarla2000@gmail.com', '+919381139171', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1456, '69e8670cc53d28866dc00226', 'Akshay', 'Khobragade', 'Akshay Khobragade', 'khobragadeakshay471@gmail.com', '+918421174522', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1457, '69e866fec53d28866dbffac3', 'Yash', 'Nagare', 'Yash Nagare', 'yashnagare05@gmail.com', '+919975600675', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1458, '69e866dac53d28866dbfe87e', 'AGASH', 'MAHENDRAN', 'AGASH MAHENDRAN', 'agashmahendran@gmail.com', '+919442584761', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1459, '69e866c2c53d28866dbfdaf8', 'Nayan', 'Mahajan', 'Nayan Mahajan', 'nayan.mahajan1224@gmail.com', '+918421388135', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1460, '69e866abc53d28866dbfcdcd', 'MRUTYUNJAY', 'BEHERA', 'MRUTYUNJAY BEHERA', 'mrutyunjayb2003@gmail.com', '+916301692511', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1461, '69e8669cc53d28866dbfc5ff', 'Pallavi', 'N R', 'Pallavi N R', 'pallavinr23@gmail.com', '+917996403058', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1462, '69e86682c53d28866dbfb9d1', 'Rishi', 'Rathore', 'Rishi Rathore', 'rathorerishi0.0001@gmail.com', '+917977733865', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1463, '69e8667ac53d28866dbfb4bc', 'Kush', 'Mistry', 'Kush Mistry', 'kushmistry16@gmail.com', '+918469020919', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:26'),
(1464, '69e8666ec53d28866dbfae29', 'Afroz', 'Alam', 'Afroz Alam', 'afrozcpr213@gmail.com', '+918002104302', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1465, '69e86637c53d28866dbf9271', 'PRANAV', 'GA', 'PRANAV GA', 'pranavvardhan01@gmail.com', '+918667295958', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1466, '69e8661dc53d28866dbf837f', 'Sujit', 'Kumar', 'Sujit Kumar', 'sujiitkr0@gmail.com', '+917909361038', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1467, '69e86602c53d28866dbf74a2', 'Priyanshu', 'Suman', 'Priyanshu Suman', 'priyanshus0707@gmail.com', '+919015834695', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1468, '69e865e9c53d28866dbf66b5', 'KARISHMA', 'GHUTE', 'KARISHMA GHUTE', 'supekarkarishma@gmail.com', '+918080302190', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1469, '69e865d2c53d28866dbf5981', 'Dipak', 'Darole', 'Dipak Darole', 'dipakbdarole@gmail.com', '+919130165365', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1470, '69e865bac53d28866dbf49bf', 'HARSHADA', 'DEORE', 'HARSHADA DEORE', 'harshadadeore162000@gmail.com', '+918999491869', 'active', '2026-07-07 05:04:08', '2026-07-07 05:04:08'),
(1471, '69e865a1c53d28866dbf3be1', 'Bhushan', 'Satpute', 'Bhushan Satpute', 'bhushan.p.satpute@gmail.com', '+917263821676', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1472, '69e86581c53d28866dbf2b8b', 'Ashmeet', 'Kour Hora', 'Ashmeet Kour Hora', 'ashmeetkour18@gmail.com', '+917400629993', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1473, '69e86563c53d28866dbf1dc3', 'Aashutosh', 'Joshi', 'Aashutosh Joshi', 'aashutoshjoshi110@gmail.com', '+917999608992', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1474, '69e8653dc53d28866dbf087a', 'Nikita', 'Malleshe', 'Nikita Malleshe', 'nikitamalleshe@gmail.com', '+917219573757', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1475, '69e8651ec53d28866dbef818', 'Korra', 'Naik', 'Korra Naik', 'rahulkorra30@gmail.com', '+919010333172', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1476, '69e86505c53d28866dbee9bc', 'SORABH', 'GILL', 'SORABH GILL', 'gillsorabh97@gmail.com', '+919719062318', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1477, '69e864e4c53d28866dbed891', 'Shubhangi', 'Ardad', 'Shubhangi Ardad', 'shubhangiardad5644@gmail.com', '+917558505455', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1478, '69e864d0c53d28866dbecec4', 'Anjaly', 'Jaikumar', 'Anjaly Jaikumar', 'indiaanjalyjayakumar1234@gmail.com', '+916282272049', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1479, '69e864bbc53d28866dbec25e', 'Surendar', 'N', 'Surendar N', 'surendar2629731@gmail.com', '+919566312792', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1480, '69e864a9c53d28866dbeb72e', 'Virendra', 'Rawat', 'Virendra Rawat', 'viruraj830@gmail.com', '+918679522830', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1481, '69e86492c53d28866dbeaa04', 'Debraj', 'Som', 'Debraj Som', 'debrajsom23@gmail.com', '+919774135120', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1482, '69e86462c53d28866dbe90ab', 'PAVITHRA', 'Unknown', 'PAVITHRA Unknown', 'pavi862001@gmail.com', '+919566137648', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1483, '69e86214c53d28866dbe2043', 'PRASANNA', 'KONDAMURI', 'PRASANNA KONDAMURI', 'kondamuri.prasanna.devi@gmail.com', '+919951493477', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1484, '69e86206c53d28866dbe1df4', 'ASHOK', 'PATEL', 'ASHOK PATEL', 'apashokpatel07@gmail.com', '+919981592825', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1485, '69e861e7c53d28866dbde66a', 'SWAPNALI', 'PACHADE', 'SWAPNALI PACHADE', 'pachadeswapnali@gmail.com', '+918169576179', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1486, '69e861d9c53d28866dbde419', 'ADITHYA', 'Unknown', 'ADITHYA Unknown', 'adithyaashok5256@gmail.com', '+917904433262', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1487, '69e861c9c53d28866dbde1cd', 'MANALI', 'NAIK', 'MANALI NAIK', 'naikmanali44@gmail.com', '+919591575169', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1488, '69e861a7c53d28866dbddf67', 'RAVI', 'CHANDRA BOYINAPALLI', 'RAVI CHANDRA BOYINAPALLI', 'ravichandraboyinapalli@gmail.com', '+919849083237', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1489, '69e86194c53d28866dbddd04', 'Lalit', 'Thaware', 'Lalit Thaware', 'thawarelalit@gmail.com', '+919503957294', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1490, '69e86182c53d28866dbdda90', 'Sumit', 'Unknown', 'Sumit Unknown', 'sumitgond9999@gmail.com', '+917503372336', 'active', '2026-07-07 05:04:09', '2026-07-07 05:04:09'),
(1491, '69e86170c53d28866dbdd832', 'SHUBHAM', 'MUKHERJEE', 'SHUBHAM MUKHERJEE', 'shubhammukherjee.91@yahoo.com', '+918588073194', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1492, '69e8615fc53d28866dbdd5d6', 'Supriya', 'Kumari', 'Supriya Kumari', 'supriyakumari0406@gmail.com', '+916201138139', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1493, '69e8614dc53d28866dbdd36f', 'Sanil', 'Gupta', 'Sanil Gupta', 'sanilguptagpt18@gmail.com', '+918109958476', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1494, '69e8613ac53d28866dbdd111', 'Kaluva', 'Sravani', 'Kaluva Sravani', 'sravaniyadav5533@gmail.com', '+919640073074', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1495, '69e86130c53d28866dbdceb5', 'Ravichandra', 'Reddy', 'Ravichandra Reddy', 'ravichandra.bin@gmail.com', '+91890416494', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1496, '69e86104c53d28866dbdca05', 'Ajay', 'Gangavane', 'Ajay Gangavane', 'gangawaneajay7@gmail.com', '+919270798670', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1497, '69e860ecc53d28866dbdc785', 'Asma', 'Pathan', 'Asma Pathan', 'asmapathan737@gmail.com', '+917218505011', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:11'),
(1498, '69e860ddc53d28866dbdc527', 'NITISH', 'SUPE', 'NITISH SUPE', 'supenitish@gmail.com', '+917218113614', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1499, '69e860d0c53d28866dbdc2d3', 'Akshaya', 'Ragupathy', 'Akshaya Ragupathy', 'akshayaragupathy25@gmail.com', '+916369950925', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1500, '69e860c0c53d28866dbdc07f', 'Endluri', 'Aravind', 'Endluri Aravind', 'endluriaravind66@gmail.com', '+919900726087', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1501, '69e860b2c53d28866dbdbe27', 'SUMEDHA', 'ARYA', 'SUMEDHA ARYA', 'sumedha0327@gmail.com', '+918305298339', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1502, '69e8609ec53d28866dbdbbce', 'Manthan', 'Pelne', 'Manthan Pelne', 'manthanpelne2016@gmail.com', '+919767056717', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1503, '69e8608fc53d28866dbdb96a', 'REDDY', 'NOORJAHAN PALAGIRI', 'REDDY NOORJAHAN PALAGIRI', 'reddynoorjahanpalagiri@gmail.com', '+918309537835', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1504, '69e8607fc53d28866dbdb71c', 'Lalit', 'Khomane', 'Lalit Khomane', 'lkhomane99@gmail.com', '+918446312510', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1505, '69e86074c53d28866dbdb4bd', 'HARSHADA', 'LONKAR', 'HARSHADA LONKAR', 'harshadalonkar24@gmail.com', '+917410533135', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1506, '69e86055c53d28866dbdaff4', 'Gowthami', 'Prajapathi Panda', 'Gowthami Prajapathi Panda', 'gowthami.p.panda@gmail.com', '+918260719055', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1507, '69e86044c53d28866dbdada0', 'Saurabh', 'Borase', 'Saurabh Borase', 'saurbhsb29@gmail.com', '+919552760402', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1508, '69e86038c53d28866dbdab48', 'Yalamma', 'Chalwadi', 'Yalamma Chalwadi', 'yalammachalwadi5@gmail.com', '+919860992473', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1509, '69e86025c53d28866dbda8fa', 'Prajakta', 'Nale', 'Prajakta Nale', 'prajaktanale14@gmail.com', '+917249296362', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1510, '69e8601ac53d28866dbda6a5', 'Rajesh', 'Bommi', 'Rajesh Bommi', 'rajeshrajabommi@gmail.com', '+919133566425', 'active', '2026-07-07 05:04:10', '2026-07-07 05:04:10'),
(1511, '69e86009c53d28866dbda44d', 'SAI DURGA HARSHA VARDHAN', 'PERURI', 'SAI DURGA HARSHA VARDHAN PERURI', 'saidurgaharshavardhan@gmail.com', '+919849683742', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1512, '69e85ff6c53d28866dbda1ec', 'ANKUSH', 'VARUTE', 'ANKUSH VARUTE', 'ankushvarute9144@gmail.com', '+918177954459', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1513, '69e85fe1c53d28866dbd9f86', 'Anuraag', 'Gumudavelli', 'Anuraag Gumudavelli', 'anuraggumudavelli8055@gmail.com', '+917893684969', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1514, '69e85fc9c53d28866dbd9d27', 'Vrushali', 'Mane', 'Vrushali Mane', 'vrushalimane72000@gmail.com', '+919970698894', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1515, '69e85fb8c53d28866dbd9ad8', 'Jeevan', 'Unknown', 'Jeevan Unknown', 'jeevanjee207@gmail.com', '+919489047768', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1516, '69e85facc53d28866dbd9880', 'PRASAD', 'SHEKHAR NAIK', 'PRASAD SHEKHAR NAIK', 'prasadsnaik18@gmail.com', '+919148831446', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1517, '69e85f97c53d28866dbd961f', 'Vijay', 'Patil', 'Vijay Patil', 'vijayt1998@gmail.com', '+918830044622', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1518, '69e85f88c53d28866dbd93c2', 'Mohd', 'Atiullah', 'Mohd Atiullah', 'atiullah8486@gmail.com', '+919616848698', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1519, '69e85f79c53d28866dbd9161', 'Rishikesh', 'Phaneendra', 'Rishikesh Phaneendra', 'rishikeshphaneendra@gmail.com', '+918897634365', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1520, '69e85f6bc53d28866dbd8f06', 'PUSHPAK', 'CHAUDHARI', 'PUSHPAK CHAUDHARI', 'pushpakc357@gmail.com', '+918407943584', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1521, '69e85f60c53d28866dbd8cb8', 'Disha', 'Kochar', 'Disha Kochar', 'kochardisha15@gmail.com', '+918078607585', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1522, '69e85f50c53d28866dbd8a4f', 'Neha', 'Walzade', 'Neha Walzade', 'neha.walzade.in@gmail.com', '+919699183298', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1523, '69e85f3ac53d28866dbd87ff', 'Shobith', 'M', 'Shobith M', 'shobithm.sss.46@gmail.com', '+918884999659', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1524, '69e85f1ac53d28866dbd8323', 'SHRITEJ', 'NIMBHORKAR', 'SHRITEJ NIMBHORKAR', 'shritejnimbhorkar@gmail.com', '+917721827044', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1525, '69e85efcc53d28866dbd7e69', 'Bholanath', 'Bahure', 'Bholanath Bahure', 'bhola2001hgt@gmail.com', '+917498420314', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1526, '69e85eeac53d28866dbd7c14', 'Manish', 'Nagarkar', 'Manish Nagarkar', 'manishnagarkar547@gmail.com', '+919370473484', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1527, '69e85eddc53d28866dbd79c6', 'Mukul', 'Borkar', 'Mukul Borkar', 'mukulborkar03@gmail.com', '+917803815660', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1528, '69e85dfdc53d28866dbd76b1', 'Akash', 'Bodke', 'Akash Bodke', 'akashbodke0211@gmail.com', '+919325094549', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1529, '69e85df0c53d28866dbd7403', 'Vishal', 'Kumar', 'Vishal Kumar', 'kumarvishal2402@gmail.com', '+917368985988', 'active', '2026-07-07 05:04:11', '2026-07-07 05:04:11'),
(1531, '69e85dbac53d28866dbd6b9f', 'Srinjoy', 'Banerjee', 'Srinjoy Banerjee', 'srinjoybanerjee313@gmail.com', '+919903609426', 'active', '2026-07-07 05:04:12', '2026-07-07 05:04:12'),
(1532, '69e85da9c53d28866dbd6946', 'RAVI', 'POKURI', 'RAVI POKURI', 'pokuriraviteja2017@gmail.com', '+919640112850', 'active', '2026-07-07 05:04:12', '2026-07-07 05:04:12'),
(1533, '69e85da7c53d28866dbd689c', 'ISHAN', 'SHARMA', 'ISHAN SHARMA', 'workatishan@gmail.com', '+917000583083', 'active', '2026-07-07 05:04:12', '2026-07-07 05:04:12'),
(1534, '69e85d9dc53d28866dbd667e', 'Rohit', 'Kumar', 'Rohit Kumar', 'jangirrohit03@outlook.com', '+919119210092', 'active', '2026-07-07 05:04:12', '2026-07-07 05:04:12'),
(1535, '69e85d92c53d28866dbd65c2', 'ANIKET', 'INGALE', 'ANIKET INGALE', 'ingaleaniket007@gmail.com', '+918390399392', 'active', '2026-07-07 05:04:12', '2026-07-07 05:04:12'),
(1536, '69e85d8cc53d28866dbd63d3', 'Ravi', 'Vishwakarma', 'Ravi Vishwakarma', 'ravimvish777@gmail.com', '+919004526511', 'active', '2026-07-07 05:04:12', '2026-07-07 05:04:12'),
(1537, '69e85d83c53d28866dbd62f0', 'JAYANT', 'BHOSALE', 'JAYANT BHOSALE', 'jayantbhosale454@gmail.com', '+919096747523', 'active', '2026-07-07 05:04:12', '2026-07-07 05:04:12'),
(1538, '69e85d7ac53d28866dbd60e2', 'Sandeep', 'Kumar', 'Sandeep Kumar', 'developer.sandeepkushwaha@gmail.com', '+919991312557', 'active', '2026-07-07 05:04:12', '2026-07-07 05:04:12'),
(1539, '69e85d70c53d28866dbd5e93', 'Kedar', 'Terkhedkar', 'Kedar Terkhedkar', 'terkhedkarkedar.jobs@gmail.com', '+919623596845', 'active', '2026-07-07 05:04:12', '2026-07-07 05:04:12'),
(1540, '69e85d6dc53d28866dbd5972', 'Candidate', 'Unknown', 'Candidate Unknown', 'bharaniberry01@gmail.com', '+918098591254', 'active', '2026-07-07 05:04:12', '2026-07-07 05:04:12'),
(1541, '69e85d5dc53d28866dbd56a5', 'Durgadutta', 'Nanda', 'Durgadutta Nanda', 'durgadutta1992@gmail.com', '+919090189178', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1542, '69e85d4dc53d28866dbd5485', 'Abhishek', 'Wadekar', 'Abhishek Wadekar', 'abhishekw1809@gmail.com', '+919503523660', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1543, '69e85d47c53d28866dbd53c5', 'Girish', 'K A', 'Girish K A', 'girishkbhalli@gmail.com', '+918951166538', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1544, '69e85d2bc53d28866dbd2a61', 'Shrayash', 'Alshi', 'Shrayash Alshi', 'yash.alshi@gmail.com', '+918691986898', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1545, '69e85d19c53d28866dbd0ffb', 'Shivam', 'Varshney', 'Shivam Varshney', 'shivamvarshney19981@gmail.com', '+916395292283', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1546, '69e85d05c53d28866dbd0d85', 'BALAJI', 'MURUGESAN', 'BALAJI MURUGESAN', 'mvbalaji95@gmail.com', '+918754873262', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1547, '69e85cf8c53d28866dbd0afc', 'Tushar', 'Hambir', 'Tushar Hambir', 'tusharhambir29@gmail.com', '+919021233172', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1548, '69e85ce7c53d28866dbd0891', 'SHIVANI', 'RENAVIKAR', 'SHIVANI RENAVIKAR', 'shivanirenavikar@gmail.com', '+918605578134', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1549, '69e85cd6c53d28866dbd0621', 'Ramineni', 'Venkata Gopi Krishna', 'Ramineni Venkata Gopi Krishna', 'raminenivgk@gmail.com', '+917827046133', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1550, '69e85cc8c53d28866dbd03c9', 'Chetan', 'Borase', 'Chetan Borase', 'chetanborase070@gmail.com', '+919860619930', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1551, '69e85cb6c53d28866dbd0151', 'Akash', 'Unknown', 'Akash Unknown', 'akwork022@gmail.com', '+917703071044', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1552, '69e85cacc53d28866dbcff11', 'ABHISHEK', 'KOLKUR', 'ABHISHEK KOLKUR', 'abhishekkolkur23@gmail.com', '+918105992320', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1553, '69e85c9dc53d28866dbcfcc8', 'KRISHNA', 'PRATAP SINGH', 'KRISHNA PRATAP SINGH', 'krishna.unix10@gmail.com', '+918279420066', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1554, '69e85c8dc53d28866dbcfa7d', 'VENKATA', 'SUNIL R', 'VENKATA SUNIL R', 'venkatasunil0107@gmail.com', '+917598009359', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1555, '69e85c7dc53d28866dbcf82d', 'Tarique', 'Hayat', 'Tarique Hayat', 'hayattarique3@gmail.com', '+917970325605', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1556, '69e85c5cc53d28866dbcf382', 'Jahnavi', 'Bathini', 'Jahnavi Bathini', 'jahnavibathini@gmail.com', '+916305640386', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1557, '69e85c26c53d28866dbcec4c', 'AMAN', 'ARORA', 'AMAN ARORA', 'amanarora2242@gmail.com', '+919105584794', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1558, '69e85c15c53d28866dbce9f7', 'Santhosh', 'Lakshmi Marukurthi', 'Santhosh Lakshmi Marukurthi', 'santhoshimarukurthi0202@gmail.com', '+916300097207', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1559, '69e85bfec53d28866dbce7aa', 'B.', 'Gowthami', 'B. Gowthami', 'gowthamiyadav28@gmail.com', '+916303272315', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1560, '69e85bf2c53d28866dbce566', 'Soura', 'Kanti Saha', 'Soura Kanti Saha', 'sourakantisaha.dgp@gmail.com', '+918170840807', 'active', '2026-07-07 05:04:13', '2026-07-07 05:04:13'),
(1561, '69e85bcec53d28866dbce2fc', 'Manokaran', 'E', 'Manokaran E', 'manokaranm848@gmail.com', '+916383186269', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1562, '69e85bbec53d28866dbce0b9', 'Sohan', 'Kisara', 'Sohan Kisara', 'kisarasohan@gmail.com', '+919640672423', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1563, '69e85bb0c53d28866dbcde6c', 'Rajendra', 'Chappidi', 'Rajendra Chappidi', 'rajendrap.chappidi@gmail.com', '+917013771224', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1564, '69e85b9cc53d28866dbcdbfb', 'PRINCE', 'PANDA', 'PRINCE PANDA', 'pandaprince70@gamil.com', '+919034725680', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1565, '69e85b85c53d28866dbcd774', 'ANTRA', 'KAUR', 'ANTRA KAUR', 'antrapreet17@gmail.com', '+916280310439', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1566, '69e85b7ac53d28866dbcd530', 'Pratibha', 'Darekar', 'Pratibha Darekar', 'pratibhad0596@gmail.com', '+918805109655', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1567, '69e85b58c53d28866dbcd07d', 'Anubhav', 'Anand', 'Anubhav Anand', 'anubhav.anand.a2@gmail.com', '+917992387330', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1568, '69e85b4ac53d28866dbcce2f', 'Sangamanath', 'Muddebihal', 'Sangamanath Muddebihal', 'sangamanathmuddebihal069@gmail.com', '+918088400713', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1569, '69e85b3ac53d28866dbccbed', 'Srinithya', 'Koripelli', 'Srinithya Koripelli', 'k5srinithya@gmail.com', '+919347991185', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1570, '69e85b29c53d28866dbcc981', 'AMARJIT', 'GIRI', 'AMARJIT GIRI', 'amarjit8332@gmail.com', '+919348957948', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1571, '69e85b0ec53d28866dbcc717', 'Yamuna', 'Appikonda', 'Yamuna Appikonda', 'yamuna.appikonda9804@gmail.com', '+919603980424', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1572, '69e85affc53d28866dbcc4bd', 'Vijay', 'Verma', 'Vijay Verma', 'vijayverma07071999@gmail.com', '+918874988107', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1573, '69e85af1c53d28866dbcc25c', 'Shilpa', 'Singh', 'Shilpa Singh', 'singh.shilpa9953@gmail.com', '+919831366392', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1574, '69e85adec53d28866dbcbff5', 'Akshata', 'Shinde', 'Akshata Shinde', 'adshinde103@gmail.com', '+918308268016', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1575, '69e85acec53d28866dbcbda3', 'Mohan', 'Veerapuraju', 'Mohan Veerapuraju', 'abhiramveerapuraju1@gmail.com', '+919676406552', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1576, '69e859f9c53d28866dbcba9c', 'SHASHWATI', 'KUMARI', 'SHASHWATI KUMARI', 'kumarishashwati@gmail.com', '+917488803128', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1577, '69e859ebc53d28866dbcb857', 'Pradip', 'Wasane', 'Pradip Wasane', 'pradipwasane@gmail.com', '+918668837577', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1578, '69e859c9c53d28866dbcb5f9', 'Ashish', 'Gupta', 'Ashish Gupta', 'ashishgupta6195@gmail.com', '+919723779089', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1579, '69e859abc53d28866dbcb398', 'Anish', 'Bharti', 'Anish Bharti', 'anishbharti137@gmail.com', '+916201610484', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1580, '69e8599bc53d28866dbcb152', 'Gopinath', 'D', 'Gopinath D', 'gopinathd3737@gmail.com', '+918220548596', 'active', '2026-07-07 05:04:14', '2026-07-07 05:04:14'),
(1581, '69e85990c53d28866dbcaf00', 'Ankit', 'Raj', 'Ankit Raj', 'ankitraj1307@gmail.com', '+919852501161', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1582, '69e85984c53d28866dbcacb0', 'Vishal', 'Ingle', 'Vishal Ingle', 'vishalingle782@gmail.com', '+919834581384', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1583, '69e85962c53d28866dbcaa61', 'SUMIT', 'SINGH RAJPUT', 'SUMIT SINGH RAJPUT', 'codeitjunction01@gmail.com', '+918545966991', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1584, '69e8594cc53d28866dbca804', 'BASAVARAJ', 'KUSTAGI', 'BASAVARAJ KUSTAGI', 'basukustagi123@gmail.com', '+916362571405', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1585, '69e85939c53d28866dbca5ac', 'HARSHAVARDHAN', 'CHAPARLA', 'HARSHAVARDHAN CHAPARLA', 'hvchaparla@gmail.com', '+919133544751', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1586, '69e8592dc53d28866dbca35b', 'Rakhee', 'Das', 'Rakhee Das', 'rakheedas.98@gmail.com', '+917377954256', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1587, '69e85922c53d28866dbca117', 'ONKAR', 'MASAL', 'ONKAR MASAL', 'onkarmasal2@gmail.com', '+918282828354', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1588, '69e85912c53d28866dbc9eb9', 'Harshal', 'Kadam', 'Harshal Kadam', 'harshalkadam2026@gmail.com', '+918999686794', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1589, '69e858fcc53d28866dbc9c68', 'Harinarayanan', 'Unknown', 'Harinarayanan Unknown', 'harioff1998@outlook.com', '+918610439339', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1590, '69e858eec53d28866dbc9a24', 'Soumyadeep', 'Ghosh', 'Soumyadeep Ghosh', 'soumyadeep2564@gmail.com', '+918088136388', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1591, '69e858c7c53d28866dbc9584', 'Asma', 'Khan', 'Asma Khan', 'asma.khan.engg@gmail.com', '+919673020183', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1592, '69e858b9c53d28866dbc9338', 'Hemant', 'Shelar', 'Hemant Shelar', 'hemantshelar2016@gmail.com', NULL, 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1593, '69e858a0c53d28866dbc90da', 'Sunil', 'Kumar', 'Sunil Kumar', 'sunilkumar.epri@gmail.com', '+918210484788', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1594, '69e8588bc53d28866dbc8e87', 'Kumar', 'Aman', 'Kumar Aman', 'amansingh08031997@gmail.com', '+918210804453', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1595, '69e8587ac53d28866dbc8c38', 'B', 'Gunasekhar Reddy', 'B Gunasekhar Reddy', 'gunasekharreddybodireddy@gmail.com', '+916303707425', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1596, '69e85865c53d28866dbc89e1', 'Divyanshu', 'Pandey', 'Divyanshu Pandey', 'divyanshupandey.dev01@gmail.com', '+918368294007', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1597, '69e85858c53d28866dbc8795', 'MONIKA', 'SETIA', 'MONIKA SETIA', 'setiamonika84@gmail.com', '+919878666714', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1598, '69e8584ac53d28866dbc8552', 'DIVYASHREE', 'P', 'DIVYASHREE P', 'divyasmurthi@gmail.com', '+919731407395', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1599, '69e85836c53d28866dbc82fd', 'Alok', 'Kumar', 'Alok Kumar', 'alok.ku.j2002@gmail.com', '+916204542261', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1600, '69e8581cc53d28866dbc808e', 'Mriganka', 'Das', 'Mriganka Das', 'mrigankadas1712@gmail.com', '+919123961113', 'active', '2026-07-07 05:04:15', '2026-07-07 05:04:15'),
(1601, '69e8580cc53d28866dbc7e3c', 'Switi', 'Rangari', 'Switi Rangari', 'itsswitirangari@gmail.com', '+919834701863', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1602, '69e85801c53d28866dbc7bfb', 'Rachit', 'Rolaniya', 'Rachit Rolaniya', 'rrachit06.2001@gmail.com', '+919680580175', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1603, '69e857efc53d28866dbc79ac', 'Aditya', 'Kumar Dixit', 'Aditya Kumar Dixit', 'aditya.kumardixit1999@gmail.com', '+918982387407', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1604, '69e857dcc53d28866dbc775e', 'Aanchal', 'Anand', 'Aanchal Anand', 'aanchalanand1999@gmail.com', '+918757839775', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1605, '69e857c5c53d28866dbc440e', 'RITESH', 'CHAUHAN', 'RITESH CHAUHAN', 'ritesh15777@gmail.com', '+917775813688', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1606, '69e857b1c53d28866dbc41b4', 'Vidya', 'Nalawade', 'Vidya Nalawade', 'vidyanalawade28@gmail.com', '+917349168525', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1607, '69e8579fc53d28866dbc3f69', 'Bhagyesh', 'Wadhale', 'Bhagyesh Wadhale', 'bhagyeshwadhale1998@gmail.com', '+917249169633', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1608, '69e85791c53d28866dbc3d13', 'Manikanta', 'Anasuri', 'Manikanta Anasuri', 'manikanta.amk222@gmail.com', '+919010249757', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1609, '69e8577dc53d28866dbc3ace', 'Aiman', 'Zia', 'Aiman Zia', 'aimanziacs@gmail.com', '+918318209992', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1610, '69e85767c53d28866dbc3888', 'Namrata', 'Raut', 'Namrata Raut', 'namrataraut10@gmail.com', '+919922458653', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1611, '69e8573fc53d28866dbc33de', 'Khushi', 'Bisen', 'Khushi Bisen', 'khushibisen2912@gmail.com', '+916265643913', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1612, '69e8572ec53d28866dbc3190', 'Roshan', 'Gawale', 'Roshan Gawale', 'gawaleroshan12@gmail.com', '+919881697473', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1613, '69e85717c53d28866dbc2f39', 'ROSHAN', 'SAHU', 'ROSHAN SAHU', 'sahuroshan96@gmail.com', '+917225008374', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1614, '69e85703c53d28866dbc2ce3', 'SUMATI', 'KUMARI', 'SUMATI KUMARI', 'sumatik112@gmail.com', '+919122151178', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1615, '69e856f3c53d28866dbc2a7b', 'Sumit', 'Kumar', 'Sumit Kumar', 'sugesstiontosumit@gmail.com', '+918217200742', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1616, '69e856e7c53d28866dbc2836', 'Ranjeet', 'Tat', 'Ranjeet Tat', 'ranjeettat01@gmail.com', '+918261876894', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1617, '69e856d8c53d28866dbc25d8', 'Ravi', 'Gupta', 'Ravi Gupta', 'raviprakashg99@gmail.com', '+918853224393', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1618, '69e856c2c53d28866dbc238a', 'Debmalya', 'Dutta', 'Debmalya Dutta', 'debmalyad2001@gmail.com', '+919051772692', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1619, '69e856b4c53d28866dbc213f', 'Akshay', 'HK', 'Akshay HK', 'hkakshay793@gmail.com', '+9187587832', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1620, '69e856a6c53d28866dbc1eef', 'Aashish', 'Chauhan', 'Aashish Chauhan', 'aashishchauhan8600@gmail.com', '+917310884063', 'active', '2026-07-07 05:04:16', '2026-07-07 05:04:16'),
(1621, '69e8568cc53d28866dbc1c92', 'Palak', 'Bodhani', 'Palak Bodhani', 'palakbodhani.connect@gmail.com', '+917580841313', 'active', '2026-07-07 05:04:17', '2026-07-07 05:04:17'),
(1622, '69e8567ec53d28866dbc1a95', 'JITENDRA', 'PATEL', 'JITENDRA PATEL', 'pateljitendra6061@gmail.com', '+919925416061', 'active', '2026-07-07 05:04:17', '2026-07-07 05:04:17'),
(1623, '69e8566ac53d28866dbc16c4', 'Shubham', 'Zambre', 'Shubham Zambre', 'shubhamzambre90@gmail.com', '+918262044504', 'active', '2026-07-07 05:04:17', '2026-07-07 05:04:17'),
(1624, '69e8565dc53d28866dbc1454', 'Ashish', 'Shinde', 'Ashish Shinde', 'shindeashish6342@gmail.com', '+918999479372', 'active', '2026-07-07 05:04:17', '2026-07-07 05:04:17'),
(1625, '69e85658c53d28866dbc120b', 'Saravanan', 'Ramaiya', 'Saravanan Ramaiya', 'mailtosaravananramu@gmail.com', '+918531059030', 'active', '2026-07-07 05:04:17', '2026-07-07 05:04:17'),
(1626, '69e85644c53d28866dbc0ede', 'Piyush', 'Ahire', 'Piyush Ahire', 'ahirepiyush03@gmail.com', '+919172048806', 'active', '2026-07-07 05:04:17', '2026-07-07 05:04:17'),
(1627, '69e85632c53d28866dbc0c7a', 'Mritunjay', 'Kumar', 'Mritunjay Kumar', 'mritunjayk3155@gmail.com', '+919123496910', 'active', '2026-07-07 05:04:17', '2026-07-07 05:04:17'),
(1628, '69e85618c53d28866dbc0a18', 'Pranab', 'Karmakar', 'Pranab Karmakar', 'pranab.svsnm@gmail.com', '+917384727263', 'active', '2026-07-07 05:04:17', '2026-07-07 05:04:17'),
(1629, '69e85606c53d28866dbc079d', 'Akash', 'Yadav', 'Akash Yadav', 'akashyadav1121998@gmail.com', '+919950176074', 'active', '2026-07-07 05:04:17', '2026-07-07 05:04:17'),
(1630, '69e855ddc53d28866dbc0520', 'JAYESH', 'PATIL', 'JAYESH PATIL', 'jayeshpatil1098@gmail.com', '+918600823711', 'active', '2026-07-07 05:04:17', '2026-07-07 05:04:17'),
(1631, '69e855c9c53d28866dbc0293', 'Ayush', 'Singh', 'Ayush Singh', 'ayushsinghsde85002@gmail.com', '+917906485002', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1632, '69e855b8c53d28866dbc003e', 'Prateek', 'Tiwari', 'Prateek Tiwari', 'prateektiwari010799@gmail.com', '+917842465565', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1633, '69e855a4c53d28866dbbfdd8', 'SAMARTH', 'KATAREY', 'SAMARTH KATAREY', 'katareysamarth@gmail.com', '+918319121160', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1634, '69e8558fc53d28866dbbfb7f', 'ANU', 'SIVA SUMATHI SREE', 'ANU SIVA SUMATHI SREE', 'anunakka05@gmail.com', '+918228191989', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1635, '69e8557fc53d28866dbbf92f', 'S', 'VENKAT', 'S VENKAT', 'siddisunnyvenkat@gmail.com', '+918121189789', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1636, '69e8556bc53d28866dbbf6eb', 'SHANTA', 'KARN', 'SHANTA KARN', 'shantakarn193@gmail.com', '+918917494405', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1637, '69e8555ac53d28866dbbf49e', 'Satyam', 'Trivedi', 'Satyam Trivedi', 'satyamtrivedi111@gmail.com', '+918263860698', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1638, '69e85540c53d28866dbbf237', 'DURGA', 'SHANKAR PANDEY', 'DURGA SHANKAR PANDEY', 'durgashankar059@gmail.com', '+918299035433', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1639, '69e85531c53d28866dbbefd1', 'Vishal', 'Borase', 'Vishal Borase', 'borsevishal40@gmail.com', '+919518348804', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1640, '69e8551fc53d28866dbbed5e', 'Prajwal', 'D Dharankar', 'Prajwal D Dharankar', 'prajwal.dharankar9707@gmail.com', '+917083137748', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1641, '69e8550ec53d28866dbbeb05', 'SHARADASHANKAR', 'DAS', 'SHARADASHANKAR DAS', 'sharadashankar209@gmail.com', '+918456035445', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1642, '69e854fbc53d28866dbbe89b', 'Sarthak', 'Taneja', 'Sarthak Taneja', 'sarthak.taneja.in@gmail.com', '+918130822329', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1643, '69e854e9c53d28866dbbe640', 'Jay', 'Yadav', 'Jay Yadav', 'jaysgryadav@gmail.com', '+918624954434', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1644, '69e854c6c53d28866dbbe195', 'SHRADHA', 'PATIL', 'SHRADHA PATIL', 'shradhapatil.1112@gmail.com', '+918459259329', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1645, '69e854b0c53d28866dbbdf46', 'Shailesh', 'Agarmore', 'Shailesh Agarmore', 'shaileshagarmore99@gmail.com', NULL, 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1646, '69e85499c53d28866dbbdce5', 'Dikshita', 'Raikar', 'Dikshita Raikar', 'dikshitaraikar506@gmail.com', '+916362948298', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1647, '69e85486c53d28866dbbda98', 'Aman', 'Kapse', 'Aman Kapse', 'kapseaman1432@gmail.com', '+919021001430', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1648, '69e85453c53d28866dbbd390', 'Paras', 'Sharma', 'Paras Sharma', 'paras.sharma6710@gmail.com', '+918491985052', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1649, '69e85443c53d28866dbbd131', 'Saiprasad', 'Bhimewar', 'Saiprasad Bhimewar', 'saibhimewar788@gmail.com', '+919404743230', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1650, '69e85436c53d28866dbbcedf', 'Sitaramireddy', 'Kommasani', 'Sitaramireddy Kommasani', 'envelopesitharamireddy025@gmail.com', '+919390201170', 'active', '2026-07-07 05:04:18', '2026-07-07 05:04:18'),
(1651, '69e85426c53d28866dbbcc83', 'Himanshu', 'Shekhar', 'Himanshu Shekhar', 'himanshushekhar1089@gmail.com', '+919973145208', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1652, '69e8540bc53d28866dbbca11', 'Shreya', 'Saraf', 'Shreya Saraf', 'shreyasaraf898@gmail.com', '+918857890661', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1653, '69e85400c53d28866dbbc7cf', 'PRADEEP', 'SAWANT', 'PRADEEP SAWANT', 'pradeepsawant19971@gmail.com', '+919518324694', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1654, '69e853f1c53d28866dbbc57c', 'Prathamesh', 'Morankar', 'Prathamesh Morankar', 'prathameshmorankar11@gmail.com', '+917499059086', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1655, '69e853e4c53d28866dbbc2f5', 'ABHISHEK', 'KUMAR', 'ABHISHEK KUMAR', 'rojhaabhishek455@gmail.com', '+919003295621', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1656, '69e853cfc53d28866dbbc093', 'Amit', 'Kumar Palai', 'Amit Kumar Palai', 'iamamitkumarpalai@gmail.com', '+917406095464', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1657, '69e853b5c53d28866dbbbe34', 'Gokulakumar', 'S', 'Gokulakumar S', 'gokulakumar77@gmail.com', '+918248019779', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1658, '69e853a7c53d28866dbbbbd3', 'BALAJI', 'MAILAVARAPU', 'BALAJI MAILAVARAPU', 'balajim280699@gmail.com', '+918143288461', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1659, '69e85395c53d28866dbbb977', 'Jayesh', 'Rathi', 'Jayesh Rathi', 'rathijayesh17@gmail.com', '+919834249044', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1660, '69e85387c53d28866dbbb727', 'Krushna', 'Vanave', 'Krushna Vanave', 'vanavek58@gmail.com', '+918208487539', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1661, '69e85375c53d28866dbbb4be', 'KOMAL', 'GUPTA', 'KOMAL GUPTA', '193komalgupta@gmail.com', '+919304311467', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1662, '69e85364c53d28866dbbb27c', 'Sangameshwar', 'Chawale', 'Sangameshwar Chawale', 'sangamchawale1701@gmail.com', '+917820836247', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1663, '69e85352c53d28866dbbb01d', 'Swati', 'Sonaje', 'Swati Sonaje', 'swatisonaje9013@gmail.com', '+917350953674', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1664, '69e8533dc53d28866dbbad1f', 'Mayuri', 'Khairnar', 'Mayuri Khairnar', 'mayuri.khairnar2514@gmail.com', '+918975804730', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1665, '69e8531cc53d28866dbba862', 'GURU', 'RAGHAVENDRA TELKAR', 'GURU RAGHAVENDRA TELKAR', 'gururaghavendratelkar@gmail.com', '+918341085448', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1666, '69e85305c53d28866dbba603', 'Gaurav', 'Landage', 'Gaurav Landage', 'gauravlandage32@gmail.com', '+918652007350', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1667, '69e852f6c53d28866dbba392', 'Shiv', 'Kumar Sharma', 'Shiv Kumar Sharma', 'shivksharma2332@gmail.com', '+919520195019', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1668, '69e84faac53d28866dbb9ddf', 'Durga', 'N', 'Durga N', 'durganagavarapu6@gmail.com', '+918184953291', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1669, '69e84f9dc53d28866dbb9b7a', 'Bandi', 'Bhavani Bala Krishna Reddy', 'Bandi Bhavani Bala Krishna Reddy', 'bhavanibala889@gmail.com', '+918897788836', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1670, '69e84f89c53d28866dbb9917', 'VIJAYKUMAR', 'SIVAJOTHY', 'VIJAYKUMAR SIVAJOTHY', 'vijay.sivajothy@gmail.com', '+917904988020', 'active', '2026-07-07 05:04:19', '2026-07-07 05:04:19'),
(1671, '69e84f78c53d28866dbb96c6', 'Parameshwari', 'Velsamy', 'Parameshwari Velsamy', 'rajibama1998@gmail.com', '+919894486345', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1672, '69e84f6bc53d28866dbb946d', 'Geetha Sri', 'Potnuru', 'Geetha Sri Potnuru', 'geethasripotnuru26@gmail.com', '+917095959513', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1673, '69e84f58c53d28866dbb9215', 'AJAY', 'JAPE', 'AJAY JAPE', 'ajayjape8@gmail.com', '+917498556103', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1674, '69e84f4cc53d28866dbb8fc7', 'DIVYA', 'RAWAL', 'DIVYA RAWAL', 'divya.rawal.tech@gmail.com', '+917089150418', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1675, '69e84f40c53d28866dbb8d79', 'Kunal', 'Uge', 'Kunal Uge', 'kunaluge1@gmail.com', '+918600918656', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1676, '69e84f2ec53d28866dbb8b2d', 'Kota', 'Prudvi', 'Kota Prudvi', 'kotaprudvi.666@gmail.com', '+918688102341', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1677, '69e84f1cc53d28866dbb88de', 'Ranjeet', 'Pandhare', 'Ranjeet Pandhare', 'ranjeetpsm@gmail.com', '+918208037602', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1678, '69e84f09c53d28866dbb8693', 'Rahul', 'Waghmare', 'Rahul Waghmare', 'waghmarerahul9960@gmail.com', '+919960183705', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1679, '69e84eefc53d28866dbb8305', 'SANDHIYA', 'M', 'SANDHIYA M', 'sandhiyahema1212@gmail.com', '+916380967657', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1680, '69e84ee2c53d28866dbb80c4', 'MOHD', 'SAQIB', 'MOHD SAQIB', 'saqibtyagi7818@gmail.com', '+917818971005', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1681, '69e84ed6c53d28866dbb7e79', 'Vishal', 'Chavan', 'Vishal Chavan', 'vishal2457chavan@gmail.com', '+917887352457', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1682, '69e84ec3c53d28866dbb7c09', 'MEHUL', 'THAPA', 'MEHUL THAPA', 'mehulthapa122@gmail.com', '+918219121985', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1683, '69e84eb8c53d28866dbb7981', 'Amit', 'Kumar', 'Amit Kumar', 'kumar45amit03@gmail.com', '+919050774585', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1684, '69e84eaac53d28866dbb7734', 'MUTYALA RAMA SATYA ANANYA', 'Unknown', 'MUTYALA RAMA SATYA ANANYA Unknown', 'ananyamutyala19@gmail.com', '+919381793684', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1685, '69e84e9cc53d28866dbb74d6', 'Aravind', 'Unknown', 'Aravind Unknown', 'aravindjofficial@gmail.com', '+919790908800', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1686, '69e84e8ac53d28866dbb7286', 'VINAYAKUMAR', 'SANKAPPALAVAR', 'VINAYAKUMAR SANKAPPALAVAR', 'hsvinaykumar24@gmail.com', '+917996031002', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1687, '69e84e79c53d28866dbb7038', 'Sumit', 'Garg', 'Sumit Garg', 'gargsumit0399@gmail.com', '+918077174270', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1688, '69e84e69c53d28866dbb6de5', 'Satyam', 'Kumar', 'Satyam Kumar', 'satyamranjan4035@gmail.com', '+917462079232', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1689, '69e84e53c53d28866dbb6b8c', 'BHUSHAN', 'PADIR', 'BHUSHAN PADIR', 'bhushanpatil2025@gmail.com', '+917972212845', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1690, '69e84e46c53d28866dbb6933', 'Kalpak', 'Kale', 'Kalpak Kale', 'kalpakkale9@gmail.com', '+919511884927', 'active', '2026-07-07 05:04:20', '2026-07-07 05:04:20'),
(1691, '69e84e2dc53d28866dbb6489', 'Akash', 'Sharma', 'Akash Sharma', 'sharmaakash2092001@gmail.com', '+919350567931', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1692, '69e84e18c53d28866dbb621d', 'ASHISH', 'YADAV', 'ASHISH YADAV', '30596.ashu@gmail.com', '+919651368456', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1693, '69e84e0ac53d28866dbb5fca', 'Dhurv', 'Singh', 'Dhurv Singh', 'dhruvjadaun9995@gmail.com', '+918787016464', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1694, '69e84dfbc53d28866dbb5d66', 'Kumar', 'Aryan', 'Kumar Aryan', 'sushantkraryan@gmail.com', '+918092673165', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1695, '69e84debc53d28866dbb5b23', 'C', 'Kishore Reddy', 'C Kishore Reddy', 'kishorechittepu@gmail.com', '+919160225016', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1696, '69e84ddac53d28866dbb58cb', 'Veeresh', 'Pattar', 'Veeresh Pattar', 'veereshp.atworkspace@gmail.com', '+918496879676', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1697, '69e84dc7c53d28866dbb567a', 'ANISHA', 'NAGARAJAN', 'ANISHA NAGARAJAN', 'anisha99usa@gmail.com', '+918903723179', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1698, '69e84dbec53d28866dbb542d', 'Mayur', 'Chaudhari', 'Mayur Chaudhari', 'mayurc3327@gmail.com', '+919604553425', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1699, '69e84da9c53d28866dbb51d7', 'Anuran', 'Bose', 'Anuran Bose', 'anuran.bose.ece21@heritageit.edu.in', '+919830505994', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1700, '69e84d99c53d28866dbb4f6c', 'MANOJ', 'RAJORIYA', 'MANOJ RAJORIYA', 'manojrajoriya1995@gmail.com', '+917828225410', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1701, '69e84d88c53d28866dbb4d1e', 'PRIYANKA', 'KUNCHALA', 'PRIYANKA KUNCHALA', 'kunchalapriyanka06@gmail.com', '+918919125706', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1702, '69e84d85c53d28866dbb4ade', 'ANIL', 'JEJURKAR', 'ANIL JEJURKAR', 'aniljejurkar.9922@gmail.com', '+917448012826', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1703, '69e84d76c53d28866dbb488d', 'Kuldeep', 'Dubey', 'Kuldeep Dubey', 'kuldeepdubey1802@gmail.com', '+919559059563', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1704, '69e84d62c53d28866dbb4627', 'Abhishek', 'Sharma', 'Abhishek Sharma', 'abhishekmaharshi07@gmail.com', '+918426826437', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1705, '69e84d52c53d28866dbb43cf', 'Atharva', 'Dhoot', 'Atharva Dhoot', 'dhootatharva18@gmail.com', '+918669297840', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1706, '69e84d3fc53d28866dbb4178', 'ABHISHEK', 'KULKARNI', 'ABHISHEK KULKARNI', 'abhishek.k.24051@gmail.com', '+919893763178', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1707, '69e84d32c53d28866dbb3f2c', 'Akash', 'Kande', 'Akash Kande', 'akashkande07@gmail.com', '+919922900686', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1708, '69e84d25c53d28866dbb3cd7', 'Nehal', 'Somod', 'Nehal Somod', 'nehal.somod341@gmail.com', '+917276045341', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1709, '69e84d08c53d28866dbb3843', 'Abinash', 'Ray', 'Abinash Ray', 'abinashray4624@gmail.com', '+919078677397', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1710, '69e84cf2c53d28866dbb35e2', 'Selvaganapathi', 'S', 'Selvaganapathi S', 'selvaganapathi964@gmail.com', '+919597726473', 'active', '2026-07-07 05:04:21', '2026-07-07 05:04:21'),
(1711, '69e84ce8c53d28866dbb3390', 'Kshitij', 'Tripathi', 'Kshitij Tripathi', 'tripathikshitij212@gmail.com', '+917571947999', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1712, '69e84cdac53d28866dbb313d', 'Manvendra', 'Pal Singh', 'Manvendra Pal Singh', 'engineer.manvendra1998@gmail.com', '+919286367512', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1713, '69e84cbcc53d28866dbb2ed3', 'AMEY', 'MOHITE', 'AMEY MOHITE', 'ameymohite00@gmail.com', '+918329035862', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1714, '69e8479ec53d28866dbaf9cf', 'CHANDAN', 'KUMAR PRADHAN', 'CHANDAN KUMAR PRADHAN', 'chandankumarpradhan82@gmail.com', '+918688482268', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22');
INSERT INTO `students` (`id`, `external_id`, `first_name`, `last_name`, `full_name`, `email`, `phone_number`, `status`, `created_at`, `updated_at`) VALUES
(1715, '69e84763c53d28866dbaf2e3', 'DATTARAJ', 'UDGIRI', 'DATTARAJ UDGIRI', 'dattaraj.udgiri@gmail.com', '+917768929257', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1716, '69e84752c53d28866dbaf088', 'Preethi', 'Br', 'Preethi Br', 'preethibr666@gmail.com', '+919187044896', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1717, '69e84743c53d28866dbaee32', 'ANUJA', 'KUMAR', 'ANUJA KUMAR', 'anujaskumar22@gmail.com', '+918086232516', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1718, '69e84739c53d28866dbaebf1', 'Ajithkumar', 'G', 'Ajithkumar G', 'ajithkumargunasekar1906@gmail.com', '+919677908652', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1719, '69e84728c53d28866dbae9a2', 'Altaf', 'Hussain', 'Altaf Hussain', 'mollaalthafhussain@gmail.com', '+919381869474', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1720, '69e8470bc53d28866dbae4fa', 'Adi', 'Narayana Satharla', 'Adi Narayana Satharla', 'adhina444@gmail.com', '+917569182336', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1721, '69e846fac53d28866dbae29f', 'Sachin', 'Pawane', 'Sachin Pawane', 'spawane3006@outlook.com', '+917498877692', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1722, '69e846ebc53d28866dbae05b', 'Priti', 'Kotyal', 'Priti Kotyal', 'pritikotyal@gmail.com', '+919904971504', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1723, '69e846dec53d28866dbade02', 'Polana', 'Yukesh', 'Polana Yukesh', 'yukeshpolana9@gmail.com', '+917036130949', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1724, '69e846cdc53d28866dbadba9', 'Sasikumar', 'Sakthivel', 'Sasikumar Sakthivel', 'sasikumar.sakthivel2000@gmail.com', '+919080250335', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1725, '69e846b1c53d28866dbad71d', 'Rushikesh', 'Joshi', 'Rushikesh Joshi', 'rushikeshjoshi@duck.com', '+918087568338', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1726, '69e8469fc53d28866dbad4c7', 'Prishu', 'Pandey', 'Prishu Pandey', 'prishupandey01142@gmail.com', '+919162926078', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1727, '69e84690c53d28866dbad26b', 'Snehal', 'Galande', 'Snehal Galande', 'sdgalande1710@gmail.com', '+917517393694', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1728, '69e84685c53d28866dbad020', 'Roddam', 'Reddy', 'Roddam Reddy', 'rvrkr33@gmail.com', '+919381280082', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1729, '69e84679c53d28866dbacdd6', 'Rutuja', 'Khose', 'Rutuja Khose', 'rutujakhose0@gmail.com', '+919552241178', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1730, '69e8466ac53d28866dbacb83', 'Yugandhar', 'Bandi', 'Yugandhar Bandi', 'yugandhar1611@gmail.com', '+916302411809', 'active', '2026-07-07 05:04:22', '2026-07-07 05:04:22'),
(1731, '69e8465ec53d28866dbac93d', 'Laxmi', 'BM', 'Laxmi BM', 'laxmibm619@gmail.com', '+916362121842', 'active', '2026-07-07 05:04:23', '2026-07-07 05:04:23'),
(1732, '69e84651c53d28866dbac6ea', 'HRUSHIKESH', 'YELEKAR', 'HRUSHIKESH YELEKAR', 'yelekarhrushikesh123@gmail.com', '+919146714976', 'active', '2026-07-07 05:04:23', '2026-07-07 05:04:23'),
(1733, '69e8463bc53d28866dbac499', 'Dnyandeep', 'Sagar', 'Dnyandeep Sagar', 'dnyandeepsagar1999@gmail.com', '+918806995545', 'active', '2026-07-07 05:04:23', '2026-07-07 05:04:23'),
(1734, '69e84629c53d28866dbac245', 'Naga Venkata Sai Pradeep', 'Ungarala', 'Naga Venkata Sai Pradeep Ungarala', 'venkatasai3712@gmail.com', '+917989166219', 'active', '2026-07-07 05:04:23', '2026-07-07 05:04:23'),
(1735, '69e8461cc53d28866dbabffb', 'Chetan', 'Nimbargi', 'Chetan Nimbargi', 'chetansnimbargi45@gmail.com', '+918830716645', 'active', '2026-07-07 05:04:23', '2026-07-07 05:04:23'),
(1736, '69e8460cc53d28866dbabdad', 'Parth', 'Dhingani', 'Parth Dhingani', 'pmdhingani@gmail.com', '+919726100948', 'active', '2026-07-07 05:04:23', '2026-07-07 05:04:23'),
(1737, '69e845f8c53d28866dbabb42', 'Amarnath', 'Unknown', 'Amarnath Unknown', 'aravantiamarnath42@gmail.com', '+919160490939', 'active', '2026-07-07 05:04:23', '2026-07-07 05:04:23'),
(1738, '69e845e4c53d28866dbab6a2', 'SRI', 'VASAVI DASARI', 'SRI VASAVI DASARI', 'vasavidasari38@gmail.com', '+918919619711', 'active', '2026-07-07 05:04:23', '2026-07-07 05:04:23'),
(1739, '69e845b4c53d28866dbaaf6e', 'VIGNESHKUMAR', 'D', 'VIGNESHKUMAR D', 'vigneshkumar27820@gmail.com', '+917806960895', 'active', '2026-07-07 05:04:23', '2026-07-07 05:04:23'),
(1740, '69e8459cc53d28866dbaad10', 'HARI', 'KARAN J', 'HARI KARAN J', 'hari07pravin@gmail.com', '+917092365537', 'active', '2026-07-07 05:04:23', '2026-07-07 05:04:23'),
(1741, '69e84587c53d28866dbaaaa8', 'SATWIKA', 'Unknown', 'SATWIKA Unknown', 'satwika381@gmail.com', '+916302927938', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1742, '69e8456bc53d28866dbaa60b', 'Aryan', 'Raj', 'Aryan Raj', 'raj48622@gmail.com', '+919631540573', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1743, '69e8455bc53d28866dbaa3ab', 'Vaibhav', 'Rahane', 'Vaibhav Rahane', 'vaibhavrahane80@gmail.com', '+917977151267', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1744, '69e8454ec53d28866dbaa14e', 'Rohith', 'Darnasi', 'Rohith Darnasi', 'rohithdarnasi123@gmail.com', '+919133780390', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1745, '69e84533c53d28866dba9c9c', 'DEEPAKRAJA', 'K K', 'DEEPAKRAJA K K', 'deepakrajatech@gmail.com', '+919003911686', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1746, '69e84517c53d28866dba9a1d', 'Vignesh', 'Venkatesan', 'Vignesh Venkatesan', 'vigneshvenky210@gmail.com', '+918610400046', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1747, '69e84508c53d28866dba97d5', 'MEENAKSHI', 'GURRALA', 'MEENAKSHI GURRALA', 'meenakshigurrala3939@gmail.com', '+918187046574', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1748, '69e844f8c53d28866dba9581', 'Karuna', 'More', 'Karuna More', 'karunamore411@gmail.com', '+918459989223', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1749, '69e844ebc53d28866dba931b', 'Gokulan', 'C', 'Gokulan C', 'c.gokulan.profs@gmail.com', '+919159176632', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1750, '69e844d2c53d28866dba90b6', 'PANTHANGI', 'MUNI RATHNAM', 'PANTHANGI MUNI RATHNAM', 'panthangimuni04@gmail.com', '+917799268356', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1751, '69e844c3c53d28866dba8e4a', 'SANJAY', 'PATIL', 'SANJAY PATIL', 'sanjaypatilsp0204@gmail.com', '+919503691982', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1752, '69e844b3c53d28866dba8bea', 'Kousalya', 'Unknown', 'Kousalya Unknown', 'vemulakousalya@gmail.com', '+919346727542', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1753, '69e844a5c53d28866dba899c', 'Jithendar', 'Unknown', 'Jithendar Unknown', 'jithendar135g@gmail.com', '+917995231416', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1754, '69e8435bc53d28866dba867b', 'SAI', 'KUMAR DADI', 'SAI KUMAR DADI', 'saidadi345@gmail.com', '+918688098426', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1755, '69e84344c53d28866dba842a', 'Snehil', 'Sahu', 'Snehil Sahu', 'snehilsahu3111999@gmail.com', '+919575927446', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1756, '69e84332c53d28866dba81d4', 'BASANAGOUDABIRADAR', 'Unknown', 'BASANAGOUDABIRADAR Unknown', 'basanagoudabiradar144@gmail.com', '+919035270084', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1757, '69e84301c53d28866dba7ce2', 'Narasimha', 'Boggiti', 'Narasimha Boggiti', 'boggitinarasimha8@gmail.com', '+16303308105', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1758, '69e842f4c53d28866dba7a96', 'Mohanajothi', 'Unknown', 'Mohanajothi Unknown', 'mohanajothi0807@gmail.com', '+918667374312', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1759, '69e842ebc53d28866dba7842', 'KOSURU', 'NAVEEN KUMAR', 'KOSURU NAVEEN KUMAR', 'naveenkumar.kosur@gmail.com', '+919494814328', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1760, '69e842d6c53d28866dba7395', 'Saravan', 'Hanchate', 'Saravan Hanchate', 'saravanhanchate2001@gmail.com', '+919492595690', 'active', '2026-07-07 05:04:24', '2026-07-07 05:04:24'),
(1761, '69e842abc53d28866dba6be9', 'Anjan', 'Kumar', 'Anjan Kumar', 'anjankammara@gmail.com', '+918919038404', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1762, '69e84268c53d28866dba6048', 'Mohini', 'Yerramsetti', 'Mohini Yerramsetti', 'mohiniyerramsetti999@gmail.com', '+919618655796', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1763, '69e840f3c53d28866dba2510', 'Mayank', 'Dewani', 'Mayank Dewani', 'dewanimayank20@gmail.com', '+916264252598', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:27'),
(1764, '69e7921bc53d28866db9e772', 'SHAIK', 'TAHEER BASHA', 'SHAIK TAHEER BASHA', 'shaiktaheerbasha25@gmail.com', '+919177122757', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1765, '69e7920bc53d28866db9e51f', 'SUMANGALADHALI', 'Unknown', 'SUMANGALADHALI Unknown', 'sumangaladhali@gmail.com', '+919035320641', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1766, '69e791fcc53d28866db9e2c4', 'Shrutee', 'Pimpare', 'Shrutee Pimpare', 'shruteepimpare209@gmail.com', '+918669176480', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1767, '69e791e3c53d28866db9e05a', 'SHRIDHAR', 'PATIL', 'SHRIDHAR PATIL', 'shridharpatil723@gmail.com', '+918494833669', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1768, '69e791d4c53d28866db9ddf5', 'Shivanand', 'Bagewadi', 'Shivanand Bagewadi', 'shivanandbagewadi9084@gmail.com', '+919945841344', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1769, '69e791bac53d28866db9db89', 'Shithin', 'Shetty', 'Shithin Shetty', 'shithinworks@gmail.com', '+917022687595', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1770, '69e791a7c53d28866db9d911', 'Sherin', 'Shajan', 'Sherin Shajan', 'sherinz1073@gmail.com', '+917994082846', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1771, '69e7919ac53d28866db9d6ca', 'Shankiya', 'K G', 'Shankiya K G', 'shankiya7@gmail.com', '+919498069695', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1772, '69e7918dc53d28866db9d471', 'Sandeep', 'Kalasagonda', 'Sandeep Kalasagonda', 'sandeeprajendra00@gmail.com', '+918530794719', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1773, '69e7917ac53d28866db9d1ac', 'Saibhavani', 'Palla', 'Saibhavani Palla', 'saibhavanipalla308@gmail.com', '+919573802701', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1774, '69e79167c53d28866db9cf45', 'Rohit', 'Chikmath', 'Rohit Chikmath', 'rohitchikmath69@gmail.com', '+919148321699', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1775, '69e79154c53d28866db9cce3', 'RAJNISH', 'SHARMA', 'RAJNISH SHARMA', 'rajnishkumar81145@gmail.com', '+918114530825', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1776, '69e7913bc53d28866db9ca70', 'Rajesh', 'Gupta', 'Rajesh Gupta', 'rajeshg8726@gmail.com', '+918726141025', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1777, '69e79122c53d28866db9c80f', 'PUJARI', 'SRINIVASULU', 'PUJARI SRINIVASULU', 'srinusrinu93486@gmail.com', '+919347341271', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1778, '69e79115c53d28866db9c5b0', 'PREETI', 'SINGH', 'PREETI SINGH', 'preetisinghh2024@gmail.com', '+918081277167', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1779, '69e79101c53d28866db9c33e', 'PRAJWAL', 'GAONKAR', 'PRAJWAL GAONKAR', 'prajwalgaonkar6196@gmail.com', '+916360649747', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1780, '69e790f5c53d28866db9c0e6', 'Pooja', 'Mor', 'Pooja Mor', 'ptmor22@gmail.com', '+917027161701', 'active', '2026-07-07 05:04:25', '2026-07-07 05:04:25'),
(1781, '69e790e8c53d28866db9be7e', 'Nitish', 'Kumar Maurya', 'Nitish Kumar Maurya', 'mauryanitish2001@gmail.com', '+919799129167', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1782, '69e790d3c53d28866db9bc17', 'Nikhil', 'Suhas Patil', 'Nikhil Suhas Patil', 'nikhilpatil22599@gmail.com', '+918007279849', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1783, '69e790bcc53d28866db9b9b0', 'NEMIRAJ', 'B', 'NEMIRAJ B', 'nemirajbharatharaju@gmail.com', '+917975245016', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1784, '69e7909ec53d28866db9b742', 'M', 'REAGAN', 'M REAGAN', 'reaganmurgesh@gmail.com', '+917020422188', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1785, '69e79092c53d28866db9b4f7', 'ML', 'SOUMIKA', 'ML SOUMIKA', 'mlsoumika2003@gmail.com', '+918904230325', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1786, '69e79084c53d28866db9b2aa', 'MALLANAGOUDA', 'BIRADAR', 'MALLANAGOUDA BIRADAR', 'mallanagoudarbiradar@gmail.com', '+918971288164', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1787, '69e79053c53d28866db9add4', 'K.', 'Aman Sagar', 'K. Aman Sagar', 'kumaramansagar01@gmail.com', '+918434120273', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1788, '69e79040c53d28866db9ab66', 'K', 'DEEKSHA', 'K DEEKSHA', 'deekshaks187@gmail.com', '+918867595229', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1789, '69e79036c53d28866db9a911', 'KOPPALA', 'SIVA PALLAVI', 'KOPPALA SIVA PALLAVI', 'sivapallavik2002@gmail.com', '+919347868477', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1791, '69e7901ec53d28866db9a462', 'Jujina', 'Joy', 'Jujina Joy', '99jujinajoy@gmail.com', '+4915751884958', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1792, '69e79012c53d28866db9a200', 'JOHN', 'DANIEL P', 'JOHN DANIEL P', 'johnsd2709@gmail.com', '+919361296676', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1793, '69e79001c53d28866db99fa4', 'JEEVITHA', 'K S', 'JEEVITHA K S', 'ksjeevitha.m1931@gmail.com', '+919500993334', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1794, '69e78ff5c53d28866db99d43', 'Jeevan', 'Kayala', 'Jeevan Kayala', 'akayalajeevanprakash@gmail.com', '+918985767702', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1795, '69e78fe9c53d28866db99af4', 'Janhavi', 'Bhondge', 'Janhavi Bhondge', 'jonty162002@gmail.com', '+917743855192', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1796, '69e78fd8c53d28866db9988b', 'Heshica', 'Vanapalli', 'Heshica Vanapalli', 'heshica26@gmail.com', '+918374009611', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1797, '69e78fc2c53d28866db99618', 'Harshavardhana', 'R', 'Harshavardhana R', 'harshavardhana911@gmail.com', '+917975241207', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1798, '69e78fbac53d28866db993c7', 'Gopal', 'N', 'Gopal N', 'gopal032005@gmail.com', '+919025341421', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1799, '69e78fa9c53d28866db99157', 'Gautam', 'Gandhi', 'Gautam Gandhi', 'gautamgandhi2001@gmail.com', '+919016494168', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1800, '69e78f9ac53d28866db98e9e', 'Fiza', 'Mushtaq Ahmed', 'Fiza Mushtaq Ahmed', 'fiza.sonu02@gmail.com', '+918147008096', 'active', '2026-07-07 05:04:26', '2026-07-07 05:04:26'),
(1801, '69e78f8cc53d28866db98c41', 'Dinkar', 'Patil', 'Dinkar Patil', 'iasdinkarpatil@gmail.com', '+919657681952', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1802, '69e78f77c53d28866db989d9', 'Roopa', 'Kiran Buddha', 'Roopa Kiran Buddha', 'roopakiranbuddha@gmail.com', '+918317651549', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1803, '69e78f65c53d28866db9876e', 'BHUVANESHWARAN', 'RAVIKUMAR', 'BHUVANESHWARAN RAVIKUMAR', 'bhuvanesh130299@gmail.com', '+918667331683', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1804, '69e78f59c53d28866db9851d', 'Ayan', 'Debnath', 'Ayan Debnath', 'work.ayan@yahoo.com', '+917003707013', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1805, '69e78f43c53d28866db982b0', 'Anupam', 'Sahoo', 'Anupam Sahoo', 'anupamsahoo2000@gmail.com', '+918327061772', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1806, '69e78f35c53d28866db98051', 'ANAND', 'AGARWAL', 'ANAND AGARWAL', 'agarwal.anand1802@gmaii.com', '+918892145195', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1807, '69e78f27c53d28866db97dff', 'Anand', 'Raj Chitta', 'Anand Raj Chitta', 'anandraj20102001@gmail.com', '+919440743111', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1808, '69e78f17c53d28866db97ba3', 'Aishwarya', 'Jaba', 'Aishwarya Jaba', 'aishwaryajaba88@gmail.com', '+919901515480', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1809, '69e78f01c53d28866db9792f', 'Adarsha', 'Unknown', 'Adarsha Unknown', 'adarshan9108@gmail.com', '+919108294137', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1810, '69e78eefc53d28866db976d5', 'Aathishankaran', 'KS', 'Aathishankaran KS', 'aathishankaran5@gmail.com', '+919791839818', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1811, '69e777c4c53d28866db8a644', 'Masthan', 'Epuri', 'Masthan Epuri', 'epurimasthan6526@gmail.com', '+918074298826', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1812, '69e777a3c53d28866db8a106', 'Ragam', 'Anil', 'Ragam Anil', 'ragamanil7259@gmail.com', '+919490800246', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1813, '69e77790c53d28866db89eb9', 'Mahesh', 'Yelamacharla', 'Mahesh Yelamacharla', 'yelamacharlamahesh@gmail.com', '+918247335892', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1814, '69e7777ec53d28866db89c63', 'Shubham', 'Kharche', 'Shubham Kharche', 'kharcheshubhama@gmail.com', '+918390484542', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1815, '69e7774cc53d28866db8957a', 'Chandrika', 'Korada', 'Chandrika Korada', 'chandrikakorada23@gmail.com', '+916303634454', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1816, '69e7770fc53d28866db88e7a', 'BASIREDDY', 'SANDHYA REDDY', 'BASIREDDY SANDHYA REDDY', 'basireddysandhyareddy@gmail.com', '+919052212556', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1817, '69e776fac53d28866db88c2b', 'RUSHIKESH', 'TAKALE', 'RUSHIKESH TAKALE', 'takalerushikesh14@gmail.com', '+918080858462', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1818, '69e776cec53d28866db8854a', 'AYUSH', 'RANJAN TRIPATHI', 'AYUSH RANJAN TRIPATHI', 'ayushrtripathi143@gmail.com', '+917755893754', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1819, '69e776a9c53d28866db880a7', 'Guhan', 'M', 'Guhan M', 'guhanmg25@gmail.com', '+918973989513', 'active', '2026-07-07 05:04:27', '2026-07-07 05:04:27'),
(1821, '69e77696c53d28866db87e55', 'Sriram', 'R', 'Sriram R', 'sriramrshree@gmail.com', '+919578349686', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1822, '69e77684c53d28866db87c09', 'Satyampati', 'Tripathi', 'Satyampati Tripathi', 'satyamtripathi0980@gmail.com', '+918867449387', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1823, '69e77674c53d28866db879be', 'Johnson', 'S', 'Johnson S', 'js24nov@gmail.com', '+919677739873', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1824, '69e77660c53d28866db87765', 'Swapnali', 'Patil', 'Swapnali Patil', 'swapnalipatil0811@gmail.com', '+918856810846', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1825, '69e77653c53d28866db87516', 'Ketan', 'Nimje', 'Ketan Nimje', 'ketannimje36@gmail.com', '+918087207371', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1826, '69e7762dc53d28866db87070', 'AMARJEET', 'KUMAR', 'AMARJEET KUMAR', 'amarjeetak113@gmail.com', '+918709234519', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1827, '69e77614c53d28866db86e20', 'SRIKANTH', 'REDDY C', 'SRIKANTH REDDY C', 'csrikanth9507@gmail.com', '+16302421781', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1828, '69e77609c53d28866db86bda', 'A.', 'Ruchitha', 'A. Ruchitha', 'annangiruchitha@gmail.com', '+919133155150', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1829, '69e775f5c53d28866db86977', 'ROHITH', 'JOTHILAKSHMI PERIYASAMY', 'ROHITH JOTHILAKSHMI PERIYASAMY', 'rohithjp1304@gmail.com', '+917904971095', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1830, '69e775d5c53d28866db864e1', 'Shivam', 'Swami', 'Shivam Swami', 'shivamswami228@gmail.com', '+919540025283', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1831, '69e775c1c53d28866db8628b', 'SHREEMA', 'SHETTY', 'SHREEMA SHETTY', 'shreemashetty31@gmail.com', '+917348943081', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1832, '69e775b0c53d28866db8603d', 'SARANKI', 'MURUGAN', 'SARANKI MURUGAN', 'sarankishore380@gmail.com', '+919363519485', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1833, '69e775a0c53d28866db85df0', 'NARASIMHA', 'Unknown', 'NARASIMHA Unknown', 'chakkanarasimha76@gmail.com', '+919390758203', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1834, '69e77576c53d28866db85938', 'RAHUL', 'SONUNE', 'RAHUL SONUNE', 'rahulsonune05@gmail.com', '+917057435208', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1835, '69e77564c53d28866db856da', 'Vaishnavi', 'Vidap', 'Vaishnavi Vidap', 'vidapvaishnavi@gmail.com', '+917499387979', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1836, '69e7754bc53d28866db8546c', 'Nishanth', 'Kumar S', 'Nishanth Kumar S', 'nishanthkumars2001@gmail.com', '+918675951141', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1837, '69e7752fc53d28866db851fa', 'KHUSHI', 'NAGARGOJE', 'KHUSHI NAGARGOJE', 'nagargojekhushi@gmail.com', '+917499087432', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1838, '69e7750fc53d28866db84f90', 'Abhinav', 'Gupta', 'Abhinav Gupta', 'abhinavgupta10101@gmail.com', '+917982833486', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1839, '69e774efc53d28866db84a7b', 'Pushkar', 'Grover', 'Pushkar Grover', 'pushkargrover779@gmail.com', '+918604623438', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1840, '69e774d3c53d28866db84824', 'Umansh', 'Kaushal', 'Umansh Kaushal', 'umanshkaushal0001@gmail.com', '+918894572191', 'active', '2026-07-07 05:04:28', '2026-07-07 05:04:28'),
(1841, '69e74bc8c53d28866db80beb', 'SHAIK', 'NABI ARSHAD', 'SHAIK NABI ARSHAD', 'arshadnabi2001@gmail.com', '+916281813309', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1842, '69e74bb8c53d28866db80997', 'Sathish', 'Jagana', 'Sathish Jagana', 'satishjagana123@gmail.com', '+917729907643', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1843, '69e74ba5c53d28866db80753', 'Raghul', 'Raj DM', 'Raghul Raj DM', 'ragulraj205@gmail.com', '+919786842307', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1844, '69e74b94c53d28866db804ff', 'AVINASH', 'SHARMA', 'AVINASH SHARMA', 'kumaravinashsharma82@gmail.com', '+919060071846', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1845, '69e74b81c53d28866db802b3', 'VENKATA', 'BRAHMAM MANNUVA', 'VENKATA BRAHMAM MANNUVA', 'venkatabrahmammannuva@gmail.com', '+918374838648', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1846, '69e74b72c53d28866db80068', 'Kadiyam', 'Sukhesh Kumar', 'Kadiyam Sukhesh Kumar', 'sukheshkumar777@gmail.com', '+919100836514', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1847, '69e74b42c53d28866db7fbc1', 'Naineel', 'Soyantar', 'Naineel Soyantar', 'naineelsoyantar@gmail.com', '+919023031861', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1848, '69e74b2ec53d28866db7f975', 'Taduvai', 'Sai Saketh', 'Taduvai Sai Saketh', 'tpvsssaketh@gmail.com', '+918886520869', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1849, '69e74b16c53d28866db7f716', 'Rushikeh', 'Mane', 'Rushikeh Mane', 'manerushi8676@gmail.com', '+919960018676', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1850, '69e74aefc53d28866db7f24c', 'Gaurav', 'Kumar', 'Gaurav Kumar', 'k.gaurav653@gmail.com', '+917070756905', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1851, '69e74addc53d28866db7f002', 'Prakash', 'Sanagapalli', 'Prakash Sanagapalli', 'prakash.sanagapalli1998@gmail.com', '+919494251212', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1852, '69e74acac53d28866db7eda6', 'E', 'Siva Rami Reddy', 'E Siva Rami Reddy', 'sivaramreddy0000@gmail.com', '+919505067694', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1853, '69e74a97c53d28866db7e8b3', 'Bhavya', 'Garikapati', 'Bhavya Garikapati', 'bhavyagarikapati89@gmail.com', '+918978076121', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1854, '69e74a8ac53d28866db7e670', 'Aniket', 'Jamadar', 'Aniket Jamadar', 'aniketjamadar111@gmail.com', '+919975016717', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1855, '69e74a79c53d28866db7e415', 'Kaveri', 'Badiger', 'Kaveri Badiger', 'kavyaanoopbadiger@gmail.com', '+917259135458', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1856, '69e74a6bc53d28866db7e1ca', 'Sameer', 'Unknown', 'Sameer Unknown', 'sameerallabakash@gmail.com', '+919618797336', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1857, '69e74a5ec53d28866db7dee4', 'Udaya', 'Murthy M', 'Udaya Murthy M', 'udayamurthy94@gmail.com', '+919994521426', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1858, '69e74a56c53d28866db7dc9a', 'Sharath', 'Chandra Uppula', 'Sharath Chandra Uppula', 'sharathuppula20014@gmail.com', '+917569559124', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1859, '69e74a46c53d28866db7da56', 'BHAVYA', 'K P', 'BHAVYA K P', 'kpbhavya2000@gmail.com', '+916362539568', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1860, '69e74a37c53d28866db7d80a', 'DHARANIDHARAN', 'S', 'DHARANIDHARAN S', 'dharansd01@gmail.com', '+919677930913', 'active', '2026-07-07 05:04:29', '2026-07-07 05:04:29'),
(1861, '69e74a1cc53d28866db7d5b6', 'S.P.C', 'Vijay Kumar Dunna', 'S.P.C Vijay Kumar Dunna', 'vijay.devops3247@gmail.com', '+917981888656', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1862, '69e74a0bc53d28866db7d35f', 'Bhanuprakash', 'Naroju', 'Bhanuprakash Naroju', 'narojubhanuprakash@gmail.com', '+916300660921', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1863, '69e749f1c53d28866db7cec3', 'SUDHEER', 'SAGAR', 'SUDHEER SAGAR', 'sudheersk9966@gmail.com', '+918184923281', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1864, '69e749e2c53d28866db7cc7f', 'Sarvesh', 'Shukla', 'Sarvesh Shukla', 'sarveshshukla2122@gmail.com', '+919452352213', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1865, '69e749d6c53d28866db7ca29', 'SIVA', 'KOTESWARARAO KUMBHA', 'SIVA KOTESWARARAO KUMBHA', 'sivakoteswararao2109@gmail.com', '+919908759095', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1866, '69e749c3c53d28866db7c7e4', 'PRATHAMESH', 'TEMKAR', 'PRATHAMESH TEMKAR', 'pratham.temkar87@gmail.com', '+918454907757', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1867, '69e749b3c53d28866db7c5a1', 'Vaibhav', 'Pawar', 'Vaibhav Pawar', 'vaibhav.163.pawar@gmail.com', '+917709036942', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1868, '69e7498dc53d28866db7c349', 'Ashok', 'ReddyGayam', 'Ashok ReddyGayam', 'ashokreddygayam94@gmail.com', '+918919727660', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1869, '69e74950c53d28866db7be96', 'Vikas', 'Jaiwal', 'Vikas Jaiwal', 'vikasjaiwal1999@gmail.com', '+917219516012', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1870, '69e74924c53d28866db7b953', 'AMAN', 'SINGH RANA', 'AMAN SINGH RANA', 'amanrana60a@gmail.com', '+919650499746', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1871, '69e74913c53d28866db7b703', 'NithyaSri', 'S', 'NithyaSri S', 'nithyasrisuresh1624@gmail.com', '+919363370864', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1872, '69e74906c53d28866db7b4bf', 'Gayathri', 'Patapanchala', 'Gayathri Patapanchala', 'gayathrinikki99@gmail.com', '+919502217299', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1873, '69e748f7c53d28866db7b261', 'Osheen', 'Kapoor', 'Osheen Kapoor', 'kapoorosheenrtm@gmail.com', '+919479985643', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1874, '69e748d1c53d28866db7adcb', 'Gauri', 'Valvi', 'Gauri Valvi', 'gaurivlv12@gmail.com', '+919763317212', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1875, '69e7489fc53d28866db7a91e', 'NEHA', 'TARKAR', 'NEHA TARKAR', 'tarkarneha191@gmail.com', '+918445613811', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1876, '69e74884c53d28866db7a6c5', 'Angam', 'Pavan Kumar Reddy', 'Angam Pavan Kumar Reddy', 'angampavan355@gmail.com', '+918688728740', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1877, '69e74874c53d28866db7a472', 'Naveen', 'Pulamarasetty', 'Naveen Pulamarasetty', 'naveen.pulamarasetty@gmail.com', '+919182490735', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1878, '69e74869c53d28866db7a217', 'Aryan', 'Saxena', 'Aryan Saxena', 'applyforjobs.aryansaxena@gmail.com', '+919685751081', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1879, '69e74851c53d28866db79fb2', 'MOHAMMED', 'ABDUL FAISAL NAWAZ', 'MOHAMMED ABDUL FAISAL NAWAZ', 'faislaops@gmail.com', '+918142953317', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1880, '69e74844c53d28866db79d4d', 'SIDDHANT', 'BATRA', 'SIDDHANT BATRA', 'siddhantbatra517@gmail.com', '+917745862629', 'active', '2026-07-07 05:04:30', '2026-07-07 05:04:30'),
(1881, '69e74351c53d28866db782ca', 'Shivasai', 'Gujjula', 'Shivasai Gujjula', 'ssai9088@gmail.com', '+916281463890', 'active', '2026-07-07 05:04:31', '2026-07-07 05:04:31'),
(1882, '69e74340c53d28866db7806e', 'Nitish', 'Gupta', 'Nitish Gupta', 'guptanitish853@gmail.com', '+917985066932', 'active', '2026-07-07 05:04:31', '2026-07-07 05:04:31'),
(1883, '69e74332c53d28866db77e2a', 'NAVEEN', 'REDDY P.N.V', 'NAVEEN REDDY P.N.V', 'naveenvenkureddy@gmail.com', '+919110505524', 'active', '2026-07-07 05:04:31', '2026-07-07 05:04:31'),
(1884, '69e74325c53d28866db77be2', 'Jadi', 'Bhagavan', 'Jadi Bhagavan', 'jbhagavan509@gmail.com', '+917032078983', 'active', '2026-07-07 05:04:31', '2026-07-07 05:04:31'),
(1885, '69e7431bc53d28866db77990', 'AKSHADA', 'LENDE', 'AKSHADA LENDE', 'lendeakshada36@gmail.com', '+918779837393', 'active', '2026-07-07 05:04:31', '2026-07-07 05:04:31'),
(1886, '69e7430cc53d28866db7774b', 'Vignesh', 'Kumaravel', 'Vignesh Kumaravel', 'vigneshvks003@gmail.com', '+17708831537', 'active', '2026-07-07 05:04:31', '2026-07-07 05:04:31'),
(1887, '69e742fcc53d28866db774fb', 'Vaibhav', 'Birari', 'Vaibhav Birari', 'birarivb94@gmail.com', '+917385652139', 'active', '2026-07-07 05:04:31', '2026-07-07 05:04:31'),
(1888, '69e742ddc53d28866db77051', 'Chinmay', 'Bhalkar', 'Chinmay Bhalkar', 'ccbhalkar@gmail.com', '+917391026126', 'active', '2026-07-07 05:04:31', '2026-07-07 05:04:31'),
(1889, '69e742d2c53d28866db76e0e', 'ARYAN', 'DWIVEDI', 'ARYAN DWIVEDI', 'aryandwivedi147@gmail.com', '+917082373155', 'active', '2026-07-07 05:04:31', '2026-07-07 05:04:31'),
(1890, '69e742c2c53d28866db76bbd', 'Ranit', 'Ray', 'Ranit Ray', 'ranitray216@gmail.com', '+919002227222', 'active', '2026-07-07 05:04:31', '2026-07-07 05:04:31'),
(1891, '69e742a9c53d28866db7695f', 'Aasif', 'Ali', 'Aasif Ali', 'aliaasif1077@gmail.com', '+919182650986', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1892, '69e74298c53d28866db76707', 'Krushna', 'Daswante', 'Krushna Daswante', 'krushnadaswante2000@gmail.com', '+917387871260', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1893, '69e74288c53d28866db764b9', 'Nishant', 'Gaurav', 'Nishant Gaurav', 'gaurav.nishant1308@gmail.com', '+918862991486', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1894, '69e74277c53d28866db76267', 'DIGVIJAY', 'DASPUTE', 'DIGVIJAY DASPUTE', 'dasputedigvijay.2026@gmail.com', '+919272025307', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1895, '69e7426ec53d28866db76023', 'NIKHIL', 'SINGH', 'NIKHIL SINGH', 'nikhilsinghh467@gmail.com', '+919052623719', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1896, '69e7425ec53d28866db75dc7', 'Jyothi', 'Alugupalli', 'Jyothi Alugupalli', 'jothialugupalli301@gmail.com', '+919515942327', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1897, '69e74253c53d28866db75b7c', 'K', 'UDAY KUMAR', 'K UDAY KUMAR', 'udaykumark204@gmail.com', '+918790405678', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1898, '69e74246c53d28866db7592d', 'Swapnil', 'Ugalmugale', 'Swapnil Ugalmugale', 'ugalmugaleswapnil21@gmail.com', '+917028705652', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1899, '69e7423ac53d28866db756e4', 'Deepprabha', 'Unknown', 'Deepprabha Unknown', 'deepprabha.dp@gmail.com', '+918269885741', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1900, '69e7422ac53d28866db7548c', 'CHETAN', 'JAIN', 'CHETAN JAIN', 'jainchetan481@gmail.com', '+918766480325', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1901, '69e7421cc53d28866db75244', 'Vaijunath', 'Hainalkar', 'Vaijunath Hainalkar', 'vhainalkar99@gmail.com', '+918446230258', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1902, '69e741e2c53d28866db74aa2', 'Nitheesha', 'Kamma', 'Nitheesha Kamma', 'kammanitheesha5239@gmail.com', '+919346155717', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1903, '69e741d0c53d28866db74852', 'ONKAR', 'MANDAL', 'ONKAR MANDAL', 'onkarmandal123@gmail.com', '+917410701090', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1904, '69e741c0c53d28866db745eb', 'SHIVALEELA', 'MAKANUR', 'SHIVALEELA MAKANUR', 'spmakanur@gmail.com', '+919538312568', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1905, '69e741b3c53d28866db7439f', 'Rajat', 'Mehra', 'Rajat Mehra', 'rajatmehra634@gmail.com', '+919871874758', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1906, '69e741a0c53d28866db7411d', 'Vivek', 'Kumar', 'Vivek Kumar', 'vivek.jha.dev9@gmail.com', '+917079606332', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1907, '69e7418fc53d28866db73ed7', 'HEMANTH', 'KRISHNA KUMAR KUNAPAREDDY', 'HEMANTH KRISHNA KUMAR KUNAPAREDDY', 'hemanth.kunapareddy2@gmail.com', '+919160420599', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1908, '69e74178c53d28866db73c69', 'Abdul', 'Hameed Shahil', 'Abdul Hameed Shahil', 'hameedshahil.ah@gmail.com', '+917661008935', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1909, '69e7416ec53d28866db73a82', 'SIDDHARTH', 'MAKHI', 'SIDDHARTH MAKHI', 'sidmakhi38@gmail.com', '+918237602613', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1910, '69e7416cc53d28866db7383f', 'Megha', 'Mangale', 'Megha Mangale', 'mangalermegha29@gmail.com', '+918975870582', 'active', '2026-07-07 05:04:32', '2026-07-07 05:04:32'),
(1911, '69e74163c53d28866db735f4', 'Neha', 'Tanveer', 'Neha Tanveer', 'nehatanveer2051@gmail.com', '+918523084585', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1912, '69e74159c53d28866db733b3', 'Pavan', 'More', 'Pavan More', 'pavanmore1011@gmail.com', '+919096241507', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1913, '69e74153c53d28866db7316d', 'RAKSHITH', 'P D', 'RAKSHITH P D', 'rakshithpdrak@gmail.com', '+919741142104', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1914, '69e74149c53d28866db72f0a', 'Akshay', 'Kumar', 'Akshay Kumar', 'akshaykr.dev@gmail.com', '+917004647716', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1915, '69e74143c53d28866db72cc1', 'ITTAMALLA', 'RAHUL', 'ITTAMALLA RAHUL', 'rahuliʃamalla24@gmail.com', '+919121962752', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1916, '69e7412fc53d28866db7280e', 'SATVIK', 'SRIVASTAVA', 'SATVIK SRIVASTAVA', 'satvik.srivastavaaa@gmail.com', '+919660819220', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1917, '69e7412ac53d28866db725d3', 'Saurabh', 'Nagarkar', 'Saurabh Nagarkar', 'saurabh.nagarkar1131@gmail.com', '+919028180352', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1918, '69e74118c53d28866db72374', 'Shubham', 'Fendar', 'Shubham Fendar', 'fendar.shubham96@gmail.com', '+919657770452', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1919, '69e74114c53d28866db7213b', 'Onkar', 'Randive', 'Onkar Randive', 'onkarrandive9444@gmail.com', '+918208963219', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1920, '69e74108c53d28866db71d22', 'Rahul', 'Kumar', 'Rahul Kumar', 'rahulk83534@gmail.com', '+919304538916', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1921, '69e74107c53d28866db71c7f', 'Akshitha', 'Yadla', 'Akshitha Yadla', 'akshithareddy.yadla@gmail.com', '+919010487007', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1922, '69e740fbc53d28866db71a36', 'Basavaraj', 'Devaramani', 'Basavaraj Devaramani', 'basavaraj.devaramani@outlook.com', '+918147811983', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1923, '69e740f4c53d28866db717f2', 'Abhijit', 'Gunjal', 'Abhijit Gunjal', 'abhijitgunjal0403@gmail.com', '+917498697902', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1924, '69e740e6c53d28866db71599', 'SURAJKADAM', 'Unknown', 'SURAJKADAM Unknown', 'suraj.vishwanath.kadam@gmail.com', '+918390692395', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1925, '69e740d8c53d28866db71225', 'Azhar', 'Ali', 'Azhar Ali', 'aliazhar63010@gmail.com', '+916301076157', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1926, '69e740cbc53d28866db70fd4', 'Sharad', 'Singh', 'Sharad Singh', 'singhsharadkumar021@gmail.com', '+918318130841', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1927, '69e740c4c53d28866db70d85', 'Avyay', 'Singh', 'Avyay Singh', 'avyaysingh05@gmail.com', '+917991150353', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1928, '69e740b7c53d28866db70b2a', 'Akash', 'Kumbhar', 'Akash Kumbhar', 'akashkumbhartech@gmail.com', '+919545157514', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1929, '69e740b5c53d28866db708d3', 'GAYATHRI', 'Unknown', 'GAYATHRI Unknown', 'gayathrirgs1995@gmail.com', '+919952260776', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1930, '69e740a5c53d28866db704ed', 'Rajlaxmi', 'Unknown', 'Rajlaxmi Unknown', 'rajlaxmi1763@gmail.com', '+916295769203', 'active', '2026-07-07 05:04:33', '2026-07-07 05:04:33'),
(1931, '69e740a4c53d28866db70446', 'SWATHI', 'Unknown', 'SWATHI Unknown', 'swathigovindaraj123@gmail.com', '+919363375607', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1932, '69e74096c53d28866db7005e', 'AMBHIKA', 'UPPUNUNTHALA', 'AMBHIKA UPPUNUNTHALA', 'ambikaanreddy6512@gmail.com', '+919398900372', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1933, '69e74095c53d28866db6ffbf', 'Sheela', 'X', 'Sheela X', 'sheeladgl03@gmail.com', '+16369192534', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1934, '69e74085c53d28866db6fc08', 'Vignesh', 'Kundar', 'Vignesh Kundar', 'vigneshkundar125@gmail.com', '+919071077931', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1935, '69e74084c53d28866db6fb31', 'Abhishek', 'Shinde', 'Abhishek Shinde', 'abhi2398shinde@gmail.com', '+919503167292', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1936, '69e74075c53d28866db6f8c4', 'Shalika', 'Pandhare', 'Shalika Pandhare', 'shalikapandhare2121@gmail.com', NULL, 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1937, '69e7406cc53d28866db6f67c', 'CHETAN', 'CHAUDHARY', 'CHETAN CHAUDHARY', 'chetan.chaudhary87@gmail.com', '+917424950156', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1938, '69e74069c53d28866db6f440', 'Hrishikesh', 'Deshmukh', 'Hrishikesh Deshmukh', 'hrishikeshdeshmukh1998@gmail.com', '+917028328310', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1939, '69e74061c53d28866db6f201', 'Sampath', 'Kumar Gutha', 'Sampath Kumar Gutha', 'sampathkumargutha@gmail.com', '+919347707905', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1940, '69e7405dc53d28866db6efb8', 'Tej', 'Paratap Singh Parihar', 'Tej Paratap Singh Parihar', 'singhparihartejpratap@gmail.com', '+919074846810', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1941, '69e7404ec53d28866db6ed6b', 'Nitin', 'Soni', 'Nitin Soni', 'risoni081@gmail.com', '+917697842165', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1942, '69e7403bc53d28866db6ea48', 'Monicha', 'Unknown', 'Monicha Unknown', 'monichav2001@gmail.com', '+918489366312', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1943, '69e74024c53d28866db6e7f2', 'Saiteja', 'Vemula', 'Saiteja Vemula', 'saitejavemula28@gmail.com', '+916302153258', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1944, '69e7400dc53d28866db6e58b', 'Aashitosh', 'Todkar', 'Aashitosh Todkar', 'aashitoshtodkar@gmail.com', '+919209331271', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1945, '69e74000c53d28866db6e349', 'Maya', 'Jegadish', 'Maya Jegadish', 'maya28102001@gmail.com', '+918681919003', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1946, '69e73ff0c53d28866db6e0fb', 'SAGAR', 'PANDAB', 'SAGAR PANDAB', 'sagarratna2710@gmail.com', '+918249344451', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1947, '69e73fdcc53d28866db6de8d', 'Rishabh', 'Mittal', 'Rishabh Mittal', 'rishabhmittal10045@gmail.com', '+918279339591', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1948, '69e73fc2c53d28866db6dae8', 'NAGESWARA', 'BATHINA', 'NAGESWARA BATHINA', 'nirdesh150@gmail.com', '+917981019059', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1949, '69e73fafc53d28866db6d894', 'Sangadipa', 'Goswami', 'Sangadipa Goswami', 'goswamisangadipa@gmail.com', '+917479377662', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1950, '69e73f7dc53d28866db6d198', 'Avinash', 'Maddina', 'Avinash Maddina', 'avinashmaddina5@outlook.com', '+919491846182', 'active', '2026-07-07 05:04:34', '2026-07-07 05:04:34'),
(1951, '69e73f65c53d28866db6cd0a', 'JayaKumar', 'Chilakalapudi', 'JayaKumar Chilakalapudi', 'jayakumarchilakalapudi207@gmail.com', '+919390824792', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1952, '69e73f4cc53d28866db6c871', 'Nagalakshmi', 'Challa', 'Nagalakshmi Challa', 'nagalakshmichalla347@gmail.com', '+916281842646', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1953, '69e73f4ac53d28866db6c6a5', 'ANISHA', 'DAS', 'ANISHA DAS', 'dasanisharn@gmail.com', '+918144587056', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1954, '69e73f3cc53d28866db6c458', 'Kumar', 'Duraisamy', 'Kumar Duraisamy', 'kumar29dsm@gmail.com', '+919445281862', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1955, '69e73f38c53d28866db6c221', 'SHRUTI', 'DETH', 'SHRUTI DETH', 'shrutideth0911@gmail.com', '+919370418634', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1956, '69e73f2bc53d28866db6bfd4', 'Ramakrishna', 'M', 'Ramakrishna M', 'krishna.m1005@gmail.com', '+918147235041', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1957, '69e73f28c53d28866db6bda3', 'Amarjit', 'Pandey', 'Amarjit Pandey', 'amarjitkrp240@gmail.com', '+917325073984', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1958, '69e73f1dc53d28866db6bb6c', 'Sanivarapu', 'Viswanth Reddy', 'Sanivarapu Viswanth Reddy', 'viswanthreddysanivarapu@gmail.com', '+917993384531', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1959, '69e73f1ac53d28866db6b93e', 'Aravinth', 'Unknown', 'Aravinth Unknown', 'aravinthram1610@gmail.com', '+917904212278', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1960, '69e73f0dc53d28866db6b6ea', 'Kajol', 'Bhosale', 'Kajol Bhosale', 'kajolbhosale999@gmail.com', '+918408010110', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1961, '69e73f09c53d28866db6b4be', 'Sukumar', 'Buradagunta', 'Sukumar Buradagunta', 'sukumarb679@gmail.com', '+916303848277', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1962, '69e73efec53d28866db6b27f', 'MD', 'SADDAM HUSSAIN', 'MD SADDAM HUSSAIN', 'saddamzaman1998@gmail.com', '+917059601647', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1963, '69e73ef7c53d28866db6b03d', 'Roshan', 'Kumar Choudhary', 'Roshan Kumar Choudhary', 'kumar091roshu@gmail.com', '+917488405102', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1964, '69e73eeac53d28866db6adf6', 'Amit', 'Gawande', 'Amit Gawande', 'gawandeamit29@gmail.com', '+918766438858', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1965, '69e73edec53d28866db6ab9e', 'ANIL', 'KUMAR PRAJAPATI', 'ANIL KUMAR PRAJAPATI', 'aprajapati8081@gmail.com', '+918081489506', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1966, '69e73ed1c53d28866db6a94c', 'Yogesh', 'Mahale', 'Yogesh Mahale', 'yogeshmahale23021@gmail.com', '+919403671390', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1967, '69e73ecfc53d28866db6a6fc', 'ROHIT', 'KUMAR', 'ROHIT KUMAR', 'rohitdwivedi216@gmail.com', '+918707824382', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1968, '69e73ebfc53d28866db6a4b1', 'Madhav', 'Tripathi', 'Madhav Tripathi', 'madhavravtripathi2@gmail.com', '+919236727192', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1969, '69e73ebcc53d28866db6a276', 'SAMBRAM', 'H R', 'SAMBRAM H R', 'sambramhr20@gmail.com', '+917676965692', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1970, '69e73eb0c53d28866db6a036', 'Akash', 'Jayas', 'Akash Jayas', 'akashjayas08122002@gmail.com', '+917665537808', 'active', '2026-07-07 05:04:35', '2026-07-07 05:04:35'),
(1971, '69e73ea0c53d28866db69dea', 'AVADESH', 'VERMA', 'AVADESH VERMA', 'avadeshverma38@gmail.com', '+917909302040', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1972, '69e73e9cc53d28866db69bbf', 'BEDPRAKASH', 'Unknown', 'BEDPRAKASH Unknown', 'bedprakash61299@gmail.com', '+917999816206', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1973, '69e73e93c53d28866db69976', 'Satish', 'Singh', 'Satish Singh', 'satishsingh8511@gmail.com', '+917202895767', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1974, '69e73e90c53d28866db6974a', 'Dheeraj', 'Verma', 'Dheeraj Verma', 'dheerajvermaphm@gmail.com', '+917275655418', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1975, '69e73e85c53d28866db69502', 'OMKAR', 'MORE', 'OMKAR MORE', 'moreomkar815@gmaii.com', '+918928982815', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1976, '69e73e7bc53d28866db692c3', 'ASHWANI', 'JAISWAL', 'ASHWANI JAISWAL', 'ashwani.jaiswal.225@gmail.com', '+917827016619', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1977, '69e73e72c53d28866db69084', 'Akanksha', 'Unknown', 'Akanksha Unknown', 'akanksharanjan1205@gmail.com', '+916204230591', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1978, '69e73e63c53d28866db68e3c', 'DHANUSH', 'Unknown', 'DHANUSH Unknown', 'dhanushindrakumar123@gmail.com', '+917829066019', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1979, '69e73e5ec53d28866db68bff', 'AAQIB', 'SHAIKH', 'AAQIB SHAIKH', 'aaqibcs7@gmail.com', '+918483972363', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1980, '69e73e52c53d28866db689bd', 'Pooja', 'Ramachandran', 'Pooja Ramachandran', 'poojaramachandran1205@gmail.com', '+916379389469', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1981, '69e73e44c53d28866db6877f', 'Arjun', 'Bhusal', 'Arjun Bhusal', 'bhusal0007@gmail.com', '+918840854651', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1982, '69e73e3fc53d28866db68545', 'Shivkumar', 'Unknown', 'Shivkumar Unknown', 'shivkumarsuryavanshi60@gmail.com', '+918660556471', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1983, '69e73e23c53d28866db6822a', 'Sainath', 'Nettem', 'Sainath Nettem', 'nettemsainath868@gmail.com', '+918688443602', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1984, '69e73e11c53d28866db67fe3', 'PUSHKARAJ', 'PURUD', 'PUSHKARAJ PURUD', 'pushkarajpurud37@gmail.com', '+919834753742', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1985, '69e73df7c53d28866db67d7c', 'Gangadhar', 'Issarapu', 'Gangadhar Issarapu', 'bobbiligangadhar785@gmail.com', '+917075647534', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1986, '69e73dd5c53d28866db67b3b', 'Yogesh', 'Mahale', 'Yogesh Mahale', 'yogeshmahale2302@gmail.com', '+919168471995', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1987, '69e73dbac53d28866db678f8', 'Vaishnavi', 'Rankhamb', 'Vaishnavi Rankhamb', 'vaishnavirankhamb1011@gmail.com', '+917498650423', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1988, '69e73da6c53d28866db676ac', 'Narendra', 'Patil', 'Narendra Patil', 'narendra909661@gmail.com', '+919637795779', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1989, '69e73d96c53d28866db6746b', 'Manshi', 'Rathore', 'Manshi Rathore', 'manshirathore555@gmail.com', '+918077184009', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1990, '69e73d84c53d28866db67236', 'Praveen', 'Yarrasingu', 'Praveen Yarrasingu', 'pkchowdary918@gmail.com', '+919381098402', 'active', '2026-07-07 05:04:36', '2026-07-07 05:04:36'),
(1991, '69e73d70c53d28866db67000', 'Pratyush', 'Yadav', 'Pratyush Yadav', 'pratyushyadav0110@gmail.com', '+916387914724', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(1992, '69e73d5bc53d28866db66dbd', 'AKILANDESWARI', 'D', 'AKILANDESWARI D', 'akiladurai06@gmail.com', '+919361377007', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(1993, '69e73d46c53d28866db66b85', 'Harshitha', 'Amara', 'Harshitha Amara', 'amaraharshi@gmail.com', '+919177594113', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(1994, '69e73d34c53d28866db66947', 'Ajinkya', 'Ambekar', 'Ajinkya Ambekar', 'ajinkyaambekar67@gmail.com', '+917888080505', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(1995, '69e73d18c53d28866db6670f', 'Snehasish', 'Pradhan', 'Snehasish Pradhan', 'snehasishpradhan21@gmail.com', '+919373084849', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(1996, '69e73ceec53d28866db663a7', 'VENKATAGURU', 'Unknown', 'VENKATAGURU Unknown', 'venkatporto123@gmail.com', '+919688502376', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(1997, '69e73ce2c53d28866db6615d', 'Prashi', 'Jain', 'Prashi Jain', 'prashijain1996@gmail.com', '+919165848568', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37');
INSERT INTO `students` (`id`, `external_id`, `first_name`, `last_name`, `full_name`, `email`, `phone_number`, `status`, `created_at`, `updated_at`) VALUES
(1998, '69e73cc2c53d28866db65f1b', 'Viraj', 'Phalke', 'Viraj Phalke', 'virajphalke968@gmail.com', '+919503972487', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(1999, '69e73cadc53d28866db65cee', 'Gaurav', 'Kumbhar', 'Gaurav Kumbhar', 'gauravkumbhar01@gmail.com', '+917758867499', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(2000, '69e73c9ac53d28866db65ab7', 'Venkata Sai Anil', 'Unknown', 'Venkata Sai Anil Unknown', 'rrvsanil123@gmail.com', '+917449287699', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(2001, '69e73c81c53d28866db65847', 'Surya', 'Swain', 'Surya Swain', 'swainsuryanarayan2000@gmail.com', '+918339070942', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(2002, '69e73c77c53d28866db6560d', 'ABHISHEK', 'KALE', 'ABHISHEK KALE', 'kaleabhishek630@gmail.com', '+918788235564', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(2003, '69e73c5ac53d28866db651a7', 'Venkata', 'Ramesh Siripothula', 'Venkata Ramesh Siripothula', 'venkataramesh366@gmail.com', '+919110323948', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(2004, '69e73c3ec53d28866db64f65', 'TANGUTURI', 'PRATHYUSHA', 'TANGUTURI PRATHYUSHA', 'tanguturiprathyusha186@gmail.com', '+919618797933', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(2005, '69e73c31c53d28866db64d2a', 'Shubham', 'Morghade', 'Shubham Morghade', 'shubhammorghade298@gmail.com', '+918253050460', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(2006, '69e73c1ac53d28866db64ad0', 'Saurav', 'Kumar', 'Saurav Kumar', 'sauravkumar221997@gmail.com', '+916203017725', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(2007, '69e73c0bc53d28866db6487d', 'PENDYALA', 'SAI KRISHNA', 'PENDYALA SAI KRISHNA', 'psaikrishna5555@gmail.com', '+919121193833', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(2008, '69e73c00c53d28866db64650', 'Prabhav', 'Gupta', 'Prabhav Gupta', 'prabhavgupta05@gmail.com', '+919997153223', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(2009, '69e73beec53d28866db6440b', 'GADDAPU', 'JAGAN KUMAR', 'GADDAPU JAGAN KUMAR', 'jagankmr17@gmail.com', '+917411683322', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(2010, '69e73beac53d28866db6423f', 'SRIRAM', 'TADEPALLI', 'SRIRAM TADEPALLI', 'tadepallisriram18@gmail.com', '+917288003246', 'active', '2026-07-07 05:04:37', '2026-07-07 05:04:37'),
(2011, '69e73bd8c53d28866db63ffa', 'Dileshwari', 'Deshmukh', 'Dileshwari Deshmukh', 'dileshwari23we1@gmail.com', '+916265695816', 'active', '2026-07-07 05:04:38', '2026-07-07 05:04:38'),
(2012, '69e73bd4c53d28866db63dbf', 'SIVA', 'KUMAR DUGANA', 'SIVA KUMAR DUGANA', 'sivakumar.dugana96@gmail.com', '+919490502314', 'active', '2026-07-07 05:04:38', '2026-07-07 05:04:38'),
(2013, '69e73bc2c53d28866db63b75', 'Bhomaram', 'Dewasi', 'Bhomaram Dewasi', 'dewasinaresh321@gmail.com', '+917249429690', 'active', '2026-07-07 05:04:38', '2026-07-07 05:04:38'),
(2014, '69e73bbdc53d28866db6393f', 'Amol', 'Bavaskar', 'Amol Bavaskar', 'amolbavaskar01@gmail.com', '+918669137535', 'active', '2026-07-07 05:04:38', '2026-07-07 05:04:38'),
(2015, '69e73bacc53d28866db6358d', 'MO', 'IMRAN', 'MO IMRAN', 'moimran16218227@gmail.com', '+917525014260', 'active', '2026-07-07 05:04:38', '2026-07-07 05:04:38'),
(2016, '69e73babc53d28866db634bc', 'BHANU NAVEEN TEJA', 'KONDETI', 'BHANU NAVEEN TEJA KONDETI', 'bhanunaveenteja234@gmail.com', '+919550816594', 'active', '2026-07-07 05:04:38', '2026-07-07 05:04:38'),
(2017, '69e73b98c53d28866db63263', 'Devendra', 'Barhate', 'Devendra Barhate', 'devbarhate0307@gmail.com', '+919860839694', 'active', '2026-07-07 05:04:38', '2026-07-07 05:04:38'),
(2018, '69e73b93c53d28866db63033', 'Madhava', 'Gopireddy', 'Madhava Gopireddy', 'gopireddym2001@gmail.com', '+916303299877', 'active', '2026-07-07 05:04:38', '2026-07-07 05:04:38'),
(2019, '69e73b81c53d28866db62d22', 'Zulfakar', 'Haider', 'Zulfakar Haider', 'zulfiqarhaider223@gmail.com', '+917408686941', 'active', '2026-07-07 05:04:38', '2026-07-07 05:04:38'),
(2020, '69e73b76c53d28866db62ae3', 'Hitesh', 'Mishra', 'Hitesh Mishra', 'hm25081999@gmail.com', '+919554633548', 'active', '2026-07-07 05:04:38', '2026-07-07 05:04:38'),
(2021, '69e73b67c53d28866db6289b', 'Shraddha', 'Deshmukh', 'Shraddha Deshmukh', 'shraddhamd08@gmail.com', '+919923496812', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2022, '69e73b58c53d28866db62654', 'Jai', 'Chavan', 'Jai Chavan', 'jaeechavan1@gmail.com', '+919890927853', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2023, '69e73b4cc53d28866db62407', 'AMULYA', 'GAJJELA', 'AMULYA GAJJELA', 'amulyagaj@gmail.com', '+919502404745', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2024, '69e73b24c53d28866db621a8', 'RAMA', 'KRISHNA GUNJA', 'RAMA KRISHNA GUNJA', 'ramakrishnagunja23@gmail.com', '+919381349575', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2025, '69e73b0ec53d28866db61f4f', 'Mayur', 'Dighe', 'Mayur Dighe', 'dighemayur643@gmail.com', '+918623909052', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2026, '69e73af9c53d28866db61cfc', 'Sharad', 'Kumar', 'Sharad Kumar', 'dev.guptasharad96@gmail.com', '+918858231468', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2027, '69e73aeec53d28866db61acc', 'SIVARANJANI', 'Unknown', 'SIVARANJANI Unknown', 'sivaranjanibarby@gmail.com', '+916385321756', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2028, '69e73addc53d28866db61897', 'SUSHMITHA', 'THANGELLAPALLY', 'SUSHMITHA THANGELLAPALLY', 'sushmithathangellapally10@gmail.com', '+916305292925', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2029, '69e73ad5c53d28866db6166a', 'Mohan', 'Shingare', 'Mohan Shingare', 'mohanshingare2018@gmail.com', '+919552483504', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2030, '69e73ac0c53d28866db61428', 'Pankaj', 'Ugale', 'Pankaj Ugale', 'pankajugale45@gmail.com', '+918308009147', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2031, '69e73aa8c53d28866db611c4', 'Valmiki', 'Babhruvahana', 'Valmiki Babhruvahana', 'babhru9966@gmail.com', '+919347882665', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2032, '69e73a98c53d28866db60f86', 'D', 'Myna', 'D Myna', 'mynareddy29@gmail.com', '+917013015982', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2033, '69e73a6dc53d28866db60aeb', 'Chandana', 'Tatipamula', 'Chandana Tatipamula', 'tatipamulachandana07@gmail.com', '+919100657395', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2034, '69e73a60c53d28866db608b1', 'Mahesh', 'Pasapu', 'Mahesh Pasapu', 'maheshmani831@gmail.com', '+916303756423', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2035, '69e73a39c53d28866db604e5', 'Srujana', 'Dachepalli', 'Srujana Dachepalli', 'dachepallisrujana@gmail.com', '+918639281033', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2036, '69e73a2bc53d28866db602a1', 'Yuvan', 'Shankar E', 'Yuvan Shankar E', 'yuvanshankar0506@gmail.com', '+917708796703', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2037, '69e73a1bc53d28866db6005f', 'Shivakant', 'Balure', 'Shivakant Balure', 'shivkanth077@gmail.com', '+918618857991', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2038, '69e73a0dc53d28866db5fe1e', 'Boina', 'Sarayu', 'Boina Sarayu', 'boina.sarayu@gmail.com', '+917873222609', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2039, '69e739ffc53d28866db5fbd7', 'CH', 'Sundararao', 'CH Sundararao', 'sundar3.dev@gmail.com', '+919492438673', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2040, '69e739e8c53d28866db5f989', 'Abilash', 'Kurakula', 'Abilash Kurakula', 'abilashkurakula7@gmail.com', '+919182258601', 'active', '2026-07-07 05:04:39', '2026-07-07 05:04:39'),
(2041, '69e739d4c53d28866db5f74e', 'Naman', 'Sahu', 'Naman Sahu', 'naman.sahu.2606@gmail.com', '+919977212663', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2042, '69e739b0c53d28866db5f3fc', 'Vishal', 'Kumar', 'Vishal Kumar', 'vvishalku11@gmail.com', '+919628930045', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2043, '69e739a3c53d28866db5f1a1', 'Ramesh', 'Megavath', 'Ramesh Megavath', 'rameshrathod3536@gmail.com', '+917989742791', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2044, '69e73996c53d28866db5ef6e', 'Akash', 'Tiwari', 'Akash Tiwari', 'tiwariakash5807@gmail.com', '+917580879826', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2045, '69e73983c53d28866db5ed1d', 'VENKATA', 'VAMSI KRISHNA', 'VENKATA VAMSI KRISHNA', 'vamsikrishna2517@gmail.com', '+919502317686', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2046, '69e73974c53d28866db5ead1', 'Aniket', 'Kumar', 'Aniket Kumar', 'aniket15121997@gmail.com', '+917261080213', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2047, '69e73966c53d28866db5e896', 'Prakhar', 'Tewari', 'Prakhar Tewari', 'prakhartewari4545@gmail.com', '+919214366266', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2048, '69e73953c53d28866db5e5f3', 'Rajat', 'Kumar Maurya', 'Rajat Kumar Maurya', 'rkmaurya080217@gmail.com', '+918565005534', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2049, '69e73946c53d28866db5e2a3', 'Ramya', 'Chippada', 'Ramya Chippada', 'ramyachippada849@gmail.com', '+917780466849', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2050, '69e73945c53d28866db5e1d1', 'Mallikarjuna', 'TMR', 'Mallikarjuna TMR', 'mallikarjunatmr55555@gmail.com', '+918618281768', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2051, '69e73937c53d28866db5df95', 'Rahul', 'Bhiwre', 'Rahul Bhiwre', 'rahulbhiwre@gmail.com', '+917218050140', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2052, '69e73924c53d28866db5db02', 'Prashant', 'Mishra', 'Prashant Mishra', 'prashantm.inbox@gmail.com', '+919870173306', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2053, '69e73922c53d28866db5d8d5', 'Preeti', 'Raisinghani', 'Preeti Raisinghani', 'preetiraisinghani2@gmail.com', '+919586732041', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2054, '69e7390ec53d28866db5d4e8', 'Sundara', 'Rao CH', 'Sundara Rao CH', 'sundar3.ch@gmail.com', '+917207138673', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2055, '69e7390dc53d28866db5d445', 'SIDDDHARTH', 'PIMPALE', 'SIDDDHARTH PIMPALE', 'siddharthpimpale30@gmail.com', '+917020254608', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2056, '69e73902c53d28866db5d207', 'PRAKASH', 'BHOSLE', 'PRAKASH BHOSLE', 'prakashbhosale9270@gmail.com', '+919270398706', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2057, '69e738fac53d28866db5cfbf', 'NIRANJAN', 'VENNU', 'NIRANJAN VENNU', 'niranjanreddyvennu35@gmail.com', '+916301442459', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2058, '69e738f0c53d28866db5cbd9', 'Goutham', 'Reddy Gouru', 'Goutham Reddy Gouru', 'gouthamreddygouru11@gmail.com', '+919963251421', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2059, '69e738efc53d28866db5cb37', 'Muni', 'Raghava', 'Muni Raghava', 'muniraghavavelasiri@gmail.com', '+917989606968', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2060, '69e738e0c53d28866db5c8fa', 'Akula', 'Venkata Sai Teja', 'Akula Venkata Sai Teja', 'venkatasaitejaakula@gmail.com', '+919346337502', 'active', '2026-07-07 05:04:40', '2026-07-07 05:04:40'),
(2061, '69e738dec53d28866db5c6bf', 'Bhagyashri', 'Sayankar', 'Bhagyashri Sayankar', 'bhagyshri.saynkar@gmail.com', '+917249801412', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2062, '69e738ccc53d28866db5c2c9', 'Kamal', 'Goud Katta', 'Kamal Goud Katta', 'kamalgoudkatta@gmail.com', '+919963126495', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2063, '69e738cbc53d28866db5c22b', 'Shital', 'Kawale', 'Shital Kawale', 'shitalkawale9@gmail.com', '+918830408997', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2064, '69e738bdc53d28866db5bfd9', 'BANDARI', 'SAIVARUN', 'BANDARI SAIVARUN', 'saivarunbandari123@gmail.com', '+919381188116', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2065, '69e738b3c53d28866db5bd9b', 'Guntipalli', 'Jyoshna', 'Guntipalli Jyoshna', 'jyoshnaguntipalli@gmail.com', '+916301505752', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2066, '69e738a6c53d28866db5ba86', 'Priyanka', 'Kamble', 'Priyanka Kamble', 'priyankaakamble18@gmail.com', '+917822981195', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2067, '69e73899c53d28866db5b833', 'Narasimha', 'Lohith Gandra', 'Narasimha Lohith Gandra', 'narasimhalohith15@gmail.com', '+916304281088', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2068, '69e73882c53d28866db5b5e6', 'AJANTHAMAHALAKSHMI', 'Unknown', 'AJANTHAMAHALAKSHMI Unknown', 'ajuappu34@gmail.com', '+916383314265', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2069, '69e73875c53d28866db5b3a2', 'Nivedha', 'S', 'Nivedha S', 'nivi888nivi@gmail.com', '+919344435625', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2070, '69e7385cc53d28866db5b154', 'Siddharth', 'Yankanchi', 'Siddharth Yankanchi', 'siddharthyankanchi27@gmail.com', '+918446063715', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2071, '69e73835c53d28866db5aed9', 'NIRANJAN', 'BOMMAGANI', 'NIRANJAN BOMMAGANI', 'niranjanbommagani11@gmail.com', '+919701397484', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2072, '69e73828c53d28866db5ac98', 'Veeramalla', 'Madhu', 'Veeramalla Madhu', 'madhu.veeramalla1204@gmail.com', '+918919812041', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2073, '69e73817c53d28866db5aa27', 'Nikhil', 'Kumar', 'Nikhil Kumar', 'nikhil06113@gmail.com', '+918757346738', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2074, '69e7380ac53d28866db5a7d2', 'Saranya', 'Ganesan', 'Saranya Ganesan', 'saranyaganesana@gmail.com', '+918190890145', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2075, '69e737fdc53d28866db5a582', 'Nirusha', 'Nekkalapu', 'Nirusha Nekkalapu', 'nirushanekkalapu@gmail.com', '+919121320630', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2076, '69e737ebc53d28866db5a32c', 'PAVITHRAN', 'G', 'PAVITHRAN G', 'pavithrangangadharan12@gmail.com', '+917299114221', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2077, '69e737d7c53d28866db5a0b2', 'Ritik', 'Singh', 'Ritik Singh', 'devrithiksingh@gmail.com', '+917036492715', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2078, '69e737cac53d28866db59e6c', 'Manoj', 'More', 'Manoj More', 'manoj.more0302@gmail.com', '+919503535953', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2079, '69e737bac53d28866db59c1e', 'JNANABHUSANA', 'BEHERA', 'JNANABHUSANA BEHERA', 'jnanabhusana10@gmail.com', '+918327714837', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2080, '69e737a7c53d28866db599c1', 'PRATEEK', 'GUPTA', 'PRATEEK GUPTA', 'prateekg780@gmail.com', '+917066536974', 'active', '2026-07-07 05:04:41', '2026-07-07 05:04:41'),
(2081, '69e73796c53d28866db5976e', 'Prasanth', 'Srinivasan', 'Prasanth Srinivasan', 'prasanthsrinivasan10@gmail.com', '+919344967836', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2082, '69e73789c53d28866db59526', 'SAI', 'KUMAR SANGAPAKA', 'SAI KUMAR SANGAPAKA', 'sangapakasaikumar26@gmail.com', '+919100850848', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2083, '69e73766c53d28866db5906d', 'Sai', 'Kamaljava', 'Sai Kamaljava', 'saikamal2930@gmail.com', '+916303516942', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2084, '69e73759c53d28866db58e33', 'Aman', 'Verma', 'Aman Verma', 'amanverma275101@gmail.com', '+918737039800', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2085, '69e73749c53d28866db58bda', 'Bhagyashri', 'Thakur', 'Bhagyashri Thakur', 'bhagyashrirthakur33@gmail.com', '+919112899910', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2086, '69e7373cc53d28866db5898c', 'UDAY', 'CHANDU', 'UDAY CHANDU', 'kiranchandu4696@gmail.com', '+917989517106', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2087, '69e73731c53d28866db58746', 'Jaya', 'Srinadh Padavala', 'Jaya Srinadh Padavala', 'srinadhpadavala66@gmail.com', '+919014187338', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2088, '69e73722c53d28866db584e6', 'Kousik', 'Mondal', 'Kousik Mondal', 'mondalkousik700@gmail.com', '+918013129965', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2089, '69e7370ec53d28866db5828e', 'Keshav', 'Raj Singh', 'Keshav Raj Singh', 'keshavrajsingh41@gmail.com', '+917982047794', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2090, '69e73700c53d28866db58046', 'Neha', 'Ambekar', 'Neha Ambekar', 'nambekar36@gmail.com', '+917066174532', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2091, '69e736f1c53d28866db57df6', 'Shruti', 'Mittal', 'Shruti Mittal', 'shrutimittal1230@gmail.com', '+918159009035', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2092, '69e736d9c53d28866db57b94', 'Bharti', 'Singh', 'Bharti Singh', 'bhartiranasingh1999@gmail.com', '+919340646357', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2093, '69e736cac53d28866db57941', 'Sharmila', 'Dudekula', 'Sharmila Dudekula', 'dudekulasharmila29@gmail.com', '+916305524030', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2094, '69e736b4c53d28866db576df', 'Balaji', 'Dhakne', 'Balaji Dhakne', 'baludhakne1997@gmail.com', '+919834217416', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2095, '69e736a8c53d28866db57494', 'Vishakha', 'Dubey', 'Vishakha Dubey', 'vishakhadubey2027@gmail.com', '+919589637181', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2096, '69e73698c53d28866db57255', 'SHUBHAM', 'KUMAR SINGH', 'SHUBHAM KUMAR SINGH', 'sks25032000@gmail.com', '+916205676261', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2097, '69e73684c53d28866db5700f', 'Roshan', 'Kumar', 'Roshan Kumar', 'theroshansingh89@gmail.com', '+918789605394', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2098, '69e73673c53d28866db56dcd', 'MARISELVAM', 'GURUSAMY', 'MARISELVAM GURUSAMY', 'gmselvam1213@gmail.com', '+918903109298', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2099, '69e7365dc53d28866db56b83', 'ANAND', 'MISHRA', 'ANAND MISHRA', 'anandmishra299@gmail.com', '+919910788514', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2100, '69e73646c53d28866db5693e', 'Ravi', 'Kumar Jovudula', 'Ravi Kumar Jovudula', 'ravi123jovudula@gmail.com', '+919347637401', 'active', '2026-07-07 05:04:42', '2026-07-07 05:04:42'),
(2101, '69e73637c53d28866db566f3', 'Sadanand', 'Randive', 'Sadanand Randive', 'randivesadanand@gmail.com', '+919309332078', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2102, '69e7361ac53d28866db56489', 'Vishal', 'Gaikwad', 'Vishal Gaikwad', 'dev.vishalbgaikwad@gmail.com', '+918080356468', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2103, '69e7360cc53d28866db56243', 'Vijay', 'Addepalli', 'Vijay Addepalli', 'vijay4855@gmail.com', '+919502784555', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2104, '69e735f9c53d28866db55fee', 'Amit', 'Bhosale', 'Amit Bhosale', 'bhosaleamit7254@gmail.com', '+919579785744', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2105, '69e73182c53d28866db55c64', 'Manish', 'Kumar', 'Manish Kumar', 'manishhere247@gmail.com', '+919110944794', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2106, '69e73172c53d28866db55a18', 'Darsi', 'Chandrasekhar', 'Darsi Chandrasekhar', 'dchandrasekhar518@gmail.com', '+916304739791', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2107, '69e73168c53d28866db557c5', 'ARYAN', 'SRIVASTAVA', 'ARYAN SRIVASTAVA', 'aryansrivastava07178@gmail.com', '+919569522972', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2108, '69e73159c53d28866db55587', 'WANI', 'CHAKRADHAR SUBHASH', 'WANI CHAKRADHAR SUBHASH', 'wanichakradhar@gmail.com', '+918975329555', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2109, '69e73148c53d28866db55327', 'Sunil', 'Arakala', 'Sunil Arakala', 'sunilarakala@gmail.com', '+918008324553', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2110, '69e73139c53d28866db550b6', 'SHUBHAM', 'KUMAR', 'SHUBHAM KUMAR', 'skshubham0601@gmail.com', '+919955470146', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2111, '69e73129c53d28866db54e60', 'Gitanjali', 'Mali', 'Gitanjali Mali', 'maligitanjali50@gmail.com', '+918169550368', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2112, '69e73119c53d28866db54b7a', 'Rajani', 'Kasimala', 'Rajani Kasimala', 'rajini.kasimala@gmail.com', '+918008784639', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2113, '69e7310ac53d28866db5492e', 'EKANT', 'JANAPURE', 'EKANT JANAPURE', 'janapureekant@gmail.com', '+919113516990', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2114, '69e730fbc53d28866db546ec', 'Lakshmanan', 'M', 'Lakshmanan M', 'lakshmanan19122001@gmail.com', '+917299704366', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2115, '69e730efc53d28866db544a0', 'NEERAJ', 'SHIVHARE', 'NEERAJ SHIVHARE', 'nshivhare144@gmail.com', '+917317525523', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2116, '69e730d7c53d28866db5422c', 'Anjali', 'Reddy', 'Anjali Reddy', 'reddyanjali2016@gmail.com', '+917095701190', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2117, '69e730c7c53d28866db53fd3', 'LAKSHMI', 'KEERTHANA CHILLARA', 'LAKSHMI KEERTHANA CHILLARA', 'lakshmikeerthanachillara@gmail.com', '+919390978963', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2118, '69e730acc53d28866db53b3d', 'Komal', 'Divase', 'Komal Divase', 'komaldivase2000@gmail.com', '+918080415960', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2119, '69e7309ec53d28866db538f0', 'ARSHAD', 'MUJAWAR', 'ARSHAD MUJAWAR', 'arshadmujawar2002@gmail.com', '+918275708949', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2120, '69e7308fc53d28866db5369b', 'ADITYA', 'SINGH', 'ADITYA SINGH', 'aditya108a@gmail.com', '+917987240435', 'active', '2026-07-07 05:04:43', '2026-07-07 05:04:43'),
(2121, '69e73083c53d28866db5345c', 'SRI SUDHA', 'VYSHNAVI N', 'SRI SUDHA VYSHNAVI N', 'vyshnavisudha.1996@gmail.com', '+919652401054', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2122, '69e73073c53d28866db5320b', 'Parthasarathy', 'Unknown', 'Parthasarathy Unknown', 'parthasarathy1870@gmail.com', '+919361626865', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2123, '69e73063c53d28866db52fc3', 'Dravid', 'Karunakaran', 'Dravid Karunakaran', 'dravidkarunakarana@gmail.com', '+917401688535', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2124, '69e73055c53d28866db52d6e', 'Shivam', 'Kushwaha', 'Shivam Kushwaha', 'shivamkushwaha12333@gmail.com', '+917067646565', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2125, '69e73045c53d28866db52b15', 'Venkatesh', 'R', 'Venkatesh R', 'venkateshrajapandi@gmail.com', '+918825840362', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2126, '69e73039c53d28866db528cb', 'SUSHMITHA', 'PRASAD', 'SUSHMITHA PRASAD', 'sushmitha.p09@outlook.com', '+919790914633', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2127, '69e7301ec53d28866db52425', 'TEJAL', 'JAISWAL', 'TEJAL JAISWAL', 'tejaljaiswal20@gmail.com', '+919403421569', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2128, '69e7300ec53d28866db521db', 'Anushka', 'Andhare', 'Anushka Andhare', 'anushkaofficial1210@gmail.com', '+919172064797', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2129, '69e73004c53d28866db51f97', 'PRATEEK', 'GAUTAM', 'PRATEEK GAUTAM', 'techprateek4321@gmail.com', '+918266884045', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2130, '69e72ff9c53d28866db51d50', 'Rushikesh', 'Galande', 'Rushikesh Galande', 'rushikeshgalande99@gmail.com', '+919307695081', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2131, '69e72fe8c53d28866db51b0a', 'Srikanth', 'Telugu', 'Srikanth Telugu', 'telugu.srikanth73@gmail.com', '+918309729261', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2132, '69e72fdcc53d28866db518b5', 'SELVENDIRAN', 'Unknown', 'SELVENDIRAN Unknown', 'selvendiran109@gmail.com', '+919790687267', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2133, '69e72fc7c53d28866db51668', 'Nisha', 'Yadav', 'Nisha Yadav', 'yadav12345nisha@gmail.com', '+919340004716', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2134, '69e72fbbc53d28866db513f8', 'SHUBHAM', 'KUMAR', 'SHUBHAM KUMAR', 'shubham797hyp@gmail.com', '+917979774902', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2135, '69e72f9ec53d28866db51055', 'Rajeev', 'Singh', 'Rajeev Singh', 'irajeev.dev@gmail.com', '+918709597398', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2136, '69e72f8ec53d28866db50e0d', 'Rajadurai', 'Nagarajan', 'Rajadurai Nagarajan', 'durai096@gmail.com', '+917904617297', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2137, '69e72f81c53d28866db50bc4', 'Sonu', 'Mohammed', 'Sonu Mohammed', 'sonu.mohammed0812@gmail.com', '+918619555058', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2138, '69e72f70c53d28866db5096c', 'J.', 'Venkata Ravi Kumar Goud', 'J. Venkata Ravi Kumar Goud', 'goudravi391@gmail.com', '+918688853539', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2139, '69e72f63c53d28866db5072e', 'BHASKAR', 'THARUN', 'BHASKAR THARUN', 'bhaskartharun098@gmail.com', '+916303036986', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2140, '69e72f56c53d28866db504e4', 'Shiv', 'Singh', 'Shiv Singh', 'shivshanker290@gmail.com', '+917207735930', 'active', '2026-07-07 05:04:44', '2026-07-07 05:04:44'),
(2141, '69e72f45c53d28866db50296', 'Pooja', 'Thorat', 'Pooja Thorat', 'poojabthorat133@gmail.com', '+917972677176', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2142, '69e72f35c53d28866db50047', 'Ramakrishna', 'Deshagani', 'Ramakrishna Deshagani', 'ramadeshagani96@gmail.com', '+918096215685', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2143, '69e72f20c53d28866db4fdf9', 'Jahnavi', 'Mendem', 'Jahnavi Mendem', 'janujahnavim97@gmail.com', '+918247482331', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2144, '69e72f0cc53d28866db4fb95', 'Manish', 'Kumar', 'Manish Kumar', 'connect.manish17@gmail.com', '+919504936436', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2145, '69e72ef9c53d28866db4f8e7', 'KHAJA', 'MIYA', 'KHAJA MIYA', 'khajamiya642@gmail.com', '+918884964862', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2146, '69e72ee7c53d28866db4f66d', 'Ankit', 'Singh', 'Ankit Singh', 'ankitsingh120201@gmail.com', '+916307425514', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2147, '69e72ed8c53d28866db4f419', 'AJAY', 'SINGH BAGHEL', 'AJAY SINGH BAGHEL', 'sunnysinghbaghel1303@gmail.com', '+919983172597', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2148, '69e72eccc53d28866db4f1d6', 'SAMARTH', 'CHAUHAN', 'SAMARTH CHAUHAN', 'samarth.chauhan198@gmail.com', '+918126188667', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2149, '69e72e88c53d28866db4eef6', 'Suresh', 'N', 'Suresh N', 'sureshnanjappan13@gmail.com', '+917904641213', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2150, '69e72e7cc53d28866db4c1d4', 'Rakesh', 'Aitham', 'Rakesh Aitham', 'rakeshaitham1@gmail.com', '+919505615971', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2151, '69e72e6fc53d28866db4bf90', 'Prem', 'Kumar A', 'Prem Kumar A', 'adhikesavanprem@gmail.com', '+918220117070', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2152, '69e72e5ec53d28866db4bd28', 'MUKESHKUMARRAI', 'Unknown', 'MUKESHKUMARRAI Unknown', 'mukeshmk1992rai@gmail.com', '+918076200732', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2153, '69e72e51c53d28866db4bad9', 'Matru', 'Satrujit', 'Matru Satrujit', 'matruprasad28715@gmail.com', '+918917303233', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2154, '69e72e41c53d28866db4b87b', 'Durga', 'Prasad', 'Durga Prasad', 'durgaprasad.oct23@gmail.com', '+917660811921', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2155, '69e72e2dc53d28866db4b61a', 'AMRESH', 'KUMAR', 'AMRESH KUMAR', 'amresh.wpc@gmail.com', '+919939111603', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2156, '69e72e12c53d28866db4b3b0', 'PARA', 'VIDYA SAGAR', 'PARA VIDYA SAGAR', 'vidyasagar.parav1@gmail.com', '+919059822561', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2157, '69e72dffc53d28866db4b147', 'G.L.N.V.', 'SRUTHI', 'G.L.N.V. SRUTHI', 'lnvsruthi.gokavarapu@gmail.com', '+919848348883', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2158, '69e72deec53d28866db4aee4', 'Bhargavi', 'Nerusu', 'Bhargavi Nerusu', 'nerusubhargavi206@gmail.com', '+919652327201', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2159, '69e72ddcc53d28866db4ac78', 'Basavaraj', 'Muddapur', 'Basavaraj Muddapur', 'basavarajmuddapur18@gmail.com', '+919538209140', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2160, '69e72dcec53d28866db4aa2a', 'Abhishek', 'R S', 'Abhishek R S', 'dzabhishek07@gmail.com', '+917010271938', 'active', '2026-07-07 05:04:45', '2026-07-07 05:04:45'),
(2161, '69e72dc3c53d28866db4a7da', 'ASHWINI', 'BOIWAR', 'ASHWINI BOIWAR', 'boiwarashwini987@gmail.com', '+917385788136', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2162, '69e72db5c53d28866db4a58e', 'Shaik', 'Hateem Ahmed', 'Shaik Hateem Ahmed', 'shaikhateemahmed006@gmail.com', '+919701503418', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2163, '69e72da5c53d28866db4a339', 'Jyoti', 'Bassi', 'Jyoti Bassi', 'jyotibassi2019@gmail.com', '+919767019625', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2164, '69e72d99c53d28866db4a0ea', 'Heyman', 'Kumar', 'Heyman Kumar', 'kumarheyman@gmail.com', '+919569080245', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2165, '69e72d8cc53d28866db49e95', 'S.', 'Kolas', 'S. Kolas', 'kolas.software.dev@gmail.com', '+919514698976', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2166, '69e72d7cc53d28866db49c44', 'BHARATH', 'KUMAR SARALA', 'BHARATH KUMAR SARALA', 'bharathkumar.sarala@gmail.com', '+918686701677', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2167, '69e72d70c53d28866db4995f', 'Somasekhar', 'Uppari', 'Somasekhar Uppari', 'somasekharuppari367@gmail.com', '+919052714967', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2168, '69e72d64c53d28866db49713', 'Tunikipati', 'Naga Manikanta', 'Tunikipati Naga Manikanta', 'tunikipatimanikanta@gmail.com', '+919640192407', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2169, '69e72d55c53d28866db494a2', 'Rahul', 'Kumar', 'Rahul Kumar', 'rahul.kumarb5703@gmail.com', '+919381007649', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2170, '69e72d44c53d28866db4923c', 'AJINKYA', 'GAIKWAD', 'AJINKYA GAIKWAD', 'ajinkyacg@gmail.com', '+919834145861', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2171, '69e72d2dc53d28866db48fe9', 'Yuvaraj', 'M', 'Yuvaraj M', 'yuvarajmg373@gmail.com', '+916379258937', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2172, '69e72d1ec53d28866db48d8c', 'Vaibhav', 'Rahangdale', 'Vaibhav Rahangdale', 'vaibhavrahangdale1234@gmail.com', '+918788642316', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2173, '69e72d06c53d28866db48b16', 'HARSHA', 'VARDHAN', 'HARSHA VARDHAN', 'harshavardhanr6801@gmail.com', '+918520086696', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2174, '69e72cf7c53d28866db488c1', 'Naga', 'Lakshmi', 'Naga Lakshmi', 'nagalakshmi.m24@gmail.com', '+919949159362', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2175, '69e72ce7c53d28866db48653', 'KALAMEGAM', 'V', 'KALAMEGAM V', 'kalamegam1708@gmail.com', '+919189407848', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2176, '69e72cc7c53d28866db481a0', 'Pattan', 'Khan', 'Pattan Khan', 'pattanabdullakhan@gmail.com', '+919182852192', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2177, '69e72cbac53d28866db47f50', 'ROSHAN', 'TRIPATHI', 'ROSHAN TRIPATHI', 'roshantripathi2001@gmail.com', '+917489056330', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2178, '69e72cabc53d28866db47cf3', 'ROHAN', 'RANA', 'ROHAN RANA', 'rohan.rana.7351@gmail.com', '+917983475326', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2179, '69e72c99c53d28866db479ed', 'MATHAN', 'Unknown', 'MATHAN Unknown', 'mathan.pvk.dev@gmail.com', '+919363754572', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2180, '69e72c82c53d28866db47651', 'BHAVANI', 'P', 'BHAVANI P', 'bhavaniraja1311@gmail.com', '+919840161429', 'active', '2026-07-07 05:04:46', '2026-07-07 05:04:46'),
(2181, '69e72c75c53d28866db47406', 'Sasikumar', 'Unknown', 'Sasikumar Unknown', 'sasi.mallela21@gmail.com', '+919652466313', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2182, '69e72c67c53d28866db471bd', 'ANANDHARAJ', 'ARUMUGAM', 'ANANDHARAJ ARUMUGAM', 'anand.ittech123@gmail.com', '+919940897829', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2183, '69e72c58c53d28866db46f64', 'Vinod', 'Sajgure', 'Vinod Sajgure', 'sajguresvinod@gmail.com', '+917709993825', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2184, '69e72c45c53d28866db46d17', 'Kumara', 'Avinash Kumar', 'Kumara Avinash Kumar', 'avinash340kr@gmail.com', '+916304403706', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2185, '69e72c39c53d28866db46ad3', 'Vinayak', 'Nikam', 'Vinayak Nikam', 'vinayaknikam60@gmail.com', '+919834661610', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2186, '69e72c2cc53d28866db4687e', 'Mohamed', 'Jaman', 'Mohamed Jaman', 'mohamedjaman07@gmail.com', '+919019233611', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2187, '69e72c10c53d28866db465f0', 'Rahul', 'Unknown', 'Rahul Unknown', 'labhishettyrahul@gmail.com', '+919010070835', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2188, '69e72bffc53d28866db46398', 'SURENDRAYADAV', 'Unknown', 'SURENDRAYADAV Unknown', 'surendra19yadavv@gmail.com', '+919881368776', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2189, '69e72bf6c53d28866db4614a', 'SATVIKA', 'RENUKUNTA', 'SATVIKA RENUKUNTA', 'satvika1611@gmail.com', '+917207575595', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2190, '69e72be8c53d28866db45e18', 'Nashat', 'Fatima', 'Nashat Fatima', 'nashat.2000cse@gmail.com', '+918185897587', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2191, '69e72be5c53d28866db45bd5', 'ASIM', 'MUJAWAR', 'ASIM MUJAWAR', 'asimmujawar2412@gmail.com', '+917796778866', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2192, '69e72bdbc53d28866db45985', 'Akshay', 'Jagtap', 'Akshay Jagtap', 'akshayjagtap805081@gmail.com', '+919922699981', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2193, '69e72bd6c53d28866db456c4', 'POOJA', 'S', 'POOJA S', 'pooja111998@gmail.com', '+919844466337', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2194, '69e72bcac53d28866db4546a', 'Keerthan', 'Kulal', 'Keerthan Kulal', 'skeerthankulal@gmail.com', '+919483079371', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2195, '69e72bc7c53d28866db45224', 'Rahul', 'Chaturvedi', 'Rahul Chaturvedi', 'rahulchaturvedi1302@gmail.com', '+916305312966', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2196, '69e72bbfc53d28866db44fd5', 'Ajaykumar', 'Ragavan', 'Ajaykumar Ragavan', 'ajaykumarrks12@gmail.com', '+919791740147', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2197, '69e72bb4c53d28866db44d81', 'Sitaram', 'Raju', 'Sitaram Raju', 'ramaraju3466@gmail.com', '+917396991168', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2198, '69e72bafc53d28866db44b27', 'Onkar', 'Tayde', 'Onkar Tayde', 'onkartayade62@gmail.com', '+918237394502', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2199, '69e72ba4c53d28866db448d3', 'HARI', 'SUNDAR S D', 'HARI SUNDAR S D', 'harisundar4@gmail.com', '+919994423990', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2200, '69e72b95c53d28866db4459b', 'Sivani', 'Gorthala', 'Sivani Gorthala', 'gorthalasivani1819@gmail.com', '+916369340633', 'active', '2026-07-07 05:04:47', '2026-07-07 05:04:47'),
(2201, '69e72b8bc53d28866db43ef9', 'Candidate', 'Unknown', 'Candidate Unknown', 'omkarnani211@gmail.com', '+919177707001', 'active', '2026-07-07 05:04:48', '2026-07-07 05:04:48'),
(2202, '69e72b7fc53d28866db43ca3', 'R', 'Sai Sri', 'R Sai Sri', 'saisree1512@gmail.com', '+916305533295', 'active', '2026-07-07 05:04:48', '2026-07-07 05:04:48'),
(2203, '69e72b71c53d28866db435f9', 'Candidate', 'Unknown', 'Candidate Unknown', 'tech.vikash006@gmail.com', '+916265568016', 'active', '2026-07-07 05:04:48', '2026-07-07 05:04:48'),
(2204, '69e72b65c53d28866db433b0', 'Sudheer', 'Mopuri', 'Sudheer Mopuri', 'sudheermopuri01239@gmail.com', '+919381104375', 'active', '2026-07-07 05:04:48', '2026-07-07 05:04:48'),
(2205, '69e72b58c53d28866db43139', 'ONKAR', 'ZARE', 'ONKAR ZARE', 'zareonkar@gmail.com', '+917385595545', 'active', '2026-07-07 05:04:48', '2026-07-07 05:04:48'),
(2206, '69e72b46c53d28866db42ee3', 'Ganesh', 'Kadam', 'Ganesh Kadam', 'kadamganesh1998@gmail.com', '+918806942462', 'active', '2026-07-07 05:04:48', '2026-07-07 05:04:48'),
(2207, '69e72b39c53d28866db42c86', 'Thanigaivasan', 'Shanmugham', 'Thanigaivasan Shanmugham', 'thanigai0201@gmail.com', '+919952955024', 'active', '2026-07-07 05:04:48', '2026-07-07 05:04:48'),
(2208, '69e72b13c53d28866db427b7', 'VIGNESH', 'Unknown', 'VIGNESH Unknown', 'vigneshmarappan2000@gmail.com', '+917904540400', 'active', '2026-07-07 05:04:48', '2026-07-07 05:04:48'),
(2209, '69e72b04c53d28866db4255a', 'Kavya', 'Aleti', 'Kavya Aleti', 'kavyaaleti195@gmail.com', '+919703560285', 'active', '2026-07-07 05:04:48', '2026-07-07 05:04:48'),
(2210, '69e72af0c53d28866db422dd', 'Vivek', 'Kumar Singh', 'Vivek Kumar Singh', 'vivekkumarsingh7119@gmail.com', '+918108668562', 'active', '2026-07-07 05:04:48', '2026-07-07 05:04:48'),
(2211, '69e72ae2c53d28866db42085', 'Ajit', 'Mishra', 'Ajit Mishra', 'ajitmishra250@gmail.com', '+919696071287', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2212, '69e72ad5c53d28866db41e2d', 'Rupesh', 'Borse', 'Rupesh Borse', 'rupeshpatil27599@gmail.com', '+919834025958', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2213, '69e72ac7c53d28866db41be4', 'Anusha', 'Jagari', 'Anusha Jagari', 'anushajagari@gmail.com', '+919505775302', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2214, '69e72abbc53d28866db41982', 'Bala Sri Divya', 'Moturi', 'Bala Sri Divya Moturi', 'sridivyamoturi8@gmail.com', '+919553185112', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2215, '69e72aa9c53d28866db41732', 'HEMANTH', 'KODALI', 'HEMANTH KODALI', 'hemanthkodali777@gmail.com', '+918333053539', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2216, '69e72a9ec53d28866db414f1', 'Rakesh', 'N', 'Rakesh N', 'rakeshnarayanan7@gmail.com', '+916383839132', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2217, '69e72a8dc53d28866db41287', 'Rahul', 'kumar patel', 'Rahul kumar patel', 'rahulkumarpatel2@gmail.com', '+917071860678', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2218, '69e72a80c53d28866db41035', 'Bana', 'Leelavathi', 'Bana Leelavathi', 'leelabana9@gmail.com', '+916302290780', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2219, '69e72a6fc53d28866db40dd1', 'Yugansh', 'Dhir', 'Yugansh Dhir', 'yuganshdhir608@gmail.com', '+916284112190', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2220, '69e72a59c53d28866db40b70', 'Utkarsh', 'Patki', 'Utkarsh Patki', 'utkarshpatki50@gmail.com', '+919518350586', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2221, '69e72a3bc53d28866db408fa', 'Pawan', 'Solanke', 'Pawan Solanke', 'spsolanke994@gmail.com', '+918999351593', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2222, '69e72a1dc53d28866db40442', 'Sourabh', 'Burle', 'Sourabh Burle', 'sourabhburle1944@gmail.com', '+918483086738', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2223, '69e72a0dc53d28866db401ee', 'PARDEEPAK', 'SINGH', 'PARDEEPAK SINGH', 'pardeepaksingh9@gmail.com', '+916239505496', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2224, '69e729fec53d28866db3ff9a', 'NARUBOINA', 'ADITHI YADAV', 'NARUBOINA ADITHI YADAV', 'adithinaruboina@gmail.com', '+919182485169', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2225, '69e729edc53d28866db3fd35', 'Ayush', 'Gautam', 'Ayush Gautam', 'ayush12una@outlook.com', '+919000278509', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2226, '69e729d8c53d28866db3facc', 'Krishnavyas', 'Kondle', 'Krishnavyas Kondle', 'krishnavyaskondle@gmail.com', '+919908521112', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2227, '69e729c4c53d28866db3f852', 'Abhishek', 'Rai', 'Abhishek Rai', 'akraiabhishek102@gmail.com', '+916397213875', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2228, '69e729b7c53d28866db3f5f2', 'Karthik', 'Reddy Sannapareddy', 'Karthik Reddy Sannapareddy', 'sannapareddykarthik@gmail.com', '+916303980575', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2229, '69e729a7c53d28866db3f391', 'Madhuri', 'Unknown', 'Madhuri Unknown', 'madhuri.march694@gmail.com', '+918297348705', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2230, '69e7299bc53d28866db3f13f', 'Pullagura', 'Gokul Vaibhav', 'Pullagura Gokul Vaibhav', 'gokulvaibhavpullagura@gmail.com', '+919959928088', 'active', '2026-07-07 05:04:49', '2026-07-07 05:04:49'),
(2231, '69e7298ac53d28866db3eed5', 'Sudheer', 'Sunkari', 'Sudheer Sunkari', 'sunkarisudheer821@gmail.com', '+919381326524', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2232, '69e72972c53d28866db3ec92', 'K U MA R', 'IS I L K Y', 'K U MA R IS I L K Y', 'ksilky2403@gmail.com', '+917667032437', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2233, '69e72950c53d28866db3e7c0', 'DEEPAK', 'KUMAR', 'DEEPAK KUMAR', 'cse.19bcs4600@gmail.com', '+918084693683', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2234, '69e7293fc53d28866db3e55c', 'S', 'VENNILA PRIYA', 'S VENNILA PRIYA', 'syvennilapriya@gmail.com', '+917842069200', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2235, '69e72934c53d28866db3e30c', 'Manav', 'Rajput', 'Manav Rajput', 'manavrajput295@gmail.com', '+919520474789', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2236, '69e7292bc53d28866db3e10e', 'AAKASH', 'SHIRTURE', 'AAKASH SHIRTURE', 'akash.shirture127@gmail.com', '+917796288071', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2237, '69e72923c53d28866db3debc', 'Ashok', 'Pawar', 'Ashok Pawar', 'ashokpawarmh24@gmail.com', '+917767920694', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2238, '69e7291bc53d28866db3dc71', 'Sandesh', 'Pachpande', 'Sandesh Pachpande', 'pachpandesandesh@gmail.com', '+919359197004', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2239, '69e72913c53d28866db3da0f', 'Ankit', 'Parashar', 'Ankit Parashar', 'as8802508162@gmail.com', '+918802508162', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2240, '69e7290ac53d28866db3d61e', 'Sreedhar', 'Baagala', 'Sreedhar Baagala', 'sreedharnaidubaagala@gmail.com', '+917337563317', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2241, '69e72909c53d28866db3d57d', 'DAKSHAYANI', 'PRIYA', 'DAKSHAYANI PRIYA', 'chipatydakshayanipriya128@gmail.com', '+919676932712', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2242, '69e728fdc53d28866db3d32a', 'KINGSLY', 'ANTO', 'KINGSLY ANTO', 'kingsly1105@gmail.com', '+919585167099', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2243, '69e728fac53d28866db3d0db', 'ANKAM', 'SURESH', 'ANKAM SURESH', 'ankamsuresh21@gmail.com', '+919032127752', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2244, '69e728eec53d28866db3cdc1', 'SANDEEP', 'GURRAM', 'SANDEEP GURRAM', 'sandeep.gurram.005@gmail.com', '+919705655295', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2245, '69e728dec53d28866db3cb58', 'Jothika', 'J R', 'Jothika J R', 'jothikajoe31@gmail.com', '+919994252181', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2246, '69e728c7c53d28866db3c8f0', 'SONU', 'GORAIN', 'SONU GORAIN', 'sonugorai183@gmail.com', '+917898618276', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2247, '69e728bdc53d28866db3c69c', 'Tanu', 'Priya', 'Tanu Priya', 'worktanu05@gmail.com', '+917488520965', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2248, '69e728adc53d28866db3c004', 'Candidate', 'Unknown', 'Candidate Unknown', 'durgakalyan018@gmail.com', '+916305624748', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2249, '69e7289ec53d28866db3bd95', 'SOWMIYA', 'N', 'SOWMIYA N', 'sowmiya1766@gmail.com', '+917200182752', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2250, '69e72891c53d28866db3bb46', 'Vignesh', 'L', 'Vignesh L', 'vigneshvcky2000@gmail.com', '+916379179465', 'active', '2026-07-07 05:04:50', '2026-07-07 05:04:50'),
(2251, '69e72885c53d28866db3b8e8', 'V A', 'Anusha', 'V A Anusha', 'anusha200801@gmail.com', '+918618661676', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2252, '69e72876c53d28866db3b684', 'Lakshmi', 'Veeragandham', 'Lakshmi Veeragandham', 'lakshmiveeragandham2000@gmail.com', '+917989436017', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2253, '69e7286cc53d28866db3b433', 'MADHU', 'CHANDANA', 'MADHU CHANDANA', 'madhu.devtech@gmail.com', '+919344905010', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2254, '69e72861c53d28866db3b1e6', 'Santhanakumar', 'M', 'Santhanakumar M', 'msanthanamkumar10@gmail.com', '+918925196535', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2255, '69e72853c53d28866db3af7b', 'RAJAT', 'TADAS', 'RAJAT TADAS', 'rajattadas7@gmail.com', '+919130813971', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2256, '69e7283dc53d28866db3ad0e', 'WARUN', 'KUMAR B', 'WARUN KUMAR B', 'warunkumarb@gmail.com', '+918778481386', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2257, '69e72834c53d28866db3aaad', 'SARAVANAKUMAR', 'Unknown', 'SARAVANAKUMAR Unknown', 'mkumarsaravan@gmail.com', '+919976551227', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2258, '69e72827c53d28866db3a85c', 'Kavya', 'Malle', 'Kavya Malle', 'kavyareddy1338@gmail.com', '+919573845703', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2259, '69e72813c53d28866db3a3b5', 'VIRENDRA', 'CHAUHAN', 'VIRENDRA CHAUHAN', 'viren75319@gmail.com', '+917835915384', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2260, '69e727ffc53d28866db3a155', 'Sowndariya', 'E', 'Sowndariya E', 'sowndariya1520@gmail.com', '+917904142942', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2261, '69e727eac53d28866db39ee9', 'Prasann', 'Kulkarni', 'Prasann Kulkarni', 'kulkarniprasann0181@gmail.com', '+918983760181', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2262, '69e727d6c53d28866db39c7d', 'Neha', 'Reddy Shabad', 'Neha Reddy Shabad', 'nehareddy2497@gmail.com', '+919951777132', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2263, '69e727cdc53d28866db39a13', 'Mayur', 'Patil', 'Mayur Patil', 'mayurpatil514@gmail.com', '+919755514506', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2264, '69e727b8c53d28866db397bc', 'Guduru', 'Sai Kumar Reddy', 'Guduru Sai Kumar Reddy', 'saikumarreddy0030@gmail.com', '+916302616402', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2265, '69e727acc53d28866db3955a', 'Rani', 'GudiselaPalli', 'Rani GudiselaPalli', 'ranigudiselapalli656@gmail.com', '+919347226929', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2266, '69e72797c53d28866db392fd', 'Dinesh', 'Kumar U', 'Dinesh Kumar U', 'dineshkumar.ulasala@gmail.com', '+917997915469', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2267, '69e7278ac53d28866db390ab', 'AFTABHUSEN', 'KAZI', 'AFTABHUSEN KAZI', 'aftab.kazi1899@gmail.com', '+917083037084', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2268, '69e72763c53d28866db38e12', 'NEERIKSHA', 'BANGERA', 'NEERIKSHA BANGERA', 'neerikshabangera11@gmail.com', '+919731454027', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2269, '69e72753c53d28866db38bb3', 'Mohinuddin', 'Patel', 'Mohinuddin Patel', 'mohinpatel323@gmail.com', '+918329523186', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2270, '69e72741c53d28866db3895b', 'Ishwariya', 'C', 'Ishwariya C', 'ishwariyachandrasekar@gmail.com', '+916380234745', 'active', '2026-07-07 05:04:51', '2026-07-07 05:04:51'),
(2271, '69e72733c53d28866db38700', 'SOUMYADEEP', 'DAS', 'SOUMYADEEP DAS', 'bsoumyadeep.das@gmail.com', '+917003762037', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2272, '69e72720c53d28866db3849c', 'MARIMUTHU', 'C', 'MARIMUTHU C', 'mariselvi52@gmail.com', '+919578426133', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2273, '69e7270cc53d28866db3824e', 'Pankaj', 'Kumar', 'Pankaj Kumar', 'kpankajkumar1499@gmail.com', '+919525723826', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2274, '69e72700c53d28866db37fff', 'Rakesh', 'Kodam', 'Rakesh Kodam', 'kodamrakesh100@gmail.com', '+919359036654', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2275, '69e726e5c53d28866db37d94', 'Tushar', 'Mishra', 'Tushar Mishra', 'tusharmishra1924@gmail.com', '+916264054394', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2276, '69e726d4c53d28866db37b2d', 'Pragnya', 'Mishra', 'Pragnya Mishra', 'pragnyam23@gmail.com', '+918971698637', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2277, '69e726c5c53d28866db378d0', 'BHAVANI', 'MEDI', 'BHAVANI MEDI', 'bhavanimedi31@gmail.com', '+919390040516', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2278, '69e726b7c53d28866db37671', 'ANKESH', 'Unknown', 'ANKESH Unknown', 'ankeshkumar.iimt@gmail.com', '+917079837802', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52');
INSERT INTO `students` (`id`, `external_id`, `first_name`, `last_name`, `full_name`, `email`, `phone_number`, `status`, `created_at`, `updated_at`) VALUES
(2279, '69e726a4c53d28866db37411', 'Subrat', 'Behera', 'Subrat Behera', 'subratbehera.6102@gmail.com', '+919337110475', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2280, '69e7269bc53d28866db371c8', 'Satya', 'Allam', 'Satya Allam', 'satyaallam888@gmail.com', '+919133936233', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2281, '69e72686c53d28866db36f54', 'Abhishek', 'Singh', 'Abhishek Singh', 'singh0721abhi@gmail.com', '+918700584108', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2282, '69e72666c53d28866db36cf0', 'Aayush', 'Maheshwari', 'Aayush Maheshwari', 'aayushmaheshwarigi111@gmail.com', '+916395817082', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2283, '69e72653c53d28866db36aa2', 'Saikiran', 'Nuthanaganti', 'Saikiran Nuthanaganti', 'saikirannuthanaganti34@gmail.com', '+919381250037', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2284, '69e72641c53d28866db3684d', 'NARREDDY', 'HEMAVANDANA', 'NARREDDY HEMAVANDANA', 'narreddyhemavandana@gmail.com', '+916302727771', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2285, '69e7262bc53d28866db36600', 'CHARAN', 'PRASAD B', 'CHARAN PRASAD B', 'prasadcharan725@gmail.com', '+919121643682', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2286, '69e72610c53d28866db36388', 'Jagmeet', 'Singh', 'Jagmeet Singh', 'sjagmeet832@gmail.com', '+918586988935', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2287, '69e725ffc53d28866db36133', 'ABHILASH', 'PUJAR', 'ABHILASH PUJAR', 'abhilashapujar@gmail.com', '+918431962880', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2288, '69e725f1c53d28866db35ed7', 'B', 'Gayatri Varma', 'B Gayatri Varma', 'gayatribatsala0809@gmail.com', '+916305272127', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2289, '69e725b5c53d28866db35995', 'Deepika', 'Sarode', 'Deepika Sarode', 'dsarode1994@gmail.com', '+917566255497', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2290, '69e7259bc53d28866db35734', 'CHANDRAKANT', 'KHUNE', 'CHANDRAKANT KHUNE', 'chandukhune148@gmail.com', '+919960658684', 'active', '2026-07-07 05:04:52', '2026-07-07 05:04:52'),
(2291, '69e7257bc53d28866db35473', 'Nitin', 'Lad', 'Nitin Lad', 'ladnitin688@gmail.com', '+919284171421', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2292, '69e7256ac53d28866db35213', 'NITHINRAHUL', 'J', 'NITHINRAHUL J', 'nithinrahulj@gmail.com', '+919108243055', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2293, '69e7255bc53d28866db34f7c', 'Waseem', 'Unnisa', 'Waseem Unnisa', 'kwaseemk99@gmail.com', '+919538080789', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2294, '69e72544c53d28866db34d04', 'Swami', 'Mattipally', 'Swami Mattipally', 'mattipallyswami333@gmail.com', '+919346512609', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2295, '69e72522c53d28866db34a85', 'Jayesh', 'Bais', 'Jayesh Bais', 'jayesh.bais6767@gmail.com', '+919993046767', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2296, '69e72506c53d28866db347d9', 'Geetha', 'Pasupuleti', 'Geetha Pasupuleti', 'geetha11.pasupuleti@gmail.com', '+917842929707', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2297, '69e724f3c53d28866db34571', 'Satendra', 'Tiwari', 'Satendra Tiwari', 'tiwarisatendra820@gmail.com', '+919111413516', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2298, '69e724dfc53d28866db34277', 'Arunkumar', 'Bhagavati', 'Arunkumar Bhagavati', 'arunkumarbhagavati@gmail.com', '+919739533597', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2299, '69e724c4c53d28866db3400e', 'Jayasooriya', 'Ramesh', 'Jayasooriya Ramesh', 'jai733100@gmail.com', '+918754734216', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2300, '69e724adc53d28866db33d6c', 'Vaddi', 'Lakshmi Mrudula', 'Vaddi Lakshmi Mrudula', 'vaddilakshmimrudula@gmail.com', '+918309628673', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2301, '69e7249bc53d28866db33b0a', 'POLI', 'SAIKUMAR REDDY', 'POLI SAIKUMAR REDDY', 'saikumarjohny@gmail.com', '+917207247270', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2302, '69e7248dc53d28866db338af', 'Aakash', 'Shende', 'Aakash Shende', 'aakashshende222@gmail.com', '+917756873011', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2303, '69e72481c53d28866db33631', 'Venkata Praveen Kumar', 'Kasula', 'Venkata Praveen Kumar Kasula', 'kasulapraveenkumark06@gmail.com', '+918790278160', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2304, '69e72471c53d28866db33386', 'SRINIVAS', 'CHINTHA', 'SRINIVAS CHINTHA', 'srinivas.chinta168@gmail.com', '+919100100551', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2305, '69e72460c53d28866db330eb', 'Aadesh', 'Sharma', 'Aadesh Sharma', 'aadeshsharma9991@gmail.com', '+917834886599', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2306, '69e72449c53d28866db32e89', 'P', 'VIDYASHREE', 'P VIDYASHREE', 'pmvidyashree07@gmail.com', '+917349409220', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2307, '69e72430c53d28866db32c1e', 'NAMBIRAJ', 'Unknown', 'NAMBIRAJ Unknown', 'nambiraj003@gmail.com', '+918072038410', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2308, '69e72424c53d28866db329d5', 'Sameer', 'Padamata', 'Sameer Padamata', 'sameer.padamata@gmail.com', '+917386363693', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2309, '69e72412c53d28866db32763', 'CHITRASEN', 'PATIL', 'CHITRASEN PATIL', 'patilchitrasen14@gmail.com', '+917972632728', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2310, '69e72404c53d28866db324f9', 'Venkateswara', 'Reddy Gangi Reddy', 'Venkateswara Reddy Gangi Reddy', 'venkyg418@gmail.com', '+918919809683', 'active', '2026-07-07 05:04:53', '2026-07-07 05:04:53'),
(2311, '69e723ebc53d28866db32279', 'SONALI', 'WAKODE', 'SONALI WAKODE', 'wakodesonali11@gmail.com', '+917020768827', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2312, '69e723d5c53d28866db32010', 'Anupama', 'Sajan', 'Anupama Sajan', 'anupamasajan13@gmail.com', '+918369081532', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2313, '69e723c3c53d28866db31da2', 'Roshan', 'Botare', 'Roshan Botare', 'botareroshan45@gmail.com', '+919699944906', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2314, '69e723b1c53d28866db31ad4', 'RAJAN', 'KUMAR', 'RAJAN KUMAR', 'rajanjaiswal906@gmail.com', '+916205225574', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2315, '69e7239bc53d28866db31863', 'Karisma', 'Choudhury', 'Karisma Choudhury', 'karismachoudhury79@gmail.com', '+919827726875', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2316, '69e72389c53d28866db315ea', 'SUREKHA', 'J S P', 'SUREKHA J S P', 'jspsurekha910@gmail.com', '+919498091199', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2317, '69e72377c53d28866db31399', 'Sowmya', 'R', 'Sowmya R', 'sowmya.sasik@gmail.com', '+916379489288', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2318, '69e7235dc53d28866db31134', 'Manmeet', 'Tiwari', 'Manmeet Tiwari', 'manmeettiwari01@gmail.com', '+919870268621', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2319, '69e7234cc53d28866db30ee7', 'Mohd', 'Aadil Alam', 'Mohd Aadil Alam', 'aadilshaikh8083@gmail.com', '+918544073426', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2320, '69e72339c53d28866db30c99', 'SIVANAGARAJU', 'MUMMADI', 'SIVANAGARAJU MUMMADI', 'sivanagaraju0510@gmail.com', '+16303336483', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2321, '69e72327c53d28866db30a0e', 'NANDHAKUMAR', 'Unknown', 'NANDHAKUMAR Unknown', 'prathapnandha16@gmail.com', '+916379050038', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2322, '69e7230ec53d28866db307b0', 'Manoj', 'R', 'Manoj R', 'manojsujith672@gmail.com', '+916379101714', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2323, '69e722f6c53d28866db30557', 'Rishi', 'Agrawal', 'Rishi Agrawal', 'rishiagrawalpip@gmail.com', '+916266380089', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2324, '69e722e0c53d28866db302d6', 'Chandan', 'Kumar', 'Chandan Kumar', 'chandankr5591@gmail.com', '+919412377019', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2325, '69e722cac53d28866db30074', 'Sulthan', 'Abdul Kadar H', 'Sulthan Abdul Kadar H', 'sulthanabdulkadarh@gmail.com', '+919600321712', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2326, '69e722b4c53d28866db2fdf0', 'Snehil', 'Pandey', 'Snehil Pandey', 'snehilrocksss.24@gmail.com', '+919300190626', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2327, '69e72297c53d28866db2fb96', 'Manoj', 'Patil', 'Manoj Patil', 'manoj1998patil@gmail.com', '+918380052220', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2328, '69e7228bc53d28866db2f952', 'Vignesh', 'Kamalakannan', 'Vignesh Kamalakannan', 'vigneshkamalakannan2208@gmail.com', '+917010097719', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2329, '69e72276c53d28866db2f705', 'Shahbaz', 'Alam', 'Shahbaz Alam', 's.alamcs10@gmail.com', '+919523519559', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2330, '69e7225ec53d28866db2f499', 'SANSKAR', 'UPADHYAY', 'SANSKAR UPADHYAY', 'sanskarupadhyay090@gmail.com', '+919007566575', 'active', '2026-07-07 05:04:54', '2026-07-07 05:04:54'),
(2331, '69e7223fc53d28866db2f23d', 'AYUSH', 'GAUTAM', 'AYUSH GAUTAM', 'gautamayush1201@gmail.com', '+919816700053', 'active', '2026-07-07 05:04:55', '2026-07-07 05:04:55'),
(2332, '69e72225c53d28866db2ef8f', 'ANSUMAN', 'PRADHAN', 'ANSUMAN PRADHAN', 'ansumanpradhan.1107@gmail.com', '+919556557320', 'active', '2026-07-07 05:04:55', '2026-07-07 05:04:55'),
(2333, '69e72212c53d28866db2ed32', 'AKASH', 'AGRAWAL', 'AKASH AGRAWAL', 'akashsagrawal88@gmail.com', '+918793616592', 'active', '2026-07-07 05:04:55', '2026-07-07 05:04:55'),
(2334, '69e72203c53d28866db2ead5', 'Pennil', 'Geonie G', 'Pennil Geonie G', 'pennilgeonie@outlook.com', '+919791096862', 'active', '2026-07-07 05:04:55', '2026-07-07 05:04:55'),
(2335, '69e721f4c53d28866db2e885', 'Koushik', 'Rathore', 'Koushik Rathore', 'koushikrathore1920@gmail.com', '+919009672598', 'active', '2026-07-07 05:04:55', '2026-07-07 05:04:55'),
(2336, '69e721e2c53d28866db2e622', 'Muhammad', 'Swalih K H', 'Muhammad Swalih K H', 'swalihkh283@gmail.com', '+918197833283', 'active', '2026-07-07 05:04:55', '2026-07-07 05:04:55'),
(2337, '69e721c5c53d28866db2e3af', 'Kamtam', 'Sahaja', 'Kamtam Sahaja', 'sahajakamtam0205@gmail.com', '+917013459680', 'active', '2026-07-07 05:04:55', '2026-07-07 05:04:55'),
(2338, '69e71cbfc53d28866db29171', 'SVenshika.', 'Name', 'SVenshika. Name', 'venshikamani1809@gmail.com', NULL, 'active', '2026-07-07 05:04:55', '2026-07-07 05:04:55'),
(2339, '69e7002bc53d28866db0f3ae', 'Yatheesh', 'Kumar', 'Yatheesh Kumar', 'yatheeshkumar167@gmail.com', '+919581062131', 'active', '2026-07-07 05:04:55', '2026-07-07 05:04:55'),
(2340, '69e70013c53d28866db0f15c', 'Varshitha', 'N R', 'Varshitha N R', 'rakshuvarshu216@gmail.com', '+918861272232', 'active', '2026-07-07 05:04:55', '2026-07-07 05:04:55'),
(2341, '69e6fff7c53d28866db0ecfc', 'S', 'Sai Aravind', 'S Sai Aravind', 'saiaravind2164@gmail.com', '+916281054135', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2342, '69e6ffe6c53d28866db0eabb', 'SRI', 'REVANTH REDDIPALLI', 'SRI REVANTH REDDIPALLI', 'reddipallisrirevanth@gmail.com', '+919248866777', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2343, '69e6ffd0c53d28866db0e886', 'Sravanth', 'Sorakundla', 'Sravanth Sorakundla', 'sravanthsorakundla26@gmail.com', '+916305630091', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2344, '69e6ffc4c53d28866db0e64d', 'SOUMENDRA', 'ROUT', 'SOUMENDRA ROUT', 'soumendra096@gmail.com', '+918249196095', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2345, '69e6ffb2c53d28866db0e414', 'Sneha', 'Chinchole', 'Sneha Chinchole', 'snehachinchole0@gmail.com', '+918660493214', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2346, '69e6ffa4c53d28866db0e1e2', 'Shubh', 'Sharma', 'Shubh Sharma', 'subhsharmag77@gmail.com', '+918477992808', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2347, '69e6ff93c53d28866db0df9f', 'SHASHANK', 'D L', 'SHASHANK D L', 'dlshashank2004@gmail.com', '+918088650092', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2348, '69e6ff84c53d28866db0dd63', 'SAYAN', 'BISWAS', 'SAYAN BISWAS', 'nayas.infinite@gmail.com', '+918597972460', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2349, '69e6ff70c53d28866db0db28', 'Sarin', 'Unknown', 'Sarin Unknown', 'sarincse04@gmail.com', '+916380917066', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2350, '69e6ff5ac53d28866db0d8f9', 'Santhosh', 'Kumar S P', 'Santhosh Kumar S P', 'santhoshkumarsp222004@gmail.com', '+917418560140', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2351, '69e6ff38c53d28866db0d6a6', 'Santhakumar', 'Ponraj', 'Santhakumar Ponraj', 'santhakumarponraj@gmail.com', '+918122687377', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2352, '69e6ff24c53d28866db0d465', 'SAJID', 'HUSSAIN KHAN', 'SAJID HUSSAIN KHAN', 'sajidhussainkhan.11020@gmail.com', '+918294401212', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2353, '69e6ff11c53d28866db0d21a', 'SAIKIRAN', 'THIPPIRISHETTY', 'SAIKIRAN THIPPIRISHETTY', 'saikiran.thippirishetty128@gmail.com', '+919963225383', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2354, '69e6ff04c53d28866db0cfee', 'Ruchitha', 'k', 'Ruchitha k', 'ruchithakodidala@gmail.com', '+917022144719', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2355, '69e6feffc53d28866db0cdc4', 'Rishi', 'Nataraja', 'Rishi Nataraja', 'rishi.k.nataraja@gmail.com', '+919035220877', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2356, '69e6fef5c53d28866db0cba4', 'RAJKUMARREDDY', 'NARAYANAREDDYGARI', 'RAJKUMARREDDY NARAYANAREDDYGARI', 'nrrajkumarreddy@gmail.com', '+919390345801', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2357, '69e6fee8c53d28866db0c979', 'RAHUL', 'YADRANVI', 'RAHUL YADRANVI', 'rahulyadranvi23@gmail.com', '+918310779605', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2358, '69e6fedbc53d28866db0c749', 'Pruthvi', 'Deepam L A', 'Pruthvi Deepam L A', 'pruthvideepam01@gmail.com', '+917204509884', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2359, '69e6fec2c53d28866db0c508', 'PRIYANKA', 'KOMMANI', 'PRIYANKA KOMMANI', 'priyankakommani@gmail.com', '+918374412944', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2360, '69e6fea3c53d28866db0c093', 'Prasad', 'Khandual', 'Prasad Khandual', 'prasadkhandual180@gmail.com', '+919348727477', 'active', '2026-07-07 05:04:56', '2026-07-07 05:04:56'),
(2361, '69e6fe8ac53d28866db0bc37', 'Pavethran', 'D', 'Pavethran D', 'pavethranerd@gmail.com', '+916374124045', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2362, '69e6fe78c53d28866db0b9fa', 'Nikhil', 'Polavarapu', 'Nikhil Polavarapu', 'polavarapunikhil23@gmail.com', '+918688810674', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2363, '69e6fe5fc53d28866db0b5a3', 'Sundara', 'Narendra', 'Sundara Narendra', 'narendrasundara369@gmail.com', '+916281112117', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2364, '69e6fe4ac53d28866db0b367', 'Lipsy', 'Anlin Jacob Nazareth', 'Lipsy Anlin Jacob Nazareth', 'anlin19nazareth@gmail.com', '+917483188356', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2365, '69e6fe35c53d28866db0b11b', 'Lalith', 'Karri', 'Lalith Karri', 'karri.lalithaditya@gmail.com', '+918466043867', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2366, '69e6fe27c53d28866db0aee7', 'KARUNESH', 'ANAND', 'KARUNESH ANAND', 'karuneshanandg@gmail.com', '+919660070308', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2367, '69e6fe13c53d28866db0acbc', 'Kanchan', 'Dwivedi', 'Kanchan Dwivedi', 'kanchandwivedi708@gmail.com', '+919302364036', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2368, '69e6fe00c53d28866db0aa8d', 'Jayesh', 'Mahajan', 'Jayesh Mahajan', 'jayeshmahajan8055@gmail.com', '+919022930898', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2369, '69e6fdd2c53d28866db0a833', 'Hrithik', 'L', 'Hrithik L', 'hrithiklokesh7@gmail.com', '+916364436138', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2370, '69e6fdb5c53d28866db0a4c9', 'Gomathy', 'Unknown', 'Gomathy Unknown', 'gomathygopi109@gmail.com', '+919841047479', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2371, '69e6fda8c53d28866db0a299', 'DURGA', 'PRASANTHI GUNISETTI', 'DURGA PRASANTHI GUNISETTI', 'durgaprasanthigunisetti@gmail.com', '+917995931531', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2372, '69e6fd99c53d28866db0a065', 'Deekshitha', 'K V', 'Deekshitha K V', 'deekshithakv1804@gmail.com', '+919380656374', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2373, '69e6fd8cc53d28866db09e36', 'BIJAYALAXMI', 'ROUT', 'BIJAYALAXMI ROUT', 'bijayalaxmirout019@gmail.com', '+917504042586', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2374, '69e6fd7cc53d28866db09c0e', 'Bhanupriya', 'L', 'Bhanupriya L', 'bhanu21priya.banu@gmail.com', '+917795974537', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2375, '69e6fd6cc53d28866db099d8', 'Ashutosh', 'Srivastava', 'Ashutosh Srivastava', 'ashutoshsrivastava15nov@gmail.com', '+919118011429', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2376, '69e6fd56c53d28866db097a2', 'ANSHUL', 'KANSAL', 'ANSHUL KANSAL', 'kansalanshul121@gmail.com', '+917078884338', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2377, '69e6fd47c53d28866db0954e', 'Aman', 'Sahil', 'Aman Sahil', 'aman09sahil06@gmail.com', '+919310567458', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2378, '69e6fd36c53d28866db0931d', 'Akash', 'Kushwaha', 'Akash Kushwaha', '908akashkushwaha@gmail.com', '+917019748875', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2379, '69e6fd28c53d28866db090f4', 'Abhilash', 'Yadnik', 'Abhilash Yadnik', 'abhilash.yadnik58@gmail.com', '+919518732981', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2380, '69e6f9b3c53d28866db066c8', 'Balachandru', 'Unknown', 'Balachandru Unknown', 'balachandru6786@gmail.com', '+919514979008', 'active', '2026-07-07 05:04:57', '2026-07-07 05:04:57'),
(2381, '69e6f67ac53d28866db01525', 'Veena', 'Bhalla', 'Veena Bhalla', 'vinnibhalla288@gmail.com', '+919686193301', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2382, '69e6f66cc53d28866db012dc', 'Vachana', 'Muthanna Maruvanda', 'Vachana Muthanna Maruvanda', 'vachanam7m@gmail.com', '+917899211128', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2383, '69e6f653c53d28866db01088', 'Utsav', 'Chandra', 'Utsav Chandra', 'utsavc317@gmail.com', '+919422533558', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2384, '69e6f635c53d28866db00e23', 'Supreet', 'Murkibhavi', 'Supreet Murkibhavi', 'supreetmurkibhavi@gmail.com', '+917259667714', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2385, '69e6f614c53d28866db00bc5', 'Gantyala', 'Sreehitha', 'Gantyala Sreehitha', 'gantyalasreehitha@gmail.com', '+918074839437', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2386, '69e6f5fec53d28866db00956', 'Saniya', 'Kousar', 'Saniya Kousar', 'kousarsaniya0000@gmail.com', '+919980800139', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2387, '69e6f5edc53d28866db006f7', 'Sandeep', 'R', 'Sandeep R', 'rsandeepgowda2003@gmail.com', '+917618770192', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2388, '69e6f5d8c53d28866db00492', 'Sainath', 'Jamashetty', 'Sainath Jamashetty', 'sainathjamshetty@gmail.com', '+918904920601', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2389, '69e6f5a2c53d28866dafffd8', 'SAIKEERTHIDASARI', 'Unknown', 'SAIKEERTHIDASARI Unknown', 'dasarisaikeerthi1651@gmail.com', '+919849471279', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2390, '69e6f577c53d28866daffb30', 'Mohammed', 'Riyazuddin', 'Mohammed Riyazuddin', 'md.riyazuddin.dev@gmail.com', '+919705920030', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2391, '69e6f564c53d28866daff8e0', 'Ribu', 'P B', 'Ribu P B', 'ribubabu94@gmail.com', '+919080033505', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2392, '69e6f54fc53d28866daff67f', 'LOHITH', 'RACHAGOLLA', 'LOHITH RACHAGOLLA', 'lohithrachagolla@gmail.com', '+919502255616', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2393, '69e6f532c53d28866daff408', 'Prayaga', 'Sahu', 'Prayaga Sahu', 'prayagash@gmail.com', '+918144885446', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2394, '69e6f522c53d28866daff1a8', 'PRAVALLIKADEVI', 'LEKKALA', 'PRAVALLIKADEVI LEKKALA', 'lekkalapravallika4@gmail.com', '+917569895335', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2395, '69e6f514c53d28866dafef53', 'Prashant', 'Tomar', 'Prashant Tomar', 'tomarprashant1996@gmail.com', '+916395658967', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2396, '69e6f502c53d28866dafecfe', 'PRASHANT', 'PATIL', 'PRASHANT PATIL', 'prashant1197.patil@gmail.com', '+918830504487', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2397, '69e6f4edc53d28866dafea9f', 'A', 'PRASANNA VENKATESH', 'A PRASANNA VENKATESH', 'prasana.venkat1998@gmail.com', '+919600835869', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2398, '69e6f4d8c53d28866dafe84c', 'Chandana', 'Potakamuri', 'Chandana Potakamuri', 'chandana369chandu@gmail.com', '+919347828203', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2399, '69e6f4cac53d28866dafe5f1', 'PAVAN', 'Unknown', 'PAVAN Unknown', 'pavan7259984139@gmail.com', '+917259984139', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2400, '69e6f4b1c53d28866dafe332', 'Nikhil', 'Vadla', 'Nikhil Vadla', 'vadlanikhil96@gmail.com', '+916302920528', 'active', '2026-07-07 05:04:58', '2026-07-07 05:04:58'),
(2401, '69e6f49cc53d28866dafe0ea', 'NEIL', 'BANERJEE', 'NEIL BANERJEE', 'neilbanerjee.22.5.2002@gmail.com', '+919129105830', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2402, '69e6f46bc53d28866dafdc37', 'Mohit', 'Singh', 'Mohit Singh', 'mohitsingh311996@gmail.com', '+917897565010', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2403, '69e6f45bc53d28866dafd9e0', 'Mehak', 'Basrani', 'Mehak Basrani', 'mehakbasrani17@gmail.com', '+917489601723', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2404, '69e6f439c53d28866dafd533', 'Manish', 'Kumar', 'Manish Kumar', 'manishjangir9740@gmail.com', '+919694740308', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2405, '69e6f420c53d28866dafd2e4', 'Sai', 'Mandadapu', 'Sai Mandadapu', 'mandadapusaikiran1@gmail.com', '+918179590133', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2406, '69e6f418c53d28866dafd0a3', 'Madhukar', 'Kasthuri', 'Madhukar Kasthuri', 'madhukark.analyst@gmail.com', '+917659940770', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2407, '69e6f409c53d28866dafce4d', 'Maanvika', 'Thummepalli', 'Maanvika Thummepalli', 'maanvikathummepalli@gmail.com', '+918886335072', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2408, '69e6f3f8c53d28866dafcbfe', 'Lalith', 'Prasad Gondi', 'Lalith Prasad Gondi', 'gondilalithprasad@gmail.com', '+917989655445', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2409, '69e6f3e4c53d28866dafc995', 'Krish', 'Kumar', 'Krish Kumar', 'krishsinghania6115@gmail.com', '+916299744944', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2410, '69e6f3d3c53d28866dafc749', 'Kiran', 'Londhe', 'Kiran Londhe', 'kiranlondhe1604@gmail.com', '+918482925213', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2411, '69e6f3b5c53d28866dafc4f1', 'Kavita', 'Avhad', 'Kavita Avhad', 'avhadkavita312001@gmail.com', '+918080249749', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2412, '69e6f3a5c53d28866dafc2aa', 'Kathi', 'Lavanya', 'Kathi Lavanya', 'lavanyaeswar7731@gmail.com', '+918217335708', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2413, '69e6f398c53d28866dafc061', 'KANISHKA', 'R', 'KANISHKA R', 'kanishkasoftdevp@gmail.com', '+917397033809', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2414, '69e6f385c53d28866dafbe03', 'Kalluri', 'Surendra Reddy', 'Kalluri Surendra Reddy', 'surendrareddykalluri8@gmail.com', '+917893749408', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2415, '69e6f376c53d28866dafbbbb', 'Jignesh', 'Kumar', 'Jignesh Kumar', 'jigneshxi@gmail.com', '+918434762977', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2416, '69e6f35dc53d28866dafb963', 'Devendra', 'Singh', 'Devendra Singh', 'idevendrasingh5@gmail.com', '+919260938528', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2417, '69e6f343c53d28866dafb70f', 'B', 'KALPITHA', 'B KALPITHA', 'kalpitha160704@gmail.com', '+918050431210', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2418, '69e6f32bc53d28866dafb4c0', 'AWANISH', 'KUMAR PRAJAPATI', 'AWANISH KUMAR PRAJAPATI', 'awanishprajapati96@gmail.com', '+917225953298', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2419, '69e6f319c53d28866dafb26d', 'Avinash', 'Ranjan', 'Avinash Ranjan', 'avinashranjan633@gmail.com', NULL, 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2420, '69e6f2ffc53d28866dafb008', 'Anurag', 'Singh', 'Anurag Singh', 'anuragrazarwal@gmail.com', '+917505528143', 'active', '2026-07-07 05:04:59', '2026-07-07 05:04:59'),
(2421, '69e6f2e7c53d28866dafadb1', 'AKSHAT', 'PARAKH', 'AKSHAT PARAKH', 'parakh.akshat25@gmail.com', '+919784918600', 'active', '2026-07-07 05:05:00', '2026-07-07 05:05:00'),
(2422, '69e6f2d4c53d28866dafab5e', 'ADDITYA', 'MISHRA', 'ADDITYA MISHRA', 'additya.akash.mishra@gmail.com', '+918105701716', 'active', '2026-07-07 05:05:00', '2026-07-07 05:05:00'),
(2423, '69e6f2bcc53d28866dafa900', 'Adarsh', 'Hoode', 'Adarsh Hoode', 'adarshhoodevc@gmail.com', '+919446446603', 'active', '2026-07-07 05:05:00', '2026-07-07 05:05:00'),
(2424, '69e6f2a6c53d28866dafa615', 'Aaradhya', 'Pathak', 'Aaradhya Pathak', 'aaradhyapathakofficial@gmail.com', '+917337573796', 'active', '2026-07-07 05:05:00', '2026-07-07 05:05:00'),
(2425, '69e628a7c53d28866daf87ac', 'Prashanth', 'eleshala', 'Prashanth eleshala', 'eleshalaprashanth1234@gmail.com', '+918008800477', 'active', '2026-07-07 05:05:00', '2026-07-07 05:05:00'),
(2426, '69e60fcfc53d28866daf6620', 'Yatharth', 'Srivastava', 'Yatharth Srivastava', 'yatharthsrivastava994@gmail.com', '+916307241680', 'active', '2026-07-07 05:05:00', '2026-07-07 05:05:00'),
(2427, '69e60fc0c53d28866daf63ae', 'Vishal', 'Gupta', 'Vishal Gupta', 'guptavishal2k@gmail.com', '+916006769605', 'active', '2026-07-07 05:05:00', '2026-07-07 05:05:00'),
(2428, '69e60fa5c53d28866daf615d', 'Vishakha', 'Naik', 'Vishakha Naik', 'vishakhanaik099@gmail.com', '+919880797698', 'active', '2026-07-07 05:05:00', '2026-07-07 05:05:00'),
(2429, '69e60f92c53d28866daf5f01', 'Vinitha', 'A', 'Vinitha A', 'vinithaasokan1113@gmail.com', '+919791667415', 'active', '2026-07-07 05:05:00', '2026-07-07 05:05:00'),
(2430, '69e60f84c53d28866daf5cb4', 'MODALA', 'V S S SAI PAVAN KUMAR', 'MODALA V S S SAI PAVAN KUMAR', 'venkatapavan350@gmail.com', '+916305696418', 'active', '2026-07-07 05:05:00', '2026-07-07 05:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `due_date` date NOT NULL,
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `status` enum('pending','in_progress','completed') NOT NULL DEFAULT 'pending',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `due_date`, `priority`, `status`, `created_by`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 'Whatsapp  Intigration', 'Demo', '2026-07-05', 'low', 'pending', 3, NULL, '2026-07-04 13:57:45', '2026-07-04 13:57:45'),
(2, 'Whatsapp  Intigration', 'Demo', '2026-07-06', 'medium', 'pending', 3, NULL, '2026-07-04 14:01:17', '2026-07-04 14:01:17'),
(3, 'Whatsapp  Intigration', 'xvxc', '2026-07-09', 'medium', 'pending', 3, NULL, '2026-07-04 14:25:42', '2026-07-04 14:25:42'),
(4, 'Independence Day', 'sdfasdf', '2026-07-10', 'medium', 'pending', 21, NULL, '2026-07-04 14:27:19', '2026-07-04 14:27:19'),
(5, 'Varasiddhi Vinayaka Vrata (Ganesh Chaturthi)', 'asdfasgd', '2026-07-07', 'medium', 'pending', 3, NULL, '2026-07-04 14:43:56', '2026-07-04 14:43:56'),
(6, 'Varasiddhi Vinayaka Vrata (Ganesh Chaturthi)', 'hhhhhhh', '2026-07-01', 'medium', 'pending', 19, NULL, '2026-07-04 14:57:13', '2026-07-04 14:57:13'),
(7, 'Independence Day', 'jjjj', '2026-07-08', 'medium', 'pending', 21, NULL, '2026-07-04 14:59:05', '2026-07-04 14:59:05'),
(8, 'heryu', 'yturtyu', '2026-07-06', 'medium', 'completed', 1, '2026-07-06 14:36:20', '2026-07-04 15:48:08', '2026-07-06 14:36:20'),
(9, 'Intigration', 'ghjgh', '2026-07-07', 'low', 'pending', 21, NULL, '2026-07-04 15:49:08', '2026-07-04 15:49:08');

-- --------------------------------------------------------

--
-- Table structure for table `task_assignees`
--

CREATE TABLE `task_assignees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `is_flagged` tinyint(1) NOT NULL DEFAULT 0,
  `flagged_at` timestamp NULL DEFAULT NULL,
  `last_reminded_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_assignees`
--

INSERT INTO `task_assignees` (`id`, `task_id`, `user_id`, `is_completed`, `completed_at`, `is_flagged`, `flagged_at`, `last_reminded_at`, `created_at`, `updated_at`) VALUES
(1, 1, 21, 0, NULL, 0, NULL, NULL, '2026-07-04 13:57:45', '2026-07-04 13:57:45'),
(2, 1, 23, 0, NULL, 0, NULL, NULL, '2026-07-04 13:57:45', '2026-07-04 13:57:45'),
(3, 2, 21, 1, '2026-07-04 14:02:31', 0, NULL, NULL, '2026-07-04 14:01:17', '2026-07-04 14:02:31'),
(4, 2, 23, 0, NULL, 0, NULL, NULL, '2026-07-04 14:01:17', '2026-07-04 14:01:17'),
(5, 2, 10, 0, NULL, 0, NULL, NULL, '2026-07-04 14:01:17', '2026-07-04 14:01:17'),
(6, 3, 21, 0, NULL, 0, NULL, NULL, '2026-07-04 14:25:42', '2026-07-04 14:25:42'),
(7, 4, 3, 0, NULL, 0, NULL, NULL, '2026-07-04 14:27:19', '2026-07-04 14:27:19'),
(8, 4, 21, 0, NULL, 0, NULL, NULL, '2026-07-04 14:27:19', '2026-07-04 14:27:19'),
(9, 4, 23, 0, NULL, 0, NULL, NULL, '2026-07-04 14:27:19', '2026-07-04 14:27:19'),
(10, 5, 21, 0, NULL, 0, NULL, NULL, '2026-07-04 14:43:56', '2026-07-04 14:43:56'),
(11, 6, 21, 0, NULL, 0, NULL, NULL, '2026-07-04 14:57:13', '2026-07-04 14:57:13'),
(12, 7, 19, 0, NULL, 0, NULL, NULL, '2026-07-04 14:59:05', '2026-07-04 14:59:05'),
(13, 8, 21, 1, '2026-07-06 14:36:20', 0, NULL, NULL, '2026-07-04 15:48:08', '2026-07-06 14:36:20'),
(14, 9, 1, 0, NULL, 0, NULL, NULL, '2026-07-04 15:49:08', '2026-07-04 15:49:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `whatsapp_number` varchar(20) DEFAULT NULL,
  `alternate_phone` varchar(20) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reporting_manager_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_type` enum('Permanent','Contract','Intern') DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `resignation_date` date DEFAULT NULL,
  `last_working_day` date DEFAULT NULL,
  `employment_status` enum('Active','Inactive','Resigned','Terminated') NOT NULL DEFAULT 'Active',
  `salary` decimal(10,2) DEFAULT NULL,
  `salary_type` enum('Monthly','Hourly') DEFAULT NULL,
  `incentive` decimal(10,2) DEFAULT NULL,
  `bonus` decimal(10,2) DEFAULT NULL,
  `pan_number` varchar(20) DEFAULT NULL,
  `aadhaar_number` varchar(20) DEFAULT NULL,
  `pf_number` varchar(30) DEFAULT NULL,
  `esi_number` varchar(30) DEFAULT NULL,
  `uan_number` varchar(30) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `account_holder_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(30) DEFAULT NULL,
  `ifsc_code` varchar(15) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `upi_id` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `aadhaar_file` varchar(255) DEFAULT NULL,
  `pan_file` varchar(255) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `offer_letter` varchar(255) DEFAULT NULL,
  `experience_letter` varchar(255) DEFAULT NULL,
  `salary_slip` varchar(255) DEFAULT NULL,
  `cancelled_cheque` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `employee_id`, `first_name`, `last_name`, `full_name`, `gender`, `date_of_birth`, `profile_photo`, `email`, `email_verified_at`, `password`, `phone`, `whatsapp_number`, `alternate_phone`, `designation`, `department`, `role_id`, `reporting_manager_id`, `employee_type`, `joining_date`, `resignation_date`, `last_working_day`, `employment_status`, `salary`, `salary_type`, `incentive`, `bonus`, `pan_number`, `aadhaar_number`, `pf_number`, `esi_number`, `uan_number`, `bank_name`, `account_holder_name`, `account_number`, `ifsc_code`, `branch_name`, `upi_id`, `address`, `city`, `state`, `country`, `pincode`, `aadhaar_file`, `pan_file`, `resume`, `offer_letter`, `experience_letter`, `salary_slip`, `cancelled_cheque`, `is_active`, `last_login_at`, `remember_token`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'EMP001', 'Krish', 'Bhargav', 'Krish Bhargav', NULL, '2026-07-06', NULL, 'krish.bhargav@browsejobs.com', NULL, '$2y$12$XrWyvfDWaBCr1Q7HJn40O.Aj6ikIEij03UPudTILplwkjMTlsouWq', NULL, NULL, NULL, 'CEO / Founder', 'Management', 1, 3, 'Permanent', '2026-07-02', NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-07-09 05:19:45', 'xhRvDAV6UnRFmHn77kHZCIwb6fDnpW08sEHlhQ46asIunteuCsGHASiK2cpp', NULL, NULL, NULL, '2026-07-02 13:46:14', '2026-07-09 05:19:45'),
(3, 'EMP101', 'Dhanya', 'Gowda', 'Dhanya Gowda', NULL, '2026-07-07', NULL, 'dhanya.gowda@browsejobs.com', NULL, '$2y$12$9OzYiJ5HgyBb82pWzWqRpu.MWxGSxyjLMScHC/b3VR.YiRr2.16OO', NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-07-04 09:45:14', 'FVHumkLHEBRBQVOhjYYEOh4LfhaJXNwKKmxVOav4L81k8bK51MTMPzYeP3Ng', NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-04 09:45:14'),
(4, 'EMP102', 'Priyanka', 'Patnaik', 'Priyanka Patnaik', NULL, '2026-07-08', NULL, 'priyanka.patnaik@browsejobs.com', NULL, '$2y$12$WNwBL5odGvC/kLeOEPom/Oz/XG3Gox12UcgUA9FuXGMylbNpDXGGC', NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-07-03 12:59:59', 'LEWKttLMYB9GE94vXDRPFsFmwJinF4epdpQLmy5xhNTYhDJ2FwEsWmLL5jlO', NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 12:59:59'),
(5, 'EMP103', 'Madusmitha', 'Choudhary', 'Madusmitha Choudhary', NULL, '2026-07-09', NULL, 'madusmitha.choudhary@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(6, 'EMP105', 'Soumya', 'Das', 'Soumya Das', NULL, NULL, NULL, 'soumya.das@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(7, 'EMP104', 'Remya', 'Vijay', 'Remya Vijay', NULL, NULL, NULL, 'remya.vijay@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(8, 'EMP108', 'Snehal', 'Patil', 'Snehal Patil', NULL, NULL, NULL, 'snehal.patil@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(9, 'EMP106', 'Purvi', 'Raval', 'Purvi Raval', NULL, NULL, NULL, 'purvi.raval@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(10, 'EMP107', 'Kokkirala', 'Geetha Bhavani', 'Kokkirala Geetha Bhavani', NULL, NULL, NULL, 'kokkirala.geethabhavani@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(11, 'EMP109', 'Gundlapalli', 'Anitha', 'Gundlapalli Anitha', NULL, NULL, NULL, 'gundlapalli.anitha@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(12, 'EMP110', 'Yellanki', 'Chandana', 'Yellanki Chandana', NULL, NULL, NULL, 'yellanki.chandana@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(13, 'EMP111', 'Nafisa', 'Ahmed', 'Nafisa Ahmed', NULL, NULL, NULL, 'nafisa.ahmed@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(14, 'EMP112', 'Sreeja', 'Roy', 'Sreeja Roy', NULL, NULL, NULL, 'sreeja.roy@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(15, 'EMP113', 'Preeti', 'Bhosale', 'Preeti Bhosale', NULL, NULL, NULL, 'preeti.bhosale@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(16, 'EMP114', 'Shirisha', 'B', 'Shirisha B', NULL, NULL, NULL, 'shirisha.b@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(17, 'EMP116', 'Sameera', 'Shafi', 'Sameera Shafi', NULL, NULL, NULL, 'sameera.shafi@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(18, 'EMP115', 'Shalini', NULL, 'Shalini', NULL, NULL, NULL, 'shalini@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(19, 'EMP117', 'Swati', 'Das', 'Swati Das', NULL, NULL, NULL, 'swati.das@browsejobs.com', NULL, '$2y$12$oogCSJ03qgvMXsXQV1UFme4a.EYamsvocWxGPT2in9uwgTFAonzmS', NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-07-04 14:56:48', 'IAvt7vk7O14BSjE1cf53rVEZLIja6MGA9brX38I37UNaBuOO2vKHzC57X2v2', NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-04 14:56:48'),
(20, 'EMP118', 'Gouttam', NULL, 'Gouttam', NULL, NULL, NULL, 'gouttam@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(21, 'EMP119', 'Iyyapan', NULL, 'Iyyapan', NULL, NULL, NULL, 'iyyapan@browsejobs.com', NULL, '$2y$12$NEVLXNt8y5N.DtPpQTPdk.8tWTbo1KQkYcq/vROWJptGXUr3n.jva', NULL, NULL, NULL, NULL, NULL, 19, 19, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-07-06 04:30:01', 'YdvWqFgN8Lr0hMcbDpc8KAP9k37HiafvkMRNGiDxA8xi7G7ZbS23rmzz5rYo', NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-06 04:30:01'),
(22, 'EMP120', 'Rakhi', 'Jain', 'Rakhi Jain', NULL, NULL, NULL, 'rakhi.jain@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(23, 'EMP121', 'Jyotiranjan', NULL, 'Jyotiranjan', 'Male', '2001-05-24', 'employees/profile_photo/YNEABYo09kXyj8UAwXFqFKfothsmdrcH2hB8aZVo.jpg', 'jyotiranjan@browsejobs.com', NULL, '$2y$12$YHfL/sgDqBDRFuwV9CrP7..eo0TPgOAdr8FYmFWP0T.nsldRcr1z.', '8114637479', '9337367467', NULL, 'Media Strategist', 'Media', 19, 19, 'Permanent', '2026-06-08', NULL, NULL, 'Active', 10000.00, 'Monthly', 0.00, 0.00, 'FUCPB7573N', '657938232049', NULL, NULL, NULL, 'State Bank Of India', 'Jyotiranjan Behera', '33559262036', 'SBIN0012058', 'Marshaghai', 'rockjyoti@ybl', 'Kenderapara,Marshaghai,754213', 'Bhubaneswar', 'Odisha', 'India', '754213', 'employees/aadhaar_file/o8ZL9bvFeRFDe1D0vehtt3qDNgrw6hECeFNPd6Pk.jpg', 'employees/pan_file/HPzu5uoMSOXLyBbOBrbv3H5G3i5V3cQuIn7nqtLE.jpg', NULL, NULL, NULL, NULL, NULL, 1, '2026-07-03 00:10:45', 'qS8TcHJdntQRJhWmJLYjB8i2QFlTxTdNdAir3SNBkveXVQvK21oSAbS6YFA1', NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 00:10:45'),
(24, 'EMP122', 'Fathima', 'Farwa', 'Fathima Farwa', NULL, NULL, NULL, 'fathima.farwa@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(25, 'EMP123', 'Somali', 'Bisoi', 'Somali Bisoi', NULL, NULL, NULL, 'somali.bisoi@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(26, 'EMP124', 'Satyajeev', 'Patnaik', 'Satyajeev Patnaik', NULL, NULL, NULL, 'satyajeev.patnaik@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(27, 'EMP125', 'Swathi', 'Ramdas', 'Swathi Ramdas', NULL, NULL, NULL, 'swathi.ramdas@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-03 03:51:13'),
(28, 'EMP126', 'Anjali', 'Ambastha', 'Anjali Ambastha', NULL, NULL, NULL, 'anjali.ambastha@browsejobs.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2026-07-03 03:51:13', '2026-07-02 23:36:29');

-- --------------------------------------------------------

--
-- Table structure for table `user_login_logs`
--

CREATE TABLE `user_login_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `session_token` varchar(255) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_ip` varchar(45) DEFAULT NULL,
  `login_device_id` varchar(255) DEFAULT NULL,
  `login_device_name` varchar(255) DEFAULT NULL,
  `login_device_type` varchar(50) DEFAULT NULL,
  `login_browser` varchar(255) DEFAULT NULL,
  `login_os` varchar(255) DEFAULT NULL,
  `login_user_agent` text DEFAULT NULL,
  `login_latitude` decimal(10,8) DEFAULT NULL,
  `login_longitude` decimal(11,8) DEFAULT NULL,
  `login_location` varchar(255) DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `logout_ip` varchar(45) DEFAULT NULL,
  `logout_device_id` varchar(255) DEFAULT NULL,
  `logout_reason` varchar(255) DEFAULT NULL,
  `logout_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_manual_entry` tinyint(1) NOT NULL DEFAULT 0,
  `manual_reason` text DEFAULT NULL,
  `is_active_session` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_login_logs`
--

INSERT INTO `user_login_logs` (`id`, `user_id`, `session_token`, `login_time`, `login_ip`, `login_device_id`, `login_device_name`, `login_device_type`, `login_browser`, `login_os`, `login_user_agent`, `login_latitude`, `login_longitude`, `login_location`, `logout_time`, `logout_ip`, `logout_device_id`, `logout_reason`, `logout_by_user_id`, `created_by_user_id`, `is_manual_entry`, `manual_reason`, `is_active_session`, `created_at`, `updated_at`) VALUES
(1, 1, 'a3Kql2wed0Kq1w7QjFtWO0ZbYVTAbdX1MK4WVAqc', '2026-07-03 16:34:55', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, '2026-07-03 11:04:55', '2026-07-03 11:04:55'),
(2, 21, 'eKcCBmc3U3NWULaf44IQGKKuf8v2WiY97psjEYcR', '2026-07-03 16:57:57', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, '2026-07-04 10:48:52', NULL, NULL, 'admin_force_logout', 1, NULL, 0, 'Forgot to logout', 0, '2026-07-03 11:27:57', '2026-07-04 05:18:52'),
(3, 4, 'hidWDNOJt8we2T0pHcOnQSvA3NJH0hqckGlhPSJv', '2026-07-03 18:29:59', '127.0.0.1', NULL, NULL, 'desktop', 'Chrome', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, NULL, NULL, '2026-07-03 18:36:11', '127.0.0.1', NULL, 'user_logout', 4, NULL, 0, NULL, 0, '2026-07-03 12:59:59', '2026-07-03 13:06:11'),
(4, 3, 'XfCgt31DeB4D5rBWZTeEbePj5PZesadmvhW5HojC', '2026-07-03 18:36:22', '127.0.0.1', NULL, NULL, 'desktop', 'Chrome', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, NULL, NULL, '2026-07-03 19:52:13', '127.0.0.1', NULL, 'user_logout', 3, NULL, 0, NULL, 0, '2026-07-03 13:06:22', '2026-07-03 14:22:13'),
(5, 3, 'eFk139T4MOvCwOaEOltin6WnAC18NFmuyToERGqa', '2026-07-03 19:52:48', '127.0.0.1', NULL, NULL, 'desktop', 'Chrome', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, NULL, NULL, '2026-07-09 11:12:19', NULL, NULL, 'admin_force_logout', 1, NULL, 0, 'Forgot', 0, '2026-07-03 14:22:48', '2026-07-09 05:42:19'),
(6, 19, 'nkZxuYejCwCQOqj7ilspXvECFj659rGcsQbrGUsz', '2026-07-03 20:13:43', '127.0.0.1', NULL, NULL, 'desktop', 'Chrome', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, '2026-07-03 14:43:43', '2026-07-03 14:43:43'),
(7, 1, 'kCD72wpncVoS1KngEoEfJg7zjQK05QGKa9l9nMMF', '2026-07-04 14:58:31', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, '2026-07-04 15:01:00', '127.0.0.1', NULL, 'user_logout', 1, NULL, 0, NULL, 0, '2026-07-04 09:28:31', '2026-07-04 09:31:00'),
(8, 21, 'AZaO3r3QklKWNN3qOzJLG5ypyeq29SbDNQ2mFG8C', '2026-07-04 14:59:15', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, '2026-07-04 19:47:13', '127.0.0.1', NULL, 'user_logout', 21, NULL, 0, NULL, 0, '2026-07-04 09:29:15', '2026-07-04 14:17:13'),
(9, 1, 'Ro8KZz2jmAjwU4F8g8dZXIbizVbAa5IblKwKnrmG', '2026-07-04 15:01:37', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, '2026-07-04 09:31:37', '2026-07-04 09:31:37'),
(10, 3, 'NyIUH1JC8gL2JuiayWE5ZCmZUyhvJdc0Bm1JyfQs', '2026-07-04 15:03:26', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, '2026-07-04 15:04:56', '127.0.0.1', NULL, 'user_logout', 3, NULL, 0, NULL, 0, '2026-07-04 09:33:26', '2026-07-04 09:34:56'),
(11, 3, 'aAedrlSEzWe1qgAyssoov6JBYyz9EHC3nwetONyz', '2026-07-04 15:04:23', '127.0.0.1', NULL, NULL, 'desktop', 'Chrome', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, NULL, NULL, '2026-07-04 15:16:07', '127.0.0.1', NULL, 'user_logout', 3, NULL, 0, NULL, 0, '2026-07-04 09:34:23', '2026-07-04 09:46:07'),
(12, 1, 'xHWFUbAWbChWF8mf24rXNoeIBZ5doMiXA7pejnPx', '2026-07-04 15:05:01', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, '2026-07-04 15:15:04', '127.0.0.1', NULL, 'user_logout', 1, NULL, 0, NULL, 0, '2026-07-04 09:35:01', '2026-07-04 09:45:04'),
(13, 3, 'fVXkdi5IywQqkP6sNXmNqxagZ3vuNDEc1kpLTX1x', '2026-07-04 15:15:13', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, '2026-07-04 20:23:31', '127.0.0.1', NULL, 'user_logout', 3, NULL, 0, NULL, 0, '2026-07-04 09:45:14', '2026-07-04 14:53:31'),
(14, 21, 'XJNTH7mtNUaxZmSlionTVfdt3jcBdPfDnHvHKirM', '2026-07-04 19:47:17', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, '2026-07-04 21:11:20', '127.0.0.1', NULL, 'user_logout', 21, NULL, 0, NULL, 0, '2026-07-04 14:17:17', '2026-07-04 15:41:20'),
(15, 1, '15qTV8gyTEGGtP2wWRzvaxqSLNoP3jLfOCy2ll0Z', '2026-07-04 20:23:46', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, '2026-07-04 20:24:26', '127.0.0.1', NULL, 'user_logout', 1, NULL, 0, NULL, 0, '2026-07-04 14:53:46', '2026-07-04 14:54:26'),
(16, 19, 'WbRkDs0BSjD69pZrJ4mgEw9E2SWr8b0zwVycUkHH', '2026-07-04 20:24:34', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, '2026-07-04 20:25:07', '127.0.0.1', NULL, 'user_logout', 19, NULL, 0, NULL, 0, '2026-07-04 14:54:34', '2026-07-04 14:55:07'),
(17, 1, 'KWH9xC1zonfdVn2WVy7h9zJ56HYXXoGHHMrtRpY3', '2026-07-04 20:25:20', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, '2026-07-04 20:26:44', '127.0.0.1', NULL, 'user_logout', 1, NULL, 0, NULL, 0, '2026-07-04 14:55:20', '2026-07-04 14:56:44'),
(18, 19, 'ey0syl1k0F2EdUcXtiy6jncU3pxB2ZLzlD3CImrS', '2026-07-04 20:26:48', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, '2026-07-04 21:10:38', '127.0.0.1', NULL, 'user_logout', 19, NULL, 0, NULL, 0, '2026-07-04 14:56:48', '2026-07-04 15:40:38'),
(19, 1, 'ZO6KrBk4gZBom35Wcd5vf1aNwKantckIMQlVmv7w', '2026-07-04 21:11:03', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, '2026-07-04 21:12:06', '127.0.0.1', NULL, 'user_logout', 1, NULL, 0, NULL, 0, '2026-07-04 15:41:03', '2026-07-04 15:42:06'),
(20, 1, 'vQkaRsF8hLQnNAbHUwyMUL6PP99D2TrLJy8A7DfQ', '2026-07-04 21:12:28', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, '2026-07-04 21:13:50', '127.0.0.1', NULL, 'user_logout', 1, NULL, 0, NULL, 0, '2026-07-04 15:42:28', '2026-07-04 15:43:50'),
(21, 1, 'fAVyFoRwao2GvB7HemX3o47Oz679MruhWxZiAU0h', '2026-07-04 21:14:57', '127.0.0.1', NULL, NULL, 'desktop', 'Chrome', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, '2026-07-04 15:44:57', '2026-07-04 15:44:57'),
(22, 1, '36eh0jXDLxmTBLFC8HPfV2tA389r72no4v1zU2GN', '2026-07-04 21:15:28', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, '2026-07-04 21:15:39', '127.0.0.1', NULL, 'user_logout', 1, NULL, 0, NULL, 0, '2026-07-04 15:45:28', '2026-07-04 15:45:39'),
(23, 21, 'qVc3Po9qjhTV3orYvaq9ROTGNPHf2EVPBFqpbXg9', '2026-07-04 21:17:14', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, '2026-07-04 15:47:14', '2026-07-04 15:47:14'),
(24, 1, '0Yo6A3WLNadZjus8uPOtVL3QtNB2LdgtwCmfhJqw', '2026-07-06 09:54:31', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, '2026-07-06 04:24:31', '2026-07-06 04:24:31'),
(25, 21, 'vANWVUByxsXXKtrWwxJO2gMnoNnNfLyNJVVTi7AA', '2026-07-06 10:00:01', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, '2026-07-06 04:30:01', '2026-07-06 04:30:01'),
(26, 1, 'YKVt6P7GaJXxdUriC6yMthytag9Uy2PSuYIXnLhp', '2026-07-06 10:31:52', '127.0.0.1', NULL, NULL, 'desktop', 'Chrome', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, '2026-07-06 05:01:52', '2026-07-06 05:01:52'),
(27, 1, 'jt8qA5BnxBHk2HAaaeB0dKV4tjMwpn9imDLyBiNE', '2026-07-06 14:38:20', '127.0.0.1', NULL, NULL, 'desktop', 'Chrome', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, '2026-07-06 09:08:20', '2026-07-06 09:08:20'),
(28, 1, 'QczlSsSrJ4ZHbb4Cmae7eM3aaDe8oOlfTs7x8uAy', '2026-07-09 10:49:44', '127.0.0.1', NULL, NULL, 'desktop', 'Firefox', 'Windows', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, '2026-07-09 05:19:44', '2026-07-09 05:19:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversations_created_by_foreign` (`created_by`);

--
-- Indexes for table `conversation_participants`
--
ALTER TABLE `conversation_participants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `conversation_participants_conversation_id_user_id_unique` (`conversation_id`,`user_id`),
  ADD KEY `conversation_participants_user_id_foreign` (`user_id`);

--
-- Indexes for table `course_catalog`
--
ALTER TABLE `course_catalog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_course_slug` (`slug`),
  ADD KEY `idx_course_status` (`status`);

--
-- Indexes for table `course_inquiries`
--
ALTER TABLE `course_inquiries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_inquiry_ref` (`reference`),
  ADD KEY `idx_inquiry_course` (`course_id`),
  ADD KEY `idx_inquiry_status` (`status`);

--
-- Indexes for table `course_registrations`
--
ALTER TABLE `course_registrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_reg_ref` (`reference`),
  ADD UNIQUE KEY `uq_reg_invoice` (`invoice_number`),
  ADD KEY `idx_reg_order` (`razorpay_order_id`),
  ADD KEY `idx_reg_status` (`payment_status`),
  ADD KEY `idx_reg_course` (`course_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `enrollments_reference_unique` (`reference`),
  ADD KEY `enrollments_course_slug_index` (`course_slug`),
  ADD KEY `enrollments_razorpay_order_id_index` (`razorpay_order_id`),
  ADD KEY `enrollments_payment_status_index` (`payment_status`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_created_by_foreign` (`created_by`),
  ADD KEY `expenses_status_expense_date_index` (`status`,`expense_date`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `holidays_created_by_foreign` (`created_by`),
  ADD KEY `holidays_year_holiday_date_index` (`year`,`holiday_date`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_added_by_user_id_foreign` (`added_by_user_id`),
  ADD KEY `leads_assigned_to_user_id_foreign` (`assigned_to_user_id`),
  ADD KEY `leads_assigned_by_user_id_foreign` (`assigned_by_user_id`),
  ADD KEY `leads_mobile_index` (`mobile`),
  ADD KEY `leads_current_status_id_assigned_to_user_id_index` (`current_status_id`,`assigned_to_user_id`);

--
-- Indexes for table `lead_assignments`
--
ALTER TABLE `lead_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_assignments_assigned_to_user_id_foreign` (`assigned_to_user_id`),
  ADD KEY `lead_assignments_assigned_by_user_id_foreign` (`assigned_by_user_id`),
  ADD KEY `lead_assignments_lead_id_index` (`lead_id`);

--
-- Indexes for table `lead_conversations`
--
ALTER TABLE `lead_conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_conversations_handled_by_user_id_foreign` (`handled_by_user_id`),
  ADD KEY `lead_conversations_lead_id_occurred_at_index` (`lead_id`,`occurred_at`),
  ADD KEY `lead_conversations_channel_index` (`channel`);

--
-- Indexes for table `lead_conversation_tags`
--
ALTER TABLE `lead_conversation_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_conversation_tags_conversation_id_foreign` (`conversation_id`),
  ADD KEY `lead_conversation_tags_tag_index` (`tag`);

--
-- Indexes for table `lead_notifications`
--
ALTER TABLE `lead_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_notifications_lead_id_foreign` (`lead_id`),
  ADD KEY `lead_notifications_notify_user_id_is_read_index` (`notify_user_id`,`is_read`);

--
-- Indexes for table `lead_statuses`
--
ALTER TABLE `lead_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lead_statuses_slug_unique` (`slug`);

--
-- Indexes for table `lead_status_history`
--
ALTER TABLE `lead_status_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_status_history_status_id_foreign` (`status_id`),
  ADD KEY `lead_status_history_lost_reason_id_foreign` (`lost_reason_id`),
  ADD KEY `lead_status_history_changed_by_user_id_foreign` (`changed_by_user_id`),
  ADD KEY `lead_status_history_lead_id_created_at_index` (`lead_id`,`created_at`);

--
-- Indexes for table `leave_balances`
--
ALTER TABLE `leave_balances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `leave_balances_user_id_leave_type_id_year_unique` (`user_id`,`leave_type_id`,`year`),
  ADD KEY `leave_balances_leave_type_id_foreign` (`leave_type_id`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_requests_leave_type_id_foreign` (`leave_type_id`),
  ADD KEY `leave_requests_reviewed_by_foreign` (`reviewed_by`),
  ADD KEY `leave_requests_user_id_status_index` (`user_id`,`status`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `leave_types_code_unique` (`code`);

--
-- Indexes for table `lost_reasons`
--
ALTER TABLE `lost_reasons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lost_reasons_reason_unique` (`reason`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_parent_id_foreign` (`parent_id`),
  ADD KEY `menu_items_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_sender_id_foreign` (`sender_id`),
  ADD KEY `messages_conversation_id_created_at_index` (`conversation_id`,`created_at`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_txn_reg` (`registration_id`),
  ADD KEY `idx_txn_order` (`razorpay_order_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`);

--
-- Indexes for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `push_subscriptions_subscribable_endpoint_unique` (`subscribable_type`,`subscribable_id`,`endpoint`) USING HASH,
  ADD KEY `push_subscriptions_subscribable_type_subscribable_id_index` (`subscribable_type`,`subscribable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_role_name_unique` (`role_name`),
  ADD UNIQUE KEY `roles_role_code_unique` (`role_code`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_permissions_role_id_permission_id_unique` (`role_id`,`permission_id`),
  ADD KEY `role_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_accounts_created_by_foreign` (`created_by`);

--
-- Indexes for table `social_media_stats`
--
ALTER TABLE `social_media_stats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_media_stats_social_account_id_stat_date_unique` (`social_account_id`,`stat_date`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_email_unique` (`email`),
  ADD UNIQUE KEY `students_phone_number_unique` (`phone_number`),
  ADD UNIQUE KEY `students_external_id_unique` (`external_id`),
  ADD KEY `students_status_index` (`status`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_created_by_foreign` (`created_by`),
  ADD KEY `tasks_status_due_date_index` (`status`,`due_date`);

--
-- Indexes for table `task_assignees`
--
ALTER TABLE `task_assignees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `task_assignees_task_id_user_id_unique` (`task_id`,`user_id`),
  ADD KEY `task_assignees_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_employee_id_unique` (`employee_id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_reporting_manager_id_foreign` (`reporting_manager_id`),
  ADD KEY `users_created_by_foreign` (`created_by`),
  ADD KEY `users_updated_by_foreign` (`updated_by`),
  ADD KEY `users_department_index` (`department`),
  ADD KEY `users_role_id_index` (`role_id`),
  ADD KEY `users_employment_status_index` (`employment_status`);

--
-- Indexes for table `user_login_logs`
--
ALTER TABLE `user_login_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_login_logs_user_id_index` (`user_id`),
  ADD KEY `user_login_logs_login_time_index` (`login_time`),
  ADD KEY `user_login_logs_is_active_session_index` (`is_active_session`),
  ADD KEY `user_login_logs_session_token_index` (`session_token`),
  ADD KEY `user_login_logs_logout_by_user_id_foreign` (`logout_by_user_id`),
  ADD KEY `user_login_logs_created_by_user_id_foreign` (`created_by_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `conversation_participants`
--
ALTER TABLE `conversation_participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `course_catalog`
--
ALTER TABLE `course_catalog`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `course_inquiries`
--
ALTER TABLE `course_inquiries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course_registrations`
--
ALTER TABLE `course_registrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `lead_assignments`
--
ALTER TABLE `lead_assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `lead_conversations`
--
ALTER TABLE `lead_conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `lead_conversation_tags`
--
ALTER TABLE `lead_conversation_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lead_notifications`
--
ALTER TABLE `lead_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `lead_statuses`
--
ALTER TABLE `lead_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lead_status_history`
--
ALTER TABLE `lead_status_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `leave_balances`
--
ALTER TABLE `leave_balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lost_reasons`
--
ALTER TABLE `lost_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=900;

--
-- AUTO_INCREMENT for table `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `social_media_stats`
--
ALTER TABLE `social_media_stats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2431;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `task_assignees`
--
ALTER TABLE `task_assignees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user_login_logs`
--
ALTER TABLE `user_login_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `conversation_participants`
--
ALTER TABLE `conversation_participants`
  ADD CONSTRAINT `conversation_participants_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversation_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_inquiries`
--
ALTER TABLE `course_inquiries`
  ADD CONSTRAINT `fk_inquiry_course` FOREIGN KEY (`course_id`) REFERENCES `course_catalog` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `course_registrations`
--
ALTER TABLE `course_registrations`
  ADD CONSTRAINT `fk_reg_course` FOREIGN KEY (`course_id`) REFERENCES `course_catalog` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `holidays_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_added_by_user_id_foreign` FOREIGN KEY (`added_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leads_assigned_by_user_id_foreign` FOREIGN KEY (`assigned_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `leads_assigned_to_user_id_foreign` FOREIGN KEY (`assigned_to_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `leads_current_status_id_foreign` FOREIGN KEY (`current_status_id`) REFERENCES `lead_statuses` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `lead_assignments`
--
ALTER TABLE `lead_assignments`
  ADD CONSTRAINT `lead_assignments_assigned_by_user_id_foreign` FOREIGN KEY (`assigned_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lead_assignments_assigned_to_user_id_foreign` FOREIGN KEY (`assigned_to_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lead_assignments_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lead_conversations`
--
ALTER TABLE `lead_conversations`
  ADD CONSTRAINT `lead_conversations_handled_by_user_id_foreign` FOREIGN KEY (`handled_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lead_conversations_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lead_conversation_tags`
--
ALTER TABLE `lead_conversation_tags`
  ADD CONSTRAINT `lead_conversation_tags_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `lead_conversations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lead_notifications`
--
ALTER TABLE `lead_notifications`
  ADD CONSTRAINT `lead_notifications_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lead_notifications_notify_user_id_foreign` FOREIGN KEY (`notify_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lead_status_history`
--
ALTER TABLE `lead_status_history`
  ADD CONSTRAINT `lead_status_history_changed_by_user_id_foreign` FOREIGN KEY (`changed_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lead_status_history_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lead_status_history_lost_reason_id_foreign` FOREIGN KEY (`lost_reason_id`) REFERENCES `lost_reasons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `lead_status_history_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `lead_statuses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_balances`
--
ALTER TABLE `leave_balances`
  ADD CONSTRAINT `leave_balances_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leave_balances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `leave_requests_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leave_requests_reviewed_by_foreign` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `leave_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_items_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  ADD CONSTRAINT `fk_txn_reg` FOREIGN KEY (`registration_id`) REFERENCES `course_registrations` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD CONSTRAINT `social_accounts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `social_media_stats`
--
ALTER TABLE `social_media_stats`
  ADD CONSTRAINT `social_media_stats_social_account_id_foreign` FOREIGN KEY (`social_account_id`) REFERENCES `social_accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_assignees`
--
ALTER TABLE `task_assignees`
  ADD CONSTRAINT `task_assignees_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_assignees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_reporting_manager_id_foreign` FOREIGN KEY (`reporting_manager_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_login_logs`
--
ALTER TABLE `user_login_logs`
  ADD CONSTRAINT `user_login_logs_created_by_user_id_foreign` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_login_logs_logout_by_user_id_foreign` FOREIGN KEY (`logout_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_login_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
