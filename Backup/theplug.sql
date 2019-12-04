-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 01, 2017 at 12:01 PM
-- Server version: 5.7.19
-- PHP Version: 7.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `theplug`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `name`, `phone`, `address`, `pincode`, `created_at`, `updated_at`) VALUES
(1, 0, 'Arunkumar', NULL, 'Gzhsjsjdjndnxnxnxnxnjxjxnxbdjdjdh', '6985658', '2017-10-13 04:43:15', '2017-10-13 04:43:15'),
(2, 0, 'Arunkumar', NULL, 'Vshzhzjxjxjxbjxbxnxnxnxbjdkdkdnxjdjdhd', '698565', '2017-10-13 05:40:53', '2017-10-13 05:40:53'),
(3, 7, 'Arunkumar', NULL, 'Hdjdjjdjdhdjdjdhhdhdjdjdhdjdhdjdhhshsjhdhdj', '698568', '2017-10-13 05:45:05', '2017-10-13 05:45:05'),
(4, 7, 'darunkumar', NULL, 'Ehflgggghffggggcccf', '586523', '2017-10-17 04:04:29', '2017-10-17 04:04:29'),
(5, 42, 'Dominic savio 123', NULL, '#209,bld no 170,khb colony ,shirke,Bangalore 560060', '560060', '2017-11-09 03:04:59', '2017-11-09 03:04:59');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE IF NOT EXISTS `complaints` (
  `id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `order_id`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(3, 2, 'test', 'my message', '2017-09-05 07:19:35', '2017-09-05 07:19:35'),
(4, 2, 'test', 'my message', '2017-09-05 07:21:51', '2017-09-05 07:21:51'),
(5, 2, 'test', 'my message', '2017-09-05 07:22:52', '2017-09-05 07:22:52'),
(6, 2, 'test', 'my message', '2017-09-05 07:28:00', '2017-09-05 07:28:00');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `code` varchar(25) DEFAULT NULL,
  `symbol` varchar(25) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country`, `currency`, `code`, `symbol`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek'),
(2, 'America', 'Dollars', 'USD', '$'),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋'),
(4, 'Argentina', 'Pesos', 'ARS', '$'),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ'),
(6, 'Australia', 'Dollars', 'AUD', '$'),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман'),
(8, 'Bahamas', 'Dollars', 'BSD', '$'),
(9, 'Barbados', 'Dollars', 'BBD', '$'),
(10, 'Belarus', 'Rubles', 'BYR', 'p.'),
(11, 'Belgium', 'Euro', 'EUR', '€'),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$'),
(13, 'Bermuda', 'Dollars', 'BMD', '$'),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b'),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM'),
(16, 'Botswana', 'Pula''s', 'BWP', 'P'),
(17, 'Bulgaria', 'Leva', 'BG', 'лв'),
(18, 'Brazil', 'Reais', 'BRL', 'R$'),
(19, 'Britain (United Kingdom)', 'Pounds', 'GBP', '£'),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$'),
(21, 'Cambodia', 'Riels', 'KHR', '៛'),
(22, 'Canada', 'Dollars', 'CAD', '$'),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$'),
(24, 'Chile', 'Pesos', 'CLP', '$'),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥'),
(26, 'Colombia', 'Pesos', 'COP', '$'),
(27, 'Costa Rica', 'Colón', 'CRC', '₡'),
(28, 'Croatia', 'Kuna', 'HRK', 'kn'),
(29, 'Cuba', 'Pesos', 'CUP', '₱'),
(30, 'Cyprus', 'Euro', 'EUR', '€'),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč'),
(32, 'Denmark', 'Kroner', 'DKK', 'kr'),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$'),
(34, 'East Caribbean', 'Dollars', 'XCD', '$'),
(35, 'Egypt', 'Pounds', 'EGP', '£'),
(36, 'El Salvador', 'Colones', 'SVC', '$'),
(37, 'England (United Kingdom)', 'Pounds', 'GBP', '£'),
(38, 'Euro', 'Euro', 'EUR', '€'),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£'),
(40, 'Fiji', 'Dollars', 'FJD', '$'),
(41, 'France', 'Euro', 'EUR', '€'),
(42, 'Ghana', 'Cedis', 'GHC', '¢'),
(43, 'Gibraltar', 'Pounds', 'GIP', '£'),
(44, 'Greece', 'Euro', 'EUR', '€'),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q'),
(46, 'Guernsey', 'Pounds', 'GGP', '£'),
(47, 'Guyana', 'Dollars', 'GYD', '$'),
(48, 'Holland (Netherlands)', 'Euro', 'EUR', '€'),
(49, 'Honduras', 'Lempiras', 'HNL', 'L'),
(50, 'Hong Kong', 'Dollars', 'HKD', '$'),
(51, 'Hungary', 'Forint', 'HUF', 'Ft'),
(52, 'Iceland', 'Kronur', 'ISK', 'kr'),
(53, 'India', 'Rupees', 'INR', 'Rp'),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp'),
(55, 'Iran', 'Rials', 'IRR', '﷼'),
(56, 'Ireland', 'Euro', 'EUR', '€'),
(57, 'Isle of Man', 'Pounds', 'IMP', '£'),
(58, 'Israel', 'New Shekels', 'ILS', '₪'),
(59, 'Italy', 'Euro', 'EUR', '€'),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$'),
(61, 'Japan', 'Yen', 'JPY', '¥'),
(62, 'Jersey', 'Pounds', 'JEP', '£'),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв'),
(64, 'Korea (North)', 'Won', 'KPW', '₩'),
(65, 'Korea (South)', 'Won', 'KRW', '₩'),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв'),
(67, 'Laos', 'Kips', 'LAK', '₭'),
(68, 'Latvia', 'Lati', 'LVL', 'Ls'),
(69, 'Lebanon', 'Pounds', 'LBP', '£'),
(70, 'Liberia', 'Dollars', 'LRD', '$'),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF'),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt'),
(73, 'Luxembourg', 'Euro', 'EUR', '€'),
(74, 'Macedonia', 'Denars', 'MKD', 'ден'),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM'),
(76, 'Malta', 'Euro', 'EUR', '€'),
(77, 'Mauritius', 'Rupees', 'MUR', '₨'),
(78, 'Mexico', 'Pesos', 'MX', '$'),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮'),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT'),
(81, 'Namibia', 'Dollars', 'NAD', '$'),
(82, 'Nepal', 'Rupees', 'NPR', '₨'),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ'),
(84, 'Netherlands', 'Euro', 'EUR', '€'),
(85, 'New Zealand', 'Dollars', 'NZD', '$'),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$'),
(87, 'Nigeria', 'Nairas', 'NG', '₦'),
(88, 'North Korea', 'Won', 'KPW', '₩'),
(89, 'Norway', 'Krone', 'NOK', 'kr'),
(90, 'Oman', 'Rials', 'OMR', '﷼'),
(91, 'Pakistan', 'Rupees', 'PKR', '₨'),
(92, 'Panama', 'Balboa', 'PAB', 'B/.'),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs'),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.'),
(95, 'Philippines', 'Pesos', 'PHP', 'Php'),
(96, 'Poland', 'Zlotych', 'PL', 'zł'),
(97, 'Qatar', 'Rials', 'QAR', '﷼'),
(98, 'Romania', 'New Lei', 'RO', 'lei'),
(99, 'Russia', 'Rubles', 'RUB', 'руб'),
(100, 'Saint Helena', 'Pounds', 'SHP', '£'),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼'),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.'),
(103, 'Seychelles', 'Rupees', 'SCR', '₨'),
(104, 'Singapore', 'Dollars', 'SGD', '$'),
(105, 'Slovenia', 'Euro', 'EUR', '€'),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$'),
(107, 'Somalia', 'Shillings', 'SOS', 'S'),
(108, 'South Africa', 'Rand', 'ZAR', 'R'),
(109, 'South Korea', 'Won', 'KRW', '₩'),
(110, 'Spain', 'Euro', 'EUR', '€'),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨'),
(112, 'Sweden', 'Kronor', 'SEK', 'kr'),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF'),
(114, 'Suriname', 'Dollars', 'SRD', '$'),
(115, 'Syria', 'Pounds', 'SYP', '£'),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$'),
(117, 'Thailand', 'Baht', 'THB', '฿'),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$'),
(119, 'Turkey', 'Lira', 'TRY', 'TL'),
(120, 'Turkey', 'Liras', 'TRL', '£'),
(121, 'Tuvalu', 'Dollars', 'TVD', '$'),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴'),
(123, 'United Kingdom', 'Pounds', 'GBP', '£'),
(124, 'United States of America', 'Dollars', 'USD', '$'),
(125, 'Uruguay', 'Pesos', 'UYU', '$U'),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв'),
(127, 'Vatican City', 'Euro', 'EUR', '€'),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs'),
(129, 'Vietnam', 'Dong', 'VND', '₫'),
(130, 'Yemen', 'Rials', 'YER', '﷼'),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$');

-- --------------------------------------------------------

--
-- Table structure for table `create_invoices`
--

