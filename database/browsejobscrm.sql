-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: browsejobsbackendlaravel
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('browsejobs-cache-boost:mcp:database-schema:mysql:roles:0:0:0:0','a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:1:{s:5:\"roles\";a:5:{s:7:\"columns\";a:7:{s:2:\"id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:9:\"role_name\";a:1:{s:4:\"type\";s:12:\"varchar(100)\";}s:9:\"role_code\";a:1:{s:4:\"type\";s:11:\"varchar(50)\";}s:11:\"description\";a:1:{s:4:\"type\";s:4:\"text\";}s:9:\"is_active\";a:1:{s:4:\"type\";s:10:\"tinyint(1)\";}s:10:\"created_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}s:10:\"updated_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}}s:7:\"indexes\";a:3:{s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}s:22:\"roles_role_code_unique\";a:4:{s:7:\"columns\";a:1:{i:0;s:9:\"role_code\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:0;}s:22:\"roles_role_name_unique\";a:4:{s:7:\"columns\";a:1:{i:0;s:9:\"role_name\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:0;}}s:12:\"foreign_keys\";a:0:{}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}}}',1784275184),('browsejobs-cache-caller_digital.access_token','s:459:\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJjYWxsZXItZGlnaXRhbCIsImF1ZCI6ImNhbGxlci1kaWdpdGFsLWRldi1hcGkiLCJzdWIiOiJsb2NhbF9kYWYyNGM1Ni0yNDMzLTRhNmUtOWNkNy00NTJiYzUzN2YwZjgiLCJlbWFpbCI6ImJyb3dzZWpvYnNAY2FsbGVyLmRpZ2l0YWwiLCJ0ZW5hbnRfaWQiOiIyNGJhYWI2NC1lMDA3LTQ3YjMtYTFjNi0xZTk5Nzk3M2Y2NzAiLCJ2aWFfYXBpX2tleV9pZCI6ImEzNTE1MTFhLTRlNzYtNDE1Yy1hOTJlLTNjYmZlNGQ2ZTlkMCIsImlhdCI6MTc4NDI3OTg5NCwiZXhwIjoxNzg0MzY2Mjk0fQ.AWnxhIN7dVUD4sUDsIhRlOAhQm7z-h1rx0HkngSxB9o\";',1784362693);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_recipients`
--

DROP TABLE IF EXISTS `campaign_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_recipients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) unsigned NOT NULL,
  `student_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email_status` enum('skipped','pending','sent','failed') NOT NULL DEFAULT 'skipped',
  `whatsapp_status` enum('skipped','pending','sent','failed') NOT NULL DEFAULT 'skipped',
  `error` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaign_recipients_student_id_foreign` (`student_id`),
  KEY `campaign_recipients_campaign_id_index` (`campaign_id`),
  CONSTRAINT `campaign_recipients_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `campaign_recipients_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_recipients`
--

LOCK TABLES `campaign_recipients` WRITE;
/*!40000 ALTER TABLE `campaign_recipients` DISABLE KEYS */;
INSERT INTO `campaign_recipients` VALUES (1,1,6,'Kunal Behera','princejyotiranjanbehera@gmail.com',NULL,'sent','skipped',NULL,'2026-07-16 05:48:23','2026-07-16 05:48:29'),(2,2,6,'Kunal Behera','princejyotiranjanbehera@gmail.com',NULL,'sent','skipped',NULL,'2026-07-16 05:51:52','2026-07-16 05:51:57'),(3,2,2431,'Krish Demo One','krishnabharggav+demo1@gmail.com','919000000001','sent','skipped',NULL,'2026-07-16 05:51:57','2026-07-16 05:51:59'),(4,2,2432,'Krish Demo Two','krishnabharggav+demo2@gmail.com','919000000002','sent','skipped',NULL,'2026-07-16 05:51:59','2026-07-16 05:52:01'),(5,2,2433,'Krish Demo Three','krishnabharggav+demo3@gmail.com','919000000003','sent','skipped',NULL,'2026-07-16 05:52:01','2026-07-16 05:52:03'),(6,3,6,'Kunal Behera','princejyotiranjanbehera@gmail.com',NULL,'sent','skipped',NULL,'2026-07-16 05:55:52','2026-07-16 05:55:57'),(7,3,2431,'Krish Demo One','krishnabharggav+demo1@gmail.com','919000000001','sent','skipped',NULL,'2026-07-16 05:55:57','2026-07-16 05:55:59'),(8,3,2432,'Krish Demo Two','krishnabharggav+demo2@gmail.com','919000000002','sent','skipped',NULL,'2026-07-16 05:55:59','2026-07-16 05:56:00'),(9,3,2433,'Krish Demo Three','krishnabharggav+demo3@gmail.com','919000000003','sent','skipped',NULL,'2026-07-16 05:56:00','2026-07-16 05:56:02');
/*!40000 ALTER TABLE `campaign_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `channel` enum('email','whatsapp','both') NOT NULL DEFAULT 'email',
  `audience` enum('all','active') NOT NULL DEFAULT 'active',
  `subject` varchar(255) DEFAULT NULL,
  `body` longtext NOT NULL,
  `whatsapp_template` varchar(255) DEFAULT NULL,
  `whatsapp_template_lang` varchar(255) NOT NULL DEFAULT 'en_US',
  `status` enum('draft','sending','sent','failed') NOT NULL DEFAULT 'draft',
  `total_recipients` int(10) unsigned NOT NULL DEFAULT 0,
  `sent_email` int(10) unsigned NOT NULL DEFAULT 0,
  `sent_whatsapp` int(10) unsigned NOT NULL DEFAULT 0,
  `failed_count` int(10) unsigned NOT NULL DEFAULT 0,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaigns_created_by_foreign` (`created_by`),
  KEY `campaigns_status_index` (`status`),
  CONSTRAINT `campaigns_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,'Data Engineering Masterclass – July Batch','email','active','{name}, your free Data Engineering Masterclass starts Saturday','Hi {name},\r\n\r\nOur next live Data Engineering Masterclass is happening this Saturday at 6 PM.\r\n\r\nYou\'ll get a walkthrough of the exact SQL, Python and Spark pipeline projects our current batch is building — and a live Q&A on placements.\r\n\r\n<b>Save your seat:</b> reply to this email or click the link below.\r\n\r\nSee you there,\r\nBrowseJobs Team',NULL,'en_US','sent',1,1,0,0,1,'2026-07-16 05:48:29','2026-07-16 05:44:53','2026-07-16 05:48:29'),(2,'New Data Engineering Masterclass','email','active','🚀 New Masterclass: Data Engineering with {name}','<h2>Hi {name}, something new is here! 👋</h2>\r\n<p>We\'re excited to announce our brand-new <strong>Data Engineering Masterclass</strong> — a hands-on live session covering pipelines, Spark, and real-world projects.</p>\r\n<ul>\r\n  <li>📅 <strong>Date:</strong> This Saturday, 6:00 PM IST</li>\r\n  <li>🎯 <strong>Level:</strong> Beginner to Job-Ready</li>\r\n  <li>🎁 <strong>Bonus:</strong> Free project toolkit for attendees</li>\r\n</ul>\r\n<p><a href=\"https://browsejobs.in\">Reserve your seat →</a></p>\r\n<p>See you there,<br>Team BrowseJobs</p>',NULL,'en_US','sent',4,4,0,0,1,'2026-07-16 05:52:03','2026-07-16 05:51:52','2026-07-16 05:52:03'),(3,'New Data Engineering Masterclass','email','active','🚀 New Masterclass: Data Engineering with {name}','<h2>Hi {name}, something new is here! 👋</h2>\r\n<p>We\'re excited to announce our brand-new <strong>Data Engineering Masterclass</strong> — a hands-on live session covering pipelines, Spark, and real-world projects.</p>\r\n<ul>\r\n  <li>📅 <strong>Date:</strong> This Saturday, 6:00 PM IST</li>\r\n  <li>🎯 <strong>Level:</strong> Beginner to Job-Ready</li>\r\n  <li>🎁 <strong>Bonus:</strong> Free project toolkit for attendees</li>\r\n</ul>\r\n<p><a href=\"https://browsejobs.in\">Reserve your seat →</a></p>\r\n<p>See you there,<br>Team BrowseJobs</p>',NULL,'en_US','sent',4,4,0,0,1,'2026-07-16 05:56:02','2026-07-16 05:55:52','2026-07-16 05:56:02');
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation_participants`
--

DROP TABLE IF EXISTS `conversation_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversation_participants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `last_read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `conversation_participants_conversation_id_user_id_unique` (`conversation_id`,`user_id`),
  KEY `conversation_participants_user_id_foreign` (`user_id`),
  CONSTRAINT `conversation_participants_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conversation_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_participants`
--

LOCK TABLES `conversation_participants` WRITE;
/*!40000 ALTER TABLE `conversation_participants` DISABLE KEYS */;
INSERT INTO `conversation_participants` VALUES (1,1,28,0,NULL,'2026-07-06 06:02:51','2026-07-06 06:02:51'),(2,1,3,0,NULL,'2026-07-06 06:02:51','2026-07-06 06:02:51'),(3,1,20,0,NULL,'2026-07-06 06:02:51','2026-07-06 06:02:51'),(4,1,21,1,'2026-07-06 06:16:26','2026-07-06 06:02:51','2026-07-06 06:16:26'),(5,2,21,0,'2026-07-06 06:16:25','2026-07-06 06:02:58','2026-07-06 06:16:25'),(6,2,23,0,NULL,'2026-07-06 06:02:58','2026-07-06 06:02:58'),(7,3,21,0,'2026-07-06 06:16:22','2026-07-06 06:05:08','2026-07-06 06:16:22'),(8,3,1,0,'2026-07-16 09:07:57','2026-07-06 06:05:08','2026-07-16 09:07:57'),(9,4,4,0,'2026-07-17 09:58:52','2026-07-17 07:36:38','2026-07-17 09:58:52'),(10,4,18,0,'2026-07-17 09:59:12','2026-07-17 07:36:38','2026-07-17 09:59:12'),(11,5,1,0,'2026-07-17 10:58:55','2026-07-17 10:43:06','2026-07-17 10:58:55'),(12,5,18,0,'2026-07-17 10:58:39','2026-07-17 10:43:06','2026-07-17 10:58:39');
/*!40000 ALTER TABLE `conversation_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('private','group') NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conversations_created_by_foreign` (`created_by`),
  CONSTRAINT `conversations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES (1,'group','Marketing',21,'2026-07-06 06:02:51','2026-07-06 06:02:51'),(2,'private',NULL,21,'2026-07-06 06:02:58','2026-07-06 06:03:14'),(3,'private',NULL,21,'2026-07-06 06:05:08','2026-07-06 06:10:20'),(4,'private',NULL,4,'2026-07-17 07:36:38','2026-07-17 09:59:09'),(5,'private',NULL,1,'2026-07-17 10:43:06','2026-07-17 10:57:51');
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_catalog`
--

DROP TABLE IF EXISTS `course_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_catalog` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) NOT NULL,
  `title` varchar(200) NOT NULL,
  `short_title` varchar(120) NOT NULL,
  `tagline` varchar(255) DEFAULT NULL,
  `duration` varchar(60) DEFAULT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `currency` varchar(8) NOT NULL DEFAULT 'INR',
  `emi_text` varchar(120) DEFAULT NULL,
  `status` enum('live','coming_soon') NOT NULL DEFAULT 'live',
  `is_bestseller` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_course_slug` (`slug`),
  KEY `idx_course_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_catalog`
--

LOCK TABLES `course_catalog` WRITE;
/*!40000 ALTER TABLE `course_catalog` DISABLE KEYS */;
INSERT INTO `course_catalog` VALUES (1,'data-engineering','Data Engineering Certification Program','Data Engineering','Build the pipelines companies are hiring for right now.','6 months',30000,'INR','3 × ₹10,000','live',1,1,'2026-07-15 09:17:25','2026-07-15 09:17:25'),(2,'devops','DevOps & Cloud Certification Program','DevOps & Cloud','Own the pipeline from commit to production.','6 months',30000,'INR','3 × ₹10,000','live',0,2,'2026-07-15 09:17:25','2026-07-15 09:17:25'),(3,'python-backend','Python Backend Development Program','Python Backend','Ship the APIs that run real products.','6 months',30000,'INR','3 × ₹10,000','live',0,3,'2026-07-15 09:17:25','2026-07-15 09:17:25'),(4,'data-analytics','Data Analytics Certification Program','Data Analytics','From data to decisions. Turn information into impact.','5-6 months',30000,'INR','3 × ₹10,000','live',0,4,'2026-07-15 09:17:25','2026-07-15 09:17:25'),(5,'agentic-ai','Agentic AI Certification Program','Agentic AI','Build the AI employees every company will hire next.','6 months',30000,'INR','3 × ₹10,000','coming_soon',0,5,'2026-07-15 09:17:25','2026-07-15 09:17:25'),(6,'cyber-security','Cyber Security Certification Program','Cyber Security','Defend the systems the world runs on.','6 months',30000,'INR','3 × ₹10,000','coming_soon',0,6,'2026-07-15 09:17:25','2026-07-15 09:17:25'),(7,'servicenow','ServiceNow Certification Program','ServiceNow','Master the platform enterprises run their operations on.','5-6 months',30000,'INR','3 × ₹10,000','coming_soon',0,7,'2026-07-15 09:17:25','2026-07-15 09:17:25');
/*!40000 ALTER TABLE `course_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_inquiries`
--

DROP TABLE IF EXISTS `course_inquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_inquiries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(32) NOT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_inquiry_ref` (`reference`),
  KEY `idx_inquiry_course` (`course_id`),
  KEY `idx_inquiry_status` (`status`),
  CONSTRAINT `fk_inquiry_course` FOREIGN KEY (`course_id`) REFERENCES `course_catalog` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_inquiries`
--

LOCK TABLES `course_inquiries` WRITE;
/*!40000 ALTER TABLE `course_inquiries` DISABLE KEYS */;
INSERT INTO `course_inquiries` VALUES (1,'INQ-K9AIGO',1,'data-engineering','Data Engineering Certification Program','Jyotiranjan Behera','jyotiranjanbehera013@gmail.com','9337367467','Inquire','new','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0','2026-07-15 04:21:49','2026-07-15 04:21:49'),(2,'INQ-3GRAXB',1,'data-engineering','Data Engineering Certification Program','Jyotiranjan Behera','jyotiranjanbehera013@gmail.com','9337367467','Inquery','new','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0','2026-07-15 06:36:01','2026-07-15 06:36:01'),(3,'INQ-57WD7O',1,'data-engineering','Data Engineering Certification Program','Jyotiranjan Behera','behera.jyotiranjan2018@gmail.com','9337367467','sdgafg','new','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0','2026-07-15 06:47:59','2026-07-15 06:47:59'),(4,'INQ-ON0FVW',2,'devops','DevOps & Cloud Certification Program','Jyotiranjan Behera','jyotiranjanbehera013@gmail.com','918114637479','aaa','new','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','2026-07-16 08:29:40','2026-07-16 08:29:40');
/*!40000 ALTER TABLE `course_inquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_registrations`
--

DROP TABLE IF EXISTS `course_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_registrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(32) NOT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_reg_ref` (`reference`),
  UNIQUE KEY `uq_reg_invoice` (`invoice_number`),
  KEY `idx_reg_order` (`razorpay_order_id`),
  KEY `idx_reg_status` (`payment_status`),
  KEY `idx_reg_course` (`course_id`),
  CONSTRAINT `fk_reg_course` FOREIGN KEY (`course_id`) REFERENCES `course_catalog` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_registrations`
--

LOCK TABLES `course_registrations` WRITE;
/*!40000 ALTER TABLE `course_registrations` DISABLE KEYS */;
INSERT INTO `course_registrations` VALUES (1,'BJ-260715-1398CA',1,'data-engineering','Data Engineering Certification Program','Jyoti','jyotiranjanbehera013@gmail.com','8114637479','BSC','Kenderapara',30000.00,'INR','order_TDlcEDoNOTiOA9',NULL,NULL,NULL,'created',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0',NULL,'2026-07-15 06:16:58','2026-07-15 06:16:59'),(2,'BJ-260715-680145',1,'data-engineering','Data Engineering Certification Program','Jyoti','jyotiranjanbehera013@gmail.com','8114637479','Graduation','gag',30000.00,'INR','order_TDlfmadABpzmRH',NULL,NULL,NULL,'created',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0',NULL,'2026-07-15 06:20:20','2026-07-15 06:20:20'),(3,'BJ-260715-3C8996',1,'data-engineering','Data Engineering Certification Program','Jyoti','jyotiranjanbehera013@gmail.com','8114637479','Graduation',NULL,30000.00,'INR','order_TDliJ3HuBP3zfr',NULL,NULL,NULL,'created',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0',NULL,'2026-07-15 06:22:43','2026-07-15 06:22:44'),(4,'BJ-260715-760DB6',1,'data-engineering','Data Engineering Certification Program','Jyoti','princejyotiranjanbehera@gmail.com','8114637479','Graduation','Bhubaneswar',30000.00,'INR','order_TDmDjdzc43Ysf5',NULL,NULL,NULL,'created',NULL,NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0',NULL,'2026-07-15 06:52:28','2026-07-15 06:52:29');
/*!40000 ALTER TABLE `course_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_attachments`
--

DROP TABLE IF EXISTS `email_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_attachments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email_id` bigint(20) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email_attachments_email_id_foreign` (`email_id`),
  CONSTRAINT `email_attachments_email_id_foreign` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_attachments`
--

LOCK TABLES `email_attachments` WRITE;
/*!40000 ALTER TABLE `email_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `from_email` varchar(255) NOT NULL,
  `to` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`to`)),
  `cc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`cc`)),
  `bcc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`bcc`)),
  `subject` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `status` enum('sent','failed') NOT NULL DEFAULT 'sent',
  `error` text DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emails_user_id_status_index` (`user_id`,`status`),
  CONSTRAINT `emails_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` VALUES (1,1,'jyotiranjanbehera013@gmail.com','[\"behera.jyotiranjan2018@gmail.com\"]','[]','[]','Hello World','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library in London, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset\'s Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software like Aldus PageMaker and Microsoft Word including versions of Lorem Ipsum.','sent',NULL,'2026-07-15 15:25:22','2026-07-15 15:25:22','2026-07-15 15:25:22');
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enrollments_reference_unique` (`reference`),
  KEY `enrollments_course_slug_index` (`course_slug`),
  KEY `enrollments_razorpay_order_id_index` (`razorpay_order_id`),
  KEY `enrollments_payment_status_index` (`payment_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,'BJ-ED0E98','Jyoti','jyoti@gmail.com','8114637479','Graduation','kk','data-engineering','Data Engineering Certification Program',1.00,'INR','order_TCyPdNF4xbqYf4','pay_TCyQgnWjh1JqBX','344273a893122464f53351cd03b2b73c5ec6d2fa0e411738c88478fe09fdfa1e','upi',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0','2026-07-13 11:40:29','paid','2026-07-13 11:39:03','2026-07-13 11:40:29'),(2,'BJ-81DF10','Jyoti','jyoti@gmail.com','8114637479','Graduation','iupyuip','data-engineering','Data Engineering Certification Program',30000.00,'INR',NULL,NULL,NULL,NULL,'Authentication failed','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0',NULL,'order_failed','2026-07-13 08:36:26','2026-07-13 08:36:27'),(3,'BJ-8F4C2D','Jyoti','jyoti@gmail.com','8114637479','Graduation','iupyuip','data-engineering','Data Engineering Certification Program',30000.00,'INR',NULL,NULL,NULL,NULL,'Authentication failed','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0',NULL,'order_failed','2026-07-13 08:36:29','2026-07-13 08:36:30');
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expenses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `expense_date` date NOT NULL,
  `payment_method` enum('cash','card','upi','bank_transfer','cheque','other') NOT NULL DEFAULT 'cash',
  `vendor` varchar(255) DEFAULT NULL,
  `status` enum('paid','pending','cancelled') NOT NULL DEFAULT 'paid',
  `notes` text DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expenses_created_by_foreign` (`created_by`),
  KEY `expenses_status_expense_date_index` (`status`,`expense_date`),
  CONSTRAINT `expenses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,'Max Claude','AI',9539.00,'2026-07-06','card','Krish','paid','Buy',1,'2026-07-06 13:59:36','2026-07-06 13:59:36'),(2,'Meta Ads Campaign - July','Ads',15000.00,'2026-07-02','card','Meta Platforms','paid','Lead gen campaign for July batch',1,'2026-07-06 14:02:38','2026-07-06 14:02:38'),(3,'ChatGPT Plus Subscription','AI Tools',1999.00,'2026-07-03','card','OpenAI','paid','Monthly subscription for content team',3,'2026-07-06 14:02:38','2026-07-06 14:02:38'),(4,'Office Rent - July','Rent',45000.00,'2026-07-01','bank_transfer','Landlord - Mr. Sharma','paid','Monthly office rent, HSR Layout branch',1,'2026-07-06 14:02:38','2026-07-06 14:02:38'),(5,'Google Ads Campaign','Ads',8500.00,'2026-07-04','card','Google LLC','pending','Awaiting invoice from finance',4,'2026-07-06 14:02:38','2026-07-06 14:02:38'),(6,'Canva Pro Annual Plan','Software',3999.00,'2026-06-28','upi','Canva Inc','paid','Design team annual renewal',3,'2026-07-06 14:02:38','2026-07-06 14:02:38'),(7,'Office Stationery','Office Supplies',2340.50,'2026-06-25','cash','Local Stationery Shop','paid','Pens, notebooks, printer paper',5,'2026-07-06 14:02:38','2026-07-06 14:02:38'),(8,'Electricity Bill - June','Utilities',6800.00,'2026-06-30','bank_transfer','BESCOM','paid',NULL,1,'2026-07-06 14:02:38','2026-07-06 14:02:38'),(9,'Zoom Business Plan','Software',1499.00,'2026-07-01','card','Zoom Video Communications','paid','Monthly plan for team meetings',6,'2026-07-06 14:02:38','2026-07-06 14:02:38'),(10,'Client Meeting - Travel','Travel',3200.00,'2026-07-05','cash',NULL,'pending','Cab fare for client visit, receipt pending',21,'2026-07-06 14:02:38','2026-07-06 14:02:38'),(11,'LinkedIn Ads','Ads',12000.00,'2026-06-20','card','LinkedIn Corporation','paid','B2B lead campaign',4,'2026-07-06 14:02:38','2026-07-06 14:02:38'),(12,'Notion Team Plan','Software',2500.00,'2026-06-15','upi','Notion Labs','paid','Internal documentation and wiki',3,'2026-07-06 14:02:38','2026-07-06 14:02:38'),(13,'Internet Bill - July','Utilities',1999.00,'2026-07-03','bank_transfer','ACT Fibernet','paid',NULL,1,'2026-07-06 14:02:38','2026-07-06 14:02:38'),(14,'Team Lunch - Project Kickoff','Miscellaneous',4500.00,'2026-07-06','cash','The Food Court','paid','Celebrating new client onboarding',5,'2026-07-06 14:02:38','2026-07-06 14:02:38'),(15,'Facebook Boost Post','Ads',1500.00,'2026-06-10','card','Meta Platforms','cancelled','Campaign cancelled, budget reallocated',4,'2026-07-06 14:02:38','2026-07-06 14:02:38'),(16,'AWS Hosting - July','Software',7200.00,'2026-07-04','card','Amazon Web Services','pending','Invoice awaited',1,'2026-07-06 14:02:38','2026-07-06 14:02:38');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `folder_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `disk_path` varchar(255) NOT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL DEFAULT 0,
  `drive_file_id` varchar(255) DEFAULT NULL,
  `drive_link` varchar(255) DEFAULT NULL,
  `synced` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_folder_id_foreign` (`folder_id`),
  KEY `files_user_id_folder_id_index` (`user_id`,`folder_id`),
  CONSTRAINT `files_folder_id_foreign` FOREIGN KEY (`folder_id`) REFERENCES `folders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (4,1,2,'sony.png','file-manager/G4xaBn5AUzDRqc0DusZwnTs7iAIf0aaIdlqUvFRU.png','image/png',38971,NULL,NULL,0,'2026-07-16 06:41:23','2026-07-16 06:41:23'),(5,1,NULL,'Reviews_000002.png','file-manager/wtK4PkKRL3XtRGUlV4e1XKCdjFGG3dbNYtSZoED4.png','image/png',56905,NULL,NULL,0,'2026-07-16 06:42:16','2026-07-16 06:42:16');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders`
--

DROP TABLE IF EXISTS `folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `drive_folder_id` varchar(255) DEFAULT NULL,
  `synced` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `folders_parent_id_foreign` (`parent_id`),
  KEY `folders_user_id_parent_id_index` (`user_id`,`parent_id`),
  CONSTRAINT `folders_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `folders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `folders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders`
--

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
INSERT INTO `folders` VALUES (2,1,NULL,'Kunal','1YuFH0m1374E735W39fyLanSGE-38KXCJ',1,'2026-07-16 06:41:04','2026-07-16 06:41:06');
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_accounts`
--

DROP TABLE IF EXISTS `google_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `google_email` varchar(255) DEFAULT NULL,
  `access_token` text NOT NULL,
  `refresh_token` text DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `google_accounts_user_id_unique` (`user_id`),
  CONSTRAINT `google_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_accounts`
--

LOCK TABLES `google_accounts` WRITE;
/*!40000 ALTER TABLE `google_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `google_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidays` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `holiday_date` date NOT NULL,
  `year` smallint(5) unsigned NOT NULL,
  `is_optional` tinyint(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `holidays_created_by_foreign` (`created_by`),
  KEY `holidays_year_holiday_date_index` (`year`,`holiday_date`),
  CONSTRAINT `holidays_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` VALUES (1,'Independence Day','2026-08-15',2026,0,'Independence Day',1,'2026-07-04 05:41:45','2026-07-04 05:41:45'),(2,'Varasiddhi Vinayaka Vrata (Ganesh Chaturthi)','2026-09-14',2026,0,'Varasiddhi Vinayaka Vrata (Ganesh Chaturthi)',1,'2026-07-04 05:42:24','2026-07-04 05:42:24'),(3,'Intigration','2026-07-09',2026,0,'jhgj',1,'2026-07-06 10:34:09','2026-07-06 10:34:09');
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incentive_records`
--

DROP TABLE IF EXISTS `incentive_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incentive_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `type` enum('incentive','bonus') NOT NULL DEFAULT 'incentive',
  `basis` varchar(255) DEFAULT NULL,
  `quantity` decimal(12,2) DEFAULT NULL,
  `rate` decimal(12,2) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `period_month` tinyint(3) unsigned NOT NULL,
  `period_year` smallint(5) unsigned NOT NULL,
  `status` enum('pending','approved','paid') NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `awarded_by_user_id` bigint(20) unsigned DEFAULT NULL,
  `awarded_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incentive_records_awarded_by_user_id_foreign` (`awarded_by_user_id`),
  KEY `incentive_records_user_id_type_index` (`user_id`,`type`),
  KEY `incentive_records_period_year_period_month_index` (`period_year`,`period_month`),
  CONSTRAINT `incentive_records_awarded_by_user_id_foreign` FOREIGN KEY (`awarded_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `incentive_records_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incentive_records`
--

LOCK TABLES `incentive_records` WRITE;
/*!40000 ALTER TABLE `incentive_records` DISABLE KEYS */;
INSERT INTO `incentive_records` VALUES (1,1,'incentive','opening_balance',NULL,NULL,13635.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(2,1,'bonus','opening_balance',NULL,NULL,7575.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(3,3,'incentive','opening_balance',NULL,NULL,12595.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(4,3,'bonus','opening_balance',NULL,NULL,5725.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(5,4,'incentive','opening_balance',NULL,NULL,6880.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(6,4,'bonus','opening_balance',NULL,NULL,4300.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(7,5,'incentive','opening_balance',NULL,NULL,4950.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(8,5,'bonus','opening_balance',NULL,NULL,2750.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(9,6,'incentive','opening_balance',NULL,NULL,5650.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(10,6,'bonus','opening_balance',NULL,NULL,2825.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(11,7,'incentive','opening_balance',NULL,NULL,5830.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(12,7,'bonus','opening_balance',NULL,NULL,2650.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(13,8,'incentive','opening_balance',NULL,NULL,4360.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(14,8,'bonus','opening_balance',NULL,NULL,2725.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(15,9,'incentive','opening_balance',NULL,NULL,3960.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(16,9,'bonus','opening_balance',NULL,NULL,2200.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(17,10,'incentive','opening_balance',NULL,NULL,3800.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(18,10,'bonus','opening_balance',NULL,NULL,1900.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(19,11,'incentive','opening_balance',NULL,NULL,4345.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(20,11,'bonus','opening_balance',NULL,NULL,1975.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(21,12,'incentive','opening_balance',NULL,NULL,3280.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(22,12,'bonus','opening_balance',NULL,NULL,2050.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(23,13,'incentive','opening_balance',NULL,NULL,3825.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(24,13,'bonus','opening_balance',NULL,NULL,2125.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(25,14,'incentive','opening_balance',NULL,NULL,4400.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(26,14,'bonus','opening_balance',NULL,NULL,2200.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(27,15,'incentive','opening_balance',NULL,NULL,4180.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(28,15,'bonus','opening_balance',NULL,NULL,1900.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(29,16,'incentive','opening_balance',NULL,NULL,3160.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(30,16,'bonus','opening_balance',NULL,NULL,1975.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(31,17,'incentive','opening_balance',NULL,NULL,3690.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(32,17,'bonus','opening_balance',NULL,NULL,2050.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(33,18,'incentive','opening_balance',NULL,NULL,4250.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(34,18,'bonus','opening_balance',NULL,NULL,2125.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(35,19,'incentive','opening_balance',NULL,NULL,6710.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(36,19,'bonus','opening_balance',NULL,NULL,3050.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(37,20,'incentive','opening_balance',NULL,NULL,4000.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(38,20,'bonus','opening_balance',NULL,NULL,2500.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(39,21,'incentive','opening_balance',NULL,NULL,4635.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(40,21,'bonus','opening_balance',NULL,NULL,2575.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(41,22,'incentive','opening_balance',NULL,NULL,5300.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(42,22,'bonus','opening_balance',NULL,NULL,2650.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(43,23,'incentive','opening_balance',NULL,NULL,1100.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(44,23,'bonus','opening_balance',NULL,NULL,500.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(45,24,'incentive','opening_balance',NULL,NULL,5280.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(46,24,'bonus','opening_balance',NULL,NULL,3300.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(47,25,'incentive','opening_balance',NULL,NULL,7650.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(48,25,'bonus','opening_balance',NULL,NULL,4250.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(49,26,'incentive','opening_balance',NULL,NULL,5650.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(50,26,'bonus','opening_balance',NULL,NULL,2825.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(51,27,'incentive','opening_balance',NULL,NULL,6380.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(52,27,'bonus','opening_balance',NULL,NULL,2900.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(53,28,'incentive','opening_balance',NULL,NULL,4760.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08'),(54,28,'bonus','opening_balance',NULL,NULL,2975.00,7,2026,'paid',NULL,NULL,'2026-07-17 05:27:08','2026-07-17 05:27:08','2026-07-17 05:27:08');
/*!40000 ALTER TABLE `incentive_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'default','{\"uuid\":\"0e1ebd45-3300-41b1-b29c-05bb640b79ce\",\"displayName\":\"App\\\\Jobs\\\\SendCampaignJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":3600,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendCampaignJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\SendCampaignJob\\\":1:{s:8:\\\"campaign\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\Campaign\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\",\"batchId\":null},\"createdAt\":1784180693,\"delay\":null}',0,NULL,1784180693,1784180693),(2,'default','{\"uuid\":\"46ea07c6-fe68-42b2-b691-d5b0629a90b5\",\"displayName\":\"App\\\\Jobs\\\\SendCampaignJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":3600,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendCampaignJob\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\SendCampaignJob\\\":1:{s:8:\\\"campaign\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\Campaign\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\",\"batchId\":null},\"createdAt\":1784180719,\"delay\":null}',0,NULL,1784180719,1784180719);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_assignments`
--

DROP TABLE IF EXISTS `lead_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_assignments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `assigned_to_user_id` bigint(20) unsigned NOT NULL,
  `assigned_by_user_id` bigint(20) unsigned NOT NULL,
  `assigned_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_assignments_assigned_to_user_id_foreign` (`assigned_to_user_id`),
  KEY `lead_assignments_assigned_by_user_id_foreign` (`assigned_by_user_id`),
  KEY `lead_assignments_lead_id_index` (`lead_id`),
  CONSTRAINT `lead_assignments_assigned_by_user_id_foreign` FOREIGN KEY (`assigned_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lead_assignments_assigned_to_user_id_foreign` FOREIGN KEY (`assigned_to_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lead_assignments_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_assignments`
--

LOCK TABLES `lead_assignments` WRITE;
/*!40000 ALTER TABLE `lead_assignments` DISABLE KEYS */;
INSERT INTO `lead_assignments` VALUES (1,4,9,4,'2026-06-13 05:30:00','2026-06-13 05:30:00','2026-06-13 05:30:00'),(2,5,10,4,'2026-06-14 05:30:00','2026-06-14 05:30:00','2026-06-14 05:30:00'),(3,6,11,4,'2026-06-15 05:30:00','2026-06-15 05:30:00','2026-06-15 05:30:00'),(4,7,12,4,'2026-06-16 05:30:00','2026-06-16 05:30:00','2026-06-16 05:30:00'),(5,8,13,4,'2026-06-17 05:30:00','2026-06-17 05:30:00','2026-06-17 05:30:00'),(6,9,14,4,'2026-06-18 05:30:00','2026-06-18 05:30:00','2026-06-18 05:30:00'),(7,10,15,4,'2026-06-19 05:30:00','2026-06-19 05:30:00','2026-06-19 05:30:00'),(8,11,16,4,'2026-06-20 05:30:00','2026-06-20 05:30:00','2026-06-20 05:30:00'),(9,12,17,4,'2026-06-21 05:30:00','2026-06-21 05:30:00','2026-06-21 05:30:00'),(10,13,18,4,'2026-06-22 05:30:00','2026-06-22 05:30:00','2026-06-22 05:30:00'),(11,14,9,4,'2026-06-23 05:30:00','2026-06-23 05:30:00','2026-06-23 05:30:00'),(12,15,10,4,'2026-06-24 05:30:00','2026-06-24 05:30:00','2026-06-24 05:30:00'),(13,16,11,4,'2026-06-25 05:30:00','2026-06-25 05:30:00','2026-06-25 05:30:00'),(14,17,12,4,'2026-06-26 05:30:00','2026-06-26 05:30:00','2026-06-26 05:30:00'),(15,18,13,4,'2026-06-27 05:30:00','2026-06-27 05:30:00','2026-06-27 05:30:00'),(16,19,14,4,'2026-06-28 05:30:00','2026-06-28 05:30:00','2026-06-28 05:30:00'),(17,20,15,4,'2026-06-29 05:30:00','2026-06-29 05:30:00','2026-06-29 05:30:00'),(18,21,16,4,'2026-06-30 05:30:00','2026-06-30 05:30:00','2026-06-30 05:30:00'),(19,22,17,4,'2026-07-01 05:30:00','2026-07-01 05:30:00','2026-07-01 05:30:00'),(20,25,18,4,'2026-07-17 06:17:19','2026-07-17 06:17:19','2026-07-17 06:17:19'),(21,24,18,4,'2026-07-17 06:38:08','2026-07-17 06:38:08','2026-07-17 06:38:08'),(22,24,18,4,'2026-07-17 06:38:58','2026-07-17 06:38:58','2026-07-17 06:38:58'),(23,12,18,4,'2026-07-17 06:43:04','2026-07-17 06:43:04','2026-07-17 06:43:04'),(24,18,18,4,'2026-07-17 06:45:10','2026-07-17 06:45:10','2026-07-17 06:45:10'),(25,17,18,4,'2026-07-17 06:51:46','2026-07-17 06:51:46','2026-07-17 06:51:46'),(26,23,18,4,'2026-07-17 07:02:00','2026-07-17 07:02:00','2026-07-17 07:02:00'),(27,16,18,4,'2026-07-17 07:53:52','2026-07-17 07:53:52','2026-07-17 07:53:52'),(28,19,18,4,'2026-07-17 08:08:28','2026-07-17 08:08:28','2026-07-17 08:08:28'),(29,15,18,4,'2026-07-17 09:12:38','2026-07-17 09:12:38','2026-07-17 09:12:38');
/*!40000 ALTER TABLE `lead_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_calls`
--

DROP TABLE IF EXISTS `lead_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_calls` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `type` enum('ai','manual') NOT NULL DEFAULT 'manual',
  `provider` varchar(255) DEFAULT NULL,
  `external_campaign_id` varchar(255) DEFAULT NULL,
  `external_call_id` varchar(255) DEFAULT NULL,
  `agent_id` varchar(255) DEFAULT NULL,
  `status` enum('queued','ringing','in_progress','completed','failed','no_answer','busy','cancelled') NOT NULL DEFAULT 'queued',
  `disposition` varchar(255) DEFAULT NULL,
  `sentiment` varchar(255) DEFAULT NULL,
  `transcript` longtext DEFAULT NULL,
  `recording_url` varchar(1024) DEFAULT NULL,
  `audio_path` varchar(255) DEFAULT NULL,
  `duration_seconds` int(10) unsigned DEFAULT NULL,
  `from_number` varchar(255) DEFAULT NULL,
  `to_number` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `initiated_by_user_id` bigint(20) unsigned DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `ended_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_calls_initiated_by_user_id_foreign` (`initiated_by_user_id`),
  KEY `lead_calls_lead_id_index` (`lead_id`),
  KEY `lead_calls_external_campaign_id_index` (`external_campaign_id`),
  KEY `lead_calls_external_call_id_index` (`external_call_id`),
  CONSTRAINT `lead_calls_initiated_by_user_id_foreign` FOREIGN KEY (`initiated_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `lead_calls_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_calls`
--

LOCK TABLES `lead_calls` WRITE;
/*!40000 ALTER TABLE `lead_calls` DISABLE KEYS */;
INSERT INTO `lead_calls` VALUES (1,24,'ai','caller_digital','6f97b151-bb58-4d49-a820-eb596f6bcb21',NULL,'02a5ebac-32f3-4012-b58b-3e27c26a361b','ringing',NULL,NULL,NULL,NULL,NULL,NULL,'+918044656755','8114637479','english',NULL,1,'2026-07-16 13:01:35',NULL,'2026-07-16 13:01:35','2026-07-16 13:01:39'),(2,25,'ai','caller_digital','de1beea0-c05c-4e54-8c8f-43af1ee7665d',NULL,'02a5ebac-32f3-4012-b58b-3e27c26a361b','ringing',NULL,NULL,NULL,NULL,NULL,NULL,'+918044656755','9337367467','english',NULL,1,'2026-07-16 13:25:04',NULL,'2026-07-16 13:25:04','2026-07-16 13:25:08'),(3,27,'ai','caller_digital','665535ee-7eaa-4f91-8dd9-df668b76a145',NULL,'02a5ebac-32f3-4012-b58b-3e27c26a361b','ringing',NULL,NULL,NULL,NULL,NULL,NULL,'+918044656755','8114637479','english',NULL,21,'2026-07-17 09:18:12',NULL,'2026-07-17 09:18:12','2026-07-17 09:18:16');
/*!40000 ALTER TABLE `lead_calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_conversation_tags`
--

DROP TABLE IF EXISTS `lead_conversation_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_conversation_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_conversation_tags_conversation_id_foreign` (`conversation_id`),
  KEY `lead_conversation_tags_tag_index` (`tag`),
  CONSTRAINT `lead_conversation_tags_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `lead_conversations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_conversation_tags`
--

LOCK TABLES `lead_conversation_tags` WRITE;
/*!40000 ALTER TABLE `lead_conversation_tags` DISABLE KEYS */;
INSERT INTO `lead_conversation_tags` VALUES (1,12,'price_objection','2026-06-20 07:30:00','2026-06-20 07:30:00'),(2,14,'lost_to_competitor','2026-06-21 07:30:00','2026-06-21 07:30:00'),(3,16,'no_answer','2026-06-22 07:30:00','2026-06-22 07:30:00'),(4,18,'not_interested','2026-06-23 07:30:00','2026-06-23 07:30:00'),(5,20,'timing_issue','2026-06-24 07:30:00','2026-06-24 07:30:00');
/*!40000 ALTER TABLE `lead_conversation_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_conversations`
--

DROP TABLE IF EXISTS `lead_conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_conversations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `channel` enum('call','whatsapp','email','sms') NOT NULL,
  `direction` enum('inbound','outbound') NOT NULL,
  `transcript` longtext NOT NULL,
  `duration_seconds` int(10) unsigned DEFAULT NULL,
  `recording_url` varchar(255) DEFAULT NULL,
  `handled_by_user_id` bigint(20) unsigned NOT NULL,
  `occurred_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_conversations_handled_by_user_id_foreign` (`handled_by_user_id`),
  KEY `lead_conversations_lead_id_occurred_at_index` (`lead_id`,`occurred_at`),
  KEY `lead_conversations_channel_index` (`channel`),
  CONSTRAINT `lead_conversations_handled_by_user_id_foreign` FOREIGN KEY (`handled_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lead_conversations_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_conversations`
--

LOCK TABLES `lead_conversations` WRITE;
/*!40000 ALTER TABLE `lead_conversations` DISABLE KEYS */;
INSERT INTO `lead_conversations` VALUES (1,4,'call','outbound','HR: Hi, this is regarding your enquiry from Meta Ads. Are you still interested?\nLead: Yes, tell me more about the offer.',194,NULL,9,'2026-06-13 07:30:00','2026-06-13 07:30:00','2026-06-13 07:30:00'),(2,4,'call','outbound','HR: Great news, we can get you started right away. Shall I proceed with enrollment?\nLead: Yes, please go ahead.',110,NULL,9,'2026-06-15 07:30:00','2026-06-15 07:30:00','2026-06-15 07:30:00'),(3,5,'call','outbound','HR: Hi, this is regarding your enquiry from Google Ads. Are you still interested?\nLead: Yes, tell me more about the offer.',99,NULL,10,'2026-06-14 07:30:00','2026-06-14 07:30:00','2026-06-14 07:30:00'),(4,5,'call','outbound','HR: Great news, we can get you started right away. Shall I proceed with enrollment?\nLead: Yes, please go ahead.',384,NULL,10,'2026-06-16 07:30:00','2026-06-16 07:30:00','2026-06-16 07:30:00'),(5,6,'call','outbound','HR: Hi, this is regarding your enquiry from Meta Ads. Are you still interested?\nLead: Yes, tell me more about the offer.',296,NULL,11,'2026-06-15 07:30:00','2026-06-15 07:30:00','2026-06-15 07:30:00'),(6,6,'call','outbound','HR: Great news, we can get you started right away. Shall I proceed with enrollment?\nLead: Yes, please go ahead.',128,NULL,11,'2026-06-17 07:30:00','2026-06-17 07:30:00','2026-06-17 07:30:00'),(7,7,'call','outbound','HR: Hi, this is regarding your enquiry from Website. Are you still interested?\nLead: Yes, tell me more about the offer.',276,NULL,12,'2026-06-16 07:30:00','2026-06-16 07:30:00','2026-06-16 07:30:00'),(8,7,'call','outbound','HR: Great news, we can get you started right away. Shall I proceed with enrollment?\nLead: Yes, please go ahead.',254,NULL,12,'2026-06-18 07:30:00','2026-06-18 07:30:00','2026-06-18 07:30:00'),(9,8,'call','outbound','HR: Hi, this is regarding your enquiry from Google Ads. Are you still interested?\nLead: Yes, tell me more about the offer.',134,NULL,13,'2026-06-17 07:30:00','2026-06-17 07:30:00','2026-06-17 07:30:00'),(10,8,'call','outbound','HR: Great news, we can get you started right away. Shall I proceed with enrollment?\nLead: Yes, please go ahead.',234,NULL,13,'2026-06-19 07:30:00','2026-06-19 07:30:00','2026-06-19 07:30:00'),(11,9,'call','outbound','HR: Hi, this is regarding your enquiry from Meta Ads. Are you still interested?\nLead: Yes, tell me more about the offer.',252,NULL,14,'2026-06-18 07:30:00','2026-06-18 07:30:00','2026-06-18 07:30:00'),(12,9,'call','outbound','HR: Just checking in again, are you looking to move forward?\nLead: Price too high',237,NULL,14,'2026-06-20 07:30:00','2026-06-20 07:30:00','2026-06-20 07:30:00'),(13,10,'call','outbound','HR: Hi, this is regarding your enquiry from Google Ads. Are you still interested?\nLead: Yes, tell me more about the offer.',119,NULL,15,'2026-06-19 07:30:00','2026-06-19 07:30:00','2026-06-19 07:30:00'),(14,10,'call','outbound','HR: Just checking in again, are you looking to move forward?\nLead: Joined a competitor',160,NULL,15,'2026-06-21 07:30:00','2026-06-21 07:30:00','2026-06-21 07:30:00'),(15,11,'call','outbound','HR: Hi, this is regarding your enquiry from Meta Ads. Are you still interested?\nLead: Yes, tell me more about the offer.',151,NULL,16,'2026-06-20 07:30:00','2026-06-20 07:30:00','2026-06-20 07:30:00'),(16,11,'call','outbound','HR: Just checking in again, are you looking to move forward?\nLead: No response after follow-ups',234,NULL,16,'2026-06-22 07:30:00','2026-06-22 07:30:00','2026-06-22 07:30:00'),(17,12,'call','outbound','HR: Hi, this is regarding your enquiry from Website. Are you still interested?\nLead: Yes, tell me more about the offer.',259,NULL,17,'2026-06-21 07:30:00','2026-06-21 07:30:00','2026-06-21 07:30:00'),(18,12,'call','outbound','HR: Just checking in again, are you looking to move forward?\nLead: Not interested in offer',348,NULL,17,'2026-06-23 07:30:00','2026-06-23 07:30:00','2026-06-23 07:30:00'),(19,13,'call','outbound','HR: Hi, this is regarding your enquiry from Google Ads. Are you still interested?\nLead: Yes, tell me more about the offer.',156,NULL,18,'2026-06-22 07:30:00','2026-06-22 07:30:00','2026-06-22 07:30:00'),(20,13,'call','outbound','HR: Just checking in again, are you looking to move forward?\nLead: Location / timing not suitable',396,NULL,18,'2026-06-24 07:30:00','2026-06-24 07:30:00','2026-06-24 07:30:00'),(21,14,'call','outbound','HR: Hi, this is regarding your enquiry from Meta Ads. Are you still interested?\nLead: Yes, tell me more about the offer.',256,NULL,9,'2026-06-23 07:30:00','2026-06-23 07:30:00','2026-06-23 07:30:00'),(22,14,'whatsapp','outbound','HR: Hi, just following up on our call. Do you have any questions about the plan?\nLead: I need a bit more time to decide.',NULL,NULL,9,'2026-06-24 07:30:00','2026-06-24 07:30:00','2026-06-24 07:30:00'),(23,15,'call','outbound','HR: Hi, this is regarding your enquiry from Google Ads. Are you still interested?\nLead: Yes, tell me more about the offer.',128,NULL,10,'2026-06-24 07:30:00','2026-06-24 07:30:00','2026-06-24 07:30:00'),(24,15,'whatsapp','outbound','HR: Hi, just following up on our call. Do you have any questions about the plan?\nLead: I need a bit more time to decide.',NULL,NULL,10,'2026-06-25 07:30:00','2026-06-25 07:30:00','2026-06-25 07:30:00'),(25,16,'call','outbound','HR: Hi, this is regarding your enquiry from Website. Are you still interested?\nLead: Yes, tell me more about the offer.',292,NULL,11,'2026-06-25 07:30:00','2026-06-25 07:30:00','2026-06-25 07:30:00'),(26,16,'whatsapp','outbound','HR: Hi, just following up on our call. Do you have any questions about the plan?\nLead: I need a bit more time to decide.',NULL,NULL,11,'2026-06-26 07:30:00','2026-06-26 07:30:00','2026-06-26 07:30:00'),(27,17,'call','outbound','HR: Hi, this is regarding your enquiry from Meta Ads. Are you still interested?\nLead: Yes, tell me more about the offer.',63,NULL,12,'2026-06-26 07:30:00','2026-06-26 07:30:00','2026-06-26 07:30:00'),(28,17,'whatsapp','outbound','HR: Hi, just following up on our call. Do you have any questions about the plan?\nLead: I need a bit more time to decide.',NULL,NULL,12,'2026-06-27 07:30:00','2026-06-27 07:30:00','2026-06-27 07:30:00'),(29,18,'call','outbound','HR: Hi, this is regarding your enquiry from Google Ads. Are you still interested?\nLead: Yes, tell me more about the offer.',249,NULL,13,'2026-06-27 07:30:00','2026-06-27 07:30:00','2026-06-27 07:30:00'),(30,18,'whatsapp','outbound','HR: Hi, just following up on our call. Do you have any questions about the plan?\nLead: I need a bit more time to decide.',NULL,NULL,13,'2026-06-28 07:30:00','2026-06-28 07:30:00','2026-06-28 07:30:00'),(31,19,'call','outbound','HR: Hi, this is regarding your enquiry from Meta Ads. Are you still interested?\nLead: Yes, tell me more about the offer.',133,NULL,14,'2026-06-28 07:30:00','2026-06-28 07:30:00','2026-06-28 07:30:00'),(32,19,'whatsapp','outbound','HR: Hi, just following up on our call. Do you have any questions about the plan?\nLead: I need a bit more time to decide.',NULL,NULL,14,'2026-06-29 07:30:00','2026-06-29 07:30:00','2026-06-29 07:30:00'),(33,20,'call','outbound','HR: Hi, this is regarding your enquiry from Website. Are you still interested?\nLead: Yes, tell me more about the offer.',261,NULL,15,'2026-06-29 07:30:00','2026-06-29 07:30:00','2026-06-29 07:30:00'),(34,20,'whatsapp','outbound','HR: Hi, just following up on our call. Do you have any questions about the plan?\nLead: I need a bit more time to decide.',NULL,NULL,15,'2026-06-30 07:30:00','2026-06-30 07:30:00','2026-06-30 07:30:00'),(35,21,'call','outbound','HR: Hi, this is regarding your enquiry from Google Ads. Are you still interested?\nLead: [Number unreachable / switched off]',0,NULL,16,'2026-06-30 07:30:00','2026-06-30 07:30:00','2026-06-30 07:30:00'),(36,22,'call','outbound','HR: Hi, this is regarding your enquiry from Meta Ads. Are you still interested?\nLead: [Number unreachable / switched off]',0,NULL,17,'2026-07-01 07:30:00','2026-07-01 07:30:00','2026-07-01 07:30:00');
/*!40000 ALTER TABLE `lead_conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_notifications`
--

DROP TABLE IF EXISTS `lead_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `notify_user_id` bigint(20) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `channel` varchar(255) NOT NULL DEFAULT 'system',
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_notifications_lead_id_foreign` (`lead_id`),
  KEY `lead_notifications_notify_user_id_is_read_index` (`notify_user_id`,`is_read`),
  CONSTRAINT `lead_notifications_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lead_notifications_notify_user_id_foreign` FOREIGN KEY (`notify_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_notifications`
--

LOCK TABLES `lead_notifications` WRITE;
/*!40000 ALTER TABLE `lead_notifications` DISABLE KEYS */;
INSERT INTO `lead_notifications` VALUES (1,4,4,'lead_created','whatsapp',1,'2026-06-13 04:30:00','2026-06-13 04:30:00','2026-06-13 04:30:00'),(2,4,9,'lead_assigned','whatsapp',1,'2026-06-13 05:30:00','2026-06-13 05:30:00','2026-06-13 05:30:00'),(3,5,4,'lead_created','whatsapp',1,'2026-06-14 04:30:00','2026-06-14 04:30:00','2026-06-14 04:30:00'),(4,5,10,'lead_assigned','whatsapp',1,'2026-06-14 05:30:00','2026-06-14 05:30:00','2026-06-14 05:30:00'),(5,6,4,'lead_created','whatsapp',1,'2026-06-15 04:30:00','2026-06-15 04:30:00','2026-06-15 04:30:00'),(6,6,11,'lead_assigned','whatsapp',1,'2026-06-15 05:30:00','2026-06-15 05:30:00','2026-06-15 05:30:00'),(7,7,4,'lead_created','whatsapp',1,'2026-06-16 04:30:00','2026-06-16 04:30:00','2026-06-16 04:30:00'),(8,7,12,'lead_assigned','whatsapp',1,'2026-06-16 05:30:00','2026-06-16 05:30:00','2026-06-16 05:30:00'),(9,8,4,'lead_created','whatsapp',1,'2026-06-17 04:30:00','2026-06-17 04:30:00','2026-06-17 04:30:00'),(10,8,13,'lead_assigned','whatsapp',1,'2026-06-17 05:30:00','2026-06-17 05:30:00','2026-06-17 05:30:00'),(11,9,4,'lead_created','whatsapp',1,'2026-06-18 04:30:00','2026-06-18 04:30:00','2026-06-18 04:30:00'),(12,9,14,'lead_assigned','whatsapp',1,'2026-06-18 05:30:00','2026-06-18 05:30:00','2026-06-18 05:30:00'),(13,10,4,'lead_created','whatsapp',1,'2026-06-19 04:30:00','2026-06-19 04:30:00','2026-06-19 04:30:00'),(14,10,15,'lead_assigned','whatsapp',1,'2026-06-19 05:30:00','2026-06-19 05:30:00','2026-06-19 05:30:00'),(15,11,4,'lead_created','whatsapp',1,'2026-06-20 04:30:00','2026-06-20 04:30:00','2026-06-20 04:30:00'),(16,11,16,'lead_assigned','whatsapp',1,'2026-06-20 05:30:00','2026-06-20 05:30:00','2026-06-20 05:30:00'),(17,12,4,'lead_created','whatsapp',1,'2026-06-21 04:30:00','2026-06-21 04:30:00','2026-06-21 04:30:00'),(18,12,17,'lead_assigned','whatsapp',1,'2026-06-21 05:30:00','2026-06-21 05:30:00','2026-06-21 05:30:00'),(19,13,4,'lead_created','whatsapp',1,'2026-06-22 04:30:00','2026-06-22 04:30:00','2026-06-22 04:30:00'),(20,13,18,'lead_assigned','whatsapp',1,'2026-06-22 05:30:00','2026-06-22 05:30:00','2026-06-22 05:30:00'),(21,14,4,'lead_created','whatsapp',1,'2026-06-23 04:30:00','2026-06-23 04:30:00','2026-06-23 04:30:00'),(22,14,9,'lead_assigned','whatsapp',1,'2026-06-23 05:30:00','2026-06-23 05:30:00','2026-06-23 05:30:00'),(23,15,4,'lead_created','whatsapp',1,'2026-06-24 04:30:00','2026-06-24 04:30:00','2026-06-24 04:30:00'),(24,15,10,'lead_assigned','whatsapp',1,'2026-06-24 05:30:00','2026-06-24 05:30:00','2026-06-24 05:30:00'),(25,16,4,'lead_created','whatsapp',1,'2026-06-25 04:30:00','2026-06-25 04:30:00','2026-06-25 04:30:00'),(26,16,11,'lead_assigned','whatsapp',1,'2026-06-25 05:30:00','2026-06-25 05:30:00','2026-06-25 05:30:00'),(27,17,4,'lead_created','whatsapp',1,'2026-06-26 04:30:00','2026-06-26 04:30:00','2026-06-26 04:30:00'),(28,17,12,'lead_assigned','whatsapp',1,'2026-06-26 05:30:00','2026-06-26 05:30:00','2026-06-26 05:30:00'),(29,18,4,'lead_created','whatsapp',1,'2026-06-27 04:30:00','2026-06-27 04:30:00','2026-06-27 04:30:00'),(30,18,13,'lead_assigned','whatsapp',1,'2026-06-27 05:30:00','2026-06-27 05:30:00','2026-06-27 05:30:00'),(31,19,4,'lead_created','whatsapp',1,'2026-06-28 04:30:00','2026-06-28 04:30:00','2026-06-28 04:30:00'),(32,19,14,'lead_assigned','whatsapp',1,'2026-06-28 05:30:00','2026-06-28 05:30:00','2026-06-28 05:30:00'),(33,20,4,'lead_created','whatsapp',1,'2026-06-29 04:30:00','2026-06-29 04:30:00','2026-06-29 04:30:00'),(34,20,15,'lead_assigned','whatsapp',1,'2026-06-29 05:30:00','2026-06-29 05:30:00','2026-06-29 05:30:00'),(35,21,4,'lead_created','whatsapp',1,'2026-06-30 04:30:00','2026-06-30 04:30:00','2026-06-30 04:30:00'),(36,21,16,'lead_assigned','whatsapp',1,'2026-06-30 05:30:00','2026-06-30 05:30:00','2026-06-30 05:30:00'),(37,22,4,'lead_created','whatsapp',1,'2026-07-01 04:30:00','2026-07-01 04:30:00','2026-07-01 04:30:00'),(38,22,17,'lead_assigned','whatsapp',1,'2026-07-01 05:30:00','2026-07-01 05:30:00','2026-07-01 05:30:00'),(39,23,4,'lead_created','whatsapp',1,'2026-07-02 04:30:00','2026-07-02 04:30:00','2026-07-02 04:30:00'),(40,24,3,'lead_created','email',0,'2026-07-16 12:25:06','2026-07-16 12:25:06','2026-07-16 12:25:06'),(41,24,4,'lead_created','email',0,'2026-07-16 12:25:08','2026-07-16 12:25:08','2026-07-16 12:25:08'),(42,24,1,'lead_created','email',0,'2026-07-16 12:25:10','2026-07-16 12:25:10','2026-07-16 12:25:10'),(43,25,3,'lead_created','email',0,'2026-07-16 13:25:00','2026-07-16 13:25:00','2026-07-16 13:25:00'),(44,25,4,'lead_created','email',0,'2026-07-16 13:25:02','2026-07-16 13:25:02','2026-07-16 13:25:02'),(45,25,1,'lead_created','email',0,'2026-07-16 13:25:04','2026-07-16 13:25:04','2026-07-16 13:25:04'),(49,27,3,'lead_created','email',0,'2026-07-17 09:18:06','2026-07-17 09:18:06','2026-07-17 09:18:06'),(50,27,4,'lead_created','email',0,'2026-07-17 09:18:09','2026-07-17 09:18:09','2026-07-17 09:18:09'),(51,27,1,'lead_created','email',0,'2026-07-17 09:18:11','2026-07-17 09:18:11','2026-07-17 09:18:11');
/*!40000 ALTER TABLE `lead_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_status_history`
--

DROP TABLE IF EXISTS `lead_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_status_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) unsigned NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `lost_reason_id` bigint(20) unsigned DEFAULT NULL,
  `changed_by_user_id` bigint(20) unsigned DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_status_history_status_id_foreign` (`status_id`),
  KEY `lead_status_history_lost_reason_id_foreign` (`lost_reason_id`),
  KEY `lead_status_history_changed_by_user_id_foreign` (`changed_by_user_id`),
  KEY `lead_status_history_lead_id_created_at_index` (`lead_id`,`created_at`),
  CONSTRAINT `lead_status_history_changed_by_user_id_foreign` FOREIGN KEY (`changed_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lead_status_history_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lead_status_history_lost_reason_id_foreign` FOREIGN KEY (`lost_reason_id`) REFERENCES `lost_reasons` (`id`) ON DELETE SET NULL,
  CONSTRAINT `lead_status_history_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `lead_statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_status_history`
--

LOCK TABLES `lead_status_history` WRITE;
/*!40000 ALTER TABLE `lead_status_history` DISABLE KEYS */;
INSERT INTO `lead_status_history` VALUES (1,4,1,NULL,4,'Lead assigned to HR Executive.','2026-06-13 05:30:00','2026-06-13 05:30:00'),(2,4,2,NULL,9,'Lead responded positively on first call.','2026-06-13 07:40:00','2026-06-13 07:40:00'),(3,4,6,NULL,9,'Lead confirmed and enrolled.','2026-06-15 07:35:00','2026-06-15 07:35:00'),(4,5,1,NULL,4,'Lead assigned to HR Executive.','2026-06-14 05:30:00','2026-06-14 05:30:00'),(5,5,2,NULL,10,'Lead responded positively on first call.','2026-06-14 07:40:00','2026-06-14 07:40:00'),(6,5,6,NULL,10,'Lead confirmed and enrolled.','2026-06-16 07:35:00','2026-06-16 07:35:00'),(7,6,1,NULL,4,'Lead assigned to HR Executive.','2026-06-15 05:30:00','2026-06-15 05:30:00'),(8,6,2,NULL,11,'Lead responded positively on first call.','2026-06-15 07:40:00','2026-06-15 07:40:00'),(9,6,6,NULL,11,'Lead confirmed and enrolled.','2026-06-17 07:35:00','2026-06-17 07:35:00'),(10,7,1,NULL,4,'Lead assigned to HR Executive.','2026-06-16 05:30:00','2026-06-16 05:30:00'),(11,7,2,NULL,12,'Lead responded positively on first call.','2026-06-16 07:40:00','2026-06-16 07:40:00'),(12,7,6,NULL,12,'Lead confirmed and enrolled.','2026-06-18 07:35:00','2026-06-18 07:35:00'),(13,8,1,NULL,4,'Lead assigned to HR Executive.','2026-06-17 05:30:00','2026-06-17 05:30:00'),(14,8,2,NULL,13,'Lead responded positively on first call.','2026-06-17 07:40:00','2026-06-17 07:40:00'),(15,8,6,NULL,13,'Lead confirmed and enrolled.','2026-06-19 07:35:00','2026-06-19 07:35:00'),(16,9,1,NULL,4,'Lead assigned to HR Executive.','2026-06-18 05:30:00','2026-06-18 05:30:00'),(17,9,2,NULL,14,'Lead responded positively on first call.','2026-06-18 07:40:00','2026-06-18 07:40:00'),(18,9,7,1,14,'Lead marked as lost: Price too high','2026-06-20 07:35:00','2026-06-20 07:35:00'),(19,10,1,NULL,4,'Lead assigned to HR Executive.','2026-06-19 05:30:00','2026-06-19 05:30:00'),(20,10,2,NULL,15,'Lead responded positively on first call.','2026-06-19 07:40:00','2026-06-19 07:40:00'),(21,10,7,2,15,'Lead marked as lost: Joined a competitor','2026-06-21 07:35:00','2026-06-21 07:35:00'),(22,11,1,NULL,4,'Lead assigned to HR Executive.','2026-06-20 05:30:00','2026-06-20 05:30:00'),(23,11,2,NULL,16,'Lead responded positively on first call.','2026-06-20 07:40:00','2026-06-20 07:40:00'),(24,11,7,3,16,'Lead marked as lost: No response after follow-ups','2026-06-22 07:35:00','2026-06-22 07:35:00'),(25,12,1,NULL,4,'Lead assigned to HR Executive.','2026-06-21 05:30:00','2026-06-21 05:30:00'),(26,12,2,NULL,17,'Lead responded positively on first call.','2026-06-21 07:40:00','2026-06-21 07:40:00'),(27,12,7,5,17,'Lead marked as lost: Not interested in offer','2026-06-23 07:35:00','2026-06-23 07:35:00'),(28,13,1,NULL,4,'Lead assigned to HR Executive.','2026-06-22 05:30:00','2026-06-22 05:30:00'),(29,13,2,NULL,18,'Lead responded positively on first call.','2026-06-22 07:40:00','2026-06-22 07:40:00'),(30,13,7,6,18,'Lead marked as lost: Location / timing not suitable','2026-06-24 07:35:00','2026-06-24 07:35:00'),(31,14,1,NULL,4,'Lead assigned to HR Executive.','2026-06-23 05:30:00','2026-06-23 05:30:00'),(32,14,2,NULL,9,'Lead responded positively on first call.','2026-06-23 07:40:00','2026-06-23 07:40:00'),(33,14,3,NULL,9,'Lead asked for more time, scheduled follow-up.','2026-06-24 07:35:00','2026-06-24 07:35:00'),(34,15,1,NULL,4,'Lead assigned to HR Executive.','2026-06-24 05:30:00','2026-06-24 05:30:00'),(35,15,2,NULL,10,'Lead responded positively on first call.','2026-06-24 07:40:00','2026-06-24 07:40:00'),(36,15,3,NULL,10,'Lead asked for more time, scheduled follow-up.','2026-06-25 07:35:00','2026-06-25 07:35:00'),(37,16,1,NULL,4,'Lead assigned to HR Executive.','2026-06-25 05:30:00','2026-06-25 05:30:00'),(38,16,2,NULL,11,'Lead responded positively on first call.','2026-06-25 07:40:00','2026-06-25 07:40:00'),(39,16,3,NULL,11,'Lead asked for more time, scheduled follow-up.','2026-06-26 07:35:00','2026-06-26 07:35:00'),(40,17,1,NULL,4,'Lead assigned to HR Executive.','2026-06-26 05:30:00','2026-06-26 05:30:00'),(41,17,2,NULL,12,'Lead responded positively on first call.','2026-06-26 07:40:00','2026-06-26 07:40:00'),(42,17,3,NULL,12,'Lead asked for more time, scheduled follow-up.','2026-06-27 07:35:00','2026-06-27 07:35:00'),(43,18,1,NULL,4,'Lead assigned to HR Executive.','2026-06-27 05:30:00','2026-06-27 05:30:00'),(44,18,2,NULL,13,'Lead responded positively on first call.','2026-06-27 07:40:00','2026-06-27 07:40:00'),(45,19,1,NULL,4,'Lead assigned to HR Executive.','2026-06-28 05:30:00','2026-06-28 05:30:00'),(46,19,2,NULL,14,'Lead responded positively on first call.','2026-06-28 07:40:00','2026-06-28 07:40:00'),(47,20,1,NULL,4,'Lead assigned to HR Executive.','2026-06-29 05:30:00','2026-06-29 05:30:00'),(48,20,2,NULL,15,'Lead responded positively on first call.','2026-06-29 07:40:00','2026-06-29 07:40:00'),(49,21,1,NULL,4,'Lead assigned to HR Executive.','2026-06-30 05:30:00','2026-06-30 05:30:00'),(50,21,5,NULL,16,'Number unreachable after multiple attempts.','2026-06-30 07:35:00','2026-06-30 07:35:00'),(51,22,1,NULL,4,'Lead assigned to HR Executive.','2026-07-01 05:30:00','2026-07-01 05:30:00'),(52,22,5,NULL,17,'Number unreachable after multiple attempts.','2026-07-01 07:35:00','2026-07-01 07:35:00');
/*!40000 ALTER TABLE `lead_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_statuses`
--

DROP TABLE IF EXISTS `lead_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lead_statuses_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_statuses`
--

LOCK TABLES `lead_statuses` WRITE;
/*!40000 ALTER TABLE `lead_statuses` DISABLE KEYS */;
INSERT INTO `lead_statuses` VALUES (1,'New','new',NULL,1,'2026-07-02 09:49:58','2026-07-02 09:49:58'),(2,'Interested','interested',NULL,2,'2026-07-02 09:49:58','2026-07-02 09:49:58'),(3,'Follow-up','follow_up',NULL,3,'2026-07-02 09:49:58','2026-07-02 09:49:58'),(4,'Not Interested','not_interested',NULL,4,'2026-07-02 09:49:58','2026-07-02 09:49:58'),(5,'Invalid Number','invalid_number',NULL,5,'2026-07-02 09:49:58','2026-07-02 09:49:58'),(6,'Joined','joined',NULL,6,'2026-07-02 09:49:58','2026-07-02 09:49:58'),(7,'Lost','lost',NULL,7,'2026-07-02 09:49:58','2026-07-02 09:49:58');
/*!40000 ALTER TABLE `lead_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `campaign_name` varchar(255) DEFAULT NULL,
  `added_by_user_id` bigint(20) unsigned DEFAULT NULL,
  `current_status_id` bigint(20) unsigned DEFAULT NULL,
  `assigned_to_user_id` bigint(20) unsigned DEFAULT NULL,
  `assigned_by_user_id` bigint(20) unsigned DEFAULT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leads_added_by_user_id_foreign` (`added_by_user_id`),
  KEY `leads_assigned_to_user_id_foreign` (`assigned_to_user_id`),
  KEY `leads_assigned_by_user_id_foreign` (`assigned_by_user_id`),
  KEY `leads_mobile_index` (`mobile`),
  KEY `leads_current_status_id_assigned_to_user_id_index` (`current_status_id`,`assigned_to_user_id`),
  CONSTRAINT `leads_added_by_user_id_foreign` FOREIGN KEY (`added_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leads_assigned_by_user_id_foreign` FOREIGN KEY (`assigned_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `leads_assigned_to_user_id_foreign` FOREIGN KEY (`assigned_to_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `leads_current_status_id_foreign` FOREIGN KEY (`current_status_id`) REFERENCES `lead_statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
INSERT INTO `leads` VALUES (4,'9876500001','Rahul Sharma','rahul.sharma@example.com','Meta Ads','Diwali Offer',20,6,9,4,'2026-06-13 05:30:00','2026-06-13 04:30:00','2026-07-02 22:27:03'),(5,'9876500002','Priya Verma','priya.verma@example.com','Google Ads','Search - Brand',20,6,10,4,'2026-06-14 05:30:00','2026-06-14 04:30:00','2026-07-02 22:27:03'),(6,'9876500003','Amit Yadav','amit.yadav@example.com','Meta Ads','Summer Sale',20,6,11,4,'2026-06-15 05:30:00','2026-06-15 04:30:00','2026-07-02 22:27:03'),(7,'9876500004','Sneha Kulkarni','sneha.kulkarni@example.com','Website',NULL,20,6,12,4,'2026-06-16 05:30:00','2026-06-16 04:30:00','2026-07-02 22:27:03'),(8,'9876500005','Karan Malhotra','karan.malhotra@example.com','Google Ads','New Year Promo',20,6,13,4,'2026-06-17 05:30:00','2026-06-17 04:30:00','2026-07-02 22:27:03'),(9,'9876500006','Anjali Singh','anjali.singh@example.com','Meta Ads','Diwali Offer',20,7,14,4,'2026-06-18 05:30:00','2026-06-18 04:30:00','2026-07-02 22:27:03'),(10,'9876500007','Vikas Gupta','vikas.gupta@example.com','Google Ads','Search - Brand',20,7,15,4,'2026-06-19 05:30:00','2026-06-19 04:30:00','2026-07-02 22:27:03'),(11,'9876500008','Neha Reddy','neha.reddy@example.com','Meta Ads','Summer Sale',20,7,16,4,'2026-06-20 05:30:00','2026-06-20 04:30:00','2026-07-02 22:27:03'),(12,'9876500009','Suresh Patil','suresh.patil@example.com','Website',NULL,20,7,18,4,'2026-07-17 06:43:04','2026-06-21 04:30:00','2026-07-17 06:43:04'),(13,'9876500010','Divya Nair','divya.nair@example.com','Google Ads','New Year Promo',20,7,18,4,'2026-06-22 05:30:00','2026-06-22 04:30:00','2026-07-02 22:27:03'),(14,'9876500011','Rohit Chawla','rohit.chawla@example.com','Meta Ads','Diwali Offer',20,3,9,4,'2026-06-23 05:30:00','2026-06-23 04:30:00','2026-07-02 22:27:03'),(15,'9876500012','Pooja Iyer','pooja.iyer@example.com','Google Ads','Search - Brand',20,3,18,4,'2026-07-17 09:12:38','2026-06-24 04:30:00','2026-07-17 09:12:38'),(16,'9876500013','Manish Joshi','manish.joshi@example.com','Website',NULL,20,3,18,4,'2026-07-17 07:53:52','2026-06-25 04:30:00','2026-07-17 07:53:52'),(17,'9876500014','Kavita Desai','kavita.desai@example.com','Meta Ads','Summer Sale',20,3,18,4,'2026-07-17 06:51:46','2026-06-26 04:30:00','2026-07-17 06:51:46'),(18,'9876500015','Arjun Menon','arjun.menon@example.com','Google Ads','New Year Promo',20,2,18,4,'2026-07-17 06:45:10','2026-06-27 04:30:00','2026-07-17 06:45:10'),(19,'9876500016','Shweta Rao','shweta.rao@example.com','Meta Ads','Diwali Offer',20,2,18,4,'2026-07-17 08:08:27','2026-06-28 04:30:00','2026-07-17 08:08:27'),(20,'9876500017','Deepak Mishra','deepak.mishra@example.com','Website',NULL,20,2,15,4,'2026-06-29 05:30:00','2026-06-29 04:30:00','2026-07-02 22:27:03'),(21,'9876500018',NULL,NULL,'Google Ads','Search - Brand',20,5,16,4,'2026-06-30 05:30:00','2026-06-30 04:30:00','2026-07-02 22:27:03'),(22,'9876500019',NULL,NULL,'Meta Ads','Summer Sale',20,5,17,4,'2026-07-01 05:30:00','2026-07-01 04:30:00','2026-07-02 22:27:03'),(23,'9876500020',NULL,NULL,'Website',NULL,20,1,18,4,'2026-07-17 07:02:00','2026-07-02 04:30:00','2026-07-17 07:02:00'),(24,'8114637479','Kunal',NULL,'manual','Facebook',1,1,18,4,'2026-07-17 06:38:58','2026-07-16 12:25:01','2026-07-17 06:38:58'),(25,'9337367467','Jyotiranjan Behera','jyotiranjanbehera013@gmail.com','manual',NULL,1,1,18,4,'2026-07-17 06:17:19','2026-07-16 13:24:55','2026-07-17 06:17:19'),(27,'8114637479','Anjali',NULL,'manual',NULL,21,1,NULL,NULL,NULL,'2026-07-17 09:18:01','2026-07-17 09:18:01');
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_balances`
--

DROP TABLE IF EXISTS `leave_balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_balances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `leave_type_id` bigint(20) unsigned NOT NULL,
  `year` smallint(5) unsigned NOT NULL,
  `allocated_days` decimal(5,1) NOT NULL DEFAULT 0.0,
  `used_days` decimal(5,1) NOT NULL DEFAULT 0.0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `leave_balances_user_id_leave_type_id_year_unique` (`user_id`,`leave_type_id`,`year`),
  KEY `leave_balances_leave_type_id_foreign` (`leave_type_id`),
  CONSTRAINT `leave_balances_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leave_balances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_balances`
--

LOCK TABLES `leave_balances` WRITE;
/*!40000 ALTER TABLE `leave_balances` DISABLE KEYS */;
INSERT INTO `leave_balances` VALUES (1,1,1,2026,12.0,0.0,'2026-07-03 11:50:46','2026-07-03 11:50:46'),(2,1,3,2026,15.0,0.0,'2026-07-03 11:50:46','2026-07-03 11:50:46'),(3,1,4,2026,90.0,0.0,'2026-07-03 11:50:46','2026-07-03 11:50:46'),(4,1,5,2026,7.0,0.0,'2026-07-03 11:50:46','2026-07-03 11:50:46'),(5,1,2,2026,10.0,0.0,'2026-07-03 11:50:46','2026-07-03 11:50:46'),(6,1,6,2026,0.0,0.0,'2026-07-03 11:50:46','2026-07-03 11:50:46'),(7,3,1,2026,12.0,0.0,'2026-07-03 13:26:00','2026-07-03 13:26:00'),(8,3,3,2026,15.0,0.0,'2026-07-03 13:26:00','2026-07-03 13:26:00'),(9,3,4,2026,90.0,0.0,'2026-07-03 13:26:00','2026-07-03 13:26:00'),(10,3,5,2026,7.0,0.0,'2026-07-03 13:26:00','2026-07-03 13:26:00'),(11,3,2,2026,10.0,0.0,'2026-07-03 13:26:00','2026-07-03 13:26:00'),(12,3,6,2026,0.0,0.0,'2026-07-03 13:26:00','2026-07-03 13:26:00'),(13,21,1,2026,12.0,4.0,'2026-07-03 14:14:25','2026-07-03 14:32:46'),(14,21,3,2026,15.0,6.0,'2026-07-03 14:14:25','2026-07-04 09:47:17'),(15,21,4,2026,90.0,0.0,'2026-07-03 14:14:25','2026-07-03 14:14:25'),(16,21,5,2026,7.0,0.0,'2026-07-03 14:14:25','2026-07-03 14:14:25'),(17,21,2,2026,10.0,0.0,'2026-07-03 14:14:25','2026-07-03 14:14:25'),(18,21,6,2026,0.0,0.0,'2026-07-03 14:14:25','2026-07-03 14:14:25'),(19,19,1,2026,12.0,0.0,'2026-07-03 14:48:34','2026-07-03 14:48:34'),(20,19,3,2026,15.0,0.0,'2026-07-03 14:48:34','2026-07-03 14:48:34'),(21,19,4,2026,90.0,29.0,'2026-07-03 14:48:34','2026-07-03 14:49:18'),(22,19,5,2026,7.0,0.0,'2026-07-03 14:48:34','2026-07-03 14:48:34'),(23,19,2,2026,10.0,0.0,'2026-07-03 14:48:34','2026-07-03 14:48:34'),(24,19,6,2026,0.0,0.0,'2026-07-03 14:48:34','2026-07-03 14:48:34');
/*!40000 ALTER TABLE `leave_balances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_requests`
--

DROP TABLE IF EXISTS `leave_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `leave_type_id` bigint(20) unsigned NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `is_half_day` tinyint(1) NOT NULL DEFAULT 0,
  `total_days` decimal(5,1) NOT NULL,
  `reason` text NOT NULL,
  `status` enum('pending','approved','rejected','cancelled') NOT NULL DEFAULT 'pending',
  `applied_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reviewed_by` bigint(20) unsigned DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `review_remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_requests_leave_type_id_foreign` (`leave_type_id`),
  KEY `leave_requests_reviewed_by_foreign` (`reviewed_by`),
  KEY `leave_requests_user_id_status_index` (`user_id`,`status`),
  CONSTRAINT `leave_requests_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leave_requests_reviewed_by_foreign` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `leave_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_requests`
--

LOCK TABLES `leave_requests` WRITE;
/*!40000 ALTER TABLE `leave_requests` DISABLE KEYS */;
INSERT INTO `leave_requests` VALUES (1,1,1,'2026-07-03','2026-07-07',0,5.0,'Demo','approved','2026-07-03 11:53:54',3,'2026-07-03 11:53:42',NULL,'2026-07-03 11:52:19','2026-07-03 11:52:19'),(2,1,1,'2026-07-03','2026-07-06',0,4.0,'Test Data','rejected','2026-07-03 13:12:51',3,'2026-07-03 13:12:51','Not Now','2026-07-03 13:00:56','2026-07-03 13:12:51'),(3,21,1,'2026-07-03','2026-07-06',0,4.0,'demo','approved','2026-07-03 14:32:45',1,'2026-07-03 14:32:45','ok','2026-07-03 14:14:57','2026-07-03 14:32:45'),(4,1,2,'2026-07-07','2026-07-09',0,3.0,'Test','rejected','2026-07-03 14:49:50',3,'2026-07-03 14:49:50','N','2026-07-03 14:35:15','2026-07-03 14:49:50'),(5,21,2,'2026-07-06','2026-07-10',0,5.0,'Testing','cancelled','2026-07-04 06:41:23',NULL,NULL,NULL,'2026-07-03 14:42:35','2026-07-04 06:41:23'),(6,19,4,'2026-07-01','2026-07-29',0,29.0,'TEST','approved','2026-07-03 14:49:18',1,'2026-07-03 14:49:18','KK','2026-07-03 14:48:58','2026-07-03 14:49:18'),(7,21,1,'2026-07-01','2026-07-03',0,3.0,'Testing','cancelled','2026-07-04 07:14:34',NULL,NULL,NULL,'2026-07-04 06:38:49','2026-07-04 07:14:34'),(8,21,1,'2026-07-01','2026-07-03',0,3.0,'kk','cancelled','2026-07-04 06:40:54',NULL,NULL,NULL,'2026-07-04 06:39:40','2026-07-04 06:40:54'),(9,21,1,'2026-07-01','2026-07-02',0,2.0,'Testing','pending','2026-07-04 07:15:30',NULL,NULL,NULL,'2026-07-04 07:15:30','2026-07-04 07:15:30'),(10,21,1,'2026-07-01','2026-07-03',0,3.0,'Text','pending','2026-07-04 07:22:39',NULL,NULL,NULL,'2026-07-04 07:22:39','2026-07-04 07:22:39'),(11,21,2,'2026-07-06','2026-07-08',0,3.0,'DDD','pending','2026-07-04 07:56:52',NULL,NULL,NULL,'2026-07-04 07:56:52','2026-07-04 07:56:52'),(12,21,1,'2026-07-01','2026-07-03',0,3.0,'ccc','pending','2026-07-04 07:59:01',NULL,NULL,NULL,'2026-07-04 07:59:01','2026-07-04 07:59:01'),(13,21,2,'2026-07-01','2026-07-02',0,2.0,'dd','pending','2026-07-04 08:09:14',NULL,NULL,NULL,'2026-07-04 08:09:14','2026-07-04 08:09:14'),(14,21,1,'2026-07-01','2026-07-02',0,2.0,'A','pending','2026-07-04 08:15:35',NULL,NULL,NULL,'2026-07-04 08:15:35','2026-07-04 08:15:35'),(15,21,1,'2026-07-01','2026-07-01',0,1.0,'hh','pending','2026-07-04 09:10:36',NULL,NULL,NULL,'2026-07-04 09:10:36','2026-07-04 09:10:36'),(16,21,1,'2026-07-01','2026-07-03',0,3.0,'A','pending','2026-07-04 09:12:01',NULL,NULL,NULL,'2026-07-04 09:12:01','2026-07-04 09:12:01'),(17,21,1,'2026-07-06','2026-07-07',0,2.0,'uu','pending','2026-07-04 09:29:57',NULL,NULL,NULL,'2026-07-04 09:29:57','2026-07-04 09:29:57'),(18,21,1,'2026-07-02','2026-07-03',0,2.0,'AAA','pending','2026-07-04 09:31:23',NULL,NULL,NULL,'2026-07-04 09:31:23','2026-07-04 09:31:23'),(19,21,1,'2026-07-01','2026-07-02',0,2.0,'a','pending','2026-07-04 09:35:16',NULL,NULL,NULL,'2026-07-04 09:35:16','2026-07-04 09:35:16'),(20,21,1,'2026-07-02','2026-07-03',0,2.0,'k','pending','2026-07-04 09:42:08',NULL,NULL,NULL,'2026-07-04 09:42:08','2026-07-04 09:42:08'),(21,21,3,'2026-07-02','2026-07-06',0,5.0,'Demo','pending','2026-07-04 09:42:51',NULL,NULL,NULL,'2026-07-04 09:42:51','2026-07-04 09:42:51'),(22,21,3,'2026-07-01','2026-07-06',0,6.0,'DD','approved','2026-07-04 09:47:17',3,'2026-07-04 09:47:17','Yes','2026-07-04 09:47:00','2026-07-04 09:47:17');
/*!40000 ALTER TABLE `leave_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_types`
--

DROP TABLE IF EXISTS `leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `default_days_per_year` int(10) unsigned NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `leave_types_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_types`
--

LOCK TABLES `leave_types` WRITE;
/*!40000 ALTER TABLE `leave_types` DISABLE KEYS */;
INSERT INTO `leave_types` VALUES (1,'Casual Leave','casual',12,1,'2026-07-03 11:41:47','2026-07-03 11:41:47'),(2,'Sick Leave','sick',10,1,'2026-07-03 11:41:47','2026-07-03 11:41:47'),(3,'Earned Leave','earned',15,1,'2026-07-03 11:41:47','2026-07-03 11:41:47'),(4,'Maternity Leave','maternity',90,1,'2026-07-03 11:41:47','2026-07-03 11:41:47'),(5,'Paternity Leave','paternity',7,1,'2026-07-03 11:41:47','2026-07-03 11:41:47'),(6,'Unpaid Leave','unpaid',0,1,'2026-07-03 11:41:47','2026-07-03 11:41:47');
/*!40000 ALTER TABLE `leave_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_reminders`
--

DROP TABLE IF EXISTS `login_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_reminders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `reminder_date` date NOT NULL,
  `email_count` int(10) unsigned NOT NULL DEFAULT 0,
  `whatsapp_count` int(10) unsigned NOT NULL DEFAULT 0,
  `last_reminded_at` timestamp NULL DEFAULT NULL,
  `logged_in` tinyint(1) NOT NULL DEFAULT 0,
  `escalated` tinyint(1) NOT NULL DEFAULT 0,
  `escalated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_reminders_user_id_reminder_date_unique` (`user_id`,`reminder_date`),
  KEY `login_reminders_reminder_date_index` (`reminder_date`),
  CONSTRAINT `login_reminders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_reminders`
--

LOCK TABLES `login_reminders` WRITE;
/*!40000 ALTER TABLE `login_reminders` DISABLE KEYS */;
INSERT INTO `login_reminders` VALUES (1,28,'2026-07-15',1,0,'2026-07-15 16:50:59',0,0,NULL,'2026-07-15 16:50:59','2026-07-15 16:50:59'),(2,3,'2026-07-15',1,0,'2026-07-15 16:51:00',0,0,NULL,'2026-07-15 16:51:00','2026-07-15 16:51:00'),(3,24,'2026-07-15',1,0,'2026-07-15 16:51:02',0,0,NULL,'2026-07-15 16:51:02','2026-07-15 16:51:02'),(4,20,'2026-07-15',1,0,'2026-07-15 16:51:04',0,0,NULL,'2026-07-15 16:51:04','2026-07-15 16:51:04'),(5,11,'2026-07-15',1,0,'2026-07-15 16:51:06',0,0,NULL,'2026-07-15 16:51:06','2026-07-15 16:51:06'),(6,21,'2026-07-15',1,0,'2026-07-15 16:51:08',0,0,NULL,'2026-07-15 16:51:08','2026-07-15 16:51:08'),(7,23,'2026-07-15',1,0,'2026-07-15 16:51:09',0,0,NULL,'2026-07-15 16:51:09','2026-07-15 16:51:09'),(8,10,'2026-07-15',1,0,'2026-07-15 16:51:11',0,0,NULL,'2026-07-15 16:51:11','2026-07-15 16:51:11'),(9,1,'2026-07-15',1,0,'2026-07-15 16:51:13',0,0,NULL,'2026-07-15 16:51:13','2026-07-15 16:51:13'),(10,5,'2026-07-15',1,0,'2026-07-15 16:51:14',0,0,NULL,'2026-07-15 16:51:14','2026-07-15 16:51:14'),(11,13,'2026-07-15',1,0,'2026-07-15 16:51:16',0,0,NULL,'2026-07-15 16:51:16','2026-07-15 16:51:16'),(12,15,'2026-07-15',1,0,'2026-07-15 16:51:18',0,0,NULL,'2026-07-15 16:51:18','2026-07-15 16:51:18'),(13,4,'2026-07-15',1,0,'2026-07-15 16:51:20',0,0,NULL,'2026-07-15 16:51:20','2026-07-15 16:51:20'),(14,9,'2026-07-15',1,0,'2026-07-15 16:51:22',0,0,NULL,'2026-07-15 16:51:22','2026-07-15 16:51:22'),(15,22,'2026-07-15',1,0,'2026-07-15 16:51:24',0,0,NULL,'2026-07-15 16:51:24','2026-07-15 16:51:24'),(16,7,'2026-07-15',1,0,'2026-07-15 16:51:26',0,0,NULL,'2026-07-15 16:51:26','2026-07-15 16:51:26'),(17,17,'2026-07-15',1,0,'2026-07-15 16:51:28',0,0,NULL,'2026-07-15 16:51:28','2026-07-15 16:51:28'),(18,26,'2026-07-15',1,0,'2026-07-15 16:51:30',0,0,NULL,'2026-07-15 16:51:30','2026-07-15 16:51:30'),(19,18,'2026-07-15',1,0,'2026-07-15 16:51:31',0,0,NULL,'2026-07-15 16:51:31','2026-07-15 16:51:31'),(20,16,'2026-07-15',1,0,'2026-07-15 16:51:33',0,0,NULL,'2026-07-15 16:51:33','2026-07-15 16:51:33'),(21,8,'2026-07-15',1,0,'2026-07-15 16:51:35',0,0,NULL,'2026-07-15 16:51:35','2026-07-15 16:51:35'),(22,25,'2026-07-15',1,0,'2026-07-15 16:51:37',0,0,NULL,'2026-07-15 16:51:37','2026-07-15 16:51:37'),(23,6,'2026-07-15',1,0,'2026-07-15 16:51:38',0,0,NULL,'2026-07-15 16:51:38','2026-07-15 16:51:38'),(24,14,'2026-07-15',1,0,'2026-07-15 16:51:40',0,0,NULL,'2026-07-15 16:51:40','2026-07-15 16:51:40'),(25,27,'2026-07-15',1,0,'2026-07-15 16:51:42',0,0,NULL,'2026-07-15 16:51:42','2026-07-15 16:51:42'),(26,12,'2026-07-15',1,0,'2026-07-15 16:51:44',0,0,NULL,'2026-07-15 16:51:44','2026-07-15 16:51:44');
/*!40000 ALTER TABLE `login_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lost_reasons`
--

DROP TABLE IF EXISTS `lost_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lost_reasons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lost_reasons_reason_unique` (`reason`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lost_reasons`
--

LOCK TABLES `lost_reasons` WRITE;
/*!40000 ALTER TABLE `lost_reasons` DISABLE KEYS */;
INSERT INTO `lost_reasons` VALUES (1,'Price too high','2026-07-02 09:49:58','2026-07-02 09:49:58'),(2,'Joined a competitor','2026-07-02 09:49:58','2026-07-02 09:49:58'),(3,'No response after follow-ups','2026-07-02 09:49:58','2026-07-02 09:49:58'),(4,'Wrong / invalid number','2026-07-02 09:49:58','2026-07-02 09:49:58'),(5,'Not interested in offer','2026-07-02 09:49:58','2026-07-02 09:49:58'),(6,'Location / timing not suitable','2026-07-02 09:49:58','2026-07-02 09:49:58'),(7,'Other','2026-07-02 09:49:58','2026-07-02 09:49:58');
/*!40000 ALTER TABLE `lost_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `menu_group` varchar(255) DEFAULT NULL,
  `permission_id` bigint(20) unsigned DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_parent_id_foreign` (`parent_id`),
  KEY `menu_items_permission_id_foreign` (`permission_id`),
  CONSTRAINT `menu_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_items_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,NULL,'Dashboard','ti ti-dashboard',NULL,'Main Menu',NULL,10,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(2,1,'Dashboard',NULL,'dashboard','Main Menu',1,20,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(3,1,'Leads Dashboard',NULL,'leads-dashboard','Main Menu',2,30,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(4,1,'Revenue Summary',NULL,'revenue-summary-dashboard','Main Menu',3,40,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(5,1,'Growth Dashboard',NULL,'growth-dashboard','Main Menu',4,50,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(6,NULL,'Applications','ti ti-brand-airtable',NULL,'Main Menu',NULL,60,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(7,6,'Chat',NULL,'chat','Main Menu',5,70,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(8,6,'Social Feed',NULL,NULL,'Main Menu',NULL,80,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(9,8,'Instagram',NULL,'social-accounts/instagram','Main Menu',6,90,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(10,8,'LinkedIn',NULL,'social-accounts/linkedin','Main Menu',7,100,1,'2026-07-03 09:28:00','2026-07-16 06:29:53'),(11,8,'Youtube',NULL,'social-accounts/youtube','Main Menu',8,110,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(12,6,'Calendar',NULL,'calendar','Main Menu',9,120,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(13,NULL,'Email','ti ti-mail','email','Workspace',NULL,40,1,'2026-07-15 14:27:17','2026-07-16 15:36:14'),(14,6,'To Do',NULL,'todo','Main Menu',11,140,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(15,NULL,'Notes','ti ti-notes','notes','Workspace',NULL,42,1,'2026-07-15 14:27:17','2026-07-16 15:36:14'),(16,NULL,'File Manager','ti ti-folders','file-manager','Workspace',NULL,43,1,'2026-07-15 14:27:17','2026-07-16 15:36:14'),(17,NULL,'Leads','ti ti-chart-arcs','leads','CRM',14,10,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(18,NULL,'Payments','ti ti-report-money','expenses','CRM',15,20,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(19,NULL,'Analytics','ti ti-chart-bar','expenses-analytics','CRM',16,30,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(20,NULL,'Tasks','ti ti-list-check','tasks','PROJECTS',17,10,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(21,NULL,'Milestones','ti ti-stack-2','milestones','PROJECTS',18,20,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(23,NULL,'Campaigns','ti ti-brand-campaignmonitor',NULL,'MARKETING',NULL,10,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(24,23,'Campaigns',NULL,'campaign','MARKETING',20,20,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(25,23,'Email Campaigns',NULL,'email-campaign','MARKETING',21,30,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(26,23,'SMS Campaigns',NULL,'sms-campaign','MARKETING',22,40,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(27,23,'Social Campaigns',NULL,'social-campaign','MARKETING',23,50,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(28,23,'WhatsApp Campaigns',NULL,'whatsapp-campaign','MARKETING',24,60,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(30,NULL,'Email Engagement','ti ti-mail-dollar','email-engagement','MARKETING',26,80,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(31,NULL,'Manage Users','ti ti-users','manage-users','User Management',27,10,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(32,NULL,'Roles & Permissions','ti ti-user-shield','roles-permissions','User Management',28,20,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(35,NULL,'Attendance','ti ti-article','attendance','HRM',31,10,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(36,NULL,'Leave Requests','ti ti-message-star','leave-requests','HRM',32,20,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(37,NULL,'Holidays','ti ti-stack','holidays','HRM',33,30,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(38,NULL,'Company Report','ti ti-building-estate','company-reports','Reports',34,10,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(39,NULL,'Revenue Report','ti ti-file-dollar','revenue-report','Reports',35,20,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(40,NULL,'HRM','ti ti-script',NULL,'Reports',NULL,30,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(41,40,'Attendance Summary',NULL,'attendance-summary-report','Reports',36,40,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(42,40,'Leave Balance Summary',NULL,'leave-balance-summary-report','Reports',37,50,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(43,NULL,'Pages','ti ti-page-break','pages','Content',38,10,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(44,NULL,'Blog','ti ti-brand-blogger',NULL,'Content',NULL,20,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(45,44,'All Blogs',NULL,'blogs','Content',39,30,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(46,44,'Blog Categories',NULL,'blog-categories','Content',40,40,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(47,44,'Blog Comments',NULL,'blog-comments','Content',41,50,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(48,44,'Blog Tags',NULL,'blog-tags','Content',42,60,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(49,NULL,'Location','ti ti-map-pin-pin',NULL,'Content',NULL,70,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(50,49,'Countries',NULL,'countries','Content',43,80,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(51,49,'States',NULL,'states','Content',44,90,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(52,49,'Cities',NULL,'cities','Content',45,100,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(53,NULL,'Testimonials','ti ti-quote','testimonials','Content',46,110,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(54,NULL,'FAQ','ti ti-question-mark','faq','Content',47,120,1,'2026-07-03 09:28:00','2026-07-03 09:28:00'),(55,NULL,'Student Management','ti ti-school',NULL,'Student Management',49,130,1,'2026-07-07 05:24:36','2026-07-07 05:24:36'),(56,55,'Students','ti ti-users','students','Student Management',49,10,1,'2026-07-07 05:24:36','2026-07-07 05:24:36'),(57,55,'Masterclass','ti ti-presentation','masterclasses','Student Management',50,20,1,'2026-07-07 05:24:36','2026-07-07 05:24:36'),(58,55,'Live Batches','ti ti-broadcast','live-batches','Student Management',51,30,1,'2026-07-07 05:24:36','2026-07-07 05:24:36'),(59,55,'Class Attendance','ti ti-checklist','class-attendance','Student Management',52,40,1,'2026-07-07 05:24:36','2026-07-07 05:24:36'),(60,55,'Mock Test Result','ti ti-clipboard-check','mock-test-results','Student Management',53,50,1,'2026-07-07 05:24:36','2026-07-07 05:24:36'),(61,NULL,'To Do','ti ti-checklist','todos','Workspace',NULL,41,1,'2026-07-15 14:27:17','2026-07-16 15:36:14'),(62,NULL,'Login Reminders','ti ti-bell-exclamation','login-reminders','Reports',58,31,1,'2026-07-16 06:37:50','2026-07-16 06:37:50'),(63,NULL,'Social Alerts','ti ti-bell-ringing','social-alerts','Main Menu',59,6,1,'2026-07-16 06:37:50','2026-07-16 06:37:50'),(64,8,'Social Analytics',NULL,'social-analytics','Main Menu',NULL,12,1,'2026-07-16 07:03:10','2026-07-16 07:03:10'),(65,NULL,'Office Finance','ti ti-report-money','office-finance','CRM',60,15,1,'2026-07-17 05:14:16','2026-07-17 05:14:16'),(66,NULL,'Incentives & Bonuses','ti ti-trophy','incentives','CRM',60,16,1,'2026-07-17 05:27:08','2026-07-17 05:27:08');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(20) unsigned NOT NULL,
  `sender_id` bigint(20) unsigned NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_sender_id_foreign` (`sender_id`),
  KEY `messages_conversation_id_created_at_index` (`conversation_id`,`created_at`),
  CONSTRAINT `messages_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,2,21,'Hii','2026-07-06 06:03:04','2026-07-06 06:03:04'),(2,2,21,'Hii','2026-07-06 06:03:07','2026-07-06 06:03:07'),(3,2,21,'Hi','2026-07-06 06:03:14','2026-07-06 06:03:14'),(4,3,1,'Hi','2026-07-06 06:10:08','2026-07-06 06:10:08'),(5,3,21,'Hii','2026-07-06 06:10:20','2026-07-06 06:10:20'),(6,4,4,'Hii','2026-07-17 07:37:09','2026-07-17 07:37:09'),(7,4,4,'Hii','2026-07-17 07:37:54','2026-07-17 07:37:54'),(8,4,18,'Hiii','2026-07-17 07:38:28','2026-07-17 07:38:28'),(9,4,18,'Hii','2026-07-17 07:51:15','2026-07-17 07:51:15'),(10,4,4,'Hii','2026-07-17 07:51:40','2026-07-17 07:51:40'),(11,4,4,'Hii','2026-07-17 07:52:18','2026-07-17 07:52:18'),(12,4,18,'Hii','2026-07-17 07:52:39','2026-07-17 07:52:39'),(13,4,18,'Hii priyanka','2026-07-17 07:56:13','2026-07-17 07:56:13'),(14,4,18,'Hii priyanka','2026-07-17 07:56:16','2026-07-17 07:56:16'),(15,4,18,'Hii','2026-07-17 07:56:33','2026-07-17 07:56:33'),(16,4,4,'Hii shalini','2026-07-17 08:06:37','2026-07-17 08:06:37'),(17,4,4,'Hii Shalini','2026-07-17 08:07:13','2026-07-17 08:07:13'),(18,4,18,'Hii','2026-07-17 08:07:33','2026-07-17 08:07:33'),(19,4,18,'Hii','2026-07-17 09:13:24','2026-07-17 09:13:24'),(20,4,4,'Hii','2026-07-17 09:14:35','2026-07-17 09:14:35'),(21,4,18,'hii','2026-07-17 09:15:03','2026-07-17 09:15:03'),(22,4,4,'hii','2026-07-17 09:15:18','2026-07-17 09:15:18'),(23,4,4,'Hii','2026-07-17 09:22:32','2026-07-17 09:22:32'),(24,4,4,'Hello','2026-07-17 09:29:28','2026-07-17 09:29:28'),(25,4,18,'Hii','2026-07-17 09:29:43','2026-07-17 09:29:43'),(26,4,4,'Hii','2026-07-17 09:30:12','2026-07-17 09:30:12'),(27,4,18,'Hii','2026-07-17 09:30:28','2026-07-17 09:30:28'),(28,4,4,'Hii','2026-07-17 09:32:07','2026-07-17 09:32:07'),(29,4,18,'Hii','2026-07-17 09:32:20','2026-07-17 09:32:20'),(30,4,4,'Hii','2026-07-17 09:38:53','2026-07-17 09:38:53'),(31,4,18,'Hii','2026-07-17 09:39:13','2026-07-17 09:39:13'),(32,4,4,'Hii','2026-07-17 09:48:12','2026-07-17 09:48:12'),(33,4,18,'hii','2026-07-17 09:49:37','2026-07-17 09:49:37'),(34,4,4,'hii','2026-07-17 09:50:15','2026-07-17 09:50:15'),(35,4,18,'Hii','2026-07-17 09:52:19','2026-07-17 09:52:19'),(36,4,4,'Hii','2026-07-17 09:52:32','2026-07-17 09:52:32'),(37,4,4,'HII','2026-07-17 09:53:46','2026-07-17 09:53:46'),(38,4,18,'Hii','2026-07-17 09:57:37','2026-07-17 09:57:37'),(39,4,4,'Hii','2026-07-17 09:57:57','2026-07-17 09:57:57'),(40,4,4,'Hii','2026-07-17 09:58:42','2026-07-17 09:58:42'),(41,4,4,'Hii','2026-07-17 09:58:46','2026-07-17 09:58:46'),(42,4,4,'Hii','2026-07-17 09:59:09','2026-07-17 09:59:09'),(43,5,1,'Hii','2026-07-17 10:43:14','2026-07-17 10:43:14'),(44,5,1,'Hii','2026-07-17 10:44:26','2026-07-17 10:44:26'),(45,5,1,'Hii','2026-07-17 10:45:15','2026-07-17 10:45:15'),(46,5,1,'Hii','2026-07-17 10:45:38','2026-07-17 10:45:38'),(47,5,1,'Hii','2026-07-17 10:57:37','2026-07-17 10:57:37'),(48,5,18,'Hii','2026-07-17 10:57:48','2026-07-17 10:57:48'),(49,5,18,'Hii','2026-07-17 10:57:51','2026-07-17 10:57:51');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'0001_01_01_000002_create_jobs_table',1),(3,'2026_07_02_120350_create_roles_table',2),(4,'2026_07_02_122655_create_user_login_logs_table',3),(6,'0001_01_01_000000_create_users_table',4),(7,'2026_07_02_151533_create_lead_statuses_table',5),(8,'2026_07_02_151602_create_lost_reasons_table',5),(9,'2026_07_02_151629_create_leads_table',5),(10,'2026_07_02_151714_create_lead_status_history_table',5),(11,'2026_07_02_151803_create_lead_conversations_table',5),(12,'2026_07_02_151829_create_lead_notifications_table',5),(13,'2026_07_02_151857_create_lead_assignments_table',5),(14,'2026_07_02_152130_create_lead_conversation_tags_table',6),(15,'2026_07_03_054931_create_permissions_table',7),(16,'2026_07_03_054937_create_role_permissions_table',7),(17,'2026_07_03_054942_create_menu_items_table',7),(18,'2026_07_03_105318_update_user_log_table',8),(19,'2026_07_03_170922_create_leave_types_table',9),(20,'2026_07_03_170926_create_leave_balances_table',9),(21,'2026_07_03_170931_create_leave_requests_table',9),(22,'2026_07_04_110326_create_holidays_table',10),(23,'2026_07_04_114707_create_notifications_table',11),(24,'2026_07_04_123735_create_push_subscriptions_table',12),(25,'2026_07_04_191639_create_tasks_table',13),(26,'2026_07_04_191646_create_task_assignees_table',13),(27,'2026_07_06_100759_add_last_reminded_at_to_task_assignees_table',14),(28,'2026_07_06_112818_create_conversations_table',15),(29,'2026_07_06_112824_create_conversation_participants_table',15),(30,'2026_07_06_112829_create_messages_table',15),(31,'2026_07_06_115442_create_social_accounts_table',16),(32,'2026_07_06_115451_create_social_media_stats_table',16),(33,'2026_07_06_132827_add_profile_fields_to_social_accounts_table',17),(34,'2026_07_06_133315_widen_profile_picture_url_column',18),(35,'2026_07_06_135610_add_youtube_support_to_social_accounts_table',19),(36,'2026_07_06_140000_add_youtube_support_to_social_accounts_table',19),(37,'2026_07_06_192430_create_expenses_table',20),(38,'2026_07_07_101418_create_students_table',21),(39,'2026_07_13_000000_create_enrollments_table',22),(40,'2026_07_15_100000_create_notes_table',23),(41,'2026_07_15_100100_create_todos_table',23),(42,'2026_07_15_100200_create_emails_table',23),(43,'2026_07_15_100300_create_folders_table',23),(44,'2026_07_15_110000_create_login_reminders_table',24),(45,'2026_07_15_110100_create_milestones_table',24),(46,'2026_07_15_110200_create_campaigns_table',24),(47,'2026_07_15_110300_create_social_media_posts_table',24),(48,'2026_07_15_120000_add_linkedin_and_engagement_support',25),(49,'2026_07_15_130000_create_google_accounts_table',26),(50,'2026_07_15_140000_create_lead_calls_table',27),(51,'2026_07_15_150000_relax_lead_actor_columns',28),(52,'2026_07_15_160000_create_incentive_records_table',29);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `metric` enum('leads','custom') NOT NULL DEFAULT 'leads',
  `period_type` enum('monthly','quarterly','yearly') NOT NULL DEFAULT 'monthly',
  `period_year` smallint(5) unsigned NOT NULL,
  `period_month` tinyint(3) unsigned DEFAULT NULL,
  `period_quarter` tinyint(3) unsigned DEFAULT NULL,
  `target_value` decimal(15,2) NOT NULL,
  `current_value` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `milestones_created_by_foreign` (`created_by`),
  KEY `milestones_metric_period_type_period_year_index` (`metric`,`period_type`,`period_year`),
  CONSTRAINT `milestones_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones`
--

LOCK TABLES `milestones` WRITE;
/*!40000 ALTER TABLE `milestones` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text DEFAULT NULL,
  `color` varchar(20) NOT NULL DEFAULT 'default',
  `is_pinned` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_user_id_is_pinned_index` (`user_id`,`is_pinned`),
  CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES ('0109c27a-e05e-4c1b-97d5-8ab4f3f92bf3','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 09:48:28','2026-07-17 09:48:12','2026-07-17 09:48:28'),('019463da-2ebf-463a-93a2-ed92caf3ef86','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',3,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Earned Leave (6.0 day(s), 01 Jul 2026 to 06 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/22\",\"icon\":\"ti ti-calendar-event\"}',NULL,'2026-07-04 09:47:01','2026-07-04 09:47:01'),('077e82b3-caea-4a60-951b-764294bdd0b7','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',1,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 01 Jul 2026 to 02 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/19\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 15:43:42','2026-07-04 09:35:16','2026-07-04 15:43:42'),('0866e4a8-4f50-48aa-a0ba-400d713cec3a','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',1,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 02 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/18\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 15:43:42','2026-07-04 09:31:23','2026-07-04 15:43:42'),('0b6c71cd-a993-45e4-983c-68279fddf06c','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',1,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Sick Leave (3.0 day(s), 06 Jul 2026 to 08 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/11\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 08:09:56','2026-07-04 07:56:52','2026-07-04 08:09:56'),('0c7d0f74-b532-4d41-abf8-ed8cd7bae3f9','App\\Notifications\\LeadEventNotification','App\\Models\\User',18,'{\"title\":\"Lead push diagnostic\",\"message\":\"Test lead web-push sent at 13:27:29\",\"url\":\"http:\\/\\/localhost:8000\\/leads\",\"icon\":\"ti ti-user-check\"}','2026-07-17 09:48:28','2026-07-17 07:57:29','2026-07-17 09:48:28'),('0d7eca50-1596-463f-80a5-5003aa9a9175','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',1,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/10\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 07:53:03','2026-07-04 07:22:39','2026-07-04 07:53:03'),('100e106a-1888-476b-b408-ea34de7e091f','App\\Notifications\\NewChatMessage','App\\Models\\User',4,'{\"title\":\"Shalini\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-17 09:57:37','2026-07-17 09:57:37'),('13cac694-c6a9-4ef6-a77e-67e29da8a6c2','App\\Notifications\\NewChatMessage','App\\Models\\User',1,'{\"title\":\"Shalini\",\"message\":\"Hiii\",\"url\":\"http:\\/\\/localhost:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 10:58:45','2026-07-17 07:48:53','2026-07-17 10:58:45'),('14d6517c-e1c9-43e4-8db2-920e177a7d41','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',3,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/16\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 09:42:29','2026-07-04 09:12:01','2026-07-04 09:42:29'),('15c1e80f-721e-4a4c-a985-645268832f89','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',3,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 01 Jul 2026 to 02 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/19\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 09:42:29','2026-07-04 09:35:17','2026-07-04 09:42:29'),('15fa4e9a-60c1-4eb7-b12e-3aa6f62a0443','App\\Notifications\\NewChatMessage','App\\Models\\User',4,'{\"title\":\"Shalini\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-17 07:51:15','2026-07-17 07:51:15'),('1bf1a79f-8885-4b91-b692-3a92812d2380','App\\Notifications\\NewChatMessage','App\\Models\\User',4,'{\"title\":\"Shalini\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-17 09:39:13','2026-07-17 09:39:13'),('1d482ac8-d26d-4acb-be83-919e031c4a2c','App\\Notifications\\LeadEventNotification','App\\Models\\User',18,'{\"title\":\"New lead assigned to you\",\"message\":\"Kavita Desai (9876500014) assigned by Priyanka Patnaik. Please follow up.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leads\\/17\",\"icon\":\"ti ti-user-check\"}','2026-07-17 07:01:23','2026-07-17 06:51:46','2026-07-17 07:01:23'),('1da4f207-5176-4cb9-a2e2-5a716b575b50','App\\Notifications\\TaskAssigned','App\\Models\\User',21,'{\"title\":\"New Task Assigned\",\"message\":\"\\\"Varasiddhi Vinayaka Vrata (Ganesh Chaturthi)\\\" \\u2014 due 07 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/5\",\"icon\":\"ti ti-clipboard-list\"}','2026-07-06 04:30:10','2026-07-04 14:43:56','2026-07-06 04:30:10'),('1e925b5c-c687-4383-97bb-86bd808472da','App\\Notifications\\TaskAssigned','App\\Models\\User',21,'{\"title\":\"New Task Assigned\",\"message\":\"\\\"Independence Day\\\" \\u2014 due 10 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\",\"icon\":\"ti ti-clipboard-list\"}','2026-07-06 04:30:10','2026-07-04 14:27:26','2026-07-06 04:30:10'),('22e685d6-a0c1-40f9-af4d-48bd24b78a20','App\\Notifications\\NewChatMessage','App\\Models\\User',4,'{\"title\":\"Shalini\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-17 07:52:39','2026-07-17 07:52:39'),('28928439-95a2-4367-98c1-0676c9003440','App\\Notifications\\NewChatMessage','App\\Models\\User',4,'{\"title\":\"Shalini\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-17 09:52:20','2026-07-17 09:52:20'),('2a96c83c-e224-4e89-a0af-b5a1a681c939','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 10:58:35','2026-07-17 09:58:46','2026-07-17 10:58:35'),('2c428bc4-2507-4ce6-aa9c-d87e52329b0c','App\\Notifications\\TaskAssigned','App\\Models\\User',10,'{\"title\":\"New Task Assigned\",\"message\":\"\\\"Whatsapp  Intigration\\\" \\u2014 due 06 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/2\",\"icon\":\"ti ti-clipboard-list\"}',NULL,'2026-07-04 14:01:17','2026-07-04 14:01:17'),('2de899cb-967e-4eae-9477-c7878e8b079e','App\\Notifications\\NewChatMessage','App\\Models\\User',23,'{\"title\":\"Iyyapan\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=2\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-06 06:03:07','2026-07-06 06:03:07'),('304f5a47-f626-4c96-a5a3-486c96e8b9ec','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 09:48:28','2026-07-17 09:30:12','2026-07-17 09:48:28'),('32a7c47c-3c7e-4ae7-9d58-874ecf06a8c7','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',3,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Earned Leave (5.0 day(s), 02 Jul 2026 to 06 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/21\",\"icon\":\"ti ti-calendar-event\"}',NULL,'2026-07-04 09:42:52','2026-07-04 09:42:52'),('3441d235-85b3-40e7-807a-c5fee1436fa3','App\\Notifications\\TaskAssigned','App\\Models\\User',21,'{\"title\":\"New Task Assigned\",\"message\":\"\\\"heryu\\\" \\u2014 due 06 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/8\",\"icon\":\"ti ti-clipboard-list\"}','2026-07-06 04:30:09','2026-07-04 15:48:08','2026-07-06 04:30:09'),('37a67c65-5388-4add-af7c-8a28e1740e8e','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 09:48:28','2026-07-17 07:52:18','2026-07-17 09:48:28'),('3839c199-9d24-440f-a4e6-209df076737f','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',1,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/8\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 06:40:01','2026-07-04 06:39:40','2026-07-04 06:40:01'),('38a699ef-141d-424b-bba6-4eca88ebd53e','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',1,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 02 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/20\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 15:43:42','2026-07-04 09:42:08','2026-07-04 15:43:42'),('394f3c8b-80f5-44b1-9bbf-fb77dc0d22f9','App\\Notifications\\TaskAssigned','App\\Models\\User',21,'{\"title\":\"New Task Assigned\",\"message\":\"\\\"Whatsapp  Intigration\\\" \\u2014 due 06 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/2\",\"icon\":\"ti ti-clipboard-list\"}','2026-07-04 14:17:24','2026-07-04 14:01:17','2026-07-04 14:17:24'),('3c08898e-cafe-4762-b756-9d89d0f8df6d','App\\Notifications\\NewChatMessage','App\\Models\\User',4,'{\"title\":\"Shalini\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-17 09:29:43','2026-07-17 09:29:43'),('3df1e3d8-a4b2-481c-a3e7-10c2e634f88b','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',1,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/7\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 06:39:07','2026-07-04 06:38:50','2026-07-04 06:39:07'),('3f17664e-7427-4619-8af3-f593d0b389bd','App\\Notifications\\LeadEventNotification','App\\Models\\User',18,'{\"title\":\"Test notification \\u2705\",\"message\":\"Web push works on this account \\u2014 sent at 03:18:33 PM. If you did not see a banner, check Windows notification settings for your browser.\",\"url\":\"http:\\/\\/127.0.0.1:8000\",\"icon\":\"ti ti-bell-ringing\"}','2026-07-17 09:49:06','2026-07-17 09:48:33','2026-07-17 09:49:06'),('427d03a6-58ba-468c-83d7-94d6d6b760d1','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',19,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 02 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/20\",\"icon\":\"ti ti-calendar-event\"}',NULL,'2026-07-04 09:42:08','2026-07-04 09:42:08'),('446337e7-bf27-4a70-9633-93d7e6ae7483','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 10:58:35','2026-07-17 09:59:09','2026-07-17 10:58:35'),('46ab9433-c711-4b90-82a6-d0da57f1e848','App\\Notifications\\NewChatMessage','App\\Models\\User',23,'{\"title\":\"Iyyapan\",\"message\":\"Hi\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=2\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-06 06:03:14','2026-07-06 06:03:14'),('4754fa41-d8f5-4f15-809a-ef915ade899e','App\\Notifications\\LeadEventNotification','App\\Models\\User',18,'{\"title\":\"New lead assigned to you\",\"message\":\"Shweta Rao (9876500016) assigned by Priyanka Patnaik. Please follow up.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leads\\/19\",\"icon\":\"ti ti-user-check\"}','2026-07-17 09:48:28','2026-07-17 08:08:28','2026-07-17 09:48:28'),('4a6bb41e-fb02-4dd6-9a61-5652062be3ae','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii shalini\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 09:48:28','2026-07-17 08:06:37','2026-07-17 09:48:28'),('4a78833e-611e-4726-a092-3e7b0aad2ac6','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',3,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Sick Leave (3.0 day(s), 06 Jul 2026 to 08 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/11\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 09:42:29','2026-07-04 07:56:52','2026-07-04 09:42:29'),('4c77a437-4963-424d-a927-e3f5896e83ff','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Krish Bhargav\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=5\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 10:58:35','2026-07-17 10:44:27','2026-07-17 10:58:35'),('4d7a9da4-6cbb-4487-9d04-34b52d3ba4e7','App\\Notifications\\NewChatMessage','App\\Models\\User',4,'{\"title\":\"Shalini\",\"message\":\"Hiii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-17 07:38:28','2026-07-17 07:38:28'),('4f0b266b-f919-47fa-8841-1988d6cd6ff6','App\\Notifications\\LeadEventNotification','App\\Models\\User',18,'{\"title\":\"New lead assigned to you\",\"message\":\"9876500020 (9876500020) assigned by Priyanka Patnaik. Please follow up.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leads\\/23\",\"icon\":\"ti ti-user-check\"}','2026-07-17 07:06:59','2026-07-17 07:02:00','2026-07-17 07:06:59'),('54be4931-35c8-4186-a233-abaa538efb7e','App\\Notifications\\LeadEventNotification','App\\Models\\User',18,'{\"title\":\"New lead assigned to you\",\"message\":\"Kunal (8114637479) assigned by Priyanka Patnaik. Please follow up.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leads\\/24\",\"icon\":\"ti ti-user-check\"}','2026-07-17 07:01:23','2026-07-17 06:38:58','2026-07-17 07:01:23'),('563b1ef1-5271-46b0-8b6e-9ac11651f151','App\\Notifications\\NewChatMessage','App\\Models\\User',1,'{\"title\":\"Iyyapan\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=3\",\"icon\":\"ti ti-message-circle\"}','2026-07-06 06:13:50','2026-07-06 06:10:20','2026-07-06 06:13:50'),('5658c6f6-e212-4dbe-8895-b6d6a9847d49','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',3,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 01 Jul 2026 to 02 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/9\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 07:22:02','2026-07-04 07:15:30','2026-07-04 07:22:02'),('5bf0e93a-5641-4fbc-a2b1-ad558b6f7531','App\\Notifications\\LeaveRequestReviewed','App\\Models\\User',21,'{\"title\":\"Leave Request Approved\",\"message\":\"Your Earned Leave request has been approved.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/22\",\"icon\":\"ti ti-check\"}','2026-07-06 04:30:10','2026-07-04 09:47:41','2026-07-06 04:30:10'),('5c441492-079b-4969-bc67-7b0d59db3698','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',1,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 06 Jul 2026 to 07 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/17\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 15:43:42','2026-07-04 09:29:57','2026-07-04 15:43:42'),('60ef47a8-236c-4c7a-9afd-ca5f05cacbd7','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',3,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 01 Jul 2026 to 02 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/14\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 09:42:29','2026-07-04 08:15:35','2026-07-04 09:42:29'),('613328e0-2f92-4381-b4b7-6095747cb27b','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',3,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Sick Leave (2.0 day(s), 01 Jul 2026 to 02 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/13\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 09:42:29','2026-07-04 08:09:15','2026-07-04 09:42:29'),('65beff3c-ce4d-443e-af0c-cd4111ca41bc','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',1,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/12\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 08:09:56','2026-07-04 07:59:01','2026-07-04 08:09:56'),('669ebba7-dfdf-4960-a5eb-9e2e4be91685','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 09:48:28','2026-07-17 07:37:09','2026-07-17 09:48:28'),('693e916b-1268-4605-8088-bf74f3e5d19a','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',19,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Earned Leave (5.0 day(s), 02 Jul 2026 to 06 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/21\",\"icon\":\"ti ti-calendar-event\"}',NULL,'2026-07-04 09:42:51','2026-07-04 09:42:51'),('69bc0b97-e3ed-496d-9be8-55e0bfe40bdf','App\\Notifications\\NewChatMessage','App\\Models\\User',4,'{\"title\":\"Shalini\",\"message\":\"Hii priyanka\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-17 07:56:16','2026-07-17 07:56:16'),('6b50a041-d5b7-43e3-b7db-b0bc6355e5a4','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',1,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Earned Leave (6.0 day(s), 01 Jul 2026 to 06 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/22\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 15:43:42','2026-07-04 09:47:00','2026-07-04 15:43:42'),('6bc0b308-1f60-4d91-9c39-3edbc25334c4','App\\Notifications\\LeadEventNotification','App\\Models\\User',18,'{\"title\":\"New lead assigned to you\",\"message\":\"Pooja Iyer (9876500012) assigned by Priyanka Patnaik. Please follow up.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leads\\/15\",\"icon\":\"ti ti-user-check\"}','2026-07-17 09:48:28','2026-07-17 09:12:38','2026-07-17 09:48:28'),('6ccbb71f-9bfa-4156-aaf5-e209eecc71b4','App\\Notifications\\TaskAssigned','App\\Models\\User',1,'{\"title\":\"New Task Assigned\",\"message\":\"\\\"Intigration\\\" \\u2014 due 07 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/9\",\"icon\":\"ti ti-clipboard-list\"}','2026-07-06 04:26:15','2026-07-04 15:49:08','2026-07-06 04:26:15'),('6d0c6c67-10c8-4c7d-acd0-9fb5383cf3bb','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 10:58:35','2026-07-17 09:57:57','2026-07-17 10:58:35'),('6f2b71e2-3f6d-411c-83ac-e3f44688694a','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii\",\"url\":\"http:\\/\\/localhost:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 09:48:28','2026-07-17 09:26:04','2026-07-17 09:48:28'),('700df44b-9c90-428a-83ac-aaebc76d7cbe','App\\Notifications\\NewChatMessage','App\\Models\\User',1,'{\"title\":\"Shalini\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=5\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 10:58:45','2026-07-17 10:57:51','2026-07-17 10:58:45'),('7029b05a-e9f8-4c54-8c31-853a2798b722','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Krish Bhargav\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=5\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 10:58:35','2026-07-17 10:45:15','2026-07-17 10:58:35'),('74671edf-c623-4dd1-8098-140a1020f567','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 09:48:28','2026-07-17 07:51:40','2026-07-17 09:48:28'),('75531630-39e7-4af1-88ff-ee86e933e30d','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',3,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 06 Jul 2026 to 07 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/17\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 09:42:29','2026-07-04 09:29:58','2026-07-04 09:42:29'),('770686da-a2e6-4db9-a6e8-e16f3b3068f7','App\\Notifications\\TaskAssigned','App\\Models\\User',23,'{\"title\":\"New Task Assigned\",\"message\":\"\\\"Independence Day\\\" \\u2014 due 10 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\",\"icon\":\"ti ti-clipboard-list\"}',NULL,'2026-07-04 14:27:26','2026-07-04 14:27:26'),('797dbae9-bfbb-41b1-aacc-a09e23c853b7','App\\Notifications\\LeadEventNotification','App\\Models\\User',18,'{\"title\":\"New lead assigned to you\",\"message\":\"Arjun Menon (9876500015) assigned by Priyanka Patnaik. Please follow up.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leads\\/18\",\"icon\":\"ti ti-user-check\"}','2026-07-17 07:01:23','2026-07-17 06:45:10','2026-07-17 07:01:23'),('7b81b5f5-dd96-40e9-a344-e8e9c4e23728','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii Shalini\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 09:48:28','2026-07-17 08:07:13','2026-07-17 09:48:28'),('7dca0cc6-4b5c-4e7e-92ac-d3a9e863f2aa','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',19,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Earned Leave (6.0 day(s), 01 Jul 2026 to 06 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/22\",\"icon\":\"ti ti-calendar-event\"}',NULL,'2026-07-04 09:47:00','2026-07-04 09:47:00'),('807ff97f-d7e8-4897-9237-9de5a7b4cc4d','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',1,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Earned Leave (5.0 day(s), 02 Jul 2026 to 06 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/21\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 15:43:42','2026-07-04 09:42:51','2026-07-04 15:43:42'),('818392bb-f132-4bed-b639-b926dbd55fc0','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 09:48:28','2026-07-17 09:32:07','2026-07-17 09:48:28'),('8361eaba-3c11-482f-baca-c2838120506d','App\\Notifications\\NewChatMessage','App\\Models\\User',4,'{\"title\":\"Shalini\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-17 07:56:33','2026-07-17 07:56:33'),('8784dfea-683d-4169-afa0-ddc365036d9f','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',3,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 02 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/18\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 09:42:29','2026-07-04 09:31:24','2026-07-04 09:42:29'),('8a9bd7a9-7753-4906-92e0-eaea711ba55b','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',3,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 02 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/20\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 09:42:29','2026-07-04 09:42:09','2026-07-04 09:42:29'),('8cc607b4-3302-492d-9844-ec52856cdd40','App\\Notifications\\NewChatMessage','App\\Models\\User',21,'{\"title\":\"Krish Bhargav\",\"message\":\"Hi\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=3\",\"icon\":\"ti ti-message-circle\"}','2026-07-06 06:14:15','2026-07-06 06:10:08','2026-07-06 06:14:15'),('904c77e5-ee21-4bbe-8f90-29fe5374360a','App\\Notifications\\LeadEventNotification','App\\Models\\User',1,'{\"title\":\"New lead generated\",\"message\":\"Anjali \\u2014 manual\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leads\\/27\",\"icon\":\"ti ti-user-plus\"}','2026-07-17 10:58:45','2026-07-17 09:18:11','2026-07-17 10:58:45'),('93a8a267-7e3e-4761-8a2a-d8ef804db22a','App\\Notifications\\NewChatMessage','App\\Models\\User',4,'{\"title\":\"Shalini\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-17 08:07:33','2026-07-17 08:07:33'),('95b78c0b-56ab-4c0f-af96-28645fc983b5','App\\Notifications\\LeadEventNotification','App\\Models\\User',1,'{\"title\":\"Lead push diagnostic\",\"message\":\"Test lead web-push sent at 13:27:28\",\"url\":\"http:\\/\\/localhost:8000\\/leads\",\"icon\":\"ti ti-user-check\"}','2026-07-17 10:58:45','2026-07-17 07:57:28','2026-07-17 10:58:45'),('97760ae3-799c-4b2b-a8a3-4ec6f61187c3','App\\Notifications\\NewChatMessage','App\\Models\\User',1,'{\"title\":\"Shalini\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=5\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 10:58:45','2026-07-17 10:57:48','2026-07-17 10:58:45'),('99ccb8de-f21d-4f1f-a0e3-87c047a29da3','App\\Notifications\\LeadEventNotification','App\\Models\\User',18,'{\"title\":\"New lead assigned to you\",\"message\":\"Manish Joshi (9876500013) assigned by Priyanka Patnaik. Please follow up.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leads\\/16\",\"icon\":\"ti ti-user-check\"}','2026-07-17 09:48:28','2026-07-17 07:53:52','2026-07-17 09:48:28'),('99f377f0-e50e-4c7d-b08a-a911cc70242f','App\\Notifications\\TaskAssigned','App\\Models\\User',21,'{\"title\":\"New Task Assigned\",\"message\":\"\\\"Whatsapp  Intigration\\\" \\u2014 due 09 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/3\",\"icon\":\"ti ti-clipboard-list\"}','2026-07-06 04:30:10','2026-07-04 14:25:43','2026-07-06 04:30:10'),('9ca9a7b6-1979-442e-8f43-06ec669a754c','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',3,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/8\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 06:43:37','2026-07-04 06:39:40','2026-07-04 06:43:37'),('9d88f6c4-3210-47b6-adde-bf0dffde8d1f','App\\Notifications\\TaskAssigned','App\\Models\\User',19,'{\"title\":\"New Task Assigned\",\"message\":\"\\\"Independence Day\\\" \\u2014 due 08 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/7\",\"icon\":\"ti ti-clipboard-list\"}',NULL,'2026-07-04 14:59:05','2026-07-04 14:59:05'),('a1b9ce41-dd1f-493b-9295-14499c57823d','App\\Notifications\\NewChatMessage','App\\Models\\User',4,'{\"title\":\"Shalini\",\"message\":\"hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-17 09:15:03','2026-07-17 09:15:03'),('a77a1db0-bd3d-4c78-a179-bd22be3b5c1d','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 10:58:35','2026-07-17 09:50:15','2026-07-17 10:58:35'),('a8e6f6d5-310d-45b5-981a-f7d8a050b178','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',1,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (1.0 day(s), 01 Jul 2026 to 01 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/15\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 15:43:42','2026-07-04 09:10:36','2026-07-04 15:43:42'),('ab24dc03-d78b-4723-899e-f90f9e4a6bae','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 09:48:28','2026-07-17 09:15:18','2026-07-17 09:48:28'),('ab3ed2c6-8ac6-4e45-bff3-038336e6c49b','App\\Notifications\\TaskAssigned','App\\Models\\User',3,'{\"title\":\"New Task Assigned\",\"message\":\"\\\"Independence Day\\\" \\u2014 due 10 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/4\",\"icon\":\"ti ti-clipboard-list\"}',NULL,'2026-07-04 14:27:21','2026-07-04 14:27:21'),('acc199b5-6a1c-49e1-ac01-1938b475be43','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 10:58:35','2026-07-17 09:52:32','2026-07-17 10:58:35'),('acc61f3d-b9d8-46fd-bcff-d2973f10e82f','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 09:48:28','2026-07-17 07:37:54','2026-07-17 09:48:28'),('ad212987-34ac-4eee-871d-5c4762223792','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 10:58:35','2026-07-17 09:58:42','2026-07-17 10:58:35'),('ad9e6a15-fc47-4a44-ba0a-d1ebcfbcc088','App\\Notifications\\LeadEventNotification','App\\Models\\User',1,'{\"title\":\"Test notification \\u2705\",\"message\":\"If you see this as a browser popup, web push works!\",\"url\":\"http:\\/\\/localhost:8000\\/leads\",\"icon\":\"ti ti-bell\"}','2026-07-17 10:58:45','2026-07-17 06:48:22','2026-07-17 10:58:45'),('aed5d005-026e-41d2-9ea3-119de7b5e5e4','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',1,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 01 Jul 2026 to 02 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/14\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 15:43:42','2026-07-04 08:15:35','2026-07-04 15:43:42'),('b2835108-6d8e-4403-912c-23610d2f6abe','App\\Notifications\\LeadEventNotification','App\\Models\\User',18,'{\"title\":\"New lead assigned to you\",\"message\":\"Kunal (8114637479) assigned by Priyanka Patnaik. Please follow up.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leads\\/24\",\"icon\":\"ti ti-user-check\"}','2026-07-17 06:39:13','2026-07-17 06:38:09','2026-07-17 06:39:13'),('b4cd3a18-0628-4bf4-b258-8960c6d91b53','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"HII\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 10:58:35','2026-07-17 09:53:46','2026-07-17 10:58:35'),('b6509878-ffaf-4d05-9fed-d937b0d8185d','App\\Notifications\\LeadEventNotification','App\\Models\\User',18,'{\"title\":\"New lead assigned to you\",\"message\":\"Suresh Patil (9876500009) assigned by Priyanka Patnaik. Please follow up.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leads\\/12\",\"icon\":\"ti ti-user-check\"}','2026-07-17 07:01:23','2026-07-17 06:43:05','2026-07-17 07:01:23'),('b8ff2c2c-c276-4acd-a1a3-cbdfcf3c0c2c','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',1,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Sick Leave (2.0 day(s), 01 Jul 2026 to 02 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/13\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 08:09:56','2026-07-04 08:09:14','2026-07-04 08:09:56'),('bbea5e75-225e-40fa-bff0-45023d551822','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 09:48:28','2026-07-17 09:38:53','2026-07-17 09:48:28'),('bc2e5895-0730-4d3f-a933-b42f786b1133','App\\Notifications\\NewChatMessage','App\\Models\\User',23,'{\"title\":\"Iyyapan\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=2\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-06 06:03:06','2026-07-06 06:03:06'),('bfee2a43-efd0-4608-a7c5-55d723251de9','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',3,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (1.0 day(s), 01 Jul 2026 to 01 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/15\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 09:42:29','2026-07-04 09:10:36','2026-07-04 09:42:29'),('c03d3a43-5356-4588-976a-05073e71b973','App\\Notifications\\TaskAssigned','App\\Models\\User',21,'{\"title\":\"New Task Assigned\",\"message\":\"\\\"Varasiddhi Vinayaka Vrata (Ganesh Chaturthi)\\\" \\u2014 due 01 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/6\",\"icon\":\"ti ti-clipboard-list\"}','2026-07-06 04:30:09','2026-07-04 14:57:13','2026-07-06 04:30:09'),('c2059024-6a64-4e27-be82-88fc153a1fd2','App\\Notifications\\NewChatMessage','App\\Models\\User',4,'{\"title\":\"Shalini\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-17 09:32:20','2026-07-17 09:32:20'),('c362a7cf-c985-4420-9aca-2b2d971383d3','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hello\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 09:48:28','2026-07-17 09:29:28','2026-07-17 09:48:28'),('c8bd8191-6479-4c67-bedd-cd8884d14c0d','App\\Notifications\\NewChatMessage','App\\Models\\User',4,'{\"title\":\"Shalini\",\"message\":\"Hii priyanka\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-17 07:56:13','2026-07-17 07:56:13'),('c92ce7fe-1254-4529-a1ec-fe8df0887946','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 09:48:28','2026-07-17 09:14:35','2026-07-17 09:48:28'),('cba79062-07d4-4b94-aa92-b31bd165ee19','App\\Notifications\\LeadEventNotification','App\\Models\\User',4,'{\"title\":\"New lead generated\",\"message\":\"Anjali \\u2014 manual\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leads\\/27\",\"icon\":\"ti ti-user-plus\"}',NULL,'2026-07-17 09:18:09','2026-07-17 09:18:09'),('cd7f6382-921f-49ab-9e3b-2f323ea29991','App\\Notifications\\NewChatMessage','App\\Models\\User',4,'{\"title\":\"Shalini\",\"message\":\"hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-17 09:49:37','2026-07-17 09:49:37'),('d3c2f8e4-abb3-4629-b921-aaf718f215e5','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',1,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/16\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 15:43:42','2026-07-04 09:12:01','2026-07-04 15:43:42'),('d406393e-b5aa-4807-a03f-169e24b5c988','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',3,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/12\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 09:42:29','2026-07-04 07:59:01','2026-07-04 09:42:29'),('d8177cb9-13be-48d4-857f-4a30e0c6267e','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',1,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (2.0 day(s), 01 Jul 2026 to 02 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/9\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 07:16:45','2026-07-04 07:15:30','2026-07-04 07:16:45'),('e229eba0-bcab-4dbd-879d-d13090ed53b5','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Krish Bhargav\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=5\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 10:58:35','2026-07-17 10:43:14','2026-07-17 10:58:35'),('e273e184-f2d6-4256-8fff-aa815d8bd384','App\\Notifications\\TaskAssigned','App\\Models\\User',23,'{\"title\":\"New Task Assigned\",\"message\":\"\\\"Whatsapp  Intigration\\\" \\u2014 due 06 Jul 2026.\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/tasks\\/2\",\"icon\":\"ti ti-clipboard-list\"}',NULL,'2026-07-04 14:01:18','2026-07-04 14:01:18'),('e36770f9-16c0-4e77-a3ae-7f2357d06c19','App\\Notifications\\LeadEventNotification','App\\Models\\User',3,'{\"title\":\"New lead generated\",\"message\":\"Anjali \\u2014 manual\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leads\\/27\",\"icon\":\"ti ti-user-plus\"}',NULL,'2026-07-17 09:18:06','2026-07-17 09:18:06'),('e3f098db-a022-491a-b417-b6568d7d3351','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Priyanka Patnaik\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 09:48:28','2026-07-17 09:22:32','2026-07-17 09:48:28'),('e449820e-7d84-4c59-bbcc-186d48f9ebcc','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',3,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/7\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 06:43:37','2026-07-04 06:38:50','2026-07-04 06:43:37'),('e646d862-24a2-4d77-a770-bb0181a72bcf','App\\Notifications\\LeadEventNotification','App\\Models\\User',18,'{\"title\":\"Test notification \\u2705\",\"message\":\"Web push works on this account \\u2014 sent at 03:18:40 PM. If you did not see a banner, check Windows notification settings for your browser.\",\"url\":\"http:\\/\\/127.0.0.1:8000\",\"icon\":\"ti ti-bell-ringing\"}','2026-07-17 09:49:16','2026-07-17 09:48:40','2026-07-17 09:49:16'),('f2d91925-2cdc-4196-ad51-01121cc669f8','App\\Notifications\\NewChatMessage','App\\Models\\User',4,'{\"title\":\"Shalini\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-17 09:13:24','2026-07-17 09:13:24'),('f407c5c4-b251-49eb-ac95-c7e4384683cd','App\\Notifications\\NewChatMessage','App\\Models\\User',4,'{\"title\":\"Shalini\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=4\",\"icon\":\"ti ti-message-circle\"}',NULL,'2026-07-17 09:30:28','2026-07-17 09:30:28'),('f7cdaad3-037a-4c9a-8007-5bcaf0aaa1ba','App\\Notifications\\LeaveRequestSubmitted','App\\Models\\User',3,'{\"title\":\"New Leave Request\",\"message\":\"Iyyapan applied for Casual Leave (3.0 day(s), 01 Jul 2026 to 03 Jul 2026).\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/leave-requests\\/10\",\"icon\":\"ti ti-calendar-event\"}','2026-07-04 09:42:30','2026-07-04 07:22:39','2026-07-04 09:42:30'),('fc549d35-e2ce-4e83-afce-755d8d93c441','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Krish Bhargav\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=5\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 10:58:35','2026-07-17 10:57:37','2026-07-17 10:58:35'),('fce923bf-207b-4d8f-b8b0-9d68e4999be8','App\\Notifications\\NewChatMessage','App\\Models\\User',18,'{\"title\":\"Krish Bhargav\",\"message\":\"Hii\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/chat?conversation=5\",\"icon\":\"ti ti-message-circle\"}','2026-07-17 10:58:35','2026-07-17 10:45:38','2026-07-17 10:58:35');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_transactions`
--

DROP TABLE IF EXISTS `payment_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `registration_id` bigint(20) unsigned DEFAULT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `source` enum('checkout','webhook','reconcile','manual') NOT NULL DEFAULT 'checkout',
  `event` varchar(60) DEFAULT NULL,
  `razorpay_order_id` varchar(64) DEFAULT NULL,
  `razorpay_payment_id` varchar(64) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `raw_payload` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_txn_reg` (`registration_id`),
  KEY `idx_txn_order` (`razorpay_order_id`),
  CONSTRAINT `fk_txn_reg` FOREIGN KEY (`registration_id`) REFERENCES `course_registrations` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transactions`
--

LOCK TABLES `payment_transactions` WRITE;
/*!40000 ALTER TABLE `payment_transactions` DISABLE KEYS */;
INSERT INTO `payment_transactions` VALUES (1,1,'BJ-260715-1398CA','checkout','order.created','order_TDlcEDoNOTiOA9',NULL,'created',30000.00,'{\"amount\":3000000,\"amount_due\":3000000,\"amount_paid\":0,\"attempts\":0,\"created_at\":1784116018,\"currency\":\"INR\",\"entity\":\"order\",\"id\":\"order_TDlcEDoNOTiOA9\",\"notes\":{\"course\":\"Data Engineering Certification Program\",\"name\":\"Jyoti\",\"phone\":\"8114637479\",\"reference\":\"BJ-260715-1398CA\"},\"offer_id\":null,\"receipt\":\"BJ-260715-1398CA\",\"status\":\"created\"}','2026-07-15 06:16:59'),(2,2,'BJ-260715-680145','checkout','order.created','order_TDlfmadABpzmRH',NULL,'created',30000.00,'{\"amount\":3000000,\"amount_due\":3000000,\"amount_paid\":0,\"attempts\":0,\"created_at\":1784116220,\"currency\":\"INR\",\"entity\":\"order\",\"id\":\"order_TDlfmadABpzmRH\",\"notes\":{\"course\":\"Data Engineering Certification Program\",\"name\":\"Jyoti\",\"phone\":\"8114637479\",\"reference\":\"BJ-260715-680145\"},\"offer_id\":null,\"receipt\":\"BJ-260715-680145\",\"status\":\"created\"}','2026-07-15 06:20:20'),(3,3,'BJ-260715-3C8996','checkout','order.created','order_TDliJ3HuBP3zfr',NULL,'created',30000.00,'{\"amount\":3000000,\"amount_due\":3000000,\"amount_paid\":0,\"attempts\":0,\"created_at\":1784116363,\"currency\":\"INR\",\"entity\":\"order\",\"id\":\"order_TDliJ3HuBP3zfr\",\"notes\":{\"course\":\"Data Engineering Certification Program\",\"name\":\"Jyoti\",\"phone\":\"8114637479\",\"reference\":\"BJ-260715-3C8996\"},\"offer_id\":null,\"receipt\":\"BJ-260715-3C8996\",\"status\":\"created\"}','2026-07-15 06:22:44'),(4,4,'BJ-260715-760DB6','checkout','order.created','order_TDmDjdzc43Ysf5',NULL,'created',30000.00,'{\"amount\":3000000,\"amount_due\":3000000,\"amount_paid\":0,\"attempts\":0,\"created_at\":1784118148,\"currency\":\"INR\",\"entity\":\"order\",\"id\":\"order_TDmDjdzc43Ysf5\",\"notes\":{\"course\":\"Data Engineering Certification Program\",\"name\":\"Jyoti\",\"phone\":\"8114637479\",\"reference\":\"BJ-260715-760DB6\"},\"offer_id\":null,\"receipt\":\"BJ-260715-760DB6\",\"status\":\"created\"}','2026-07-15 06:52:29');
/*!40000 ALTER TABLE `payment_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `module` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Dashboard','view_dashboard','Main Menu','2026-07-03 09:28:00','2026-07-03 09:28:00'),(2,'Leads Dashboard','view_leads_dashboard','Main Menu','2026-07-03 09:28:00','2026-07-03 09:28:00'),(3,'Revenue Summary','view_revenue_summary_dashboard','Main Menu','2026-07-03 09:28:00','2026-07-03 09:28:00'),(4,'Growth Dashboard','view_growth_dashboard','Main Menu','2026-07-03 09:28:00','2026-07-03 09:28:00'),(5,'Chat','view_chat','Main Menu','2026-07-03 09:28:00','2026-07-03 09:28:00'),(6,'Instagram','view_video_call','Main Menu','2026-07-03 09:28:00','2026-07-03 09:28:00'),(7,'LinkedIn','view_audio_call','Main Menu','2026-07-03 09:28:00','2026-07-03 09:28:00'),(8,'Youtube','view_call_history','Main Menu','2026-07-03 09:28:00','2026-07-03 09:28:00'),(9,'Calendar','view_calendar','Main Menu','2026-07-03 09:28:00','2026-07-03 09:28:00'),(10,'Email','view_email','Main Menu','2026-07-03 09:28:00','2026-07-03 09:28:00'),(11,'To Do','view_todo','Main Menu','2026-07-03 09:28:00','2026-07-03 09:28:00'),(12,'Notes','view_notes','Main Menu','2026-07-03 09:28:00','2026-07-03 09:28:00'),(13,'File Manager','view_file_manager','Main Menu','2026-07-03 09:28:00','2026-07-03 09:28:00'),(14,'Leads','view_leads','CRM','2026-07-03 09:28:00','2026-07-03 09:28:00'),(15,'Payments','view_payments','CRM','2026-07-03 09:28:00','2026-07-03 09:28:00'),(16,'Analytics','view_analytics','CRM','2026-07-03 09:28:00','2026-07-03 09:28:00'),(17,'Tasks','view_tasks','PROJECTS','2026-07-03 09:28:00','2026-07-03 09:28:00'),(18,'Milestones','view_milestones','PROJECTS','2026-07-03 09:28:00','2026-07-03 09:28:00'),(20,'Campaigns','view_campaign','MARKETING','2026-07-03 09:28:00','2026-07-03 09:28:00'),(21,'Email Campaigns','view_email_campaign','MARKETING','2026-07-03 09:28:00','2026-07-03 09:28:00'),(22,'SMS Campaigns','view_sms_campaign','MARKETING','2026-07-03 09:28:00','2026-07-03 09:28:00'),(23,'Social Campaigns','view_social_campaign','MARKETING','2026-07-03 09:28:00','2026-07-03 09:28:00'),(24,'WhatsApp Campaigns','view_whatsapp_campaign','MARKETING','2026-07-03 09:28:00','2026-07-03 09:28:00'),(25,'Email Marketing','view_email_marketing','MARKETING','2026-07-03 09:28:00','2026-07-03 09:28:00'),(26,'Email Engagement','view_email_engagement','MARKETING','2026-07-03 09:28:00','2026-07-03 09:28:00'),(27,'Manage Users','manage_users','User Management','2026-07-03 09:28:00','2026-07-03 09:28:00'),(28,'Roles & Permissions','manage_roles','User Management','2026-07-03 09:28:00','2026-07-03 09:28:00'),(31,'Attendance','view_attendance','HRM','2026-07-03 09:28:00','2026-07-03 09:28:00'),(32,'Leave Requests','view_leave_requests','HRM','2026-07-03 09:28:00','2026-07-03 09:28:00'),(33,'Holidays','view_holidays','HRM','2026-07-03 09:28:00','2026-07-03 09:28:00'),(34,'Company Report','view_company_reports','Reports','2026-07-03 09:28:00','2026-07-03 09:28:00'),(35,'Revenue Report','view_reports','Reports','2026-07-03 09:28:00','2026-07-03 09:28:00'),(36,'Attendance Summary','view_attendance_summary_report','Reports','2026-07-03 09:28:00','2026-07-03 09:28:00'),(37,'Leave Balance Summary','view_leave_balance_summary_report','Reports','2026-07-03 09:28:00','2026-07-03 09:28:00'),(38,'Pages','view_pages','Content','2026-07-03 09:28:00','2026-07-03 09:28:00'),(39,'All Blogs','view_blogs','Content','2026-07-03 09:28:00','2026-07-03 09:28:00'),(40,'Blog Categories','view_blog_categories','Content','2026-07-03 09:28:00','2026-07-03 09:28:00'),(41,'Blog Comments','view_blog_comments','Content','2026-07-03 09:28:00','2026-07-03 09:28:00'),(42,'Blog Tags','view_blog_tags','Content','2026-07-03 09:28:00','2026-07-03 09:28:00'),(43,'Countries','view_countries','Content','2026-07-03 09:28:00','2026-07-03 09:28:00'),(44,'States','view_states','Content','2026-07-03 09:28:00','2026-07-03 09:28:00'),(45,'Cities','view_cities','Content','2026-07-03 09:28:00','2026-07-03 09:28:00'),(46,'Testimonials','view_testimonials','Content','2026-07-03 09:28:00','2026-07-03 09:28:00'),(47,'FAQ','view_faq','Content','2026-07-03 09:28:00','2026-07-03 09:28:00'),(48,'Manage Holidays','manage_holidays','HRM','2026-07-04 05:39:30','2026-07-04 05:39:30'),(49,'View Students','view_students','Student Management','2026-07-07 05:24:36','2026-07-07 05:24:36'),(50,'Manage Masterclass','manage_masterclass','Student Management','2026-07-07 05:24:36','2026-07-07 05:24:36'),(51,'Manage Live Batches','manage_live_batches','Student Management','2026-07-07 05:24:36','2026-07-07 05:24:36'),(52,'Manage Class Attendance','manage_class_attendance','Student Management','2026-07-07 05:24:36','2026-07-07 05:24:36'),(53,'Manage Mock Test Results','manage_mock_test_results','Student Management','2026-07-07 05:24:36','2026-07-07 05:24:36'),(58,'View Login Reminders','view_login_reminders','Reports','2026-07-16 06:37:50','2026-07-16 06:37:50'),(59,'Manage Social Alerts','view_social_alerts','Social','2026-07-16 06:37:50','2026-07-16 06:37:50'),(60,'View Office Finance','view_office_finance','Finance','2026-07-17 05:14:16','2026-07-17 05:14:16'),(61,'Create Lead','create_lead','CRM','2026-07-17 06:34:35','2026-07-17 06:34:35'),(62,'View All Leads','view_all_leads','CRM','2026-07-17 06:34:35','2026-07-17 06:34:35');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_subscriptions`
--

DROP TABLE IF EXISTS `push_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `push_subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subscribable_type` varchar(255) NOT NULL,
  `subscribable_id` bigint(20) unsigned NOT NULL,
  `endpoint` text NOT NULL,
  `public_key` varchar(255) DEFAULT NULL,
  `auth_token` varchar(255) DEFAULT NULL,
  `content_encoding` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `push_subscriptions_subscribable_endpoint_unique` (`subscribable_type`,`subscribable_id`,`endpoint`) USING HASH,
  KEY `push_subscriptions_subscribable_type_subscribable_id_index` (`subscribable_type`,`subscribable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_subscriptions`
--

LOCK TABLES `push_subscriptions` WRITE;
/*!40000 ALTER TABLE `push_subscriptions` DISABLE KEYS */;
INSERT INTO `push_subscriptions` VALUES (1,'App\\Models\\User',1,'https://fcm.googleapis.com/fcm/send/dZQY425aHhU:APA91bHWvHwDMA_ODb_47zQZiWv5Z8-G1gml3DxTvQPJBU_EbBz5W2pGN2j-cTvHTtLjMUpAmQsEzVKQlGiIR-yk-K4VHxY6sPMH9ciI2ljoBuMz5QdSqsniiA32IIKZDAqIAw7CK8Vt','BCdsltvgpMPm5-968kJS6tZPCSrJxlMFWW2yyc1Elr4oQd1fEYgPwhsP3Ub_Bt0iiibf6XGObiGKxnRZdxSa-ZQ','SCH0heEGenah8BtJ9VgNuA',NULL,'2026-07-04 15:45:13','2026-07-04 15:45:13'),(2,'App\\Models\\User',21,'https://updates.push.services.mozilla.com/wpush/v2/gAAAAABqSSsHGZiFy9_EsPE13om7THGE6XQ41emd2B7DceKGTkDqzuADPctA_amLesX8rV-8KaY_JnHkXHIqOEdM2cYlu5UrEy-QYLf9K5kwGUZ0hgpkZPsB6fOvKIKosfZzcLgjMS7veC7hOsCX3U6n_pZH1xhYNiDRGuTttWYsfj0mkod_qtw','BBRQFXZN0dxA5wEEy-zqXGFDyf85jTmhNDTL_-QbVHUvo_cTn4iMYWjSRx3kmkT-HByTPFzu2yEN5tksCi0jIIQ','si6B-flzgMOgXCXls3WWDg',NULL,'2026-07-04 15:47:24','2026-07-04 15:47:24'),(4,'App\\Models\\User',21,'https://updates.push.services.mozilla.com/wpush/v2/gAAAAABqS0UyWrstjSxYX-Vgz5dkk-3LY259Q0kEHd-KUFomoOk3B-d686hRkcEmcCjrn-KZ7vKaQHhz-otilyjG8FRy-qFT5WU-L6p_l0zoh7fx8ekO9FbNlUbjOwr-8cC34Z8V2GjcF99GOmKR3LJ2jSUfkEKI494-Ggen93vVv6slNTlZDb4','BGLVhsg-psYYHKXK0wgJFogs0C50CRqAWjp06oBLlVD4wcuXH2B_oY6UdRU2WzPL4G76Z7wiExOUKJFuLrGNRCs','ID9yuW6qSJTZOgi7KFOTZA',NULL,'2026-07-06 06:03:32','2026-07-06 06:03:32'),(10,'App\\Models\\User',18,'https://fcm.googleapis.com/fcm/send/ccqOHGOItzs:APA91bHJWZhAbpUISgB-cG2qx8mOS7DrjnCAtVrs_YgShQnCGyFAb3HYZKm6KPDR4LnfMW44IIAox8WbtoQn-8fxW4NsJi2p8qOW8kVCh1kComOxLoQ_qNw6oSyGwNIGBUx51atyw_XC','BEWbHe2PhLyFcfyDv17DLA_Fe9gcPR4PeAQPrX4ANaj6hrnMv0Vt1V86hCSpnNqlI1wrcsGZmLiMPyZU8TkH8RA','Cv8nza-584cyldoMwzPi_A',NULL,'2026-07-17 09:58:45','2026-07-17 09:58:45'),(11,'App\\Models\\User',1,'https://updates.push.services.mozilla.com/wpush/v2/gAAAAABqSy8ZmK0AsH2SiIAgl2raBvKe9XV66D8ZmyA6UUiCN1O_yLS5TQkXO5ZeRi1lDrBkwMvc1zRcf19-sIXm9V10dq6meQqcWhSK5gLvM6HYimQetOoc3jUkqnEHX1u8fGhB8B9CwrPg7yV-TLqivShHbjcHOBX37YiNV1b2mhDiqD8Qzag','BHD8e1zii4HR3iWNF1pBBXZ6XHs0L-68Cqns8IS9An3SDmI5XuszOuxjLgn8e33ukC76K565hs9Ws7wJXQBaNXk','YWseCUqy6bJ0ipEtf_fN8g',NULL,'2026-07-17 10:27:41','2026-07-17 10:27:41');
/*!40000 ALTER TABLE `push_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_permissions_role_id_permission_id_unique` (`role_id`,`permission_id`),
  KEY `role_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=930 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES (760,14,39,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(761,14,40,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(762,14,41,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(763,14,42,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(764,14,45,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(765,14,43,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(766,14,47,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(767,14,38,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(768,14,44,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(769,14,46,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(770,14,16,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(771,14,14,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(772,14,15,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(773,14,31,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(774,14,33,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(775,14,32,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(776,14,48,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(777,14,9,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(778,14,5,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(779,14,1,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(780,14,10,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(781,14,13,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(782,14,4,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(783,14,6,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(784,14,2,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(785,14,7,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(786,14,12,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(787,14,3,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(788,14,11,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(789,14,8,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(790,14,20,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(791,14,21,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(792,14,26,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(793,14,25,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(794,14,22,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(795,14,23,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(796,14,24,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(797,14,18,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(798,14,17,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(800,14,36,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(801,14,34,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(802,14,37,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(803,14,35,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(804,14,27,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(805,14,28,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(806,1,39,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(807,1,40,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(808,1,41,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(809,1,42,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(810,1,45,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(811,1,43,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(812,1,47,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(813,1,38,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(814,1,44,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(815,1,46,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(816,1,16,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(817,1,14,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(818,1,15,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(819,1,31,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(820,1,33,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(821,1,32,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(822,1,48,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(823,1,9,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(824,1,5,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(825,1,1,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(826,1,10,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(827,1,13,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(828,1,4,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(829,1,6,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(830,1,2,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(831,1,7,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(832,1,12,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(833,1,3,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(834,1,11,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(835,1,8,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(836,1,20,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(837,1,21,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(838,1,26,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(839,1,25,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(840,1,22,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(841,1,23,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(842,1,24,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(843,1,18,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(844,1,17,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(846,1,36,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(847,1,34,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(848,1,37,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(849,1,35,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(850,1,27,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(851,1,28,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(852,11,16,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(853,11,14,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(854,11,9,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(855,11,5,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(856,11,10,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(857,11,13,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(858,11,12,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(859,11,11,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(860,15,16,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(861,15,14,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(862,15,15,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(863,15,31,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(864,15,33,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(865,15,32,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(866,15,9,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(867,15,5,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(868,15,10,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(869,15,13,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(870,19,16,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(871,19,14,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(872,19,33,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(873,19,32,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(874,19,9,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(875,19,5,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(876,19,10,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(877,19,13,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(878,19,12,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(879,19,11,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(880,19,17,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(881,18,33,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(882,18,32,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(883,18,9,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(884,18,5,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(885,18,10,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(886,18,13,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(887,18,4,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(888,18,6,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(889,18,7,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(890,18,12,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(891,18,11,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(892,18,8,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(893,18,17,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(894,2,48,'2026-07-04 14:55:55','2026-07-04 14:55:55'),(895,1,49,'2026-07-07 05:24:36','2026-07-07 05:24:36'),(896,1,50,'2026-07-07 05:24:36','2026-07-07 05:24:36'),(897,1,51,'2026-07-07 05:24:36','2026-07-07 05:24:36'),(898,1,52,'2026-07-07 05:24:36','2026-07-07 05:24:36'),(899,1,53,'2026-07-07 05:24:36','2026-07-07 05:24:36'),(904,14,58,NULL,NULL),(905,14,59,NULL,NULL),(906,1,58,NULL,NULL),(907,1,59,NULL,NULL),(908,18,59,NULL,NULL),(909,2,14,NULL,NULL),(910,3,14,NULL,NULL),(911,17,14,NULL,NULL),(912,16,14,NULL,NULL),(913,5,14,NULL,NULL),(914,4,14,NULL,NULL),(915,2,27,NULL,NULL),(916,2,28,NULL,NULL),(917,11,60,NULL,NULL),(918,2,60,NULL,NULL),(919,14,60,NULL,NULL),(920,1,60,NULL,NULL),(921,2,61,'2026-07-17 06:34:35','2026-07-17 06:34:35'),(922,14,61,'2026-07-17 06:34:35','2026-07-17 06:34:35'),(923,15,61,'2026-07-17 06:34:35','2026-07-17 06:34:35'),(924,19,61,'2026-07-17 06:34:35','2026-07-17 06:34:35'),(925,1,61,'2026-07-17 06:34:35','2026-07-17 06:34:35'),(926,2,62,'2026-07-17 06:34:35','2026-07-17 06:34:35'),(927,14,62,'2026-07-17 06:34:35','2026-07-17 06:34:35'),(928,15,62,'2026-07-17 06:34:35','2026-07-17 06:34:35'),(929,1,62,'2026-07-17 06:34:35','2026-07-17 06:34:35');
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  `role_code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_role_name_unique` (`role_name`),
  UNIQUE KEY `roles_role_code_unique` (`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Super Admin','SUPER_ADMIN','Full system access',1,'2026-07-02 06:34:30','2026-07-02 06:34:30'),(2,'Admin','ADMIN','System Administrator',1,'2026-07-02 06:34:30','2026-07-02 06:34:30'),(3,'HR','HR','Human Resources',1,'2026-07-02 06:34:30','2026-07-02 06:34:30'),(4,'Sales Manager','SALES_MANAGER','Sales Team Manager',1,'2026-07-02 06:34:30','2026-07-02 06:34:30'),(5,'Sales Executive','SALES_EXECUTIVE','Sales Executive',1,'2026-07-02 06:34:30','2026-07-02 06:34:30'),(6,'Marketing Manager','MARKETING_MANAGER','Marketing Manager',1,'2026-07-02 06:34:30','2026-07-02 06:34:30'),(7,'Marketing Executive','MARKETING_EXECUTIVE','Marketing Executive',1,'2026-07-02 06:34:30','2026-07-02 06:34:30'),(8,'Trainer','TRAINER','Trainer',1,'2026-07-02 06:34:30','2026-07-02 06:34:30'),(9,'Student Counselor','STUDENT_COUNSELOR','Student Counselor',1,'2026-07-02 06:34:30','2026-07-02 06:34:30'),(10,'Support Executive','SUPPORT_EXECUTIVE','Support Executive',1,'2026-07-02 06:34:30','2026-07-02 06:34:30'),(11,'Accountant','ACCOUNTANT','Accounts Department',1,'2026-07-02 06:34:30','2026-07-02 06:34:30'),(12,'Employee','EMPLOYEE','General Employee',1,'2026-07-02 06:34:30','2026-07-02 06:34:30'),(14,'Head Of Operations','HEAD_OF_OPERATIONS','Oversees overall company operations',1,'2026-07-02 15:29:48','2026-07-02 15:29:48'),(15,'HR Manager','HR_MANAGER','Manages HR team and lead assignments',1,'2026-07-02 15:29:48','2026-07-02 15:29:48'),(16,'HR - Team Lead','HR_TEAM_LEAD','Leads a team of HR executives',1,'2026-07-02 15:29:48','2026-07-02 15:29:48'),(17,'HR Admin','HR_ADMIN','Handles HR administrative tasks',1,'2026-07-02 15:29:48','2026-07-02 15:29:48'),(18,'Social Media Manager','SOCIAL_MEDIA_MANAGER','Manages social media presence',1,'2026-07-02 15:29:48','2026-07-02 15:29:48'),(19,'Media Strategist','MEDIA_STRATEGIST','Runs ad campaigns and adds leads',1,'2026-07-02 15:29:48','2026-07-02 15:29:48'),(20,'Data Engineer Trainer','DATA_ENGINEER_TRAINER','Trains students in data engineering',1,'2026-07-02 15:29:48','2026-07-02 15:29:48'),(21,'Tech Manager','TECH_MANAGER','Manages the technical team',1,'2026-07-02 15:29:48','2026-07-02 15:29:48'),(22,'Tech Mentor','TECH_MENTOR','Mentors students on technical topics',1,'2026-07-02 15:29:48','2026-07-02 15:29:48');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('01J8yqXEQRabTdDSopJQ4DQabYkjECLf5W7gikQu',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM0M4bXZ1VlhvVTdIbEkzQmU5TWo5N0k0WFB1SExyNDVrTTFGUTRQOCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2xlYWRzLzI3Ijt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMDoibG9naW4uc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1784280479),('7hxxeVxAj3FeTbFNRMbpjaOaPaSWTkpmi7v7RidX',18,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSEV1RTBqSXR5eFhhcHZmamdJbWlVQTh5clZoakRBaktUelhiekMwRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jaGF0LzUvbWVzc2FnZXMvcG9sbD9hZnRlcl9pZD00OSI7czo1OiJyb3V0ZSI7czoxODoiY2hhdC5tZXNzYWdlcy5wb2xsIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTg7fQ==',1784286342),('EuMTJq5W9fG45j5cNGVlIoLIKgboB3sp4imFSBLD',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjUwWWR0djVYeUxEQTBISHp6NlBYeldQMElJTTlxQ2ROMVhyVHZYOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMDoibG9naW4uc2hvdyI7fX0=',1784279801),('JHe1rLYHVyLj8d25ec6Nz4S7sFH8yfD08rGIFC9R',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoidTZ6OFladkNzSXJoRzhTMzRsRDJWemlQVUo2TnZGcFZLUndmN1hheCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jaGF0LzUvbWVzc2FnZXMvcG9sbD9hZnRlcl9pZD00OSI7czo1OiJyb3V0ZSI7czoxODoiY2hhdC5tZXNzYWdlcy5wb2xsIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9',1784287288),('YLax4FNEeNnSJcRwm7c6MjqdVL9qJ2Ay0JflKTVr',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUzVEd0tzUTU2cVpmNnNsbHBwVFFTWVRuNnJNakFUbmo5aDVTNWNpdyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MToiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2NoYXQ/Y29udmVyc2F0aW9uPTQiO31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyNzoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2xvZ2luIjtzOjU6InJvdXRlIjtzOjEwOiJsb2dpbi5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1784280497);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_accounts`
--

DROP TABLE IF EXISTS `social_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `platform` enum('instagram','youtube','linkedin') NOT NULL DEFAULT 'instagram',
  `label` varchar(255) NOT NULL,
  `ig_user_id` varchar(255) DEFAULT NULL,
  `channel_id` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `profile_picture_url` text DEFAULT NULL,
  `biography` text DEFAULT NULL,
  `following_count` int(10) unsigned DEFAULT NULL,
  `followers_count` bigint(20) unsigned DEFAULT NULL,
  `access_token` text NOT NULL,
  `refresh_token` text DEFAULT NULL,
  `token_expires_at` timestamp NULL DEFAULT NULL,
  `last_synced_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `last_error` text DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_accounts_created_by_foreign` (`created_by`),
  CONSTRAINT `social_accounts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_accounts`
--

LOCK TABLES `social_accounts` WRITE;
/*!40000 ALTER TABLE `social_accounts` DISABLE KEYS */;
INSERT INTO `social_accounts` VALUES (2,'instagram','Krish Personal','37644210048499313',NULL,'drkrishbharggav6666','MEDIA_CREATOR','https://scontent.cdninstagram.com/v/t51.82787-19/616172023_18551678605059790_7845932485370873259_n.jpg?stp=dst-jpg_s206x206_tt6&_nc_cat=110&ccb=7-5&_nc_sid=bf7eb4&efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLnd3dy4xMDgwLkMzIn0%3D&_nc_ohc=dpFLWwqTdwgQ7kNvwHUmWw7&_nc_oc=AdpXd7sA89DXYR4iQVkxriViEjBzxM6H7FJH-iXBzOmC0atziPorTgWofX2odUDKsuc&_nc_zt=24&_nc_ht=scontent.cdninstagram.com&edm=AP4hL3IEAAAA&_nc_gid=JEAOMd-OUGUuSe4Y8gYjIQ&_nc_tpa=Q5bMBQHho-OECQAZx-v-jozMrRmYUcbBi5_r2c8RIhHiW16FJDgqsu8uH__8aIQI5-YcgmHiizJDUrvZEg&oh=00_AQA1IwmMHh2cVXaW88RCB0zpBKaDkcQ9TpW0itDw0K1TsA&oe=6A5F95F4','A page dedicated for human values and emotions.  \nFounder @taurus_ai & @browsejobs_6666  & @theofferletter6\nMama\'s boy forever!',869,162259,'eyJpdiI6Ik1IS3pBMnpSVHZkOU14RWE0WFB4ZVE9PSIsInZhbHVlIjoiTnNwb1hEL1ZMSGJuNDVmbytVMHZTQlNDT2M0T0tuMm5pL3drUVlicGNZb2xxdlU5eUZZdEtJcC9lMWozMUEyMy9Ya2VjMmVjSHhqSW41cWp4QUxTNVQ5cmdnUmZMSjh0SEorTjVwTGlvU2VoeUFoc0xYelE5SHpZeTFMNlg2ZlhBU2ErWDQ2elpLbTBmVndxV0U3eWx0WWhmOUxGTG5GN3RjOTUraUs2U2ZtcHF5Mm1lWTRVY0xTL0tvK0QvTWNZc3BLUWRMMTFuUXRzVXA0LzFXV3NjTlQzU3FuOXAwWlpDUUNFN252eThrNEhtMlZzV0VZTGc3SVJjTVM1NVFyYyIsIm1hYyI6IjMxYjJkNjlhYTc4OGNhZGM0MTA0NWM1ZmNmODcxYjQzYTk4Y2YyYjY4OTM1YzU5ZjcxYWY3YWQwNzIxNmIxZjYiLCJ0YWciOiIifQ==',NULL,NULL,'2026-07-17 04:55:37',1,NULL,1,'2026-07-06 08:03:36','2026-07-17 04:55:37'),(3,'instagram','The offer letter','27488886024101191',NULL,'theofferletter6','MEDIA_CREATOR','https://scontent.cdninstagram.com/v/t51.82787-19/683688805_18121153342566765_4727707177300800385_n.jpg?stp=dst-jpg_s206x206_tt6&_nc_cat=103&ccb=7-5&_nc_sid=bf7eb4&efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLnd3dy4xMDgwLkMzIn0%3D&_nc_ohc=N4rMxYNRukgQ7kNvwFJXzMe&_nc_oc=Adphizygk7ZpRN6Qiup2mRn-nAf9w-p4Sgvncs7bRnD-pOH185Y7i8_hfvryJKhTF8I&_nc_zt=24&_nc_ht=scontent.cdninstagram.com&edm=AP4hL3IEAAAA&_nc_gid=_kIpUHrmNZF99bgll-WusQ&_nc_tpa=Q5bMBQGzSotK7xM3yTa4g-CByd8x7bB5jwlJKf0rOtkMx3dW3tnR6FaKLgcZG2jyU0NBIU3vRAa4dXzEHg&oh=00_AQB5ghnwjOnewXIpbamSJQqwjJqpGMDxCx8bqeRRoAqrKw&oe=6A5F899E','Where offers are earned.\nCHROs, CEOs & Founders. Unfiltered. Unapologetic\n🎙️@drkrishbharggav6666 | CEO, Browsejobs, Taurus AI\n📺 New ep every week ↓',25,2686,'eyJpdiI6IlBRY3hjRjUxSEkwSGx0Skg2MlVPR1E9PSIsInZhbHVlIjoidXFrY0c4ZEt3QWpmRHplc1VWcmpwSmt0NEdlbDJrV0orSUVyeFZYWnFPTXJ5QWM2MEVtSmhhWU83Z1FjL3FJT3BmZ215SmVYNFpxZVc2bUJhbFNXeVFQdDVTL24zOENZVmhkRHlYWGx0cnJPKy95UndMY0d3VzBHTEpvdlgwM0ZMT21oTVVOVFNxL01tZVZvNHZqeDNKY1NqTmtvRm0yTjc0T1dnblRLYUtxWnZ5MGRPMEJhRWpUc0xwQlF4RklSK0psVVZXbU9OVGtPVEIzOW1DY0I1em94NmYzczJVeWxaNTdtblVmWStNSnZVTUZ3WmJHWWZCMUJnbGcwbmQ0KyIsIm1hYyI6IjM3NWZhYTc5NGE3ZWFlZTY5YTQ0YWIyNjcwZWVhYzJlOTc5MDk5ZmE0NWU2NTY0NTBmMTAwZjFhMWI2MzZjYTciLCJ0YWciOiIifQ==',NULL,NULL,'2026-07-17 04:55:42',1,NULL,1,'2026-07-06 08:04:21','2026-07-17 04:55:42'),(4,'instagram','Browsejobs','27660677360211322',NULL,'browsejobs_6666','MEDIA_CREATOR','https://scontent.cdninstagram.com/v/t51.2885-19/409344802_3611604122492242_4313746897220759078_n.jpg?stp=dst-jpg_s206x206_tt6&_nc_cat=107&ccb=7-5&_nc_sid=bf7eb4&efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLnd3dy4xMDgwLkMzIn0%3D&_nc_ohc=gR_RppydaKgQ7kNvwEEonC1&_nc_oc=AdpcYC9CGTXK0c1Ot96Q0VCtbSLx9dSNpeSMQ39a_af1wAMaMSQXnDhjGDELBFQZqP8&_nc_zt=24&_nc_ht=scontent.cdninstagram.com&edm=AP4hL3IEAAAA&_nc_tpa=Q5bMBQG_GIrx2IKc08XBMEr7UOnTct3YmrVeXLGwbdgO9Iaa-NpJiZBIh5dMdnhJFncNm51MhwnCV6j9kA&oh=00_AQBOzezkJq90kvWyMEDPbwQyfuqUlBZOCHor3tN2ny5ajA&oe=6A5F7B79','India\'s #1 Platform in Tech Upskilling​\nFrom Non-Tech to Tech | 1L+ Alumni | 1000+ Companies \nCourses, Mock Interviews & Job Leads \nStart Today!',33,10456,'eyJpdiI6IjY2emgxaW05YXZOT3NyL2V1RXp0anc9PSIsInZhbHVlIjoicGhsR3ViYXRXU0dTT2hYd1NBcUFobUM0RGl1MDRHK05HcFhTSk9MOW1ac2lHRUMzaC9HWURRbkhHUGpWcitORWt3RFd6QTN1OWFtTVJOZFNWS3ZHVUpRbVBhZGNnWkdRVG1rZ0tNQjJKVGlWd3VZR0JJQWUydVQ0NTNKQmxoZjFrY2R6eUc2SmcxUTlzVnllaHVHQng0Z2NkaFRnTWZBZWg2bVowYXBSVDROcSsxZ29FOTNLOWtWQzdKckhJWTd5M2xhOEV6N1RKZ0NQY1o0WjN1ZDNET2drMTBKRHI4VVNMOFdKS0FmV0dLck54TTVIN1UvL1BxWUw2NVJyNkVJMCIsIm1hYyI6ImQzODE1M2M2ZDhkYjQwN2U0NWZmZmQxMGRhNGY3MTJkYjYwYjA0ODdlN2FjZTcyMDQ3N2UzYTAyMjZhOGY3N2EiLCJ0YWciOiIifQ==',NULL,NULL,'2026-07-17 04:55:31',1,NULL,1,'2026-07-06 08:04:57','2026-07-17 04:55:31'),(6,'youtube','The Offer Letter with Dr. Krish Bharggav',NULL,'UClTUoH9pkYdDcCxBbAI7kLg','The Offer Letter with Dr. Krish Bharggav',NULL,'https://yt3.ggpht.com/VbfqLYO69tmlWaN0LIf7knLDNrhtt_kUF1o6TUElmwG2j3hK3Oblkzj042yTcdK7I-rkd4HQpTU=s88-c-k-c0x00ffffff-no-rj','The Offer Letter | Hosted by Dr. Krish Bharggav. A podcast where India\'s top business leaders tell the story that never makes it onto the resume. \n\nThe real version — the failures, the pivots, the decisions that kept them up at night.\n\nHosted by Dr. Krish Bharggav  entrepreneur, talent disruptor, and founder of BrowseJobs and Taurus AI sitting across from the CEOs, CHRO\'s, and Founders actually building India\'s workforce. \n\nAsking the questions everyone else is too polished to ask.These guests have managed thousands of people, survived industry collapses, and built companies from scratch. \n\nThey\'re here to tell you exactly how they did it. And what they wish someone had told them. No scripts. No PR answers. No carefully managed narratives. \n\nJust two people in a room and the truth between them.New episodes every week.\n\n Subscribe so you don\'t miss a conversation that could change how you think about your career.\n\n\n🎙️ The Offer Letter — India\'s most honest career conversations.\n',207,294,'eyJpdiI6IlNkRCt6YVdlUFBqQTdqZXdHbzlIaGc9PSIsInZhbHVlIjoiNUdKZi8rbys3N3lITHpBcGdtdGVTczg5QW1DNElEMjZOV3F6cExrQmVaOGtHRWswVm9aRy9YTW0yaitQU2xiTiIsIm1hYyI6ImMwYmUzOWVkOTQzMjAwZGJkY2JhNDI4NjE2M2YyZTJiZjQ3NGVlNGJiM2E4YmJlYWM2ZTQ1M2FhOTRhYjU0ZmMiLCJ0YWciOiIifQ==',NULL,NULL,'2026-07-16 06:51:43',1,NULL,1,'2026-07-06 08:55:00','2026-07-16 07:24:41');
/*!40000 ALTER TABLE `social_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_alert_settings`
--

DROP TABLE IF EXISTS `social_alert_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_alert_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `platform` enum('instagram','youtube','linkedin') NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_alert_settings_user_id_platform_unique` (`user_id`,`platform`),
  CONSTRAINT `social_alert_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_alert_settings`
--

LOCK TABLES `social_alert_settings` WRITE;
/*!40000 ALTER TABLE `social_alert_settings` DISABLE KEYS */;
INSERT INTO `social_alert_settings` VALUES (1,1,'instagram',1,'2026-07-16 06:52:29','2026-07-16 06:52:32');
/*!40000 ALTER TABLE `social_alert_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_media_posts`
--

DROP TABLE IF EXISTS `social_media_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_media_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `social_account_id` bigint(20) unsigned NOT NULL,
  `platform` varchar(255) NOT NULL,
  `external_post_id` varchar(255) NOT NULL,
  `caption` text DEFAULT NULL,
  `media_type` varchar(255) DEFAULT NULL,
  `permalink` varchar(255) DEFAULT NULL,
  `thumbnail_url` varchar(1024) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `likes` bigint(20) unsigned DEFAULT NULL,
  `comments` bigint(20) unsigned DEFAULT NULL,
  `shares` bigint(20) unsigned DEFAULT NULL,
  `views` bigint(20) unsigned DEFAULT NULL,
  `raw_payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`raw_payload`)),
  `metrics_synced_at` timestamp NULL DEFAULT NULL,
  `notified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_media_posts_social_account_id_external_post_id_unique` (`social_account_id`,`external_post_id`),
  KEY `social_media_posts_platform_index` (`platform`),
  CONSTRAINT `social_media_posts_social_account_id_foreign` FOREIGN KEY (`social_account_id`) REFERENCES `social_accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_media_posts`
--

LOCK TABLES `social_media_posts` WRITE;
/*!40000 ALTER TABLE `social_media_posts` DISABLE KEYS */;
INSERT INTO `social_media_posts` VALUES (1,2,'instagram','18123828877704853','When evil rose, the world cried for hope.\nTo defeat adharma, dharma took human form.\nPresenting a cinematic vision of THE RAMAYANA.\nComing Soon. Jai Shree Ram.\n\n#TheRamayana #RamayanaTeaser #JaiShreeRam #DharmaVsAdharma #LordRam #ShreeRam #Hanuman #Ravana #SitaMaa #IndianMythology #MythologicalCinema #CinematicTeaser #AIcinema #EpicTrailer #SanatanDharma #RamayanaSeries #ComingSoon','VIDEO','https://www.instagram.com/reel/Da1r0LiPjkk/','https://scontent.cdninstagram.com/v/t51.82787-15/747105282_18605315185059790_7098495602905240233_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=110&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=wOs5gGnC_wUQ7kNvwEtH3v0&_nc_oc=Adov3kkrL91Arp_0B62pT9fu-WVhuNu6Ff_wje6YMhixzvrKjqWWoGl-mb-mSAvneto&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQGAaKP-Ujvm5MhjuHtxy6NcY_iK2kCXutwysHUud5TA5XWORnv1wCqC5hAPvEz6CDnlQ-VaKVKp9g&oh=00_AQBp0FMhxi_B7Oi-hiJpVLhdBjm-5-mHNXgvgE0M8OE-3w&oe=6A5E71A4','2026-07-15 22:06:32',16,2,NULL,NULL,'{\"id\":\"18123828877704853\",\"caption\":\"When evil rose, the world cried for hope.\\nTo defeat adharma, dharma took human form.\\nPresenting a cinematic vision of THE RAMAYANA.\\nComing Soon. Jai Shree Ram.\\n\\n#TheRamayana #RamayanaTeaser #JaiShreeRam #DharmaVsAdharma #LordRam #ShreeRam #Hanuman #Ravana #SitaMaa #IndianMythology #MythologicalCinema #CinematicTeaser #AIcinema #EpicTrailer #SanatanDharma #RamayanaSeries #ComingSoon\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/Da1r0LiPjkk\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/747105282_18605315185059790_7098495602905240233_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=110&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=wOs5gGnC_wUQ7kNvwEtH3v0&_nc_oc=Adov3kkrL91Arp_0B62pT9fu-WVhuNu6Ff_wje6YMhixzvrKjqWWoGl-mb-mSAvneto&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQGAaKP-Ujvm5MhjuHtxy6NcY_iK2kCXutwysHUud5TA5XWORnv1wCqC5hAPvEz6CDnlQ-VaKVKp9g&oh=00_AQBp0FMhxi_B7Oi-hiJpVLhdBjm-5-mHNXgvgE0M8OE-3w&oe=6A5E71A4\",\"media_url\":\"https:\\/\\/instagram.fblr22-2.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQNYMokGuPPAzR2jvR3ulNjkeSC-_zJothT8FENGFT6dqB8YYSC_djszvwq1SELHtqWH80Pkwa8K--BcY7B4j78x0tnysM29VRG-xk0.mp4?_nc_cat=104&_nc_oc=AdoGScUImptvmcy3sjsvJ0DwyHn9Lx_0vf2KHvQLdn_gnX_zobQopgC4aehyVKKAowI&_nc_sid=5e9851&_nc_ht=instagram.fblr22-2.fna.fbcdn.net&_nc_ohc=bQpMEVg9LgsQ7kNvwEzUfZa&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTU0NzAwNzMyMDIwNDIzMiwiYXNzZXRfYWdlX2RheXMiOjAsInZpX3VzZWNhc2VfaWQiOjEwMDk5LCJkdXJhdGlvbl9zIjozNiwidXJsZ2VuX3NvdXJjZSI6Ind3dyJ9&ccb=17-1&vs=28ea31b4726ec7f8&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC8xRjQ1RjY4QzI5MEI3MkIzN0NFMDk5QTE4MjIyMTA5OF92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyL0NENEUwMEM4RUNDQzBBMTVDOTJBQjY2RTVBMDBGNEI3X2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACaQj8nc1r-_BRUCKAJDMywXQEId0vGp--cYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQEik9Sn1Dj6ycslF-i4t6LFmKiyHnrSCtwP4NR1hKlI1TCHHUfLOUxeokb1ejunJa9u7LSubbssgQ&oh=00_AQCf9FjolV3MEiwmvEXAwfNEDTzrtJDCMR8plgHouqa5-A&oe=6A5A4AC9\",\"timestamp\":\"2026-07-16T03:36:32+0000\",\"like_count\":16,\"comments_count\":2}','2026-07-16 07:24:38',0,'2026-07-16 07:24:38','2026-07-16 07:24:38'),(2,2,'instagram','17881534023665560','डर कैसा…\nजब साथ महाकाल का हो। 🔥🔱\n\nजिसके सिर पर हाथ महादेव का हो,\nउसकी ज़िंदगी में डर की कोई जगह नहीं।\n\n#Mahakal #MahadevStatus #LordShiva #ShivShakti #SanatanDharma #Shiva #MahadevEdit #SpiritualReels #DivineEnergy #OmNamahShivaya #LordShiva #Mahadev #DivineVibes #Spirituality #ShivaReels','VIDEO','https://www.instagram.com/reel/DZxe_avPtGV/','https://scontent.cdninstagram.com/v/t51.82787-15/726620952_18596937913059790_834997833174297075_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=111&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=156wYvNnNKUQ7kNvwGGQuSS&_nc_oc=AdoeB6_XN_6nFQxeZwEt5K0UfKlA__Jg7Cm8-54LnznwcDMk2uRfYVBJUb3sRQimRjE&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQE3dM8KyJyayCgMm6khtRTyqhKZraYXh-6AM8U6C_J4314NH3_Xh8TOxxd29xj_8trGFfPJr2VCFw&oh=00_AQDfta8FmfScLlFwMP7q3cXobxgbxIbFVE_QYkUbz2ZuMg&oe=6A5E58BB','2026-06-19 10:24:35',62,3,NULL,NULL,'{\"id\":\"17881534023665560\",\"caption\":\"\\u0921\\u0930 \\u0915\\u0948\\u0938\\u093e\\u2026\\n\\u091c\\u092c \\u0938\\u093e\\u0925 \\u092e\\u0939\\u093e\\u0915\\u093e\\u0932 \\u0915\\u093e \\u0939\\u094b\\u0964 \\ud83d\\udd25\\ud83d\\udd31\\n\\n\\u091c\\u093f\\u0938\\u0915\\u0947 \\u0938\\u093f\\u0930 \\u092a\\u0930 \\u0939\\u093e\\u0925 \\u092e\\u0939\\u093e\\u0926\\u0947\\u0935 \\u0915\\u093e \\u0939\\u094b,\\n\\u0909\\u0938\\u0915\\u0940 \\u091c\\u093c\\u093f\\u0902\\u0926\\u0917\\u0940 \\u092e\\u0947\\u0902 \\u0921\\u0930 \\u0915\\u0940 \\u0915\\u094b\\u0908 \\u091c\\u0917\\u0939 \\u0928\\u0939\\u0940\\u0902\\u0964\\n\\n#Mahakal #MahadevStatus #LordShiva #ShivShakti #SanatanDharma #Shiva #MahadevEdit #SpiritualReels #DivineEnergy #OmNamahShivaya #LordShiva #Mahadev #DivineVibes #Spirituality #ShivaReels\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DZxe_avPtGV\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/726620952_18596937913059790_834997833174297075_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=111&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=156wYvNnNKUQ7kNvwGGQuSS&_nc_oc=AdoeB6_XN_6nFQxeZwEt5K0UfKlA__Jg7Cm8-54LnznwcDMk2uRfYVBJUb3sRQimRjE&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQE3dM8KyJyayCgMm6khtRTyqhKZraYXh-6AM8U6C_J4314NH3_Xh8TOxxd29xj_8trGFfPJr2VCFw&oh=00_AQDfta8FmfScLlFwMP7q3cXobxgbxIbFVE_QYkUbz2ZuMg&oe=6A5E58BB\",\"media_url\":\"https:\\/\\/instagram.fblr22-2.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQPDs33LuuwKxT_9e5lcus1d0m63w8gfF5n4V8j41iYepWGFFgl6bywWzbw6Yp1Itt5-2NxI4Fn4IChPChubrec0xk4rAtvOR_aUmd4.mp4?_nc_cat=104&_nc_oc=AdopHTBHmnv2KcQt9rCb4SsCtSRiR6c9B0FjcNd0lVIDyMixxFfNO6tS47HTNWVbmHc&_nc_sid=5e9851&_nc_ht=instagram.fblr22-2.fna.fbcdn.net&_nc_ohc=YcB__8RXg4sQ7kNvwF1izjj&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTU2NDAyNTQyMTc0OTgxMywiYXNzZXRfYWdlX2RheXMiOjI2LCJ2aV91c2VjYXNlX2lkIjoxMDA5OSwiZHVyYXRpb25fcyI6MjYsInVybGdlbl9zb3VyY2UiOiJ3d3cifQ%3D%3D&ccb=17-1&vs=97f11b8d56b1b4fe&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC8zMjQ3QkY4MERBQzc4QUY4N0ZCMkY1MDU3NTY0MjdCMF92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzMwNEQzNzczMzFDQTM5Mjc0OTgwQzVFRDI3MkVBQkI3X2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACbq-Pa6oZ7HBRUCKAJDMywXQDrMzMzMzM0YEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQFZTF3coXFEiQxa_q4vvHbpfOUZfaGCIRn13mKePbOVbqGHYmXzBlT0om9eFnxBAIA6gK4w-vxNtA&oh=00_AQAE3LQYdO4d07f-9eUrlIWQY7nEiazM61Eq9oRnubxnZQ&oe=6A5A739D\",\"timestamp\":\"2026-06-19T15:54:35+0000\",\"like_count\":62,\"comments_count\":3}','2026-07-16 07:24:38',0,'2026-07-16 07:24:38','2026-07-16 07:24:38'),(3,2,'instagram','18014997620855993','When devotion becomes strength, even the smallest soul receives divine power.\nMushika doesn’t become powerful through ego… he becomes powerful through surrender.\n\nBlessings don’t always arrive loudly.\nSometimes, they wrap around you quietly and lift you higher.\n\nJai Shree Ganesh 🙏✨\n\n#JaiShreeGanesh #GanpatiBappaMorya #LordGanesha #ShreeGanesh #Mushika #GaneshDevotion #DivineBlessing #SpiritualAnimation #MythologyReimagined #IndianMythology #AIAnimation #AIVideo #CinematicAI #DevotionalVideo #Bhakti #SanatanDharma #AryanKelvin #SpiritualJourney #DivineGrace #GaneshChaturthi #GoosebumpsMoment','VIDEO','https://www.instagram.com/reel/DZsUQUhvCJT/','https://scontent.cdninstagram.com/v/t51.82787-15/724068248_18596322982059790_97133642817394763_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=104&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=3YQe0IusUdIQ7kNvwHrPmlm&_nc_oc=Ado2XLsSJSaNwUOcq7jaGWh8rEzRf9x9APIIqmzU8PGzgZKLVGVHnQ-LlKllJJLzJ_c&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQH7KF_B1kTL7SBk3dpC7_3yrBaQy5IR8isBJHejrxN1kju-VxRGeuoYRoMSJ_d6So90hAJRjkReOA&oh=00_AQCuzu7iTali8BFYMVl8zbRDrm8GeFAVxnG8j2lxT7g5UA&oe=6A5E6E39','2026-06-17 10:14:47',107,1,NULL,NULL,'{\"id\":\"18014997620855993\",\"caption\":\"When devotion becomes strength, even the smallest soul receives divine power.\\nMushika doesn\\u2019t become powerful through ego\\u2026 he becomes powerful through surrender.\\n\\nBlessings don\\u2019t always arrive loudly.\\nSometimes, they wrap around you quietly and lift you higher.\\n\\nJai Shree Ganesh \\ud83d\\ude4f\\u2728\\n\\n#JaiShreeGanesh #GanpatiBappaMorya #LordGanesha #ShreeGanesh #Mushika #GaneshDevotion #DivineBlessing #SpiritualAnimation #MythologyReimagined #IndianMythology #AIAnimation #AIVideo #CinematicAI #DevotionalVideo #Bhakti #SanatanDharma #AryanKelvin #SpiritualJourney #DivineGrace #GaneshChaturthi #GoosebumpsMoment\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DZsUQUhvCJT\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/724068248_18596322982059790_97133642817394763_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=104&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=3YQe0IusUdIQ7kNvwHrPmlm&_nc_oc=Ado2XLsSJSaNwUOcq7jaGWh8rEzRf9x9APIIqmzU8PGzgZKLVGVHnQ-LlKllJJLzJ_c&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQH7KF_B1kTL7SBk3dpC7_3yrBaQy5IR8isBJHejrxN1kju-VxRGeuoYRoMSJ_d6So90hAJRjkReOA&oh=00_AQCuzu7iTali8BFYMVl8zbRDrm8GeFAVxnG8j2lxT7g5UA&oe=6A5E6E39\",\"media_url\":\"https:\\/\\/instagram.fblr22-2.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQMsMIMPLopop-LFRp8Kx3KriLoP1O3X9aw0ACgqsDOaNqrVb7o8TJbZPdPVy7cFarlzuyL0hYCGbyk7yIdgmiy20fL6Sn5xsb0J2O4.mp4?_nc_cat=104&_nc_oc=AdqBb4tWbq5xGz0ag83XgTTotoZFnRbx9mH-QXOcSu-BOiszXsxKs-51GdKK1DVXVTk&_nc_sid=5e9851&_nc_ht=instagram.fblr22-2.fna.fbcdn.net&_nc_ohc=b8uQdHSW5akQ7kNvwEqgiLD&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6OTk2MzEzNjI5Njc1NjcxLCJhc3NldF9hZ2VfZGF5cyI6MjgsInZpX3VzZWNhc2VfaWQiOjEwMDk5LCJkdXJhdGlvbl9zIjoyOSwidXJsZ2VuX3NvdXJjZSI6Ind3dyJ9&ccb=17-1&vs=bdd390fd3399ebd6&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC9BODQwODhEODdCNTMyNUM5NDQ5QjAzNzZDMEQ0Mzc4Q192aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzY2NDQ2NkY1NzVCMkIyNDg0NjRGMzdDNTAxMUY5Mjg3X2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACauwtr_ionFAxUCKAJDMywXQD3u2RaHKwIYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQGR20ol3QNkyY63LVks5OFEfUj-pOxpvzJCYKOatbNl2HW9sEt4Ev6XSJVNGl3dAirqVIxQyb8WDw&oh=00_AQBEARS2QvwC8Sygqko4lziWNHApJHh_rkhS-TCoSrF3_Q&oe=6A5A5499\",\"timestamp\":\"2026-06-17T15:44:47+0000\",\"like_count\":107,\"comments_count\":1}','2026-07-16 07:24:38',0,'2026-07-16 07:24:38','2026-07-16 07:24:38'),(4,2,'instagram','18153606940468133','What if Mahabharata never ended?\n\nWhat if Kurukshetra is now inside our schools, courts, phones, offices, politics… and our own minds?\n\nKarna is still losing to privilege.\nBhishma is still silent.\nShakuni is still controlling narratives.\nDuryodhana still wants more.\nAnd Arjuna is still searching for answers.\n\nKrishna still speaks.\nBut the noise is simply louder.\n\n#Mahabharata #KurukshetraNeverDisappeared #KrishnaStillSpeaks #BhagavadGita #Dharma #Arjuna #Karna #Bhishma #Duryodhana #Shakuni #IndianMythology #ModernIndia #Kalyug #AIArtCommunity #AIVideoGeneration #CinematicReels #DarkGothic #ViralContent #InstagramReels #ReelsIndia #SpiritualWisdom #SocialCommentary','VIDEO','https://www.instagram.com/reel/DZpAjcEvq_n/','https://scontent.cdninstagram.com/v/t51.82787-15/725649012_18595955284059790_4444742176233066477_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=105&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=h-VeIFs5rBIQ7kNvwEdXfRI&_nc_oc=Adr-oPjsnUJzb525fxlcANvlcqlLNtDKstOLuK9IdqMDercfk7ewehKz_aayuOy8xGk&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQF1YzbRI_DZsPhkcnS-DGEdLQXpx7tNWm0trLNd8-8F7roYZXdZbzVpvp6Q_c44wGtVIhEgJhrPSg&oh=00_AQBT8JQkxE7_t4gGJ9qYK3NwAM7_4LrQXvP67x9Pjt7rFQ&oe=6A5E44FE','2026-06-16 03:27:03',37,0,NULL,NULL,'{\"id\":\"18153606940468133\",\"caption\":\"What if Mahabharata never ended?\\n\\nWhat if Kurukshetra is now inside our schools, courts, phones, offices, politics\\u2026 and our own minds?\\n\\nKarna is still losing to privilege.\\nBhishma is still silent.\\nShakuni is still controlling narratives.\\nDuryodhana still wants more.\\nAnd Arjuna is still searching for answers.\\n\\nKrishna still speaks.\\nBut the noise is simply louder.\\n\\n#Mahabharata #KurukshetraNeverDisappeared #KrishnaStillSpeaks #BhagavadGita #Dharma #Arjuna #Karna #Bhishma #Duryodhana #Shakuni #IndianMythology #ModernIndia #Kalyug #AIArtCommunity #AIVideoGeneration #CinematicReels #DarkGothic #ViralContent #InstagramReels #ReelsIndia #SpiritualWisdom #SocialCommentary\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DZpAjcEvq_n\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/725649012_18595955284059790_4444742176233066477_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=105&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=h-VeIFs5rBIQ7kNvwEdXfRI&_nc_oc=Adr-oPjsnUJzb525fxlcANvlcqlLNtDKstOLuK9IdqMDercfk7ewehKz_aayuOy8xGk&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQF1YzbRI_DZsPhkcnS-DGEdLQXpx7tNWm0trLNd8-8F7roYZXdZbzVpvp6Q_c44wGtVIhEgJhrPSg&oh=00_AQBT8JQkxE7_t4gGJ9qYK3NwAM7_4LrQXvP67x9Pjt7rFQ&oe=6A5E44FE\",\"media_url\":\"https:\\/\\/instagram.fblr22-2.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQNUv4nqIWfpoxFVd8grcF_OkDNme5ZD1yRfnZ2SYKnbV3U5Lgse-4Bp1yH6V6wlHib5v_qT3TbXbAUEBmE-vRbEipTk6BsqLiYR3DI.mp4?_nc_cat=104&_nc_oc=AdojXNJBIxhHOE3j0r47jQBvLJyrM74akreM7VdjfQf78A0XBSuwWyh2zGvBfgbfPic&_nc_sid=5e9851&_nc_ht=instagram.fblr22-2.fna.fbcdn.net&_nc_ohc=VYMR3E9XhEcQ7kNvwE19W8t&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6OTg2MjE4Njg3NzI1MDY2LCJhc3NldF9hZ2VfZGF5cyI6MjksInZpX3VzZWNhc2VfaWQiOjEwMDk5LCJkdXJhdGlvbl9zIjo2NywidXJsZ2VuX3NvdXJjZSI6Ind3dyJ9&ccb=17-1&vs=42141a35a819c32&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC80NzQ1NTZFQzNCOTA0NENFQzc3OTdGNkI0MzlCMzJCRV92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzk3NDk5RjE3N0E4MjU4RDEwRDY0ODYzM0E4Rjk1N0E4X2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACaU-Ovovb3AAxUCKAJDMywXQFD90vGp--cYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQGpKl1OVhtG0sXftHLVVvJXNL_HbnBUzM7H6vNPZ1xVJCiLQElvZkYKq-GpUVxhGS5zAwj8fD_rFQ&oh=00_AQDRUbnNGVYZeGz3kj_iajzVIDGUJw_9H2R1PlpDtf1n_w&oe=6A5A5949\",\"timestamp\":\"2026-06-16T08:57:03+0000\",\"like_count\":37,\"comments_count\":0}','2026-07-16 07:24:38',0,'2026-07-16 07:24:38','2026-07-16 07:24:38'),(5,2,'instagram','18140472691546753','In the silence of the forest, the divine still breathes. 🌿🕉️\nSome places are not discovered… they are revealed.\n\n#DivineEnergy #AncientIndia #MysticForest #SanatanDharma #Shiva #Vishnu #IndianMythology #SpiritualJourney #CinematicReel #AIArt #AIVideo #MythologyReels #Bhakti #ReelsIndia #ExplorePage','VIDEO','https://www.instagram.com/reel/DZZOvMBPjoZ/','https://scontent.cdninstagram.com/v/t51.82787-15/719475632_18594256777059790_158618446543540977_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=106&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=XLie56wSkBEQ7kNvwEsATDg&_nc_oc=AdoVwZTPnaxS2_jTyIS-22Hrv846DPshqyIGuISYiQxZevOaRX9XeDDCaxaq5D7QiAg&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQGQb8cYsx2jz8iJp-KqEJA7NOYu3bqPncwsi0twMrUCCruOJqQBaOzbCOe6FQtBfa9Dseqpv_HYJw&oh=00_AQDYZ4pC45mMX6_YU9YAx-rBO9zWZ0TBtEk3y1qIQfAyMw&oe=6A5E604A','2026-06-10 00:21:33',93,5,NULL,NULL,'{\"id\":\"18140472691546753\",\"caption\":\"In the silence of the forest, the divine still breathes. \\ud83c\\udf3f\\ud83d\\udd49\\ufe0f\\nSome places are not discovered\\u2026 they are revealed.\\n\\n#DivineEnergy #AncientIndia #MysticForest #SanatanDharma #Shiva #Vishnu #IndianMythology #SpiritualJourney #CinematicReel #AIArt #AIVideo #MythologyReels #Bhakti #ReelsIndia #ExplorePage\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DZZOvMBPjoZ\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/719475632_18594256777059790_158618446543540977_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=106&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=XLie56wSkBEQ7kNvwEsATDg&_nc_oc=AdoVwZTPnaxS2_jTyIS-22Hrv846DPshqyIGuISYiQxZevOaRX9XeDDCaxaq5D7QiAg&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQGQb8cYsx2jz8iJp-KqEJA7NOYu3bqPncwsi0twMrUCCruOJqQBaOzbCOe6FQtBfa9Dseqpv_HYJw&oh=00_AQDYZ4pC45mMX6_YU9YAx-rBO9zWZ0TBtEk3y1qIQfAyMw&oe=6A5E604A\",\"media_url\":\"https:\\/\\/instagram.fblr22-2.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQO_U2lB-2e2EyhfrXM2cQjoF4l1Bi3IC5aiD0h7v8PD5OMSvA8QeHnc-glrJ1qUDhvAvTIadLhGtoPN8qaX4MUDoSgCXhIW5CW178M.mp4?_nc_cat=111&_nc_oc=Adob05zOnvkxf5jELP79ANznwgTidsgQaV841f7i3MGdEgVv6cC9jZ_m61AeHL9NBPQ&_nc_sid=5e9851&_nc_ht=instagram.fblr22-2.fna.fbcdn.net&_nc_ohc=1TfS8rPsUKQQ7kNvwEMcxTK&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTQ0Mzg0MDcwNzUwMzYxNCwiYXNzZXRfYWdlX2RheXMiOjM2LCJ2aV91c2VjYXNlX2lkIjoxMDA5OSwiZHVyYXRpb25fcyI6NDUsInVybGdlbl9zb3VyY2UiOiJ3d3cifQ%3D%3D&ccb=17-1&vs=eb81b9f92562925c&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC9BMjQ4ODc0NzE4NURDOTIwMEQ1MkQxM0I5NzIxNDM4NV92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzJCNEY2NkFFMEJGODQ5M0U4RkJFNDREOTRGRjc0QzlFX2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACb8l93Hy8qQBRUCKAJDMywXQEbEOVgQYk4YEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQFTGYKQLlDMlA8-6YAxgKUXG7EnTcJc25k08BrYrnTfAGJLzWkaAUsr0u-TQAFaHmz8QSskVSGvEA&oh=00_AQCQqU5mxy3TwhLMJSL6_iIbLs_8JvrMj7mUs5QS0ddNoQ&oe=6A5A635C\",\"timestamp\":\"2026-06-10T05:51:33+0000\",\"like_count\":93,\"comments_count\":5}','2026-07-16 07:24:38',0,'2026-07-16 07:24:38','2026-07-16 07:24:38'),(6,2,'instagram','18139135120531043','He was not just a king.\nHe was a vision, a force, and a movement.\n\nChhatrapati Shivaji Maharaj did not rise only to sit on a throne — he rose to protect dignity, Dharma, and Swarajya. His strength was not just in the sword he carried, but in the courage he gave to millions.\n\nIn a time when fear ruled the land, he taught people to stand tall.\nIn a time when power crushed the weak, he became the voice of self-respect.\nIn a time when many bowed down, he built a kingdom with courage, strategy, and unshakable faith.\n\nSome warriors win battles.\nSome kings build empires.\nBut very few become an emotion that lives forever.\n\nChhatrapati Shivaji Maharaj was not just history.\nHe was the fire of Swarajya. 🚩\n\n#ChhatrapatiShivajiMaharaj #ShivajiMaharaj #JaiBhavaniJaiShivaji #Swarajya #MarathaEmpire #MarathaWarrior #IndianHistory #BharatHistory #HinduHistory #SanatanDharma #Dharma #WarriorKing #GreatIndianWarriors #HistoricalReels #CinematicReels #HistoryReels #MotivationalReels #IndianWarrior #ProudIndian #Bharat #Maharashtra #ShivajiJayanti #MarathaPride #Leadership #Courage #Bravery #ReelsIndia #ViralReels #InstagramReels #CinematicEdit','VIDEO','https://www.instagram.com/reel/DZHaVAePvcJ/','https://scontent.cdninstagram.com/v/t51.82787-15/714775059_18592318546059790_8697155178658879269_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=111&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=Kl-49kBcFb0Q7kNvwETw_Gi&_nc_oc=AdpuGn917P6iKkMopMjPOD10XZSLgOtWTh3cMngsHu1DbO5kgBZ-aykjV76zjfIXJuo&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQG5YXuzi03J1lXFz9esdTVZWl1zJM3cC5RMJoBCwTA2Y8pQxe1Vw8gPNyRaTwIoBJqQyZFy-hwFmA&oh=00_AQAocPZp373jfHQBXz8n6NZ-grjx9cJWnxA317GG-bn1VQ&oe=6A5E4337','2026-06-03 02:15:31',54,2,NULL,NULL,'{\"id\":\"18139135120531043\",\"caption\":\"He was not just a king.\\nHe was a vision, a force, and a movement.\\n\\nChhatrapati Shivaji Maharaj did not rise only to sit on a throne \\u2014 he rose to protect dignity, Dharma, and Swarajya. His strength was not just in the sword he carried, but in the courage he gave to millions.\\n\\nIn a time when fear ruled the land, he taught people to stand tall.\\nIn a time when power crushed the weak, he became the voice of self-respect.\\nIn a time when many bowed down, he built a kingdom with courage, strategy, and unshakable faith.\\n\\nSome warriors win battles.\\nSome kings build empires.\\nBut very few become an emotion that lives forever.\\n\\nChhatrapati Shivaji Maharaj was not just history.\\nHe was the fire of Swarajya. \\ud83d\\udea9\\n\\n#ChhatrapatiShivajiMaharaj #ShivajiMaharaj #JaiBhavaniJaiShivaji #Swarajya #MarathaEmpire #MarathaWarrior #IndianHistory #BharatHistory #HinduHistory #SanatanDharma #Dharma #WarriorKing #GreatIndianWarriors #HistoricalReels #CinematicReels #HistoryReels #MotivationalReels #IndianWarrior #ProudIndian #Bharat #Maharashtra #ShivajiJayanti #MarathaPride #Leadership #Courage #Bravery #ReelsIndia #ViralReels #InstagramReels #CinematicEdit\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DZHaVAePvcJ\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/714775059_18592318546059790_8697155178658879269_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=111&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=Kl-49kBcFb0Q7kNvwETw_Gi&_nc_oc=AdpuGn917P6iKkMopMjPOD10XZSLgOtWTh3cMngsHu1DbO5kgBZ-aykjV76zjfIXJuo&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQG5YXuzi03J1lXFz9esdTVZWl1zJM3cC5RMJoBCwTA2Y8pQxe1Vw8gPNyRaTwIoBJqQyZFy-hwFmA&oh=00_AQAocPZp373jfHQBXz8n6NZ-grjx9cJWnxA317GG-bn1VQ&oe=6A5E4337\",\"media_url\":\"https:\\/\\/instagram.fblr22-2.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQP0eSMRGOq_FhXLyhWZe9eDlvc4pXg6LkCUINMd28TgLxUKdNFkIAPBTd6O7BaAYoruCG75mE7J-xOXGVelNWt3CG-C6nXVNBJRbvg.mp4?_nc_cat=108&_nc_oc=AdqoY11TgmRReN5gyFkFJ9tQEXQ3dHhKQ9UCLvonL8Cew3-Q2h2UEKDCNZNE5HPL2MA&_nc_sid=5e9851&_nc_ht=instagram.fblr22-2.fna.fbcdn.net&_nc_ohc=ZhAZHwbM-8wQ7kNvwEJXWPD&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MjM1MDUyMjk0ODgwNzI4MywiYXNzZXRfYWdlX2RheXMiOjQyLCJ2aV91c2VjYXNlX2lkIjoxMDA5OSwiZHVyYXRpb25fcyI6MzgsInVybGdlbl9zb3VyY2UiOiJ3d3cifQ%3D%3D&ccb=17-1&vs=2e4a4e29b5b70d91&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC80QTQ4NTIyRjRFMEVCQTEwMDExRDdBMkUzNTE3Q0FCMl92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyL0IzNEZBMUIzNDA0M0Q3RDJCOTc4MUQ3RDU0NzFBOUE2X2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACbmqbPWuPKsCBUCKAJDMywXQEMZmZmZmZoYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQFOy0cgJ3r5e3YSwSUykKp9fsA8D6Lvbe--qnyMDphfYPc5gKx5FK0GFFlCA9-BMTR_JgdNpGjUMQ&oh=00_AQDZl3O3IrdFOdR9KjBpunep3cW7Nrdh4uJ7mXXLEgIDJg&oe=6A5A6695\",\"timestamp\":\"2026-06-03T07:45:31+0000\",\"like_count\":54,\"comments_count\":2}','2026-07-16 07:24:38',0,'2026-07-16 07:24:38','2026-07-16 07:24:38'),(7,2,'instagram','17949960507176025','When the tears of the innocent turn into a blazing fire of justice. 🔥🙏 The golden city falls as the ultimate devotee unleashes righteous wrath. Jai Sri Ram! 🚩\n\n#LankaDahan #LordHanuman #Bajrangbali #Ramayana #JaiShreeRam #HanumanJi #SpiritualAwakening #DivineJustice #EpicTales #SanatanDharma','VIDEO','https://www.instagram.com/reel/DY6tlcRPLkH/','https://scontent.cdninstagram.com/v/t51.82787-15/709306476_18590757022059790_321608091153634448_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=100&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=W_YE1QZSXAwQ7kNvwEbxRmZ&_nc_oc=AdqySjJ43-Sm4FHXUzxefpBfo-bGlZwxBEM-851yWxogp1wOQOxuZJw6uBByBocdHuo&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQGbF_vmTFPIhXdW7aCgVVu-8A1eKBIOLL5hk6e3p7RhwEPPKtAZdEFAYqh1pcHVLGgNbf-Z23HK2w&oh=00_AQA6EgOeXK2EtZU7we5vz7FjBFRAVvtvqENUgKPS2y9Hmg&oe=6A5E461F','2026-05-29 03:53:27',74,6,NULL,NULL,'{\"id\":\"17949960507176025\",\"caption\":\"When the tears of the innocent turn into a blazing fire of justice. \\ud83d\\udd25\\ud83d\\ude4f The golden city falls as the ultimate devotee unleashes righteous wrath. Jai Sri Ram! \\ud83d\\udea9\\n\\n#LankaDahan #LordHanuman #Bajrangbali #Ramayana #JaiShreeRam #HanumanJi #SpiritualAwakening #DivineJustice #EpicTales #SanatanDharma\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DY6tlcRPLkH\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/709306476_18590757022059790_321608091153634448_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=100&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=W_YE1QZSXAwQ7kNvwEbxRmZ&_nc_oc=AdqySjJ43-Sm4FHXUzxefpBfo-bGlZwxBEM-851yWxogp1wOQOxuZJw6uBByBocdHuo&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQGbF_vmTFPIhXdW7aCgVVu-8A1eKBIOLL5hk6e3p7RhwEPPKtAZdEFAYqh1pcHVLGgNbf-Z23HK2w&oh=00_AQA6EgOeXK2EtZU7we5vz7FjBFRAVvtvqENUgKPS2y9Hmg&oe=6A5E461F\",\"media_url\":\"https:\\/\\/instagram.fblr22-1.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQNvvyrwTsLLOH_v-STOSZxz0ymUzIeLxpNoMBKlK_7mfrukv5tlhADxH6KuvtLrYKFLUNSsguu9eCZlkV_sguWyyxtENNAXYXk5rC0.mp4?_nc_cat=105&_nc_oc=Adp6QQcjidUbLTsJip0MK-t7F4Yppg2_scP70kBfjlADvTDK10_WbHVFzLJIB9NLl9k&_nc_sid=5e9851&_nc_ht=instagram.fblr22-1.fna.fbcdn.net&_nc_ohc=sUXVK8NoCskQ7kNvwFSW96N&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTY1MzMxMTcyOTI1NzE1MiwiYXNzZXRfYWdlX2RheXMiOjQ3LCJ2aV91c2VjYXNlX2lkIjoxMDA5OSwiZHVyYXRpb25fcyI6MzIsInVybGdlbl9zb3VyY2UiOiJ3d3cifQ%3D%3D&ccb=17-1&vs=dcf163921f82f736&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC9EODRCQ0E1MDdFRjE4QkQyOTk3NjMxRjkwNUIzOTI4QV92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzc0NDkxMkJBREQ2ODNFOUZBNjAyMjFEMjQ5NzVDMjg2X2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACaAq5qltOvvBRUCKAJDMywXQEAiDEm6XjUYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQExJ1aWchTWtxlE5DlopzkOOftBXVnjReyxNLvnevZaYY4wUD0NrF08x65hUMomSiwvfdhRF07NMQ&oh=00_AQCLF1v2o6TvFevhC0aXvy17iHV_IFKfxDiigwqvDROIDQ&oe=6A5A58DA\",\"timestamp\":\"2026-05-29T09:23:27+0000\",\"like_count\":74,\"comments_count\":6}','2026-07-16 07:24:38',0,'2026-07-16 07:24:38','2026-07-16 07:24:38'),(8,2,'instagram','18032308889807124','The most beautiful stories of Vrindavan were never loud… just full of love. 🌙✨\n\n#Vrindavan #Krishna #GopiPrem #DivineMoments #KrishnaConsciousness #Bhakti #IndianMythology #SpiritualReels #TempleAesthetic #CinematicAI','VIDEO','https://www.instagram.com/reel/DYzkHqDvRdO/','https://scontent.cdninstagram.com/v/t51.82787-15/705976234_18589929841059790_478014824265522820_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=111&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=OrUK0VB00IEQ7kNvwFf0trK&_nc_oc=AdqochaxgARIbMMsex8wpHhGhzxaiFZouaAyR1CvxaUXoewfyf5h9mwmouFGYO1rE70&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQGnJLhnl3twcqB7p0gcMXsP2LGG0KtjPRkK2tH7nwEtKLvJmEVz6df3fwhq7KWJREUGFtQkN_fKbw&oh=00_AQCLCvEKSgVLwBP-XCwYtPVnAdCI9pob_VQ2U-b3Nge58Q&oe=6A5E6A56','2026-05-26 09:16:14',158,3,NULL,NULL,'{\"id\":\"18032308889807124\",\"caption\":\"The most beautiful stories of Vrindavan were never loud\\u2026 just full of love. \\ud83c\\udf19\\u2728\\n\\n#Vrindavan #Krishna #GopiPrem #DivineMoments #KrishnaConsciousness #Bhakti #IndianMythology #SpiritualReels #TempleAesthetic #CinematicAI\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DYzkHqDvRdO\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/705976234_18589929841059790_478014824265522820_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=111&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=OrUK0VB00IEQ7kNvwFf0trK&_nc_oc=AdqochaxgARIbMMsex8wpHhGhzxaiFZouaAyR1CvxaUXoewfyf5h9mwmouFGYO1rE70&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQGnJLhnl3twcqB7p0gcMXsP2LGG0KtjPRkK2tH7nwEtKLvJmEVz6df3fwhq7KWJREUGFtQkN_fKbw&oh=00_AQCLCvEKSgVLwBP-XCwYtPVnAdCI9pob_VQ2U-b3Nge58Q&oe=6A5E6A56\",\"media_url\":\"https:\\/\\/instagram.fblr22-1.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQPXuWi_LPrhoMFwBhfOfwZLn1JJy-PPwlwU-cYHN296iKqS7AbxRSvnhpmTDtwsLGzjyJ1eAtVkZP3vPT3c8Xo1l-fpCBmOkuxm5tI.mp4?_nc_cat=106&_nc_oc=AdpIuMrp4RRe6987a_l3yHJFxNnjYUquGP_wpoaLAJXUxvwiW4xjev2vr2sqzSSy2Ew&_nc_sid=5e9851&_nc_ht=instagram.fblr22-1.fna.fbcdn.net&_nc_ohc=F17jJYnLnSEQ7kNvwFfHwBf&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MjA1NzIwNzExODE2ODYwNCwiYXNzZXRfYWdlX2RheXMiOjUwLCJ2aV91c2VjYXNlX2lkIjoxMDA5OSwiZHVyYXRpb25fcyI6MTUsInVybGdlbl9zb3VyY2UiOiJ3d3cifQ%3D%3D&ccb=17-1&vs=dc55160fa8c7f892&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC9CNDQ1RUJGRjVDRkY3OUM0ODhBNjAxRURERjBGMkFBQ192aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzE3NERDMzFBNkRBOTc2MjlGMEJEMzMwRTVDNzI1QkE3X2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACa4iJC4m8GnBxUCKAJDMywXQC6ZmZmZmZoYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQH56o7ldREbdPaSBtLlwJ64faRUxqV5PaSXBTfoBhKOm70LSbkR7zrsCEJsE9OOXvCzlybpspNB-w&oh=00_AQBvP--6VQNtN2XxjnIPcz9lz1bt8TMP6wb31SWnaHSjVg&oe=6A5A7603\",\"timestamp\":\"2026-05-26T14:46:14+0000\",\"like_count\":158,\"comments_count\":3}','2026-07-16 07:24:38',0,'2026-07-16 07:24:38','2026-07-16 07:24:38'),(9,2,'instagram','18199376455358510','Om namaha shivaya #shiva #hanuman','VIDEO','https://www.instagram.com/reel/DYwGXmDyOjd/','https://scontent.cdninstagram.com/v/t51.71878-15/705567880_1498397311986539_7888268728266828130_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=109&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=gqtHyf9IAuUQ7kNvwEC6mYW&_nc_oc=AdrgA9PjkMqHyna9BxndG-6xvOOvSZU-Bs204JXUEX-oZ1luwJWLmlddeeve3VZn5sA&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQGCGpDtx2nI57ibHA4xh6C_mT664lPfti4cUuqAPHNnVI5hdFkFJHxLLnAGntacDkjN2geJE0K8Hw&oh=00_AQCHg0UBZ74oxdelEl_x0xahcrjPMI-gl9zkDZL2fyDbwQ&oe=6A5E43ED','2026-05-25 00:58:33',152,10,NULL,NULL,'{\"id\":\"18199376455358510\",\"caption\":\"Om namaha shivaya #shiva #hanuman\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DYwGXmDyOjd\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.71878-15\\/705567880_1498397311986539_7888268728266828130_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=109&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=gqtHyf9IAuUQ7kNvwEC6mYW&_nc_oc=AdrgA9PjkMqHyna9BxndG-6xvOOvSZU-Bs204JXUEX-oZ1luwJWLmlddeeve3VZn5sA&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQGCGpDtx2nI57ibHA4xh6C_mT664lPfti4cUuqAPHNnVI5hdFkFJHxLLnAGntacDkjN2geJE0K8Hw&oh=00_AQCHg0UBZ74oxdelEl_x0xahcrjPMI-gl9zkDZL2fyDbwQ&oe=6A5E43ED\",\"media_url\":\"https:\\/\\/instagram.fblr22-2.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQNp1p5RjfK4n357KbckAyKUPoZR8rpyhl7gJjsmkzVPA-blrUjRWvIrLo6t4Lm6PW4kiZYm7ZDQLiT8QPH0SQhPf760ZnBuVBfYWuU.mp4?_nc_cat=101&_nc_oc=AdqoqzOtfrb-XXCWk7GTqtvUWIP_FB68YEFKDVD8pr_IzvBXAaYZQvkd0FA43fvwK_8&_nc_sid=5e9851&_nc_ht=instagram.fblr22-2.fna.fbcdn.net&_nc_ohc=he0UfEpj1TkQ7kNvwGIVXkj&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MjI2MDM1NzQ4NzcwNDUxNywiYXNzZXRfYWdlX2RheXMiOjUyLCJ2aV91c2VjYXNlX2lkIjoxMDA5OSwiZHVyYXRpb25fcyI6MzYsInVybGdlbl9zb3VyY2UiOiJ3d3cifQ%3D%3D&ccb=17-1&vs=969098ae956880bf&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC9GMjREOEY4RDFBQUQ1QUVFQUUxQTYwMzM5RENCMTY5N192aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyL0JBNEI0QjYyNTkwQ0U0MUFGQTRFNUFDNjM0QTU5QTlDX2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACaK5_XRj_KDCBUCKAJDMywXQEJIcrAgxJwYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQGkRw9c_q1OBHE3KYevfUGgLV-WDzwjAenJUeiJnOegrEZK4qhGYv2lJNXMMvVaLz88j3_V9yCHsg&oh=00_AQCztybVvP9gNazMT5FPR12U6oFLIyYSRlYt9rNEtQnVCQ&oe=6A5A756E\",\"timestamp\":\"2026-05-25T06:28:33+0000\",\"like_count\":152,\"comments_count\":10}','2026-07-16 07:24:38',0,'2026-07-16 07:24:38','2026-07-16 07:24:38'),(10,2,'instagram','17944933440187752','In the silence beyond creation, Lord Vishnu rests upon Ananta Shesha — calm while the universe breathes through him.\nFrom chaos to creation, from destruction to balance… Narayana remains eternal. ✨🌌\n\n#Narayana #AnantaShayana #LordVishnu #Vishnu #SanatanaDharma #Hinduism #Mahavishnu #SheshaNaga #Spirituality #IndianMythology #HinduMythology #Bhakti #Devotional #VedicWisdom #CosmicEnergy #ReelsIndia #Mythology #Divine #OmNamoNarayana #TempleCulture #EpicVisuals #MythologyReels #SpiritualReels #HinduGods #VishnuBhagwan','VIDEO','https://www.instagram.com/reel/DYpQh_rvp0A/','https://scontent.cdninstagram.com/v/t51.82787-15/705053298_18588736567059790_4533515001969346134_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=111&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=38z7JwXvF8gQ7kNvwHWfqP5&_nc_oc=AdrbjipLR-dFplSqcqaXjVPymVu3SLZHh1hTEp49NHKMBlv1hjUynp8lDolf_RMIB14&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQEMrLnkhwAV5NbGQc1GzdBu_6MlDSkevU0rxRYzhhbtG_nSfVWkwLnxhrBMg_gy5BMSo5uxKT_FKw&oh=00_AQBwUxrXB6JJg_xhU5ETbgXYK_cg5sO5QwEItPmmckP_BA&oe=6A5E74BA','2026-05-22 09:13:38',559,7,NULL,NULL,'{\"id\":\"17944933440187752\",\"caption\":\"In the silence beyond creation, Lord Vishnu rests upon Ananta Shesha \\u2014 calm while the universe breathes through him.\\nFrom chaos to creation, from destruction to balance\\u2026 Narayana remains eternal. \\u2728\\ud83c\\udf0c\\n\\n#Narayana #AnantaShayana #LordVishnu #Vishnu #SanatanaDharma #Hinduism #Mahavishnu #SheshaNaga #Spirituality #IndianMythology #HinduMythology #Bhakti #Devotional #VedicWisdom #CosmicEnergy #ReelsIndia #Mythology #Divine #OmNamoNarayana #TempleCulture #EpicVisuals #MythologyReels #SpiritualReels #HinduGods #VishnuBhagwan\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DYpQh_rvp0A\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/705053298_18588736567059790_4533515001969346134_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=111&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=38z7JwXvF8gQ7kNvwHWfqP5&_nc_oc=AdrbjipLR-dFplSqcqaXjVPymVu3SLZHh1hTEp49NHKMBlv1hjUynp8lDolf_RMIB14&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&_nc_tpa=Q5bMBQEMrLnkhwAV5NbGQc1GzdBu_6MlDSkevU0rxRYzhhbtG_nSfVWkwLnxhrBMg_gy5BMSo5uxKT_FKw&oh=00_AQBwUxrXB6JJg_xhU5ETbgXYK_cg5sO5QwEItPmmckP_BA&oe=6A5E74BA\",\"media_url\":\"https:\\/\\/instagram.fblr22-2.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQPYNJjNSgZWaGryzmXWQf1ae9Yz5DYLe9caKxlFknOxFjOvGnBHbaHo7gMrEFk6pw776jkqpziEAxYiNL_y4OLTPGxus-mMURvfJd0.mp4?_nc_cat=106&_nc_oc=AdqBbbv1Y1i4QGJ7uevj2tA8pvhSYc5teA5_W0Mdru9Sw62X-vUolSvwWn3RssdUAgw&_nc_sid=5e9851&_nc_ht=instagram.fblr22-2.fna.fbcdn.net&_nc_ohc=iM3D-u5vMDYQ7kNvwGRR1F8&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTczNjQ5ODU4NzUxMjMyMSwiYXNzZXRfYWdlX2RheXMiOjU0LCJ2aV91c2VjYXNlX2lkIjoxMDA5OSwiZHVyYXRpb25fcyI6MjYsInVybGdlbl9zb3VyY2UiOiJ3d3cifQ%3D%3D&ccb=17-1&vs=801103befa4b40a0&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC8zQTQxRTlCQjFFNjlDQkVBQ0I3OTZBNTI0NzA4MDc4Ml92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzBDNEFGMUMwQTFERjI5NkUzMjgyNzA4NDFGQTVFRDgwX2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACaCuLHXwtWVBhUCKAJDMywXQDpu2RaHKwIYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=dzv5kgfkVQQsvFYJ_oXMhg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQHW5Y_mFJ6xebQLCM8BJxKSrHdF39QqlGZP5sZkGbgqL79ZU0rZaVp3HpE0vy5cz-fHWVALNMK0GA&oh=00_AQBhpk_cVDhrW1TVebezWYw2Exy369tusrJClAJCRBm2vg&oe=6A5A71F3\",\"timestamp\":\"2026-05-22T14:43:38+0000\",\"like_count\":559,\"comments_count\":7}','2026-07-16 07:24:38',0,'2026-07-16 07:24:38','2026-07-16 07:24:38'),(11,3,'instagram','18382042771162154','Comment “VIDYA” and we’ll send you the full podcast. 🚀\n\nWill software engineers still have jobs in the next 3–5 years? 👨‍💻🤖\n\nAccording to Dr. Krish Bharggav, AI is advancing so quickly that companies may soon need far fewer engineers than they do today. But Vidya Setlur believes we’re not witnessing the end of engineering, we’re witnessing a transformation. The key to staying relevant is simple: keep upskilling.\n\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss the future of software engineering, AI-driven productivity, and how professionals can adapt to a rapidly changing industry.\n\nHere’s what we discuss:\n\n-Why companies are becoming more efficient with fewer engineers.\n-How AI is changing hiring across the tech industry.\n-What the next 3–5 years could look like for engineering jobs.\n-Why continuous upskilling is no longer optional.\n-How experienced professionals can stay relevant in an AI-first world.\n-Why adaptability will define the next generation of successful engineers.\n\nAI isn’t just changing how we work.\n\nIt’s changing who stays relevant. 🚀\n\nWatch the full episode now.\n\n📺 YouTube Channel: The Offer Letter by DrKrishBharggav\nor\nLink in bio.\n\nAI, Software Engineering, Vidya Setlur, Dr. Krish Bharggav, Future of Work, Upskilling, Careers, Technology, BrowseJobs, Taurus AI, The Offer Letter\n\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #AI #SoftwareEngineering #FutureOfWork #Upskilling #CareerGrowth #TechJobs #BrowseJobs #TheOfferLetter','VIDEO','https://www.instagram.com/reel/Dakj_eYihXx/','https://scontent.cdninstagram.com/v/t51.82787-15/729589905_18130937362566765_7812515774200427995_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=108&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=1WrI38VNwL0Q7kNvwH924kO&_nc_oc=Adqmwhrq8Q53oOoR1o2v6W6cXnDw6bKLLGhrsC6xHEj1IeYfCkhy0Y8WFIz1pO9000c&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQH6hmbF4EzUbb_--5C2W9YL17nrvGvLRtDzlrn_Phpd5aulKUMAvurfKNcWsy26o-2wCrd_l0AbyA&oh=00_AQA1ejj7W2cHrQ2SdqIkV8GGNkSRXwyfvgN790bJQIhWwA&oe=6A5E55B5','2026-07-09 06:34:01',7,0,NULL,NULL,'{\"id\":\"18382042771162154\",\"caption\":\"Comment \\u201cVIDYA\\u201d and we\\u2019ll send you the full podcast. \\ud83d\\ude80\\n\\nWill software engineers still have jobs in the next 3\\u20135 years? \\ud83d\\udc68\\u200d\\ud83d\\udcbb\\ud83e\\udd16\\n\\nAccording to Dr. Krish Bharggav, AI is advancing so quickly that companies may soon need far fewer engineers than they do today. But Vidya Setlur believes we\\u2019re not witnessing the end of engineering, we\\u2019re witnessing a transformation. The key to staying relevant is simple: keep upskilling.\\n\\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss the future of software engineering, AI-driven productivity, and how professionals can adapt to a rapidly changing industry.\\n\\nHere\\u2019s what we discuss:\\n\\n-Why companies are becoming more efficient with fewer engineers.\\n-How AI is changing hiring across the tech industry.\\n-What the next 3\\u20135 years could look like for engineering jobs.\\n-Why continuous upskilling is no longer optional.\\n-How experienced professionals can stay relevant in an AI-first world.\\n-Why adaptability will define the next generation of successful engineers.\\n\\nAI isn\\u2019t just changing how we work.\\n\\nIt\\u2019s changing who stays relevant. \\ud83d\\ude80\\n\\nWatch the full episode now.\\n\\n\\ud83d\\udcfa YouTube Channel: The Offer Letter by DrKrishBharggav\\nor\\nLink in bio.\\n\\nAI, Software Engineering, Vidya Setlur, Dr. Krish Bharggav, Future of Work, Upskilling, Careers, Technology, BrowseJobs, Taurus AI, The Offer Letter\\n\\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #AI #SoftwareEngineering #FutureOfWork #Upskilling #CareerGrowth #TechJobs #BrowseJobs #TheOfferLetter\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/Dakj_eYihXx\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/729589905_18130937362566765_7812515774200427995_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=108&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=1WrI38VNwL0Q7kNvwH924kO&_nc_oc=Adqmwhrq8Q53oOoR1o2v6W6cXnDw6bKLLGhrsC6xHEj1IeYfCkhy0Y8WFIz1pO9000c&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQH6hmbF4EzUbb_--5C2W9YL17nrvGvLRtDzlrn_Phpd5aulKUMAvurfKNcWsy26o-2wCrd_l0AbyA&oh=00_AQA1ejj7W2cHrQ2SdqIkV8GGNkSRXwyfvgN790bJQIhWwA&oe=6A5E55B5\",\"media_url\":\"https:\\/\\/instagram.fblr22-1.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQMcCk6pN84dGYw4m35OGOZHrS00yNDozVEWXtW-CLdHWoKDhj4h6HN9Aba_SLTRl_a1ZIWEjB2aEf5I1Z028lCrmO0-e_SUkNOk7HA.mp4?_nc_cat=101&_nc_oc=Adr_jrfIzcgf5Z8yt5XfG3ItKvxULMkw88W1Lk2pjcrbURCdhdGusCl2NZrcp7U9NiI&_nc_sid=5e9851&_nc_ht=instagram.fblr22-1.fna.fbcdn.net&_nc_ohc=D52DQ9SeApcQ7kNvwG4VbBs&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTAyMjA5ODY3Mzc5ODkwNCwiYXNzZXRfYWdlX2RheXMiOjYsInZpX3VzZWNhc2VfaWQiOjEwMDk5LCJkdXJhdGlvbl9zIjo4OSwidXJsZ2VuX3NvdXJjZSI6Ind3dyJ9&ccb=17-1&vs=e6278c2cdb2cb229&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC9BQzREMzNFQUMxOTg2Nzk5MDVFODlCQTJFMUI0MjJBQl92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzY3NEJFMTc5OTFEQ0JEQzc1Q0EwREQ5MEE1REZGQkIwX2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACbwu4TG_OXQAxUCKAJDMywXQFZXbItDlYEYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQEWlmNuldju2oYgNgQautA98WhkN_-xY7cFMPSHhNCQKCDFZSfhNp3GFj-wnnZ9qxgLnnXyjy_3cw&oh=00_AQD5JrlZuVg3KOnikux2mWdgbzR28kwIK260P_jV9RPk5A&oe=6A5A67E2\",\"timestamp\":\"2026-07-09T12:04:01+0000\",\"like_count\":7,\"comments_count\":0}','2026-07-16 07:24:39',0,'2026-07-16 07:24:39','2026-07-16 07:24:39'),(12,3,'instagram','18131358841613957','Comment “VIDYA” and we’ll send you the full podcast. 🚀\n\nEveryone is talking about AI models. But what about the data behind them? 📂\n\nAccording to Vidya Setlur, one of the biggest challenges in AI today isn’t building smarter models, it’s getting the data in. As organizations generate massive amounts of structured and unstructured data, data ingestion remains one of the industry’s biggest research problems.\n\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss the future of AI, enterprise data, and why technologies like RAG are changing the way AI accesses information.\n\nHere’s what we discuss:\n\n-Why data ingestion is still an active research problem.\n-How structured and unstructured data are transforming AI.\n-How RAG is changing the way AI retrieves information.\n-Why enterprise AI depends on handling data at scale.\n-What the next generation of data engineering will look like.\n-Why better AI starts with better data.\n\nThe future of AI isn’t just about smarter models.\n\nIt’s about smarter ways of understanding and ingesting data. 💡\n\nWatch the full episode now.\n\n📺 YouTube Channel: The Offer Letter by DrKrishBharggav\nor\nLink in bio.\n\nAI, Data Ingestion, RAG, Vidya Setlur, Tableau, Enterprise AI, Data Engineering, Artificial Intelligence, Data Analytics, The Offer Letter\n\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #Tableau #AI #DataEngineering #DataIngestion #RAG #EnterpriseAI #FutureOfWork #TheOfferLetter','VIDEO','https://www.instagram.com/reel/DakieXQCmGb/','https://scontent.cdninstagram.com/v/t51.82787-15/731674056_18130935844566765_5454143591685988008_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=109&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=_i9Fy6Ler5EQ7kNvwFie0xG&_nc_oc=AdpCGjNj7o8jtFEjCRHEBwrIIMom3pFc4yb2I33ytk48XM9GkgffRItuRKshJ1XuDkM&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQEg6bsBpCRBGAWxyfXTSjvyjry4McXaSefB9twDNXW8XfH0aWqiBW4SYXpJmL-sY3nVevHHsOXBCw&oh=00_AQB2uC4fQOnfd76Yh4ct5QPyRI0egHGTJZC1COTpIyQC4Q&oe=6A5E6C22','2026-07-09 06:17:01',10,0,NULL,NULL,'{\"id\":\"18131358841613957\",\"caption\":\"Comment \\u201cVIDYA\\u201d and we\\u2019ll send you the full podcast. \\ud83d\\ude80\\n\\nEveryone is talking about AI models. But what about the data behind them? \\ud83d\\udcc2\\n\\nAccording to Vidya Setlur, one of the biggest challenges in AI today isn\\u2019t building smarter models, it\\u2019s getting the data in. As organizations generate massive amounts of structured and unstructured data, data ingestion remains one of the industry\\u2019s biggest research problems.\\n\\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss the future of AI, enterprise data, and why technologies like RAG are changing the way AI accesses information.\\n\\nHere\\u2019s what we discuss:\\n\\n-Why data ingestion is still an active research problem.\\n-How structured and unstructured data are transforming AI.\\n-How RAG is changing the way AI retrieves information.\\n-Why enterprise AI depends on handling data at scale.\\n-What the next generation of data engineering will look like.\\n-Why better AI starts with better data.\\n\\nThe future of AI isn\\u2019t just about smarter models.\\n\\nIt\\u2019s about smarter ways of understanding and ingesting data. \\ud83d\\udca1\\n\\nWatch the full episode now.\\n\\n\\ud83d\\udcfa YouTube Channel: The Offer Letter by DrKrishBharggav\\nor\\nLink in bio.\\n\\nAI, Data Ingestion, RAG, Vidya Setlur, Tableau, Enterprise AI, Data Engineering, Artificial Intelligence, Data Analytics, The Offer Letter\\n\\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #Tableau #AI #DataEngineering #DataIngestion #RAG #EnterpriseAI #FutureOfWork #TheOfferLetter\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DakieXQCmGb\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/731674056_18130935844566765_5454143591685988008_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=109&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=_i9Fy6Ler5EQ7kNvwFie0xG&_nc_oc=AdpCGjNj7o8jtFEjCRHEBwrIIMom3pFc4yb2I33ytk48XM9GkgffRItuRKshJ1XuDkM&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQEg6bsBpCRBGAWxyfXTSjvyjry4McXaSefB9twDNXW8XfH0aWqiBW4SYXpJmL-sY3nVevHHsOXBCw&oh=00_AQB2uC4fQOnfd76Yh4ct5QPyRI0egHGTJZC1COTpIyQC4Q&oe=6A5E6C22\",\"media_url\":\"https:\\/\\/instagram.fblr22-1.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQPuauxRszKvo0H2qS7_px2L5qBkfn1UDf-RGLRMcIvENpeqnokippHsKfiK6lhQO7mvU6kV4MGgkMNUxdK4ZrkBmECA8RDEph3drDc.mp4?_nc_cat=104&_nc_oc=AdqVVG1wLa8skO4gzCKh0hLcz8YkAXjuPOzbKbNDWu4gy-lkB0Tz7BXkRefeAdvs6hg&_nc_sid=5e9851&_nc_ht=instagram.fblr22-1.fna.fbcdn.net&_nc_ohc=QZnK9dYJ5RIQ7kNvwGv0e36&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTQ1MzI5MjM5OTg4OTgyMSwiYXNzZXRfYWdlX2RheXMiOjYsInZpX3VzZWNhc2VfaWQiOjEwMDk5LCJkdXJhdGlvbl9zIjozOCwidXJsZ2VuX3NvdXJjZSI6Ind3dyJ9&ccb=17-1&vs=9fc55005507980dd&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC9GNDQ3ODQwNzlBMDJDREE4MjY2MUQxNTY4NzQyMDRBOV92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzhENDcwMzMyOEUzRTZFODQ5Njg2NUVGOTM1NUNFNDg3X2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACa6toCU4PCUBRUCKAJDMywXQENAAAAAAAAYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQFK9H5ZrBSIJ3G2SaacjY6U1cke-Ws99r8w4RmP4h1iwENpc-bjOIKa8HSzF9DZOm0UWC0e83tP0g&oh=00_AQDrnstlOPIBn3tLMUYFqdf_EudmZk7xyVnKcwmYFpylgw&oe=6A5A6059\",\"timestamp\":\"2026-07-09T11:47:01+0000\",\"like_count\":10,\"comments_count\":0}','2026-07-16 07:24:39',0,'2026-07-16 07:24:39','2026-07-16 07:24:39'),(13,3,'instagram','18090349988455398','Comment “VIDYA” and we’ll send you the full podcast. 🚀\n\nIs AI already affecting the real estate market? 🏙️\n\nAccording to Dr. Krish Bharggav, the impact of AI isn’t limited to tech jobs. It’s creating a domino effect across industries. From slower hiring to declining property sales and falling rental prices, uncertainty in the job market is influencing major financial decisions.\n\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss how AI-driven disruption is reshaping not just careers, but the broader economy.\n\nHere’s what we discuss:\n\n-How slowing tech hiring is impacting other industries.\n-Why a major real estate developer reported declining sales.\n-How uncertainty in the job market affects home-buying decisions.\n-Why rental markets are beginning to feel the impact.\n-How AI disruption creates ripple effects across the economy.\n-Why confidence in the job market drives consumer spending.\n\nWhen jobs slow down, the entire economy feels it.\n\nThat’s the real impact of disruption. 📉\n\nWatch the full episode now.\n\n📺 YouTube Channel: The Offer Letter by DrKrishBharggav\nor\nLink in bio.\n\nAI, Job Market, Vidya Setlur, Dr. Krish Bharggav, Economy, Careers, BrowseJobs, Taurus AI, The Offer Letter\n\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #BrowseJobs #TaurusAI #AI #JobMarket #Economy #FutureOfWork #TheOfferLetter','VIDEO','https://www.instagram.com/reel/DakfaSJqT5t/','https://scontent.cdninstagram.com/v/t51.82787-15/729661345_18130933273566765_475347892783693150_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=110&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=chqDoRihzA4Q7kNvwEia67n&_nc_oc=AdpMSHfLMzAomNo1W6c3Ci6Jzm0WnzaoH7AEoc_-3PH0bX_LX58Bpmi5nhzq5hHjb-Y&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQFl4QMumI7yFG58lu7IO64wJ3L2_u8Ixao0osfN7Y8iKmXrOKgfMyoQ_Wj_rQ_dZQ800BdLgzFRYA&oh=00_AQBfx6fs8X2pcTdC0YxDib0OWJ7zQjpsbnMnxKstkIvb-w&oe=6A5E4B4B','2026-07-09 05:53:01',5,0,NULL,NULL,'{\"id\":\"18090349988455398\",\"caption\":\"Comment \\u201cVIDYA\\u201d and we\\u2019ll send you the full podcast. \\ud83d\\ude80\\n\\nIs AI already affecting the real estate market? \\ud83c\\udfd9\\ufe0f\\n\\nAccording to Dr. Krish Bharggav, the impact of AI isn\\u2019t limited to tech jobs. It\\u2019s creating a domino effect across industries. From slower hiring to declining property sales and falling rental prices, uncertainty in the job market is influencing major financial decisions.\\n\\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss how AI-driven disruption is reshaping not just careers, but the broader economy.\\n\\nHere\\u2019s what we discuss:\\n\\n-How slowing tech hiring is impacting other industries.\\n-Why a major real estate developer reported declining sales.\\n-How uncertainty in the job market affects home-buying decisions.\\n-Why rental markets are beginning to feel the impact.\\n-How AI disruption creates ripple effects across the economy.\\n-Why confidence in the job market drives consumer spending.\\n\\nWhen jobs slow down, the entire economy feels it.\\n\\nThat\\u2019s the real impact of disruption. \\ud83d\\udcc9\\n\\nWatch the full episode now.\\n\\n\\ud83d\\udcfa YouTube Channel: The Offer Letter by DrKrishBharggav\\nor\\nLink in bio.\\n\\nAI, Job Market, Vidya Setlur, Dr. Krish Bharggav, Economy, Careers, BrowseJobs, Taurus AI, The Offer Letter\\n\\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #BrowseJobs #TaurusAI #AI #JobMarket #Economy #FutureOfWork #TheOfferLetter\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DakfaSJqT5t\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/729661345_18130933273566765_475347892783693150_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=110&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=chqDoRihzA4Q7kNvwEia67n&_nc_oc=AdpMSHfLMzAomNo1W6c3Ci6Jzm0WnzaoH7AEoc_-3PH0bX_LX58Bpmi5nhzq5hHjb-Y&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQFl4QMumI7yFG58lu7IO64wJ3L2_u8Ixao0osfN7Y8iKmXrOKgfMyoQ_Wj_rQ_dZQ800BdLgzFRYA&oh=00_AQBfx6fs8X2pcTdC0YxDib0OWJ7zQjpsbnMnxKstkIvb-w&oe=6A5E4B4B\",\"media_url\":\"https:\\/\\/instagram.fblr22-2.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQM-SuvoRCnZWTM5hp5d3LtQ-aYRrKWuVB2C68ikhkHNDDgyrkPS42enKRS6E88ZFqwgWLwVgBgUqTV0XqlRjr5ezkSqxdgvRHCM4Tc.mp4?_nc_cat=107&_nc_oc=AdpqyDww1N6sIdC-3S2z9L-GyKWsWnqbhVu0xYEYej-z_-Q0YRQYn-AuuMAJkNdv1nY&_nc_sid=5e9851&_nc_ht=instagram.fblr22-2.fna.fbcdn.net&_nc_ohc=K1XUpan3NTAQ7kNvwF0Zp65&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTU0NzM1MjY3MzQ2MzA1NiwiYXNzZXRfYWdlX2RheXMiOjYsInZpX3VzZWNhc2VfaWQiOjEwMDk5LCJkdXJhdGlvbl9zIjo2MywidXJsZ2VuX3NvdXJjZSI6Ind3dyJ9&ccb=17-1&vs=218e707f2e6f8028&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC9GMTRCMzIwMDAxNkRFODNFQ0RGRDk2QjNDMkRGNEFCMl92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyL0ZFNDVCQkRFNjYwMTdBRjkzMDVDRkI4NTdDOEFDMEE1X2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACagrI3n49O_BRUCKAJDMywXQE_zMzMzMzMYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQEfD-tMO4_wGxUbAziK6CWt5oglltm3AZnyL-FlSRz003zSjSY0sJc8f5nJ1fEd2GsIJSWBbksw0A&oh=00_AQD0YKmML0__eBzboTrSO-lS8RnuUHGcmrGu0u8tjhRuwg&oe=6A5A66F0\",\"timestamp\":\"2026-07-09T11:23:01+0000\",\"like_count\":5,\"comments_count\":0}','2026-07-16 07:24:39',0,'2026-07-16 07:24:39','2026-07-16 07:24:39'),(14,3,'instagram','18109930501768787','Comment \"VIDYA\" and we\'ll send you the full podcast. 🚀\n\nDid you know Nokia was already using AI years ago? 📍\n\nAccording to Vidya Setlur, AI didn\'t begin with today\'s generative AI boom. Long before that, companies like Nokia were building intelligent systems through recommendation engines, personalized navigation, and user behavior patterns to create smarter experiences.\n\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss how AI has evolved over the years and the innovations that laid the foundation for the systems we use today.\n\nHere\'s what we discuss:\n\n-How Nokia used AI to build smarter navigation experiences.\n-Why recommendation systems were among the earliest AI applications.\n-How user behavior helped create personalized experiences.\n-Why AI has been quietly shaping products for years.\n-How intelligent systems have evolved over time.\n-Why understanding AI\'s history helps us understand its future.\n\nAI didn\'t appear overnight.\n\nIt has been evolving through years of innovation and intelligent systems. 💡\n\nWatch the full episode now.\n\n📺 YouTube Channel: The Offer Letter by DrKrishBharggav\nor\nLink in bio.\n\nAI, Nokia, Vidya Setlur, Recommendation Systems, Navigation, Personalized Experiences, Artificial Intelligence, Technology, Innovation, The Offer Letter\n\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #Nokia #AI #RecommendationSystems #Navigation #Technology #Innovation #FutureOfWork #TheOfferLetter','VIDEO','https://www.instagram.com/reel/DaiH8oMC16y/','https://scontent.cdninstagram.com/v/t51.82787-15/730294544_18130822171566765_3483677001433927122_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=109&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=QAwwbI7QplUQ7kNvwGC0cEY&_nc_oc=AdqDxcNLoGYZNMxL5UmweqUU0QEQBfcwdXqyClaGE_FX3wqBqB8_pri0XA4uBLi3jbs&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQHrMuPwmZUx-hWBB0iCpBA89UCX6hpzIlORPEnTJ7OOxfo3HoKE0kFve_yQv4gh8SPlCvGiepi1tg&oh=00_AQBM9Pptg5JQrOmdgzOnY5A0aCxa02NGO4uL4g92_FS7ow&oe=6A5E4F11','2026-07-08 07:48:32',10,0,NULL,NULL,'{\"id\":\"18109930501768787\",\"caption\":\"Comment \\\"VIDYA\\\" and we\'ll send you the full podcast. \\ud83d\\ude80\\n\\nDid you know Nokia was already using AI years ago? \\ud83d\\udccd\\n\\nAccording to Vidya Setlur, AI didn\'t begin with today\'s generative AI boom. Long before that, companies like Nokia were building intelligent systems through recommendation engines, personalized navigation, and user behavior patterns to create smarter experiences.\\n\\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss how AI has evolved over the years and the innovations that laid the foundation for the systems we use today.\\n\\nHere\'s what we discuss:\\n\\n-How Nokia used AI to build smarter navigation experiences.\\n-Why recommendation systems were among the earliest AI applications.\\n-How user behavior helped create personalized experiences.\\n-Why AI has been quietly shaping products for years.\\n-How intelligent systems have evolved over time.\\n-Why understanding AI\'s history helps us understand its future.\\n\\nAI didn\'t appear overnight.\\n\\nIt has been evolving through years of innovation and intelligent systems. \\ud83d\\udca1\\n\\nWatch the full episode now.\\n\\n\\ud83d\\udcfa YouTube Channel: The Offer Letter by DrKrishBharggav\\nor\\nLink in bio.\\n\\nAI, Nokia, Vidya Setlur, Recommendation Systems, Navigation, Personalized Experiences, Artificial Intelligence, Technology, Innovation, The Offer Letter\\n\\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #Nokia #AI #RecommendationSystems #Navigation #Technology #Innovation #FutureOfWork #TheOfferLetter\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DaiH8oMC16y\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/730294544_18130822171566765_3483677001433927122_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=109&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=QAwwbI7QplUQ7kNvwGC0cEY&_nc_oc=AdqDxcNLoGYZNMxL5UmweqUU0QEQBfcwdXqyClaGE_FX3wqBqB8_pri0XA4uBLi3jbs&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQHrMuPwmZUx-hWBB0iCpBA89UCX6hpzIlORPEnTJ7OOxfo3HoKE0kFve_yQv4gh8SPlCvGiepi1tg&oh=00_AQBM9Pptg5JQrOmdgzOnY5A0aCxa02NGO4uL4g92_FS7ow&oe=6A5E4F11\",\"media_url\":\"https:\\/\\/instagram.fblr22-2.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQNZHkYWQyFJUSkitmpb5IBpRQkk6sU2RYpw5B6p5jsvF7zkwDeDzOkuzEJaczpLlzwGjBRvFwYH7Ag-e7FQhcItlynrwmSx6KJ8WyM.mp4?_nc_cat=111&_nc_oc=AdpaWpXkMC2xOOE0ZuBKzp0YCRqOSVzdrCS6U_kCAyUqfXsBltcWIYnNRXIS2qrnQLM&_nc_sid=5e9851&_nc_ht=instagram.fblr22-2.fna.fbcdn.net&_nc_ohc=-tyamFmVm0QQ7kNvwHpXR_l&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MjMzOTIyNzQ1OTgxODU3MywiYXNzZXRfYWdlX2RheXMiOjcsInZpX3VzZWNhc2VfaWQiOjEwMDk5LCJkdXJhdGlvbl9zIjo1NSwidXJsZ2VuX3NvdXJjZSI6Ind3dyJ9&ccb=17-1&vs=7a45622f65221aad&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC83MDRFQzRCQTVDMkUzNkIzMTJDQkIyNDRGNTk1NUU4RV92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzc3NDAzNTNCM0VCMUU2MkU1RDBEM0FFNDYzM0I0NTg1X2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACaa0dTc-uCnCBUCKAJDMywXQEvIcrAgxJwYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQGvnBzfPvcSCPLlBi4_gm15GbnN07I1XGPHo0nq9lPmXkosdV4UDvRLq82cGhc27yQ9Un81Oh10Lw&oh=00_AQBF1WQ8_RG9Xa9e7iAZUPkI3RNcFLQlN5Kal5mwH33Nyg&oe=6A5A4F8C\",\"timestamp\":\"2026-07-08T13:18:32+0000\",\"like_count\":10,\"comments_count\":0}','2026-07-16 07:24:39',0,'2026-07-16 07:24:39','2026-07-16 07:24:39'),(15,3,'instagram','18152919706439002','Comment \"VIDYA\" and we\'ll send you the full podcast. 🚀\n\nEveryone\'s talking about AI. But do you actually understand how it works? 🤖\n\nAccording to Vidya Setlur, while today\'s LLMs are incredibly powerful, they\'re also black boxes. That\'s why going back to first principles—understanding how AI models actually work—is more important than ever for building trustworthy and better AI systems.\n\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss how AI has evolved, why understanding fundamentals still matters, and what it takes to build technology people can trust.\n\nHere\'s what we discuss:\n\n-How AI has evolved from traditional machine learning to modern LLMs.\n-Why early AI focused on understanding human behavior and intent.\n-Why today\'s LLMs are often considered black-box systems.\n-How first-principles thinking helps researchers build better AI.\n-Why understanding AI fundamentals is still essential.\n-How better AI leads to better experiences for users.\n\nUsing AI is easy.\n\nUnderstanding AI is what sets great engineers apart. 💡\n\nWatch the full episode now.\n\n📺 YouTube Channel: The Offer Letter by DrKrishBharggav\nor\nLink in bio.\n\nAI, LLMs, Machine Learning, Vidya Setlur, Tableau, Artificial Intelligence, First Principles, AI Research, Technology, The Offer Letter\n\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #Tableau #AI #LLMs #MachineLearning #ArtificialIntelligence #AIResearch #FutureOfWork #TheOfferLetter','VIDEO','https://www.instagram.com/reel/DaiE8FjC1jz/','https://scontent.cdninstagram.com/v/t51.82787-15/731808380_18130820005566765_1501567007921584784_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=103&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=ZLPu1broX4AQ7kNvwEVPWxX&_nc_oc=AdpvLfmkUFSrXXhoZTbPaC_pctauQMv3NaFdSSQh7rbNlxjRStV7YP9ZB8kKG0Tio_A&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQEJ3hFCSufK5g0smNudRayZyxBY62cdKdYvMI94Sn8tbSVH7V3e3FbM5E3g3wh4EpRmjLFSXzu6hA&oh=00_AQBZBdFUl4EU9XSb70oiC_ZYe9XTnbKntGC_nhcMh_GnDg&oe=6A5E6F77','2026-07-08 07:24:59',8,0,NULL,NULL,'{\"id\":\"18152919706439002\",\"caption\":\"Comment \\\"VIDYA\\\" and we\'ll send you the full podcast. \\ud83d\\ude80\\n\\nEveryone\'s talking about AI. But do you actually understand how it works? \\ud83e\\udd16\\n\\nAccording to Vidya Setlur, while today\'s LLMs are incredibly powerful, they\'re also black boxes. That\'s why going back to first principles\\u2014understanding how AI models actually work\\u2014is more important than ever for building trustworthy and better AI systems.\\n\\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss how AI has evolved, why understanding fundamentals still matters, and what it takes to build technology people can trust.\\n\\nHere\'s what we discuss:\\n\\n-How AI has evolved from traditional machine learning to modern LLMs.\\n-Why early AI focused on understanding human behavior and intent.\\n-Why today\'s LLMs are often considered black-box systems.\\n-How first-principles thinking helps researchers build better AI.\\n-Why understanding AI fundamentals is still essential.\\n-How better AI leads to better experiences for users.\\n\\nUsing AI is easy.\\n\\nUnderstanding AI is what sets great engineers apart. \\ud83d\\udca1\\n\\nWatch the full episode now.\\n\\n\\ud83d\\udcfa YouTube Channel: The Offer Letter by DrKrishBharggav\\nor\\nLink in bio.\\n\\nAI, LLMs, Machine Learning, Vidya Setlur, Tableau, Artificial Intelligence, First Principles, AI Research, Technology, The Offer Letter\\n\\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #Tableau #AI #LLMs #MachineLearning #ArtificialIntelligence #AIResearch #FutureOfWork #TheOfferLetter\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DaiE8FjC1jz\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/731808380_18130820005566765_1501567007921584784_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=103&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=ZLPu1broX4AQ7kNvwEVPWxX&_nc_oc=AdpvLfmkUFSrXXhoZTbPaC_pctauQMv3NaFdSSQh7rbNlxjRStV7YP9ZB8kKG0Tio_A&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQEJ3hFCSufK5g0smNudRayZyxBY62cdKdYvMI94Sn8tbSVH7V3e3FbM5E3g3wh4EpRmjLFSXzu6hA&oh=00_AQBZBdFUl4EU9XSb70oiC_ZYe9XTnbKntGC_nhcMh_GnDg&oe=6A5E6F77\",\"media_url\":\"https:\\/\\/instagram.fblr22-1.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQOUjNRbLYlCnYdLwMs1VjpEsPwRrJXDnn5Ghi3WFjHx6yQxYtl3OIGEqQxLFco2JFNd17IQB7iGqxPa36yh1GZYlM1GhMHBRvkbtx8.mp4?_nc_cat=109&_nc_oc=AdrKzl9TA-vyhX49qvzvPPSiktBa97MOtXG2z4V81iaPSMzulrc7FwTDp1Pfwb7DX8I&_nc_sid=5e9851&_nc_ht=instagram.fblr22-1.fna.fbcdn.net&_nc_ohc=qfinxNUbplYQ7kNvwGcqpfH&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTU1MTk0NDQzOTY0NDY1MywiYXNzZXRfYWdlX2RheXMiOjcsInZpX3VzZWNhc2VfaWQiOjEwMDk5LCJkdXJhdGlvbl9zIjo4NywidXJsZ2VuX3NvdXJjZSI6Ind3dyJ9&ccb=17-1&vs=5c26450251a0628e&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC9FNzRDOUQ1NkJEQkVFMDQ3MkVGMENFMENFQzVENzM4Ql92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzcwNDVCRjIyQzEwNUUyODI2QkZERjU3N0YyOTRDMzhEX2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACbah8qQh9_BBRUCKAJDMywXQFXRBiTdLxsYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQEQ8vC4vV2dw0MPEIcy6Y194DGVmrXbebi1SR_-a5sxuBKUFxUECFVi2PKsYY0h18EUGV56OtG6Sw&oh=00_AQChpQosItOHUndCrE5pZSWBbbB7f-Vx2qTudS6EYYoBYQ&oe=6A5A65A6\",\"timestamp\":\"2026-07-08T12:54:59+0000\",\"like_count\":8,\"comments_count\":0}','2026-07-16 07:24:39',0,'2026-07-16 07:24:39','2026-07-16 07:24:39'),(16,3,'instagram','17942836887050125','Comment \"VIDYA\" and we\'ll send you the full podcast. 🚀\n\nWhat\'s the smartest way to figure out which tech skills companies are actually hiring for? 📈\n\nAccording to Dr. Krish Bharggav, stop following the hype and start following the hiring data.\n\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss how AI is transforming hiring, interview preparation, and the future of tech careers.\n\nHere\'s what we discuss:\n\n-Why Naukri remains India\'s strongest hiring platform.\n-How to identify which skills companies are actively hiring for.\n-Why tracking interview calls reveals real hiring trends.\n-How AI can build personalized interview preparation plans.\n-Why real interview questions are better than generic courses.\n-How BrowseJobs achieved a 93% interview success rate using this approach.\n\nDon\'t learn what\'s trending.\n\nLearn what companies are actually hiring for. 🚀\n\nWatch the full episode now.\n\n📺 YouTube Channel: The Offer Letter by DrKrishBharggav\nor\nLink in bio.\n\nNaukri, BrowseJobs, Taurus AI, Dr. Krish Bharggav, Vidya Setlur, Interview Preparation, Tech Jobs, AI, Career Growth, The Offer Letter\n\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #BrowseJobs #TaurusAI #Naukri #InterviewPreparation #CareerGrowth #TechJobs #AI #FutureOfWork #TheOfferLetter','VIDEO','https://www.instagram.com/reel/DaiCw5-C6GF/','https://scontent.cdninstagram.com/v/t51.82787-15/736188169_18130817596566765_6767185529897849405_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=100&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=-xEy08c7ep0Q7kNvwEPXcjD&_nc_oc=Adq-PQpyA4JBZxbJ2tIpGLjYFFJGkpGIvRXdrQYVlaWXJx6nKypWAO2BQ9BtLNO3tcQ&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQE2V7OO97tXuwVHlCA8mRCb1Ec4pkeY-fkkVJoJUfDBBs5xhRL6QyH3fwKp1EAZ4RZK-G2kDDKr1g&oh=00_AQBooAnk-bIb_BzYA98PzR3h-HjR203uo8ReQ-zKU5F0tQ&oe=6A5E6133','2026-07-08 07:05:42',25,0,NULL,NULL,'{\"id\":\"17942836887050125\",\"caption\":\"Comment \\\"VIDYA\\\" and we\'ll send you the full podcast. \\ud83d\\ude80\\n\\nWhat\'s the smartest way to figure out which tech skills companies are actually hiring for? \\ud83d\\udcc8\\n\\nAccording to Dr. Krish Bharggav, stop following the hype and start following the hiring data.\\n\\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss how AI is transforming hiring, interview preparation, and the future of tech careers.\\n\\nHere\'s what we discuss:\\n\\n-Why Naukri remains India\'s strongest hiring platform.\\n-How to identify which skills companies are actively hiring for.\\n-Why tracking interview calls reveals real hiring trends.\\n-How AI can build personalized interview preparation plans.\\n-Why real interview questions are better than generic courses.\\n-How BrowseJobs achieved a 93% interview success rate using this approach.\\n\\nDon\'t learn what\'s trending.\\n\\nLearn what companies are actually hiring for. \\ud83d\\ude80\\n\\nWatch the full episode now.\\n\\n\\ud83d\\udcfa YouTube Channel: The Offer Letter by DrKrishBharggav\\nor\\nLink in bio.\\n\\nNaukri, BrowseJobs, Taurus AI, Dr. Krish Bharggav, Vidya Setlur, Interview Preparation, Tech Jobs, AI, Career Growth, The Offer Letter\\n\\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #BrowseJobs #TaurusAI #Naukri #InterviewPreparation #CareerGrowth #TechJobs #AI #FutureOfWork #TheOfferLetter\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DaiCw5-C6GF\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/736188169_18130817596566765_6767185529897849405_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=100&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=-xEy08c7ep0Q7kNvwEPXcjD&_nc_oc=Adq-PQpyA4JBZxbJ2tIpGLjYFFJGkpGIvRXdrQYVlaWXJx6nKypWAO2BQ9BtLNO3tcQ&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQE2V7OO97tXuwVHlCA8mRCb1Ec4pkeY-fkkVJoJUfDBBs5xhRL6QyH3fwKp1EAZ4RZK-G2kDDKr1g&oh=00_AQBooAnk-bIb_BzYA98PzR3h-HjR203uo8ReQ-zKU5F0tQ&oe=6A5E6133\",\"media_url\":\"https:\\/\\/instagram.fblr22-2.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQM-SybKMxoSpkXBU3wnyUWp_nKeyl3DAz4XW0w9uTpSYtHwwqtuujNS1F9UENSy4x-PGwtOvcHpHwGpbVQ7857GPgn1rnFJfFp-DWY.mp4?_nc_cat=101&_nc_oc=AdqY-XLTMmvgd8laoqXBwgMPRTWvHzrdo3xauYrwPxJL8tYhvKP5SCZV1vvZtXVEKuQ&_nc_sid=5e9851&_nc_ht=instagram.fblr22-2.fna.fbcdn.net&_nc_ohc=e3tuYGLAV5AQ7kNvwFiTpIp&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTA0MDQ3MjgxMTY5Mzg0OCwiYXNzZXRfYWdlX2RheXMiOjcsInZpX3VzZWNhc2VfaWQiOjEwMDk5LCJkdXJhdGlvbl9zIjo5MywidXJsZ2VuX3NvdXJjZSI6Ind3dyJ9&ccb=17-1&vs=b0145bd769798768&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC85MzQxQzAwMzE0MDZENUYyMjg1REREODkyQzExNzFBM192aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzUwNDk2RUY3Q0ZERDZFN0EzRDc4QTU0QzgwODBBRTg3X2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACawnLfFvpPZAxUCKAJDMywXQFdu6XjU_fQYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQF2GC9rZQ5MN1OWY2ATBPbTla3pBjKOJZ3kIZo5Sr4gufWNWrjAKkwITgS7IINRcFb2rG4aS91MoA&oh=00_AQDU9WGr3PuwAmgrdNKibx8RfCkLGm9ggn89N630KFiLhQ&oe=6A5A595A\",\"timestamp\":\"2026-07-08T12:35:42+0000\",\"like_count\":25,\"comments_count\":0}','2026-07-16 07:24:39',0,'2026-07-16 07:24:39','2026-07-16 07:24:39'),(17,3,'instagram','18097127435138105','Comment \"VIDYA\" and we\'ll send you the full podcast. 🚀\n\nCan you trust AI-generated charts with million-dollar business decisions? 📊\n\nAccording to Vidya Setlur, generating charts with AI is easy. The real challenge is making sure those insights are accurate, trustworthy, and grounded in real data. For enterprises, a single misleading chart can lead to costly business decisions.\n\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss why enterprise analytics is about much more than uploading a CSV into an AI tool.\n\nHere\'s what we discuss:\n\n-Why AI-generated charts can sometimes be misleading.\n-Why trustworthy, grounded data matters for enterprise decisions.\n-How businesses manage massive, messy datasets across multiple systems.\n-Why enterprise analytics is far more complex than a simple CSV upload.\n-How Tableau is building AI that scales across organizations.\n-Why trust is the foundation of modern business intelligence.\n\nGenerating charts is easy.\n\nBuilding trust in those charts is the real challenge. 💡\n\nWatch the full episode now.\n\n📺 YouTube Channel: The Offer Letter by DrKrishBharggav\nor\nLink in bio.\n\nAI, Enterprise Analytics, Vidya Setlur, Tableau, Business Intelligence, Data Visualization, AI Hallucinations, Data Governance, Analytics, The Offer Letter\n\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #Tableau #EnterpriseAnalytics #BusinessIntelligence #DataVisualization #AI #DataGovernance #FutureOfWork #TheOfferLetter','VIDEO','https://www.instagram.com/reel/Dah-0UCiTIm/','https://scontent.cdninstagram.com/v/t51.82787-15/730381847_18130813102566765_3944989581021109899_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=104&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=TDe10Oue0O8Q7kNvwE6JqMA&_nc_oc=AdpOarwnR4h65M1oq7Z-4szgEDhEVhI-hwPqym6qpIeeoI-ej45o2GPnw1bQMMpvKyQ&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQGbigjU3LX2Qw14IuNsnbCpskCzYgETAfIOyeK3NTZn2e9Au1jgzpXWg3y-k8cjJlA6KomMj74hbw&oh=00_AQDi-EV0t1WYjdnHYrGZGst8-DPSzz_JTuerf37JfK6Rig&oe=6A5E6646','2026-07-08 06:30:54',3,0,NULL,NULL,'{\"id\":\"18097127435138105\",\"caption\":\"Comment \\\"VIDYA\\\" and we\'ll send you the full podcast. \\ud83d\\ude80\\n\\nCan you trust AI-generated charts with million-dollar business decisions? \\ud83d\\udcca\\n\\nAccording to Vidya Setlur, generating charts with AI is easy. The real challenge is making sure those insights are accurate, trustworthy, and grounded in real data. For enterprises, a single misleading chart can lead to costly business decisions.\\n\\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss why enterprise analytics is about much more than uploading a CSV into an AI tool.\\n\\nHere\'s what we discuss:\\n\\n-Why AI-generated charts can sometimes be misleading.\\n-Why trustworthy, grounded data matters for enterprise decisions.\\n-How businesses manage massive, messy datasets across multiple systems.\\n-Why enterprise analytics is far more complex than a simple CSV upload.\\n-How Tableau is building AI that scales across organizations.\\n-Why trust is the foundation of modern business intelligence.\\n\\nGenerating charts is easy.\\n\\nBuilding trust in those charts is the real challenge. \\ud83d\\udca1\\n\\nWatch the full episode now.\\n\\n\\ud83d\\udcfa YouTube Channel: The Offer Letter by DrKrishBharggav\\nor\\nLink in bio.\\n\\nAI, Enterprise Analytics, Vidya Setlur, Tableau, Business Intelligence, Data Visualization, AI Hallucinations, Data Governance, Analytics, The Offer Letter\\n\\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #Tableau #EnterpriseAnalytics #BusinessIntelligence #DataVisualization #AI #DataGovernance #FutureOfWork #TheOfferLetter\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/Dah-0UCiTIm\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/730381847_18130813102566765_3944989581021109899_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=104&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=TDe10Oue0O8Q7kNvwE6JqMA&_nc_oc=AdpOarwnR4h65M1oq7Z-4szgEDhEVhI-hwPqym6qpIeeoI-ej45o2GPnw1bQMMpvKyQ&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQGbigjU3LX2Qw14IuNsnbCpskCzYgETAfIOyeK3NTZn2e9Au1jgzpXWg3y-k8cjJlA6KomMj74hbw&oh=00_AQDi-EV0t1WYjdnHYrGZGst8-DPSzz_JTuerf37JfK6Rig&oe=6A5E6646\",\"media_url\":\"https:\\/\\/instagram.fblr22-2.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQNOn08KhptB8VVoBKUopsJPLIqZ7Kdg0tdXl-SQOMtNQg5_C-pJQgH73l6OmY1e-c4b5x3XIwoAm_sIDScpVdOmxSIi-ryDhX_X6oU.mp4?_nc_cat=107&_nc_oc=AdrPOVncVTMtTR0XxXR2hjZ4FCENxaekiF8QiSVbLFFqVeeJZUflBbOSwQsmwIKe0Pk&_nc_sid=5e9851&_nc_ht=instagram.fblr22-2.fna.fbcdn.net&_nc_ohc=_baQ1fP9nEMQ7kNvwH2E4YO&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTcwODQ5NTk1Mzc1NDYyNCwiYXNzZXRfYWdlX2RheXMiOjcsInZpX3VzZWNhc2VfaWQiOjEwMDk5LCJkdXJhdGlvbl9zIjo5NywidXJsZ2VuX3NvdXJjZSI6Ind3dyJ9&ccb=17-1&vs=f0b600593a7827f3&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC9CQjQwMDVDRjNDRDk2QjAzQ0U1NTY2MTUxQjRDNkU5NF92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyL0Y4NEU3RDlCN0JEMEFBRjQ2RENCMDRBMkU2NUQ5RDk4X2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACaA6OPmxveIBhUCKAJDMywXQFh1T987ZFoYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQETeyXCkw7YBsJejHcfwO37o4BK_fEomScMJwOWmIWZ4qISJeoCBn_VwKlV5CfekEdPedfXPBKzkg&oh=00_AQDFv4Z_HnlLat6TcMfyTEL_s9DtacMihEUBmV9guSzUhA&oe=6A5A6108\",\"timestamp\":\"2026-07-08T12:00:54+0000\",\"like_count\":3,\"comments_count\":0}','2026-07-16 07:24:39',0,'2026-07-16 07:24:39','2026-07-16 07:24:39'),(18,3,'instagram','18108221161797178','Comment \"VIDYA\" and we\'ll send you the full podcast. 🚀\n\nShould you become a specialist or a generalist to build a successful tech career? 🤔\n\nAccording to Vidya Setlur, the answer is both.\n\nThe best professionals today aren\'t just experts in one domain. They\'re able to go deep in a specific skill while also understanding how their work impacts the bigger business. That\'s exactly what top companies are looking for.\n\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss what truly makes someone stand out in today\'s AI-driven job market.\n\nHere\'s what we discuss:\n\n-Why companies want specialists who can think like generalists.\n-How deep expertise helps you stand out.\n-Why understanding the broader business creates more opportunities.\n-How cross-functional thinking accelerates career growth.\n-Why companies are moving beyond hiring narrow specialists.\n-How balancing technical depth with business awareness future-proofs your career.\n\nBeing an expert gets you hired.\n\nUnderstanding the bigger picture helps you lead. 🚀\n\nWatch the full episode now.\n\n📺 YouTube Channel: The Offer Letter by DrKrishBharggav\nor\nLink in bio.\n\nSpecialist, Generalist, Vidya Setlur, Tableau, Career Growth, Software Engineering, AI Careers, Leadership, Business Strategy, The Offer Letter\n\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #Tableau #CareerGrowth #SoftwareEngineering #Leadership #BusinessStrategy #AI #FutureOfWork #TheOfferLetter','VIDEO','https://www.instagram.com/reel/Dahwz8ZCXYz/','https://scontent.cdninstagram.com/v/t51.82787-15/729603373_18130802527566765_447439921138647900_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=101&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=mu_t763Y4RIQ7kNvwHaqWOO&_nc_oc=Adr7wlmgeQ3C430T-YXiFL37bMf7E-D2Ob6qD5rH3IH5SmnXa_hobdiacvGEqyv_ang&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQEZNaZiOurfrQP-axbq-muHRkVuV2q5j4dkX9ufGwl7PHmzgIAEOP58auapGvywpvMWv3r2xrHyQw&oh=00_AQDFCL1UlpoCcwRnXkNg57F1lRmTQvWmC5WkJ4VdFGX2fA&oe=6A5E68BC','2026-07-08 04:27:53',8,0,NULL,NULL,'{\"id\":\"18108221161797178\",\"caption\":\"Comment \\\"VIDYA\\\" and we\'ll send you the full podcast. \\ud83d\\ude80\\n\\nShould you become a specialist or a generalist to build a successful tech career? \\ud83e\\udd14\\n\\nAccording to Vidya Setlur, the answer is both.\\n\\nThe best professionals today aren\'t just experts in one domain. They\'re able to go deep in a specific skill while also understanding how their work impacts the bigger business. That\'s exactly what top companies are looking for.\\n\\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss what truly makes someone stand out in today\'s AI-driven job market.\\n\\nHere\'s what we discuss:\\n\\n-Why companies want specialists who can think like generalists.\\n-How deep expertise helps you stand out.\\n-Why understanding the broader business creates more opportunities.\\n-How cross-functional thinking accelerates career growth.\\n-Why companies are moving beyond hiring narrow specialists.\\n-How balancing technical depth with business awareness future-proofs your career.\\n\\nBeing an expert gets you hired.\\n\\nUnderstanding the bigger picture helps you lead. \\ud83d\\ude80\\n\\nWatch the full episode now.\\n\\n\\ud83d\\udcfa YouTube Channel: The Offer Letter by DrKrishBharggav\\nor\\nLink in bio.\\n\\nSpecialist, Generalist, Vidya Setlur, Tableau, Career Growth, Software Engineering, AI Careers, Leadership, Business Strategy, The Offer Letter\\n\\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #Tableau #CareerGrowth #SoftwareEngineering #Leadership #BusinessStrategy #AI #FutureOfWork #TheOfferLetter\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/Dahwz8ZCXYz\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/729603373_18130802527566765_447439921138647900_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=101&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=mu_t763Y4RIQ7kNvwHaqWOO&_nc_oc=Adr7wlmgeQ3C430T-YXiFL37bMf7E-D2Ob6qD5rH3IH5SmnXa_hobdiacvGEqyv_ang&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQEZNaZiOurfrQP-axbq-muHRkVuV2q5j4dkX9ufGwl7PHmzgIAEOP58auapGvywpvMWv3r2xrHyQw&oh=00_AQDFCL1UlpoCcwRnXkNg57F1lRmTQvWmC5WkJ4VdFGX2fA&oe=6A5E68BC\",\"media_url\":\"https:\\/\\/instagram.fblr22-1.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQP-3rleYhG9PSqQMg3behbwuhOKP0FooFcW3J2166ilEXMZfOwkKh-devkYYqtOLkxdHF1VZFKt2aip1uB8KROynOFx2DWtZn0LNkc.mp4?_nc_cat=101&_nc_oc=AdreLC08P9lkieldrfzGvvO0Dnb6b7gXnWGZlbyp7SHirZ6I-6R1-VAbip3yHuSVWk8&_nc_sid=5e9851&_nc_ht=instagram.fblr22-1.fna.fbcdn.net&_nc_ohc=yGf_g2wJ_2oQ7kNvwF7uRkg&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTcyNjAwMjQyODY3OTcxMiwiYXNzZXRfYWdlX2RheXMiOjcsInZpX3VzZWNhc2VfaWQiOjEwMDk5LCJkdXJhdGlvbl9zIjo4MywidXJsZ2VuX3NvdXJjZSI6Ind3dyJ9&ccb=17-1&vs=7b96f4fd4d189e3&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC9FRTQ4RTlEODU1NDREMTc3NTc2M0VEQzE1NkEyN0JCN192aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzIyNDNBQzM5MUIzQjUxNDI2OERBODc3RUExRTY0OUE1X2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACbA2KSayPKQBhUCKAJDMywXQFTd0vGp--cYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQGN9X6fMgGQp9rSrEDaZTLpjmkdnEgZ93zSuCV10g9wTKz_o6dcJyS9TBeKf1Cg9psLehW-rfqBeg&oh=00_AQA9qG995uBIx-c-MuVqgKjVMO1vdScxnVugFQDzXDeZpQ&oe=6A5A6906\",\"timestamp\":\"2026-07-08T09:57:53+0000\",\"like_count\":8,\"comments_count\":0}','2026-07-16 07:24:39',0,'2026-07-16 07:24:39','2026-07-16 07:24:39'),(19,3,'instagram','18025200482834290','Comment \"VIDYA\", and we\'ll send you the full podcast. 🚀\n\nAre coding interviews becoming obsolete because of AI? 👀\n\nAccording to Vidya Setlur, companies are no longer looking for people who can simply memorize syntax or solve coding questions from memory. With AI tools like Cursor AI becoming part of everyday development, what matters now is your ability to think like an engineer.\n\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss how AI is transforming hiring and the skills companies truly value today.\n\nHere\'s what we discuss:\n\n-Why traditional coding interviews are changing.\n-How companies are embracing AI tools like Cursor AI.\n-Why first-principles software engineering matters more than memorization.\n-How to evaluate and improve AI-generated code.\n-Why emotional intelligence and communication are becoming hiring superpowers.\n-Why the future belongs to engineers who can think critically, collaborate, and adapt.\n\nAI can generate code.\nGreat engineers know whether that code should be trusted. That\'s the difference companies are hiring for.\n\nWatch the full episode now.\n\n📺 YouTube Channel: The Offer Letter by DrKrishBharggav\nor\nLink in bio.\n\n[AI, Cursor AI, software engineering, coding interviews, hiring, emotional intelligence, communication, Vidya Setlur, The Offer Letter]\n\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #Tableau #AI #CursorAI #SoftwareEngineering #CodingInterview #CommunicationSkills #FutureOfWork #TheOfferLetter','VIDEO','https://www.instagram.com/reel/DacsQI9Cuxc/','https://scontent.cdninstagram.com/v/t51.82787-15/733127113_18130556983566765_1907457235865020661_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=110&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=ObYRtlvMPLQQ7kNvwGMMKof&_nc_oc=Adr5-bkfvGwNXe3xjG0l7bTDB25j9yRkwlXV2N0dxi0gVFj65xYIX5sNJzd7LN83Cto&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQFJW8DjQlqhnm1PY6t6DsQktq-47TxugUknRRMHHNhuqOA5xsKJyUz4-1ru0EEmfrlha3TfXm86pQ&oh=00_AQDE1DbKaFJQHz14684EPY5pB0eAF1IichEPnQxKZ5h4aA&oe=6A5E71AD','2026-07-06 05:13:19',8,0,NULL,NULL,'{\"id\":\"18025200482834290\",\"caption\":\"Comment \\\"VIDYA\\\", and we\'ll send you the full podcast. \\ud83d\\ude80\\n\\nAre coding interviews becoming obsolete because of AI? \\ud83d\\udc40\\n\\nAccording to Vidya Setlur, companies are no longer looking for people who can simply memorize syntax or solve coding questions from memory. With AI tools like Cursor AI becoming part of everyday development, what matters now is your ability to think like an engineer.\\n\\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), to discuss how AI is transforming hiring and the skills companies truly value today.\\n\\nHere\'s what we discuss:\\n\\n-Why traditional coding interviews are changing.\\n-How companies are embracing AI tools like Cursor AI.\\n-Why first-principles software engineering matters more than memorization.\\n-How to evaluate and improve AI-generated code.\\n-Why emotional intelligence and communication are becoming hiring superpowers.\\n-Why the future belongs to engineers who can think critically, collaborate, and adapt.\\n\\nAI can generate code.\\nGreat engineers know whether that code should be trusted. That\'s the difference companies are hiring for.\\n\\nWatch the full episode now.\\n\\n\\ud83d\\udcfa YouTube Channel: The Offer Letter by DrKrishBharggav\\nor\\nLink in bio.\\n\\n[AI, Cursor AI, software engineering, coding interviews, hiring, emotional intelligence, communication, Vidya Setlur, The Offer Letter]\\n\\n#fyp #KrishBharggav #OfferLetterPodcast #VidyaSetlur #Tableau #AI #CursorAI #SoftwareEngineering #CodingInterview #CommunicationSkills #FutureOfWork #TheOfferLetter\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DacsQI9Cuxc\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/733127113_18130556983566765_1907457235865020661_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=110&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=ObYRtlvMPLQQ7kNvwGMMKof&_nc_oc=Adr5-bkfvGwNXe3xjG0l7bTDB25j9yRkwlXV2N0dxi0gVFj65xYIX5sNJzd7LN83Cto&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQFJW8DjQlqhnm1PY6t6DsQktq-47TxugUknRRMHHNhuqOA5xsKJyUz4-1ru0EEmfrlha3TfXm86pQ&oh=00_AQDE1DbKaFJQHz14684EPY5pB0eAF1IichEPnQxKZ5h4aA&oe=6A5E71AD\",\"media_url\":\"https:\\/\\/instagram.fblr22-1.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQMROP2c_0OzYb1oqxFI1UZ_oEC5l4DoJqyXhHW3rCwwa4o16S5fKyWrB2FMnzmb0puQkNbO0K0VmxsxyK4koy6pW8vHuf68ZPeW_f8.mp4?_nc_cat=100&_nc_oc=AdrJuaNdfVFSiYzWU4Qy-X9T-mocqEOVlkTOHn51_dArjgX0wMYKsdrtGBFzTpiUeFA&_nc_sid=5e9851&_nc_ht=instagram.fblr22-1.fna.fbcdn.net&_nc_ohc=g_70Ja0P3GAQ7kNvwFLJKRb&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTAzMjM5NjgwNTk5NDk0MiwiYXNzZXRfYWdlX2RheXMiOjksInZpX3VzZWNhc2VfaWQiOjEwMDk5LCJkdXJhdGlvbl9zIjo4NCwidXJsZ2VuX3NvdXJjZSI6Ind3dyJ9&ccb=17-1&vs=d22ecd022fa375a&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC82OTQ4OUE4OERCMThFMDFENDIzMjlFMzlFQzJGQTFCMF92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyL0MxNDI0NUEwOTVENDkwREVGNjlDRTVGQTUwNjZCRDhBX2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACb85pvOs73VAxUCKAJDMywXQFUTMzMzMzMYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQHT25wzis_S7vOdQXxHHTEzs-7h9Q2WWp4WQ_pj2qLfdFMm8JVhqzPpTpQJGLUpxfS-H_fYItSvfA&oh=00_AQDj1wSV9fGsPh1jnIwsM7GClhFmTIF7IPcKrXbVP_vmsA&oe=6A5A4DB9\",\"timestamp\":\"2026-07-06T10:43:19+0000\",\"like_count\":8,\"comments_count\":0}','2026-07-16 07:24:39',0,'2026-07-16 07:24:39','2026-07-16 07:24:39'),(20,3,'instagram','17924903394372057','Comment \"VIDYA\" and we\'ll send you the full podcast. 🚀\n\nIs India\'s skilling system preparing students for real jobs? 🤔\n\nAccording to Dr. Krish Bharggav, one of the biggest problems in tech education is the disconnect between what is being taught and what companies are actually hiring for.\n\nHe argues that many students are being trained by people who themselves couldn\'t break into the industry, creating a cycle where outdated skills continue to be taught while the job market evolves rapidly.\n\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai ) sits down with @vidyasetlur , Head of Tableau Research (Senior Director), and shares his perspective on why the hiring and skilling ecosystem needs a complete rethink.\n\nHere\'s what we discuss:\n\n-Why India\'s hiring and skilling ecosystem is broken.\n-How outdated teaching affects students\' careers.\n-Why industry experience matters more than theory.\n-The gap between classroom learning and real hiring requirements.\n-Why students should focus on learning skills that companies actually demand.\n-How challenging conventional thinking can create better career outcomes.\n\nThe biggest career risk isn\'t learning slowly. It\'s learning the wrong things.\n\nWatch the full episode now.\n\n📺 YouTube Channel: The Offer Letter by DrKrishBharggav\nor\nLink in bio.\n\n[hiring, skilling, careers, software jobs, tech education, BrowseJobs, Taurus AI, Dr Krish Bharggav, future of work, The Offer Letter]\n\n#fyp #KrishBharggav #OfferLetterPodcast #BrowseJobs #TaurusAI #Hiring #Skilling #CareerGrowth #TechEducation #SoftwareJobs #FutureOfWork #TheOfferLetter','VIDEO','https://www.instagram.com/reel/DacqaveCFXJ/','https://scontent.cdninstagram.com/v/t51.82787-15/734277503_18130555735566765_585018909000583870_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=111&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=HXp-34XIew4Q7kNvwF4MjE0&_nc_oc=Adq9QEzkYE26w0qKRi8A7OLXVvz0OMznsVa-mXk67HC55QhT4BcE35m68K4hjHj9Ymw&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQGdFWCIkQORjADPVUeIwWuP_vYZktNZb6rWlPmuTtk84XwDHIyzx_ZnwDB1OT_WMYbMd1ZM8pFBEQ&oh=00_AQDFjQEl-bHibnzPk9HGQiJbLVEvVsL3aPx_l4v3M77hXg&oe=6A5E5983','2026-07-06 04:54:04',9,0,NULL,NULL,'{\"id\":\"17924903394372057\",\"caption\":\"Comment \\\"VIDYA\\\" and we\'ll send you the full podcast. \\ud83d\\ude80\\n\\nIs India\'s skilling system preparing students for real jobs? \\ud83e\\udd14\\n\\nAccording to Dr. Krish Bharggav, one of the biggest problems in tech education is the disconnect between what is being taught and what companies are actually hiring for.\\n\\nHe argues that many students are being trained by people who themselves couldn\'t break into the industry, creating a cycle where outdated skills continue to be taught while the job market evolves rapidly.\\n\\nIn this episode of The Offer Letter, @drkrishbharggav6666 (Founder, @browsejobs_6666 & @taurus_ai )\\u00a0sits down with @vidyasetlur , Head of Tableau Research (Senior Director), and shares his perspective on why the hiring and skilling ecosystem needs a complete rethink.\\n\\nHere\'s what we discuss:\\n\\n-Why India\'s hiring and skilling ecosystem is broken.\\n-How outdated teaching affects students\' careers.\\n-Why industry experience matters more than theory.\\n-The gap between classroom learning and real hiring requirements.\\n-Why students should focus on learning skills that companies actually demand.\\n-How challenging conventional thinking can create better career outcomes.\\n\\nThe biggest career risk isn\'t learning slowly.\\u00a0It\'s learning the wrong things.\\n\\nWatch the full episode now.\\n\\n\\ud83d\\udcfa YouTube Channel: The Offer Letter by DrKrishBharggav\\nor\\nLink in bio.\\n\\n[hiring, skilling, careers, software jobs, tech education, BrowseJobs, Taurus AI, Dr Krish Bharggav, future of work, The Offer Letter]\\n\\n#fyp #KrishBharggav #OfferLetterPodcast #BrowseJobs #TaurusAI #Hiring #Skilling #CareerGrowth #TechEducation #SoftwareJobs #FutureOfWork #TheOfferLetter\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DacqaveCFXJ\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/734277503_18130555735566765_585018909000583870_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=111&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=HXp-34XIew4Q7kNvwF4MjE0&_nc_oc=Adq9QEzkYE26w0qKRi8A7OLXVvz0OMznsVa-mXk67HC55QhT4BcE35m68K4hjHj9Ymw&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&_nc_tpa=Q5bMBQGdFWCIkQORjADPVUeIwWuP_vYZktNZb6rWlPmuTtk84XwDHIyzx_ZnwDB1OT_WMYbMd1ZM8pFBEQ&oh=00_AQDFjQEl-bHibnzPk9HGQiJbLVEvVsL3aPx_l4v3M77hXg&oe=6A5E5983\",\"media_url\":\"https:\\/\\/instagram.fblr22-1.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQOPzKwIY63IvBlJQbs7Ih3kYoncH4MbXpvLwEJ6VsFnf1KIgDSO01HR6MRZVmCI-G41BMFDjLmkkdF0N1ZlXiVmIAgNC2q10F07w2s.mp4?_nc_cat=102&_nc_oc=AdojGD_nvAlSMsY1d07-SGfZqXGDJSCJdjsMM0aI5Zqc6AaD4cof85F0YxWa3woiDpo&_nc_sid=5e9851&_nc_ht=instagram.fblr22-1.fna.fbcdn.net&_nc_ohc=SgzanoItS78Q7kNvwG5QhDg&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6OTY2ODU0MDY2Mjc1MjU0LCJhc3NldF9hZ2VfZGF5cyI6OSwidmlfdXNlY2FzZV9pZCI6MTAwOTksImR1cmF0aW9uX3MiOjQ3LCJ1cmxnZW5fc291cmNlIjoid3d3In0%3D&ccb=17-1&vs=314d2dd42472b0a4&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC81QTQ2ODQ0RDYwRTNDQjA2QTg0MUI5ODBEMzFCNjFCNF92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyL0I4NDYzNTI1OTM3Mzg0ODFCMTZDOTE1OUM3MEM3ODkyX2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACbsjtySqNa3AxUCKAJDMywXQEemZmZmZmYYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=Qa1MUKy0pqcLRjWqmuhQnA&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQEQeWVQZozYv0yJXUOiUg2hj5aOYR38MX3XKXaFJBfVEbAAG89gdobg9MlFFT0U14BcfBKuNonsNA&oh=00_AQAvC634dObR-q8zE3tD6b9n_UqWa6VTNgVbFbPpbnU-eg&oe=6A5A6C27\",\"timestamp\":\"2026-07-06T10:24:04+0000\",\"like_count\":9,\"comments_count\":0}','2026-07-16 07:24:39',0,'2026-07-16 07:24:39','2026-07-16 07:24:39'),(21,4,'instagram','18106639586008606','Messages like these mean everything to us. 💙\n\nThank you for your trust and kind words. Knowing we’ve been a part of your journey is the biggest reward, and we’re cheering for your continued success! 🚀\n\n💬 Comment “JOB” if you’re looking for career guidance or your next opportunity, we’re here to help.\n\n#BrowseJobs #CareerGrowth #CareerGuidance #Mentorship #JobSearch CareerSuccess Upskilling LearnAndGrow','VIDEO','https://www.instagram.com/reel/Da0fZkBIV3o/','https://scontent.cdninstagram.com/v/t51.82787-15/747761162_18068016878710574_8273759905517549254_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=107&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=rRN9AiBs1nkQ7kNvwEsV9tM&_nc_oc=Adr-r4CpQwNCz-K7SjyRZ-LyPF3GuRC4mgJPDwJp4vw2MtH3Mz1MieYNKlLKjW_0jU8&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQH9nhc9Hk_D1C4oYtQtkL4K0OxBN7Ln-Pcv-rszUZVdlmg-e9LiiyVm6wEywQ43_fJj-SJvXOcK9g&oh=00_AQDa-9_Z72RdiejMfMGkyTnerarnCZFhdEymbaHwosyDMw&oe=6A5E6E8B','2026-07-15 10:56:18',8,0,NULL,NULL,'{\"id\":\"18106639586008606\",\"caption\":\"Messages like these mean everything to us. \\ud83d\\udc99\\n\\nThank you for your trust and kind words. Knowing we\\u2019ve been a part of your journey is the biggest reward, and we\\u2019re cheering for your continued success! \\ud83d\\ude80\\n\\n\\ud83d\\udcac Comment \\u201cJOB\\u201d if you\\u2019re looking for career guidance or your next opportunity, we\\u2019re here to help.\\n\\n#BrowseJobs #CareerGrowth #CareerGuidance #Mentorship #JobSearch CareerSuccess Upskilling LearnAndGrow\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/Da0fZkBIV3o\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/747761162_18068016878710574_8273759905517549254_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=107&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=rRN9AiBs1nkQ7kNvwEsV9tM&_nc_oc=Adr-r4CpQwNCz-K7SjyRZ-LyPF3GuRC4mgJPDwJp4vw2MtH3Mz1MieYNKlLKjW_0jU8&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQH9nhc9Hk_D1C4oYtQtkL4K0OxBN7Ln-Pcv-rszUZVdlmg-e9LiiyVm6wEywQ43_fJj-SJvXOcK9g&oh=00_AQDa-9_Z72RdiejMfMGkyTnerarnCZFhdEymbaHwosyDMw&oe=6A5E6E8B\",\"media_url\":\"https:\\/\\/instagram.fblr22-2.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQMutnbPSOll47-kLi3D0fq1nbGN5VkAiqta2kpKQ2X0YXLPDtNNaiG9JwdXuniyhwrn3BgCfIaYOWI-Ga4EuzlQ5V0f2jBTNemWDS8.mp4?_nc_cat=100&_nc_oc=AdoW-e_kov5CTTwqVDx3G-ZYx3D2t71oRxZlxqId51CF1f_CQpnZswk2qC0gJJmhLmE&_nc_sid=5e9851&_nc_ht=instagram.fblr22-2.fna.fbcdn.net&_nc_ohc=JQrhJtBPaTIQ7kNvwEX-SjN&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNTU2LmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTU1NTQ3NTE1MzI2MDE0NywiYXNzZXRfYWdlX2RheXMiOjAsInZpX3VzZWNhc2VfaWQiOjEwMDk5LCJkdXJhdGlvbl9zIjo0LCJ1cmxnZW5fc291cmNlIjoid3d3In0%3D&ccb=17-1&vs=996a95e36b068ae4&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC8xRTRDRDc5MjhCNDAyQjgyRjY5QkU3MEVCNEY2QTM4RF92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyL0ZENDQzNzU1MzY4MUUxMURFRUE4RDU1MkQzRjQ1QUExX2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACbmubz_yKzDBRUCKAJDMywXQBAAAAAAAAAYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQF67FH_T5tzU5b7MP34NziOcLHq9aoVLV4dCYcvtH6ZC3xR_AZvModCCrkU8Ei8CL2-pPTF_UR0iw&oh=00_AQAkXhwoE7f-ZMowE_9hqOTWmhJE_CZK4NbsK0Kp7Gyjxg&oe=6A5A66ED\",\"timestamp\":\"2026-07-15T16:26:18+0000\",\"like_count\":8,\"comments_count\":0}','2026-07-16 07:24:40',0,'2026-07-16 07:24:40','2026-07-16 07:24:40'),(22,4,'instagram','18052642265785639','A big thank you for your thoughtful words and for being a part of the BrowseJobs journey. 💙\n\nKnowing that our guidance is making learning simpler, more practical, and more impactful keeps us motivated to do even better.\n\n💬 Comment “JOB” if you’re looking for career guidance, mentorship, or your next opportunity, we’ll reach out to help!\n\n#BrowseJobs #CareerGuidance #CareerGrowth #JobSearch #Mentorship Upskilling ProfessionalDevelopment FutureReady CareerSuccess LearnAndGrow','VIDEO','https://www.instagram.com/reel/DaxwFDXI7Tx/','https://scontent.cdninstagram.com/v/t51.82787-15/746164080_18067858556710574_4744044857778712016_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=100&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=Jsso7Sc7cOkQ7kNvwFfyaz7&_nc_oc=AdqjNye4BDS9yyDKzMvq7pJCB75s5LFpOCpaRhFylWCLPoZp3YwcS2UimftB-Ccwq6k&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQHuAJJemCSvafDtwHFlh2oRHfH5NWu25Zy5cEohSCTHg2w0H666F5JVjFJj79Vf8AGWKWL57_Cx0Q&oh=00_AQCkzRJKqRWLqcvMKTGUFSonv1UxV7_wb0Zt6Xj8ygEwzA&oe=6A5E74CA','2026-07-14 09:24:21',7,0,NULL,NULL,'{\"id\":\"18052642265785639\",\"caption\":\"A big thank you for your thoughtful words and for being a part of the BrowseJobs journey. \\ud83d\\udc99\\n\\nKnowing that our guidance is making learning simpler, more practical, and more impactful keeps us motivated to do even better.\\n\\n\\ud83d\\udcac Comment \\u201cJOB\\u201d if you\\u2019re looking for career guidance, mentorship, or your next opportunity, we\\u2019ll reach out to help!\\n\\n#BrowseJobs #CareerGuidance #CareerGrowth #JobSearch #Mentorship Upskilling ProfessionalDevelopment FutureReady CareerSuccess LearnAndGrow\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DaxwFDXI7Tx\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/746164080_18067858556710574_4744044857778712016_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=100&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=Jsso7Sc7cOkQ7kNvwFfyaz7&_nc_oc=AdqjNye4BDS9yyDKzMvq7pJCB75s5LFpOCpaRhFylWCLPoZp3YwcS2UimftB-Ccwq6k&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQHuAJJemCSvafDtwHFlh2oRHfH5NWu25Zy5cEohSCTHg2w0H666F5JVjFJj79Vf8AGWKWL57_Cx0Q&oh=00_AQCkzRJKqRWLqcvMKTGUFSonv1UxV7_wb0Zt6Xj8ygEwzA&oe=6A5E74CA\",\"media_url\":\"https:\\/\\/instagram.fblr22-1.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQP8LCvB0d0W2gOHwDkypFnGsmFIXLRFv4z_JXrjXG48hBQRIbm0ke394e310k9E9spo6L-1hcYgKPWguRHmU3pxGon0gXbIDeeYZsE.mp4?_nc_cat=108&_nc_oc=Ador21gPrF6Zb7EPIvavpnSlmV7-YqZNHE80pApqKxHZuOiVNvv5CJnRe3dTo_ojrOQ&_nc_sid=5e9851&_nc_ht=instagram.fblr22-1.fna.fbcdn.net&_nc_ohc=5nPxGPjx7zwQ7kNvwEKTsGf&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNTYwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTM4OTYxMzcxNjM2MTU3NywiYXNzZXRfYWdlX2RheXMiOjEsInZpX3VzZWNhc2VfaWQiOjEwMDk5LCJkdXJhdGlvbl9zIjo0LCJ1cmxnZW5fc291cmNlIjoid3d3In0%3D&ccb=17-1&vs=3e2068c3a4dfd63f&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC9BNjRGMzQ2MzhGN0FEQjYxNEJFNUM0RDIwMDg3RTZCOV92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzJCNEIyNkVFQkRFMzREQ0U5MDU1MDM3NjFERjUxMzhCX2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACbSxYL_lPb3BBUCKAJDMywXQBAAAAAAAAAYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQHeMWz2beqBT5CrV-DkT-_9PWTdFAp9Kg3xrZMndfjYiznUvot-apcmXtIxOvtZDZjEibqc26f_LA&oh=00_AQDIcoXSR_BRURIIOL40K_rl4Wkbk2Seix-z6cDutJ22fA&oe=6A5A6B41\",\"timestamp\":\"2026-07-14T14:54:21+0000\",\"like_count\":7,\"comments_count\":0}','2026-07-16 07:24:40',0,'2026-07-16 07:24:40','2026-07-16 07:24:40'),(23,4,'instagram','18135341935596143','Thank you for your kind words and for trusting BrowseJobs to be a part of your Data Engineering journey. We’re grateful to have been a part of your learning experience and are proud of the dedication and consistency you’ve shown throughout.\n\nWishing you continued success as you grow in your career, we’ll always be cheering you on! 🚀\n\nReady to start your own journey?\n\n💬 Comment “JOB” and we’ll help you take the first step toward your Data Engineering career.\n\n#BrowseJobs #DataEngineering #DataEngineer #TechCareers #CareerGrowth Upskill LearnDataEngineering DataEngineeringTraining CareerSuccess JobReady TechEducation InterviewPreparation','VIDEO','https://www.instagram.com/reel/DapJ2_EIQzr/','https://scontent.cdninstagram.com/v/t51.82787-15/746021235_18067365443710574_5758330229838087839_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=101&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=cKb-Z6qt4_kQ7kNvwHrA0uz&_nc_oc=Adpac4nIGN2oqcneL8p85nkJjQXneCVeXfC2QeB_-K_4vofFmG5UO-NmEzfZcpKwVQk&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQGmnXcy7fogfVUHoYnTaDrhSzaGJ3KgyhSVQlwsshP2bCQxbRK_6MTplAAL05b-XpdfTzP7Yshp4A&oh=00_AQAV_YVJNTYM6XNHDSzupHKAX5WtTB_FC2oj-ttV-BNdGA&oe=6A5E625F','2026-07-11 01:16:24',7,0,NULL,NULL,'{\"id\":\"18135341935596143\",\"caption\":\"Thank you for your kind words and for trusting BrowseJobs to be a part of your Data Engineering journey. We\\u2019re grateful to have been a part of your learning experience and are proud of the dedication and consistency you\\u2019ve shown throughout.\\n\\nWishing you continued success as you grow in your career, we\\u2019ll always be cheering you on! \\ud83d\\ude80\\n\\nReady to start your own journey?\\n\\n\\ud83d\\udcac Comment \\u201cJOB\\u201d and we\\u2019ll help you take the first step toward your Data Engineering career.\\n\\n#BrowseJobs #DataEngineering #DataEngineer #TechCareers #CareerGrowth Upskill LearnDataEngineering DataEngineeringTraining CareerSuccess JobReady TechEducation InterviewPreparation\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DapJ2_EIQzr\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/746021235_18067365443710574_5758330229838087839_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=101&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=cKb-Z6qt4_kQ7kNvwHrA0uz&_nc_oc=Adpac4nIGN2oqcneL8p85nkJjQXneCVeXfC2QeB_-K_4vofFmG5UO-NmEzfZcpKwVQk&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQGmnXcy7fogfVUHoYnTaDrhSzaGJ3KgyhSVQlwsshP2bCQxbRK_6MTplAAL05b-XpdfTzP7Yshp4A&oh=00_AQAV_YVJNTYM6XNHDSzupHKAX5WtTB_FC2oj-ttV-BNdGA&oe=6A5E625F\",\"media_url\":\"https:\\/\\/instagram.fblr22-2.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQN-77yVYNEbvrZGFd576CGHtGjlopm7J3ECmPIxb1txOkjFnRQHBKhzwnhxFuUFX_Xisr_DZHjTx-CIvaWv4sGymXbBCl__NduyF2g.mp4?_nc_cat=107&_nc_oc=Adqqbpk4G9qiHJHMDikPdH4q-hX3ynpbgnLYidoGb_9j77mWM8Bi3A4W6sGOy-SmtGs&_nc_sid=5e9851&_nc_ht=instagram.fblr22-2.fna.fbcdn.net&_nc_ohc=mYojDEjggwYQ7kNvwE_xtNd&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTQ5OTI5MzcwNDg1NzYxNiwiYXNzZXRfYWdlX2RheXMiOjUsInZpX3VzZWNhc2VfaWQiOjEwMDk5LCJkdXJhdGlvbl9zIjo0LCJ1cmxnZW5fc291cmNlIjoid3d3In0%3D&ccb=17-1&vs=ece7bf5e8e423b4&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC82QTRDRDFDNTNCNDA2OTIxQUMzQjVCMTVBM0M1NjdBQl92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzEzNDc2REIyMkNFRDVCREY0MkJBNTQ5N0E1NDAyMEEyX2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACagoInLsOapBRUCKAJDMywXQBAAAAAAAAAYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQFW3LYKggoHb6tUBIgL9c91-CUOo-D2i_JeyZa0MiHQrNJq8Fm-Ll1Ye-utIS0YSRexLHoD-dB4bA&oh=00_AQAo03tc_7XsxQkI4FErueWmahLEQGRm8emiVMbM-umwPQ&oe=6A5A6678\",\"timestamp\":\"2026-07-11T06:46:24+0000\",\"like_count\":7,\"comments_count\":0}','2026-07-16 07:24:40',0,'2026-07-16 07:24:40','2026-07-16 07:24:40'),(24,4,'instagram','18216394231334168','Every success story begins with the decision to learn. 🚀\n\nWe’re grateful to be a part of this incredible journey and proud to see our learners grow with the right guidance, practical skills, and industry-ready training.\n\nThank you for your trust and heartfelt feedback. Wishing you continued success! ❤️\n\n👇 Comment “JOB” to kickstart your Data Engineering journey with us.\n\n#BrowseJobs #DataEngineering #DataEngineer #Python #SQL PySpark AWS ArtificialIntelligence CareerGrowth Upskilling TechCareers JobReady StudentSuccess Testimonial LearnAndGrow','VIDEO','https://www.instagram.com/reel/Dak94EEI6U0/','https://scontent.cdninstagram.com/v/t51.82787-15/742111081_18067137017710574_8103024144720340751_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=108&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=o7mILnTLKrgQ7kNvwEH0t0O&_nc_oc=Adq7WU6GS7axarJYZFV_QKZbgZ9YG2BGaTL3SsDywEJQePTd5LTi1uTwr2COz-xFe9o&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQFmtBXgJGa-rC0TOZnVKOfm-z_6DnjYlBsMw5s2TI0xtoMhoRpDDwQ7a_1cc7oYaHG5C92Y3W1eIA&oh=00_AQBkF6pr8YQWy7EYZLGnj5ACxtHtII6QSPAbfWlbxEigNQ&oe=6A5E6056','2026-07-09 10:15:07',7,0,NULL,NULL,'{\"id\":\"18216394231334168\",\"caption\":\"Every success story begins with the decision to learn. \\ud83d\\ude80\\n\\nWe\\u2019re grateful to be a part of this incredible journey and proud to see our learners grow with the right guidance, practical skills, and industry-ready training.\\n\\nThank you for your trust and heartfelt feedback. Wishing you continued success! \\u2764\\ufe0f\\n\\n\\ud83d\\udc47 Comment \\u201cJOB\\u201d to kickstart your Data Engineering journey with us.\\n\\n#BrowseJobs #DataEngineering #DataEngineer #Python #SQL PySpark AWS ArtificialIntelligence CareerGrowth Upskilling TechCareers JobReady StudentSuccess Testimonial LearnAndGrow\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/Dak94EEI6U0\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/742111081_18067137017710574_8103024144720340751_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=108&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=o7mILnTLKrgQ7kNvwEH0t0O&_nc_oc=Adq7WU6GS7axarJYZFV_QKZbgZ9YG2BGaTL3SsDywEJQePTd5LTi1uTwr2COz-xFe9o&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQFmtBXgJGa-rC0TOZnVKOfm-z_6DnjYlBsMw5s2TI0xtoMhoRpDDwQ7a_1cc7oYaHG5C92Y3W1eIA&oh=00_AQBkF6pr8YQWy7EYZLGnj5ACxtHtII6QSPAbfWlbxEigNQ&oe=6A5E6056\",\"media_url\":\"https:\\/\\/instagram.fblr22-2.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQOH_VzJ7WBEK9YUeh5Dpi87P26GYvEYHejWq76LzbkOkqNa1y4yWCja_HMNgVbR_OHsCEhKJ13so3kPb4B3wgQNN_L8LUBQMSzdjH4.mp4?_nc_cat=103&_nc_oc=Adpl5YTkLeWqQ-eTZlgBZ5HjLLLWUHZ18BDhuXf3gzR-tMnOmSRgB3DVAl1VGrsTlBk&_nc_sid=5e9851&_nc_ht=instagram.fblr22-2.fna.fbcdn.net&_nc_ohc=XgdZpdXfMmQQ7kNvwEr31J7&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MjAzODMwNTkxMDM4OTM2NCwiYXNzZXRfYWdlX2RheXMiOjYsInZpX3VzZWNhc2VfaWQiOjEwMDk5LCJkdXJhdGlvbl9zIjo2LCJ1cmxnZW5fc291cmNlIjoid3d3In0%3D&ccb=17-1&vs=1ffe9d89957ec07e&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC8yOTQxOUZDNUZGMDE1MDM1RDkzOEY4Q0JFM0FFNjNBNV92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzBENDhDNjg3MzNGM0NDOURBRkQ5NkY3QTRCQzE4NjlCX2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACbo6du7gvWeBxUCKAJDMywXQBm7ZFocrAgYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQH8Yps2W4Md3yD9JA6Zux8RfBwGSHlajpV5T67RUlkdoK7Od0qlIEWbF4pbztNbyS9cq5KuwI2pSQ&oh=00_AQBLTKw1SN27Ev2lKgzseYPWmtAjLzQYtYzs46qJ8jWc1w&oe=6A5A7E9C\",\"timestamp\":\"2026-07-09T15:45:07+0000\",\"like_count\":7,\"comments_count\":0}','2026-07-16 07:24:40',0,'2026-07-16 07:24:40','2026-07-16 07:24:40'),(25,4,'instagram','17954280795197929','Congratulations on your new role, and thank you for trusting BrowseJobs to be a part of your journey. \nWe’re grateful to have supported you every step of the way and wish you continued success in your career! 💙\n\n🚀 Looking for your next opportunity?\n💬 Comment “JOB” and we’ll help you take the next step in your career.\n\nYour success story could be the next one we celebrate! 🌟\n\n#BrowseJobs #SuccessStory #JobSearch #CareerGrowth #Hiring Jobs CareerSupport DreamJob PlacementSuccess InterviewPreparation','VIDEO','https://www.instagram.com/reel/Daiish2Ih2t/','https://scontent.cdninstagram.com/v/t51.82787-15/736153976_18066993500710574_3648239230484902651_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=104&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=gsjCSeVPU_cQ7kNvwELX0-9&_nc_oc=Adq0h2SD0KI3GMzsn8BruhjtShf-GHo0Hz78MB3QQeZGFMfaREwADhMT-itlDPRogO8&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQGHnw1Rlk0n3T9B3Wzzato1SUFjPXKABfGRvQShK3W_GHKCQP7DzSjodQHjbLWhazeFqIAbcmBirw&oh=00_AQBpHmNoL_WjW3IV15kt_rgeg4PYmOVAvUk2bC3bL11vbA&oe=6A5E68EB','2026-07-08 11:38:55',5,0,NULL,NULL,'{\"id\":\"17954280795197929\",\"caption\":\"Congratulations on your new role, and thank you for trusting BrowseJobs to be a part of your journey. \\nWe\\u2019re grateful to have supported you every step of the way and wish you continued success in your career! \\ud83d\\udc99\\n\\n\\ud83d\\ude80 Looking for your next opportunity?\\n\\ud83d\\udcac Comment \\u201cJOB\\u201d and we\\u2019ll help you take the next step in your career.\\n\\nYour success story could be the next one we celebrate! \\ud83c\\udf1f\\n\\n#BrowseJobs #SuccessStory #JobSearch #CareerGrowth #Hiring Jobs CareerSupport DreamJob PlacementSuccess InterviewPreparation\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/Daiish2Ih2t\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/736153976_18066993500710574_3648239230484902651_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=104&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=gsjCSeVPU_cQ7kNvwELX0-9&_nc_oc=Adq0h2SD0KI3GMzsn8BruhjtShf-GHo0Hz78MB3QQeZGFMfaREwADhMT-itlDPRogO8&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQGHnw1Rlk0n3T9B3Wzzato1SUFjPXKABfGRvQShK3W_GHKCQP7DzSjodQHjbLWhazeFqIAbcmBirw&oh=00_AQBpHmNoL_WjW3IV15kt_rgeg4PYmOVAvUk2bC3bL11vbA&oe=6A5E68EB\",\"media_url\":\"https:\\/\\/instagram.fblr22-2.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQN8BnyfVJTdOa56UHPXxACRvtyyzfDNg6FHNFFRU0qAZQtv35993w7muSGRUS_dGWEt8IGgUp-ULfKdUF6HzJ6GAYFgDCAZfKXVhIw.mp4?_nc_cat=104&_nc_oc=AdpeK9wdOgkZb3jWpLEFmluDdeARGeTPJAc6XF8OSJO7hyWyF0dG72QdGjs876p9Z4w&_nc_sid=5e9851&_nc_ht=instagram.fblr22-2.fna.fbcdn.net&_nc_ohc=FHBJ4-sgxRIQ7kNvwEGENCG&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MjQ4MjA1MDUzNTYzMTI0OSwiYXNzZXRfYWdlX2RheXMiOjcsInZpX3VzZWNhc2VfaWQiOjEwMDk5LCJkdXJhdGlvbl9zIjo0LCJ1cmxnZW5fc291cmNlIjoid3d3In0%3D&ccb=17-1&vs=88939125b8c55a1d&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC8wQzQ4QjNCM0MwQjZGQjcxNkU4NUZENzg2MTVGMzc5Ml92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzVFNEVCRjE3NzlCNUQwNzc5QjdBQjQ3MzJFNUEyNjk4X2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACaipu3HrdroCBUCKAJDMywXQBAAAAAAAAAYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQGiYpLzm_lkTw0_IH54Szp8TUkIBisTPVOwjRy00bG8QL3S5NQxMiqVZHanR3oDLZPFR6DQzSgvmw&oh=00_AQBr6-4X-NNgALgyH-kjdQSqTrNoO5bjucjAD8ZomOP2dA&oe=6A5A56F9\",\"timestamp\":\"2026-07-08T17:08:55+0000\",\"like_count\":5,\"comments_count\":0}','2026-07-16 07:24:40',0,'2026-07-16 07:24:40','2026-07-16 07:24:40'),(26,4,'instagram','18088316918404242','Your career changes the moment you find the right mentor.\n\nIn this one-minute clip, our student shares how Dr. Krish Bharggav’s practical guidance helped her friend gain confidence, master industry skills, and move closer to his dream tech career.\n\nEvery career breakthrough starts with the right mentor.\n\n✨ Want to become our next success story?\nComment “JOB” below or DM us today, and let’s build your roadmap to a successful tech career.\n\n[masterclass, browsejobs, DrKrishBharggav, careerguidance, dataengineering, techcareer, explore, reel]\n\n#BrowseJobs #CareerGrowth #SuccessStory #TechCareer #DataEngineering Mentorship LearnAndGrow','VIDEO','https://www.instagram.com/reel/DaViHsOoEfw/','https://scontent.cdninstagram.com/v/t51.71878-15/729062367_1394044269230744_4005421580505432652_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=107&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=yj8GUamTi5MQ7kNvwFichrS&_nc_oc=AdqqM46RD5pQPleWmsF5_dlK8AbBL30zzMVgIF3rNJ0-48mkHZI3CzTtcae6fPwK51o&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQGCuj6CA3dq9QpBCLsWzoRe9YQr0QTYV5ObOYbB1JKbFzlXgZiE2b_IhIFFNMjFKfjWDiAbj-gZZg&oh=00_AQA9iyIqNnx87YMjcp2gFm4_oeUsjU51kNYXpUkxX7CBDg&oe=6A5E6719','2026-07-03 10:24:01',22,0,NULL,NULL,'{\"id\":\"18088316918404242\",\"caption\":\"Your career changes the moment you find the right mentor.\\n\\nIn this one-minute clip, our student shares how Dr. Krish Bharggav\\u2019s practical guidance helped her friend gain confidence, master industry skills, and move closer to his dream tech career.\\n\\nEvery career breakthrough starts with the right mentor.\\n\\n\\u2728 Want to become our next success story?\\nComment \\u201cJOB\\u201d below or DM us today, and let\\u2019s build your roadmap to a successful tech career.\\n\\n[masterclass, browsejobs, DrKrishBharggav, careerguidance, dataengineering, techcareer, explore, reel]\\n\\n#BrowseJobs #CareerGrowth #SuccessStory #TechCareer #DataEngineering Mentorship LearnAndGrow\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DaViHsOoEfw\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.71878-15\\/729062367_1394044269230744_4005421580505432652_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=107&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=yj8GUamTi5MQ7kNvwFichrS&_nc_oc=AdqqM46RD5pQPleWmsF5_dlK8AbBL30zzMVgIF3rNJ0-48mkHZI3CzTtcae6fPwK51o&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQGCuj6CA3dq9QpBCLsWzoRe9YQr0QTYV5ObOYbB1JKbFzlXgZiE2b_IhIFFNMjFKfjWDiAbj-gZZg&oh=00_AQA9iyIqNnx87YMjcp2gFm4_oeUsjU51kNYXpUkxX7CBDg&oe=6A5E6719\",\"media_url\":\"https:\\/\\/instagram.fblr22-1.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQMWQbzIO-UYmqQXhXXjZ_UIIsOGW342TwJ10rxrLmtMAmXMdMog6qBlCtVdlYyqVythFpKD6T7aDBlYn3FHNXd-xnPfMbIQG33oxCA.mp4?_nc_cat=104&_nc_oc=AdpE_ASDJLwVKFr2sIA_SFT49d4ojcZ3bRd1KSGmF_G18ZUCXrdjBw0WBK4ysIUTytU&_nc_sid=5e9851&_nc_ht=instagram.fblr22-1.fna.fbcdn.net&_nc_ohc=sbVcGAVnvdYQ7kNvwHw-C0K&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTUyODc5ODUzMjI3NDQxNCwiYXNzZXRfYWdlX2RheXMiOjEyLCJ2aV91c2VjYXNlX2lkIjoxMDgyNywiZHVyYXRpb25fcyI6MTQ4LCJ1cmxnZW5fc291cmNlIjoid3d3In0%3D&ccb=17-1&vs=38d7a011479bc774&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC81QTQ5QkVBQjJDQzgwOUM2NTg0REFGQkFEODhBNzhCRF92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzQyNDA4NUQ1ODAyNkM4MjU0REM1RkE4NzdDQjI0QTg4X2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACbco5jX5Ju3BRUCKAJDMywXQGKBDlYEGJMYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZZapAQA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQGC28uDBKn9FPd5h1oGJsLkEzCigH_N1O1G_cVx9r20PUP6-nOWZScXMzj2FggIQi9Kpe5WqXfBNg&oh=00_AQBQ53B-gtpKlZpgNMGF-cc8xFqAgA4vvv29ClgRqu2VRg&oe=6A5A78D9\",\"timestamp\":\"2026-07-03T15:54:01+0000\",\"like_count\":22,\"comments_count\":0}','2026-07-16 07:24:40',0,'2026-07-16 07:24:40','2026-07-16 07:24:40'),(27,4,'instagram','17912468538425035','Every success story starts with one decision, to learn, grow, and take the next step. 🚀\n\nWe’re proud to be a part of our learners’ journeys and grateful for every word of appreciation. Here’s to building more careers and creating more success stories! 💙\n\nLooking for your next career opportunity? Comment “JOB” below, and we’ll help you get started! 👇\n\n#Browsejobs #SuccessStories #StudentReview #CareerGrowth #DataEngineering Upskill LearningThatWorks Jobs Hiring CareerSupport','VIDEO','https://www.instagram.com/reel/DaVWjlTpsHQ/','https://scontent.cdninstagram.com/v/t51.82787-15/731015874_18066209789710574_7994024716820047920_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=100&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=a0dxgr6S-v4Q7kNvwEGquHk&_nc_oc=Adrfwf9JBgQP-3hSSfs1E5pyKs0BYXINMstyUqql1r7cw5gL6CJKC1mKv_mTToOrBeA&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQGcF8P0PLZZ6i9j2ga4VdsIJhhIfJqeHatjpIB0Lf9UiopoK1EUkZblMQYUW-nIyNsrHPb7I8RsLw&oh=00_AQAayhWXfCCYliidSRFudmhf0uhddJDV3Gl9kx8Da-w7kQ&oe=6A5E5395','2026-07-03 08:43:01',8,0,NULL,NULL,'{\"id\":\"17912468538425035\",\"caption\":\"Every success story starts with one decision, to learn, grow, and take the next step. \\ud83d\\ude80\\n\\nWe\\u2019re proud to be a part of our learners\\u2019 journeys and grateful for every word of appreciation. Here\\u2019s to building more careers and creating more success stories! \\ud83d\\udc99\\n\\nLooking for your next career opportunity? Comment \\u201cJOB\\u201d below, and we\\u2019ll help you get started! \\ud83d\\udc47\\n\\n#Browsejobs #SuccessStories #StudentReview #CareerGrowth #DataEngineering Upskill LearningThatWorks Jobs Hiring CareerSupport\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DaVWjlTpsHQ\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/731015874_18066209789710574_7994024716820047920_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=100&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=a0dxgr6S-v4Q7kNvwEGquHk&_nc_oc=Adrfwf9JBgQP-3hSSfs1E5pyKs0BYXINMstyUqql1r7cw5gL6CJKC1mKv_mTToOrBeA&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQGcF8P0PLZZ6i9j2ga4VdsIJhhIfJqeHatjpIB0Lf9UiopoK1EUkZblMQYUW-nIyNsrHPb7I8RsLw&oh=00_AQAayhWXfCCYliidSRFudmhf0uhddJDV3Gl9kx8Da-w7kQ&oe=6A5E5395\",\"media_url\":\"https:\\/\\/instagram.fblr22-1.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQOMFHPFeSLHXYouX70_Jry37CF-pvKfmzTKXNZZt4A8uhI_5TX05KyOMcfFxrHOigreMqJiC01Dxevx1UDt5LyifzwXCKTOybo0ZMg.mp4?_nc_cat=108&_nc_oc=Adqo9l0l366d3YqTWt2XB1MNiFijWIR87tXxoT4oq8jQKgbj_tRzwd2t7T8maKQgRqQ&_nc_sid=5e9851&_nc_ht=instagram.fblr22-1.fna.fbcdn.net&_nc_ohc=Emnepcq6RDkQ7kNvwF5dFNp&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MjIxNDExMTc2MjcwNzYyMiwiYXNzZXRfYWdlX2RheXMiOjEyLCJ2aV91c2VjYXNlX2lkIjoxMDA5OSwiZHVyYXRpb25fcyI6NCwidXJsZ2VuX3NvdXJjZSI6Ind3dyJ9&ccb=17-1&vs=27e8814595bb69b4&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC82RjQzMzMxMTNDOTIwQkMzMTc3Q0YxODZFMDkwQzhCOF92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzBCNDE0NDIyRTBENTI2MjYzRjk2OTE5NDEwNTFGMjgzX2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACbM0t-Rou7uBxUCKAJDMywXQBAAAAAAAAAYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQEmVt9rQnHdMzObcoiYgwxMR2gfKBDfNOYLyE38s87EZZJi_b-lAWbgFoH6BM6nQeSqaGcyjtFBaA&oh=00_AQDOOokFZmfVjV6ZPUfyS-8JEO7tupxIHbqZWKca46atqg&oe=6A5A4A6D\",\"timestamp\":\"2026-07-03T14:13:01+0000\",\"like_count\":8,\"comments_count\":0}','2026-07-16 07:24:40',0,'2026-07-16 07:24:40','2026-07-16 07:24:40'),(28,4,'instagram','18361170904212848','A few words of encouragement can change the way you see yourself.\n\nIn this powerful moment from the Browsejob Masterclass, Dr. Krish Bharggav reminds a student that confidence can be the biggest game-changer in any interview. Stop overthinking, trust your skills, and own the room.\n\nYour dream career starts with the right mindset, and the right mentor.\n\nReady to build yours?\n\nComment “JOB” below or DM us today, and let’s create your roadmap to a successful tech career.\n\n[masterclass, browsejob, DrKrishBharggav, interview confidence, tech careers, career growth, mentorship, student success, job readiness, motivation]\n\n#Browsejob #DrKrishBharggav #CareerGrowth #InterviewTips #TechCareers Mentorship StudentSuccess JobReady Masterclass','VIDEO','https://www.instagram.com/reel/DaSiCuQpQe1/','https://scontent.cdninstagram.com/v/t51.71878-15/731754693_974810058710462_8196167140740095400_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=106&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=S7ZwlqARFaMQ7kNvwGtTwJ-&_nc_oc=Adq6qQ497P6kJeEciS9dM3ZLYEhZKhZoowVd0f9sQsmgdwDaym_NP5759wxoFcdYT5k&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQFZxOwiF8b7g_PK7Bg0zDlFk86ltSrzkSje8WyEZVteYaRpzxdSVOOAk0V_3VQhY2IqpZ-gkKTO0g&oh=00_AQCvubMGDZ7Mb-qvSiCUh_IPJMnEe0_h1PF17zkgB9888w&oe=6A5E60F5','2026-07-02 06:25:14',16,0,NULL,NULL,'{\"id\":\"18361170904212848\",\"caption\":\"A few words of encouragement can change the way you see yourself.\\n\\nIn this powerful moment from the Browsejob Masterclass, Dr. Krish Bharggav reminds a student that confidence can be the biggest game-changer in any interview. Stop overthinking, trust your skills, and own the room.\\n\\nYour dream career starts with the right mindset, and the right mentor.\\n\\nReady to build yours?\\n\\nComment \\u201cJOB\\u201d below or DM us today, and let\\u2019s create your roadmap to a successful tech career.\\n\\n[masterclass, browsejob, DrKrishBharggav, interview confidence, tech careers, career growth, mentorship, student success, job readiness, motivation]\\n\\n#Browsejob #DrKrishBharggav #CareerGrowth #InterviewTips #TechCareers Mentorship StudentSuccess JobReady Masterclass\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DaSiCuQpQe1\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.71878-15\\/731754693_974810058710462_8196167140740095400_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=106&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=S7ZwlqARFaMQ7kNvwGtTwJ-&_nc_oc=Adq6qQ497P6kJeEciS9dM3ZLYEhZKhZoowVd0f9sQsmgdwDaym_NP5759wxoFcdYT5k&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQFZxOwiF8b7g_PK7Bg0zDlFk86ltSrzkSje8WyEZVteYaRpzxdSVOOAk0V_3VQhY2IqpZ-gkKTO0g&oh=00_AQCvubMGDZ7Mb-qvSiCUh_IPJMnEe0_h1PF17zkgB9888w&oe=6A5E60F5\",\"media_url\":\"https:\\/\\/instagram.fblr22-1.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQNXIRhwWOzeG-P-MsHtIxHkl1U6U6S_HvrCFDWsE5gFslFgpTjRt7quuvq5dOia-Hs_gsaMYtieKKAWKyhoovoocrRNxkexECEzje4.mp4?_nc_cat=103&_nc_oc=Adpp_2XDaYiX7WGIIusDvFPQusOtSe0h2-cbsU4x8LR7gg4r8kNBH7wJYKL12i2N2uU&_nc_sid=5e9851&_nc_ht=instagram.fblr22-1.fna.fbcdn.net&_nc_ohc=y6vGoksdW_EQ7kNvwGfYiB5&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTAxOTQ0OTI1NzUwNDU3NSwiYXNzZXRfYWdlX2RheXMiOjEzLCJ2aV91c2VjYXNlX2lkIjoxMDgyNywiZHVyYXRpb25fcyI6NzIsInVybGdlbl9zb3VyY2UiOiJ3d3cifQ%3D%3D&ccb=17-1&vs=c083b638d4598dc2&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC81NTQ2OENCN0RBOTZCN0NFMUQ5NDVCMjdCRkZCRDdBRV92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzM3NDBBNTVFRjQyODlDREQ3M0FGMUFCOTE0QUNFOEE1X2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACb-vOHt4MvPAxUCKAJDMywXQFI90vGp--cYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZZapAQA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQGD13W1KczuK9J_Hl5rED3P-iRwuUyghHc2IEw2aqBUrAaQUCN4WLh8G-Ng6tY564kSKcRqcyps8Q&oh=00_AQCE62VIEmHgvZPtCN7XVZ6c3iCNAsY644T_DIRJYF2pMA&oe=6A5A5FDC\",\"timestamp\":\"2026-07-02T11:55:14+0000\",\"like_count\":16,\"comments_count\":0}','2026-07-16 07:24:40',0,'2026-07-16 07:24:40','2026-07-16 07:24:40'),(29,4,'instagram','18123729220677837','“I was confused after graduation…”\nThat’s how many journeys begin.\n\nWith the right mentorship, practical learning, and consistent support, uncertainty can turn into confidence.\n\nThank you for sharing your journey with us. Your words inspire us to keep helping more learners every day. ❤️\n\nIf you’re still figuring out your career path, comment “JOB” and let us help you get started.\n\n#Browsejob #SuccessStory #DataEngineering #TechCareers #CareerGrowth Mentorship JobReady Explore fyp','VIDEO','https://www.instagram.com/reel/DaSbQyapxHH/','https://scontent.cdninstagram.com/v/t51.71878-15/730122552_1012250844780862_4362369984265534460_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=103&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=7eclhpSY4pIQ7kNvwFoQYrw&_nc_oc=AdqeIRMduKXgsO8Gq95tQc1vjm_0J0-LNE00a6B3QRqHtY_JOf0Zscory2MRgLUtlWo&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQFUFRBVBo-LnrrgxtbXERk5EuPn8skJli9_p2pjZrHwE-V5uffGBW25BMwLzjIe3lU8GaSYCMdOfg&oh=00_AQCdH2TQTt7dxaKPpHu6ZqiYnokw-6lUgIaG-TQRfn0kjw&oe=6A5E7331','2026-07-02 05:26:42',8,0,NULL,NULL,'{\"id\":\"18123729220677837\",\"caption\":\"\\u201cI was confused after graduation\\u2026\\u201d\\nThat\\u2019s how many journeys begin.\\n\\nWith the right mentorship, practical learning, and consistent support, uncertainty can turn into confidence.\\n\\nThank you for sharing your journey with us. Your words inspire us to keep helping more learners every day. \\u2764\\ufe0f\\n\\nIf you\\u2019re still figuring out your career path, comment \\u201cJOB\\u201d and let us help you get started.\\n\\n#Browsejob #SuccessStory #DataEngineering #TechCareers #CareerGrowth Mentorship JobReady Explore fyp\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DaSbQyapxHH\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.71878-15\\/730122552_1012250844780862_4362369984265534460_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=103&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=7eclhpSY4pIQ7kNvwFoQYrw&_nc_oc=AdqeIRMduKXgsO8Gq95tQc1vjm_0J0-LNE00a6B3QRqHtY_JOf0Zscory2MRgLUtlWo&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQFUFRBVBo-LnrrgxtbXERk5EuPn8skJli9_p2pjZrHwE-V5uffGBW25BMwLzjIe3lU8GaSYCMdOfg&oh=00_AQCdH2TQTt7dxaKPpHu6ZqiYnokw-6lUgIaG-TQRfn0kjw&oe=6A5E7331\",\"media_url\":\"https:\\/\\/instagram.fblr22-2.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQN0fLPpj-csAfajcJ5Dyu6XnivUkVHk7yF7yRj7etR7T0Au0E-l7kgtu6o3tsDoUOYALEM6GzVhN51gCTv2UF-Ydld1hpdwlsARgQE.mp4?_nc_cat=103&_nc_oc=Adq4WmKM4VWihkuIZiKalUN_zfIYYRuHSrjDW258n9DO5noqr16zZVJ49PLKarkADHM&_nc_sid=5e9851&_nc_ht=instagram.fblr22-2.fna.fbcdn.net&_nc_ohc=WnNRNO5dTu0Q7kNvwEeSVRD&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MjAxNjY4MTk0NTYwOTU3NSwiYXNzZXRfYWdlX2RheXMiOjEzLCJ2aV91c2VjYXNlX2lkIjoxMDA5OSwiZHVyYXRpb25fcyI6NCwidXJsZ2VuX3NvdXJjZSI6Ind3dyJ9&ccb=17-1&vs=cff9357214816867&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC9FOTQ3MjM3OUREODMxMDc3QzRDNzk0NDI1NUVCMTA5N192aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyL0NGNDQxNURDODA2Q0I1MTA2NTI1NzA5MjUxQTlDQjk2X2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACbO1fGvq4qVBxUCKAJDMywXQBAAAAAAAAAYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQG-DbwVxk_a91V7aoYuh945wsQBx09AuA9iLyZYAs-cPMkL5imxt6mD0tQvyGl_KT6ZRa9LHmxcRg&oh=00_AQAjkv0UQu1mPfmkLPq5-BEVFTTcODmkqKvuRbR41usR6g&oe=6A5A7170\",\"timestamp\":\"2026-07-02T10:56:42+0000\",\"like_count\":8,\"comments_count\":0}','2026-07-16 07:24:40',0,'2026-07-16 07:24:40','2026-07-16 07:24:40'),(30,4,'instagram','18142668808480993','Another success story. Another career transformed. 🚀\n\nFrom learning the fundamentals of Data Engineering to landing a job, this is what consistent effort and the right mentorship can achieve.\n\nReady to write your own success story?\n\n💬 Comment “JOB” below or DM us to learn how Browsejob can help you build a career in tech.\n\n#Browsejob #SuccessStory #DataEngineering #TechCareers #CareerGrowth Mentorship JobReady','VIDEO','https://www.instagram.com/reel/DaP5yFFIdzh/','https://scontent.cdninstagram.com/v/t51.82787-15/730451427_18065908055710574_6376120192377692260_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=109&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=o5kd4oPhJiwQ7kNvwEjbmnK&_nc_oc=Adogx_qCedW3jPW9t28mBaobCWsqCNTy3w7ykoYEQTS4e8go8d3blJwFXT7ryaAblX8&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQEb73hhQ7OlpJxPeC011gkgTRwSzyGyHkLeMpPfOOK9yraoDlKhZBLr9rlwA0KOKKKymSTIwbdaBQ&oh=00_AQCa9H3O7KBz3QqOxO4Jpqal-yt8nu-X-AupmaEroe4Tow&oe=6A5E456A','2026-07-01 05:54:49',9,0,NULL,NULL,'{\"id\":\"18142668808480993\",\"caption\":\"Another success story. Another career transformed. \\ud83d\\ude80\\n\\nFrom learning the fundamentals of Data Engineering to landing a job, this is what consistent effort and the right mentorship can achieve.\\n\\nReady to write your own success story?\\n\\n\\ud83d\\udcac Comment \\u201cJOB\\u201d below or DM us to learn how Browsejob can help you build a career in tech.\\n\\n#Browsejob #SuccessStory #DataEngineering #TechCareers #CareerGrowth Mentorship JobReady\",\"media_type\":\"VIDEO\",\"permalink\":\"https:\\/\\/www.instagram.com\\/reel\\/DaP5yFFIdzh\\/\",\"thumbnail_url\":\"https:\\/\\/scontent.cdninstagram.com\\/v\\/t51.82787-15\\/730451427_18065908055710574_6376120192377692260_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=109&ccb=7-5&_nc_sid=18de74&efg=eyJlZmdfdGFnIjoiQ0xJUFMuYmVzdF9pbWFnZV91cmxnZW4uQzMifQ%3D%3D&_nc_ohc=o5kd4oPhJiwQ7kNvwEjbmnK&_nc_oc=Adogx_qCedW3jPW9t28mBaobCWsqCNTy3w7ykoYEQTS4e8go8d3blJwFXT7ryaAblX8&_nc_zt=23&_nc_ht=scontent.cdninstagram.com&edm=ANo9K5cEAAAA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&_nc_tpa=Q5bMBQEb73hhQ7OlpJxPeC011gkgTRwSzyGyHkLeMpPfOOK9yraoDlKhZBLr9rlwA0KOKKKymSTIwbdaBQ&oh=00_AQCa9H3O7KBz3QqOxO4Jpqal-yt8nu-X-AupmaEroe4Tow&oe=6A5E456A\",\"media_url\":\"https:\\/\\/instagram.fblr22-1.fna.fbcdn.net\\/o1\\/v\\/t2\\/f2\\/m86\\/AQMxI9VguUwMFq8C-JpGbT1Ukl0cvsVLz246a8tLXraCAbVCS5ttBBSH3Lq9YhKKH0hoHpkhlGdU-u4WzkUyGYF-lE0oH5JtKtw-4r4.mp4?_nc_cat=101&_nc_oc=AdoUg0ZltZrlUghvqggkWGAAABVrCYOftUFhJxhYhy5mJCV-TXfEtaEMpH3OIGfQ7no&_nc_sid=5e9851&_nc_ht=instagram.fblr22-1.fna.fbcdn.net&_nc_ohc=789vz8mIKjkQ7kNvwHR-dGW&efg=eyJ2ZW5jb2RlX3RhZyI6Inhwdl9wcm9ncmVzc2l2ZS5JTlNUQUdSQU0uQ0xJUFMuQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSIsInhwdl9hc3NldF9pZCI6MTczOTk2NzA5NzEzMzA5MSwiYXNzZXRfYWdlX2RheXMiOjE0LCJ2aV91c2VjYXNlX2lkIjoxMDA5OSwiZHVyYXRpb25fcyI6NCwidXJsZ2VuX3NvdXJjZSI6Ind3dyJ9&ccb=17-1&vs=a0ef7cf35d7a2841&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC9GQTRFQThCNTRBNUVERTUzMzNBMURBQzM0REUzMEU4Ql92aWRlb19kYXNoaW5pdC5tcDQVAALIARIAFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzMzNENENTAzNkEyMDQ4RkVENTk3NzVBOEM3QjlFOEFGX2F1ZGlvX2Rhc2hpbml0Lm1wNBUCAsgBEgAoABgAGwKIB3VzZV9vaWwBMRJwcm9ncmVzc2l2ZV9yZWNpcGUBMRUAACbG4PaLtZ-XBhUCKAJDMywXQBAAAAAAAAAYEmRhc2hfYmFzZWxpbmVfMV92MREAdf4HZeadAQA&_nc_gid=IBaIChoNodyvh5K4YmLiFg&edm=ANo9K5cEAAAA&_nc_map=urlgen_bucketless&_nc_zt=28&_nc_tpa=Q5bMBQHbWEh8XocaYA1M9u-HNqrbE8yXFBv5wjCwVy4WPTGc24PTvt7guZSWJpaZ9MBkFa0eQKwP_Ey-fg&oh=00_AQDU9k08mwxkQvct989Dxo6Jd8L4X8_YcpzBgBhe3Gfpsg&oe=6A5A5712\",\"timestamp\":\"2026-07-01T11:24:49+0000\",\"like_count\":9,\"comments_count\":0}','2026-07-16 07:24:40',0,'2026-07-16 07:24:40','2026-07-16 07:24:40'),(31,6,'youtube','3Ij-qAFlydU','🚨Will AI Replace Engineers in 5 Years? | Vidya Setlur on the Future of Tech Jobs | @Tableau','VIDEO','https://www.youtube.com/watch?v=3Ij-qAFlydU','https://i.ytimg.com/vi/3Ij-qAFlydU/mqdefault.jpg','2026-07-10 03:00:32',1,0,NULL,85,'{\"kind\":\"youtube#playlistItem\",\"etag\":\"5vXkxJeiOQihFduXd58dCGMnVX8\",\"id\":\"VVVsVFVvSDlwa1lkRGNDeEJiQUk3a0xnLjNJai1xQUZseWRV\",\"snippet\":{\"publishedAt\":\"2026-07-10T08:30:32Z\",\"channelId\":\"UClTUoH9pkYdDcCxBbAI7kLg\",\"title\":\"\\ud83d\\udea8Will AI Replace Engineers in 5 Years? | Vidya Setlur on the Future of Tech Jobs | @Tableau\",\"description\":\"Will AI reduce the need for software engineers over the next five years?\\n\\nIn this clip, Dr. Krish Bharggav raises one of the biggest concerns in tech today: as AI continues to improve, will companies need fewer engineers than they do today?\\n\\nVidya Setlur, Head of Tableau Research (Senior Director), shares her perspective on the ongoing transformation. While organizations are becoming more efficient and hiring patterns are changing, she believes the answer isn\'t to fear AI\\u2014it\'s to continuously upskill and adapt.\\n\\nAs companies evolve, so must professionals. The future belongs to those who are willing to learn new technologies and stay relevant in an AI-driven world.\\n\\nIf you\'re a software engineer, data professional, student, or anyone building a career in tech, this is a conversation you don\'t want to miss.\\n\\n\\ud83c\\udf99\\ufe0f Full Episode: https:\\/\\/youtu.be\\/-bpsTpWwY0Q?si=3qEEfm-tR3dYYWrT\\n\\n\\ud83c\\udf99\\ufe0f Moment from The Offer Letter with Dr. Krish Bharggav\\n\\nGuest: Vidya Setlur, Head of @Tableau  Research (Senior Director)\\n\\nHost: Dr. Krish Bharggav, Founder & CEO of @Browsejobs and @TaurusAI \\n\\n\\ud83d\\udd14 Subscribe & hit the bell \\u2014 new episodes every Sunday: https:\\/\\/www.youtube.com\\/@TheOfferLetter6\\n\\n\\ud83d\\udcf8 @theofferletter6 | @drkrishbharggav6666\\n\\n\\ud83c\\udf10 [www.browsejobs.in] | (http:\\/\\/www.browsejobs.in) | https:\\/\\/www.instagram.com\\/taurus_ai\\/\\n\\n\\ud83d\\udca1 Looking to switch domains? In a career gap? Want to break into IT? A UPSC candidate?\\n\\nJoin our FREE Masterclass \\ud83d\\udc49 https:\\/\\/forms.gle\\/hVnQPFgV8iyCwrrcA\\n\\n#VidyaSetlur #AI #SoftwareEngineering #FutureOfWork #Upskilling #CareerGrowth #TechJobs #ArtificialIntelligence #BrowseJobs #TaurusAI #TheOfferLetter\",\"thumbnails\":{\"default\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/3Ij-qAFlydU\\/default.jpg\",\"width\":120,\"height\":90},\"medium\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/3Ij-qAFlydU\\/mqdefault.jpg\",\"width\":320,\"height\":180},\"high\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/3Ij-qAFlydU\\/hqdefault.jpg\",\"width\":480,\"height\":360},\"standard\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/3Ij-qAFlydU\\/sddefault.jpg\",\"width\":640,\"height\":480},\"maxres\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/3Ij-qAFlydU\\/maxresdefault.jpg\",\"width\":1280,\"height\":720}},\"channelTitle\":\"The Offer Letter with Dr. Krish Bharggav\",\"playlistId\":\"UUlTUoH9pkYdDcCxBbAI7kLg\",\"position\":0,\"resourceId\":{\"kind\":\"youtube#video\",\"videoId\":\"3Ij-qAFlydU\"},\"videoOwnerChannelTitle\":\"The Offer Letter with Dr. Krish Bharggav\",\"videoOwnerChannelId\":\"UClTUoH9pkYdDcCxBbAI7kLg\"},\"contentDetails\":{\"videoId\":\"3Ij-qAFlydU\",\"videoPublishedAt\":\"2026-07-10T08:30:32Z\"}}','2026-07-16 07:24:41',0,'2026-07-16 07:24:41','2026-07-16 07:24:41'),(32,6,'youtube','jwxLEAYZBco','🤯 Why Data Ingestion Is Still One of AI\'s Biggest Challenges | Vidya Setlur | @TheOfferLetter6','VIDEO','https://www.youtube.com/watch?v=jwxLEAYZBco','https://i.ytimg.com/vi/jwxLEAYZBco/mqdefault.jpg','2026-07-09 05:42:20',5,0,NULL,28,'{\"kind\":\"youtube#playlistItem\",\"etag\":\"x_atlQuVBI2Wtf45Lur9IJrxfwk\",\"id\":\"VVVsVFVvSDlwa1lkRGNDeEJiQUk3a0xnLmp3eExFQVlaQmNv\",\"snippet\":{\"publishedAt\":\"2026-07-09T11:12:20Z\",\"channelId\":\"UClTUoH9pkYdDcCxBbAI7kLg\",\"title\":\"\\ud83e\\udd2f Why Data Ingestion Is Still One of AI\'s Biggest Challenges | Vidya Setlur | @TheOfferLetter6\",\"description\":\"Everyone talks about AI models but what about the data behind them?\\n\\nIn this clip, Vidya Setlur, Head of Tableau Research (Senior Director), explains why data ingestion remains one of the biggest unsolved challenges in AI.\\n\\nAs organizations deal with rapidly growing volumes of structured and unstructured data, simply building better AI models isn\'t enough. The real challenge is ingesting, organizing, and making sense of data at scale.\\n\\nVidya also discusses how technologies like RAG (Retrieval-Augmented Generation) are changing the way AI systems access and process information, opening new possibilities while creating new research challenges.\\n\\nIf you\'re working in AI, data engineering, analytics, or enterprise technology, this conversation highlights one of the most important problems the industry is still trying to solve.\\n\\n\\ud83c\\udf99\\ufe0f Full Episode:\\u00a0https:\\/\\/youtu.be\\/-bpsTpWwY0Q?si=3qEEfm-tR3dYYWrT\\n\\n\\ud83c\\udf99\\ufe0f Moment from The Offer Letter with Dr. Krish Bharggav\\n\\nGuest: Vidya Setlur, Head of @Tableau  Research (Senior Director)\\n\\nHost: Dr. Krish Bharggav, Founder & CEO of @Browsejobs and @TaurusAI \\n\\n\\ud83d\\udd14 Subscribe & hit the bell \\u2014 new episodes every Sunday: https:\\/\\/www.youtube.com\\/@TheOfferLetter6\\n\\n\\ud83d\\udcf8 @theofferletter6 | @drkrishbharggav6666\\n\\n\\ud83c\\udf10 [www.browsejobs.in]   (http:\\/\\/www.browsejobs.in) | https:\\/\\/www.instagram.com\\/taurus_ai\\/\\n\\n\\ud83d\\udca1 Looking to switch domains? In a career gap? Want to break into IT? A UPSC candidate?\\n\\nJoin our FREE Masterclass \\ud83d\\udc49 https:\\/\\/forms.gle\\/hVnQPFgV8iyCwrrcA\\n\\n#VidyaSetlur #AI #DataEngineering #DataIngestion #RAG #ArtificialIntelligence #DataAnalytics #EnterpriseAI #Tableau #TheOfferLetter #BrowseJobs #TaurusAI\",\"thumbnails\":{\"default\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/jwxLEAYZBco\\/default.jpg\",\"width\":120,\"height\":90},\"medium\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/jwxLEAYZBco\\/mqdefault.jpg\",\"width\":320,\"height\":180},\"high\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/jwxLEAYZBco\\/hqdefault.jpg\",\"width\":480,\"height\":360},\"standard\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/jwxLEAYZBco\\/sddefault.jpg\",\"width\":640,\"height\":480},\"maxres\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/jwxLEAYZBco\\/maxresdefault.jpg\",\"width\":1280,\"height\":720}},\"channelTitle\":\"The Offer Letter with Dr. Krish Bharggav\",\"playlistId\":\"UUlTUoH9pkYdDcCxBbAI7kLg\",\"position\":1,\"resourceId\":{\"kind\":\"youtube#video\",\"videoId\":\"jwxLEAYZBco\"},\"videoOwnerChannelTitle\":\"The Offer Letter with Dr. Krish Bharggav\",\"videoOwnerChannelId\":\"UClTUoH9pkYdDcCxBbAI7kLg\"},\"contentDetails\":{\"videoId\":\"jwxLEAYZBco\",\"videoPublishedAt\":\"2026-07-09T11:12:20Z\"}}','2026-07-16 07:24:41',0,'2026-07-16 07:24:41','2026-07-16 07:24:41'),(33,6,'youtube','lDfUIuudokw','Is AI Crashing the Job Market?The Domino Effect Nobody Talks About | Vidya Setlur | @Tableau','VIDEO','https://www.youtube.com/watch?v=lDfUIuudokw','https://i.ytimg.com/vi/lDfUIuudokw/mqdefault.jpg','2026-07-09 05:32:04',1,0,NULL,21,'{\"kind\":\"youtube#playlistItem\",\"etag\":\"d_EqpKDW20NX_tePKwtrzgeVS_s\",\"id\":\"VVVsVFVvSDlwa1lkRGNDeEJiQUk3a0xnLmxEZlVJdXVkb2t3\",\"snippet\":{\"publishedAt\":\"2026-07-09T11:02:04Z\",\"channelId\":\"UClTUoH9pkYdDcCxBbAI7kLg\",\"title\":\"Is AI Crashing the Job Market?The Domino Effect Nobody Talks About | Vidya Setlur | @Tableau\",\"description\":\"Is AI\'s impact extending far beyond the tech industry?\\n\\nIn this clip, Dr. Krish Bharggav shares how the slowdown in tech hiring is creating a ripple effect across the economy. After speaking with the CEO of one of Bengaluru\'s largest real estate developers, he learned that property sales had dropped by 38% compared to the previous year.\\n\\nAs hiring slows and uncertainty grows, people are becoming more cautious about major financial decisions like buying a home. Even rental markets are beginning to feel the impact.\\n\\nVidya Setlur, Head of Tableau Research (Senior Director), explains why economic uncertainty and fear around jobs naturally influence consumer behaviour, making AI disruption much bigger than just a technology story.\\n\\nThis conversation explores how changes in the job market can create a domino effect across industries and why understanding these shifts is more important than ever.\\n\\n\\ud83c\\udf99\\ufe0f Full Episode:\\u00a0https:\\/\\/youtu.be\\/-bpsTpWwY0Q?si=3qEEfm-tR3dYYWrT\\n\\n\\ud83c\\udf99\\ufe0f Moment from The Offer Letter with Dr. Krish Bharggav\\n\\nGuest: Vidya Setlur, Head of @Tableau  Research (Senior Director)\\n\\nHost: Dr. Krish Bharggav, Founder & CEO of @Browsejobs and @TaurusAI \\n\\n\\ud83d\\udd14 Subscribe & hit the bell \\u2014 new episodes every Sunday: https:\\/\\/www.youtube.com\\/@TheOfferLetter6\\n\\n\\ud83d\\udcf8 @theofferletter6 | @drkrishbharggav6666\\n\\n\\ud83c\\udf10 [www.browsejobs.in]   (http:\\/\\/www.browsejobs.in) | https:\\/\\/www.instagram.com\\/taurus_ai\\/\\n\\n\\ud83d\\udca1 Looking to switch domains? In a career gap? Want to break into IT? A UPSC candidate?\\n\\nJoin our FREE Masterclass \\ud83d\\udc49 https:\\/\\/forms.gle\\/hVnQPFgV8iyCwrrcA\\n\\n#VidyaSetlur #DrKrishBharggav #AI #JobMarket #RealEstate #Economy #FutureOfWork #BrowseJobs #TaurusAI #CareerGrowth #TheOfferLetter\",\"thumbnails\":{\"default\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/lDfUIuudokw\\/default.jpg\",\"width\":120,\"height\":90},\"medium\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/lDfUIuudokw\\/mqdefault.jpg\",\"width\":320,\"height\":180},\"high\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/lDfUIuudokw\\/hqdefault.jpg\",\"width\":480,\"height\":360},\"standard\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/lDfUIuudokw\\/sddefault.jpg\",\"width\":640,\"height\":480},\"maxres\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/lDfUIuudokw\\/maxresdefault.jpg\",\"width\":1280,\"height\":720}},\"channelTitle\":\"The Offer Letter with Dr. Krish Bharggav\",\"playlistId\":\"UUlTUoH9pkYdDcCxBbAI7kLg\",\"position\":2,\"resourceId\":{\"kind\":\"youtube#video\",\"videoId\":\"lDfUIuudokw\"},\"videoOwnerChannelTitle\":\"The Offer Letter with Dr. Krish Bharggav\",\"videoOwnerChannelId\":\"UClTUoH9pkYdDcCxBbAI7kLg\"},\"contentDetails\":{\"videoId\":\"lDfUIuudokw\",\"videoPublishedAt\":\"2026-07-09T11:02:04Z\"}}','2026-07-16 07:24:41',0,'2026-07-16 07:24:41','2026-07-16 07:24:41'),(34,6,'youtube','NcfpOyhKflI','You\'ve Been Using AI Since Nokia Days (Without Realizing It) | Vidya Setlur | @TheOfferLetter6','VIDEO','https://www.youtube.com/watch?v=NcfpOyhKflI','https://i.ytimg.com/vi/NcfpOyhKflI/mqdefault.jpg','2026-07-08 02:07:31',2,0,NULL,47,'{\"kind\":\"youtube#playlistItem\",\"etag\":\"2QE45SJMpmfuhyLspCeN6SIRC_M\",\"id\":\"VVVsVFVvSDlwa1lkRGNDeEJiQUk3a0xnLk5jZnBPeWhLZmxJ\",\"snippet\":{\"publishedAt\":\"2026-07-08T07:37:31Z\",\"channelId\":\"UClTUoH9pkYdDcCxBbAI7kLg\",\"title\":\"You\'ve Been Using AI Since Nokia Days (Without Realizing It) | Vidya Setlur | @TheOfferLetter6\",\"description\":\"Think AI is a recent phenomenon? Think again.\\n\\nAccording to Vidya Setlur, Head of Tableau Research (Senior Director), many of us have been using AI for years without even realizing it. From Nokia phones to navigation apps, AI has quietly powered personalized experiences through recommendation systems and user behavior.\\n\\nIn this clip, Vidya explains how everyday technologies use AI to learn patterns, recommend routes, and make digital experiences more intuitive. Long before generative AI became mainstream, AI was already working behind the scenes to simplify our lives.\\n\\nSometimes, the best AI is the one you don\'t even notice.\\n\\n\\ud83c\\udf99\\ufe0f Full Episode: https:\\/\\/youtu.be\\/-bpsTpWwY0Q?si=BGb1SS0pDUXEw5rh\\n\\n\\ud83c\\udf99\\ufe0f Moment from The Offer Letter with Dr. Krish Bharggav\\n\\nGuest: Vidya Setlur, Head of @Tableau  Research (Senior Director)\\n\\nHost: Dr. Krish Bharggav, Founder & CEO of @Browsejobs and @TaurusAI \\n\\n\\ud83d\\udd14 Subscribe & hit the bell \\u2014 new episodes every Sunday: https:\\/\\/www.youtube.com\\/@TheOfferLetter6\\n\\n\\ud83d\\udcf8 @theofferletter6 | @drkrishbharggav6666\\n\\n\\ud83c\\udf10 [www.browsejobs.in] (http:\\/\\/www.browsejobs.in) | https:\\/\\/www.instagram.com\\/taurus_ai\\/\\n\\n\\ud83d\\udca1 Looking to switch domains? In a career gap? Want to break into IT? A UPSC candidate?\\n\\nJoin our FREE Masterclass \\ud83d\\udc49 https:\\/\\/forms.gle\\/hVnQPFgV8iyCwrrcA\\n\\n#VidyaSetlur #ArtificialIntelligence #RecommendationSystems #MachineLearning #Nokia #Navigation #Personalization #GenerativeAI #FutureOfWork #Tableau #TheOfferLetter #BrowseJobs #TaurusAI\",\"thumbnails\":{\"default\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/NcfpOyhKflI\\/default.jpg\",\"width\":120,\"height\":90},\"medium\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/NcfpOyhKflI\\/mqdefault.jpg\",\"width\":320,\"height\":180},\"high\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/NcfpOyhKflI\\/hqdefault.jpg\",\"width\":480,\"height\":360},\"standard\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/NcfpOyhKflI\\/sddefault.jpg\",\"width\":640,\"height\":480},\"maxres\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/NcfpOyhKflI\\/maxresdefault.jpg\",\"width\":1280,\"height\":720}},\"channelTitle\":\"The Offer Letter with Dr. Krish Bharggav\",\"playlistId\":\"UUlTUoH9pkYdDcCxBbAI7kLg\",\"position\":3,\"resourceId\":{\"kind\":\"youtube#video\",\"videoId\":\"NcfpOyhKflI\"},\"videoOwnerChannelTitle\":\"The Offer Letter with Dr. Krish Bharggav\",\"videoOwnerChannelId\":\"UClTUoH9pkYdDcCxBbAI7kLg\"},\"contentDetails\":{\"videoId\":\"NcfpOyhKflI\",\"videoPublishedAt\":\"2026-07-08T07:37:31Z\"}}','2026-07-16 07:24:41',0,'2026-07-16 07:24:41','2026-07-16 07:24:41'),(35,6,'youtube','fXUTOlehsck','Why AI Researchers Still Rely on First Principles | Vidya Setlur | @Tableau | @TheOfferLetter6','VIDEO','https://www.youtube.com/watch?v=fXUTOlehsck','https://i.ytimg.com/vi/fXUTOlehsck/mqdefault.jpg','2026-07-08 01:56:14',6,0,NULL,304,'{\"kind\":\"youtube#playlistItem\",\"etag\":\"7548WaY89uZ4slyd3x41bx049aQ\",\"id\":\"VVVsVFVvSDlwa1lkRGNDeEJiQUk3a0xnLmZYVVRPbGVoc2Nr\",\"snippet\":{\"publishedAt\":\"2026-07-08T07:26:14Z\",\"channelId\":\"UClTUoH9pkYdDcCxBbAI7kLg\",\"title\":\"Why AI Researchers Still Rely on First Principles | Vidya Setlur | @Tableau | @TheOfferLetter6\",\"description\":\"Has AI fundamentally changed the way computers understand humans?\\n\\nAccording to Vidya Setlur, Head of Tableau Research (Senior Director), the answer is yes but the fundamentals still matter.\\n\\nIn this clip, Vidya explains how AI has evolved from traditional machine learning models that learned patterns and user behavior to today\'s powerful Large Language Models (LLMs). While modern AI can understand and generate insights much faster, these systems often function as \\\"black boxes,\\\" making it difficult to know exactly how they arrive at their answers.\\n\\nThat\'s why, she argues, returning to first principles is essential. A deeper understanding of how AI models work helps researchers build more trustworthy, transparent, and human-centered AI experiences.\\n\\nAs AI becomes more capable, understanding its foundations becomes even more important.\\n\\n\\ud83c\\udf99\\ufe0f Full Episode: https:\\/\\/youtu.be\\/-bpsTpWwY0Q?si=BGb1SS0pDUXEw5rh\\n\\n\\ud83c\\udf99\\ufe0f Moment from The Offer Letter with Dr. Krish Bharggav\\n\\nGuest: Vidya Setlur, Head of @Tableau  Research (Senior Director)\\n\\nHost: Dr. Krish Bharggav, Founder & CEO of @Browsejobs and @TaurusAI \\n\\n\\ud83d\\udd14 Subscribe & hit the bell \\u2014 new episodes every Sunday: https:\\/\\/www.youtube.com\\/@TheOfferLetter6\\n\\n\\ud83d\\udcf8 @theofferletter6 | @drkrishbharggav6666\\n\\n\\ud83c\\udf10 [www.browsejobs.in] (http:\\/\\/www.browsejobs.in) | https:\\/\\/www.instagram.com\\/taurus_ai\\/\\n\\n\\ud83d\\udca1 Looking to switch domains? In a career gap? Want to break into IT? A UPSC candidate?\\n\\nJoin our FREE Masterclass \\ud83d\\udc49 https:\\/\\/forms.gle\\/hVnQPFgV8iyCwrrcA\\n\\n#VidyaSetlur #ArtificialIntelligence #LLM #MachineLearning #AIResearch #GenerativeAI #HumanComputerInteraction #FutureOfWork #Tableau #TheOfferLetter #BrowseJobs #TaurusAI\",\"thumbnails\":{\"default\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/fXUTOlehsck\\/default.jpg\",\"width\":120,\"height\":90},\"medium\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/fXUTOlehsck\\/mqdefault.jpg\",\"width\":320,\"height\":180},\"high\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/fXUTOlehsck\\/hqdefault.jpg\",\"width\":480,\"height\":360},\"standard\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/fXUTOlehsck\\/sddefault.jpg\",\"width\":640,\"height\":480},\"maxres\":{\"url\":\"https:\\/\\/i.ytimg.com\\/vi\\/fXUTOlehsck\\/maxresdefault.jpg\",\"width\":1280,\"height\":720}},\"channelTitle\":\"The Offer Letter with Dr. Krish Bharggav\",\"playlistId\":\"UUlTUoH9pkYdDcCxBbAI7kLg\",\"position\":4,\"resourceId\":{\"kind\":\"youtube#video\",\"videoId\":\"fXUTOlehsck\"},\"videoOwnerChannelTitle\":\"The Offer Letter with Dr. Krish Bharggav\",\"videoOwnerChannelId\":\"UClTUoH9pkYdDcCxBbAI7kLg\"},\"contentDetails\":{\"videoId\":\"fXUTOlehsck\",\"videoPublishedAt\":\"2026-07-08T07:26:14Z\"}}','2026-07-16 07:24:41',0,'2026-07-16 07:24:41','2026-07-16 07:24:41');
/*!40000 ALTER TABLE `social_media_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_media_stats`
--

DROP TABLE IF EXISTS `social_media_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_media_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `social_account_id` bigint(20) unsigned NOT NULL,
  `stat_date` date NOT NULL,
  `followers_count` int(10) unsigned DEFAULT NULL,
  `posts_today` int(10) unsigned NOT NULL DEFAULT 0,
  `reach` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_media_stats_social_account_id_stat_date_unique` (`social_account_id`,`stat_date`),
  CONSTRAINT `social_media_stats_social_account_id_foreign` FOREIGN KEY (`social_account_id`) REFERENCES `social_accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_media_stats`
--

LOCK TABLES `social_media_stats` WRITE;
/*!40000 ALTER TABLE `social_media_stats` DISABLE KEYS */;
INSERT INTO `social_media_stats` VALUES (1,2,'2026-07-06',162589,0,134,'2026-07-06 08:03:38','2026-07-06 09:20:53'),(2,3,'2026-07-06',2731,5,592,'2026-07-06 08:04:24','2026-07-06 12:11:13'),(3,4,'2026-07-06',10439,0,1815,'2026-07-06 08:05:00','2026-07-06 12:11:07'),(5,6,'2026-07-06',279,5,37763,'2026-07-06 08:55:01','2026-07-06 10:59:42'),(6,3,'2026-07-07',2728,0,43,'2026-07-07 04:35:21','2026-07-07 12:30:32'),(7,2,'2026-07-07',162551,0,1507,'2026-07-07 04:35:26','2026-07-07 04:35:26'),(8,4,'2026-07-07',10444,0,4203,'2026-07-07 04:35:32','2026-07-07 04:35:32'),(9,6,'2026-07-07',281,0,37940,'2026-07-07 12:31:19','2026-07-07 12:31:19'),(10,6,'2026-07-08',284,0,38195,'2026-07-08 05:33:10','2026-07-08 05:33:10'),(11,4,'2026-07-15',10456,0,3423,'2026-07-15 13:57:46','2026-07-15 13:57:46'),(12,2,'2026-07-15',162285,0,279,'2026-07-15 13:57:51','2026-07-15 13:57:51'),(13,3,'2026-07-15',2686,0,17,'2026-07-15 13:57:57','2026-07-15 13:57:57'),(14,6,'2026-07-15',291,0,40649,'2026-07-15 13:58:08','2026-07-15 13:58:08'),(15,4,'2026-07-16',10460,0,6324,'2026-07-16 05:30:06','2026-07-16 15:49:34'),(16,6,'2026-07-16',294,0,40737,'2026-07-16 06:08:21','2026-07-16 06:32:12'),(17,2,'2026-07-16',162240,1,533,'2026-07-16 06:33:58','2026-07-16 15:49:40'),(18,3,'2026-07-16',2685,0,28,'2026-07-16 06:34:03','2026-07-16 15:49:49'),(19,4,'2026-07-17',10462,0,14291,'2026-07-17 04:55:31','2026-07-17 04:55:31'),(20,2,'2026-07-17',162232,0,1074,'2026-07-17 04:55:37','2026-07-17 04:55:37'),(21,3,'2026-07-17',2685,0,52,'2026-07-17 04:55:42','2026-07-17 04:55:42');
/*!40000 ALTER TABLE `social_media_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_post_reminders`
--

DROP TABLE IF EXISTS `social_post_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_post_reminders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `social_account_id` bigint(20) unsigned NOT NULL,
  `platform` varchar(255) NOT NULL,
  `last_post_at` timestamp NULL DEFAULT NULL,
  `reminder_count` int(10) unsigned NOT NULL DEFAULT 0,
  `last_reminded_at` timestamp NULL DEFAULT NULL,
  `resolved` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_post_reminders_social_account_id_unique` (`social_account_id`),
  KEY `social_post_reminders_platform_index` (`platform`),
  CONSTRAINT `social_post_reminders_social_account_id_foreign` FOREIGN KEY (`social_account_id`) REFERENCES `social_accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_post_reminders`
--

LOCK TABLES `social_post_reminders` WRITE;
/*!40000 ALTER TABLE `social_post_reminders` DISABLE KEYS */;
INSERT INTO `social_post_reminders` VALUES (1,2,'instagram','2026-07-15 22:06:32',1,'2026-07-16 07:25:05',0,'2026-07-16 07:25:05','2026-07-16 07:25:05'),(2,3,'instagram','2026-07-09 06:34:01',1,'2026-07-16 07:25:10',0,'2026-07-16 07:25:10','2026-07-16 07:25:10'),(3,4,'instagram','2026-07-15 10:56:18',1,'2026-07-16 07:25:15',0,'2026-07-16 07:25:15','2026-07-16 07:25:15'),(4,6,'youtube','2026-07-10 03:00:32',1,'2026-07-16 07:25:20',0,'2026-07-16 07:25:20','2026-07-16 07:25:20');
/*!40000 ALTER TABLE `social_post_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `external_id` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `students_email_unique` (`email`),
  UNIQUE KEY `students_phone_number_unique` (`phone_number`),
  UNIQUE KEY `students_external_id_unique` (`external_id`),
  KEY `students_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2434 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (6,'6a44ff660532b93120969d88','Kunal','Behera','Kunal Behera','princejyotiranjanbehera@gmail.com','8114637479','active','2026-07-07 05:02:46','2026-07-07 05:02:46'),(2431,'DEMO-1','Krish','Demo One','Krish Demo One','krishnabharggav+demo1@gmail.com','919000000001','active','2026-07-16 05:50:26','2026-07-16 05:50:26'),(2432,'DEMO-2','Krish','Demo Two','Krish Demo Two','krishnabharggav+demo2@gmail.com','919000000002','active','2026-07-16 05:50:26','2026-07-16 05:50:26'),(2433,'DEMO-3','Krish','Demo Three','Krish Demo Three','krishnabharggav+demo3@gmail.com','919000000003','active','2026-07-16 05:50:26','2026-07-16 05:50:26');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_assignees`
--

DROP TABLE IF EXISTS `task_assignees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_assignees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `is_flagged` tinyint(1) NOT NULL DEFAULT 0,
  `flagged_at` timestamp NULL DEFAULT NULL,
  `last_reminded_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_assignees_task_id_user_id_unique` (`task_id`,`user_id`),
  KEY `task_assignees_user_id_foreign` (`user_id`),
  CONSTRAINT `task_assignees_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_assignees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_assignees`
--

LOCK TABLES `task_assignees` WRITE;
/*!40000 ALTER TABLE `task_assignees` DISABLE KEYS */;
INSERT INTO `task_assignees` VALUES (1,1,21,0,NULL,0,NULL,NULL,'2026-07-04 13:57:45','2026-07-04 13:57:45'),(2,1,23,0,NULL,0,NULL,NULL,'2026-07-04 13:57:45','2026-07-04 13:57:45'),(3,2,21,1,'2026-07-04 14:02:31',0,NULL,NULL,'2026-07-04 14:01:17','2026-07-04 14:02:31'),(4,2,23,0,NULL,0,NULL,NULL,'2026-07-04 14:01:17','2026-07-04 14:01:17'),(5,2,10,0,NULL,0,NULL,NULL,'2026-07-04 14:01:17','2026-07-04 14:01:17'),(6,3,21,0,NULL,0,NULL,NULL,'2026-07-04 14:25:42','2026-07-04 14:25:42'),(7,4,3,0,NULL,0,NULL,NULL,'2026-07-04 14:27:19','2026-07-04 14:27:19'),(8,4,21,0,NULL,0,NULL,NULL,'2026-07-04 14:27:19','2026-07-04 14:27:19'),(9,4,23,0,NULL,0,NULL,NULL,'2026-07-04 14:27:19','2026-07-04 14:27:19'),(10,5,21,0,NULL,0,NULL,NULL,'2026-07-04 14:43:56','2026-07-04 14:43:56'),(11,6,21,0,NULL,0,NULL,NULL,'2026-07-04 14:57:13','2026-07-04 14:57:13'),(12,7,19,0,NULL,0,NULL,NULL,'2026-07-04 14:59:05','2026-07-04 14:59:05'),(13,8,21,1,'2026-07-06 14:36:20',0,NULL,NULL,'2026-07-04 15:48:08','2026-07-06 14:36:20'),(14,9,1,0,NULL,0,NULL,NULL,'2026-07-04 15:49:08','2026-07-04 15:49:08');
/*!40000 ALTER TABLE `task_assignees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `due_date` date NOT NULL,
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `status` enum('pending','in_progress','completed') NOT NULL DEFAULT 'pending',
  `created_by` bigint(20) unsigned NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_created_by_foreign` (`created_by`),
  KEY `tasks_status_due_date_index` (`status`,`due_date`),
  CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'Whatsapp  Intigration','Demo','2026-07-05','low','pending',3,NULL,'2026-07-04 13:57:45','2026-07-04 13:57:45'),(2,'Whatsapp  Intigration','Demo','2026-07-06','medium','pending',3,NULL,'2026-07-04 14:01:17','2026-07-04 14:01:17'),(3,'Whatsapp  Intigration','xvxc','2026-07-09','medium','pending',3,NULL,'2026-07-04 14:25:42','2026-07-04 14:25:42'),(4,'Independence Day','sdfasdf','2026-07-10','medium','pending',21,NULL,'2026-07-04 14:27:19','2026-07-04 14:27:19'),(5,'Varasiddhi Vinayaka Vrata (Ganesh Chaturthi)','asdfasgd','2026-07-07','medium','pending',3,NULL,'2026-07-04 14:43:56','2026-07-04 14:43:56'),(6,'Varasiddhi Vinayaka Vrata (Ganesh Chaturthi)','hhhhhhh','2026-07-01','medium','pending',19,NULL,'2026-07-04 14:57:13','2026-07-04 14:57:13'),(7,'Independence Day','jjjj','2026-07-08','medium','pending',21,NULL,'2026-07-04 14:59:05','2026-07-04 14:59:05'),(8,'heryu','yturtyu','2026-07-06','medium','completed',1,'2026-07-06 14:36:20','2026-07-04 15:48:08','2026-07-06 14:36:20'),(9,'Intigration','ghjgh','2026-07-07','low','pending',21,NULL,'2026-07-04 15:49:08','2026-07-04 15:49:08');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todos`
--

DROP TABLE IF EXISTS `todos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `due_date` date DEFAULT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `todos_user_id_is_completed_index` (`user_id`,`is_completed`),
  CONSTRAINT `todos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todos`
--

LOCK TABLES `todos` WRITE;
/*!40000 ALTER TABLE `todos` DISABLE KEYS */;
INSERT INTO `todos` VALUES (1,1,'Hello world','AAA','low','2026-07-16',1,'2026-07-15 15:29:08',0,'2026-07-15 15:28:53','2026-07-15 15:29:08');
/*!40000 ALTER TABLE `todos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_logs`
--

DROP TABLE IF EXISTS `user_login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
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
  `logout_by_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_by_user_id` bigint(20) unsigned DEFAULT NULL,
  `is_manual_entry` tinyint(1) NOT NULL DEFAULT 0,
  `manual_reason` text DEFAULT NULL,
  `is_active_session` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_login_logs_user_id_index` (`user_id`),
  KEY `user_login_logs_login_time_index` (`login_time`),
  KEY `user_login_logs_is_active_session_index` (`is_active_session`),
  KEY `user_login_logs_session_token_index` (`session_token`),
  KEY `user_login_logs_logout_by_user_id_foreign` (`logout_by_user_id`),
  KEY `user_login_logs_created_by_user_id_foreign` (`created_by_user_id`),
  CONSTRAINT `user_login_logs_created_by_user_id_foreign` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `user_login_logs_logout_by_user_id_foreign` FOREIGN KEY (`logout_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `user_login_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_logs`
--

LOCK TABLES `user_login_logs` WRITE;
/*!40000 ALTER TABLE `user_login_logs` DISABLE KEYS */;
INSERT INTO `user_login_logs` VALUES (1,4,'esBAA1DcVssQ6IhXQJketPJs9EzkrBTOWwy3R2Ln','2026-07-17 12:11:40','127.0.0.1',NULL,NULL,'desktop','Firefox','Windows','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0',NULL,NULL,NULL,'2026-07-17 12:37:44','127.0.0.1',NULL,'user_logout',4,NULL,0,NULL,0,'2026-07-17 06:41:40','2026-07-17 07:07:44'),(2,18,'5YpZpFdfWKgnaziqgbX9QBS0nRKsO32r1hZEYIKf','2026-07-17 12:12:16','127.0.0.1',NULL,NULL,'desktop','Chrome','Windows','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36',NULL,NULL,NULL,'2026-07-17 15:17:14','127.0.0.1',NULL,'user_logout',18,NULL,0,NULL,0,'2026-07-17 06:42:16','2026-07-17 09:47:14'),(3,4,'UUeVpvATE4oSVpCPZ6Aecw4Z6AO1wkKRzAJItEAF','2026-07-17 12:37:50','127.0.0.1',NULL,NULL,'desktop','Firefox','Windows','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0',NULL,NULL,NULL,'2026-07-17 14:46:38','127.0.0.1',NULL,'user_logout',4,NULL,0,NULL,0,'2026-07-17 07:07:50','2026-07-17 09:16:38'),(4,21,'cRWUV7fObCCEeaorNEQ2B7QamZ6cly14cBFKPUIB','2026-07-17 14:47:29','127.0.0.1',NULL,NULL,'desktop','Firefox','Windows','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0',NULL,NULL,NULL,'2026-07-17 14:51:43','127.0.0.1',NULL,'user_logout',21,NULL,0,NULL,0,'2026-07-17 09:17:29','2026-07-17 09:21:43'),(5,4,'3Ie6mYs76EtJiGrtjbe0jh26FFvFYluzUcNQcMmx','2026-07-17 14:51:51','127.0.0.1',NULL,NULL,'desktop','Firefox','Windows','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0',NULL,NULL,NULL,'2026-07-17 15:56:54','127.0.0.1',NULL,'user_logout',4,NULL,0,NULL,0,'2026-07-17 09:21:51','2026-07-17 10:26:54'),(6,18,'7hxxeVxAj3FeTbFNRMbpjaOaPaSWTkpmi7v7RidX','2026-07-17 15:17:39','127.0.0.1',NULL,NULL,'desktop','Chrome','Windows','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,'2026-07-17 09:47:39','2026-07-17 09:47:39'),(7,1,'AZCCAJA1VF7I7rsg26yC5jNyYPWb0t63EadMrmVT','2026-07-17 15:57:36','127.0.0.1',NULL,NULL,'desktop','Firefox','Windows','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0',NULL,NULL,NULL,'2026-07-17 16:01:27','127.0.0.1',NULL,'user_logout',1,NULL,0,NULL,0,'2026-07-17 10:27:36','2026-07-17 10:31:27'),(8,1,'JHe1rLYHVyLj8d25ec6Nz4S7sFH8yfD08rGIFC9R','2026-07-17 16:12:48','127.0.0.1',NULL,NULL,'desktop','Firefox','Windows','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:152.0) Gecko/20100101 Firefox/152.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,'2026-07-17 10:42:48','2026-07-17 10:42:48');
/*!40000 ALTER TABLE `user_login_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `reporting_manager_id` bigint(20) unsigned DEFAULT NULL,
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
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_employee_id_unique` (`employee_id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_reporting_manager_id_foreign` (`reporting_manager_id`),
  KEY `users_created_by_foreign` (`created_by`),
  KEY `users_updated_by_foreign` (`updated_by`),
  KEY `users_department_index` (`department`),
  KEY `users_role_id_index` (`role_id`),
  KEY `users_employment_status_index` (`employment_status`),
  CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_reporting_manager_id_foreign` FOREIGN KEY (`reporting_manager_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'EMP001','Krish','Bhargav','Krish Bhargav',NULL,'2026-07-06',NULL,'krishnabharggav@gmail.com',NULL,'$2y$12$XrWyvfDWaBCr1Q7HJn40O.Aj6ikIEij03UPudTILplwkjMTlsouWq',NULL,NULL,NULL,'CEO / Founder','Management',1,3,'Permanent','2026-07-02',NULL,NULL,'Active',151500.00,NULL,13635.00,7575.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2026-07-17 10:42:48','8Aw1gt1WPeLvUTNbseno0Bslpc3lpHFzAjZUwVBwDx2ZoSQNLTCn1OfRfQ0i',NULL,NULL,NULL,'2026-07-02 13:46:14','2026-07-17 10:42:48'),(3,'EMP101','Dhanya','Gowda','Dhanya Gowda','Female','2026-07-07',NULL,'dhanya.gowda@browsejobs.in',NULL,'$2y$12$9OzYiJ5HgyBb82pWzWqRpu.MWxGSxyjLMScHC/b3VR.YiRr2.16OO','7975909176','7975909176','7975909176',NULL,NULL,14,1,NULL,NULL,NULL,NULL,'Active',114500.00,NULL,12595.00,5725.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2026-07-04 09:45:14','FVHumkLHEBRBQVOhjYYEOh4LfhaJXNwKKmxVOav4L81k8bK51MTMPzYeP3Ng',NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(4,'EMP102','Priyanka','Patnaik','Priyanka Patnaik','Female','2026-07-08',NULL,'priyanka.patnaik@browsejobs.in',NULL,'$2y$12$WNwBL5odGvC/kLeOEPom/Oz/XG3Gox12UcgUA9FuXGMylbNpDXGGC','8618519825','8618519825','8618519825',NULL,NULL,15,3,NULL,NULL,NULL,NULL,'Active',86000.00,NULL,6880.00,4300.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2026-07-17 09:21:52','zVjOrlZ5cd5MFFvQAxDhKHqC3gNwZypMqPMCBLKsDdvMfxfQMaNSSnamCnsf',NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 09:21:52'),(5,'EMP103','Madusmitha','Choudhary','Madusmitha Choudhary','Female','2026-07-09',NULL,'madusmitha.choudhary@browsejobs.com',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,NULL,NULL,16,4,NULL,NULL,NULL,NULL,'Active',55000.00,NULL,4950.00,2750.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(6,'EMP105','Soumya Surabhita','Das','Soumya Surabhita Das',NULL,NULL,NULL,'soumya@browsejobs.in',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9937140845','9937140845','9937140845',NULL,NULL,16,4,'Permanent',NULL,NULL,NULL,'Active',56500.00,NULL,5650.00,2825.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(7,'EMP104','Remya','Ramankutty','Remya Ramankutty','Female',NULL,NULL,'remya@browsejobs.in',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9861163654','9861163654','9861163654',NULL,NULL,17,4,'Permanent',NULL,NULL,NULL,'Active',53000.00,NULL,5830.00,2650.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(8,'EMP108','Snehal','Patil','Snehal Patil',NULL,NULL,NULL,'snehal.patil@browsejobs.in',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9511689035','9511689035','9511689035',NULL,NULL,17,4,'Permanent',NULL,NULL,NULL,'Active',54500.00,NULL,4360.00,2725.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(9,'EMP106','Purvi','Raval','Purvi Raval','Female',NULL,NULL,'purvi.raval@browsejobs.in',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9372867265','9372867265','9372867265',NULL,NULL,3,4,NULL,NULL,NULL,NULL,'Active',44000.00,NULL,3960.00,2200.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(10,'EMP107','Kokkirala','Geetha Bhavani','Kokkirala Geetha Bhavani','Female',NULL,NULL,'geetha@browsejobs.in',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','6302946354','6302946354','6302946354',NULL,NULL,3,4,NULL,NULL,NULL,NULL,'Active',38000.00,NULL,3800.00,1900.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(11,'EMP109','Gundlapalli','Anitha','Gundlapalli Anitha','Female',NULL,NULL,'Anitha.gundlaplli@browsejobs.in',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9611177640','9611177640','9611177640',NULL,NULL,3,4,'Permanent',NULL,NULL,NULL,'Active',39500.00,NULL,4345.00,1975.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(12,'EMP110','Yellanki','Chandana','Yellanki Chandana',NULL,NULL,NULL,'chandana.yellanki@browsejobs.in',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','6300960990','6300960990','6300960990',NULL,NULL,3,4,NULL,NULL,NULL,NULL,'Active',41000.00,NULL,3280.00,2050.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(13,'EMP111','Nafisa','Ahmed','Nafisa Ahmed',NULL,NULL,NULL,'nafisa.ahmed@browsejobs.in',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','8011257651','8011257651','8011257651',NULL,NULL,3,4,NULL,NULL,NULL,NULL,'Active',42500.00,NULL,3825.00,2125.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(14,'EMP112','Sreeja','Roy','Sreeja Roy','Female',NULL,NULL,'sreeja.roy@browsejobs.in',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','8877373198','8877373198','8877373198',NULL,NULL,3,4,NULL,NULL,NULL,NULL,'Active',44000.00,NULL,4400.00,2200.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(15,'EMP113','Preeti Prakash','Bhosale','Preeti Prakash Bhosale','Female',NULL,NULL,'preeti.bhosale@browsejobs.in',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','7498710649','7498710649','7498710649',NULL,NULL,3,4,'Permanent',NULL,NULL,NULL,'Active',38000.00,NULL,4180.00,1900.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(16,'EMP114','Barika','Shirisha','Barika Shirisha',NULL,NULL,NULL,'shirisha.b@browsejobs.in',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','6302274392','6302274392','6302274392',NULL,NULL,3,4,'Permanent',NULL,NULL,NULL,'Active',39500.00,NULL,3160.00,1975.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(17,'EMP116','Sameera','Shafi','Sameera Shafi',NULL,NULL,NULL,'sameerashafi82@gmail.com',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9945779515','9945779515','9945779515',NULL,NULL,3,4,NULL,NULL,NULL,NULL,'Active',41000.00,NULL,3690.00,2050.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(18,'EMP115','Shalini',NULL,'Shalini','Female',NULL,NULL,'Shalini@browsejobs.in',NULL,'$2y$12$Jo4BVEfUlNxwJeuRtqthVuvlt2GvjjEOGPIMa/pSO5f3EnRhsxbEa','9187386118','9187386118','9187386118',NULL,NULL,3,4,NULL,NULL,NULL,NULL,'Active',42500.00,NULL,4250.00,2125.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2026-07-17 09:47:39','1JhLUCTuc6UtHWjyVGYsky5dnOEdiRJ4ISJlmDpXdsF1XtI6Fx5jOvQcnSd8',NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 09:47:39'),(19,'EMP117','Swati Sucharita','Das','Swati Sucharita Das',NULL,NULL,NULL,'swatidas@browsejobs.in',NULL,'$2y$12$oogCSJ03qgvMXsXQV1UFme4a.EYamsvocWxGPT2in9uwgTFAonzmS','7020578556','7020578556','7020578556',NULL,NULL,18,3,'Permanent',NULL,NULL,NULL,'Active',61000.00,NULL,6710.00,3050.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2026-07-17 06:13:36','Uf9rkBtbtIQKnLN7i6UNdjDRsLQS188l7l3iyrWAEsWO935MUckqfTkWSZSp',NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 06:13:36'),(20,'EMP118','Gouttam','KUMAR BHUYAN','Gouttam KUMAR BHUYAN',NULL,NULL,NULL,'gouttamkumar014@gmail.com',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9938289179','9938289179','9938289179',NULL,NULL,19,1,'Permanent',NULL,NULL,NULL,'Active',50000.00,NULL,4000.00,2500.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(21,'EMP119','Iyyapan',NULL,'Iyyapan',NULL,NULL,NULL,'iyyappan212004@gmail.com',NULL,'$2y$12$NEVLXNt8y5N.DtPpQTPdk.8tWTbo1KQkYcq/vROWJptGXUr3n.jva','8870962518',NULL,NULL,'Social media Strategist',NULL,19,19,NULL,NULL,NULL,NULL,'Active',51500.00,NULL,4635.00,2575.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2026-07-17 09:17:29','HrZCmh3fp2xyv2VdYWIj5K1BKZa7sTYApOm2xJbKHMd6e2G9fj9cPcoyhPR9',NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 09:17:29'),(22,'EMP120','Rakhi','Jain','Rakhi Jain',NULL,NULL,NULL,'jainrakhi2004@gmail.com',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','7019845447',NULL,NULL,'Social media Strategist',NULL,19,19,NULL,NULL,NULL,NULL,'Active',53000.00,NULL,5300.00,2650.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(23,'EMP121','Jyotiranjan',NULL,'Jyotiranjan','Male','2001-05-24','employees/profile_photo/YNEABYo09kXyj8UAwXFqFKfothsmdrcH2hB8aZVo.jpg','princejyotiranjanbehera@gmail.com',NULL,'$2y$12$YHfL/sgDqBDRFuwV9CrP7..eo0TPgOAdr8FYmFWP0T.nsldRcr1z.','8114637479','9337367467',NULL,'Media Strategist','Media',19,19,'Permanent','2026-06-08',NULL,NULL,'Active',10000.00,'Monthly',1100.00,500.00,'FUCPB7573N','657938232049',NULL,NULL,NULL,'State Bank Of India','Jyotiranjan Behera','33559262036','SBIN0012058','Marshaghai','rockjyoti@ybl','Kenderapara,Marshaghai,754213','Bhubaneswar','Odisha','India','754213','employees/aadhaar_file/o8ZL9bvFeRFDe1D0vehtt3qDNgrw6hECeFNPd6Pk.jpg','employees/pan_file/HPzu5uoMSOXLyBbOBrbv3H5G3i5V3cQuIn7nqtLE.jpg',NULL,NULL,NULL,NULL,NULL,1,'2026-07-03 00:10:45','qS8TcHJdntQRJhWmJLYjB8i2QFlTxTdNdAir3SNBkveXVQvK21oSAbS6YFA1',NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(24,'EMP122','Fathima','Farwa','Fathima Farwa',NULL,NULL,NULL,'fathima.farwa@browsejobs.com',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,NULL,NULL,20,3,NULL,NULL,NULL,NULL,'Active',66000.00,NULL,5280.00,3300.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(25,'EMP123','Somali','Bisoi','Somali Bisoi',NULL,NULL,NULL,'somali@browsejobs.in',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','8431814749','8431814749','8431814749',NULL,NULL,21,3,'Permanent',NULL,NULL,NULL,'Active',85000.00,NULL,7650.00,4250.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(26,'EMP124','Satyajeev','Patnaik','Satyajeev Patnaik',NULL,NULL,NULL,'satyajeev.patnaik@browsejobs.in',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9348310558',NULL,NULL,'Tech Mentor',NULL,22,NULL,NULL,NULL,NULL,NULL,'Active',56500.00,NULL,5650.00,2825.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(27,'EMP125','Swathi','Ramdas','Swathi Ramdas','Female',NULL,NULL,'swathi.r@browsejobs.in',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','8618807439','8618807439','8618807439',NULL,NULL,22,3,NULL,NULL,NULL,NULL,'Active',58000.00,NULL,6380.00,2900.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37'),(28,'EMP126','Anjali','Ambastha','Anjali Ambastha','Female',NULL,NULL,'anjali.ambastha@browsejobs.in',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9572826178','9572826178','9572826178',NULL,NULL,22,3,'Permanent',NULL,NULL,NULL,'Active',59500.00,NULL,4760.00,2975.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'2026-07-03 03:51:13','2026-07-17 05:11:37');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'browsejobsbackendlaravel'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-17 16:51:29
