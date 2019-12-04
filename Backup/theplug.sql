-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 14, 2017 at 05:57 AM
-- Server version: 5.7.18
-- PHP Version: 7.0.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `theplug`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser`(IN `user_id` INT, OUT `uname` VARCHAR(100))
    NO SQL
SELECT name INTO uname FROM users WHERE id=user_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `job_data`()
SELECT * FROM users$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `my_procedure_Local_Variables`()
    NO SQL
BEGIN   /* declare local variables */   
DECLARE a INT DEFAULT 10;   
DECLARE b, c INT;    /* using the local variables */   
SET a = a + 100;   
SET b = 2;   
SET c = a + b;    
BEGIN      /* local variable in nested block */      
DECLARE c INT;             
SET c = 5;       
/* local variable c takes precedence over the one of the          
same name declared in the enclosing block. */       
SELECT a, b, c;   
END;    
SELECT a, b, c;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(6, '2016_06_01_000004_create_oauth_clients_table', 2),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'User Administrator', 'The owner of the App', '2017-08-11 04:12:18', '2017-08-11 04:12:18'),
(2, 'user', 'User Customer', 'B to C', '2017-08-11 04:12:18', '2017-08-11 04:12:18');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(8, 2),
(9, 2),
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(500) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `handle_name` varchar(255) NOT NULL,
  `profile_image` varchar(255) NOT NULL,
  `cover_image` varchar(255) NOT NULL,
  `is_active` tinyint(2) DEFAULT '1',
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `first_name`, `last_name`, `handle_name`, `profile_image`, `cover_image`, `is_active`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$b587nYu4ZgifVhbTkd.CdO7z/6o/quIR1kfPzVarZRYS6Ef4yDHN.', '', '', '', '', '', 1, 'n1xpcOquFSlzgucJdIIBRerkFO60LwA9I2KPkeMNuGuCOehMft3dg60Zn6tv', NULL, '2017-07-26 11:31:10', '2017-08-12 05:33:20'),
(2, 'Amiya Kumar Jena', 'amiya.kumar@brtindia.com', '$2y$10$B.7iCLk.yGZ/bV6a/qOdjuJ3yAE0TwRn1/ZPoaN5BCMyivpnMzAOa', '', '', '', '', '', 1, NULL, NULL, '2017-08-03 02:08:20', '2017-08-03 02:08:20'),
(3, 'shahil', 'shahil@gmail.com', '$2y$10$S1dR.7jbG.BHhj5GFLRVSO6oQJ3p3god84buEar9ERy/1JQaSBElG', '', '', '', '', '', 1, 'mJ1pAG4WERBXzyhFfiq52z8tZARxqcaqRlgEgUDIJEr3sHbpE3ksk2WA7VBE', NULL, '2017-08-10 02:35:16', '2017-08-12 05:07:54'),
(4, 'shahil', 'shahil.nissam@brtindia.com', '$2y$10$WWorJlAPZath3uFkxFdHs.BnQSM7nmqEkpXK.9JKebAhlT5DPlB4W', '', '', '', '', '', 1, '8LzMRieoDZSns49gMJZwTupjQFHtWLLQfTahIR1RqM9KuTe3103dv5QGA61v', NULL, '2017-08-10 06:09:42', '2017-08-10 11:39:58'),
(5, 'test', 'test@test.com', '$2y$10$EA2NMwJyF2Gkw0l1896ux.9MfLhESzQr.04w67bottq.a8xIOsg.C', '', '', '', '', '', 1, NULL, NULL, '2017-08-10 08:27:09', '2017-08-10 14:22:59'),
(6, 'test2', 'test3@test.com', '$2y$10$9bCcUXhwQCZGi.yvTyDFtuKJRqPVoB7k27I.7HHvI4lXkF7QZ6rdy', '', '', '', '', '', 1, NULL, NULL, '2017-08-11 00:41:33', '2017-08-11 00:41:33'),
(7, 'user', 'user@user.com', '$2y$10$6cYQdmXNgf9JOCEz.3lcb.PXhHCoApsULpe3r2fkx3QKoKNShzxSC', '', '', '', '', '', 1, NULL, NULL, '2017-08-11 04:05:03', '2017-08-11 04:05:03'),
(8, 'user', 'user2@user.com', '$2y$10$b587nYu4ZgifVhbTkd.CdO7z/6o/quIR1kfPzVarZRYS6Ef4yDHN.', '', '', '', '', '', 1, 'fcn5APBI3QpJhlF0CXQyxlTOB0kvMGqMUZUgIdGr5xNsNcCRQkoeb2rHXBvH', NULL, '2017-08-11 04:14:16', '2017-08-12 10:03:22'),
(9, 'testingmobile', 'mobileapi@gmail.com', '$2y$10$Qmy.s6d0YmkLYFT4o59y1eX8pFSu.N6a8fr4Rdo6CmaOUaQ4QCqJy', '', '', '', '', '', 1, NULL, NULL, '2017-08-11 23:17:08', '2017-08-11 23:17:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