CREATE TABLE IF NOT EXISTS `create_invoices` (
  `id` int(10) unsigned NOT NULL,
  `seller_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `meeting_location_address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` double(10,6) DEFAULT NULL,
  `lng` double(10,6) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `discount_price` decimal(5,2) DEFAULT NULL,
  `agreed_price` decimal(5,2) DEFAULT NULL,
  `payment_status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `create_invoices`
--

INSERT INTO `create_invoices` (`id`, `seller_id`, `buyer_id`, `product_id`, `meeting_location_address`, `lat`, `lng`, `price`, `discount_price`, `agreed_price`, `payment_status`, `created_at`, `updated_at`) VALUES
(4, 8, 8, 1, NULL, NULL, NULL, '10.00', NULL, '7.00', 0, '2017-10-11 06:59:15', '2017-10-11 06:59:15'),
(5, 8, 8, 1, NULL, NULL, NULL, '10.00', NULL, '7.00', 0, '2017-10-11 06:59:56', '2017-10-11 06:59:56'),
(6, 8, 8, 1, NULL, NULL, NULL, '10.00', NULL, '7.00', 0, '2017-10-11 07:03:39', '2017-10-11 07:03:39'),
(7, 8, 8, 1, NULL, NULL, NULL, '10.00', NULL, '7.00', 0, '2017-10-11 07:04:37', '2017-10-11 07:04:37'),
(8, 8, 8, 1, NULL, NULL, NULL, '10.00', NULL, '7.00', 0, '2017-10-11 07:05:41', '2017-10-11 07:05:41'),
(9, 8, 8, 1, NULL, NULL, NULL, '10.00', NULL, '7.00', 0, '2017-10-11 07:07:08', '2017-10-11 07:07:08'),
(10, 8, 8, 1, NULL, NULL, NULL, '10.00', NULL, '7.00', 0, '2017-10-11 07:07:30', '2017-10-11 07:07:30'),
(11, 8, 8, 1, NULL, NULL, NULL, '10.00', NULL, '7.00', 0, '2017-10-11 07:09:00', '2017-10-11 07:09:00'),
(12, 8, 8, 1, NULL, NULL, NULL, '10.00', NULL, '7.00', 0, '2017-10-11 07:11:02', '2017-10-11 07:11:02'),
(13, 7, 2, 46, NULL, NULL, NULL, '38.00', NULL, '88.00', 0, '2017-11-02 06:19:39', '2017-11-02 06:19:39'),
(14, 7, 2, 46, NULL, NULL, NULL, '68.00', NULL, '58.00', 0, '2017-11-02 06:22:27', '2017-11-02 06:22:27'),
(15, 7, 2, 46, NULL, NULL, NULL, '38.00', NULL, '56.00', 0, '2017-11-02 06:25:33', '2017-11-02 06:25:33'),
(16, 8, 8, 1, NULL, NULL, NULL, '10.00', NULL, '7.00', 0, '2017-11-02 08:24:36', '2017-11-02 08:24:36'),
(17, 7, 2, 46, NULL, NULL, NULL, '68.00', NULL, '58.00', 0, '2017-11-03 01:35:05', '2017-11-03 01:35:05'),
(18, 7, 2, 46, NULL, NULL, NULL, '35.00', NULL, '25.00', 0, '2017-11-03 01:38:39', '2017-11-03 01:38:39'),
(19, 7, 2, 46, NULL, NULL, NULL, '68.00', NULL, '10.00', 0, '2017-11-03 05:20:57', '2017-11-03 05:20:57'),
(20, 7, 2, 46, NULL, NULL, NULL, '11.00', NULL, '5.00', 0, '2017-11-07 07:57:32', '2017-11-07 07:57:32'),
(21, 7, 2, 46, NULL, NULL, NULL, '11.00', NULL, '8.00', 0, '2017-11-07 08:31:43', '2017-11-07 08:31:43'),
(22, 2, 7, 5, NULL, NULL, NULL, '11.00', NULL, '9.00', 0, '2017-11-07 08:33:59', '2017-11-07 08:33:59'),
(23, 42, 25, 48, 'Bsbdhdbndndndbdbxhxhhdhdhdbsbbdhdbdbdhdhdhdbdbdbdbdbbdbdbdbdbbdb', NULL, NULL, '90.00', NULL, '30.00', 0, '2017-11-09 08:25:30', '2017-11-09 08:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `favourite_sellers`
--

CREATE TABLE IF NOT EXISTS `favourite_sellers` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `seller_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favourite_sellers`
--

INSERT INTO `favourite_sellers` (`id`, `user_id`, `seller_id`, `created_at`, `updated_at`) VALUES
(4, 8, 3, '2017-09-11 01:13:59', '2017-09-11 01:13:59'),
(7, 24, 2, '2017-09-12 23:43:58', '2017-09-12 23:43:58'),
(8, 24, 2, '2017-09-12 23:44:06', '2017-09-12 23:44:06'),
(9, 27, 2, '2017-09-19 07:49:51', '2017-09-19 07:49:51'),
(10, 29, 2, '2017-09-19 08:46:27', '2017-09-19 08:46:27'),
(11, 30, 2, '2017-09-19 08:56:01', '2017-09-19 08:56:01'),
(12, 29, 8, '2017-09-20 06:10:31', '2017-09-20 06:10:31'),
(13, 29, 27, '2017-09-20 06:41:56', '2017-09-20 06:41:56'),
(14, 25, 8, '2017-09-20 09:07:34', '2017-09-20 09:07:34'),
(15, 27, 25, '2017-09-22 01:51:40', '2017-09-22 01:51:40'),
(16, 25, 29, '2017-09-22 04:34:48', '2017-09-22 04:34:48'),
(19, 27, 29, '2017-09-22 05:47:31', '2017-09-22 05:47:31'),
(20, 29, 25, '2017-09-22 06:02:30', '2017-09-22 06:02:30'),
(26, 8, 25, '2017-09-28 08:36:15', '2017-09-28 08:36:15'),
(33, 41, 2, '2017-10-17 08:16:20', '2017-10-17 08:16:20'),
(36, 25, 7, '2017-10-26 01:32:43', '2017-10-26 01:32:43'),
(37, 43, 42, '2017-11-09 04:10:39', '2017-11-09 04:10:39');

-- --------------------------------------------------------

--
-- Table structure for table `markers`
--

CREATE TABLE IF NOT EXISTS `markers` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(80) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `markers`
--

INSERT INTO `markers` (`id`, `name`, `address`, `lat`, `lng`) VALUES
(1, 'Heir Apparel', 'Crowea Pl, Frenchs Forest NSW 2086', -33.737885, 151.235260),
(2, 'BeeYourself Clothing', 'Thalia St, Hassall Grove NSW 2761', -33.729752, 150.836090),
(3, 'Dress Code', 'Glenview Avenue, Revesby, NSW 2212', -33.949448, 151.008591),
(4, 'The Legacy', 'Charlotte Ln, Chatswood NSW 2067', -33.796669, 151.183609),
(5, 'Fashiontasia', 'Braidwood Dr, Prestons NSW 2170', -33.944489, 150.854706),
(6, 'Trish & Tash', 'Lincoln St, Lane Cove West NSW 2066', -33.812222, 151.143707),
(7, 'Perfect Fit', 'Darley Rd, Randwick NSW 2031', -33.903557, 151.237732),
(8, 'Buena Ropa!', 'Brodie St, Rydalmere NSW 2116', -33.815521, 151.026642),
(9, 'Coxcomb and Lily Boutique', 'Ferrers Rd, Horsley Park NSW 2175', -33.829525, 150.873764),
(10, 'Moda Couture', 'Northcote Rd, Glebe NSW 2037', -33.873882, 151.177460),
(11, 'shahil', 'shahil test program', 11.605000, 76.082001);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) unsigned NOT NULL,
  `from_id` int(10) unsigned NOT NULL,
  `to_id` int(10) unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `from_id`, `to_id`, `message`, `created_at`, `updated_at`) VALUES
(137, 27, 25, 'Helo', '2017-09-21 07:20:02', '2017-09-21 07:20:02'),
(138, 27, 25, 'Hw r u', '2017-09-21 07:20:23', '2017-09-21 07:20:23'),
(139, 25, 27, 'Hiih', '2017-09-21 07:21:57', '2017-09-21 07:21:57'),
(140, 25, 27, 'Hiih', '2017-09-21 07:21:57', '2017-09-21 07:21:57'),
(141, 25, 27, 'Hiih', '2017-09-21 07:21:58', '2017-09-21 07:21:58'),
(142, 25, 27, 'Hello priyanka', '2017-09-21 07:22:12', '2017-09-21 07:22:12'),
(143, 27, 25, 'Hey', '2017-09-21 07:22:36', '2017-09-21 07:22:36'),
(144, 25, 27, 'Are u ok?', '2017-09-21 07:22:55', '2017-09-21 07:22:55'),
(145, 25, 27, 'Are u ok?', '2017-09-21 07:23:24', '2017-09-21 07:23:24'),
(146, 27, 25, 'Hello shahil', '2017-09-21 07:23:33', '2017-09-21 07:23:33'),
(147, 27, 25, 'Hello shahil', '2017-09-21 07:23:38', '2017-09-21 07:23:38'),
(148, 27, 25, 'Hello shahil', '2017-09-21 07:29:26', '2017-09-21 07:29:26'),
(149, 27, 25, 'Hello shahil', '2017-09-21 07:29:27', '2017-09-21 07:29:27'),
(150, 27, 25, 'Hello shahil', '2017-09-21 07:29:27', '2017-09-21 07:29:27'),
(151, 27, 25, 'What abt you', '2017-09-21 07:29:49', '2017-09-21 07:29:49'),
(152, 27, 25, 'What abt you', '2017-09-21 07:29:53', '2017-09-21 07:29:53'),
(153, 27, 25, 'Hfukj', '2017-09-21 07:38:42', '2017-09-21 07:38:42'),
(154, 27, 25, 'Hfukj', '2017-09-21 07:38:48', '2017-09-21 07:38:48'),
(155, 27, 25, 'Hfukjhjih', '2017-09-21 07:38:54', '2017-09-21 07:38:54'),
(156, 27, 25, 'Vjkpo do dufgjFBJPIKDFNLLIDAB13567#_@80433SGKKDAHK', '2017-09-21 07:40:51', '2017-09-21 07:40:51'),
(157, 27, 25, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release', '2017-09-21 07:42:05', '2017-09-21 07:42:05'),
(158, 27, 25, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release', '2017-09-21 07:42:06', '2017-09-21 07:42:06'),
(159, 27, 25, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release', '2017-09-21 07:42:07', '2017-09-21 07:42:07'),
(160, 8, 25, 'Hi', '2017-09-21 08:25:42', '2017-09-21 08:25:42'),
(161, 25, 8, 'Helloo', '2017-09-21 08:26:20', '2017-09-21 08:26:20'),
(162, 25, 8, 'What is happening yar?', '2017-09-21 08:30:17', '2017-09-21 08:30:17'),
(163, 25, 8, 'Everything is ok na?', '2017-09-21 08:32:30', '2017-09-21 08:32:30'),
(164, 8, 25, 'Now k', '2017-09-21 08:37:08', '2017-09-21 08:37:08'),
(165, 8, 25, 'Now k', '2017-09-21 08:37:10', '2017-09-21 08:37:10'),
(166, 8, 25, 'Vado St did edited dgdgf', '2017-09-21 08:44:16', '2017-09-21 08:44:16'),
(167, 8, 25, 'Vado St did edited dgdgffdahsghfxbhdsvhhdacfaawryijvcbgfdssjjdsssghnvcddghgcddyhgfd', '2017-09-21 08:44:34', '2017-09-21 08:44:34'),
(168, 8, 25, 'Vaibbav', '2017-09-21 09:08:20', '2017-09-21 09:08:20'),
(169, 7, 25, 'Hi', '2017-09-21 23:57:36', '2017-09-21 23:57:36'),
(170, 7, 25, 'Hi hide cbcjfjfjfncjcjbcndjdkdidhfhhfhfhfhbxjdjfjfjfhhfhfjfbfhfjfjdkfjh', '2017-09-21 23:57:53', '2017-09-21 23:57:53'),
(171, 7, 25, 'Hi', '2017-09-22 00:04:02', '2017-09-22 00:04:02'),
(172, 7, 25, 'Hii', '2017-09-22 00:04:15', '2017-09-22 00:04:15'),
(173, 7, 25, 'Hi', '2017-09-22 00:06:33', '2017-09-22 00:06:33'),
(174, 8, 25, 'Hjhh', '2017-09-22 00:23:42', '2017-09-22 00:23:42'),
(175, 29, 25, 'Hello', '2017-09-22 05:25:05', '2017-09-22 05:25:05'),
(176, 29, 25, 'Hello', '2017-09-22 06:01:35', '2017-09-22 06:01:35'),
(177, 29, 25, 'Hw are you', '2017-09-22 06:04:00', '2017-09-22 06:04:00'),
(178, 29, 27, 'Hello priyanka', '2017-09-22 06:04:40', '2017-09-22 06:04:40'),
(179, 25, 8, 'Huu', '2017-09-22 06:51:22', '2017-09-22 06:51:22'),
(180, 25, 8, 'Huu', '2017-09-22 06:51:22', '2017-09-22 06:51:22'),
(181, 25, 8, 'Hi', '2017-09-22 06:51:32', '2017-09-22 06:51:32'),
(182, 25, 29, 'Hi', '2017-09-22 06:52:18', '2017-09-22 06:52:18'),
(183, 25, 29, 'Fbcvhc', '2017-09-22 06:52:54', '2017-09-22 06:52:54'),
(184, 8, 8, 'hello arun ', '2017-09-22 07:10:53', '2017-09-22 07:10:53'),
(185, 8, 8, 'hello arun ', '2017-09-22 07:12:46', '2017-09-22 07:12:46'),
(186, 8, 8, 'hello arun ', '2017-09-22 07:13:23', '2017-09-22 07:13:23'),
(187, 8, 8, 'hello arun ', '2017-09-22 07:14:40', '2017-09-22 07:14:40'),
(188, 25, 8, 'Helloo', '2017-09-22 07:17:05', '2017-09-22 07:17:05'),
(189, 25, 8, 'Hei', '2017-09-22 07:29:22', '2017-09-22 07:29:22'),
(190, 8, 8, 'hello arun ', '2017-09-28 00:15:28', '2017-09-28 00:15:28'),
(191, 25, 29, 'Hii', '2017-09-28 08:27:42', '2017-09-28 08:27:42'),
(192, 8, 25, 'Hi', '2017-09-28 08:35:10', '2017-09-28 08:35:10'),
(193, 8, 25, 'Testing', '2017-09-28 08:35:24', '2017-09-28 08:35:24'),
(194, 25, 29, 'Hiii', '2017-09-28 08:35:58', '2017-09-28 08:35:58'),
(195, 25, 29, '', '2017-09-28 08:36:00', '2017-09-28 08:36:00'),
(196, 25, 29, 'Hhii', '2017-09-28 08:36:04', '2017-09-28 08:36:04'),
(197, 25, 29, '', '2017-09-28 08:36:12', '2017-09-28 08:36:12'),
(198, 25, 29, 'Hi', '2017-09-28 08:36:18', '2017-09-28 08:36:18'),
(199, 8, 8, 'hello arun ', '2017-10-06 02:16:46', '2017-10-06 02:16:46'),
(200, 25, 7, 'Hiimmm', '2017-10-09 11:41:33', '2017-10-09 11:41:33'),
(201, 7, 2, 'Hi', '2017-10-13 03:35:03', '2017-10-13 03:35:03'),
(202, 7, 2, 'Hi', '2017-10-13 03:35:04', '2017-10-13 03:35:04'),
(203, 40, 2, 'Hi', '2017-10-16 12:00:31', '2017-10-16 12:00:31'),
(204, 25, 7, 'Nnnnnakkakkamskkskskskskskdkskkskxkxkxjxnskkskzks', '2017-10-26 01:32:22', '2017-10-26 01:32:22'),
(205, 25, 7, 'Cjhgjjgb', '2017-11-07 07:53:45', '2017-11-07 07:53:45'),
(206, 7, 2, 'Hshsbnzjsbz js', '2017-11-07 08:29:54', '2017-11-07 08:29:54'),
(207, 25, 7, 'Helloo', '2017-11-08 05:03:35', '2017-11-08 05:03:35'),
(208, 42, 2, 'Hello', '2017-11-09 01:03:42', '2017-11-09 01:03:42'),
(209, 2, 42, 'Yes shahil', '2017-11-09 01:09:05', '2017-11-09 01:09:05'),
(210, 42, 2, 'I would like to buy this for 10 bucks', '2017-11-09 01:09:55', '2017-11-09 01:09:55'),
(211, 2, 42, 'Ok', '2017-11-09 01:14:22', '2017-11-09 01:14:22'),
(212, 2, 42, 'I want kill u', '2017-11-09 01:17:04', '2017-11-09 01:17:04'),
(213, 42, 2, 'Idiot.. 😆😛', '2017-11-09 01:18:23', '2017-11-09 01:18:23'),
(214, 2, 42, 'Tata bye bye', '2017-11-09 01:21:22', '2017-11-09 01:21:22'),
(215, 2, 42, '', '2017-11-09 01:21:23', '2017-11-09 01:21:23'),
(216, 42, 2, 'Ok', '2017-11-09 01:22:05', '2017-11-09 01:22:05'),
(217, 43, 42, 'Hi', '2017-11-09 04:29:46', '2017-11-09 04:29:46'),
(218, 43, 42, 'Hi1', '2017-11-09 04:29:53', '2017-11-09 04:29:53'),
(219, 43, 42, 'Hi 2', '2017-11-09 04:30:00', '2017-11-09 04:30:00'),
(220, 43, 42, 'Hi 3', '2017-11-09 04:30:13', '2017-11-09 04:30:13'),
(221, 43, 42, 'Hi 3', '2017-11-09 04:30:13', '2017-11-09 04:30:13'),
(222, 43, 42, '', '2017-11-09 04:30:14', '2017-11-09 04:30:14'),
(223, 43, 42, 'Hi 5', '2017-11-09 04:30:33', '2017-11-09 04:30:33'),
(224, 43, 42, 'Ji', '2017-11-09 04:31:08', '2017-11-09 04:31:08'),
(225, 43, 42, 'Arulu', '2017-11-09 04:31:46', '2017-11-09 04:31:46'),
(226, 43, 42, 'Hi 8', '2017-11-09 04:32:12', '2017-11-09 04:32:12'),
(227, 43, 42, 'Hi 9', '2017-11-09 04:32:22', '2017-11-09 04:32:22'),
(228, 43, 42, 'Hi 10', '2017-11-09 04:32:33', '2017-11-09 04:32:33'),
(229, 43, 42, 'Hi 11', '2017-11-09 04:32:54', '2017-11-09 04:32:54'),
(230, 43, 42, 'Hi 12', '2017-11-09 04:35:37', '2017-11-09 04:35:37'),
(231, 43, 42, 'Hi 13', '2017-11-09 04:35:51', '2017-11-09 04:35:51'),
(232, 43, 42, 'Hi 13', '2017-11-09 04:35:51', '2017-11-09 04:35:51'),
(233, 43, 42, 'Hi 14', '2017-11-09 04:36:14', '2017-11-09 04:36:14'),
(234, 43, 42, 'Hi 15', '2017-11-09 04:36:24', '2017-11-09 04:36:24'),
(235, 43, 42, 'Hi 16', '2017-11-09 04:36:33', '2017-11-09 04:36:33'),
(236, 43, 42, 'Hi 17', '2017-11-09 04:36:42', '2017-11-09 04:36:42'),
(237, 43, 42, 'Hi 18', '2017-11-09 04:36:52', '2017-11-09 04:36:52'),
(238, 43, 42, 'Hi 19', '2017-11-09 04:37:05', '2017-11-09 04:37:05'),
(239, 43, 42, 'Hi 20', '2017-11-09 04:37:14', '2017-11-09 04:37:14'),
(240, 43, 42, 'Hi, I just checking that the chat will take how many characters. Is it takes the whole message or takes only few lines of this message.', '2017-11-09 04:38:49', '2017-11-09 04:38:49'),
(241, 43, 42, 'If it takes all lines then issue is not there.. if it not takes then there will be issue.', '2017-11-09 04:45:42', '2017-11-09 04:45:42'),
(242, 43, 42, '', '2017-11-09 04:47:26', '2017-11-09 04:47:26'),
(243, 43, 42, '', '2017-11-09 04:47:28', '2017-11-09 04:47:28'),
(244, 43, 42, '', '2017-11-09 04:47:28', '2017-11-09 04:47:28'),
(245, 43, 42, '', '2017-11-09 04:47:30', '2017-11-09 04:47:30'),
(246, 43, 42, '', '2017-11-09 04:47:32', '2017-11-09 04:47:32'),
(247, 43, 42, '', '2017-11-09 04:47:32', '2017-11-09 04:47:32'),
(248, 43, 42, '', '2017-11-09 04:47:33', '2017-11-09 04:47:33'),
(249, 43, 42, '.', '2017-11-09 04:47:37', '2017-11-09 04:47:37'),
(250, 43, 42, '', '2017-11-09 04:47:38', '2017-11-09 04:47:38'),
(251, 43, 42, '', '2017-11-09 04:47:38', '2017-11-09 04:47:38'),
(252, 43, 42, 'Shdjnf', '2017-11-09 04:50:17', '2017-11-09 04:50:17'),
(253, 42, 7, 'Hi', '2017-11-09 05:07:38', '2017-11-09 05:07:38'),
(254, 42, 7, 'Hii', '2017-11-09 05:08:10', '2017-11-09 05:08:10'),
(255, 42, 7, 'Test', '2017-11-09 05:09:02', '2017-11-09 05:09:02'),
(256, 42, 7, 'Testing', '2017-11-09 05:09:21', '2017-11-09 05:09:21'),
(257, 42, 7, 'Hiiii', '2017-11-09 05:11:23', '2017-11-09 05:11:23'),
(258, 42, 7, 'Ok', '2017-11-09 00:23:48', '2017-11-09 00:23:48'),
(259, 42, 7, 'Ok', '2017-11-09 00:23:54', '2017-11-09 00:23:54'),
(260, 42, 7, 'Ok', '2017-11-09 00:24:41', '2017-11-09 00:24:41'),
(261, 42, 7, 'Ok', '2017-11-09 00:26:04', '2017-11-09 00:26:04'),
(262, 42, 7, 'Okkkk', '2017-11-09 00:26:34', '2017-11-09 00:26:34'),
(263, 44, 42, 'Hii', '2017-11-09 01:39:27', '2017-11-09 01:39:27');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(8, '2017_08_11_070546_entrust_setup_tables', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(10) unsigned NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `to_user_id`, `from_user_id`, `message`, `link_to`, `point_id`, `created_at`, `updated_at`) VALUES
(1, 7, 25, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 52, '2017-11-08 05:23:13', '2017-11-08 05:23:13'),
(2, 7, 25, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 53, '2017-11-08 07:54:35', '2017-11-08 07:54:35'),
(3, 7, 25, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 54, '2017-11-08 07:55:10', '2017-11-08 07:55:10'),
(4, 7, 25, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 55, '2017-11-08 08:02:02', '2017-11-08 08:02:02'),
(5, 7, 25, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 56, '2017-11-08 08:08:05', '2017-11-08 08:08:05'),
(6, 2, 25, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 57, '2017-11-08 08:35:21', '2017-11-08 08:35:21'),
(7, 2, 25, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 58, '2017-11-08 08:36:20', '2017-11-08 08:36:20'),
(8, 7, 25, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 59, '2017-11-08 09:06:25', '2017-11-08 09:06:25'),
(9, 7, 42, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 60, '2017-11-09 03:17:51', '2017-11-09 03:17:51'),
(10, 7, 42, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 61, '2017-11-09 03:19:51', '2017-11-09 03:19:51'),
(11, 7, 42, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 62, '2017-11-09 03:21:01', '2017-11-09 03:21:01'),
(12, 7, 42, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 63, '2017-11-09 03:21:26', '2017-11-09 03:21:26'),
(13, 7, 42, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 64, '2017-11-09 03:22:09', '2017-11-09 03:22:09'),
(14, 7, 42, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 65, '2017-11-09 03:23:14', '2017-11-09 03:23:14'),
(15, 42, 7, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 66, '2017-11-09 06:07:18', '2017-11-09 06:07:18'),
(16, 42, 7, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 67, '2017-11-09 06:08:07', '2017-11-09 06:08:07'),
(17, 42, 7, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 68, '2017-11-09 06:10:49', '2017-11-09 06:10:49'),
(18, 42, 25, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 71, '2017-11-10 07:41:57', '2017-11-10 07:41:57'),
(19, 8, 25, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 75, '2017-11-14 04:07:34', '2017-11-14 04:07:34'),
(20, 8, 25, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 76, '2017-11-14 05:44:19', '2017-11-14 05:44:19'),
(21, 25, 46, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 77, '2017-11-16 04:41:10', '2017-11-16 04:41:10'),
(22, 46, 25, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 78, '2017-11-16 06:26:27', '2017-11-16 06:26:27'),
(23, 47, 48, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 79, '2017-11-16 07:23:59', '2017-11-16 07:23:59'),
(24, 46, 48, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 80, '2017-11-16 07:26:36', '2017-11-16 07:26:36'),
(25, 47, 48, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 81, '2017-11-16 07:57:11', '2017-11-16 07:57:11'),
(26, 47, 48, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 86, '2017-11-16 08:21:10', '2017-11-16 08:21:10'),
(27, 47, 48, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 87, '2017-11-16 10:18:40', '2017-11-16 10:18:40'),
(28, 2, 8, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 88, '2017-11-17 08:31:14', '2017-11-17 08:31:14'),
(29, 2, 8, 'You have received a new Order', 'LINK_TO_ORDER_VIEW_PAGE', 89, '2017-11-17 08:33:34', '2017-11-17 08:33:34');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL,
  `purchase_date` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `amount_usd` decimal(10,2) DEFAULT NULL,
  `currency` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` tinyint(1) NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_charge_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_received` tinyint(1) NOT NULL,
  `payment_released_to_seller` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `purchase_date`, `user_id`, `product_id`, `amount`, `amount_usd`, `currency`, `currency_symbol`, `payment_status`, `transaction_id`, `stripe_charge_id`, `item_received`, `payment_released_to_seller`, `created_at`, `updated_at`) VALUES
(2, '2017-09-04 00:00:00', 8, 2, '12.00', NULL, 'USD', '$', 1, '', NULL, 0, 1, NULL, '2017-11-09 05:02:58'),
(3, '2017-10-10 00:00:00', 8, 1, '16.00', NULL, 'USD', '$', 1, '', NULL, 1, 1, NULL, '2017-11-09 04:26:07'),
(4, '2017-10-10 00:00:00', 7, 1, '16.00', NULL, 'USD', '$', 1, '', NULL, 1, NULL, NULL, '2017-11-08 04:09:56'),
(5, '0000-00-00 00:00:00', 8, 3, '0.00', NULL, 'USD', '$', 0, '', NULL, 0, NULL, '2017-10-28 04:32:37', '2017-10-28 04:32:37'),
(6, '0000-00-00 00:00:00', 8, 3, '0.00', NULL, 'USD', '$', 0, '', NULL, 0, NULL, '2017-10-28 04:33:24', '2017-11-08 04:04:37'),
(7, '0000-00-00 00:00:00', 8, 3, '14.00', NULL, 'USD', '$', 0, '', NULL, 0, NULL, '2017-10-28 04:34:24', '2017-10-28 04:34:24'),
(8, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJbZoD9Pdb02k46ylIVzpRU', 0, 1, '2017-11-02 00:19:15', '2017-11-09 05:38:44'),
(9, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJbcfD9Pdb02k46kFB48nbh', 0, 1, '2017-11-02 00:22:12', '2017-11-09 05:04:45'),
(10, '0000-00-00 00:00:00', 7, 3, '14.00', NULL, 'USD', '$', 1, '', 'ch_1BJblOD9Pdb02k46IfhguTP3', 0, NULL, '2017-11-02 00:31:13', '2017-11-08 04:04:45'),
(11, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 0, '', NULL, 0, NULL, '2017-11-02 00:38:59', '2017-11-02 00:38:59'),
(12, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJbtrD9Pdb02k46WBpDNsxH', 0, NULL, '2017-11-02 00:39:58', '2017-11-02 00:40:00'),
(13, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJbttD9Pdb02k462hcjnjEZ', 0, NULL, '2017-11-02 00:40:00', '2017-11-02 00:40:02'),
(14, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJcBOD9Pdb02k46DymblIUx', 0, NULL, '2017-11-02 00:58:05', '2017-11-02 00:58:06'),
(15, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJcOLD9Pdb02k469IbeXzBQ', 0, NULL, '2017-11-02 01:11:28', '2017-11-02 01:11:30'),
(16, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJcVAD9Pdb02k46pNNCfZ0X', 0, NULL, '2017-11-02 01:18:31', '2017-11-02 01:18:32'),
(17, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJcXOD9Pdb02k46xJBfNAUp', 0, NULL, '2017-11-02 01:20:49', '2017-11-02 01:20:51'),
(18, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJcZxD9Pdb02k46QzVNWCOD', 0, NULL, '2017-11-02 01:23:28', '2017-11-02 01:23:29'),
(19, '0000-00-00 00:00:00', 8, 3, '14.00', NULL, 'USD', '$', 0, '', NULL, 0, NULL, '2017-11-02 01:25:45', '2017-11-02 01:25:45'),
(20, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJccED9Pdb02k46awAfPexY', 0, NULL, '2017-11-02 01:25:49', '2017-11-02 01:25:50'),
(21, '0000-00-00 00:00:00', 8, 3, '14.00', NULL, 'USD', '$', 0, '', NULL, 0, NULL, '2017-11-02 01:26:32', '2017-11-02 01:26:32'),
(22, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJciCD9Pdb02k46nPIC0Aux', 0, NULL, '2017-11-02 01:31:59', '2017-11-02 01:32:01'),
(23, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJczUD9Pdb02k460oULTgZi', 0, NULL, '2017-11-02 01:49:51', '2017-11-02 01:49:53'),
(24, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJd59D9Pdb02k46vosN6KC5', 0, NULL, '2017-11-02 01:55:42', '2017-11-02 01:55:43'),
(25, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJd5XD9Pdb02k46JJw7DtPb', 0, NULL, '2017-11-02 01:56:06', '2017-11-02 01:56:08'),
(26, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJdAqD9Pdb02k4614pYA49j', 0, NULL, '2017-11-02 02:01:35', '2017-11-02 02:01:37'),
(27, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJdJmD9Pdb02k46PX8pzJ0m', 0, NULL, '2017-11-02 02:10:49', '2017-11-02 02:10:50'),
(28, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJeKjD9Pdb02k46lnemIsFV', 0, NULL, '2017-11-02 03:15:51', '2017-11-02 03:15:53'),
(29, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJeOkD9Pdb02k46JXaHmh6z', 0, NULL, '2017-11-02 03:20:01', '2017-11-02 03:20:02'),
(30, '0000-00-00 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJeUyD9Pdb02k46zuKn9Gmb', 0, NULL, '2017-11-02 03:26:27', '2017-11-02 03:26:29'),
(31, '2017-11-02 00:00:00', 7, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BJedbD9Pdb02k466Xz1plxg', 1, NULL, '2017-11-02 03:35:22', '2017-11-08 04:40:21'),
(32, '2017-11-06 00:00:00', 8, 1, '7.00', NULL, 'USD', '$', 1, '', 'ch_1BL9PeD9Pdb02k46Axsu7Qqu', 0, NULL, '2017-11-06 06:39:09', '2017-11-06 06:39:11'),
(33, '2017-11-06 00:00:00', 8, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BL9UlD9Pdb02k46zsAVDBPr', 0, NULL, '2017-11-06 06:44:25', '2017-11-06 06:44:27'),
(34, '2017-11-06 00:00:00', 8, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BL9VKD9Pdb02k461IOoqHOU', 0, NULL, '2017-11-06 06:45:01', '2017-11-06 06:45:02'),
(35, '2017-11-06 00:00:00', 8, 1, '7.00', NULL, 'USD', '$', 1, '', 'ch_1BL9amD9Pdb02k46kXhCcCgm', 0, NULL, '2017-11-06 06:50:39', '2017-11-06 06:50:40'),
(36, '2017-11-06 00:00:00', 8, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BL9gmD9Pdb02k46wkuo31vs', 0, NULL, '2017-11-06 06:56:51', '2017-11-06 06:56:52'),
(37, '2017-11-06 00:00:00', 8, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BL9hED9Pdb02k468mIf1rrb', 0, NULL, '2017-11-06 06:57:19', '2017-11-06 06:57:21'),
(38, '2017-11-06 00:00:00', 8, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BL9jSD9Pdb02k46wgcuLrIE', 0, NULL, '2017-11-06 06:59:37', '2017-11-06 06:59:38'),
(39, '2017-11-06 00:00:00', 8, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BL9nuD9Pdb02k46v4vvCsi8', 0, NULL, '2017-11-06 07:04:13', '2017-11-06 07:04:15'),
(40, '2017-11-06 00:00:00', 8, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BL9oUD9Pdb02k467TbU4I3J', 0, NULL, '2017-11-06 07:04:49', '2017-11-06 07:04:50'),
(41, '2017-11-06 00:00:00', 8, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BL9tCD9Pdb02k46TtTH3QqK', 0, NULL, '2017-11-06 07:09:41', '2017-11-06 07:09:43'),
(42, '2017-11-06 00:00:00', 8, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BL9tgD9Pdb02k46mFCT5Piz', 0, NULL, '2017-11-06 07:10:11', '2017-11-06 07:10:13'),
(43, '2017-11-06 00:00:00', 8, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BL9vuD9Pdb02k46kRWJ904L', 0, NULL, '2017-11-06 07:12:29', '2017-11-06 07:12:31'),
(44, '2017-11-06 00:00:00', 8, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BL9zED9Pdb02k46MdOVjXKZ', 0, NULL, '2017-11-06 07:15:55', '2017-11-06 07:15:57'),
(45, '2017-11-06 00:00:00', 8, 1, '7.00', NULL, 'USD', '$', 1, '', 'ch_1BLA0WD9Pdb02k46V8DoAhou', 0, NULL, '2017-11-06 07:17:15', '2017-11-06 07:17:17'),
(46, '2017-11-06 00:00:00', 8, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BLA1ND9Pdb02k46XiHSUiQw', 1, NULL, '2017-11-06 07:18:07', '2017-11-15 06:11:33'),
(47, '2017-11-07 00:00:00', 7, 5, '9.00', NULL, 'USD', '$', 1, '', 'ch_1BLXhSD9Pdb02k46jpMhCDy6', 0, NULL, '2017-11-07 08:35:09', '2017-11-07 08:35:11'),
(48, '2017-11-08 00:00:00', 25, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BLqtLD9Pdb02k46QQAFXhtn', 0, NULL, '2017-11-08 05:04:42', '2017-11-08 05:04:44'),
(49, '2017-11-08 00:00:00', 25, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BLquKD9Pdb02k46uDyuc5w2', 0, NULL, '2017-11-08 05:05:43', '2017-11-08 05:05:44'),
(50, '2017-11-08 00:00:00', 25, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BLr4nD9Pdb02k46oPVgkhS5', 0, NULL, '2017-11-08 05:16:32', '2017-11-08 05:16:33'),
(51, '2017-11-08 00:00:00', 25, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BLrAQD9Pdb02k4608VU4XDg', 0, NULL, '2017-11-08 05:22:21', '2017-11-08 05:22:23'),
(52, '2017-11-08 00:00:00', 25, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BLrBFD9Pdb02k463TSNAvd3', 0, NULL, '2017-11-08 05:23:12', '2017-11-08 05:23:13'),
(53, '2017-11-08 00:00:00', 25, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BLtXjD9Pdb02k46o6vv7OLB', 0, NULL, '2017-11-08 07:54:34', '2017-11-08 07:54:35'),
(54, '2017-11-08 00:00:00', 25, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BLtYHD9Pdb02k46z2d0Y1tw', 0, NULL, '2017-11-08 07:55:08', '2017-11-08 07:55:10'),
(55, '2017-11-08 00:00:00', 25, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BLtewD9Pdb02k46T1p6NxRZ', 0, NULL, '2017-11-08 08:02:01', '2017-11-08 08:02:02'),
(56, '2017-11-08 00:00:00', 25, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BLtkmD9Pdb02k46XFYVwA8n', 0, NULL, '2017-11-08 08:08:03', '2017-11-08 08:08:05'),
(57, '2017-11-08 00:00:00', 25, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BLuBBD9Pdb02k46dMhY1Jsz', 0, NULL, '2017-11-08 08:35:20', '2017-11-08 08:35:21'),
(58, '2017-11-08 00:00:00', 25, 5, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BLuC7D9Pdb02k46f5XTtjan', 0, NULL, '2017-11-08 08:36:18', '2017-11-08 08:36:20'),
(59, '2017-11-08 00:00:00', 25, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BLufED9Pdb02k46eYeWedKl', 0, NULL, '2017-11-08 09:06:23', '2017-11-08 09:06:25'),
(60, '2017-11-09 00:00:00', 42, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BMBhTD9Pdb02k46LykezJHn', 1, NULL, '2017-11-09 03:17:50', '2017-11-09 03:38:15'),
(61, '2017-11-09 00:00:00', 42, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BMBjOD9Pdb02k46MfBph633', 0, NULL, '2017-11-09 03:19:49', '2017-11-09 03:19:51'),
(62, '2017-11-09 00:00:00', 42, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BMBkWD9Pdb02k468pvAew9J', 0, NULL, '2017-11-09 03:20:59', '2017-11-09 03:21:01'),
(63, '2017-11-09 00:00:00', 42, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BMBkwD9Pdb02k464KQVFrbE', 0, NULL, '2017-11-09 03:21:25', '2017-11-09 03:21:26'),
(64, '2017-11-09 00:00:00', 42, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BMBlcD9Pdb02k46AkxjxdJb', 0, NULL, '2017-11-09 03:22:07', '2017-11-09 03:22:09'),
(65, '2017-11-09 00:00:00', 42, 46, '4.00', NULL, 'USD', '$', 1, '', 'ch_1BMBmfD9Pdb02k46vVFCuQRG', 0, NULL, '2017-11-09 03:23:12', '2017-11-09 03:23:14'),
(66, '2017-11-09 00:00:00', 7, 47, '290.00', NULL, 'USD', '$', 1, '', 'ch_1BMELRD9Pdb02k46lFHMhHRp', 0, NULL, '2017-11-09 06:07:16', '2017-11-09 06:07:18'),
(67, '2017-11-09 00:00:00', 7, 47, '290.00', NULL, 'USD', '$', 1, '', 'ch_1BMEMED9Pdb02k46au72qCwP', 0, NULL, '2017-11-09 06:08:05', '2017-11-09 06:08:07'),
(68, '2017-11-09 00:00:00', 7, 47, '290.00', NULL, 'USD', '$', 1, '', 'ch_1BMEOqD9Pdb02k46ybi9N9YX', 1, NULL, '2017-11-09 06:10:47', '2017-11-09 08:43:55'),
(69, '2017-11-10 00:00:00', 25, 48, '6000.00', NULL, 'USD', '$', 0, '', NULL, 0, NULL, '2017-11-10 07:36:39', '2017-11-10 07:36:39'),
(70, '2017-11-10 00:00:00', 25, 48, '6000.00', NULL, 'USD', '$', 0, '', NULL, 0, NULL, '2017-11-10 07:38:43', '2017-11-10 07:38:43'),
(71, '2017-11-10 00:00:00', 25, 48, '6000.00', NULL, 'USD', '$', 1, '', 'ch_1BMcIbD9Pdb02k46jaP5vSRP', 0, NULL, '2017-11-10 07:41:56', '2017-11-10 07:41:57'),
(78, '2017-11-16 00:00:00', 25, 52, '8.00', NULL, 'USD', '$', 1, '', 'ch_1BOlyoIS6KAMeLymoJCal1Uf', 1, 1, '2017-11-16 06:26:25', '2017-11-16 06:29:43'),
(80, '2017-11-16 00:00:00', 48, 54, '2.00', NULL, 'USD', '$', 1, '', 'ch_1BOmv1IS6KAMeLymqrhRtHCI', 0, NULL, '2017-11-16 07:26:34', '2017-11-16 07:26:36'),
(87, '2017-11-16 00:00:00', 48, 55, '129.34', NULL, 'GBP', '£', 1, '', 'ch_1BOpbXIS6KAMeLymChOp6eEd', 0, 1, '2017-11-16 10:18:38', '2017-11-16 10:19:42'),
(88, '2017-11-17 00:00:00', 8, 1, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BPAP7IS6KAMeLymKNw6G69K', 0, NULL, '2017-11-17 08:31:12', '2017-11-17 08:31:14'),
(89, '2017-11-17 00:00:00', 8, 1, '10.00', NULL, 'USD', '$', 1, '', 'ch_1BPAROIS6KAMeLymKgyZF771', 0, NULL, '2017-11-17 08:33:33', '2017-11-17 08:33:34');

-- --------------------------------------------------------

--
-- Table structure for table `password_otps`
--

CREATE TABLE IF NOT EXISTS `password_otps` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `otp_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `verified_at` datetime DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_otps`
--

INSERT INTO `password_otps` (`id`, `user_id`, `otp_code`, `verified`, `verified_at`, `token`, `created_at`, `updated_at`) VALUES
(1, 8, '3946', 0, NULL, '', '2017-08-17 02:19:11', '2017-08-17 02:19:11'),
(2, 8, '8236', 0, NULL, '', '2017-08-17 02:20:56', '2017-08-17 02:20:56'),
(3, 8, '1570', 0, NULL, '', '2017-08-17 02:23:48', '2017-08-17 02:23:48'),
(4, 8, '7958', 0, NULL, '', '2017-08-17 02:25:47', '2017-08-17 02:25:47'),
(5, 8, '9611', 0, NULL, '', '2017-08-17 02:27:01', '2017-08-17 02:27:01'),
(6, 8, '4653', 0, NULL, '', '2017-08-17 02:36:45', '2017-08-17 02:36:45'),
(7, 4, '8480', 1, NULL, '', '2017-08-18 06:24:47', '2017-08-18 08:03:58'),
(8, 4, '3123', 1, '2017-08-21 11:34:12', '2af284p4b21mwqmjp5yy8', '2017-08-21 06:01:42', '2017-08-21 06:24:12'),
(9, 8, '8sva', 0, NULL, NULL, '2017-09-07 01:22:06', '2017-09-07 01:22:06'),
(10, 8, 'iwps', 0, NULL, NULL, '2017-09-07 01:45:14', '2017-09-07 01:45:14'),
(11, 8, '6aqp', 0, NULL, NULL, '2017-09-07 01:48:12', '2017-09-07 01:48:12'),
(12, 8, 'cx7h', 0, NULL, NULL, '2017-09-07 02:00:09', '2017-09-07 02:00:09'),
(13, 8, 'beno', 0, NULL, NULL, '2017-09-07 02:02:37', '2017-09-07 02:02:37'),
(14, 8, 'c2v8', 0, NULL, NULL, '2017-09-07 02:03:49', '2017-09-07 02:03:49'),
(15, 8, '96wm', 0, NULL, NULL, '2017-09-07 02:04:54', '2017-09-07 02:04:54'),
(16, 8, '3zxt', 0, NULL, NULL, '2017-09-07 02:07:09', '2017-09-07 02:07:09'),
(17, 8, '1kpa', 0, NULL, NULL, '2017-09-07 02:10:25', '2017-09-07 02:10:25'),
(18, 8, 'sd7c', 0, NULL, NULL, '2017-09-07 02:13:50', '2017-09-07 02:13:50'),
(19, 8, 'koqu', 0, NULL, NULL, '2017-09-07 02:18:51', '2017-09-07 02:18:51'),
(20, 8, 'v7fk', 0, NULL, NULL, '2017-09-07 02:20:30', '2017-09-07 02:20:30'),
(21, 8, 'votc', 0, NULL, NULL, '2017-09-07 02:21:28', '2017-09-07 02:21:28'),
(22, 8, 'vr4b', 0, NULL, NULL, '2017-09-07 02:22:49', '2017-09-07 02:22:49'),
(23, 8, '6bwm', 0, NULL, NULL, '2017-09-07 02:24:43', '2017-09-07 02:24:43'),
(24, 8, 'kuq5', 0, NULL, NULL, '2017-09-07 02:25:48', '2017-09-07 02:25:48'),
(25, 8, '1caq', 0, NULL, NULL, '2017-09-07 05:31:12', '2017-09-07 05:31:12'),
(29, 8, '8qd5', 0, '2017-09-07 11:14:49', '3sqhg67dsa8agti8c5ky29', '2017-09-07 05:44:14', '2017-09-07 05:44:49'),
(30, 8, 'zyng', 0, '2017-09-07 11:17:52', '0xrn87tm1iles9ntnjum30', '2017-09-07 05:46:56', '2017-09-07 05:47:52'),
(31, 8, 'c372', 0, '2017-09-07 11:34:55', '2leo81tsls1mub2p5zdp31', '2017-09-07 06:04:15', '2017-09-07 06:04:55'),
(32, 8, '1348', 0, '2017-09-07 11:40:57', 'yqapow1mmq6qjw7z2edu32', '2017-09-07 06:09:55', '2017-09-07 06:10:57'),
(33, 8, 'vvrv', 0, '2017-09-07 11:48:48', 's1unwic78meffofdvu2n33', '2017-09-07 06:17:58', '2017-09-07 06:18:48'),
(34, 8, 'pl55', 1, '2017-09-07 11:51:05', 'n31dh3inotkprbczj6lk34', '2017-09-07 06:20:20', '2017-09-07 06:21:17'),
(35, 8, 'dyqi', 1, '2017-09-07 11:55:28', '2i27xnjwclv3i6xcsu1v35', '2017-09-07 06:24:40', '2017-09-07 06:25:39'),
(36, 8, '2vrk', 1, '2017-09-07 12:01:06', 'vlmf2jr7npyw6figmqfa36', '2017-09-07 06:29:05', '2017-09-07 06:31:15'),
(37, 8, 'fner', 1, '2017-09-07 12:05:27', 'o1o5rp2tbhijibb34dqy37', '2017-09-07 06:34:27', '2017-09-07 06:36:03'),
(38, 8, '5jwk', 1, '2017-09-07 12:08:32', '063o0ly6246tii56o3f338', '2017-09-07 06:37:22', '2017-09-07 06:38:49'),
(39, 8, 'xbjl', 1, '2017-09-07 12:11:15', 'oji9yt2q5rdi09fpf0qs39', '2017-09-07 06:40:12', '2017-09-07 06:41:24'),
(40, 8, 'dkd2', 1, '2017-09-07 12:16:33', 'ahzsjrhobd80wravldlq40', '2017-09-07 06:45:46', '2017-09-07 06:46:44'),
(41, 8, 'b466', 1, '2017-09-07 12:19:06', 'hns1uo96sg9tnchoxgv041', '2017-09-07 06:47:55', '2017-09-07 06:49:33'),
(42, 25, 'tiab', 0, NULL, NULL, '2017-09-19 06:25:57', '2017-09-19 06:25:57'),
(43, 27, 'fl8n', 1, '2017-09-20 12:51:11', 'v8pxnxw327z6gjsr25ft43', '2017-09-20 07:20:23', '2017-09-20 07:25:22'),
(44, 32, '8v5i', 0, NULL, NULL, '2017-09-22 06:12:36', '2017-09-22 06:12:36'),
(45, 30, 'n6md', 0, '2017-09-22 11:46:14', '25p35aeviedt9hwuwnkm45', '2017-09-22 06:15:34', '2017-09-22 06:16:14'),
(46, 27, '3j84', 0, '2017-09-22 11:48:43', 'vc9mtplym65w9mt9r1a846', '2017-09-22 06:18:01', '2017-09-22 06:18:43'),
(47, 29, '2uxy', 0, '2017-09-22 11:51:52', 'o4ez0ws61g3kaur0308b47', '2017-09-22 06:20:44', '2017-09-22 06:21:52'),
(48, 27, 'dlga', 1, '2017-09-22 11:59:14', '3rxboivkzgbzbiad4jbi48', '2017-09-22 06:25:12', '2017-09-22 06:29:34'),
(49, 27, '5wfm', 0, NULL, NULL, '2017-09-22 06:32:26', '2017-09-22 06:32:26'),
(50, 27, 'h50z', 1, '2017-09-22 12:04:13', 'kqk16nemx77zo06kt0ya50', '2017-09-22 06:33:23', '2017-09-22 06:35:12'),
(51, 27, 'mgig', 0, NULL, NULL, '2017-09-22 06:36:21', '2017-09-22 06:36:21'),
(52, 27, 'he6o', 0, '2017-09-22 12:08:36', 'o7fztl38c563azur2zfg52', '2017-09-22 06:37:52', '2017-09-22 06:38:36'),
(53, 8, '029p', 1, '2017-09-25 12:58:48', 'oksug1k58i4gwgmuj57t53', '2017-09-25 07:27:55', '2017-09-25 07:29:29'),
(54, 7, 'mzhx', 0, NULL, NULL, '2017-09-27 06:58:49', '2017-09-27 06:58:49'),
(55, 7, '47lr', 0, '2017-09-27 12:31:50', 'g5jkt3qbujcxn9dyzllu55', '2017-09-27 07:01:17', '2017-09-27 07:01:50'),
(56, 7, 'wbh3', 0, '2017-09-27 12:35:25', '1w72enpkc7etcyd614iw56', '2017-09-27 07:04:39', '2017-09-27 07:05:25'),
(57, 7, 'mang', 0, '2017-09-27 12:41:24', 'ouub47a4svyus6w7tlr557', '2017-09-27 07:11:05', '2017-09-27 07:11:24'),
(58, 7, 'aacp', 0, '2017-09-27 13:02:16', 'a4i0cnz0ydd0jof2agh058', '2017-09-27 07:31:27', '2017-09-27 07:32:16'),
(59, 7, 'tnry', 0, '2017-09-27 13:08:28', '4cuu23l49w8j1rjdejdd59', '2017-09-27 07:37:45', '2017-09-27 07:38:28'),
(60, 7, 'no77', 0, '2017-09-27 13:11:21', '0k8raw96a6g60ei044p360', '2017-09-27 07:40:44', '2017-09-27 07:41:21'),
(61, 7, 'uq5x', 0, NULL, NULL, '2017-10-17 00:02:16', '2017-10-17 00:02:16');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('shahil.nissam@brtindia.com', '$2y$10$7TGX0QRylHvq75Sf3fv.c.rXJPZWzSygIHCOz56bmr2/DLnHXW5E2', '2017-08-14 06:00:10');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `discount_price` decimal(13,2) NOT NULL,
  `currency` varchar(25) DEFAULT NULL,
  `currency_symbol` varchar(25) DEFAULT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `product_title`, `product_description`, `price`, `discount_price`, `currency`, `currency_symbol`, `lat`, `lng`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'Motorola', 'Moto G Play, 4th Gen (Black)\nNever Miss on a High Score - More Phone. More Fun. Affordable as Ever\nIntroducing Moto G Play, 4th Gen the phone that gives you more of what you love. Enjoy the fast, reliable performance of a quad-core processor when you’re watching videos or playing games during a break. Count on a battery that lasts all day*, so you don’t worry about running out of power. And boost performance with a pure, clutter-free version of Android. The best part? You only have to spend a little for a phone you’ll love a lot. Moto G Play,4th Gen. Entertainment for all.', '9990.00', '10.00', 'USD', '$', 40.709999, 74.000000, NULL, NULL, NULL),
(2, 2, 'Soulflower', 'Soulflower Coldpressed Castor Carrier Oil, 225ml\nWeak strands must come off to encourage new hair growth. It''s nothing to be worried if you see few hair strands on your palm till 3-4 applications. It will make sure elimination of all damaged strands with weak roots and promote faster growth of healthy, strong hair. It will take at least 20 applications to see the best optimal results.', '300.00', '4.00', 'USD', '$', 40.709999, 74.000000, NULL, NULL, NULL),
(3, 2, 'ZAPCASE', 'ZAPCASE Printed Flip Cover for Samsung Galaxy J7\n\nZAPCASE Printed Flip Cover gives a Premium Look and new style to your mobile. The case can also be used as a stand and helps you to watch videos or use skype with comfort. Case holder slot helps you carry your cards or cash with ease. This is Premium wallet case with magnetic lock which gives complete protection to your mobile. Trendy and Gorgeous leather appeareance.', '699.00', '14.00', 'USD', '$', 40.709999, 74.000000, NULL, NULL, NULL),
(4, 2, 'Sennheiser', 'Sennheiser HD 4.40-BT Bluetooth Headphones (Black)\r\nSennheiser’s HD 4.40BT Wireless headset offers great sound quality for every day listening on the move. Long-lasting battery life and a robust, foldable design, the closed back around ear headset is the perfect companion for your mobile devices - providing you with unrivalled listening pleasure and easy communication.', '872.00', '100.00', 'USD', '$', 40.709999, 74.000000, NULL, NULL, NULL),
(5, 2, 'Fossil', 'Fossil Q FTW2106 Marshal Touchscreen Digital Multi-Colour Dial Men''s Smartwatch\r\nQ Marshal is our newest digital display watch that connects seamlessly to your phone. Strapped in smooth leather, the tech-savvy dial with touchscreen functionality includes customizable faces. This handsome timepiece tracks everything from daily steps to calories. Notifications alert you of incoming calls and texts. Use the built-in microphone and speaker to do a variety of tasks on your smartwatch using just your voice. Stay charged for up to 24 hours (based on usage) with the conductive magnetic charger. From customizable watch faces to interchangeable straps, it’s easy to tell time the smart(er) way with Q Marshal. Powered by Android Wear, this touchscreen smartwatch tracks activity, connects to your favorite apps, receives display notifications, and has customizable faces to fit your style. Fossil Q Marshal is compatible with phones running Android OS 4.4+ or iPhone 5/iOS 8.2+. Supported features may vary by platform. Android and Android Wear are trademarks of Google Inc.', '136.00', '10.00', 'USD', '$', 12.971599, 77.374573, NULL, NULL, NULL),
(46, 7, 'Mouse', 'Item model number - 910-001439\nComputer memory type DDR3 SDRAM', '6.00', '4.00', 'USD', '$', 12.962586, 77.593117, NULL, '2017-10-13 03:23:59', '2017-10-13 03:23:59'),
(47, 42, 'Vending machine', 'This is for sale.. please contact me in below address.. hsh akka jsjjs jsksjsk jsjjs sjsj', '300.00', '290.00', 'USD', '$', 12.962554, 77.593002, NULL, '2017-11-09 01:07:10', '2017-11-09 01:07:10'),
(48, 42, 'Scotland oak wood barrels', '200 year old Scotland oak wood barrels,renovated for interior decorations and can be used to brew wine,beer,alchohol', '7000.00', '6000.00', 'USD', '$', 12.962546, 77.593002, NULL, '2017-11-09 03:59:46', '2017-11-09 03:59:46'),
(49, 25, 'Testing', 'Testing from vangan hahahahaha 2dhdhhdhdhdhdhhdhdhdhdhdhhd', '60.00', '50.00', 'USD', '$', 12.962558, 77.593002, NULL, '2017-11-09 08:21:40', '2017-11-09 08:21:40'),
(50, 8, 'Johnson Marbles', '?Marbonite and marbles .. Perth johnson ang Alfa 1010 brands available.. interested please contact', '60.00', '56.00', 'USD', '$', 12.962569, 77.593002, NULL, '2017-11-13 07:42:09', '2017-11-13 07:42:09'),
(51, 46, 'Lab vessel', 'What is this.. we don''t know.. we are testers.. and I', '120.00', '100.00', 'USD', '$', 12.962527, 77.592995, NULL, '2017-11-16 04:26:36', '2017-11-16 04:26:36'),
(52, 46, 'I don''t know', 'I don''t know what I am selling.. hihi.. hello.. how r u.. are u there', '11.00', '8.00', 'USD', '$', 12.962560, 77.593002, NULL, '2017-11-16 04:31:27', '2017-11-16 04:31:27'),
(53, 46, 'shah', 'xzcv sad fljasdf aksdjfh kasd fkhasdhf kashdfk ashdfkjasdh f', '11.00', '9.00', 'USD', '$', 12.962549, 77.593002, NULL, '2017-11-16 04:36:40', '2017-11-16 04:36:40'),
(54, 46, 'teast', 'sadasd v fsd  kas hdkfh askdhf kasdhf kasdjf fadsfsd', '12.00', '2.00', 'USD', '$', 12.962549, 77.593002, NULL, '2017-11-16 04:39:27', '2017-11-16 04:39:27'),
(55, 47, 'Europe nale no car', 'This car is in Europe.. okokokokokkkoklkl jdj nznjssb i understood', '100.00', '98.00', 'GBP', '£', 12.962557, 77.593002, NULL, '2017-11-16 07:16:46', '2017-11-16 07:16:46');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `filename`, `created_at`, `updated_at`) VALUES
(1, 1, 'fossil.jpg', NULL, NULL),
(2, 1, 'mesleep.jpg', NULL, NULL),
(3, 2, 'motorola.jpg', NULL, NULL),
(4, 3, 'Sennheiser.jpg', NULL, NULL),
(5, 4, 'mesleep.jpg', NULL, NULL),
(6, 5, 'soulflower.jpg', NULL, NULL),
(7, 6, 'zapcase.jpg', NULL, NULL),
(8, 10, '20170906105937s3twryoprs.jpg', '2017-09-06 05:29:37', '2017-09-06 05:29:37'),
(9, 22, '20170913052856bljgkghsuw.jpg', '2017-09-12 23:58:56', '2017-09-12 23:58:56'),
(10, 23, '2017091305413650s9ntc9zb.jpg', '2017-09-13 00:11:36', '2017-09-13 00:11:36'),
(11, 23, '20170913054136dzbfiist2i.jpg', '2017-09-13 00:11:36', '2017-09-13 00:11:36'),
(12, 23, '20170913054136duej7abc54.jpg', '2017-09-13 00:11:36', '2017-09-13 00:11:36'),
(13, 24, '20170920091543niowx9dsfw.jpg', '2017-09-20 03:45:43', '2017-09-20 03:45:43'),
(14, 24, '20170920091543iy6mhq771u.jpg', '2017-09-20 03:45:43', '2017-09-20 03:45:43'),
(15, 25, '20170920091938efiaemsntx.jpg', '2017-09-20 03:49:38', '2017-09-20 03:49:38'),
(16, 25, '20170920091938ka74c18a3h.jpg', '2017-09-20 03:49:38', '2017-09-20 03:49:38'),
(17, 26, '20170920113123z485ywxpks.jpg', '2017-09-20 06:01:23', '2017-09-20 06:01:23'),
(18, 27, '2017092016273730ivrhwxvf.jpg', '2017-09-20 10:57:37', '2017-09-20 10:57:37'),
(19, 28, '20170922100635sezbk6p26z.jpg', '2017-09-22 04:36:35', '2017-09-22 04:36:35'),
(20, 29, '20170922100949z9125y5vnh.jpg', '2017-09-22 04:39:49', '2017-09-22 04:39:49'),
(21, 30, '20170922103336vybn10zgw8.jpg', '2017-09-22 05:03:36', '2017-09-22 05:03:36'),
(22, 30, '20170922103336mw275vsu9t.jpg', '2017-09-22 05:03:36', '2017-09-22 05:03:36'),
(23, 32, '20170922111701qn1n6u6nu2.jpg', '2017-09-22 05:47:01', '2017-09-22 05:47:01'),
(24, 34, '201709221235164kx46g2cvv.jpg', '2017-09-22 07:05:16', '2017-09-22 07:05:16'),
(25, 35, '201709251222587yc6mfhjb8.jpg', '2017-09-25 06:52:59', '2017-09-25 06:52:59'),
(26, 36, '20170928052809hb6lj7rt6r.jpg', '2017-09-27 23:58:09', '2017-09-27 23:58:09'),
(27, 38, '20170928063732vwr36j0cnx.jpg', '2017-09-28 01:07:32', '2017-09-28 01:07:32'),
(28, 38, '20170928063732pslsy9yr43.jpg', '2017-09-28 01:07:32', '2017-09-28 01:07:32'),
(29, 38, '201709280637327nnooztzbm.jpg', '2017-09-28 01:07:32', '2017-09-28 01:07:32'),
(30, 39, '201709280646517v49hf7z5k.jpg', '2017-09-28 01:16:52', '2017-09-28 01:16:52'),
(31, 40, '201709280711472s8sa0ql6y.jpg', '2017-09-28 01:41:47', '2017-09-28 01:41:47'),
(32, 41, '20170928071423i88ublza3c.jpg', '2017-09-28 01:44:23', '2017-09-28 01:44:23'),
(33, 43, '20170928120916xdwc4dkgll.jpg', '2017-09-28 06:39:16', '2017-09-28 06:39:16'),
(34, 44, '201709281319332uyw4g47ut.jpg', '2017-09-28 07:49:33', '2017-09-28 07:49:33'),
(35, 45, '20170928141124wmjs0lm4uf.jpg', '2017-09-28 08:41:24', '2017-09-28 08:41:24'),
(36, 46, '20171013085359xkuijxvscu.jpg', '2017-10-13 03:23:59', '2017-10-13 03:23:59'),
(37, 47, '201711090637109s587qtnc3.jpg', '2017-11-09 01:07:10', '2017-11-09 01:07:10'),
(38, 48, '20171109092946vvgd80ejci.jpg', '2017-11-09 03:59:46', '2017-11-09 03:59:46'),
(39, 48, '201711090929465m6bwzkcm9.jpg', '2017-11-09 03:59:46', '2017-11-09 03:59:46'),
(40, 48, '20171109092946mffum5nahq.jpg', '2017-11-09 03:59:46', '2017-11-09 03:59:46'),
(41, 48, '20171109092946lcl2qu24de.jpg', '2017-11-09 03:59:46', '2017-11-09 03:59:46'),
(42, 49, '201711091351407kdthjrn6l.jpg', '2017-11-09 08:21:40', '2017-11-09 08:21:40'),
(43, 49, '20171109135140anb9487vjh.jpg', '2017-11-09 08:21:40', '2017-11-09 08:21:40'),
(44, 50, '20171113131209r3igye2g4w.jpg', '2017-11-13 07:42:09', '2017-11-13 07:42:09'),
(45, 50, '2017111313121011bv1jy0z9.jpg', '2017-11-13 07:42:10', '2017-11-13 07:42:10'),
(46, 50, '20171113131210sbny617nah.jpg', '2017-11-13 07:42:10', '2017-11-13 07:42:10'),
(47, 51, '2017111609563612d4wqoh6l.jpg', '2017-11-16 04:26:36', '2017-11-16 04:26:36'),
(48, 52, '20171116100127kheijpntt6.jpg', '2017-11-16 04:31:27', '2017-11-16 04:31:27'),
(49, 53, '20171116100640f9q6oo19ux.jpg', '2017-11-16 04:36:40', '2017-11-16 04:36:40'),
(50, 54, '201711161009271oe2bkwqxp.jpg', '2017-11-16 04:39:27', '2017-11-16 04:39:27'),
(51, 55, '20171116124646yn8xzi8i8g.jpg', '2017-11-16 07:16:46', '2017-11-16 07:16:46');

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
(1, 1),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(26, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(39, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2);

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE IF NOT EXISTS `transfers` (
  `id` int(10) unsigned NOT NULL,
  `stripe_transfer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transfers`
--

INSERT INTO `transfers` (`id`, `stripe_transfer_id`, `order_id`, `seller_id`, `amount`, `created_at`, `updated_at`) VALUES
(5, 'tr_1BMClWD9Pdb02k46n7G3QbeN', 3, 2, 14, '2017-11-09 04:26:07', '2017-11-09 04:26:07'),
(6, 'tr_1BMDLBD9Pdb02k46V0wFZdJ1', 2, 2, 10, '2017-11-09 05:02:58', '2017-11-09 05:02:58'),
(7, 'tr_1BMDMuD9Pdb02k46sPO6cosO', 9, 2, 8, '2017-11-09 05:04:45', '2017-11-09 05:04:45'),
(8, 'tr_1BMDtnD9Pdb02k46ZwQk6QKQ', 8, 2, 8, '2017-11-09 05:38:44', '2017-11-09 05:38:44'),
(9, 'tr_1BOm1zIS6KAMeLym1LbI3Xqe', 78, 46, 7, '2017-11-16 06:29:43', '2017-11-16 06:29:43'),
(10, 'tr_1BOoKYIS6KAMeLymN1NlQN1H', 86, 47, 85, '2017-11-16 08:57:03', '2017-11-16 08:57:03'),
(11, 'tr_1BOpMkIS6KAMeLymNouPyVFA', 86, 47, 112, '2017-11-16 10:03:22', '2017-11-16 10:03:22'),
(12, 'tr_1BOpcXIS6KAMeLymNE4I8Exw', 87, 47, 112, '2017-11-16 10:19:42', '2017-11-16 10:19:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(500) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `handle_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(2) DEFAULT '1',
  `country_id` int(11) DEFAULT NULL,
  `facebook_id` varchar(255) NOT NULL,
  `stripe_customer_id` varchar(255) DEFAULT NULL,
  `stripe_account_id` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `first_name`, `last_name`, `handle_name`, `mobile`, `profile_image`, `cover_image`, `is_active`, `country_id`, `facebook_id`, `stripe_customer_id`, `stripe_account_id`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$b587nYu4ZgifVhbTkd.CdO7z/6o/quIR1kfPzVarZRYS6Ef4yDHN.', '', '', '', '', '', '', 1, 2, '', NULL, NULL, 'Ssd5Yh5gjmqQJgrUBK43OuY1LoCjowaRKlJiedrWiWkQxFHozj56w1KM5TZy', NULL, '2017-07-26 11:31:10', '2017-11-21 12:33:55'),
(2, 'Amiya Kumar Jena', 'amiya.kumar@brtindia.com', '$2y$10$uAhBJ/ezRZmY/Ce7h.WbUeEimcjfQ7u3jjo3axfFseyMvQRG4jEM2', 'Amiya', 'Kumar', 'amiyajena', '', '', '', 1, 2, '', NULL, 'acct_1BLVKrKRIWlHg5Wq', NULL, NULL, '2017-08-03 02:08:20', '2017-11-16 09:51:49'),
(3, 'shahil', 'shahil@gmail.com', '$2y$10$S1dR.7jbG.BHhj5GFLRVSO6oQJ3p3god84buEar9ERy/1JQaSBElG', 'Shahil', 'Nissam', 'shany', '', '20170908063507o8xl0ewbv5.jpg', '', 1, 2, '', NULL, NULL, 'mJ1pAG4WERBXzyhFfiq52z8tZARxqcaqRlgEgUDIJEr3sHbpE3ksk2WA7VBE', NULL, '2017-08-10 02:35:16', '2017-11-16 09:51:49'),
(4, 'shahil', 'shahil.nissam@brtindia.com', '$2y$10$2T43bYqHyknc2Xxhsl.mqe1BOG1is3V4yfyUHgHxdLic1g4SjM8da', '', '', '', '', '', '', 1, 2, '', NULL, NULL, '8LzMRieoDZSns49gMJZwTupjQFHtWLLQfTahIR1RqM9KuTe3103dv5QGA61v', NULL, '2017-08-10 06:09:42', '2017-11-16 09:51:49'),
(5, 'test', 'test@test.com', '$2y$10$EA2NMwJyF2Gkw0l1896ux.9MfLhESzQr.04w67bottq.a8xIOsg.C', '', '', '', '', '', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-08-10 08:27:09', '2017-11-16 09:51:49'),
(6, 'test2', 'test3@test.com', '$2y$10$9bCcUXhwQCZGi.yvTyDFtuKJRqPVoB7k27I.7HHvI4lXkF7QZ6rdy', '', '', '', '', '', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-08-11 00:41:33', '2017-11-16 09:51:49'),
(7, 'user', 'user@user.com', '$2y$10$VF4bel.VgWrHP8jDUQYXreL0Lwgrsf4QVcQUl3CRQ4M.42ZYFckVq', 'Testing', 'Bluerose', 'Fhjhb', '12345678908', '20171024075532vpiprqs5ba.jpg', '201710240843222dnku86lrf.jpg', 1, 2, '', NULL, 'acct_1BNc82Hc9EYCBA6S', NULL, NULL, '2017-08-11 04:05:03', '2017-11-16 09:51:49'),
(8, 'user2', 'user2@user.com', '$2y$10$uAhBJ/ezRZmY/Ce7h.WbUeEimcjfQ7u3jjo3axfFseyMvQRG4jEM2', 'Shan', 'T', 'test', '9867543222', '20170928004927u203347zkw.jpg', '201708180621494867486797.jpg', 1, 2, '', NULL, 'acct_1BIZrfIlSRDwQEsV', 'fcn5APBI3QpJhlF0CXQyxlTOB0kvMGqMUZUgIdGr5xNsNcCRQkoeb2rHXBvH', NULL, '2017-08-11 04:14:16', '2017-11-16 09:51:49'),
(9, 'testingmobile', 'mobileapi@gmail.com', '$2y$10$Qmy.s6d0YmkLYFT4o59y1eX8pFSu.N6a8fr4Rdo6CmaOUaQ4QCqJy', '', '', '', '', '', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-08-11 23:17:08', '2017-11-16 09:51:49'),
(10, 'blah', 'user3@user.com', '$2y$10$xUQUA9JZK57jAK8bbeJIruO1kiMLKEQPDFtjqeE/zJBfivPeWKCt2', NULL, NULL, 'handle', NULL, NULL, NULL, 1, 2, '', NULL, NULL, NULL, NULL, '2017-08-18 05:47:33', '2017-11-16 09:51:49'),
(11, 'testing', 'testing@gmail.com', '$2y$10$nOXvhY5mBFW3FcH/zLkkDeP3lh4u6qxixcVTm99g8l15G2FWZrEUi', NULL, NULL, 'handle', NULL, NULL, NULL, 1, 2, '', NULL, NULL, NULL, NULL, '2017-08-18 05:53:06', '2017-11-16 09:51:49'),
(12, 'blah', 'user4@user.com', '$2y$10$2edEWYtGfEO6pDGSp2NjbuaEtolYmFx6rHHs6u.eJ4HzZbIwAU8.y', NULL, NULL, 'handle', NULL, NULL, NULL, 1, 2, '', NULL, NULL, NULL, NULL, '2017-08-18 06:17:13', '2017-11-16 09:51:49'),
(13, 'blah', 'user5@user.com', '$2y$10$BQxiPseLyKjqSZE/AjYpZOazGLGBRrx2cyXADJDN4nA4SPNIgoILq', 'blah', '', '', NULL, NULL, NULL, 1, 2, '', NULL, NULL, NULL, NULL, '2017-08-18 06:19:39', '2017-11-16 09:51:49'),
(16, 'testing', 'iamarunrajan@gmail.com', '$2y$10$rv8nZ4WM3DBgN5MMKgwPKeD97UV2jpr/g4t9K/fECmTN6oSMUJkZu', 'testing', '', '', '9943348711', NULL, NULL, 1, 2, '', NULL, NULL, NULL, NULL, '2017-08-21 09:50:12', '2017-11-16 09:51:49'),
(17, 'asdasd', 'sdfsf@rmail.com', '$2y$10$adOHO0Qv6lsF9MM0FTsFSeTjANL2zSenkDtHSP5XB7fC6NJX5NLSe', 'asdasd', '', '', '1111111111', NULL, NULL, 1, 2, '', NULL, NULL, NULL, NULL, '2017-08-22 02:27:16', '2017-11-16 09:51:49'),
(18, 'Amiya Kumar Jena', 'amiya.kumar+1@brtindia.com', '$2y$10$axYPdyBbjJpQHCPauzHOoOIW/kZy19CL5PwDK24Dedo7wGnZs7Li.', 'Amiya Kumar Jena', '', '', '8801758650', NULL, NULL, 1, 2, '', NULL, NULL, NULL, NULL, '2017-08-22 07:15:37', '2017-11-16 09:51:49'),
(19, 'Amiy', 'addfgghb@gmail.com', '$2y$10$rUnxJrUKcLZwnUL7HG83UeUQtJWRx3WXGSUhumYaD7M.sDGaFio0q', 'Amiy', '', '', '8801758650', NULL, NULL, 1, 2, '', NULL, NULL, NULL, NULL, '2017-08-22 07:18:41', '2017-11-16 09:51:49'),
(20, 'shahil', 'shahilboy@gmail.com', '$2y$10$bXJqXygoL82hsWT9ea/0sOH6u41e6q3Z/xHdr9Jp.IqRSm7tCX7HW', 'shahil', '', '', '9898989898', '', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-09-07 06:02:22', '2017-11-16 09:51:49'),
(21, 'Nilesh Sharma', 'testing.brtindia@gmail.com', '$2y$10$lgCqzZ89MCl1BxeUEy6vz.dSoCyTbjK1faRSPJo3iufxdUKkrMQha', 'Nilesh Sharma', '', '', '8194811601', '201709071315124z958puopl.jpg', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-09-07 07:33:43', '2017-11-16 09:51:49'),
(22, 'Nilesh Sharma', 'te.sting.brtindia@gmail.com', '$2y$10$bIGvwJK44IPFeXdmZFPpTuVcn..AouL0Js4ETntBbYHn8B.BnpRQu', 'Nilesh', 'Sharma', 'the.sting.brtindia@gmail.com', '8194811601', '20170908063507o8xl0ewbv5.jpg', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-09-08 00:59:06', '2017-11-16 09:51:49'),
(23, 'Abhishek Jain', 'jain333abhishek@gmail.com', '$2y$10$.WbZqqOkM/SVBneydnn74.eUYiwuiwFeMckzZ.mxZfvrCWKG1bBLG', 'Abhishek Jain', '', '', '7179038125', '', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-09-12 07:00:56', '2017-11-16 09:51:49'),
(24, 'Arunkumar', 'arunkumar@testing.com', '$2y$10$Ah//9gTa3I9uxI/iJOHae.cJlUjjuNW08xbpSzHBCI4BfAD/3Hucq', 'Arunkumar', 'Soundar', 'Rajan', '7601821144', '201709130521264sqi3spnpd.jpg', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-09-12 21:51:23', '2017-11-16 09:51:49'),
(25, 'Shahil Nissam', 'shahilnizzam1@gmail.com', '$2y$10$CN8Iid4YJz5d1XATYPBDGuhGj.d5iGj/TRWI9FX13MEjYMycu6/iW', 'Shahil Nissam', NULL, 'handle', NULL, NULL, NULL, 1, 2, '1691472777530869', NULL, 'acct_1BOlZ5E23jnkgTpJ', NULL, NULL, '2017-09-19 05:36:53', '2017-11-16 06:01:58'),
(27, 'Priyanka', 'darsinipriyanka92@gmail.com', '$2y$10$0h1fSmo4XWzJuyYKyvtMNOCK3q2wmVYFnaB2tgYjuFjz1HOm.KSOy', 'Priyanka', 'mohanta', 'Mpriyanka', '8904426172', '201709221124103v42srshlq.jpg', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-09-19 06:28:26', '2017-11-16 09:51:49'),
(28, 'Priyanka', 'adarsini514@gmail.com', '$2y$10$KEEixgLuChEFvfcF48whme1pX2Aefaj0SA8FMHaBAZ9c8yRPX.4ki', 'Priyanka', '', '', '8904426172', '', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-09-19 07:15:23', '2017-11-16 09:51:49'),
(29, 'John Smith', 'testing.fanlyfe@gmail.com', '', 'John Smith', NULL, 'handle', NULL, '201709201157538i4pbcig65.jpg', NULL, 1, 2, '131067717531356', NULL, NULL, NULL, NULL, '2017-09-19 07:55:54', '2017-11-16 09:51:49'),
(30, 'Priyadarsini', 'ocnpriyanka60@gmail.com', '$2y$10$VSwEp6Ylq9R.ypPlK79ke.2dawYf5toTsUG79YbRr967l5jJyviUq', 'Priyadarsini', '', '', '8904426172', '', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-09-19 08:53:53', '2017-11-16 09:51:49'),
(31, 'AL TF', 'althafashraf131@gmail.com', '', 'AL TF', NULL, 'handle', NULL, NULL, NULL, 1, 2, '', NULL, NULL, NULL, NULL, '2017-09-20 10:49:07', '2017-11-16 09:51:49'),
(32, 'Subash', 'abc@gmail.com', '$2y$10$8/9OpUQYpvXrBqMuQH5Jfe77wovPqMk43NsS8NmkIuoqkQKbQfJ8m', 'Subash', '', '', '8904426172', '', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-09-22 03:57:24', '2017-11-16 09:51:49'),
(33, 'arunkumar', 'arunkumar.s@brtindia.com', '$2y$10$sR3b6BRUtqoY6ufHnJmXeutZNsCUboNva7G8tOVanTEmzv3Hz03I6', 'arunkumar', '', '', '9899898989', '', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-10-10 01:18:21', '2017-11-16 09:51:49'),
(34, 'arunkumar', 'arunkumar@gmail.com', '$2y$10$CXjNYlFbZeVLcBeZgny9Nu12j9K4KvyCfVSczdzgyZ5g19Lt.Zf4C', 'arunkumar', '', 'arunkumar1990', '9898989988', '', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-10-10 05:31:25', '2017-11-16 09:51:49'),
(35, 'arunkumar', 'iamarunrajan90@gmail.com', '$2y$10$jp7K1z3aJGuVsA0s/zWZSOYB2/dGFCVdSVK/.8Oet1/MmmW/gHrlq', 'arunkumar', '', 'iamarunrajan', '7601821144', '', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-10-15 10:27:04', '2017-11-16 09:51:49'),
(36, 'arunkumar', 'iamarunrajan940@gmail.com', '$2y$10$W9bLy9LLvkDMlgpM/4LiherjdtgFvG7uojaF1MswIA.DROvIM5qRi', 'arunkumar', '', 'iamarunrajan1', '7601821144', '', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-10-15 10:27:30', '2017-11-16 09:51:49'),
(37, 'arunkumar', 'iamarunrajan940@gmail.com1', '$2y$10$jzdYRv2Zo6.HQURtEfHxj..yuwniIOsSPgnuvRtoavcRqQQtnYG.e', 'arunkumar', '', 'iamarunrajan12', '7601821144', '', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-10-15 10:28:34', '2017-11-16 09:51:49'),
(38, 'shahil', 'usershan@user.com', '$2y$10$Chd/U8GR.J6ltTGEaBZvQ.SQ71FbtJXoQqpiV6st7/ln1ScJWMi9.', 'shahil', '', 'shan_123', '9562012701', '', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-10-16 00:40:15', '2017-11-16 09:51:49'),
(39, 'shahil', 'usershan1@user.com', '$2y$10$4MHK3rXRbiI6bzifmDP21e4KLB9AlpnQSRHckijlAaVGwboHoGYTG', 'shahil', '', 'shan_1234', '9562012701', '', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-10-16 00:50:15', '2017-11-16 09:51:49'),
(40, 'Hemanth Shamanna', 'shemanth@brtindia.com', '', 'Hemanth Shamanna', NULL, NULL, NULL, NULL, NULL, 1, 2, '10215216215106798', NULL, NULL, NULL, NULL, '2017-10-16 11:59:00', '2017-11-16 09:51:49'),
(41, 'Hemanth', 'hemanth@brtindia.com', '$2y$10$vL6fuQzenfCEFDBmV6cTteSpDo.4JOBGCCTrgODjfwxBhGEek2qI2', 'Hemanth', '', 'Heman', '9880765439', '', '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-10-16 12:07:40', '2017-11-16 09:51:49'),
(42, 'Dominic2@ savio', 'michellewoodindustries@gmail.com', '$2y$10$C7PH6bDc0c8dDKoEhNm0ZOjD8ARypCCFJ8UT042d9o5XpAqFfQ0hy', 'Dominic2@ savio', '', 'Michelle wood industries', '9448890570', NULL, '', 1, 2, '', NULL, NULL, NULL, NULL, '2017-11-09 00:37:12', '2017-11-16 09:51:49'),
(43, 'Pramod Kshirsagar', 'chamu4net@gmail.com', '$2y$10$ss2p/JGcvXaf7KgK1GAjv.ckr3ZB3CInfpYA3ZHpl7gTpCA5ls/fy', 'Pramod Kshirsagar', '', 'Chamu', '7775880404', '', '', 1, 2, '', NULL, NULL, 'DdeOhCvAPceQVVj2JOCTPj3c2uZE5PX4EnQWfaICHe9faaxi8zKG0DmJAP4L', NULL, '2017-11-09 04:07:19', '2017-11-20 06:42:47'),
(44, 'Shan', 'shan@gmail.com', '$2y$10$BF5pKuG3UmsR6CPWbDPSnO7/Eee.FnuWz.gkTIV8BFMIpVxR2sRJ.', 'Shan', '', 'Shan', '9562012701', NULL, NULL, 1, 2, '', NULL, NULL, NULL, NULL, '2017-11-09 06:38:46', '2017-11-16 09:51:49'),
(45, 'arunkumar', 'testing201@gmail.com', '$2y$10$ac.n6dziKf4gZZqBzVNxTeY.As5PAL9y7PIUJOuCacd0CkiuS0hQC', 'arunkumar', '', 'arunkumar19901', '9943348711', NULL, NULL, 1, 2, '', NULL, NULL, NULL, NULL, '2017-11-15 05:17:30', '2017-11-16 09:51:49'),
(46, 'Shahil', 'shahilnizzam@gmail.com', '$2y$10$CN8Iid4YJz5d1XATYPBDGuhGj.d5iGj/TRWI9FX13MEjYMycu6/iW', 'Shahil', '', 'Shanil', '9562012701', NULL, NULL, 1, 2, '', NULL, 'acct_1BOkjiBdNcq9uFoA', NULL, NULL, '2017-11-16 04:23:52', '2017-11-16 05:11:59'),
(47, 'Europe', 'europe@gmail.com', '$2y$10$WEA95BoWPgWT71FIkPn.ouR6RPOFoUuPiNoo8BIVg2W87xryLhoKG', 'Europe', '', 'Europe', '9562012701', NULL, NULL, 1, 37, '', NULL, 'acct_1BOn2uHBtrWljPLq', NULL, NULL, '2017-11-16 07:14:43', '2017-11-16 07:52:40'),
(48, 'eropearunkumar', 'arunkumarerope@testing.com', '$2y$10$D55Abdw0twtnuVj9dQuwB.rNmb8Wuxt6TJHuT2TIlEliEA56qBUxK', 'eropearunkumar', '', 'arunerope', '8989898978', NULL, NULL, 1, 37, '', NULL, NULL, NULL, NULL, '2017-11-16 07:16:04', '2017-11-16 07:16:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaints_order_id_foreign` (`order_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `create_invoices`
--
ALTER TABLE `create_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourite_sellers`
--
ALTER TABLE `favourite_sellers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favourites_seller_user_id_foreign` (`user_id`),
  ADD KEY `favourites_seller_seller_id_foreign` (`seller_id`);

--
-- Indexes for table `markers`
--
ALTER TABLE `markers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_otps`
--
ALTER TABLE `password_otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT for table `create_invoices`
--
ALTER TABLE `create_invoices`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `favourite_sellers`
--
ALTER TABLE `favourite_sellers`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `markers`
--
ALTER TABLE `markers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=264;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `password_otps`
--
ALTER TABLE `password_otps`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
