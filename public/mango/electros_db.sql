-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 14, 2024 at 12:48 AM
-- Server version: 10.6.16-MariaDB
-- PHP Version: 8.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electros_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `block` varchar(100) DEFAULT NULL,
  `road` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `building_no` varchar(100) DEFAULT NULL,
  `floor_no` varchar(100) DEFAULT NULL,
  `apartment` varchar(100) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `additional_directions` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `client_id`, `region_id`, `lat`, `long`, `block`, `road`, `street`, `building_no`, `floor_no`, `apartment`, `type`, `additional_directions`, `created_at`, `updated_at`) VALUES
(26, 27, 310, NULL, NULL, 'بوماهر', '216', NULL, '82', '51', '1', 'شقة', NULL, '2024-04-24 04:40:10', '2024-04-24 04:40:10'),
(27, 28, 355, NULL, NULL, '931', '3111', NULL, '386', '0', '0', NULL, NULL, '2024-04-24 17:28:52', '2024-04-24 17:28:52'),
(52, 59, 295, NULL, NULL, 'test', 'test', NULL, 'test', 'test', 'test', 'test', 'test', '2024-05-18 16:16:08', '2024-05-18 16:16:08'),
(69, 59, 330, NULL, NULL, '2', '2', NULL, '3', '3', '3', '3', '3', '2024-06-01 20:08:20', '2024-06-01 20:08:20'),
(70, 59, 330, NULL, NULL, '2', '2', NULL, '3', '3', '3', '3', '3', '2024-06-01 20:08:47', '2024-06-01 20:08:47'),
(71, 59, 318, NULL, NULL, '2', '2', NULL, '22', '2', '2', '2', NULL, '2024-06-01 20:09:44', '2024-06-01 20:09:44'),
(72, 59, 318, NULL, NULL, '2', '2', NULL, '22', '2', '2', '2', NULL, '2024-06-01 20:10:01', '2024-06-01 20:10:01'),
(73, 59, 318, NULL, NULL, '2', '2', NULL, '22', '2', '2', '2', NULL, '2024-06-01 20:10:24', '2024-06-01 20:10:24'),
(74, 59, 318, NULL, NULL, '2', '2', NULL, '3', '3', '3', '3', '3', '2024-06-01 20:12:27', '2024-06-01 20:12:27'),
(75, 59, 318, NULL, NULL, '2', '2', NULL, '3', '3', '3', '3', '3', '2024-06-01 20:12:47', '2024-06-01 20:12:47'),
(76, 59, 473, NULL, NULL, '34', '4', NULL, '5', '5', '4', NULL, NULL, '2024-06-01 20:13:29', '2024-06-01 20:13:29'),
(78, 62, 372, NULL, NULL, '42', '2', NULL, '42', '32', '24', '42', '234', '2024-06-12 17:06:37', '2024-06-12 17:06:37'),
(79, 62, 372, NULL, NULL, '42', '2', NULL, '42', '32', '24', '42', '234', '2024-06-12 17:07:40', '2024-06-12 17:07:40');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `cpr` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `accent` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `email`, `short_name`, `cpr`, `birthdate`, `gender`, `accent`, `image`, `bio`, `status`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '123456', 'admin@gmail.com', 'Admin', NULL, '2024-05-11', 'M', 'Arabic', NULL, NULL, 1, '$2y$10$i4FxPp1bLjRJsF9fonwGie0b2zi5TocinM30uXUiLGYPk3jzKoEqm', 'SJrftyaYrvdrvayg4tzWF5KuAep1aOHKhTkxcCU1jhcsLjXcXZr7HFCfZQwB', '2023-09-14 08:03:32', '2024-05-11 15:29:50'),
(2, 'jassim', '39555152', 'KARAMHHADAD@HOTMAIL.COM', 'JH', NULL, NULL, NULL, NULL, NULL, NULL, 1, '$2y$10$LekQya4UDaSoqlPbjKVo2Ot1QTVoWR74s2yOyLkgv3lzOgaDZJwCC', NULL, '2023-12-23 14:00:09', '2024-06-11 14:21:07'),
(3, 'Mostafa Mohamed', '33467117', 'mostafazarea69@gmail.com', 'Mostafa', NULL, '2024-05-11', 'M', NULL, NULL, NULL, 1, '$2y$10$AGTTyrKqce3AIGoJRoJzauFqHeptHVrbMx5H2crS4IcEalku7Umhe', 'iIxHFCirph505r2K0yVbEBylRXAiXtkvH4G6cabJYrJCyUY1Z4ZGSb3KfOHr', '2024-05-11 15:30:12', '2024-05-11 15:30:12');

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `file`, `link`, `status`, `created_at`, `updated_at`) VALUES
(2, '/uploads/Ads/1700308748_7259.webp', NULL, 1, '2023-06-21 13:21:03', '2023-11-18 11:59:09');

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`id`, `country_id`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, '101', NULL, NULL),
(2, 1, '102', NULL, NULL),
(3, 1, '103', NULL, NULL),
(4, 1, '104', NULL, NULL),
(5, 1, '105', NULL, NULL),
(6, 1, '106', NULL, NULL),
(7, 1, '107', NULL, NULL),
(8, 1, '108', NULL, NULL),
(9, 1, '109', NULL, NULL),
(10, 1, '110', NULL, NULL),
(11, 1, '111', NULL, NULL),
(12, 1, '112', NULL, NULL),
(13, 1, '113', NULL, NULL),
(14, 1, '115', NULL, NULL),
(15, 1, '116', NULL, NULL),
(16, 1, '117', NULL, NULL),
(17, 1, '118', NULL, NULL),
(18, 1, '119', NULL, NULL),
(19, 1, '120', NULL, NULL),
(20, 1, '121', NULL, NULL),
(21, 1, '122', NULL, NULL),
(22, 1, '128', NULL, NULL),
(23, 1, '202', NULL, NULL),
(24, 1, '203', NULL, NULL),
(25, 1, '204', NULL, NULL),
(26, 1, '205', NULL, NULL),
(27, 1, '206', NULL, NULL),
(28, 1, '207', NULL, NULL),
(29, 1, '208', NULL, NULL),
(30, 1, '209', NULL, NULL),
(31, 1, '210', NULL, NULL),
(32, 1, '211', NULL, NULL),
(33, 1, '212', NULL, NULL),
(34, 1, '213', NULL, NULL),
(35, 1, '214', NULL, NULL),
(36, 1, '215', NULL, NULL),
(37, 1, '216', NULL, NULL),
(38, 1, '217', NULL, NULL),
(39, 1, '221', NULL, NULL),
(40, 1, '222', NULL, NULL),
(41, 1, '223', NULL, NULL),
(42, 1, '224', NULL, NULL),
(43, 1, '225', NULL, NULL),
(44, 1, '226', NULL, NULL),
(45, 1, '227', NULL, NULL),
(46, 1, '228', NULL, NULL),
(47, 1, '229', NULL, NULL),
(48, 1, '231', NULL, NULL),
(49, 1, '232', NULL, NULL),
(50, 1, '233', NULL, NULL),
(51, 1, '234', NULL, NULL),
(52, 1, '235', NULL, NULL),
(53, 1, '236', NULL, NULL),
(54, 1, '237', NULL, NULL),
(55, 1, '240', NULL, NULL),
(56, 1, '241', NULL, NULL),
(57, 1, '242', NULL, NULL),
(58, 1, '243', NULL, NULL),
(59, 1, '244', NULL, NULL),
(60, 1, '245', NULL, NULL),
(61, 1, '246', NULL, NULL),
(62, 1, '247', NULL, NULL),
(63, 1, '248', NULL, NULL),
(64, 1, '251', NULL, NULL),
(65, 1, '252', NULL, NULL),
(66, 1, '253', NULL, NULL),
(67, 1, '254', NULL, NULL),
(68, 1, '255', NULL, NULL),
(69, 1, '256', NULL, NULL),
(70, 1, '257', NULL, NULL),
(71, 1, '258', NULL, NULL),
(72, 1, '262', NULL, NULL),
(73, 1, '263', NULL, NULL),
(74, 1, '264', NULL, NULL),
(75, 1, '265', NULL, NULL),
(76, 1, '266', NULL, NULL),
(77, 1, '269', NULL, NULL),
(78, 1, '301', NULL, NULL),
(79, 1, '302', NULL, NULL),
(80, 1, '303', NULL, NULL),
(81, 1, '304', NULL, NULL),
(82, 1, '305', NULL, NULL),
(83, 1, '306', NULL, NULL),
(84, 1, '307', NULL, NULL),
(85, 1, '308', NULL, NULL),
(86, 1, '309', NULL, NULL),
(87, 1, '310', NULL, NULL),
(88, 1, '311', NULL, NULL),
(89, 1, '312', NULL, NULL),
(90, 1, '313', NULL, NULL),
(91, 1, '314', NULL, NULL),
(92, 1, '315', NULL, NULL),
(93, 1, '316', NULL, NULL),
(94, 1, '317', NULL, NULL),
(95, 1, '318', NULL, NULL),
(96, 1, '319', NULL, NULL),
(97, 1, '320', NULL, NULL),
(98, 1, '321', NULL, NULL),
(99, 1, '322', NULL, NULL),
(100, 1, '323', NULL, NULL),
(101, 1, '324', NULL, NULL),
(102, 1, '325', NULL, NULL),
(103, 1, '326', NULL, NULL),
(104, 1, '327', NULL, NULL),
(105, 1, '328', NULL, NULL),
(106, 1, '329', NULL, NULL),
(107, 1, '330', NULL, NULL),
(108, 1, '331', NULL, NULL),
(109, 1, '332', NULL, NULL),
(110, 1, '333', NULL, NULL),
(111, 1, '334', NULL, NULL),
(112, 1, '335', NULL, NULL),
(113, 1, '336', NULL, NULL),
(114, 1, '337', NULL, NULL),
(115, 1, '338', NULL, NULL),
(116, 1, '339', NULL, NULL),
(117, 1, '340', NULL, NULL),
(118, 1, '341', NULL, NULL),
(119, 1, '342', NULL, NULL),
(120, 1, '343', NULL, NULL),
(121, 1, '346', NULL, NULL),
(122, 1, '351', NULL, NULL),
(123, 1, '353', NULL, NULL),
(124, 1, '354', NULL, NULL),
(125, 1, '356', NULL, NULL),
(126, 1, '357', NULL, NULL),
(127, 1, '358', NULL, NULL),
(128, 1, '359', NULL, NULL),
(129, 1, '360', NULL, NULL),
(130, 1, '361', NULL, NULL),
(131, 1, '362', NULL, NULL),
(132, 1, '363', NULL, NULL),
(133, 1, '364', NULL, NULL),
(134, 1, '365', NULL, NULL),
(135, 1, '366', NULL, NULL),
(136, 1, '367', NULL, NULL),
(137, 1, '368', NULL, NULL),
(138, 1, '369', NULL, NULL),
(139, 1, '373', NULL, NULL),
(140, 1, '380', NULL, NULL),
(141, 1, '381', NULL, NULL),
(142, 1, '382', NULL, NULL),
(143, 1, '402', NULL, NULL),
(144, 1, '404', NULL, NULL),
(145, 1, '405', NULL, NULL),
(146, 1, '406', NULL, NULL),
(147, 1, '407', NULL, NULL),
(148, 1, '408', NULL, NULL),
(149, 1, '410', NULL, NULL),
(150, 1, '411', NULL, NULL),
(151, 1, '412', NULL, NULL),
(152, 1, '413', NULL, NULL),
(153, 1, '414', NULL, NULL),
(154, 1, '419', NULL, NULL),
(155, 1, '421', NULL, NULL),
(156, 1, '422', NULL, NULL),
(157, 1, '423', NULL, NULL),
(158, 1, '424', NULL, NULL),
(159, 1, '425', NULL, NULL),
(160, 1, '426', NULL, NULL),
(161, 1, '428', NULL, NULL),
(162, 1, '430', NULL, NULL),
(163, 1, '431', NULL, NULL),
(164, 1, '432', NULL, NULL),
(165, 1, '433', NULL, NULL),
(166, 1, '434', NULL, NULL),
(167, 1, '435', NULL, NULL),
(168, 1, '436', NULL, NULL),
(169, 1, '438', NULL, NULL),
(170, 1, '439', NULL, NULL),
(171, 1, '441', NULL, NULL),
(172, 1, '444', NULL, NULL),
(173, 1, '447', NULL, NULL),
(174, 1, '449', NULL, NULL),
(175, 1, '450', NULL, NULL),
(176, 1, '453', NULL, NULL),
(177, 1, '454', NULL, NULL),
(178, 1, '455', NULL, NULL),
(179, 1, '456', NULL, NULL),
(180, 1, '457', NULL, NULL),
(181, 1, '458', NULL, NULL),
(182, 1, '460', NULL, NULL),
(183, 1, '463', NULL, NULL),
(184, 1, '465', NULL, NULL),
(185, 1, '469', NULL, NULL),
(186, 1, '471', NULL, NULL),
(187, 1, '473', NULL, NULL),
(188, 1, '475', NULL, NULL),
(189, 1, '477', NULL, NULL),
(190, 1, '479', NULL, NULL),
(191, 1, '481', NULL, NULL),
(192, 1, '502', NULL, NULL),
(193, 1, '504', NULL, NULL),
(194, 1, '505', NULL, NULL),
(195, 1, '506', NULL, NULL),
(196, 1, '507', NULL, NULL),
(197, 1, '508', NULL, NULL),
(198, 1, '509', NULL, NULL),
(199, 1, '513', NULL, NULL),
(200, 1, '514', NULL, NULL),
(201, 1, '515', NULL, NULL),
(202, 1, '517', NULL, NULL),
(203, 1, '518', NULL, NULL),
(204, 1, '520', NULL, NULL),
(205, 1, '521', NULL, NULL),
(206, 1, '522', NULL, NULL),
(207, 1, '523', NULL, NULL),
(208, 1, '524', NULL, NULL),
(209, 1, '525', NULL, NULL),
(210, 1, '526', NULL, NULL),
(211, 1, '527', NULL, NULL),
(212, 1, '528', NULL, NULL),
(213, 1, '529', NULL, NULL),
(214, 1, '530', NULL, NULL),
(215, 1, '531', NULL, NULL),
(216, 1, '533', NULL, NULL),
(217, 1, '536', NULL, NULL),
(218, 1, '537', NULL, NULL),
(219, 1, '538', NULL, NULL),
(220, 1, '539', NULL, NULL),
(221, 1, '540', NULL, NULL),
(222, 1, '541', NULL, NULL),
(223, 1, '542', NULL, NULL),
(224, 1, '543', NULL, NULL),
(225, 1, '544', NULL, NULL),
(226, 1, '545', NULL, NULL),
(227, 1, '547', NULL, NULL),
(228, 1, '549', NULL, NULL),
(229, 1, '550', NULL, NULL),
(230, 1, '551', NULL, NULL),
(231, 1, '552', NULL, NULL),
(232, 1, '553', NULL, NULL),
(233, 1, '555', NULL, NULL),
(234, 1, '557', NULL, NULL),
(235, 1, '559', NULL, NULL),
(236, 1, '561', NULL, NULL),
(237, 1, '565', NULL, NULL),
(238, 1, '569', NULL, NULL),
(239, 1, '571', NULL, NULL),
(240, 1, '575', NULL, NULL),
(241, 1, '577', NULL, NULL),
(242, 1, '579', NULL, NULL),
(243, 1, '580', NULL, NULL),
(244, 1, '581', NULL, NULL),
(245, 1, '583', NULL, NULL),
(246, 1, '585', NULL, NULL),
(247, 1, '589', NULL, NULL),
(248, 1, '601', NULL, NULL),
(249, 1, '602', NULL, NULL),
(250, 1, '603', NULL, NULL),
(251, 1, '604', NULL, NULL),
(252, 1, '605', NULL, NULL),
(253, 1, '606', NULL, NULL),
(254, 1, '607', NULL, NULL),
(255, 1, '608', NULL, NULL),
(256, 1, '609', NULL, NULL),
(257, 1, '611', NULL, NULL),
(258, 1, '615', NULL, NULL),
(259, 1, '616', NULL, NULL),
(260, 1, '623', NULL, NULL),
(261, 1, '624', NULL, NULL),
(262, 1, '625', NULL, NULL),
(263, 1, '626', NULL, NULL),
(264, 1, '633', NULL, NULL),
(265, 1, '634', NULL, NULL),
(266, 1, '635', NULL, NULL),
(267, 1, '636', NULL, NULL),
(268, 1, '643', NULL, NULL),
(269, 1, '644', NULL, NULL),
(270, 1, '645', NULL, NULL),
(271, 1, '646', NULL, NULL),
(272, 1, '701', NULL, NULL),
(273, 1, '702', NULL, NULL),
(274, 1, '704', NULL, NULL),
(275, 1, '705', NULL, NULL),
(276, 1, '706', NULL, NULL),
(277, 1, '707', NULL, NULL),
(278, 1, '708', NULL, NULL),
(279, 1, '709', NULL, NULL),
(280, 1, '711', NULL, NULL),
(281, 1, '712', NULL, NULL),
(282, 1, '713', NULL, NULL),
(283, 1, '714', NULL, NULL),
(284, 1, '715', NULL, NULL),
(285, 1, '716', NULL, NULL),
(286, 1, '718', NULL, NULL),
(287, 1, '720', NULL, NULL),
(288, 1, '721', NULL, NULL),
(289, 1, '729', NULL, NULL),
(290, 1, '730', NULL, NULL),
(291, 1, '732', NULL, NULL),
(292, 1, '733', NULL, NULL),
(293, 1, '734', NULL, NULL),
(294, 1, '736', NULL, NULL),
(295, 1, '738', NULL, NULL),
(296, 1, '740', NULL, NULL),
(297, 1, '742', NULL, NULL),
(298, 1, '743', NULL, NULL),
(299, 1, '745', NULL, NULL),
(300, 1, '746', NULL, NULL),
(301, 1, '748', NULL, NULL),
(302, 1, '752', NULL, NULL),
(303, 1, '754', NULL, NULL),
(304, 1, '756', NULL, NULL),
(305, 1, '758', NULL, NULL),
(306, 1, '760', NULL, NULL),
(307, 1, '762', NULL, NULL),
(308, 1, '801', NULL, NULL),
(309, 1, '802', NULL, NULL),
(310, 1, '803', NULL, NULL),
(311, 1, '804', NULL, NULL),
(312, 1, '805', NULL, NULL),
(313, 1, '806', NULL, NULL),
(314, 1, '807', NULL, NULL),
(315, 1, '808', NULL, NULL),
(316, 1, '809', NULL, NULL),
(317, 1, '810', NULL, NULL),
(318, 1, '812', NULL, NULL),
(319, 1, '813', NULL, NULL),
(320, 1, '814', NULL, NULL),
(321, 1, '815', NULL, NULL),
(322, 1, '816', NULL, NULL),
(323, 1, '840', NULL, NULL),
(324, 1, '841', NULL, NULL),
(325, 1, '901', NULL, NULL),
(326, 1, '902', NULL, NULL),
(327, 1, '903', NULL, NULL),
(328, 1, '904', NULL, NULL),
(329, 1, '905', NULL, NULL),
(330, 1, '906', NULL, NULL),
(331, 1, '907', NULL, NULL),
(332, 1, '908', NULL, NULL),
(333, 1, '909', NULL, NULL),
(334, 1, '910', NULL, NULL),
(335, 1, '911', NULL, NULL),
(336, 1, '912', NULL, NULL),
(337, 1, '913', NULL, NULL),
(338, 1, '914', NULL, NULL),
(339, 1, '915', NULL, NULL),
(340, 1, '916', NULL, NULL),
(341, 1, '917', NULL, NULL),
(342, 1, '918', NULL, NULL),
(343, 1, '919', NULL, NULL),
(344, 1, '920', NULL, NULL),
(345, 1, '921', NULL, NULL),
(346, 1, '922', NULL, NULL),
(347, 1, '923', NULL, NULL),
(348, 1, '924', NULL, NULL),
(349, 1, '925', NULL, NULL),
(350, 1, '926', NULL, NULL),
(351, 1, '927', NULL, NULL),
(352, 1, '928', NULL, NULL),
(353, 1, '929', NULL, NULL),
(354, 1, '930', NULL, NULL),
(355, 1, '931', NULL, NULL),
(356, 1, '932', NULL, NULL),
(357, 1, '933', NULL, NULL),
(358, 1, '934', NULL, NULL),
(359, 1, '935', NULL, NULL),
(360, 1, '937', NULL, NULL),
(361, 1, '939', NULL, NULL),
(362, 1, '941', NULL, NULL),
(363, 1, '942', NULL, NULL),
(364, 1, '943', NULL, NULL),
(365, 1, '944', NULL, NULL),
(366, 1, '945', NULL, NULL),
(367, 1, '946', NULL, NULL),
(368, 1, '947', NULL, NULL),
(369, 1, '949', NULL, NULL),
(370, 1, '950', NULL, NULL),
(371, 1, '951', NULL, NULL),
(372, 1, '952', NULL, NULL),
(373, 1, '954', NULL, NULL),
(374, 1, '955', NULL, NULL),
(375, 1, '957', NULL, NULL),
(376, 1, '958', NULL, NULL),
(377, 1, '959', NULL, NULL),
(378, 1, '960', NULL, NULL),
(379, 1, '961', NULL, NULL),
(380, 1, '964', NULL, NULL),
(381, 1, '965', NULL, NULL),
(382, 1, '966', NULL, NULL),
(383, 1, '967', NULL, NULL),
(384, 1, '971', NULL, NULL),
(385, 1, '973', NULL, NULL),
(386, 1, '976', NULL, NULL),
(387, 1, '982', NULL, NULL),
(388, 1, '983', NULL, NULL),
(389, 1, '986', NULL, NULL),
(390, 1, '987', NULL, NULL),
(391, 1, '988', NULL, NULL),
(392, 1, '995', NULL, NULL),
(393, 1, '997', NULL, NULL),
(394, 1, '998', NULL, NULL),
(395, 1, '999', NULL, NULL),
(396, 1, '1001', NULL, NULL),
(397, 1, '1002', NULL, NULL),
(398, 1, '1003', NULL, NULL),
(399, 1, '1004', NULL, NULL),
(400, 1, '1006', NULL, NULL),
(401, 1, '1009', NULL, NULL),
(402, 1, '1010', NULL, NULL),
(403, 1, '1012', NULL, NULL),
(404, 1, '1014', NULL, NULL),
(405, 1, '1016', NULL, NULL),
(406, 1, '1017', NULL, NULL),
(407, 1, '1018', NULL, NULL),
(408, 1, '1019', NULL, NULL),
(409, 1, '1020', NULL, NULL),
(410, 1, '1022', NULL, NULL),
(411, 1, '1025', NULL, NULL),
(412, 1, '1026', NULL, NULL),
(413, 1, '1027', NULL, NULL),
(414, 1, '1028', NULL, NULL),
(415, 1, '1032', NULL, NULL),
(416, 1, '1033', NULL, NULL),
(417, 1, '1034', NULL, NULL),
(418, 1, '1037', NULL, NULL),
(419, 1, '1038', NULL, NULL),
(420, 1, '1041', NULL, NULL),
(421, 1, '1042', NULL, NULL),
(422, 1, '1044', NULL, NULL),
(423, 1, '1046', NULL, NULL),
(424, 1, '1048', NULL, NULL),
(425, 1, '1051', NULL, NULL),
(426, 1, '1052', NULL, NULL),
(427, 1, '1054', NULL, NULL),
(428, 1, '1055', NULL, NULL),
(429, 1, '1056', NULL, NULL),
(430, 1, '1057', NULL, NULL),
(431, 1, '1058', NULL, NULL),
(432, 1, '1061', NULL, NULL),
(433, 1, '1062', NULL, NULL),
(434, 1, '1063', NULL, NULL),
(435, 1, '1064', NULL, NULL),
(436, 1, '1067', NULL, NULL),
(437, 1, '1068', NULL, NULL),
(438, 1, '1070', NULL, NULL),
(439, 1, '1073', NULL, NULL),
(440, 1, '1089', NULL, NULL),
(441, 1, '1095', NULL, NULL),
(442, 1, '1099', NULL, NULL),
(443, 1, '1203', NULL, NULL),
(444, 1, '1204', NULL, NULL),
(445, 1, '1205', NULL, NULL),
(446, 1, '1206', NULL, NULL),
(447, 1, '1207', NULL, NULL),
(448, 1, '1208', NULL, NULL),
(449, 1, '1209', NULL, NULL),
(450, 1, '1210', NULL, NULL),
(451, 1, '1211', NULL, NULL),
(452, 1, '1212', NULL, NULL),
(453, 1, '1213', NULL, NULL),
(454, 1, '1214', NULL, NULL),
(455, 1, '1215', NULL, NULL),
(456, 1, '1216', NULL, NULL),
(457, 1, '1218', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title_ar` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address_ar` text DEFAULT NULL,
  `address_en` text DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL DEFAULT 1,
  `pickup` tinyint(1) NOT NULL DEFAULT 1,
  `dinein` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `country_id`, `title_ar`, `title_en`, `phone`, `whatsapp`, `email`, `address_ar`, `address_en`, `delivery`, `pickup`, `dinein`, `status`, `lat`, `long`, `created_at`, `updated_at`) VALUES
(3, 1, 'فرع 1', 'Branch 1', '97333405497', '97333405497', 'info@emcan-group.com', 'Manama', 'المنامة', 1, 1, 1, 1, '26.0897916', '50.57944579999999', '2023-06-21 10:45:42', '2023-06-21 10:45:42');

-- --------------------------------------------------------

--
-- Table structure for table `branch_category`
--

CREATE TABLE `branch_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branch_category`
--

INSERT INTO `branch_category` (`id`, `branch_id`, `category_id`, `created_at`, `updated_at`) VALUES
(49, 3, 4, NULL, NULL),
(50, 3, 5, NULL, NULL),
(51, 3, 6, NULL, NULL),
(52, 3, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `branch_device`
--

CREATE TABLE `branch_device` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch_region`
--

CREATE TABLE `branch_region` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branch_region`
--

INSERT INTO `branch_region` (`id`, `branch_id`, `region_id`, `created_at`, `updated_at`) VALUES
(1, 3, 295, NULL, NULL),
(2, 3, 296, NULL, NULL),
(3, 3, 297, NULL, NULL),
(4, 3, 298, NULL, NULL),
(5, 3, 299, NULL, NULL),
(6, 3, 300, NULL, NULL),
(7, 3, 301, NULL, NULL),
(8, 3, 302, NULL, NULL),
(9, 3, 303, NULL, NULL),
(10, 3, 304, NULL, NULL),
(11, 3, 305, NULL, NULL),
(12, 3, 306, NULL, NULL),
(13, 3, 307, NULL, NULL),
(14, 3, 308, NULL, NULL),
(15, 3, 309, NULL, NULL),
(16, 3, 310, NULL, NULL),
(17, 3, 311, NULL, NULL),
(18, 3, 312, NULL, NULL),
(19, 3, 313, NULL, NULL),
(20, 3, 314, NULL, NULL),
(21, 3, 315, NULL, NULL),
(22, 3, 316, NULL, NULL),
(23, 3, 317, NULL, NULL),
(24, 3, 318, NULL, NULL),
(25, 3, 319, NULL, NULL),
(26, 3, 320, NULL, NULL),
(27, 3, 321, NULL, NULL),
(28, 3, 322, NULL, NULL),
(29, 3, 323, NULL, NULL),
(30, 3, 324, NULL, NULL),
(31, 3, 325, NULL, NULL),
(32, 3, 326, NULL, NULL),
(33, 3, 327, NULL, NULL),
(34, 3, 328, NULL, NULL),
(35, 3, 329, NULL, NULL),
(36, 3, 330, NULL, NULL),
(37, 3, 331, NULL, NULL),
(38, 3, 332, NULL, NULL),
(39, 3, 333, NULL, NULL),
(40, 3, 334, NULL, NULL),
(41, 3, 335, NULL, NULL),
(42, 3, 336, NULL, NULL),
(43, 3, 337, NULL, NULL),
(44, 3, 338, NULL, NULL),
(45, 3, 339, NULL, NULL),
(46, 3, 340, NULL, NULL),
(47, 3, 341, NULL, NULL),
(48, 3, 342, NULL, NULL),
(49, 3, 343, NULL, NULL),
(50, 3, 344, NULL, NULL),
(51, 3, 345, NULL, NULL),
(52, 3, 346, NULL, NULL),
(53, 3, 347, NULL, NULL),
(54, 3, 348, NULL, NULL),
(55, 3, 349, NULL, NULL),
(56, 3, 350, NULL, NULL),
(57, 3, 351, NULL, NULL),
(58, 3, 352, NULL, NULL),
(59, 3, 353, NULL, NULL),
(60, 3, 354, NULL, NULL),
(61, 3, 355, NULL, NULL),
(62, 3, 356, NULL, NULL),
(63, 3, 357, NULL, NULL),
(64, 3, 358, NULL, NULL),
(65, 3, 359, NULL, NULL),
(66, 3, 360, NULL, NULL),
(67, 3, 361, NULL, NULL),
(68, 3, 362, NULL, NULL),
(69, 3, 363, NULL, NULL),
(70, 3, 364, NULL, NULL),
(71, 3, 365, NULL, NULL),
(72, 3, 366, NULL, NULL),
(73, 3, 367, NULL, NULL),
(74, 3, 368, NULL, NULL),
(75, 3, 369, NULL, NULL),
(76, 3, 370, NULL, NULL),
(77, 3, 371, NULL, NULL),
(78, 3, 372, NULL, NULL),
(79, 3, 373, NULL, NULL),
(80, 3, 374, NULL, NULL),
(81, 3, 375, NULL, NULL),
(82, 3, 376, NULL, NULL),
(83, 3, 377, NULL, NULL),
(84, 3, 378, NULL, NULL),
(85, 3, 379, NULL, NULL),
(86, 3, 380, NULL, NULL),
(87, 3, 381, NULL, NULL),
(88, 3, 382, NULL, NULL),
(89, 3, 383, NULL, NULL),
(90, 3, 467, NULL, NULL),
(91, 3, 468, NULL, NULL),
(92, 3, 469, NULL, NULL),
(93, 3, 470, NULL, NULL),
(94, 3, 471, NULL, NULL),
(95, 3, 472, NULL, NULL),
(96, 3, 473, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `file`, `title_ar`, `title_en`, `status`, `created_at`, `updated_at`) VALUES
(3, '/uploads/Brands/1706532877_5519.svg', 'سامسونج', 'Samsung', 1, '2024-01-29 12:54:37', '2024-01-29 12:54:37'),
(4, '/uploads/Brands/1706532970_7433.svg', 'أبل', 'Apple', 1, '2024-01-29 12:56:10', '2024-01-29 12:56:10'),
(5, '/uploads/Brands/1706533014_3360.svg', 'لينوفو', 'Lenovo', 0, '2024-01-29 12:56:54', '2024-01-29 12:56:54'),
(7, '/uploads/Brands/1717316578_5348.webp', 'بوش', 'BOSCH', 1, '2024-06-02 08:22:58', '2024-06-02 08:25:51'),
(8, '/uploads/Brands/1717331333_7673.webp', 'مايكروسوفت', 'Microsoft', 1, '2024-06-02 12:28:53', '2024-06-02 12:28:53'),
(9, '/uploads/Brands/1717334594_8113.webp', 'ابل', 'Apple', 1, '2024-06-02 13:23:14', '2024-06-02 13:23:14');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `device_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` smallint(6) NOT NULL,
  `office_id` bigint(20) UNSIGNED DEFAULT NULL,
  `protection_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `client_id`, `color_id`, `item_id`, `device_id`, `quantity`, `office_id`, `protection_id`, `created_at`, `updated_at`) VALUES
(215, 833634, 2, 74, 158, 1, NULL, NULL, '2024-06-02 14:36:17', NULL),
(216, 833634, NULL, NULL, 151, 1, NULL, NULL, '2024-06-02 14:53:00', NULL),
(218, 538794, 0, NULL, 172, 1, NULL, NULL, NULL, NULL),
(219, 538794, 0, NULL, 174, 1, NULL, NULL, NULL, NULL),
(235, 901786, 3, 113, 171, 1, NULL, NULL, '2024-06-04 16:38:25', '2024-06-04 16:38:25'),
(236, 901786, NULL, NULL, 172, 1, NULL, NULL, '2024-06-04 16:38:25', NULL),
(240, 402473, 0, NULL, 177, 1, NULL, NULL, NULL, '2024-06-05 09:40:20'),
(242, 214931, 0, NULL, 145, 1, NULL, NULL, NULL, NULL),
(245, 340928, 0, NULL, 170, 1, NULL, NULL, NULL, NULL),
(260, 235908, 2, 74, 158, 1, NULL, NULL, '2024-06-12 10:20:51', '2024-06-12 10:20:51'),
(291, 6, 3, 113, 171, 1, NULL, NULL, '2024-06-12 17:15:24', '2024-06-12 17:15:24'),
(292, 6, NULL, NULL, 172, 1, NULL, NULL, '2024-06-12 17:15:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_type_items`
--

CREATE TABLE `cart_type_items` (
  `id` bigint(20) NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type_item_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `cart_type_items`
--

INSERT INTO `cart_type_items` (`id`, `client_id`, `cart_id`, `type_item_id`, `created_at`, `updated_at`) VALUES
(4, 901786, 235, 2, '2024-06-04 16:38:25', NULL),
(5, 901786, 235, 13, '2024-06-04 16:38:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nav_display` tinyint(1) DEFAULT 0,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `arrangement` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nav_display`, `parent_id`, `title_ar`, `title_en`, `arrangement`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'أجهزة الكمبيوتر', 'Computers', 1, 1, '/uploads/Categories/1696428416_6395.svg', '2023-06-13 07:47:34', '2023-12-24 20:12:55'),
(4, 0, 1, 'أجهزة كمبيوتر 2 في 1', '2-in-1 PCs', 4, 1, NULL, '2023-06-13 07:48:47', '2023-06-13 07:50:40'),
(5, 0, 1, 'لاب توب', 'Laptops', 5, 1, '/uploads/Categories/1702382164_3823.webp', '2023-06-13 07:49:27', '2023-12-12 11:56:04'),
(6, 0, 1, 'شاشة مزدوجة', 'Dual Screen', 6, 1, NULL, '2023-06-13 07:49:38', '2023-06-13 07:50:19'),
(7, 0, 1, 'الكل في واحد', 'All-in-One', 7, 1, NULL, '2023-06-13 07:49:57', '2023-06-13 07:49:57'),
(68, 1, NULL, 'مكنسة كهربائية لاسلكية', 'Cordless vacuum cleaner', 68, 1, '/uploads/Categories/1717419471_7304.webp', '2024-06-02 08:23:51', '2024-06-03 12:57:51'),
(69, 0, 68, 'مكنسة', 'VACUUM', 69, 1, '/uploads/Categories/1717419606_9521.webp', '2024-06-02 08:24:18', '2024-06-03 13:00:06'),
(70, 1, NULL, 'الميكروويف', 'MICROWAVE', 70, 1, '/uploads/Categories/1717419530_6802.webp', '2024-06-02 08:47:55', '2024-06-03 12:58:51'),
(71, 0, 70, 'ميغاواط', 'MW', 71, 1, '/uploads/Categories/1717419588_5297.webp', '2024-06-02 08:48:34', '2024-06-03 12:59:48'),
(72, 1, NULL, 'مكنسة', 'VACUUM', 72, 1, NULL, '2024-06-02 08:49:03', '2024-06-02 08:49:03'),
(74, 1, NULL, 'فرن كومبي', 'COMBI OVEN', 74, 1, NULL, '2024-06-02 08:50:48', '2024-06-02 08:50:48'),
(75, 0, NULL, 'آلة القهوة بي', 'BI COFFEE MACHINE', 75, 1, '/uploads/Categories/1717420196_5225.webp', '2024-06-02 08:52:45', '2024-06-03 13:09:56'),
(76, 0, NULL, 'مدخنة', 'CHIMNEY', 76, 1, NULL, '2024-06-02 08:53:07', '2024-06-02 08:53:07'),
(77, 0, NULL, 'مدخنة تلسكوبية', 'TELISCOPIC CHMNY', 77, 1, NULL, '2024-06-02 08:53:27', '2024-06-02 08:53:27'),
(78, 0, NULL, 'ميكروويف FS', 'FS MICROWAVE', 78, 1, NULL, '2024-06-02 08:54:12', '2024-06-02 08:54:12'),
(79, 0, NULL, 'المرجع الثنائي', 'BI REF', 79, 1, NULL, '2024-06-02 09:08:39', '2024-06-02 09:08:39'),
(80, 0, 79, 'فريزر ثنائي', 'BI FREEZER', 80, 1, '/uploads/Categories/1717420419_3526.webp', '2024-06-02 09:09:35', '2024-06-03 13:13:39'),
(81, 0, NULL, 'زوج الحمام', 'PIGEON PAIR', 81, 1, NULL, '2024-06-02 09:10:27', '2024-06-02 09:10:27'),
(83, 0, 81, 'فريزر عمودي FS', 'FS UPRIGHT FREEZER', 83, 1, NULL, '2024-06-02 09:11:16', '2024-06-02 09:11:16'),
(84, 0, NULL, 'فرن - أساسي', 'OVEN- BASIC', 84, 1, NULL, '2024-06-02 09:12:03', '2024-06-02 09:12:03'),
(85, 0, NULL, 'فرن عالي الجودة', 'OVEN-HIGH END', 85, 1, NULL, '2024-06-02 09:12:49', '2024-06-02 09:12:49'),
(86, 0, 85, 'فرن كهربائي ثنائي', 'BI ELEC OVEN', 86, 1, NULL, '2024-06-02 09:13:38', '2024-06-02 09:13:38'),
(87, 0, NULL, 'درج تدفئة', 'WARMING DRAWER', 87, 1, NULL, '2024-06-02 10:18:11', '2024-06-02 10:18:11'),
(88, 0, 74, 'فرن كهربائي ثنائي', 'BI ELEC OVEN', 88, 1, '/uploads/Categories/1717420151_8525.webp', '2024-06-02 10:27:56', '2024-06-03 13:09:11'),
(89, 0, 76, 'TELISCOPIC CHMNY', 'TELISCOPIC CHMNY', 89, 1, '/uploads/Categories/1717420231_9507.webp', '2024-06-02 10:51:44', '2024-06-03 13:10:31'),
(90, 0, 76, 'مدخنة', 'CHIMNEY', 90, 1, '/uploads/Categories/1717420302_2895.webp', '2024-06-02 11:24:20', '2024-06-03 13:11:42'),
(91, 0, 78, 'ميكروويف FS', 'FS MICROWAVE', 91, 1, '/uploads/Categories/1717420355_7035.webp', '2024-06-02 11:41:29', '2024-06-03 13:12:35'),
(92, 0, 84, 'فرن كهربائي ثنائي', 'BI ELEC OVEN', 92, 1, NULL, '2024-06-02 12:16:14', '2024-06-02 12:16:14'),
(93, 0, 85, 'فرن كهربائي ثنائي', 'BI ELEC OVEN', 93, 1, NULL, '2024-06-02 12:17:20', '2024-06-02 12:17:20'),
(94, 0, NULL, 'ابحث عن جهاز الكمبيوتر الخاص بك التالي', 'Find your next PC', 94, 1, NULL, '2024-06-02 12:29:59', '2024-06-02 12:29:59'),
(96, 0, NULL, 'سطح', 'Surface', 96, 1, NULL, '2024-06-02 12:32:50', '2024-06-02 12:35:42'),
(97, 0, NULL, 'أجهزة الكمبيوتر التي تعمل بنظام Windows', 'Windows PCs', 97, 1, NULL, '2024-06-02 12:33:13', '2024-06-02 12:33:13'),
(99, 0, NULL, 'أجهزة الكمبيوتر المخصصة للألعاب التي تعمل بنظام Windows', 'Windows Gaming PCs', 99, 1, NULL, '2024-06-02 12:33:59', '2024-06-02 12:36:04'),
(100, 0, NULL, 'اكسسورات', 'Accessories', 100, 1, NULL, '2024-06-02 12:34:29', '2024-06-02 12:36:25'),
(101, 0, 96, 'أجهزة الكمبيوتر المحمولة السطحية', 'Surface Laptops', 101, 1, '/uploads/Categories/1717420485_1687.webp', '2024-06-02 12:40:10', '2024-06-03 13:14:45'),
(102, 0, 96, 'أجهزة كمبيوتر سطحية 2 في 1', 'Surface 2-in-1 PCs', 102, 1, '/uploads/Categories/1717420528_4530.webp', '2024-06-02 12:40:26', '2024-06-03 13:15:28'),
(103, 0, 100, 'الملحقات السطحية', 'Surface accessories', 103, 1, '/uploads/Categories/1717420597_7596.webp', '2024-06-02 13:14:17', '2024-06-03 13:16:37'),
(104, 1, NULL, 'ابل', 'apple', 104, 1, '/uploads/Categories/1717334677_9483.webp', '2024-06-02 13:24:37', '2024-06-02 13:24:37'),
(105, 0, 104, 'ماك', 'Mac', 105, 1, '/uploads/Categories/1717401142_8532.webp', '2024-06-02 13:24:59', '2024-06-03 07:52:23'),
(106, 0, 104, 'ايفون', 'iphone', 106, 1, '/uploads/Categories/1717401172_4011.webp', '2024-06-02 13:25:31', '2024-06-03 07:52:53'),
(107, 0, NULL, 'مكنسة', 'VACUUM', 107, 1, NULL, '2024-06-02 13:45:35', '2024-06-02 13:45:35'),
(108, 0, 72, 'مكنسة', 'VACUUM', 108, 1, '/uploads/Categories/1717420100_3846.webp', '2024-06-02 13:46:07', '2024-06-03 13:08:20'),
(110, 0, 104, 'آيباد', 'iPad', 110, 1, '/uploads/Categories/1717401217_6677.webp', '2024-06-03 07:53:37', '2024-06-03 07:53:37'),
(111, 0, 104, 'ساعة آبل', 'Apple Watch', 111, 1, '/uploads/Categories/1717401286_6418.webp', '2024-06-03 07:54:46', '2024-06-03 07:58:50'),
(112, 0, 104, 'أبل فيجن برو', 'Apple Vision Pro', 112, 1, '/uploads/Categories/1717401337_1096.webp', '2024-06-03 07:55:37', '2024-06-03 07:55:37'),
(113, 0, 104, 'ايربودز', 'AirPods', 113, 1, '/uploads/Categories/1717401379_2108.webp', '2024-06-03 07:56:19', '2024-06-03 07:56:19'),
(114, 0, 104, 'ايرتاج', 'AirTag', 114, 1, '/uploads/Categories/1717401427_4439.webp', '2024-06-03 07:57:07', '2024-06-03 07:57:07'),
(115, 0, 104, 'تلفزيون أبل 4K', 'Apple TV 4K', 115, 1, '/uploads/Categories/1717401466_6373.webp', '2024-06-03 07:57:46', '2024-06-03 07:57:46'),
(116, 0, 104, 'هوم بود', 'HomePod', 116, 1, '/uploads/Categories/1717401498_9782.webp', '2024-06-03 07:58:18', '2024-06-03 07:58:18'),
(117, 0, 104, 'اكسسوارات', 'Accessories', 117, 1, '/uploads/Categories/1717401640_7723.webp', '2024-06-03 08:00:40', '2024-06-03 08:00:40'),
(118, 0, 104, 'بطاقة هدايا أبل', 'Apple Gift Card', 118, 1, '/uploads/Categories/1717401676_1125.webp', '2024-06-03 08:01:16', '2024-06-03 08:01:16'),
(119, 0, NULL, 'مايكروسوفت', 'Microsoft', 119, 1, '/uploads/Categories/1717402327_2390.webp', '2024-06-03 08:12:07', '2024-06-03 08:12:07'),
(120, 0, 119, 'ابحث عن جهازك الكمبيوتر الخاص بك التالي', 'Find your next PC', 120, 1, '/uploads/Categories/1717402418_6199.avif', '2024-06-03 08:13:38', '2024-06-03 08:13:38'),
(121, 0, 119, 'أعلى', 'Surface', 121, 1, '/uploads/Categories/1717402499_5273.webp', '2024-06-03 08:14:59', '2024-06-03 08:14:59'),
(122, 0, 119, 'أجهزة الكمبيوتر بنظام ويندوز', 'Windows PCs', 122, 1, '/uploads/Categories/1717402556_3751.avif', '2024-06-03 08:15:56', '2024-06-03 08:15:56'),
(123, 0, 119, 'أجهزة الكمبيوترللألعاب بنظام ويندوز', 'Windows Gaming PCs', 123, 1, '/uploads/Categories/1717402622_5664.avif', '2024-06-03 08:17:02', '2024-06-03 08:17:02'),
(124, 0, 119, 'الاكسسوارات', 'Accessories', 124, 1, '/uploads/Categories/1717402659_9103.webp', '2024-06-03 08:17:39', '2024-06-03 08:17:39');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from` enum('admin','client') NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `seen` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `from`, `admin_id`, `client_id`, `message`, `seen`, `created_at`, `updated_at`) VALUES
(78, 'client', NULL, 59, 'Hello', 1, '2024-05-11 15:44:06', NULL),
(79, 'client', NULL, 59, 'I need Help', 1, '2024-05-11 15:44:12', NULL),
(80, 'admin', 1, 59, 'hi', 1, '2024-05-11 16:01:09', NULL),
(81, 'admin', 1, 59, 'what do u need', 1, '2024-05-11 16:01:16', NULL),
(82, 'client', NULL, 59, 'i cannot make an order', 1, '2024-05-11 16:01:36', NULL),
(83, 'client', NULL, 27, 'HI', 1, '2024-05-15 10:14:50', NULL),
(84, 'admin', 1, 27, 'اين تصل المسجات', 1, '2024-05-18 11:45:44', NULL),
(85, 'client', NULL, 27, 'لا اعلم', 1, '2024-05-18 11:47:12', NULL),
(86, 'client', NULL, 59, 'hi', 1, '2024-05-25 15:29:11', NULL),
(87, 'client', NULL, 59, '32432', 1, '2024-05-25 15:33:15', NULL),
(88, 'client', NULL, 27, 'jjbj', 1, '2024-06-11 14:27:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wallet` decimal(8,3) DEFAULT 0.000,
  `coins` decimal(8,3) DEFAULT 0.000,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `password` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_number` varchar(255) DEFAULT NULL,
  `chat_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `wallet`, `coins`, `name`, `email`, `phone`, `image`, `status`, `password`, `email_verified_at`, `country_id`, `remember_token`, `deleted_at`, `created_at`, `updated_at`, `transaction_number`, `chat_status`) VALUES
(27, 0.000, 0.000, 'owner', 'karamhhadad@hotmail.com', '39555152', '/uploads/Clients/1716120535_4891.webp', 1, '$2y$10$.TFx//Cwv0X3eTsgIeBc6uBcw1XUjMekoUlX4vHnsewjYm/F6HgN.', NULL, 2, NULL, NULL, '2024-04-21 08:02:48', '2024-05-19 12:08:55', NULL, 0),
(28, 0.000, 0.000, 'N KAMAL', 'fullmoon_u@hotmail.com', '39997257', NULL, 1, '$2y$10$bT2XmHDaBtTh1Eamoh7jPuSs5Gbg2npNW9oehRmHixEtQWS24YoP2', NULL, 1, NULL, NULL, '2024-04-24 17:17:14', '2024-04-24 17:17:14', NULL, 1),
(59, 0.000, 20.000, 'Mostafa', 'mostafazarea69@gmail.com', '33467117', '/uploads/Clients/1716891106_2672.webp', 1, '$2y$10$SDAuBmsgJXnREPear/H38..ZdRy37oow01i3oRjVe9frUJ2BBOsvu', NULL, 1, NULL, NULL, '2024-05-11 12:54:44', '2024-05-28 10:11:46', 'chg_TS02A4320241904t6HO1105071', 1),
(62, 0.000, 20.000, 'sallam', 'megypt124@gmail.com', '1551831192', '/uploads/Clients/1716891106_2672.webp', 1, '$2y$10$UWmcb2IeqKZtWxknnti6kuFqqyKMPJyN0vrDBR89pvlPAJRfVlkYe', NULL, 9, NULL, NULL, '2024-05-11 12:54:44', '2024-06-13 07:35:14', 'chg_TS02A4320241904t6HO1105071', 1);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `hexa` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `title_ar`, `title_en`, `hexa`, `status`, `created_at`, `updated_at`) VALUES
(1, 'الحجر الرملي', 'Sandstone', '#b29082', 1, '2023-06-13 08:47:18', '2023-11-11 10:42:46'),
(2, 'رمادي', 'Gray', '#b0b0b0', 1, '2023-06-13 08:47:35', '2023-06-13 08:47:35'),
(3, 'اسود', 'Black', '#000000', 1, '2023-11-11 09:58:52', '2023-11-11 09:58:52');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `phone`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Mostafa Mohamed', '01208601044', 'mostafazarea69@gmail.com', 'Test Contact', 'Test Contact Test Contact', '2023-10-09 15:07:04', '2023-10-09 15:07:04'),
(2, 'koky', '1270563716', 'koky@admin.com', 'electric machines', 'testing it good', '2023-12-12 12:44:15', '2023-12-12 12:44:15'),
(3, NULL, NULL, NULL, NULL, NULL, '2023-12-31 13:24:53', '2023-12-31 13:24:53'),
(4, NULL, NULL, NULL, NULL, NULL, '2023-12-31 13:28:32', '2023-12-31 13:28:32'),
(5, 'amira', '1270563716', 'admin@admin.com', 'test', 'ghhjkjnklkn', '2024-01-15 10:00:54', '2024-01-15 10:00:54'),
(6, NULL, NULL, NULL, NULL, NULL, '2024-01-15 10:00:59', '2024-01-15 10:00:59'),
(7, NULL, NULL, NULL, NULL, NULL, '2024-01-15 10:06:22', '2024-01-15 10:06:22'),
(8, NULL, NULL, NULL, NULL, NULL, '2024-01-15 10:06:43', '2024-01-15 10:06:43'),
(9, 'RobertChest', '81913369586', 'lucido.leinteract@gmail.com', 'Hallo    writing about your   price for reseller', 'Szia, meg akartam tudni az árát.', '2024-01-29 06:29:46', '2024-01-29 06:29:46'),
(10, 'Danielle Simpson', '0472 23 79 82', 'simpsondanielle800@gmail.com', 'Explainer Video for your website?', 'Hi,\r\n\r\nWe\'d like to introduce to you our explainer video service, which we feel can benefit your site electros.online.\r\n\r\nCheck out some of our existing videos here:\r\nhttps://www.youtube.com/watch?v=8S4l8_bgcnc\r\nhttps://www.youtube.com/watch?v=bWz-ELfJVEI\r\nhttps://www.youtube.com/watch?v=Y46aNG-Y3rM\r\nhttps://www.youtube.com/watch?v=hJCFX1AjHKk\r\n\r\nAll of our videos are in a similar animated format as the above examples, and we have voice over artists with US/UK/Australian accents. We can also produce voice overs in languages other than English.\r\n\r\nThey can show a solution to a problem or simply promote one of your products or services. They are concise, can be uploaded to video sites such as YouTube, and can be embedded into your website or featured on landing pages.\r\n\r\nOur prices are as follows depending on video length:\r\nUp to 1 minute = $259\r\n1-2 minutes = $379\r\n2-3 minutes = $489\r\n\r\n*All prices above are in USD and include a full script, voice-over and video.\r\n\r\nIf this is something you would like to discuss further, don\'t hesitate to reply.\r\n\r\nKind Regards,\r\nDanielle', '2024-01-29 12:54:48', '2024-01-29 12:54:48'),
(11, 'Libby Evans', '06-99472016', 'libbyevans461@gmail.com', 'Accelerate Your Instagram Growth: Gain 300-1000 New Followers Monthly', 'Hi there,\r\n\r\nWe run an Instagram growth service, which increases your number of followers both safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 300-1000+ followers per month.\r\n- Real, human followers: People follow you because they are interested in your business or niche.\r\n- Safe: All actions are made manually. We do not use any bots.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you are interested, and have any questions, reply back and we can discuss further.\r\n\r\nKind Regards,\r\nLibby', '2024-01-31 11:39:42', '2024-01-31 11:39:42'),
(12, 'Thomashiels', '87773394451', 'yasen.krasen.13+74638@mail.ru', 'Miieefjief jiwjdwkijdwf iwkdqdjwifehfuwi kwkdwjejeieifw jwioodwijrewhe', 'Ofokfojfief jwlkfeejereghfj iewojfekfjergij wiojewjfewitghuhwrgtjgh ewjhfwqjhdfuewgtuiwe huegfrwgyewgtywegt electros.online', '2024-02-01 03:40:12', '2024-02-01 03:40:12'),
(13, 'Alton Kinslow', '031 439 60 39', 'brandenwilliams1245@gmail.com', 'Question?', 'Hi,\r\n\r\nAre you tired of struggling to generate consistent sales and leads for your business? We understand the challenges of maintaining a steady stream of revenue, which is why we\'re excited to introduce you to a game-changing solution.\r\n\r\nWe specialize in revolutionizing sales processes with our state-of-the-art Automated Digital Funnel Service. Here\'s what sets us apart:\r\n\r\n✨ Custom Product Funnel Design: Say goodbye to generic funnels! We create custom-designed digital product funnels tailored specifically to your brand and target audience, ensuring maximum effectiveness and conversions.\r\n\r\n✨ Hassle-Free Product Creation: Leave the product creation to us! We\'ll not only design your main product but also provide three irresistible bonuses, an upsell, and a downsell product. Sit back and relax while we handle the entire process, delivering top-notch quality that keeps your customers coming back for more.\r\n\r\n✨ Expertly Crafted Copywriting: Our experienced copywriters will create compelling and persuasive copy for your funnel, from attention-grabbing headlines to persuasive sales pages. We\'ll ensure your message resonates with your audience, driving them to take action and make a purchase.\r\n\r\n✨ Seamless Fulfillment Process: We take care of the entire fulfillment process, including fulfillment emails, so you can focus on growing your business. With our efficient and reliable system, your customers will receive their products promptly, ensuring a positive buying experience.\r\n\r\n✨ Amplify Your Reach with Affiliates: Maximize your sales potential by recruiting affiliates. We provide everything you need to recruit affiliates and expand your reach, from affiliate pages to affiliate recruitment emails.\r\n\r\n✨ Drive Targeted Traffic with Facebook Ads: Our service includes high-converting Facebook ads that drive laser-targeted traffic to your funnel, ensuring a steady stream of qualified leads and sales.\r\n\r\n✨ Compelling Video Sales Letter (VSL): A captivating VSL can make all the difference in converting leads into paying customers. Our team will create a high-converting VSL that showcases the value of your products and compels viewers to take action.\r\n\r\nDon\'t miss out on the opportunity to experience sales on autopilot! Let us handle the heavy lifting while you enjoy the benefits of a well-oiled sales machine.', '2024-02-03 03:10:18', '2024-02-03 03:10:18'),
(14, 'MasonChest', '84578724243', 'kaenquirynicholls@gmail.com', 'Hallo  i am wrote about your   price for reseller', 'Sawubona, bengifuna ukwazi intengo yakho.', '2024-02-04 18:25:15', '2024-02-04 18:25:15'),
(15, 'RobertChest', '86645769179', 'lucido.leinteract@gmail.com', 'Hello    write about     price for reseller', 'Hi, ego volo scire vestri pretium.', '2024-02-05 04:11:06', '2024-02-05 04:11:06'),
(16, 'Martha Mansell', '72 732 87 30', 'martha.mansell@gmail.com', 'Dear electros.online Webmaster!', 'You saw this message and I can send your message to millions of sites just like this. It\'s amazing and affordable.For more information, please email me or skype me below.\r\n\r\nP. Stewart\r\nEmail: xqzg96@gomail2.xyz\r\nSkype: live:.cid.2bc4ed65aa40fb3b', '2024-02-06 02:45:18', '2024-02-06 02:45:18'),
(17, 'RobertChest', '89229398427', 'lucido.leinteract@gmail.com', 'Aloha,   writing about your   price for reseller', 'Γεια σου, ήθελα να μάθω την τιμή σας.', '2024-02-07 20:06:31', '2024-02-07 20:06:31'),
(18, 'Charlotte Chapman', '0430-4393419', 'charlottechapman035@gmail.com', 'Looking for new customers? We have 6 solutions for electros.online', 'Hi,\r\n\r\nI noticed your website, electros.online, and thought you might be interested in some solutions to help you attract more visitors, generate leads, and boost your sales.\r\n\r\nWe offer a range of services specifically designed for website owners like you, including:\r\n\r\n1. Compelling video creation: Explain your product/service effectively and engage your audience on your website and social media. \r\n2. Targeted social media management (Youtube, Twitter and Instagram): Grow your social media presence and reach more potential customers on the platforms that matter most.\r\n3. Reach 50+ million people: Targeted outreach & promotion for electros.online\r\n4. Strong backlinks & SEO boost: Guest post on 4,000+ relevant sites for electros.online\r\n5. 13M+ B2B leads: Find your perfect customers in key markets - Australia, UK, USA, Canada, Belgium and Germany. \r\n6. Web design, SEO & Wordpress management.\r\n\r\nIf any of the above are of interest, hit \'reply\' and we can give you more information.\r\n\r\nIf you have no interest, just ignore this and delete.\r\n\r\nKind Regards,\r\nCharlotte', '2024-02-09 09:45:28', '2024-02-09 09:45:28'),
(19, 'Georgina Haynes', '06-15755035', 'georginahaynes620@gmail.com', 'Explainer Video for electros.online?', 'Hi,\r\n\r\nWe\'d like to introduce to you our explainer video service, which we feel can benefit your site electros.online.\r\n\r\nCheck out some of our existing videos here:\r\nhttps://www.youtube.com/watch?v=bWz-ELfJVEI\r\nhttps://www.youtube.com/watch?v=Y46aNG-Y3rM\r\nhttps://www.youtube.com/watch?v=hJCFX1AjHKk\r\n\r\nOur prices start from as little as $195 and include a professional script and voice-over.\r\n\r\nIf this is something you would like to discuss further, don\'t hesitate to reply.\r\n\r\nKind Regards,\r\nGeorgina', '2024-02-11 19:47:39', '2024-02-11 19:47:39'),
(20, 'Sabrina', '139-306-71-39', 'kCWubD.tqbpqwc@chiffon.fun', 'Novalee Shaffer', 'Novalee Shaffer', '2024-02-13 08:52:45', '2024-02-13 08:52:45'),
(21, 'RaymondNep', '82866851186', 'no.reply.GeorgeRouxson@gmail.com', 'Do you want an inexpensive and inventive advertising solution?', 'Hi-ya! electros.online \r\n \r\nDid you know that it is possible to send business proposal wholly legitimately? We offer a new method of sending commercial offers via feedback forms. \r\nAs Communication Forms are seen as important, messages sent through them are unlikely to be marked as spam. \r\nTrу out our service without paying a dіme! \r\nWe can transmit a maximum of 50,000 messages for you. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis message was automatically generated. \r\nPlease use the contact details below to get in touch with us. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:feedbackform2019 \r\nWhatsApp  +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\n \r\nWe only use chat for communication.', '2024-02-14 00:05:15', '2024-02-14 00:05:15'),
(22, 'ArutDuath', '84746515252', 'belencobham1910@ambulmail.com', '1xbet программа', 'Матч из 7 партий.  Результаты LIVE Результаты Статистика.   \r\n[url=https://1xbet-top.org/slots?products=%5b746%5d]промокод на бесплатную ставку 1xbet[/url] \r\n[url=https://1xbГЄt.com/slots?products=%5b644%5d]1xbet зеркало сегодня сейчас 1xbet1010 com[/url] \r\n[url=https://1xbet-top.org/allgamesentrance/battlecity]играть на деньги 1хбет игровые автоматы[/url] \r\n[url=https://1xbet-com.org/allgamesentrance/bura]1xbet номер телефона[/url] \r\n[url=https://1xbet-com.org/slots?products=%5b949%5d]1xbet com сегодня 1xbet com зеркало[/url]', '2024-02-16 19:55:05', '2024-02-16 19:55:05'),
(23, 'MasonChest', '83432565533', 'kaenquirynicholls@gmail.com', 'Hallo, i am writing about   the price', 'Zdravo, htio sam znati vašu cijenu.', '2024-02-23 11:15:15', '2024-02-23 11:15:15'),
(24, 'RobertChest', '87182811756', 'lucido.leinteract@gmail.com', 'Hello, i wrote about     price for reseller', 'Salut, ech wollt Äre Präis wëssen.', '2024-02-26 09:37:31', '2024-02-26 09:37:31'),
(25, 'LarryPoiny', '88214511252', 'arryLog@gmail.com', 'Hello, Sporthappy', 'Hello from Sporthappy.', '2024-02-29 10:13:02', '2024-02-29 10:13:02'),
(26, 'NataDIZ', '87453555127', 'woodthighgire1988@gmail.com', 'Hello Admin!', 'Hey, I\'m bored! My contacts: https://lovevoyager.page.link/EwdR', '2024-03-01 15:25:00', '2024-03-01 15:25:00'),
(27, 'LarryPoiny', '83368654319', 'arryLog@gmail.com', 'Hello, Sporthappy', 'Hello from Sporthappy.', '2024-03-02 01:48:22', '2024-03-02 01:48:22'),
(28, '3D_dmOl', '89397775888', 'quofreephminspi1976@bushka345.store', '3D Printers', 'Maximize Your Productivity with a 3D Printer \r\ncheap 3d printer [url=http://3d-ruyter53.ru/]http://3d-ruyter53.ru/[/url] .', '2024-03-05 02:15:56', '2024-03-05 02:15:56'),
(29, 'NorrisRub', '82341178632', 'jssormsby@yahoo.com', 'Money Explosion: $80,000,000 Available—Withdrawal Urgently Required!', 'Big Bucks! Withdraw Your $80,000,000 Today! https://zoominvest.fr/redirect?url=https%3A%2F%2F9mlnnnst.blogspot.com%3F8543 \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nl0uf7x5d0j0y2n4m \r\nr1ri9y0s7v1y5c4l \r\ni1if9q0n5z8i3n4i', '2024-03-05 03:29:24', '2024-03-05 03:29:24'),
(30, 'NorrisRub', '86278628991', 'jssormsby@yahoo.com', 'Money Explosion: $80,000,000 Available—Withdrawal Urgently Required!', 'Big Bucks! Withdraw Your $80,000,000 Today! https://zoominvest.fr/redirect?url=https%3A%2F%2F9mlnnnst.blogspot.com%3F8543 \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nl0uf7x5d0j0y2n4m \r\nr1ri9y0s7v1y5c4l \r\ni1if9q0n5z8i3n4i', '2024-03-05 03:29:24', '2024-03-05 03:29:24'),
(31, 'NorrisRub', '81177187412', 'jssormsby@yahoo.com', 'Money Explosion: $80,000,000 Available—Withdrawal Urgently Required!', 'Big Bucks! Withdraw Your $80,000,000 Today! https://zoominvest.fr/redirect?url=https%3A%2F%2F9mlnnnst.blogspot.com%3F8543 \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nl0uf7x5d0j0y2n4m \r\nr1ri9y0s7v1y5c4l \r\ni1if9q0n5z8i3n4i', '2024-03-05 03:29:25', '2024-03-05 03:29:25'),
(32, 'NorrisRub', '82629353348', 'jssormsby@yahoo.com', 'Money Explosion: $80,000,000 Available—Withdrawal Urgently Required!', 'Big Bucks! Withdraw Your $80,000,000 Today! https://zoominvest.fr/redirect?url=https%3A%2F%2F9mlnnnst.blogspot.com%3F8543 \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nl0uf7x5d0j0y2n4m \r\nr1ri9y0s7v1y5c4l \r\ni1if9q0n5z8i3n4i', '2024-03-05 03:29:25', '2024-03-05 03:29:25'),
(33, 'NorrisRub', '85353943374', 'jssormsby@yahoo.com', 'Money Explosion: $80,000,000 Available—Withdrawal Urgently Required!', 'Big Bucks! Withdraw Your $80,000,000 Today! https://zoominvest.fr/redirect?url=https%3A%2F%2F9mlnnnst.blogspot.com%3F8543 \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nl0uf7x5d0j0y2n4m \r\nr1ri9y0s7v1y5c4l \r\ni1if9q0n5z8i3n4i', '2024-03-05 03:29:26', '2024-03-05 03:29:26'),
(34, 'Yara', '292-495-39-64', 'VkRKuR.hdmbqjd@rushlight.cfd', 'Calvin Zimmerman', 'Calvin Zimmerman', '2024-03-08 04:59:15', '2024-03-08 04:59:15'),
(35, 'Ernestram', '84849215396', 'michaeladams1270868@gmail.com', NULL, NULL, '2024-03-08 08:19:46', '2024-03-08 08:19:46'),
(36, 'MarryPoiny', '87534456497', 'marryLog@gmail.com', 'Hello, Sporthappy', 'Hello from Sporthappy.', '2024-03-11 09:52:38', '2024-03-11 09:52:38'),
(37, 'Aleida Windsor', '815-828-9207', 'windsor.aleida@gmail.com', 'Find the best leads for electros.online', 'Hi!\r\n\r\nIt is with sad regret to inform you that LeadsFly is shutting down!\r\n\r\nWe have made available all our consumer and business leads for the entire world on our way out.\r\n\r\nWe have the following available worldwide:\r\n\r\nConsumer Records: 294,582,351\r\nBusiness Records: 25,215,278\r\n\r\nVisit us here: https://leadsfly.biz/electros.online/\r\n\r\nBest regards,\r\nAleida', '2024-03-11 20:04:33', '2024-03-11 20:04:33'),
(38, 'Libby Evans', '0512-2664487', 'libbyevans461@gmail.com', 'Get Noticed on Instagram: Gain 300-1000 New Followers Each Month', 'Hi there,\r\n\r\nWe run an Instagram growth service, which increases your number of followers both safely and practically. \r\n\r\n- We guarantee to gain you 300-1000+ followers per month.\r\n- People follow you because they are interested in you, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nLibby', '2024-03-12 13:55:35', '2024-03-12 13:55:35'),
(39, 'Emily Jones', NULL, 'emilyjones2250@gmail.com', 'Youtube and Instagram Growth Service', 'Hi there,\r\n\r\nWe run a Youtube  growth service, where we can increase your subscriber count safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 700-1500 new subscribers each month.\r\n- Real, human subscribers who subscribe because they are interested in your channel/videos.\r\n- Safe: All actions are done, without using any automated tasks / bots.\r\n\r\nOur price is just $60 (USD) per month and we can start immediately.\r\n\r\nWe also grow Instagram followers (300-1000 for $60).\r\n\r\nGet in touch if you would like to know more.\r\n\r\nKind Regards,\r\nEmily', '2024-03-13 22:02:07', '2024-03-13 22:02:07'),
(40, 'RobertChest', '89139364646', 'lucido.leinteract@gmail.com', 'Hi  i writing about   the prices', 'Xin chào, tôi muốn biết giá của bạn.', '2024-03-14 00:06:52', '2024-03-14 00:06:52'),
(41, 'Pillstof', '83227384784', 'iunskiygipertonik@gmail.com', 'Cialis, Viagra, Levitra - Trial ED Packb buy, discount!', 'TruePills, No prescription needed, Buy pills without restrictions. Money Back Guaranteed 30-day refunds. \r\n \r\nTrial ED Pack consists of the following ED drugs: \r\nViagra Active Ingredient: Sildenafil 100mg 5 pills \r\nCialis 20mg 5 pills \r\nLevitra 20mg 5 pills \r\n \r\nhttps://cutt.ly/7wC5m1Id \r\nhttps://perevodvsem.ru/proxy.php?link=https://true-pill.top/\r\nhttp://prof-mebel.com/bitrix/redirect.php?goto=https://true-pill.top/\r\nhttps://ula-web.ru/bitrix/redirect.php?event1=click_to_call&event2=&event3=&goto=https://true-pill.top/\r\nhttps://cross-sport.pro:443/bitrix/redirect.php?event1=click_to_call&event2=&event3=&goto=https://true-pill.top/\r\nhttp://demo.vieclamcantho.vn/baohiemthatnghiep/redirect.aspx?sms=90bb20bb20tbb20thc3%b4ng&link=https://true-pill.top/\r\n \r\n \r\nOrganosol\r\nDumocycline\r\nHidroxiurea\r\nDisal\r\nNifedigel\r\nRazolager\r\nPrednisolone\r\nBisocard\r\nBaligluc\r\nFlusal\r\nLowpston\r\nAlsartan\r\nSaurat\r\nAlicante\r\nGlucar\r\nCaberlin\r\nEnadigal\r\nExter\r\nFulcinex\r\nSotalex\r\nTerbinafina\r\nMenesit\r\nDoxlin\r\nIsotic salmicol\r\nBotamycin-n\r\nRoxidene\r\nAlozur\r\nCarmetic\r\nRopitor\r\nWellbutrin SR\r\nProponol\r\nAmlodipinum\r\nZosert\r\nFluval\r\nMozoc\r\nLacine\r\nCompro\r\nZinnat\r\nPreclot\r\nInteban', '2024-03-15 07:29:44', '2024-03-15 07:29:44'),
(42, 'tanza', '834-653-71-71', 'hcdhwjcqt.qh@monochord.xyz', 'tanza 2a3', 'tanza 2a3', '2024-03-16 15:23:15', '2024-03-16 15:23:15'),
(43, 'Mike Thorndike', '85144532623', 'mikeShapode@gmail.com', 'FREE fast ranks for electros.online', 'Hi there \r\n \r\nJust checked your electros.online baclink profile, I noticed a moderate percentage of toxic links pointing to your website \r\n \r\nWe will investigate each link for its toxicity and perform a professional clean up for you free of charge. \r\n \r\nStart recovering your ranks today: \r\nhttps://www.hilkom-digital.de/professional-linksprofile-clean-up-service/ \r\n \r\nRegards \r\nMike Thorndike\r\nHilkom Digital SEO Experts \r\nhttps://www.hilkom-digital.de/', '2024-03-21 16:31:11', '2024-03-21 16:31:11'),
(44, 'uarda', '769-851-11-19', 'wbwdqcbhm.qh@monochord.xyz', 'uarda stea', 'uarda stea', '2024-03-22 15:24:37', '2024-03-22 15:24:37'),
(45, 'EmmettIdiom', '85426446822', 'usuckgus@gmail.com', 'URGENTLY! IMMEDIATE WITHDRAWAL: CLAIM YOUR $50,000 PRIZE NOW', 'YOU\'VE EARNED! Don\'t Miss Your Chance: Withdraw Your $50,000 Winnings http://fundwithdrawal-3562.jumbo22.click/online \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nc7qb3q2g9p3h0s4g \r\ng2cp0e7a0r0v9l3f \r\nr6hf7n3d9k1w2c7i', '2024-03-24 08:09:03', '2024-03-24 08:09:03'),
(46, 'EmmettIdiom', '84352547795', 'usuckgus@gmail.com', 'URGENTLY! IMMEDIATE WITHDRAWAL: CLAIM YOUR $50,000 PRIZE NOW', 'YOU\'VE EARNED! Don\'t Miss Your Chance: Withdraw Your $50,000 Winnings http://fundwithdrawal-3562.jumbo22.click/online \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nc7qb3q2g9p3h0s4g \r\ng2cp0e7a0r0v9l3f \r\nr6hf7n3d9k1w2c7i', '2024-03-24 08:09:04', '2024-03-24 08:09:04'),
(47, 'EmmettIdiom', '84417969239', 'usuckgus@gmail.com', 'URGENTLY! IMMEDIATE WITHDRAWAL: CLAIM YOUR $50,000 PRIZE NOW', 'YOU\'VE EARNED! Don\'t Miss Your Chance: Withdraw Your $50,000 Winnings http://fundwithdrawal-3562.jumbo22.click/online \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nc7qb3q2g9p3h0s4g \r\ng2cp0e7a0r0v9l3f \r\nr6hf7n3d9k1w2c7i', '2024-03-24 08:09:04', '2024-03-24 08:09:04'),
(48, 'EmmettIdiom', '87122796661', 'usuckgus@gmail.com', 'URGENTLY! IMMEDIATE WITHDRAWAL: CLAIM YOUR $50,000 PRIZE NOW', 'YOU\'VE EARNED! Don\'t Miss Your Chance: Withdraw Your $50,000 Winnings http://fundwithdrawal-3562.jumbo22.click/online \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nc7qb3q2g9p3h0s4g \r\ng2cp0e7a0r0v9l3f \r\nr6hf7n3d9k1w2c7i', '2024-03-24 08:09:05', '2024-03-24 08:09:05'),
(49, 'EmmettIdiom', '82331742151', 'usuckgus@gmail.com', 'URGENTLY! IMMEDIATE WITHDRAWAL: CLAIM YOUR $50,000 PRIZE NOW', 'YOU\'VE EARNED! Don\'t Miss Your Chance: Withdraw Your $50,000 Winnings http://fundwithdrawal-3562.jumbo22.click/online \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nc7qb3q2g9p3h0s4g \r\ng2cp0e7a0r0v9l3f \r\nr6hf7n3d9k1w2c7i', '2024-03-24 08:09:05', '2024-03-24 08:09:05'),
(50, 'toke', '643-604-74-88', 'qqbbdwddwp.qh@monochord.xyz', 'toke doria', 'toke doria', '2024-03-25 08:30:33', '2024-03-25 08:30:33'),
(51, 'James Durward', '83248329154', 'jamesdurward@emailcheka.com', 'Corporate Investment Partner', 'Greetings From Mr. James, \r\n \r\nI trust this message finds you well? We are an Investment Company offering Corporate and Personal Investment Funding at 4.5% Interest Rate for a duration of 5 to 10 Years depending on the kind of your project. \r\n \r\nWe also pay a 1% commission to brokers, who introduce project owners for finance or other opportunities. \r\n \r\nPlease get back to me if you are interested in more details via email:- jamesdurwardconsultant@gmail.com \r\n \r\nKind regards \r\n \r\nJames Durward \r\nFinance Partner \r\njamesdurwardconsultant@gmail.com', '2024-03-27 00:56:37', '2024-03-27 00:56:37'),
(52, 'Mike Mansfield', '88925669735', 'peterNula@gmail.com', 'Whitehat SEO for electros.online', 'Hi \r\n \r\nI have just checked  electros.online for its SEO metrics and saw that your website could use an upgrade. \r\n \r\nWe will increase your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\n \r\nRegards \r\nMike Mansfield\r\n \r\nDigital X SEO Experts', '2024-03-27 22:22:59', '2024-03-27 22:22:59'),
(53, 'MasonChest', '83928656334', 'kaenquirynicholls@gmail.com', 'Aloha    writing about your the price', 'Sveiki, es gribēju zināt savu cenu.', '2024-03-27 22:36:41', '2024-03-27 22:36:41'),
(54, 'Aria', '120-945-40-04', 'Jlotvy.thttpq@bakling.click', 'Arleth Hines', 'Arleth Hines', '2024-03-29 11:21:12', '2024-03-29 11:21:12'),
(55, 'Kye', '335-633-91-19', 'dmVtWn.qjpccwj@bakling.click', 'Arabella Burns', 'Arabella Burns', '2024-04-01 07:14:27', '2024-04-01 07:14:27'),
(56, 'Georgina Haynes', '7801314603', 'georginahaynes620@gmail.com', 'Explainer Video for electros.online', 'Hi,\r\n\r\nWe\'d like to introduce to you our explainer video service, which we feel can benefit your site electros.online.\r\n\r\nCheck out some of our existing videos here:\r\nhttps://www.youtube.com/watch?v=8S4l8_bgcnc\r\nhttps://www.youtube.com/watch?v=bWz-ELfJVEI\r\nhttps://www.youtube.com/watch?v=Y46aNG-Y3rM\r\nhttps://www.youtube.com/watch?v=hJCFX1AjHKk\r\n\r\nAll of our videos are in a similar animated format as the above examples, and we have voice over artists with US/UK/Australian accents. We can also produce voice overs in languages other than English.\r\n\r\nThey can show a solution to a problem or simply promote one of your products or services. They are concise, can be uploaded to video sites such as YouTube, and can be embedded into your website or featured on landing pages.\r\n\r\nOur prices are as follows depending on video length:\r\nUp to 1 minute = $259\r\n1-2 minutes = $379\r\n2-3 minutes = $489\r\n\r\n*All prices above are in USD and include a full script, voice-over and video.\r\n\r\nIf this is something you would like to discuss further, don\'t hesitate to reply.\r\n\r\nKind Regards,\r\nGeorgina', '2024-04-02 00:57:01', '2024-04-02 00:57:01'),
(57, 'Mike Longman', '88632818924', 'mikeBerpromb@gmail.com', 'Domain Authority of your electros.online', 'Hi there, \r\n \r\nI have reviewed your domain in MOZ and have observed that you may benefit from an increase in authority. \r\n \r\nOur solution guarantees you a high-quality domain authority score within a period of three months. This will increase your organic visibility and strengthen your website authority, thus making it stronger against Google updates. \r\n \r\nCheck out our deals for more details. \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\nNEW: Ahrefs Domain Rating \r\nhttps://www.monkeydigital.co/ahrefs-seo/ \r\n \r\n \r\nThanks and regards \r\nMike Longman', '2024-04-02 02:01:51', '2024-04-02 02:01:51'),
(58, 'Mike Creighton', '82525371984', 'mikeAttems@gmail.com', 'Collaboration request', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.monkeydigital.org/affiliate-dashboard/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Creighton\r\n \r\nMonkey Digital', '2024-04-04 06:51:53', '2024-04-04 06:51:53'),
(59, 'Mike Anderson', '88849952498', 'mikePa@gmail.com', 'NEW: Semrush Backlinks', 'Hello \r\n \r\nThis is Mike Anderson\r\n \r\nLet me show you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your electros.online SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nCheap and effective \r\n \r\nTry it anytime soon \r\n \r\nRegards \r\nMike Anderson\r\n \r\nmike@strictlydigital.net', '2024-04-05 15:46:38', '2024-04-05 15:46:38'),
(60, 'Emily Jones', '6194340455', 'emilyjones2250@gmail.com', 'YouTube Promotion: 700-1500 new subscribers each month', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically. \r\n\r\n- We guarantee to gain you 700+ new subscribers per month.\r\n- People subscribe because they are interested in your videos/channel, increasing video likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you\'d like to see some of our previous work, let me know, and we can discuss it further.\r\n\r\nKind Regards,\r\nEmily', '2024-04-07 16:38:24', '2024-04-07 16:38:24'),
(61, 'Philip Norman', '88118329141', 'philipnorman777@yahoo.com', 'USD172million Mutual Investment Funds', 'Greetings \r\nI hope this mail finds you well. I am Mr. Philip Norman a private Funds Manager for high-net-worth individuals. \r\n \r\nI hold a mandate from a Russian Client who wants his funds reinvested using 3rd party due to the current sanctions against Russians, which means all aspect of this transaction will remain confidential, we will discuss details of investment including investing in your company if it’s for expansion only. \r\n \r\nPlease note that there is no risk involved as funds are legal and currently in a Bank without encumbrances, all details will be available as soon as you indicate interest by contacting me via the email or phone number bellow to discuss this opportunity in more detail. \r\n \r\nSincerely, \r\n \r\nMr. Philip Norman \r\nEmail:philipnorman30@gmail.com', '2024-04-09 05:04:54', '2024-04-09 05:04:54'),
(62, 'RobertChest', '84328797817', 'lucido.leinteract@gmail.com', 'Hello  i am write about     prices', 'Xin chào, tôi muốn biết giá của bạn.', '2024-04-12 01:36:14', '2024-04-12 01:36:14'),
(63, 'Mike Page', '85441281851', 'mikescofsSperidiop@gmail.com', 'Increase sales for your local business', 'This service is perfect for boosting your local business\' visibility on the map in a specific location. \r\n \r\nWe provide Google Maps listing management, optimization, and promotion services that cover everything needed to rank in the Google 3-Pack. \r\n \r\nMore info: \r\nhttps://www.speed-seo.net/ranking-in-the-maps-means-sales/ \r\n \r\n \r\nThanks and Regards \r\nMike Page\r\n \r\n \r\nPS: Want a ONE-TIME comprehensive local plan that covers everything? \r\nhttps://www.speed-seo.net/product/local-seo-bundle/', '2024-04-12 08:49:36', '2024-04-12 08:49:36'),
(64, NULL, NULL, NULL, NULL, NULL, '2024-04-23 12:48:58', '2024-04-23 12:48:58'),
(65, 'Jonathan Madrigal', '2082857891', 'madrigal.jonathan@gmail.com', '������ Limited Time Offer: Claim Your Infinite Hosting Now! ������', 'Hey there,\r\n\r\nTired of monthly fees for electros.online hosting and storage? Imagine paying once for seamless hosting. ������\r\n\r\nIntroducing INFINITE HUB….. \r\n\r\n⇒Ready to secure your spot in Infinite Hub? Click here now! ������\r\n\r\n=>> https://infinite-hub-hosting.blogspot.com/\r\n\r\nDon\'t forget to claim your 30% discount using coupon code \"INFINITE\" before it expires. ������\r\n\r\nInfinite Hub isn\'t just another hosting solution. It\'s a robust platform offering lightning-fast servers, minimal downtime, and everything you need for your hosting requirements. ������\r\n\r\nSwitching to Infinite Hub means:\r\n\r\n������ Fast and reliable hosting for individuals and businesses  \r\n������ Pay one small fee for lifetime high-speed hosting  \r\n������️ Access to a customizable cloud hosting platform with 1-click installation apps  \r\n������ Built-in website builder for effortless website creation  \r\n������ 100% safety with SSL-encrypted connections  \r\n������ Complete access to your websites and files with 99.999% uptime  \r\n⚖️ Zero-risk hosting with a one-time payment for lifetime access  \r\n\r\nPlus, with our 24/7 customer support, you can maximize your lifetime earnings worry-free. ������\r\n\r\n⇒Grab your spot with instantaneous special bonuses for free..\r\n\r\n=>> https://infinite-hub-hosting.blogspot.com/\r\n\r\nSnatch a 30% discount with coupon code \"INFINITE\" before it\'s too late.\r\n\r\nAnd that\'s not all! During our special launch period, purchasing Infinite Hub unlocks these incredible bonuses at no extra cost:\r\n\r\n������ Bonus#1: Infinite Hub Apps Version - Create unlimited mobile apps for iOS & Android with our brand new 1-click cloud-based mobile app builder!  \r\n������ Bonus#2: Infinite Hub Puzzle Version - Generate passive income by publishing puzzle books on Amazon KPD with our 1-click app.  \r\n������ Bonus#3: Infinite Hub StockHub - Access the world\'s largest collection of stock images, videos, vectors, GIFs, animations, memes, and audios, along with an inbuilt image & video editor.  \r\n������ Bonus#4: Infinite Hub CB Site Version - Drive free buyer traffic and effortlessly create ClickBank money sites loaded with pre-made articles!  \r\n������ Bonus#5: Infinite Hub Jobsite Version - Build beginner-friendly, profitable job search sites in just 90 seconds, with two income streams!  \r\n\r\nBut wait, there\'s more! We\'ve also curated some amazing free bonuses to complement your Infinite Hub purchase:\r\n\r\n������ Content Syndication  \r\n������ Evergreen Lead Business  \r\n������ Virtual Networking Success  \r\n������ The Insiders Guide To Niche Research  \r\n������ Instant Conversion Mastery  \r\n������ Doubling Your Sales  \r\n������ Viral Marketing  \r\n������ 365 Power Sales Methods  \r\n������ Social Media Genius  \r\n������ Ensuring Product Quality  \r\n\r\nExclusive Bonuses:(Full Funnel)\r\n\r\n1. ������ Free Membership: Join Exclusive Facebook Group for Personal Support!\r\n2. ������ Live Training: Learn Six-Figure Business Secrets in Secret Live Sessions!\r\n3. ������ Exile Profit: Discover How to Make $33 with Every Image Upload!\r\n4. ������ Kingpin: Drive Laser-Targeted Traffic with Bridge & Landing Page Builder!\r\n5. ������ VERVE: Unlock the $8 BILLION LinkedIn Loophole - Earn $500/hour with a Done-For-You System!\r\n6. ������ NFT Finder: Discover and Sell Profitable NFTs in Minutes with 1-Click App!\r\n7. ������ Thumbnail Creator: Design Magnetic Thumbnails for All Platforms in 3 Clicks with AI!\r\n8. ������ Ai Lead Gen: Unlimited Email Marketing for Life with ChatGPT Autoresponder!\r\n9. ������ AI CB profitz: Generate Free Traffic & ClickBank Money Sites with ChatGPT!\r\n10. ������ GoogAi: Instant AI Answers & Creations with Google\'s Latest AI Tech!\r\n\r\nAnd don\'t forget, when you grab Infinite Hub, you\'ll receive two free OTOs:\r\n\r\n������ Free OTOs with Your Purchase! ������  \r\nOTO4 - Infinite Traffic  \r\nOTO5 - Profit Niche  \r\n\r\nSnatch a 30% discount with coupon code \"INFINITE\" before it\'s too late.\r\n\r\n⇒Don\'t wait any longer—secure your spot and claim your free bonuses today!\r\n\r\n=>> https://infinite-hub-hosting.blogspot.com/\r\n\r\nDon’t wait, Grab it before it ends…\r\n\r\nTo your success,  \r\n[Jonathan Madrigal]', '2024-05-24 22:08:16', '2024-05-24 22:08:16'),
(66, 'Manual Using', '821569017', 'manual.using@msn.com', 'Boost Your Website\'s Performance with Expert On-Page SEO Optimization!', 'Dear Electros,\r\n\r\nAre you looking to enhance your website\'s visibility and drive more traffic? Our agency specializes in comprehensive on-page SEO optimization services tailored for WordPress, Shopify, Wix, and Squarespace platforms. With our expertise, we can help your website rank higher in search results and attract the audience you deserve.\r\n\r\n=>> https://weareseosupremacy.blogspot.com/\r\n\r\n### Why Choose Our On-Page SEO Services?\r\n\r\n1. Customized Strategies: We develop SEO strategies specifically tailored to your website\'s platform and industry.\r\n2. Technical Excellence: Our team ensures that all technical aspects of your site, from meta tags to internal linking, are fully optimized.\r\n3. Content Optimization: We enhance your website\'s content with targeted keywords, ensuring it meets search engine guidelines.\r\n4. Performance Tracking: We provide detailed reports on your website\'s performance and the impact of our optimization efforts.\r\n\r\n=>> https://weareseosupremacy.blogspot.com/\r\n\r\n### What We Offer\r\n\r\n- Keyword Research: Identifying the best keywords to target for your niche.\r\n- Meta Tag Optimization: Crafting compelling meta titles and descriptions.\r\n- Content Enhancement: Improving the quality and relevance of your content.\r\n- Technical SEO: Addressing site speed, mobile-friendliness, and other technical factors.\r\n- Internal Linking: Structuring your site for optimal crawlability and user experience...\r\n\r\n=>> https://weareseosupremacy.blogspot.com/\r\n\r\n### Platforms We Specialize In\r\n\r\n- WordPress: Tailored SEO solutions for your WordPress site.\r\n- Shopify: Boost your online store\'s visibility and sales.\r\n- Wix: Enhance your Wix website\'s search engine ranking.\r\n- Squarespace: Optimize your Squarespace site for better traffic and engagement.\r\n\r\n### Let’s Elevate Your Online Presence!\r\n\r\nPartner with us to transform your website into a powerful marketing tool. Our proven SEO strategies will help you achieve higher search rankings, increased traffic, and more conversions.\r\n\r\nReady to get started? Contact us today to learn more about our on-page SEO optimization services and how we can help your business grow.\r\n\r\nBest regards,\r\n\r\n[Manual Using]', '2024-05-27 16:56:20', '2024-05-27 16:56:20');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `currancy_code_ar` varchar(255) DEFAULT NULL,
  `currancy_code_en` varchar(255) DEFAULT NULL,
  `currancy_value` decimal(8,3) NOT NULL DEFAULT 0.000,
  `phone_code` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `length` int(11) NOT NULL DEFAULT 10,
  `decimals` int(11) NOT NULL DEFAULT 3,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `title_ar`, `title_en`, `currancy_code_ar`, `currancy_code_en`, `currancy_value`, `phone_code`, `country_code`, `length`, `decimals`, `lat`, `long`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 'البحرين', 'Bahrain', 'دينار بحريني', 'BD', 1.000, '+973', 'BH', 8, 3, '25.93041400', '50.63777200', 1, '/countries/Bahrain.png', '2022-10-09 07:52:15', '2023-09-14 07:27:31'),
(2, 'المملكة العربية السعودية', 'Saudi Arabia', 'ريال سعودي', 'SR', 10.000, '+966', 'SA', 9, 2, '23.88594200', '45.07916200', 1, '/countries/SaudiArabia.png', '2022-10-09 07:52:15', '2023-09-14 07:24:01'),
(3, 'سلطنة عمان', 'Oman', 'ريال عماني', 'OR', 1.020, '+968', 'OM', 8, 3, '21.51258300', '55.92325500', 1, '/countries/Oman.png', '2022-10-09 07:52:15', '2023-12-12 10:09:56'),
(4, 'الإمارات العربية المتحدة', 'United Arab Emirates', 'درهم إماراتي', 'AED', 10.000, '+971', 'AE', 9, 3, '23.42407600', '53.84781800', 1, '/countries/UnitedArabEmirates.png', '2022-10-09 07:52:15', '2023-09-14 07:26:13'),
(5, 'قطر', 'Qatar', 'ريال قطري', 'QR', 10.000, '+974', 'QA', 8, 3, '25.35482600', '51.18388400', 1, '/countries/Qatar.png', '2022-10-09 07:52:15', '2023-09-14 07:26:37'),
(6, 'الكويت', 'Kuwait', 'دينار كويتي', 'KWD', 0.810, '+965', 'KW', 8, 3, '29.31166000', '47.48176600', 1, '/countries/Kuwait.png', '2022-10-09 07:52:15', '2023-09-14 07:26:52'),
(7, 'الولايات المتحدة', 'United States', 'دولار امريكي', 'USD', 2.650, '+1', 'US', 10, 2, '37.0902', '95.7129', 1, '/countries/US.png', '2022-10-09 07:52:15', '2023-12-12 10:08:54'),
(9, 'مصر', 'Egypt', 'جنيه مصري', 'EG', 2.650, '+20', 'EG', 10, 2, '37.0902', '95.7129', 0, '/countries/eg.png', '2022-10-09 07:52:15', '2023-12-12 10:08:54');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `discount_amount` double(8,2) NOT NULL,
  `valid_from` datetime NOT NULL,
  `valid_to` datetime NOT NULL,
  `max_uses` int(11) NOT NULL,
  `status` enum('active','inactive','pending') NOT NULL DEFAULT 'pending',
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `description`, `discount_amount`, `valid_from`, `valid_to`, `max_uses`, `status`, `client_id`, `created_at`, `updated_at`) VALUES
(11, 'test coupon', '<p>test coupon 2024</p>', 40.00, '2024-05-18 20:40:00', '2024-06-14 20:40:00', 1, 'pending', 28, '2024-05-18 17:41:07', '2024-06-12 07:49:41'),
(13, 'Mostafa10', 'Code Mostafa10 Is 10 % discount', 10.00, '2024-05-23 14:42:00', '2024-06-29 16:42:00', 20, 'active', 59, '2024-05-28 10:43:15', '2024-05-28 11:11:07'),
(14, 'Eid-Adha', 'eid discount 15%', 15.00, '2024-06-11 10:27:00', '2024-06-21 10:27:00', 10, 'active', 59, '2024-06-12 07:28:30', '2024-06-12 07:42:16'),
(15, 'Ramadan10', '<p>كوبون خصم رمضان 1 دينار</p>', 1.00, '2024-05-18 21:02:00', '2024-06-15 21:02:00', 10, 'inactive', 59, '2024-06-12 07:28:30', '2024-06-12 07:28:30');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `title_ar`, `title_en`, `status`, `created_at`, `updated_at`) VALUES
(1, 'توصيل إلى المنزل', 'Delivery', 1, '2023-06-21 10:22:30', '2023-06-21 10:22:30'),
(2, 'إستلام من  المحل', 'Pick Up', 1, '2023-06-21 10:22:37', '2023-06-21 10:22:37');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `new_arrival` tinyint(1) NOT NULL DEFAULT 0,
  `most_selling` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `title_ar` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `short_desc_ar` longtext DEFAULT NULL,
  `short_desc_en` longtext DEFAULT NULL,
  `long_desc_ar` longtext DEFAULT NULL,
  `long_desc_en` longtext DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `build_device` tinyint(1) NOT NULL DEFAULT 0,
  `price` decimal(8,3) DEFAULT 0.000,
  `quantity` int(11) DEFAULT 0,
  `discount_value` int(11) DEFAULT 0,
  `discount_from` timestamp NULL DEFAULT NULL,
  `discount_to` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `brand_id`, `status`, `new_arrival`, `most_selling`, `featured`, `title_ar`, `title_en`, `short_desc_ar`, `short_desc_en`, `long_desc_ar`, `long_desc_en`, `header`, `build_device`, `price`, `quantity`, `discount_value`, `discount_from`, `discount_to`, `created_at`, `updated_at`) VALUES
(113, 7, 1, 0, 0, 0, 'BBS611GB مكنسة كهربائية لاسلكية', 'Cordless vacuum cleaner BBS611GB', '\"مكنسة كهربائية قابلة لإعادة الشحن، سلسلة غير محدودة | 6، لون أزرق، المحرك: محرك BLDC، متضمن × 2 بطارية قابلة لإعادة الشحن، وقت التشغيل: 30 دقيقة، وقت الشحن (بطارية واحدة): 4 ساعات\r\nالملحقات: فوهة شق قصيرة\"', 'Rechargeable Vacuum cleaner, Unlimited Serie | 6, Blue color, Motor : BLDC Motor, Included x2 rechargeable batteries, Runtime : 30 mins, Charging time (1 battery) : 4 hrs\r\nAccessories : Short crevice nozzle', '\"مكنسة كهربائية قابلة لإعادة الشحن، سلسلة غير محدودة | 6، لون أزرق، المحرك: محرك BLDC، متضمن × 2 بطارية قابلة لإعادة الشحن، وقت التشغيل: 30 دقيقة، وقت الشحن (بطارية واحدة): 4 ساعات\r\nالملحقات: فوهة شق قصيرة\"', 'Rechargeable Vacuum cleaner, Unlimited Serie | 6, Blue color, Motor : BLDC Motor, Included x2 rechargeable batteries, Runtime : 30 mins, Charging time (1 battery) : 4 hrs\r\nAccessories : Short crevice nozzle', '/uploads/Devices/1717317217_6646.webp', 0, 450.000, 10000, NULL, NULL, NULL, '2024-06-02 08:31:15', '2024-06-02 08:33:37'),
(114, 7, 1, 0, 0, 0, 'مكنسة كهربائية لاسلكية BCS71PETGB', 'Cordless vacuum cleaner BCS71PETGB', 'مكنسة كهربائية قابلة للشحن', '\"Rechargeable Vacuum cleaner', '\"مكنسة كهربائية قابلة لإعادة الشحن، سلسلة غير محدودة | 7، لون أحمر، المحرك: محرك BLDC TurboSpin، FlexTube، حامل سريع، متضمن × 1 بطاريات قابلة لإعادة الشحن، وقت التشغيل: 30 دقيقة، وقت الشحن (بطارية واحدة): 4 ساعات\r\nالملحقات: فوهة شقوق طويلة ومرنة، وفرشاة أثاث 2 في 1 وفوهة تنجيد، وفوهة طاقة صغيرة من ProAnimal: فوهة مزودة بمحرك إضافي لالتقاط شعر الحيوانات الأليفة والألياف الموجودة على مواد التنجيد.', '\"Rechargeable Vacuum cleaner, Unlimited Serie | 7, Red color, Motor : BLDC TurboSpin Motor,  FlexTube, QuickStand,  Included x1 rechargeable batteries, Runtime : 30 mins, Charging time (1 battery) : 4 hrs\r\nAccessories : Long flexible crevice nozzle, 2in1 furniture brush & upholstery nozzle, ProAnimal mini power nozzle: extra motorized nozzle to pick up pet hair and fibres on upholstery.\"', '/uploads/Devices/1717317969_4145.webp', 0, 124.000, 10000, NULL, NULL, NULL, '2024-06-02 08:37:49', '2024-06-02 08:46:09'),
(115, NULL, 1, 0, 0, 0, 'مكنسة كهربائية لاسلكية BCS712GB', 'Cordless vacuum cleaner BCS712GB', 'مكنسة كهربائية قابلة للشحن', 'Rechargeable Vacuum cleaner', 'مكنسة كهربائية قابلة للشحن، سلسلة غير محدودة | 7، اللون الأبيض، المحرك: محرك BLDC TurboSpin، FlexTube، QuickStand، متضمن × 2 بطاريات قابلة لإعادة الشحن، وقت التشغيل: 30 دقيقة، شاحن سريع، وقت الشحن السريع (بطارية واحدة): 72 دقيقة، الملحقات: فوهة شق، شاحن، شاحن سريع، 2 × حزمة بطارية قابلة للتبديل، محطة إرساء، فرشاة أثاث 2 في 1 وفوهة تنجيد، فوهة شقوق طويلة مرنة', 'Rechargeable Vacuum cleaner, Unlimited Serie | 7, White color, Motor : BLDC TurboSpin Motor, FlexTube, QuickStand,  Included x2 rechargeable batteries, Runtime : 30 mins, Quick Charger, Fast Charging time (1 battery) : 72 mins,                                                                       Accessories:  crevice nozzle, charger, quick charger, 2 x exchangeable battery pack, docking station, 2in1 furniture brush & upholstery nozzle, Long flexible crevice nozzle', '/uploads/Devices/1717335607_8105.webp', 0, 369.000, 10000, NULL, NULL, NULL, '2024-06-02 09:18:43', '2024-06-02 13:40:08'),
(116, 7, 1, 0, 0, 0, 'الميكروويفBEL554MS0M', 'MICROWAVE BEL554MS0M', '\"ميكروويف مع وظيفة الشواية / 25 لتر، 900 واط كحد أقصى\r\nمؤقت رقمي مع شاشة LED بيضاء، 8 برامج طهي أوتوماتيكية\r\nشاشة تحكم باللمس، باب إلكتروني مفتوح\"', '\"Microwave with Grill function / 25 Lt.,900 W max. Power\r\nDigital timer with White LED display, 8 Automatic cooking programs\r\nTouch control display, Electronic door open\"', 'ميكروويف مع وظيفة الشواية', 'Microwave with Grill function', '/uploads/Devices/1717337404_5426.webp', 0, 174.000, 10000, NULL, NULL, NULL, '2024-06-02 09:22:47', '2024-06-02 14:10:04'),
(117, 7, 1, 0, 0, 0, 'ميكروويف BEL634GS1M', 'MICROWAVE BEL634GS1M', 'فرن ميكروويف بوش مدمج بشواية', 'Microwave Oven Built In With Grill', 'فرن ميكروويف بوش مدمج بشواية، أسود، 21 لتر (BEL634GS1M)', 'BOSCH Microwave Oven Built In With Grill Black 21L (BEL634GS1M)', '/uploads/Devices/1717320558_5889.webp', 0, 464.000, 10000, NULL, NULL, NULL, '2024-06-02 09:27:24', '2024-06-02 09:29:18'),
(118, 7, 1, 0, 0, 0, 'ميكروويف BEL653MS3M', 'MICROWAVE BEL653MS3M', 'ميكروويف، سلسلة', 'Microwave, Serie | 2, Built-In MW appliance', 'ميكروويف، سلسلة | 2، جهاز MW مدمج، 59 × 38 AutoPilot 8، شاشة LED باللون الأحمر، الفولاذ المقاوم للصدأ، زر فتح الباب، 800 وات، غشاء + أدوات تحكم في المقبض، تشغيل سريع،', 'Microwave, Serie | 2, Built-In MW appliance, 59 x 38 AutoPilot 8, LED display in red, Stainless steel, button door opening, 800W, Membrane + knob controls, Quickstart,', '/uploads/Devices/1717335671_8586.webp', 0, 495.000, 10000, NULL, NULL, NULL, '2024-06-02 09:52:41', '2024-06-02 13:41:11'),
(119, 7, 1, 0, 0, 0, 'ميكروويف BEL7321B1M', 'MICROWAVE BEL7321B1M', 'ميكروويف، سلسلة | 8، جهاز MW لتر', 'Microwave, Serie | 8, Built-in,', 'ميكروويف، سلسلة | 8، MW مدمج مع شواية، 900، 1990، مؤقت، ساعة، عدد مستويات الطاقة:، 5، 382 × 594 × 318، ميكروويف، شواية كوارتز متغيرة، المنزل، التنظيف الحفاز، توصيل المنزل،', 'Microwave, Serie | 8, Built-in, MW appliance with grill, 900, 1990, Timer, Clock, Number of Power Levels:, 5, 382 x 594 x 318, Microwave, Variable quartz grill, Home ,Catalytic Cleaning, Home Connect, Autopilot, Stainless Steel Interior, digital control ring, 21L Volume', '/uploads/Devices/1717335730_1954.webp', 0, 186.000, 10000, NULL, NULL, NULL, '2024-06-02 09:56:57', '2024-06-02 13:42:10'),
(120, 7, 1, 0, 0, 0, 'ميكروويف BFL524MS0M', 'MICROWAVE BFL524MS0M', 'ميكروويف، سلسلة | 6، جهاز MW', 'Microwave, Serie | 6, Built-in MW appliance, 60 x 38cm  AutoPilot 8, LED display in red, Stainless steel, button door opening, 800W, Membrane + knob controls, tripple distribution turntable, electronic door display', 'ميكروويف، سلسلة | 6، جهاز MW مدمج، الطيار الآلي 60 × 38 سم 8، شاشة LED باللون الأحمر، الفولاذ المقاوم للصدأ، زر فتح الباب، 800 وات، غشاء + أدوات تحكم في المقبض، قرص دوار للتوزيع الثلاثي، شاشة باب إلكترونية', 'Microwave, Serie | 6, Built-in MW appliance', '/uploads/Devices/1717337442_3577.webp', 0, 145.000, 10000, NULL, NULL, NULL, '2024-06-02 10:06:11', '2024-06-02 14:10:42'),
(121, 7, 1, 0, 0, 0, 'مكنسةBGC21X3GB', 'VACUUMBGC21X3GB', 'مكنسة كهربائية - 800 واط', 'Vacuum cleaner  - 800W -', 'مكنسة كهربائية - 800 واط - بدون كيس، تقنية Power AirCycle مع ترشيح مزدوج، نظام سهل التنظيف، ضمان المحرك لمدة 10 سنوات', 'Vacuum cleaner - 800W - Bagless, Power AirCycle Technology with Double Filtration, Easy clean system, 10 years motor guarantee', '/uploads/Devices/1717335897_3040.webp', 0, 466.000, 10000, NULL, NULL, NULL, '2024-06-02 10:09:10', '2024-06-02 13:44:58'),
(122, 7, 1, 0, 0, 0, 'مكنسةBGL38BA3GB', 'VACUUMBGL38BA3GB', 'مكنسة كهربائية مع كيس', 'Bagged Vacuum cleaner', '\"مكنسة كهربائية مع كيس، سلسلة 4، محرك ECO 850 واط، سعة الغبار: 4 لتر، الترشيح: HEPA H 13.\r\nالملحقات المتضمنة: 1 × فوهة شق، 1 × فوهة تنجيد، 1 × فوهة عالمية، 1 × فوهة توربو، 1 × مشبك أنبوب ملحق\r\nصنع في ألمانيا، ضمان المحرك 10 سنوات\"', '\"Bagged Vacuum cleaner, Serie 4, ECO 850W motor, Dust capacity : 4 L, Filteration : HEPA H 13.\r\nIncluded Accessories :  1 x crevice nozzle, 1 x upholstery nozzle, 1 x universal nozzle, 1 x turbo nozzle, 1 x Accessory tube clip\r\nMade in Germany, 10 year Motor Warranty\"', '/uploads/Devices/1717336037_2983.webp', 0, 193.000, 10000, NULL, NULL, NULL, '2024-06-02 10:13:47', '2024-06-02 13:47:18'),
(123, 7, 1, 0, 0, 0, 'مكنسةBGLS4822GB', 'VACUUMBGLS4822GB', 'مكنسة بوش الكهربائية CP كيس برتقالي 2200 واط (BGLS4822GB)', 'BOSCH Vacuum Cleaner CP Bag Orange 2200W (BGLS4822GB)', 'مكنسة بوش الكهربائية CP كيس برتقالي 2200 واط (BGLS4822GB)', 'BOSCH Vacuum Cleaner CP Bag Orange 2200W (BGLS4822GB)', '/uploads/Devices/1717336122_1037.webp', 0, 269.000, 10000, NULL, NULL, NULL, '2024-06-02 10:17:13', '2024-06-02 13:48:42'),
(124, 7, 1, 0, 0, 0, 'درج تدفئةBIC630NS1M', 'WARMING DRAWERBIC630NS1M', 'بوش سخان كهربائي مدمج 14 سم أسود (BIC630NS1M)', 'BOSCH Warmer Built In Electric Black 14CM (BIC630NS1M)', 'بوش سخان كهربائي مدمج 14 سم أسود (BIC630NS1M)', 'BOSCH Warmer Built In Electric Black 14CM (BIC630NS1M)', '/uploads/Devices/1717336248_2767.webp', 0, 265.000, 10000, NULL, NULL, NULL, '2024-06-02 10:20:40', '2024-06-02 13:50:48'),
(125, 7, 1, 0, 0, 0, 'درج تدفئةBIC7101B1B', 'WARMING DRAWERBIC7101B1B', 'درج تدفئة مع اتصال منزلي.', 'Warming Drawer with Home Connect', 'درج تدفئة مع اتصال منزلي، وآلية دفع وسحب، وتسخين مسبق، ولوحة تسخين سهلة التنظيف.', 'Warming Drawer with Home Connect, Push-Pull Mechanism, Preheat, Easy to Clean hotplate.', '/uploads/Devices/1717336314_1095.webp', 0, 420.000, 10000, NULL, NULL, NULL, '2024-06-02 10:23:18', '2024-06-02 13:51:54'),
(126, 7, 1, 0, 0, 0, 'فرن كهربائي ثنائيCMG633BS1M', 'BI ELEC OVENCMG633BS1M', 'بوش سخان كهربائي مدمج 14 سم أسود (BIC630NS1M)', 'BOSCH Warmer Built In Electric Black 14CM (BIC630NS1M)', 'بوش سخان كهربائي مدمج 14 سم أسود (BIC630NS1M)', 'BOSCH Warmer Built In Electric Black 14CM (BIC630NS1M)', '/uploads/Devices/1717338924_7510.webp', 0, 404.000, 10000, NULL, NULL, NULL, '2024-06-02 10:28:06', '2024-06-02 14:35:25'),
(127, 7, 1, 0, 0, 0, 'فرن كهربائي ثنائيCMG7241B1M', 'BI ELEC OVENCMG7241B1M', 'سلسلة | 8,16', 'Serie | 8,16', 'سلسلة | 8,16 وضع تسخين، هواء ساخن ثنائي الأبعاد، شاشة TFT، شواء كامل العرض، شواء نصف عرض، شواء بالهواء الساخن، هواء ساخن صديق للبيئة، ميكروويف (900 واط)، تسخين مسبق، تنظيف مائي، 455 × 594 × 548، تصنيف الاتصال (W): 3600، مؤقت، ساعة، Home Connect، 2D Hotair، Airfry، Hotair Gentle، شاشة TFT', 'Serie | 8,16 heating modes, 2D hot air, TFT display, Full width broil, Half width broil, Hot air broiling, Hot Air-Eco, Microwave (900W), pre-heating, Hydrolytic cleaning, 455 x 594 x 548, Connection Rating (W): 3600, Timer, Clock, Home Connect, 2D Hotair, Airfry,  Hotair Gentle, TFT Display', '/uploads/Devices/1717337513_9309.webp', 0, 261.000, 10000, NULL, NULL, NULL, '2024-06-02 10:40:25', '2024-06-02 14:11:53'),
(128, 7, 1, 0, 0, 0, 'مدخنة تلسكوبيةDFT63CA50M', 'TELISCOPIC DFT63CA50M', 'SER2، (DxW:) 280 مم × 600 مم نوع الإضاءة - نوع المصابيح: LED 4 وات E14، بحد أقصى. معدل الاستخراج: 300 MQH، الضوضاء، الحد الأقصى. السرعة في الاستخدام العادي: 62 ديسيبل', 'SER2, (DxW:) 280 mm x 600 mm illumin type - kind of lamps: LED 4W E14, Max. extraction rate: 300 MQH, Noise, max. speed in normal use:62 dB', 'SER2، (DxW:) 280 مم × 600 مم نوع الإضاءة - نوع المصابيح: LED 4 وات E14، بحد أقصى. معدل الاستخراج: 300 MQH، الضوضاء، الحد الأقصى. السرعة في الاستخدام العادي: 62 ديسيبل', 'SER2, (DxW:) 280 mm x 600 mm illumin type - kind of lamps: LED 4W E14, Max. extraction rate: 300 MQH, Noise, max. speed in normal use:62 dB', '/uploads/Devices/1717337550_2675.webp', 0, 392.000, 10000, NULL, NULL, NULL, '2024-06-02 10:45:20', '2024-06-02 14:12:30'),
(129, 7, 1, 0, 0, 0, 'مدخنة تلسكوبيةDFT93CA50M', 'TELISCOPIC CHMNYDFT93CA50M', 'SER2، (DxW:) 280 مم × 900 مم نوع الإضاءة - نوع المصابيح: LED 4 وات E14، بحد أقصى. معدل الاستخراج: 300 MQH، الضوضاء، الحد الأقصى. السرعة في الاستخدام العادي: 62 ديسيبل', 'SER2, (DxW:) 280 mm x 900 mm illumin type - kind of lamps: LED 4W E14, Max. extraction rate: 300 MQH, Noise, max. speed in normal use:62 dB', 'SER2، (DxW:) 280 مم × 900 مم نوع الإضاءة - نوع المصابيح: LED 4 وات E14، بحد أقصى. معدل الاستخراج: 300 MQH، الضوضاء، الحد الأقصى. السرعة في الاستخدام العادي: 62 ديسيبل', 'SER2, (DxW:) 280 mm x 900 mm illumin type - kind of lamps: LED 4W E14, Max. extraction rate: 300 MQH, Noise, max. speed in normal use:62 dB', '/uploads/Devices/1717337585_3137.webp', 0, 277.000, 10000, NULL, NULL, NULL, '2024-06-02 10:58:19', '2024-06-02 14:13:05'),
(130, 7, 1, 0, 0, 0, 'مدخنةDHU665CGB', 'CHIMNEYDHU665CGB', 'سلسلة | 4', 'Serie | 4, Built-under hoods, Maximum output air extraction (m3/h):, H2260, push-button, 3, Sound power at max. speed (2010/30/EC): 68, WxDxH: 600x482x550', 'سلسلة | 4، أغطية مدمجة، أقصى استخلاص للهواء (م3/ساعة):، H2260، زر ضغط، 3، قوة الصوت بحد أقصى. السرعة (2010/30/EC): 68، العرض × العمق × الارتفاع: 600 × 482 × 550', 'Serie | 4, Built-under hoods, Maximum output air extraction (m3/h):, H2260, push-button, 3, Sound power at max. speed (2010/30/EC): 68, WxDxH: 600x482x550', '/uploads/Devices/1717337632_8922.webp', 0, 107.000, 10000, NULL, NULL, NULL, '2024-06-02 11:02:46', '2024-06-02 14:13:52'),
(131, 7, 1, 0, 0, 0, 'مدخنةDHU965CGB', 'CHIMNEYDHU965CGB', 'سلسلة | 4', 'Serie | 4, Built-under hoods, Maximum output air extraction (m3/h):, H2260, push-button, 3, Sound power at max. speed (2010/30/EC): 68, WxDxH: 600x482x550', 'سلسلة | 4، أغطية مدمجة، أقصى استخلاص للهواء (م3/ساعة):، H2260، زر ضغط، 3، قوة الصوت بحد أقصى. السرعة (2010/30/EC): 68، العرض × العمق × الارتفاع: 600 × 482 × 550', 'Serie | 4, Built-under hoods, Maximum output air extraction (m3/h):, H2260, push-button, 3, Sound power at max. speed (2010/30/EC): 68, WxDxH: 600x482x550', '/uploads/Devices/1717337657_6392.webp', 0, 407.000, 10000, NULL, NULL, NULL, '2024-06-02 11:03:43', '2024-06-02 14:14:17'),
(132, 7, 1, 0, 0, 0, 'مدخنةDIB97IM50M', 'CHIMNEYDIB97IM50M', 'سلسلة | 4', 'Serie | 4', 'سلسلة | 4، غطاء جزيرة، الحد الأقصى لإخراج الهواء (م3/ساعة): 430، إضاءة LED، تحكم باللمس، (العرض × العمق): 900 × 600', 'Serie | 4, Island hood, Maximum output air extraction (M3/h): 430, LED lighting, touch control, (WxD):900 x 600', '/uploads/Devices/1717337690_8040.webp', 0, 413.000, 10000, NULL, NULL, NULL, '2024-06-02 11:05:36', '2024-06-02 14:14:50'),
(133, 7, 1, 0, 0, 0, 'مدخنةDLN53AA50B', 'CHIMNEYDLN53AA50B', 'سلسلة | 2', 'Serie | 2', 'سلسلة | 2، أغطية المظلة، أقصى استخلاص للهواء (م3/ساعة): 300، H2160، مفاتيح متأرجحة، 3 مراحل_مكثفة، قوة الصوت بحد أقصى. السرعة (2010/30/EC): 61، العرض × العمق × الارتفاع: 530 × 280 × 290، إضاءة LED', 'Serie | 2, Canopy- hoods, Maximum output air extraction (m3/h):300, H2160, Rocker switches, 3-stage_Intensive, Sound power at max. speed (2010/30/EC): 61, WxDxH: 530x280x290, Led lighing', '/uploads/Devices/1717337719_3268.webp', 0, 342.000, 10000, NULL, NULL, NULL, '2024-06-02 11:07:12', '2024-06-02 14:15:19'),
(134, 7, 1, 0, 0, 0, 'مدخنةDWB64BC51B', 'CHIMNEYDWB64BC51B', 'سلسلة | 2', 'Serie | 2', 'سلسلة | 2، غطاء مدخنة حائطي، أقصى استخلاص للهواء (م3/ساعة): 340، H2190، زر ضغط، 3، قوة الصوت بحد أقصى. السرعة (2010/30/EC): 63، العرض × العمق × الارتفاع: 600 × 500 × 490', 'Serie | 2, Wall chimney hood, Maximum output air extraction (m3/h):340, H2190, push-button, 3, Sound power at max. speed (2010/30/EC): 63, WxDxH: 600x500x490', '/uploads/Devices/1717337757_2097.webp', 0, 373.000, 10000, NULL, NULL, NULL, '2024-06-02 11:08:34', '2024-06-02 14:15:58'),
(135, 7, 1, 0, 0, 0, 'مدخنةDWB94BC51B', 'CHIMNEYDWB94BC51B', 'سلسلة | 2', 'Serie | 2', 'سلسلة | 2، غطاء مدخنة حائطي، أقصى استخلاص للهواء (م3/ساعة): 340، H2190، زر ضغط، 3، قوة الصوت بحد أقصى. السرعة (2010/30/EC): 63، العرض × العمق × الارتفاع: 600 × 500 × 490', 'Serie | 2, Wall chimney hood, Maximum output air extraction (m3/h):340, H2190, push-button, 3, Sound power at max. speed (2010/30/EC): 63, WxDxH: 600x500x490', '/uploads/Devices/1717337787_6078.webp', 0, 341.000, 10000, NULL, NULL, NULL, '2024-06-02 11:10:43', '2024-06-02 14:16:27'),
(136, 7, 1, 0, 0, 0, 'مدخنةDWB97DM50B', 'CHIMNEYDWB97DM50B', 'سلسلة | 4', 'Serie | 4', 'سلسلة | 4، شفاط مدخنة حائطي، أقصى استخلاص للهواء (م3/ساعة):454، H2320، LED، تحكم باللمس، قوة الصوت بحد أقصى. السرعة (2010/30/EC): 65، العرض × العمق × الارتفاع: 900 × 500 × 490', 'Serie | 4, Wall chimney hood, Maximum output air extraction (m3/h):454, H2320, LED, touch control, , Sound power at max. speed (2010/30/EC): 65, WxDxH: 900x500x490', '/uploads/Devices/1717337828_8696.webp', 0, 482.000, 10000, NULL, NULL, NULL, '2024-06-02 11:14:18', '2024-06-02 14:17:08'),
(137, 7, 1, 0, 0, 0, 'مدخنةDWF97RV60B', 'CHIMNEYDWF97RV60B', 'سلسلة | 8', 'Serie | 8', 'سلسلة | 8، شفاط طباخ مثبت على الحائط، زجاج شفاف مطبوع باللون الأسود. مستشعر هواء مثالي، جزء داخلي سهل التنظيف، فلتر شحوم معدني، الحد الأقصى لاستخراج الهواء (م3/ساعة): 394، قوة الصوت بحد أقصى. السرعة (2010/30/EC) 57، العرض × العمق × الارتفاع: 890 × 263 × 430، غطاء محرك السيارة المسطح، 420 م 3 / ساعة، حلقة، HC', 'Serie | 8, Wall-mounted cooker hood, clear glass black printed. PerfectAir Sensor, Easy to Clean interior, Metal Grease Filter, Maximum output air extraction (m3/h):394,  Sound power at max. speed (2010/30/EC) 57, WxDxH: 890x263x430 , Flat hood, 420m3/h, Ring, HC', '/uploads/Devices/1717337880_9358.webp', 0, 491.000, 10000, NULL, NULL, NULL, '2024-06-02 11:15:44', '2024-06-02 14:18:00'),
(138, 7, 1, 0, 0, 0, 'مدخنةDWK96AJ60M', 'CHIMNEYDWK96AJ60M', 'سلسلة | 8، شفاط طباخ مثبت على الحائط، زجاج شفاف مطبوع باللون الأسود. مستشعر هواء مثالي، جزء داخلي سهل التنظيف، فلتر شحوم معدني، الحد الأقصى لاستخراج الهواء (م3/ساعة): 394، قوة الصوت بحد أقصى. السرعة (2010/30/EC) 57، العرض × العمق × الارتفاع: 890 × 263 × 430، غطاء محرك السيارة المسطح، 420 م 3 / ساعة، حلقة، HC', 'Serie | 8, Wall-mounted cooker hood, clear glass black printed. PerfectAir Sensor, Easy to Clean interior, Metal Grease Filter, Maximum output air extraction (m3/h):394,  Sound power at max. speed (2010/30/EC) 57, WxDxH: 890x263x430 , Flat hood, 420m3/h, Ring, HC', 'سلسلة| 8', 'Serie | 8', '/uploads/Devices/1717337906_3342.webp', 0, 106.000, 10000, NULL, NULL, NULL, '2024-06-02 11:25:39', '2024-06-02 14:18:26'),
(139, 7, 1, 0, 0, 0, 'مدخنةDWK96AJ60M', 'CHIMNEYDWK96AJ60M', 'سلسلة | 8، شفاط طباخ مثبت على الحائط، زجاج شفاف مطبوع باللون الأسود. مستشعر هواء مثالي، جزء داخلي سهل التنظيف، فلتر شحوم معدني، الحد الأقصى لاستخراج الهواء (م3/ساعة): 394، قوة الصوت بحد أقصى. السرعة (2010/30/EC) 57، العرض × العمق × الارتفاع: 890 × 263 × 430، غطاء محرك السيارة المسطح، 420 م 3 / ساعة، حلقة، HC', 'Serie | 8, Wall-mounted cooker hood, clear glass black printed. PerfectAir Sensor, Easy to Clean interior, Metal Grease Filter, Maximum output air extraction (m3/h):394,  Sound power at max. speed (2010/30/EC) 57, WxDxH: 890x263x430 , Flat hood, 420m3/h, Ring, HC', 'سلسلة| 8', 'Serie | 8', NULL, 0, 156.000, 10000, NULL, NULL, NULL, '2024-06-02 11:26:21', '2024-06-02 11:26:21'),
(140, 7, 1, 0, 0, 0, 'مدخنةDWP64CC50M', 'CHIMNEYDWP64CC50M', 'سلسلة | 2، غطاء مدخنة حائطي، أقصى استخلاص للهواء (م3/ساعة): 380، H2235، زر ضغط، 3، قوة الصوت بحد أقصى. السرعة (2010/30/EC): 64، العرض × العمق × الارتفاع: 598 × 470 × 630', 'Serie | 2, Wall chimney hood, Maximum output air extraction (m3/h):380, H2235, push-button, 3, Sound power at max. speed (2010/30/EC): 64, WxDxH: 598x470x630', 'سلسلة| 2', 'Serie | 2', '/uploads/Devices/1717337939_9738.webp', 0, 364.000, 10000, NULL, NULL, NULL, '2024-06-02 11:27:53', '2024-06-02 14:18:59'),
(141, 7, 1, 0, 0, 0, 'مدخنةDWK96AJ60M', 'CHIMNEYDWK96AJ60M', 'سلسلة | 4', 'Serie | 4', 'سلسلة | 4، شفاط طباخ مثبت على الحائط، TouchControl، مرشح الشحوم المعدني، الحد الأقصى لاستخراج الهواء الناتج (م 3 / ساعة): 638، قوة الصوت بحد أقصى. السرعة (2010/30/EC) 64، العرض × العمق × الارتفاع: 896 × 386 × 455', 'Serie | 4, Wall-mounted cooker hood, TouchControl, Metal grease filter, Maximum output air extraction (m3/h):638,  Sound power at max. speed (2010/30/EC) 64, WxDxH: 896x386x455', NULL, 0, 450.000, 10000, NULL, NULL, NULL, '2024-06-02 11:33:56', '2024-06-02 11:33:56'),
(142, 7, 1, 0, 0, 0, 'مدخنةDWP64CC50M', 'CHIMNEYDWP64CC50M', 'سلسلة | 2', 'Serie | 2', 'سلسلة | 2، غطاء مدخنة حائطي، أقصى استخلاص للهواء (م3/ساعة): 380، H2235، زر ضغط، 3، قوة الصوت بحد أقصى. السرعة (2010/30/EC): 64، العرض × العمق × الارتفاع: 598 × 470 × 630', 'Serie | 2, Wall chimney hood, Maximum output air extraction (m3/h):380, H2235, push-button, 3, Sound power at max. speed (2010/30/EC): 64, WxDxH: 598x470x630', '/uploads/Devices/1717338807_6412.webp', 0, 257.000, 10000, NULL, NULL, NULL, '2024-06-02 11:38:50', '2024-06-02 14:33:28'),
(143, 7, 1, 0, 0, 0, 'مدخنةDWP94CC50M', 'CHIMNEYDWP94CC50M', 'سلسلة | 2', 'Serie | 2', 'سلسلة | 2، غطاء مدخنة حائطي، أقصى استخلاص للهواء (م3/ساعة): 380، H2235، زر ضغط، 3، قوة الصوت بحد أقصى. السرعة (2010/30/EC): 64، العرض × العمق × الارتفاع: 598 × 470 × 630', 'Serie | 2, Wall chimney hood, Maximum output air extraction (m3/h):380, H2235, push-button, 3, Sound power at max. speed (2010/30/EC): 64, WxDxH: 598x470x630', NULL, 0, 238.000, 10000, NULL, NULL, NULL, '2024-06-02 11:40:34', '2024-06-02 11:40:34'),
(144, 7, 1, 0, 0, 0, 'ميكروويف FS FEL053MS1M', 'FS MICROWAVE FEL053MS1M', 'ميكروويف، سلسلة | 2', 'Microwave, Serie | 2', 'ميكروويف، سلسلة | 2، جهاز MW قائم بذاته مع شواية، AutoPilot 8، شاشة LED باللون الأحمر، الفولاذ المقاوم للصدأ، زر فتح الباب، 800 وات، 5 مستويات للطاقة، غشاء + أدوات تحكم في المقبض، طباخ سريع، قرص دوار للتوزيع الثلاثي.', 'Microwave, Serie | 2, Free-standing, MW appliance with grill, AutoPilot 8, LED display in red, Stainless steel, button door opening, 800W, 5 power levels, Membrane + knob controls, speedchef, triple distribution turntable disk.', NULL, 0, 317.000, 10000, NULL, NULL, NULL, '2024-06-02 11:46:09', '2024-06-02 11:46:09'),
(145, 7, 1, 0, 0, 0, 'فريزر ثنائي GIN81AE30M', 'BI FREEZER GIN81AE30M', 'فريزر رأسي', 'Upright freezer', 'الأبعاد (العمق × الارتفاع × العرض): 54,50 سم × 177,20 سم × 55,80 سم، السعة الإجمالية 235 لترًا، السعة الصافية 211 لترًا، مُدمج، فريزر رأسي، إعداد فائق للفريزر، وظيفة تحذير قسم التجميد.   , إشارة تحذير للباب مفتوح , نظام منع الصقيع , زجاج أمان , A++', 'Dimensions (DxHxW): 54,50 cm x 177,20 cm x 55,80 cm,  Gross Capacity 235l , Net capaity 211l ,Built-in , Upright freezer ,   Super setting for freezer   , Warning function freezer sect.   , Warning signal door open  , Frost free system Safety glass  , A++', '/uploads/Devices/1717329787_3184.webp', 0, 373.000, 10, NULL, NULL, NULL, '2024-06-02 11:54:11', '2024-06-05 12:13:35'),
(146, 7, 1, 0, 0, 0, 'فرن كهربائي ثنائيHBF011BR1M', 'BI ELEC OVENHBF011BR1M', 'السلسلة | 2', 'Serie | 2', '\"السلسلة | 2، ميكانيكي تيم، 3D Hotair، 5 أوضاع تسخين، تقليدي\r\nحرارة، تذويب، شواية متغيرة بعرض كامل، هواء ساخن، شواء بالهواء الساخن، 1 × شبكة مركبة، 1 × مقلاة عالمية، الحمل المتصل: 3300 وات، 66 لترًا', '\"Serie | 2, Mech. Tim., 3D Hotair, 5 heating modes, Conventional\r\nheat, Defrost, Full width variable grill, Hot Air, Hot air grilling, 1 x combination grid, 1 x universal pan, Connected load: 3300W, 66L\"', NULL, 0, 413.000, 10000, NULL, NULL, NULL, '2024-06-02 12:15:50', '2024-06-02 12:15:50'),
(147, 8, 1, 0, 0, 0, 'كمبيوتر محمول سيرفس 13.8 بوصة', 'Surface Laptop 13.8”', 'قم بتغيير طريقة عملك وإنشاءك ولعبك.', 'Transform the way you work, create and play.', 'شاشة لمس 13.8 بوصة\r\n\r\nرمز المعالج\r\nسنابدراجون اكس بلس (10 نواة)\r\n\r\nSnapdragon X Elite (12 نواة)\r\n\r\nأيقونة الوزن\r\nيبدأ من 2.96 رطل (1.34 كجم)\r\n\r\nأيقونة المنافذ\r\nUSB-C، USB-A\r\n\r\nأيقونة البطارية.\r\nما يصل إلى 20 ساعة من تشغيل الفيديو2', '13.8” touchscreen\r\n\r\nProcessor icon.\r\nSnapdragon X Plus (10 core)\r\n\r\nSnapdragon X Elite (12 core)\r\n\r\nWeight icon.\r\nStarting at 2.96 lbs (1.34 kg)\r\n\r\nPorts icon.\r\nUSB-C, USB-A\r\n\r\nBattery icon.\r\nUp to 20 hours video playback2', NULL, 0, 999.000, 100000, NULL, NULL, NULL, '2024-06-02 12:46:08', '2024-06-02 12:46:08'),
(148, 8, 1, 0, 0, 0, 'كمبيوتر محمول سيرفس 15 بوصة', 'Surface Laptop 15”', 'كمبيوتر محمول قوي للغاية ونحيف للغاية.', 'Exceptionally powerful, ultra-thin laptop.', 'أيقونة حجم الشاشة\r\nشاشة لمس 15 بوصة\r\n\r\nرمز المعالج\r\nSnapdragon X Elite (12 نواة)\r\n\r\nأيقونة الوزن\r\nيبدأ من 3.67 رطل (1.66 كجم)\r\n\r\nأيقونة المنافذ\r\nUSB-C، USB-A\r\n\r\nأيقونة البطارية.\r\nما يصل إلى 22 ساعة من تشغيل الفيديو2', 'Screensize icon.\r\n15” touchscreen\r\n\r\nProcessor icon.\r\nSnapdragon X Elite (12 core)\r\n\r\nweight icon\r\nStarting at 3.67 lbs (1.66 kg)\r\n\r\nPorts icon.\r\nUSB-C, USB-A\r\n\r\nBattery icon.\r\nUp to 22 hours video playback2', '/uploads/Devices/1717338726_7072.webp', 0, 1300.000, 100000, NULL, NULL, NULL, '2024-06-02 12:48:55', '2024-06-02 14:32:06'),
(149, 8, 1, 0, 0, 0, 'سيرفس لاب توب ستوديو 2', 'Surface Laptop Studio 2', 'تصميم متعدد الاستخدامات، وأعلى أداء، وشاشة تعمل باللمس مقاس 14.4 بوصة على كمبيوتر محمول لا مثيل له.4', 'Versatile design, peak performance, and a 14.4” touchscreen on a laptop like no other.4', 'شاشة لمس 14.4 بوصة4\r\n\r\nرمز المعالج\r\nالجيل الثالث عشر من Intel® i7\r\n\r\nأيقونة الوزن\r\nيبدأ من 4.18 رطل (1.89 كجم)\r\n\r\nأيقونة المنافذ\r\nUSB-C/Thunderbolt™ 4، USB-A\r\n\r\nأيقونة البطارية\r\nما يصل إلى 18 ساعة2\r\nما يصل إلى 16 ساعة (2 تيرابايت SSD)', '14.4” touchscreen4\r\n\r\nProcessor icon\r\n13th Gen Intel® i7\r\n\r\nWeight icon\r\nStarting at 4.18 lbs (1.89 kg)\r\n\r\nPorts icon\r\nUSB-C/Thunderbolt™ 4, USB-A\r\n\r\nBattery icon\r\nUp to 18 hours2\r\nUp to 16 hours (2TB SSD)', '/uploads/Devices/1717338646_3476.avif', 0, 2000.000, 100000, NULL, NULL, NULL, '2024-06-02 12:51:27', '2024-06-02 14:30:46'),
(150, 8, 1, 0, 0, 0, 'سيرفس لاب توب جو 3', 'Surface Laptop Go 3', 'تصميم متعدد الاستخدامات، وأعلى أداء، وشاشة تعمل باللمس مقاس 14.4 بوصة على كمبيوتر محمول لا مثيل له.4', 'Versatile design, peak performance, and a 14.4” touchscreen on a laptop like no other.4', 'شاشة لمس 12.4 بوصة\r\n\r\nرمز المعالج\r\nالجيل الثاني عشر من Intel® i5\r\n\r\nأيقونة الوزن\r\n2.49 رطل (1.13 كجم)\r\n\r\nأيقونة المنافذ\r\nUSB-C®، USB-A\r\n\r\nأيقونة البطارية\r\nما يصل إلى 15 ساعة', '12.4” touchscreen\r\n\r\nProcessor icon\r\n12th Gen Intel® i5\r\n\r\nWeight icon\r\n2.49 lbs (1.13 kg)\r\n\r\nPorts icon\r\nUSB-C®, USB-A\r\n\r\nBattery icon\r\nUp to 15 hours', '/uploads/Devices/1717338563_2172.avif', 0, 800.000, 100000, NULL, NULL, NULL, '2024-06-02 12:53:41', '2024-06-02 14:29:23'),
(151, 8, 1, 0, 0, 0, 'سيرفيس برو', 'Surface Pro', 'الكمبيوتر المحمول الأكثر مرونة، معاد تصوره.', 'The most flexible laptop, reimagined.', 'تجارب Copilot+ PC وCopilot+ Windows\r\n\r\nأيقونة حجم الشاشة\r\nشاشة لمس OLED أو LCD مقاس 13 بوصة8\r\n\r\nأيقونة شريحة المعالج\r\nسنابدراجون اكس بلس (10 نواة)\r\nSnapdragon X Elite (12 نواة)\r\n\r\nأيقونة الوزن\r\nيبدأ من 1.97 رطل (895 جم)\r\n\r\nأيقونة المنافذ\r\nيو اس بي سي\r\n\r\nأيقونة البطارية.\r\nعمر البطارية طوال اليوم1', 'Copilot+ PC, Copilot+ Windows experiences\r\n\r\nScreen size icon.\r\n13” OLED or LCD touchscreen8\r\n\r\nProcessor chip icon.\r\nSnapdragon X Plus (10 core)\r\nSnapdragon X Elite (12 core)\r\n\r\nWeight icon.\r\nStarting at 1.97 lbs (895 g)\r\n\r\nPorts icon.\r\nUSB-C\r\n\r\nBattery icon.\r\nAll-day battery life1', '/uploads/Devices/1717338513_3550.webp', 1, 1000.000, 100000, NULL, NULL, NULL, '2024-06-02 12:59:16', '2024-06-02 14:52:42'),
(152, 8, 1, 0, 0, 0, 'سيرفيس برو 9', 'Surface Pro 9', 'مرونة الكمبيوتر اللوحي التي تريدها مع أداء الكمبيوتر المحمول وعمر البطارية الذي تحتاجه.', 'The tablet flexibility you want with the laptop performance and battery life you need.', 'شاشة عرض PixelSense™ Flow مقاس 13 بوصة\r\n\r\nأيقونة شريحة المعالج\r\nالجيل الثاني عشر من Intel® Core™ أو Microsoft SQ® 3\r\n\r\nأيقونة الوزن\r\nيبدأ من 1.94 رطل (879 جم)\r\n\r\nأيقونة المنافذ\r\nشبكة WiFi: USB-C®‎ مع USB 4.0/ Thunderbolt™ 4\r\n\r\n5G: USB-C®\r\n\r\nأيقونة البطارية.\r\nما يصل إلى 15.5 ساعة', '13” PixelSense™ Flow display\r\n\r\nProcessor chip icon.\r\n12th Gen Intel® Core™or Microsoft SQ® 3\r\n\r\nWeight icon.\r\nStarting at 1.94 lbs (879 g)\r\n\r\nPorts icon.\r\nWiFi: USB-C® with USB 4.0/ Thunderbolt™ 4\r\n\r\n5G: USB-C®\r\n\r\nBattery icon.\r\nUp to 15.5 hours', '/uploads/Devices/1717338490_6575.webp', 0, 1000.000, 100000, NULL, NULL, NULL, '2024-06-02 13:01:10', '2024-06-02 14:28:10'),
(153, 8, 1, 0, 0, 0, 'سيرفس لاب توب ستوديو 2', 'Surface Laptop Studio 2', 'تصميم متعدد الاستخدامات، وأعلى أداء، وشاشة تعمل باللمس مقاس 14.4 بوصة على كمبيوتر محمول لا مثيل له.4', 'Versatile design, peak performance, and a 14.4” touchscreen on a laptop like no other.4', 'شاشة لمس 14.4 بوصة4\r\n\r\nرمز المعالج\r\nالجيل الثالث عشر من Intel® i7\r\n\r\nأيقونة الوزن\r\nيبدأ من 4.18 رطل (1.89 كجم)\r\n\r\nأيقونة المنافذ\r\nUSB-C/Thunderbolt™ 4، USB-A\r\n\r\nأيقونة البطارية\r\nما يصل إلى 18 ساعة1\r\nما يصل إلى 16 ساعة (2 تيرابايت SSD)', '14.4” touchscreen4\r\n\r\nProcessor icon\r\n13th Gen Intel® i7\r\n\r\nWeight icon\r\nStarting at 4.18 lbs (1.89 kg)\r\n\r\nPorts icon\r\nUSB-C/Thunderbolt™ 4, USB-A\r\n\r\nBattery icon\r\nUp to 18 hours1\r\nUp to 16 hours (2TB SSD)', '/uploads/Devices/1717338400_1150.webp', 0, 2000.000, 100000, NULL, NULL, NULL, '2024-06-02 13:04:47', '2024-06-02 14:26:40'),
(154, 8, 1, 0, 0, 0, 'لوحة مفاتيح سيرفس برو', 'Surface Pro Keyboard', 'تجربة لوحة مفاتيح كاملة بتصميم مدمج', 'A full keyboard experience in a compact design', 'تجربة لوحة مفاتيح كاملة بتصميم مدمج', 'A full keyboard experience in a compact design', '/uploads/Devices/1717338340_7311.webp', 0, 140.000, 10000, NULL, NULL, NULL, '2024-06-02 13:17:27', '2024-06-02 14:25:40'),
(155, 9, 1, 0, 0, 0, 'ماك بوك اير 13 و 15 بوصة', 'MacBook Air 13” and 15”', 'نحيف وسريع بشكل مذهل حتى تتمكن من العمل أو اللعب أو الإبداع في أي مكان.', 'Strikingly thin and fast so you can work, play, or create anywhere.', '13.6 بوصة أو 15.3 بوصة\r\n\r\nشاشة Liquid Retina بسطوع يبلغ 500 شمعة ودعم لمليار لون5\r\n\r\n\r\nشريحة أبل M2 أو M3\r\n\r\nيصل إلى\r\n18 ساعة\r\nعمر البطارية6\r\n4 منافذ\r\n2x Thunderbolt / USB 4، ومقبس سماعة الرأس، وMagSafe\r\n2.7 رطل أو 3.3 رطل\r\n\r\nوزن', '13.6” or 15.3”\r\n\r\nLiquid Retina display with 500 nits of brightness and support for 1 billion colors5\r\n\r\n\r\nApple M2 or M3 chip\r\n\r\nUp to\r\n18 hours\r\nbattery life6\r\n4 ports\r\n2x Thunderbolt / USB 4, headphone jack, MagSafe\r\n2.7 lb. or 3.3 lb.\r\n\r\nWeight', '/uploads/Devices/1717338258_8705.webp', 0, 1000.000, 10000, NULL, NULL, NULL, '2024-06-02 13:29:10', '2024-06-02 14:24:18'),
(156, 9, 1, 0, 0, 0, 'ماك بوك برو 14 و 16 بوصة', 'MacBook Pro 14” and 16”', 'أجهزة كمبيوتر Mac المحمولة الأكثر تقدمًا لسير العمل المتطلب.', 'The most advanced Mac laptops for demanding workflows.', '14.2 بوصة أو 16.2 بوصة\r\n\r\nشاشة Liquid Retina XDR مع 1000 شمعة في المتر المربع من HDR و600 شمعة في المتر المربع من سطوع SDR ومعدلات تحديث تصل إلى 120 هرتز5\r\n\r\n\r\nشريحة Apple M3 أو M3 Pro أو M3 Max\r\n\r\nيصل إلى\r\n22 ساعة\r\nعمر البطارية7\r\nيصل إلى\r\n7 منافذ\r\n2x Thunderbolt / USB 4 أو 3x Thunderbolt 4، HDMI، SDXC، مقبس سماعة الرأس، MagSafe\r\n3.4 رطل أو 4.7 رطل\r\n\r\nوزن', '14.2” or 16.2”\r\n\r\nLiquid Retina XDR display with 1000 nits of HDR and 600 nits of SDR brightness and up to 120Hz refresh rates5\r\n\r\n\r\nApple M3, M3 Pro, or M3 Max chip\r\n\r\nUp to\r\n22 hours\r\nbattery life7\r\nUp to\r\n7 ports\r\n2x Thunderbolt / USB 4 or 3x Thunderbolt 4, HDMI, SDXC, headphone jack, MagSafe\r\n3.4 lb. or 4.7 lb.\r\n\r\nWeight', '/uploads/Devices/1717338241_5857.webp', 0, 1600.000, 10000, NULL, NULL, NULL, '2024-06-02 13:32:38', '2024-06-02 14:24:01'),
(157, 9, 1, 0, 0, 0, 'ايفون 15 برو', 'iPhone 15 Pro', 'ماك بوك برو 14 و 16 بوصة', 'iPhone 15 Pro', 'شاشة Super Retina XDR مقاس 6.1 بوصات ¹ تتميز بميزة ProMotion وAlways-On وDynamic Island\r\nتصميم قوي وخفيف من التيتانيوم مزود بزر الإجراء - وهو مسار سريع للوصول إلى الميزة المفضلة لديك\r\nكاميرا رئيسية بدقة 48 ميجابكسل لالتقاط صور فائقة الدقة وكاميرا تليفوتوغرافي 3x\r\nتوفر شريحة A17 Pro قفزة هائلة في أداء الرسومات، مما يؤدي إلى إحداث تحول في الألعاب المحمولة\r\nموصل USB-C مزود بمنفذ USB 3 لسرعات نقل أسرع بما يصل إلى 20 مرة، وسير عمل احترافي جديد', '6.1-inch Super Retina XDR display footnote ¹ featuring ProMotion, Always-On, and Dynamic Island\r\nStrong and light titanium design with Action button — a fast track to your favorite feature\r\n48MP Main camera for super-high-resolution photos and 3x Telephoto camera\r\nA17 Pro chip delivers a massive leap in graphics performance, transforming mobile gaming\r\nUSB-C connector with USB 3 for up to 20x faster transfer speeds footnote ² and new pro workflows', '/uploads/Devices/1717338161_1589.webp', 0, 1600.000, 10000, NULL, NULL, NULL, '2024-06-02 13:36:28', '2024-06-02 14:22:41'),
(158, 9, 1, 0, 0, 0, 'ايفون 15 برو ماكس', 'iPhone 15 Pro Max', 'ايفون 15 برو ماكس', 'iPhone 15 Pro Max', 'شاشة Super Retina XDR مقاس 6.7 بوصات ¹ تتميز بميزة ProMotion وAlways-On وDynamic Island\r\nتصميم قوي وخفيف من التيتانيوم مزود بزر الإجراء - وهو مسار سريع للوصول إلى الميزة المفضلة لديك\r\nكاميرا رئيسية بدقة 48MP لالتقاط صور فائقة الدقة وكاميرا Telephoto حتى 5x، وهي أطول زووم بصري في iPhone على الإطلاق\r\nتوفر شريحة A17 Pro قفزة هائلة في أداء الرسومات، مما يؤدي إلى إحداث تحول في الألعاب المحمولة\r\nموصل USB-C مزود بمنفذ USB 3 لسرعات نقل أسرع بما يصل إلى 20 مرة، وسير عمل احترافي جديد', '6.7-inch Super Retina XDR display footnote ¹ featuring ProMotion, Always-On, and Dynamic Island\r\nStrong and light titanium design with Action button — a fast track to your favorite feature\r\n48MP Main camera for super-high-resolution photos and 5x Telephoto camera, the longest optical zoom in iPhone ever\r\nA17 Pro chip delivers a massive leap in graphics performance, transforming mobile gaming\r\nUSB-C connector with USB 3 for up to 20x faster transfer speeds footnote ² and new pro workflows', '/uploads/Devices/1717338081_4163.webp', 1, 1600.000, 10000, NULL, NULL, NULL, '2024-06-02 13:38:22', '2024-06-02 14:21:21'),
(170, 9, 1, 0, 0, 0, 'Macbook Air 13 بوصة (2020) - M1 8 جيجابايت', 'MacBook Air 13-inch (2020)', 'Apple MacBook Air 13 بوصة (2020) - شريحة Apple M1 / ​​ذاكرة وصول عشوائي 8 جيجابايت / SSD سعة 256 جيجابايت / وحدة معالجة رسومات 7 النواة / نظام التشغيل macOS Big Sur / لوحة مفاتيح باللغة الإنجليزية والعربية / رمادي فلكي / إصدار الشرق الأوسط - [MGN63AB/A]', 'Apple MacBook Air 13-inch (2020) - Apple M1 Chip / 8GB RAM / 256GB SSD / 7-core GPU / macOS Big Sur / English & Arabic Keyboard / Space Grey / Middle East Version - [MGN63AB/A]', NULL, NULL, '/uploads/Devices/1717408300_7607.webp', 0, 326.000, 10, NULL, NULL, NULL, '2024-06-03 09:51:40', '2024-06-03 09:54:08'),
(171, 4, 1, 0, 0, 0, 'جهاز أبل ماك بوك آير 15 بوصة (2023)', 'Apple MacBook Air 15-inch (2023)', 'المحرك العصبي ذو 16 نواة\r\nشاشة Liquid Retina مقاس 15.3 بوصة مع تقنية True Tone²\r\nكاميرا فيس تايم عالية الدقة 1080 بكسل\r\nمنفذ شحن MagSafe 3\r\nمنفذين Thunderbolt / USB 4\r\nدعم ما يصل إلى شاشتين خارجيتين (مع إغلاق غطاء الكمبيوتر المحمول)\r\nلوحة المفاتيح السحرية مع معرف اللمس\r\nلوحة التتبع Force Touch\r\nمحول طاقة مدمج بمنفذ USB-C مزدوج بقدرة 35 وات', '16-core Neural Engine\r\n15.3-inch Liquid Retina display with True Tone²\r\n1080p FaceTime HD camera\r\nMagSafe 3 charging port\r\nTwo Thunderbolt / USB 4 ports\r\nSupport for up to two external displays (with laptop lid closed)\r\nMagic Keyboard with Touch ID\r\nForce Touch trackpad\r\n35W Dual USB-C Port Compact Power Adapter', 'المحرك العصبي ذو 16 نواة\r\nشاشة Liquid Retina مقاس 15.3 بوصة مع تقنية True Tone²\r\nكاميرا فيس تايم عالية الدقة 1080 بكسل\r\nمنفذ شحن MagSafe 3\r\nمنفذين Thunderbolt / USB 4\r\nدعم ما يصل إلى شاشتين خارجيتين (مع إغلاق غطاء الكمبيوتر المحمول)\r\nلوحة المفاتيح السحرية مع معرف اللمس\r\nلوحة التتبع Force Touch\r\nمحول طاقة مدمج بمنفذ USB-C مزدوج بقدرة 35 وات', '16-core Neural Engine\r\n15.3-inch Liquid Retina display with True Tone²\r\n1080p FaceTime HD camera\r\nMagSafe 3 charging port\r\nTwo Thunderbolt / USB 4 ports\r\nSupport for up to two external displays (with laptop lid closed)\r\nMagic Keyboard with Touch ID\r\nForce Touch trackpad\r\n35W Dual USB-C Port Compact Power Adapter', '/uploads/Devices/1717409080_5851.webp', 1, 266.000, 30, NULL, NULL, NULL, '2024-06-03 10:04:40', '2024-06-03 13:30:51'),
(172, 9, 1, 0, 0, 0, 'آبل ماك بوك برو ١٤ بوصة(٢٠٢٣)', 'Apple MacBook Pro 14-inch (2023)', 'آبل ماك بوك برو ١٤ بوصة(٢٠٢٣)- وحدة المعالجة المركزية ٨ النواة M3- ذاكرة ٨ جيجا بايت- ٥١٢ جيجابايت وحدة تخرين- وحدة معالجة الجرافيك 10 كور- نظام تشغيل ماك سونوما- لوحة مفاتيح باللغة العربية والانجليزية- رمادي-إصدار الشرق الأوسط', 'Apple MacBook Pro 14-inch (2023) – M3 with 8-core CPU / 8GB RAM / 512GB SSD / 10-core GPU / macOS Sonoma / English & Arabic Keyboard / Space Grey / Middle East Version', 'آبل ماك بوك برو ١٤ بوصة(٢٠٢٣)- وحدة المعالجة المركزية ٨ النواة M3- ذاكرة ٨ جيجا بايت- ٥١٢ جيجابايت وحدة تخرين- وحدة معالجة الجرافيك 10 كور- نظام تشغيل ماك سونوما- لوحة مفاتيح باللغة العربية والانجليزية- رمادي-إصدار الشرق الأوسط', 'Apple MacBook Pro 14-inch (2023) – M3 with 8-core CPU / 8GB RAM / 512GB SSD / 10-core GPU / macOS Sonoma / English & Arabic Keyboard / Space Grey / Middle East Version', '/uploads/Devices/1717409357_6851.webp', 0, 240.000, 40, NULL, NULL, NULL, '2024-06-03 10:07:44', '2024-06-03 10:10:09'),
(173, 4, 1, 0, 0, 0, 'iPhone 12 128 جيجابايت أخضر مع Facetime', 'Apple iPhone 12 (128GB) – Green', 'iPhone 12 128 جيجابايت أخضر مع Facetime', 'Apple iPhone 12 (128GB) – Green', 'iPhone 12 128 جيجابايت أخضر مع Facetime', 'Apple iPhone 12 (128GB) – Green', '/uploads/Devices/1717413877_1179.webp', 0, 300.000, 20, NULL, NULL, NULL, '2024-06-03 11:24:37', '2024-06-03 11:24:37'),
(174, 3, 1, 0, 0, 0, 'سامسونج جالاكسي S22', 'SAMSUNG Samsung Galaxy S22', 'سامسونج جالاكسي S22', 'Samsung Galaxy S22', 'سامسونج جالاكسي S22', 'Samsung Galaxy S22', '/uploads/Devices/1717414268_1356.webp', 0, 12.000, 10, NULL, NULL, NULL, '2024-06-03 11:31:08', '2024-06-03 11:31:08'),
(175, 8, 1, 0, 0, 0, 'مايكروسوفت سيرفس برو 7+', 'Microsoft Surface Pro 7+', NULL, NULL, NULL, NULL, '/uploads/Devices/1717415655_1288.webp', 1, 200.000, 20, NULL, NULL, NULL, '2024-06-03 11:54:15', '2024-06-13 08:26:18'),
(176, 8, 1, 0, 0, 0, 'بايت كوول لابتوب', 'BiTECOOL 15.6\" Windows 11', 'بايت كوول لابتوب 15.6 انش ويندوز 11، انتل كور i3-5005U، 16GB RAM، 512GB SSD، شاشة FHD IPS، واي فاي 2.4G/5G، بلوتوث 5.0، ار جيه 45، نوع C، كاميرا ويب، عمر بطارية طويل للعمل والدراسة والترفيه', '15.6\" Windows 11 Laptop, Intel Core i3-5005U, 16GB RAM, 512GB SSD, FHD IPS Display, 2.4G/5G WiFi, BT5.0, RJ45, Type C, Webcam, Long Battery Life - for Work, Study, and Entertainment', 'بايت كوول لابتوب 15.6 انش ويندوز 11، انتل كور i3-5005U، 16GB RAM، 512GB SSD، شاشة FHD IPS، واي فاي 2.4G/5G، بلوتوث 5.0، ار جيه 45، نوع C، كاميرا ويب، عمر بطارية طويل للعمل والدراسة والترفيه', '15.6\" Windows 11 Laptop, Intel Core i3-5005U, 16GB RAM, 512GB SSD, FHD IPS Display, 2.4G/5G WiFi, BT5.0, RJ45, Type C, Webcam, Long Battery Life - for Work, Study, and Entertainment', '/uploads/Devices/1717416190_7601.webp', 0, 10000.000, 20, NULL, NULL, NULL, '2024-06-03 12:03:10', '2024-06-03 12:03:58'),
(177, 8, 1, 0, 0, 0, 'سيرفس بوك 2 من مايكروسوفت', 'Microsoft Surface Book 2', 'مايكروسوفت يتميز سيرفس بوك 2 بمعالج انتل رباعي النواة i7 من الجيل الثامن وسعة تخزين 512 جيجابايت وذاكرة رام 16 جيجابايت وما يصل إلى 17 ساعة من تشغيل الفيديو\r\nأداء رسومات محسّن مع وحدة معالجة الرسومات الجرافيكية انفيديا جيفورس GTX 1050 المنفصلة مع ذاكرة GDDR5 سعة 2 جيجابايت\r\nأسرع جهاز سيرفس بوك حتى الآن، مع قوة أكبر بمقدار مرتين. يعمل بنظام ويندوز 10 برو\r\nشاشة بكسل سينس نابضة بالحياة: متوفرة الآن مع شاشة لمس محسنة مقاس 13.5 انش\r\nأربعة أوضاع متعددة الاستخدام ومنفذ USB-C جديد', 'Microsoft Surface Book 2 Features a 8th generation Intel Quad Core i7 Processor, 512 GB of storage, 16 GB RAM, and up to 17 hours of video playback\r\nEnhanced Graphics performance with NVIDIA GeForce GTX 1050 discrete GPU w/2GB GDDR5 Graphics Memory\r\nThe fastest Surface Book yet, with 2x more power. Runs Windows 10 Pro\r\nVibrant PixelSense Display: now available with an improved 13.5\" touchscreen\r\nFour versatile modes of use and new USB-C port', 'مايكروسوفت يتميز سيرفس بوك 2 بمعالج انتل رباعي النواة i7 من الجيل الثامن وسعة تخزين 512 جيجابايت وذاكرة رام 16 جيجابايت وما يصل إلى 17 ساعة من تشغيل الفيديو\r\nأداء رسومات محسّن مع وحدة معالجة الرسومات الجرافيكية انفيديا جيفورس GTX 1050 المنفصلة مع ذاكرة GDDR5 سعة 2 جيجابايت\r\nأسرع جهاز سيرفس بوك حتى الآن، مع قوة أكبر بمقدار مرتين. يعمل بنظام ويندوز 10 برو\r\nشاشة بكسل سينس نابضة بالحياة: متوفرة الآن مع شاشة لمس محسنة مقاس 13.5 انش\r\nأربعة أوضاع متعددة الاستخدام ومنفذ USB-C جديد', 'Microsoft Surface Book 2 Features a 8th generation Intel Quad Core i7 Processor, 512 GB of storage, 16 GB RAM, and up to 17 hours of video playback\r\nEnhanced Graphics performance with NVIDIA GeForce GTX 1050 discrete GPU w/2GB GDDR5 Graphics Memory\r\nThe fastest Surface Book yet, with 2x more power. Runs Windows 10 Pro\r\nVibrant PixelSense Display: now available with an improved 13.5\" touchscreen\r\nFour versatile modes of use and new USB-C port', '/uploads/Devices/1717416539_9752.webp', 1, 350.000, 200, NULL, NULL, NULL, '2024-06-03 12:08:59', '2024-06-13 08:27:10');

-- --------------------------------------------------------

--
-- Table structure for table `device_accessory`
--

CREATE TABLE `device_accessory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `accessory_id` bigint(20) UNSIGNED NOT NULL,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device_accessory`
--

INSERT INTO `device_accessory` (`id`, `accessory_id`, `device_id`, `created_at`, `updated_at`) VALUES
(12, 147, 173, NULL, NULL),
(13, 170, 171, NULL, NULL),
(14, 172, 171, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `device_category`
--

CREATE TABLE `device_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device_category`
--

INSERT INTO `device_category` (`id`, `device_id`, `category_id`, `created_at`, `updated_at`) VALUES
(132, 113, 69, NULL, NULL),
(133, 114, 69, NULL, NULL),
(134, 115, 69, NULL, NULL),
(135, 116, 71, NULL, NULL),
(136, 117, 71, NULL, NULL),
(137, 118, 71, NULL, NULL),
(139, 126, 88, NULL, NULL),
(140, 127, 88, NULL, NULL),
(141, 128, 89, NULL, NULL),
(142, 129, 89, NULL, NULL),
(143, 130, 90, NULL, NULL),
(144, 136, 90, NULL, NULL),
(145, 135, 90, NULL, NULL),
(146, 134, 90, NULL, NULL),
(147, 141, 90, NULL, NULL),
(148, 142, 90, NULL, NULL),
(149, 144, 91, NULL, NULL),
(150, 145, 80, NULL, NULL),
(151, 147, 101, NULL, NULL),
(152, 148, 101, NULL, NULL),
(153, 149, 101, NULL, NULL),
(154, 150, 101, NULL, NULL),
(155, 151, 102, NULL, NULL),
(156, 152, 102, NULL, NULL),
(157, 153, 102, NULL, NULL),
(158, 154, 103, NULL, NULL),
(159, 155, 105, NULL, NULL),
(160, 156, 105, NULL, NULL),
(161, 157, 106, NULL, NULL),
(162, 158, 106, NULL, NULL),
(163, 121, 108, NULL, NULL),
(164, 122, 108, NULL, NULL),
(165, 123, 108, NULL, NULL),
(166, 170, 5, NULL, NULL),
(167, 171, 5, NULL, NULL),
(168, 172, 5, NULL, NULL),
(169, 173, 106, NULL, NULL),
(170, 174, 106, NULL, NULL),
(171, 175, 121, NULL, NULL),
(172, 176, 121, NULL, NULL),
(173, 177, 121, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `device_feature`
--

CREATE TABLE `device_feature` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `desc_ar` longtext DEFAULT NULL,
  `desc_en` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device_feature`
--

INSERT INTO `device_feature` (`id`, `status`, `device_id`, `title_ar`, `title_en`, `desc_ar`, `desc_en`, `image`, `created_at`, `updated_at`) VALUES
(128, 1, 171, 'المحرك العصبي ذو 16 نواة', '16-core Neural Engine', 'المحرك العصبي ذو 16 نواة\r\nشاشة Liquid Retina مقاس 15.3 بوصة مع تقنية True Tone²\r\nكاميرا فيس تايم عالية الدقة 1080 بكسل\r\nمنفذ شحن MagSafe 3\r\nمنفذين Thunderbolt / USB 4\r\nدعم ما يصل إلى شاشتين خارجيتين (مع إغلاق غطاء الكمبيوتر المحمول)\r\nلوحة المفاتيح السحرية مع معرف اللمس\r\nلوحة التتبع Force Touch\r\nمحول طاقة مدمج بمنفذ USB-C مزدوج بقدرة 35 وات', '16-core Neural Engine\r\n15.3-inch Liquid Retina display with True Tone²\r\n1080p FaceTime HD camera\r\nMagSafe 3 charging port\r\nTwo Thunderbolt / USB 4 ports\r\nSupport for up to two external displays (with laptop lid closed)\r\nMagic Keyboard with Touch ID\r\nForce Touch trackpad\r\n35W Dual USB-C Port Compact Power Adapter', '/uploads/Devices/1717421451_4700.webp', '2024-06-03 13:49:40', '2024-06-03 13:49:40');

-- --------------------------------------------------------

--
-- Table structure for table `device_gallery`
--

CREATE TABLE `device_gallery` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device_gallery`
--

INSERT INTO `device_gallery` (`id`, `image`, `status`, `device_id`, `color_id`, `created_at`, `updated_at`) VALUES
(293, '/uploads/Devices/1717317217_1409.webp', 1, 113, NULL, '2024-06-02 08:33:38', '2024-06-02 08:33:38'),
(295, '/uploads/Devices/1717317969_6706.webp', 1, 114, NULL, '2024-06-02 08:46:10', '2024-06-02 08:46:10'),
(299, '/uploads/Devices/1717320558_2514.webp', 1, 117, NULL, '2024-06-02 09:29:18', '2024-06-02 09:29:18'),
(333, '/uploads/Devices/1717329787_6433.webp', 1, 145, NULL, '2024-06-02 12:03:07', '2024-06-02 12:03:07'),
(334, '/uploads/Devices/1717329787_1427.webp', 1, 145, NULL, '2024-06-02 12:03:08', '2024-06-02 12:03:08'),
(335, '/uploads/Devices/1717329788_6033.webp', 1, 145, NULL, '2024-06-02 12:03:09', '2024-06-02 12:03:09'),
(336, '/uploads/Devices/1717329789_2918.webp', 1, 145, NULL, '2024-06-02 12:03:09', '2024-06-02 12:03:09'),
(350, '/uploads/Devices/1717335608_8504.webp', 1, 115, NULL, '2024-06-02 13:40:09', '2024-06-02 13:40:09'),
(351, '/uploads/Devices/1717335671_2749.webp', 1, 118, NULL, '2024-06-02 13:41:12', '2024-06-02 13:41:12'),
(352, '/uploads/Devices/1717335730_2432.webp', 1, 119, NULL, '2024-06-02 13:42:10', '2024-06-02 13:42:10'),
(353, '/uploads/Devices/1717335730_5342.webp', 1, 119, NULL, '2024-06-02 13:42:10', '2024-06-02 13:42:10'),
(354, '/uploads/Devices/1717335898_8991.webp', 1, 121, NULL, '2024-06-02 13:44:58', '2024-06-02 13:44:58'),
(355, '/uploads/Devices/1717335898_3547.webp', 1, 121, NULL, '2024-06-02 13:44:59', '2024-06-02 13:44:59'),
(356, '/uploads/Devices/1717336038_4695.webp', 1, 122, NULL, '2024-06-02 13:47:19', '2024-06-02 13:47:19'),
(357, '/uploads/Devices/1717336122_3423.webp', 1, 123, NULL, '2024-06-02 13:48:42', '2024-06-02 13:48:42'),
(358, '/uploads/Devices/1717336248_5997.webp', 1, 124, NULL, '2024-06-02 13:50:48', '2024-06-02 13:50:48'),
(359, '/uploads/Devices/1717336314_2035.webp', 1, 125, NULL, '2024-06-02 13:51:54', '2024-06-02 13:51:54'),
(360, '/uploads/Devices/1717337404_9182.webp', 1, 116, NULL, '2024-06-02 14:10:04', '2024-06-02 14:10:04'),
(361, '/uploads/Devices/1717337442_4435.webp', 1, 120, NULL, '2024-06-02 14:10:42', '2024-06-02 14:10:42'),
(362, '/uploads/Devices/1717337513_2731.webp', 1, 127, NULL, '2024-06-02 14:11:53', '2024-06-02 14:11:53'),
(363, '/uploads/Devices/1717337550_6730.webp', 1, 128, NULL, '2024-06-02 14:12:30', '2024-06-02 14:12:30'),
(364, '/uploads/Devices/1717337585_6461.webp', 1, 129, NULL, '2024-06-02 14:13:05', '2024-06-02 14:13:05'),
(365, '/uploads/Devices/1717337632_2350.webp', 1, 130, NULL, '2024-06-02 14:13:52', '2024-06-02 14:13:52'),
(366, '/uploads/Devices/1717337657_9459.webp', 1, 131, NULL, '2024-06-02 14:14:18', '2024-06-02 14:14:18'),
(367, '/uploads/Devices/1717337690_4785.webp', 1, 132, NULL, '2024-06-02 14:14:50', '2024-06-02 14:14:50'),
(368, '/uploads/Devices/1717337719_8895.webp', 1, 133, NULL, '2024-06-02 14:15:19', '2024-06-02 14:15:19'),
(369, '/uploads/Devices/1717337758_4201.webp', 1, 134, NULL, '2024-06-02 14:15:58', '2024-06-02 14:15:58'),
(370, '/uploads/Devices/1717337787_1318.webp', 1, 135, NULL, '2024-06-02 14:16:27', '2024-06-02 14:16:27'),
(371, '/uploads/Devices/1717337828_6548.webp', 1, 136, NULL, '2024-06-02 14:17:08', '2024-06-02 14:17:08'),
(372, '/uploads/Devices/1717337880_2158.webp', 1, 137, NULL, '2024-06-02 14:18:00', '2024-06-02 14:18:00'),
(373, '/uploads/Devices/1717337906_8262.webp', 1, 138, NULL, '2024-06-02 14:18:27', '2024-06-02 14:18:27'),
(374, '/uploads/Devices/1717337939_6249.webp', 1, 140, NULL, '2024-06-02 14:18:59', '2024-06-02 14:18:59'),
(375, '/uploads/Devices/1717338081_4897.webp', 1, 158, NULL, '2024-06-02 14:21:21', '2024-06-02 14:21:21'),
(376, '/uploads/Devices/1717338081_5127.webp', 1, 158, NULL, '2024-06-02 14:21:21', '2024-06-02 14:21:21'),
(377, '/uploads/Devices/1717338081_9387.webp', 1, 158, NULL, '2024-06-02 14:21:21', '2024-06-02 14:21:21'),
(378, '/uploads/Devices/1717338081_6194.webp', 1, 158, NULL, '2024-06-02 14:21:22', '2024-06-02 14:21:22'),
(379, '/uploads/Devices/1717338082_1714.webp', 1, 158, NULL, '2024-06-02 14:21:22', '2024-06-02 14:21:22'),
(380, '/uploads/Devices/1717338082_1175.webp', 1, 158, NULL, '2024-06-02 14:21:22', '2024-06-02 14:21:22'),
(381, '/uploads/Devices/1717338082_7849.webp', 1, 158, NULL, '2024-06-02 14:21:22', '2024-06-02 14:21:22'),
(382, '/uploads/Devices/1717338161_8331.webp', 1, 157, NULL, '2024-06-02 14:22:41', '2024-06-02 14:22:41'),
(383, '/uploads/Devices/1717338161_3895.webp', 1, 157, NULL, '2024-06-02 14:22:41', '2024-06-02 14:22:41'),
(384, '/uploads/Devices/1717338161_3718.webp', 1, 157, NULL, '2024-06-02 14:22:41', '2024-06-02 14:22:41'),
(385, '/uploads/Devices/1717338241_4618.webp', 1, 156, NULL, '2024-06-02 14:24:01', '2024-06-02 14:24:01'),
(386, '/uploads/Devices/1717338241_8098.webp', 1, 156, NULL, '2024-06-02 14:24:02', '2024-06-02 14:24:02'),
(387, '/uploads/Devices/1717338242_4461.webp', 1, 156, NULL, '2024-06-02 14:24:02', '2024-06-02 14:24:02'),
(388, '/uploads/Devices/1717338242_6137.webp', 1, 156, NULL, '2024-06-02 14:24:02', '2024-06-02 14:24:02'),
(389, '/uploads/Devices/1717338258_1635.webp', 1, 155, NULL, '2024-06-02 14:24:18', '2024-06-02 14:24:18'),
(390, '/uploads/Devices/1717338258_4073.webp', 1, 155, NULL, '2024-06-02 14:24:18', '2024-06-02 14:24:18'),
(391, '/uploads/Devices/1717338258_1671.webp', 1, 155, NULL, '2024-06-02 14:24:18', '2024-06-02 14:24:18'),
(392, '/uploads/Devices/1717338258_4113.webp', 1, 155, NULL, '2024-06-02 14:24:18', '2024-06-02 14:24:18'),
(393, '/uploads/Devices/1717338340_9359.webp', 1, 154, NULL, '2024-06-02 14:25:40', '2024-06-02 14:25:40'),
(394, '/uploads/Devices/1717338340_2455.webp', 1, 154, NULL, '2024-06-02 14:25:40', '2024-06-02 14:25:40'),
(395, '/uploads/Devices/1717338340_7189.webp', 1, 154, NULL, '2024-06-02 14:25:40', '2024-06-02 14:25:40'),
(396, '/uploads/Devices/1717338340_8165.webp', 1, 154, NULL, '2024-06-02 14:25:40', '2024-06-02 14:25:40'),
(397, '/uploads/Devices/1717338400_5003.webp', 1, 153, NULL, '2024-06-02 14:26:40', '2024-06-02 14:26:40'),
(398, '/uploads/Devices/1717338400_1628.webp', 1, 153, NULL, '2024-06-02 14:26:41', '2024-06-02 14:26:41'),
(399, '/uploads/Devices/1717338401_8502.webp', 1, 153, NULL, '2024-06-02 14:26:41', '2024-06-02 14:26:41'),
(400, '/uploads/Devices/1717338401_4098.webp', 1, 153, NULL, '2024-06-02 14:26:41', '2024-06-02 14:26:41'),
(401, '/uploads/Devices/1717338490_9963.webp', 1, 152, NULL, '2024-06-02 14:28:10', '2024-06-02 14:28:10'),
(402, '/uploads/Devices/1717338490_3235.webp', 1, 152, NULL, '2024-06-02 14:28:10', '2024-06-02 14:28:10'),
(403, '/uploads/Devices/1717338490_4461.webp', 1, 152, NULL, '2024-06-02 14:28:11', '2024-06-02 14:28:11'),
(404, '/uploads/Devices/1717338491_2733.webp', 1, 152, NULL, '2024-06-02 14:28:11', '2024-06-02 14:28:11'),
(405, '/uploads/Devices/1717338513_5442.webp', 1, 151, NULL, '2024-06-02 14:28:33', '2024-06-02 14:28:33'),
(406, '/uploads/Devices/1717338513_6099.webp', 1, 151, NULL, '2024-06-02 14:28:33', '2024-06-02 14:28:33'),
(407, '/uploads/Devices/1717338513_5797.webp', 1, 151, NULL, '2024-06-02 14:28:33', '2024-06-02 14:28:33'),
(408, '/uploads/Devices/1717338513_7177.webp', 1, 151, NULL, '2024-06-02 14:28:33', '2024-06-02 14:28:33'),
(409, '/uploads/Devices/1717338563_9418.avif', 1, 150, NULL, '2024-06-02 14:29:23', '2024-06-02 14:29:23'),
(410, '/uploads/Devices/1717338563_7831.avif', 1, 150, NULL, '2024-06-02 14:29:23', '2024-06-02 14:29:23'),
(411, '/uploads/Devices/1717338563_1328.avif', 1, 150, NULL, '2024-06-02 14:29:23', '2024-06-02 14:29:23'),
(412, '/uploads/Devices/1717338563_6456.avif', 1, 150, NULL, '2024-06-02 14:29:23', '2024-06-02 14:29:23'),
(413, '/uploads/Devices/1717338646_3437.avif', 1, 149, NULL, '2024-06-02 14:30:46', '2024-06-02 14:30:46'),
(414, '/uploads/Devices/1717338646_4009.avif', 1, 149, NULL, '2024-06-02 14:30:46', '2024-06-02 14:30:46'),
(415, '/uploads/Devices/1717338646_9893.avif', 1, 149, NULL, '2024-06-02 14:30:46', '2024-06-02 14:30:46'),
(416, '/uploads/Devices/1717338646_2664.avif', 1, 149, NULL, '2024-06-02 14:30:46', '2024-06-02 14:30:46'),
(417, '/uploads/Devices/1717338726_4763.webp', 1, 148, NULL, '2024-06-02 14:32:06', '2024-06-02 14:32:06'),
(418, '/uploads/Devices/1717338726_6022.webp', 1, 148, NULL, '2024-06-02 14:32:06', '2024-06-02 14:32:06'),
(419, '/uploads/Devices/1717338726_1788.webp', 1, 148, NULL, '2024-06-02 14:32:06', '2024-06-02 14:32:06'),
(420, '/uploads/Devices/1717338726_3286.webp', 1, 148, NULL, '2024-06-02 14:32:06', '2024-06-02 14:32:06'),
(421, '/uploads/Devices/1717338726_2270.webp', 1, 148, NULL, '2024-06-02 14:32:06', '2024-06-02 14:32:06'),
(422, '/uploads/Devices/1717338808_4030.webp', 1, 142, NULL, '2024-06-02 14:33:28', '2024-06-02 14:33:28'),
(423, '/uploads/Devices/1717338808_5951.webp', 1, 142, NULL, '2024-06-02 14:33:28', '2024-06-02 14:33:28'),
(424, '/uploads/Devices/1717338808_9604.webp', 1, 142, NULL, '2024-06-02 14:33:28', '2024-06-02 14:33:28'),
(425, '/uploads/Devices/1717338808_4363.webp', 1, 142, NULL, '2024-06-02 14:33:28', '2024-06-02 14:33:28'),
(426, '/uploads/Devices/1717338808_3281.webp', 1, 142, NULL, '2024-06-02 14:33:28', '2024-06-02 14:33:28'),
(427, '/uploads/Devices/1717338925_9265.webp', 1, 126, NULL, '2024-06-02 14:35:25', '2024-06-02 14:35:25'),
(428, '/uploads/Devices/1717338925_5173.webp', 1, 126, NULL, '2024-06-02 14:35:25', '2024-06-02 14:35:25'),
(448, '/uploads/Devices/1717408300_4565.webp', 1, 170, 1, '2024-06-03 09:51:40', '2024-06-03 10:11:20'),
(449, '/uploads/Devices/1717408300_9998.webp', 1, 170, 1, '2024-06-03 09:51:40', '2024-06-03 10:11:20'),
(450, '/uploads/Devices/1717408300_7227.webp', 1, 170, 1, '2024-06-03 09:51:41', '2024-06-03 10:11:20'),
(451, '/uploads/Devices/1717408301_6048.webp', 1, 170, 1, '2024-06-03 09:51:41', '2024-06-03 10:11:20'),
(452, '/uploads/Devices/1717409080_5642.webp', 1, 171, 3, '2024-06-03 10:04:40', '2024-06-03 13:50:45'),
(453, '/uploads/Devices/1717409080_1048.webp', 1, 171, 3, '2024-06-03 10:04:40', '2024-06-03 13:50:45'),
(454, '/uploads/Devices/1717409080_1294.webp', 1, 171, 3, '2024-06-03 10:04:40', '2024-06-03 13:50:45'),
(455, '/uploads/Devices/1717409080_2444.webp', 1, 171, 3, '2024-06-03 10:04:40', '2024-06-03 13:50:45'),
(456, '/uploads/Devices/1717409357_4130.webp', 1, 172, 3, '2024-06-03 10:09:17', '2024-06-03 10:12:20'),
(457, '/uploads/Devices/1717409357_1259.webp', 1, 172, 3, '2024-06-03 10:09:17', '2024-06-03 10:12:20'),
(458, '/uploads/Devices/1717409357_8494.webp', 1, 172, 3, '2024-06-03 10:09:17', '2024-06-03 10:12:20'),
(459, '/uploads/Devices/1717409357_7980.webp', 1, 172, 3, '2024-06-03 10:09:17', '2024-06-03 10:12:20'),
(460, '/uploads/Devices/1717409357_7049.webp', 1, 172, 3, '2024-06-03 10:09:18', '2024-06-03 10:12:20'),
(461, '/uploads/Devices/1717413877_1545.webp', 1, 173, NULL, '2024-06-03 11:24:37', '2024-06-03 11:24:37'),
(462, '/uploads/Devices/1717413877_9303.webp', 1, 173, 3, '2024-06-03 11:24:37', '2024-06-03 11:26:33'),
(463, '/uploads/Devices/1717413983_2909.webp', 1, 173, 3, '2024-06-03 11:26:23', '2024-06-03 11:26:33'),
(464, '/uploads/Devices/1717414268_9805.webp', 1, 174, 2, '2024-06-03 11:31:08', '2024-06-03 11:31:49'),
(465, '/uploads/Devices/1717414268_5854.webp', 1, 174, 2, '2024-06-03 11:31:08', '2024-06-03 11:31:49'),
(466, '/uploads/Devices/1717415765_3609.webp', 1, 175, 1, '2024-06-03 11:56:05', '2024-06-03 12:01:10'),
(467, '/uploads/Devices/1717415765_9677.webp', 1, 175, 1, '2024-06-03 11:56:05', '2024-06-03 12:01:10'),
(468, '/uploads/Devices/1717415765_3130.webp', 1, 175, 1, '2024-06-03 11:56:05', '2024-06-03 12:01:10'),
(469, '/uploads/Devices/1717416190_6948.webp', 1, 176, 1, '2024-06-03 12:03:10', '2024-06-03 12:05:00'),
(470, '/uploads/Devices/1717416190_3104.webp', 1, 176, 1, '2024-06-03 12:03:10', '2024-06-03 12:05:00'),
(471, '/uploads/Devices/1717416190_7463.webp', 1, 176, 1, '2024-06-03 12:03:10', '2024-06-03 12:05:00'),
(472, '/uploads/Devices/1717416539_5257.webp', 1, 177, NULL, '2024-06-03 12:08:59', '2024-06-03 12:08:59'),
(473, '/uploads/Devices/1717416539_1925.webp', 1, 177, NULL, '2024-06-03 12:08:59', '2024-06-03 12:08:59'),
(474, '/uploads/Devices/1717416539_4996.webp', 1, 177, NULL, '2024-06-03 12:08:59', '2024-06-03 12:08:59'),
(475, '/uploads/Devices/1717416539_5504.webp', 1, 177, NULL, '2024-06-03 12:08:59', '2024-06-03 12:08:59'),
(476, '/uploads/Devices/1717422620_7958.webp', 1, 171, 2, '2024-06-03 13:50:20', '2024-06-03 13:50:32'),
(477, '/uploads/Devices/1717422620_4319.webp', 1, 171, 2, '2024-06-03 13:50:20', '2024-06-03 13:50:32'),
(478, '/uploads/Devices/1717422620_4128.webp', 1, 171, 2, '2024-06-03 13:50:20', '2024-06-03 13:50:32'),
(479, '/uploads/Devices/1717422685_3237.webp', 1, 171, 1, '2024-06-03 13:51:25', '2024-06-03 13:52:14'),
(480, '/uploads/Devices/1717422685_1376.webp', 1, 171, 1, '2024-06-03 13:51:26', '2024-06-03 13:52:14'),
(481, '/uploads/Devices/1717422686_5324.webp', 1, 171, NULL, '2024-06-03 13:51:26', '2024-06-03 13:51:26'),
(482, '/uploads/Devices/1717422734_1676.webp', 1, 171, NULL, '2024-06-03 13:52:14', '2024-06-03 13:52:14');

-- --------------------------------------------------------

--
-- Table structure for table `device_header`
--

CREATE TABLE `device_header` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `header` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device_header`
--

INSERT INTO `device_header` (`id`, `header`, `status`, `device_id`, `color_id`, `created_at`, `updated_at`) VALUES
(4, '/uploads/Devices/1717409480_8453.webp', 1, 170, 1, '2024-06-03 10:11:20', '2024-06-03 10:11:20'),
(5, '/uploads/Devices/1717422645_6489.webp', 1, 171, 3, '2024-06-03 10:11:41', '2024-06-03 13:50:45'),
(6, '/uploads/Devices/1717409540_4121.webp', 1, 172, 3, '2024-06-03 10:12:20', '2024-06-03 10:12:20'),
(7, '/uploads/Devices/1717413983_4454.webp', 1, 173, 3, '2024-06-03 11:26:23', '2024-06-03 11:26:23'),
(8, '/uploads/Devices/1717414309_9890.webp', 1, 174, 2, '2024-06-03 11:31:49', '2024-06-03 11:31:49'),
(9, '/uploads/Devices/1717416070_4561.webp', 1, 175, 1, '2024-06-03 12:01:10', '2024-06-03 12:01:10'),
(10, '/uploads/Devices/1717416300_9071.webp', 1, 176, 1, '2024-06-03 12:05:00', '2024-06-03 12:05:00'),
(11, '/uploads/Devices/1717422645_6489.webp', 1, 171, 1, '2024-06-03 13:50:20', '2024-06-03 13:50:45'),
(12, '/uploads/Devices/1717422645_6489.webp', 1, 171, 2, '2024-06-03 13:50:32', '2024-06-03 13:50:45');

-- --------------------------------------------------------

--
-- Table structure for table `device_item`
--

CREATE TABLE `device_item` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `os` bigint(20) UNSIGNED DEFAULT NULL,
  `size_id` bigint(20) UNSIGNED DEFAULT NULL,
  `processor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `memory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `storage_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(8,3) DEFAULT 0.000,
  `quantity` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device_item`
--

INSERT INTO `device_item` (`id`, `device_id`, `color_id`, `os`, `size_id`, `processor_id`, `memory_id`, `storage_id`, `price`, `quantity`, `created_at`, `updated_at`) VALUES
(74, 158, 2, 1, 2, 1, 2, 1, 500.000, 20, NULL, NULL),
(80, 170, 1, 1, 6, 1, 2, 1, 1329.990, 9, NULL, '2024-06-12 08:49:39'),
(84, 172, 3, 3, 2, 1, 2, 1, 247.000, -27, NULL, '2024-06-13 19:57:03'),
(86, 173, 3, 1, 2, 1, 1, 1, 20.000, 10, NULL, NULL),
(88, 174, 2, 1, 2, 1, 1, 1, 500.000, 4, NULL, NULL),
(90, 176, 1, 1, 2, 1, 5, 1, 1000.000, 10, NULL, NULL),
(113, 171, 3, 1, 2, 2, 2, 1, 200.000, -35, NULL, '2024-06-13 19:57:03'),
(114, 171, 1, 1, 6, 1, 4, 2, 420.000, 9, NULL, '2024-06-12 08:49:39'),
(115, 171, 2, 1, 4, 1, 3, 3, 230.000, 10, NULL, NULL),
(116, 175, 1, 1, 2, 1, 3, 3, NULL, NULL, NULL, NULL),
(117, 177, 1, 1, 6, 2, 3, 1, 350.000, 9, NULL, '2024-06-13 09:31:15');

-- --------------------------------------------------------

--
-- Table structure for table `device_specs`
--

CREATE TABLE `device_specs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `specs_id` bigint(20) UNSIGNED NOT NULL,
  `desc_ar` longtext DEFAULT NULL,
  `desc_en` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device_specs`
--

INSERT INTO `device_specs` (`id`, `status`, `device_id`, `specs_id`, `desc_ar`, `desc_en`, `created_at`, `updated_at`) VALUES
(211, 1, 171, 2, '1 Yrs DG Shield Plus & 1 Yr Extended Warranty. + BHD 111.163', '1 Yrs DG Shield Plus & 1 Yr Extended Warranty. + BHD 111.163', NULL, NULL),
(212, 1, 171, 4, '2 Yrs DG Display Plus', '2 Yrs DG Display Plus', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `device_types`
--

CREATE TABLE `device_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `device_id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `device_types`
--

INSERT INTO `device_types` (`id`, `device_id`, `type_id`, `created_at`, `updated_at`) VALUES
(8, 151, 1, NULL, NULL),
(9, 151, 2, NULL, NULL),
(11, 174, 1, NULL, NULL),
(12, 174, 2, NULL, NULL),
(13, 175, 1, NULL, NULL),
(14, 176, 1, NULL, NULL),
(15, 176, 2, NULL, NULL),
(16, 171, 1, NULL, NULL),
(17, 171, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_ar` varchar(255) DEFAULT NULL,
  `question_en` varchar(255) DEFAULT NULL,
  `answer_ar` text DEFAULT NULL,
  `answer_en` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `question_ar`, `question_en`, `answer_ar`, `answer_en`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nam dolor sequi incididunt nesciunt nihil placeat', 'Cillum cillum facere repellendus Ipsum doloremqu', 'Ipsa laboris optio modi alias molestiae minus ve', 'Et molestiae dolore nisi in adipisicing mollit ull', 1, '2023-10-09 14:55:40', '2023-10-09 14:55:40'),
(2, 'Nam enim qui facere saepe sit aliquip itaque expli', 'Voluptatum sequi repellendus Iure et et quas repr', 'Quis dolore cupidatat culpa commodo', 'Mollit perspiciatis nulla quasi labore esse nostr', 1, '2023-10-09 14:55:50', '2023-10-09 14:55:50'),
(3, 'التيستنج جيد', 'testing is good', 'نعم', 'yes', 1, '2023-12-12 08:34:19', '2023-12-12 08:34:19');

-- --------------------------------------------------------

--
-- Table structure for table `memories`
--

CREATE TABLE `memories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `memories`
--

INSERT INTO `memories` (`id`, `title_ar`, `title_en`, `status`, `created_at`, `updated_at`) VALUES
(1, '4 جيجابايت', '4 GB', 1, '2023-10-04 10:55:48', '2023-10-04 10:57:07'),
(2, '8 جيجابايت', '8 GB', 1, '2023-10-04 10:56:04', '2023-10-04 10:56:04'),
(3, '16 غيغابايت', '16 GB', 1, '2023-10-04 10:56:19', '2023-10-04 10:56:19'),
(4, '32 غيغابايت', '32 GB', 1, '2023-10-04 10:56:36', '2023-10-04 10:56:36'),
(5, '64 غيغابايت', '64 GB', 1, '2023-10-04 10:56:53', '2023-10-04 10:56:53');

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
(1, '2014_10_10_000000_create_countries_table', 1),
(2, '2014_10_11_000000_create_ads_table', 1),
(3, '2014_10_11_000000_create_services_table', 1),
(4, '2014_10_11_000000_create_sliders_table', 1),
(5, '2014_10_11_100517_create_blocks_table', 1),
(6, '2014_10_12_000000_create_admins_table', 1),
(7, '2014_10_12_000000_create_client_table', 1),
(8, '2015_04_18_084603_create_addresses_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2022_04_18_080645_create_settings_table', 1),
(11, '2022_04_18_084603_create_contacts_table', 1),
(12, '2022_04_18_084626_create_f_a_q_s_table', 1),
(13, '2022_04_19_100517_create_payments_table', 1),
(14, '2022_05_10_080339_create_categories_table', 1),
(15, '2022_05_10_080339_create_colors_table', 1),
(16, '2022_05_10_080339_create_deliveries_table', 1),
(17, '2022_05_10_080339_create_memories_table', 1),
(18, '2022_05_10_080339_create_os_table', 1),
(19, '2022_05_10_080339_create_processors_table', 1),
(20, '2022_05_10_080339_create_sizes_table', 1),
(21, '2022_05_10_080339_create_specs_table', 1),
(22, '2022_05_10_080339_create_storages_table', 1),
(23, '2022_06_14_080339_create_devices_table', 1),
(24, '2022_06_15_080340_create_branches_table', 1),
(25, '2022_06_30_113555_create_cart_table', 1),
(26, '2022_06_30_113555_create_wishlist_table', 1),
(27, '2023_01_01_080339_create_orders_table', 1),
(28, '2023_06_12_105345_create_permission_tables', 1),
(29, '2022_05_10_080339_create_brands_table', 2),
(30, '2022_05_10_080339_create_office_table', 3),
(31, '2022_05_10_080339_create_protection_table', 3),
(36, '2014_10_11_000000_create_coupons_table', 4),
(38, '2024_05_23_124242_add_allow_chat_column_to_clients_table', 5),
(41, '2024_05_23_152618_add_currency_id_column_to_orders_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `delivery_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `sub_total` decimal(9,3) NOT NULL DEFAULT 0.000,
  `discount` decimal(9,3) NOT NULL DEFAULT 0.000,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `vat` decimal(9,3) NOT NULL DEFAULT 0.000,
  `vat_percentage` int(11) NOT NULL DEFAULT 0,
  `coupon` decimal(9,3) NOT NULL DEFAULT 0.000,
  `coins_value` decimal(9,3) DEFAULT 0.000,
  `coupon_percentage` int(11) NOT NULL DEFAULT 0,
  `charge_cost` decimal(9,3) NOT NULL DEFAULT 0.000,
  `net_total` decimal(9,3) NOT NULL DEFAULT 0.000,
  `status` int(11) NOT NULL DEFAULT 0,
  `follow` int(11) NOT NULL DEFAULT 0,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `transaction_number`, `name`, `email`, `phone`, `delivery_id`, `client_id`, `address_id`, `branch_id`, `payment_id`, `sub_total`, `discount`, `discount_percentage`, `vat`, `vat_percentage`, `coupon`, `coins_value`, `coupon_percentage`, `charge_cost`, `net_total`, `status`, `follow`, `currency_id`, `created_at`, `updated_at`) VALUES
(24, NULL, NULL, NULL, NULL, 1, 27, 26, NULL, 1, 200.000, 0.000, 0, 20.000, 10, 0.000, 0.000, 0, 0.700, 220.700, 1, 2, NULL, '2024-04-24 04:40:10', '2024-04-24 04:42:52'),
(25, NULL, NULL, NULL, NULL, 1, 28, 27, NULL, 1, 200.000, 0.000, 0, 20.000, 10, 0.000, 0.000, 0, 0.700, 220.700, 0, 0, NULL, '2024-04-24 17:28:53', '2024-04-24 17:28:53'),
(59, NULL, NULL, NULL, NULL, 1, 27, 26, NULL, 1, 10000.000, 0.000, 0, 1000.000, 10, 0.000, 0.000, 0, 0.700, 11000.700, 0, 0, NULL, '2024-05-18 06:40:21', '2024-05-18 06:40:21'),
(60, NULL, NULL, NULL, NULL, 1, 27, 26, NULL, 1, 199.000, 0.000, 0, 19.900, 10, 0.000, 0.000, 0, 0.700, 219.600, 0, 0, NULL, '2024-05-18 06:47:18', '2024-05-18 06:47:18'),
(62, NULL, NULL, NULL, NULL, 1, 27, 26, NULL, 3, 200.000, 0.000, 0, 20.000, 10, 0.000, 0.000, 0, 0.700, 220.700, 5, 0, NULL, '2024-05-19 12:17:05', '2024-05-19 12:17:05'),
(63, NULL, NULL, NULL, NULL, 1, 59, 52, NULL, 1, 200.000, 0.000, 0, 20.000, 10, 0.000, 0.000, 0, 0.800, 220.800, 0, 0, 1, '2024-05-23 12:40:49', '2024-05-23 12:40:49'),
(64, NULL, NULL, NULL, NULL, 1, 59, 52, NULL, 1, 449.000, 0.000, 0, 44.900, 10, 0.000, 0.000, 0, 0.800, 494.700, 0, 0, 1, '2024-05-23 12:45:20', '2024-05-23 12:45:20'),
(65, NULL, NULL, NULL, NULL, 1, 59, 52, NULL, 1, 530.000, 0.000, 0, 53.000, 10, 10.000, 0.000, 0, 0.800, 53.800, 0, 0, 4, '2024-05-28 11:20:36', '2024-05-28 11:20:36'),
(66, NULL, NULL, NULL, NULL, 1, 59, 69, NULL, 1, 30.000, 0.000, 0, 3.000, 10, 0.000, 4.000, 0, 0.700, 29.700, 0, 0, 2, '2024-06-01 20:15:53', '2024-06-01 20:15:53'),
(67, NULL, NULL, NULL, NULL, 1, 59, 52, NULL, 4, 450.000, 0.000, 0, 45.000, 10, 0.000, 4.000, 0, 0.800, 491.800, 5, 0, 1, '2024-06-05 09:50:30', '2024-06-05 09:50:30'),
(68, NULL, NULL, NULL, NULL, 1, 59, 71, NULL, 1, 450.000, 0.000, 0, 45.000, 10, 0.000, 4.000, 0, 0.700, 491.700, 0, 0, 1, '2024-06-05 09:51:00', '2024-06-05 09:51:00'),
(69, NULL, NULL, NULL, NULL, 1, 27, 26, NULL, 1, 620.000, 0.000, 0, 62.000, 10, 10.000, 0.000, 0, 0.700, 619.460, 0, 0, 3, '2024-06-11 14:39:46', '2024-06-11 14:39:46'),
(70, NULL, NULL, NULL, NULL, 1, 59, 52, NULL, 1, 2199.990, 0.000, 0, 219.999, 10, 0.000, 4.000, 0, 0.800, 2416.789, 0, 0, 1, '2024-06-12 08:49:39', '2024-06-12 08:49:39'),
(86, NULL, NULL, NULL, NULL, 1, 59, 52, NULL, 1, 447.000, 0.000, 0, 44.700, 10, 0.000, 4.000, 0, 0.800, 488.500, 0, 0, 1, '2024-06-12 17:04:26', '2024-06-12 17:04:26'),
(105, NULL, NULL, NULL, NULL, 1, 62, 78, NULL, 1, 447.000, 0.000, 0, 44.700, 10, 0.000, 4.000, 0, 0.700, 488.400, 0, 0, 1, '2024-06-12 18:38:31', '2024-06-12 18:38:31'),
(106, NULL, NULL, NULL, NULL, 1, 62, 78, NULL, 1, 447.000, 0.000, 0, 44.700, 10, 0.000, 4.000, 0, 0.700, 488.400, 0, 0, 1, '2024-06-12 18:39:22', '2024-06-12 18:39:22'),
(107, NULL, NULL, NULL, NULL, 1, 27, 26, NULL, 1, 247.000, 0.000, 0, 24.700, 10, 0.000, 0.000, 0, 0.700, 272.400, 0, 0, 1, '2024-06-13 08:11:40', '2024-06-13 08:11:40'),
(108, NULL, NULL, NULL, NULL, 1, 27, 26, NULL, 1, 350.000, 0.000, 0, 35.000, 10, 0.000, 0.000, 0, 0.700, 385.700, 0, 0, 1, '2024-06-13 09:31:15', '2024-06-13 09:31:15'),
(109, NULL, NULL, NULL, NULL, 1, 62, 78, NULL, 1, 507.000, 0.000, 0, 50.700, 10, 0.000, 4.000, 0, 0.700, 554.400, 0, 0, 1, '2024-06-13 12:04:09', '2024-06-13 12:04:09'),
(110, NULL, NULL, NULL, NULL, 1, 62, 78, NULL, 1, 240.000, 0.000, 0, 24.000, 10, 0.000, 4.000, 0, 0.700, 260.700, 0, 0, 1, '2024-06-13 12:09:38', '2024-06-13 12:09:38'),
(111, NULL, NULL, NULL, NULL, 1, 62, 78, NULL, 1, 500.000, 0.000, 0, 50.000, 10, 0.000, 4.000, 0, 0.700, 546.700, 0, 0, 1, '2024-06-13 12:11:26', '2024-06-13 12:11:26'),
(112, NULL, NULL, NULL, NULL, 1, 62, 78, NULL, 1, 500.000, 0.000, 0, 50.000, 10, 0.000, 4.000, 0, 0.700, 546.700, 0, 0, 1, '2024-06-13 13:06:31', '2024-06-13 13:06:31'),
(113, NULL, NULL, NULL, NULL, 1, 62, 78, NULL, 1, 440.000, 0.000, 0, 44.000, 10, 0.000, 4.000, 0, 0.700, 480.700, 0, 0, 1, '2024-06-13 13:08:25', '2024-06-13 13:08:25'),
(114, NULL, NULL, NULL, NULL, 1, 62, 78, NULL, 1, 440.000, 0.000, 0, 44.000, 10, 0.000, 4.000, 0, 0.700, 480.700, 0, 0, 1, '2024-06-13 13:09:10', '2024-06-13 13:09:10'),
(115, NULL, NULL, NULL, NULL, 1, 62, 78, NULL, 1, 440.000, 0.000, 0, 44.000, 10, 0.000, 4.000, 0, 0.700, 480.700, 0, 0, 1, '2024-06-13 13:09:59', '2024-06-13 13:09:59'),
(116, NULL, NULL, NULL, NULL, 1, 62, 78, NULL, 1, 500.000, 0.000, 0, 50.000, 10, 0.000, 4.000, 0, 0.700, 546.700, 0, 0, 1, '2024-06-13 13:11:13', '2024-06-13 13:11:13'),
(117, NULL, NULL, NULL, NULL, 1, 62, 78, NULL, 1, 500.000, 0.000, 0, 50.000, 10, 0.000, 4.000, 0, 0.700, 546.700, 0, 0, 1, '2024-06-13 19:45:14', '2024-06-13 19:45:14'),
(118, NULL, NULL, NULL, NULL, 1, 62, 78, NULL, 1, 500.000, 0.000, 0, 50.000, 10, 0.000, 4.000, 0, 0.700, 546.700, 0, 0, 1, '2024-06-13 19:57:03', '2024-06-13 19:57:03');

-- --------------------------------------------------------

--
-- Table structure for table `order_device`
--

CREATE TABLE `order_device` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `device_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `office_id` bigint(20) UNSIGNED DEFAULT NULL,
  `protection_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(8,3) DEFAULT NULL,
  `quantity` smallint(6) NOT NULL,
  `total` decimal(9,3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_device`
--

INSERT INTO `order_device` (`id`, `order_id`, `device_id`, `item_id`, `color_id`, `office_id`, `protection_id`, `price`, `quantity`, `total`, `created_at`, `updated_at`) VALUES
(105, 67, 113, NULL, NULL, NULL, NULL, 450.000, 1, 450.000, NULL, NULL),
(106, 68, 113, NULL, NULL, NULL, NULL, 450.000, 1, 450.000, NULL, NULL),
(107, 69, 145, NULL, NULL, NULL, NULL, 373.000, 1, 373.000, NULL, NULL),
(108, 69, 172, NULL, NULL, NULL, NULL, 247.000, 1, 247.000, NULL, NULL),
(109, 70, 113, NULL, NULL, NULL, NULL, 450.000, 1, 450.000, NULL, NULL),
(110, 70, 171, 114, 1, NULL, NULL, 420.000, 1, 420.000, NULL, NULL),
(111, 70, 170, NULL, NULL, NULL, NULL, 1329.990, 1, 1329.990, NULL, NULL),
(142, 86, 171, 113, 3, NULL, NULL, 200.000, 1, 200.000, NULL, NULL),
(143, 86, 172, NULL, NULL, NULL, NULL, 247.000, 1, 247.000, NULL, NULL),
(178, 105, 171, 113, 3, NULL, NULL, 200.000, 1, 200.000, NULL, NULL),
(179, 105, 172, NULL, NULL, NULL, NULL, 247.000, 1, 247.000, NULL, NULL),
(180, 106, 171, 113, 3, NULL, NULL, 200.000, 1, 200.000, NULL, NULL),
(181, 106, 172, NULL, NULL, NULL, NULL, 247.000, 1, 247.000, NULL, NULL),
(182, 107, 172, NULL, NULL, NULL, NULL, 247.000, 1, 247.000, NULL, NULL),
(183, 108, 177, 117, 1, NULL, NULL, 350.000, 1, 350.000, NULL, NULL),
(184, 109, 171, 113, 3, NULL, NULL, 200.000, 1, 200.000, NULL, NULL),
(185, 109, 172, NULL, NULL, NULL, NULL, 247.000, 1, 247.000, NULL, NULL),
(186, 110, 171, 113, 3, NULL, NULL, 200.000, 1, 200.000, NULL, NULL),
(187, 110, 172, NULL, NULL, NULL, NULL, 247.000, 1, 247.000, NULL, NULL),
(188, 111, 171, 113, 3, NULL, NULL, 200.000, 1, 200.000, NULL, NULL),
(189, 111, 172, NULL, NULL, NULL, NULL, 247.000, 1, 247.000, NULL, NULL),
(190, 112, 171, 113, 3, NULL, NULL, 200.000, 1, 200.000, NULL, NULL),
(191, 112, 172, NULL, NULL, NULL, NULL, 247.000, 1, 247.000, NULL, NULL),
(192, 113, 171, 113, 3, NULL, NULL, 200.000, 1, 200.000, NULL, NULL),
(193, 113, 172, NULL, NULL, NULL, NULL, 247.000, 1, 247.000, NULL, NULL),
(194, 114, 171, 113, 3, NULL, NULL, 200.000, 1, 200.000, NULL, NULL),
(195, 114, 172, NULL, NULL, NULL, NULL, 247.000, 1, 247.000, NULL, NULL),
(196, 115, 171, 113, 3, NULL, NULL, 200.000, 1, 200.000, NULL, NULL),
(197, 115, 172, NULL, NULL, NULL, NULL, 247.000, 1, 247.000, NULL, NULL),
(198, 116, 171, 113, 3, NULL, NULL, 200.000, 1, 200.000, NULL, NULL),
(199, 116, 172, NULL, NULL, NULL, NULL, 247.000, 1, 247.000, NULL, NULL),
(200, 117, 171, 113, 3, NULL, NULL, 200.000, 1, 200.000, NULL, NULL),
(201, 117, 172, NULL, NULL, NULL, NULL, 247.000, 1, 247.000, NULL, NULL),
(202, 118, 171, 113, 3, NULL, NULL, 200.000, 1, 200.000, NULL, NULL),
(203, 118, 172, NULL, NULL, NULL, NULL, 247.000, 1, 247.000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `os`
--

CREATE TABLE `os` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `os`
--

INSERT INTO `os` (`id`, `title_ar`, `title_en`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ويندوز 11', 'Windows 11', '', 1, '2023-06-15 09:00:00', '2023-06-15 09:00:00'),
(2, 'لينكس أوبونتو', 'linux ubuntu', '', 1, '2023-06-15 09:00:17', '2023-06-15 09:00:17'),
(3, 'ماكنتوش', 'MacOs', '', 1, '2023-06-15 09:00:48', '2023-06-15 09:00:48');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tap_src` varchar(255) DEFAULT NULL,
  `title_ar` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `tap_src`, `title_ar`, `title_en`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'كاش', 'Cash', '/uploads/Payments/1696421010_7744.webp', 1, '2021-06-02 00:48:55', '2023-10-04 11:03:30'),
(2, 'src_bh.benefit', 'بطاقة الصراف الآلي', 'Debit Card', '/uploads/Payments/1696421025_7142.webp', 1, '2021-06-02 00:48:55', '2023-10-04 11:03:46'),
(3, 'src_card', 'بطاقة الإئتمان', 'Credit Card', '/uploads/Payments/1696421039_8251.webp', 1, '2021-06-02 00:48:55', '2023-10-04 11:04:00'),
(4, 'src_bh.benefit', 'بنفت باي', 'Benefit Pay', '/uploads/Payments/1696421052_5186.webp', 1, '2021-06-02 00:48:55', '2023-10-04 11:04:12'),
(5, 'src_apple_pay', 'أبل باي', 'Apple Pay', '/uploads/Payments/1696421069_3221.webp', 1, '2021-06-02 00:48:55', '2023-10-04 11:04:29'),
(6, '', 'المحفظة', 'Wallet', '/uploads/Payments/1714815686_6332.webp', 1, '2021-06-02 00:48:55', '2024-05-04 09:41:26');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `title_ar`, `title_en`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin-list', 'admin list', 'admin list', 'admin', '2023-06-12 09:24:20', '2023-06-13 07:35:13'),
(2, 'admin-create', 'admin create', 'admin create', 'admin', '2023-06-12 09:24:20', '2023-06-12 09:24:20'),
(3, 'admin-edit', 'admin edit', 'admin edit', 'admin', '2023-06-12 09:24:20', '2023-06-12 09:24:20'),
(4, 'admin-delete', 'admin delete', 'admin delete', 'admin', '2023-06-12 09:24:20', '2023-06-12 09:24:20'),
(5, 'client-list', 'client list', 'client list', 'admin', '2023-06-12 09:24:27', '2023-06-12 09:24:27'),
(6, 'client-create', 'client create', 'client create', 'admin', '2023-06-12 09:24:27', '2023-06-12 09:24:27'),
(7, 'client-edit', 'client edit', 'client edit', 'admin', '2023-06-12 09:24:27', '2023-06-12 09:24:27'),
(8, 'client-delete', 'client delete', 'client delete', 'admin', '2023-06-12 09:24:27', '2023-06-12 09:24:27'),
(9, 'country-list', 'country list', 'country list', 'admin', '2023-06-12 09:24:32', '2023-06-12 09:24:32'),
(10, 'country-create', 'country create', 'country create', 'admin', '2023-06-12 09:24:32', '2023-06-12 09:24:32'),
(11, 'country-edit', 'country edit', 'country edit', 'admin', '2023-06-12 09:24:32', '2023-06-12 09:24:32'),
(12, 'country-delete', 'country delete', 'country delete', 'admin', '2023-06-12 09:24:32', '2023-06-12 09:24:32'),
(13, 'region-list', 'region list', 'region list', 'admin', '2023-06-12 09:24:38', '2023-06-12 09:24:38'),
(14, 'region-create', 'region create', 'region create', 'admin', '2023-06-12 09:24:38', '2023-06-12 09:24:38'),
(15, 'region-edit', 'region edit', 'region edit', 'admin', '2023-06-12 09:24:38', '2023-06-12 09:24:38'),
(16, 'region-delete', 'region delete', 'region delete', 'admin', '2023-06-12 09:24:38', '2023-06-12 09:24:38'),
(17, 'category-list', 'category list', 'category list', 'admin', '2023-06-12 09:24:46', '2023-06-12 09:24:46'),
(18, 'category-create', 'category create', 'category create', 'admin', '2023-06-12 09:24:46', '2023-06-12 09:24:46'),
(19, 'category-edit', 'category edit', 'category edit', 'admin', '2023-06-12 09:24:46', '2023-06-12 09:24:46'),
(20, 'category-delete', 'category delete', 'category delete', 'admin', '2023-06-12 09:24:46', '2023-06-12 09:24:46'),
(21, 'setting-list', 'setting list', 'setting list', 'admin', '2023-06-12 09:24:54', '2023-06-12 09:24:54'),
(22, 'setting-create', 'setting create', 'setting create', 'admin', '2023-06-12 09:24:54', '2023-06-12 09:24:54'),
(23, 'setting-edit', 'setting edit', 'setting edit', 'admin', '2023-06-12 09:24:54', '2023-06-12 09:24:54'),
(24, 'setting-delete', 'setting delete', 'setting delete', 'admin', '2023-06-12 09:24:54', '2023-06-12 09:24:54'),
(25, 'faq-list', 'faq list', 'faq list', 'admin', '2023-06-12 09:25:01', '2023-06-12 09:25:01'),
(26, 'faq-create', 'faq create', 'faq create', 'admin', '2023-06-12 09:25:01', '2023-06-12 09:25:01'),
(27, 'faq-edit', 'faq edit', 'faq edit', 'admin', '2023-06-12 09:25:01', '2023-06-12 09:25:01'),
(28, 'faq-delete', 'faq delete', 'faq delete', 'admin', '2023-06-12 09:25:01', '2023-06-12 09:25:01'),
(29, 'payment-list', 'payment list', 'payment list', 'admin', '2023-06-12 09:25:07', '2023-06-12 09:25:07'),
(30, 'payment-create', 'payment create', 'payment create', 'admin', '2023-06-12 09:25:07', '2023-06-12 09:25:07'),
(31, 'payment-edit', 'payment edit', 'payment edit', 'admin', '2023-06-12 09:25:07', '2023-06-12 09:25:07'),
(32, 'payment-delete', 'payment delete', 'payment delete', 'admin', '2023-06-12 09:25:07', '2023-06-12 09:25:07');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `processors`
--

CREATE TABLE `processors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `processors`
--

INSERT INTO `processors` (`id`, `title_ar`, `title_en`, `status`, `created_at`, `updated_at`) VALUES
(1, 'معالج Intel® Core ™ i5 من الجيل الثاني عشر', '12th Gen Intel® Core™ i5', 1, '2023-06-13 09:12:58', '2023-06-13 09:12:58'),
(2, 'معالج Intel® Core ™ i7 من الجيل الثاني عشر', '12th Gen Intel® Core™ i7', 1, '2023-06-13 09:13:15', '2023-06-13 09:13:38');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title_ar` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delivery_cost` double(8,2) NOT NULL DEFAULT 1.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `country_id`, `title_ar`, `title_en`, `lat`, `long`, `status`, `delivery_cost`, `created_at`, `updated_at`) VALUES
(295, 1, 'العكر', ' Al Eker', NULL, NULL, 1, 0.80, NULL, NULL),
(296, 1, 'القدم', 'Al Qadam', NULL, NULL, 1, 0.70, NULL, NULL),
(297, 1, 'القرية', 'Quraiyah', NULL, NULL, 1, 0.70, NULL, NULL),
(298, 1, 'القضيبية', 'Qudaibiya', NULL, NULL, 1, 0.70, NULL, NULL),
(299, 1, 'قلالي', 'Qalali', NULL, NULL, 1, 0.70, NULL, NULL),
(300, 1, 'القلعة', 'Al Qalah', NULL, NULL, 1, 0.70, NULL, NULL),
(301, 1, 'كرانة', 'Karranah', NULL, NULL, 1, 0.70, NULL, NULL),
(302, 1, 'الحجر', 'Al Hajar', NULL, NULL, 1, 0.70, NULL, NULL),
(303, 1, 'كرباباد', 'Karbabad', NULL, NULL, 1, 0.70, NULL, NULL),
(304, 1, 'كرزكان', 'Karzakan', NULL, NULL, 1, 0.70, NULL, NULL),
(305, 1, 'الماحوز', 'Mahooz', NULL, NULL, 1, 0.70, NULL, NULL),
(306, 1, 'المالكية', 'Malkiah', NULL, NULL, 1, 0.70, NULL, NULL),
(307, 1, 'مدينة حمد من دوار 1 إلى دوار 10', 'Madinat Hamad From R 1 to R 10', NULL, NULL, 1, 0.70, NULL, NULL),
(308, 1, 'مدينة زايد', 'Zayed Town', NULL, NULL, 1, 0.70, NULL, NULL),
(309, 1, 'مدينة عيسي', 'Isa Town', NULL, NULL, 1, 0.70, NULL, NULL),
(310, 1, 'المحرق', 'Al Muharraq', NULL, NULL, 1, 0.70, NULL, NULL),
(311, 1, 'مقابة', 'Maqabah', NULL, NULL, 1, 0.70, NULL, NULL),
(312, 1, 'المقشع', 'Al Maqsha', NULL, NULL, 1, 0.70, NULL, NULL),
(313, 1, 'المنامة', 'Manama', NULL, NULL, 1, 0.70, NULL, NULL),
(314, 1, 'النبيه صالح', 'Nabih Saleh', NULL, NULL, 1, 0.70, NULL, NULL),
(315, 1, 'النعيم', 'Alnaim', NULL, NULL, 1, 0.70, NULL, NULL),
(316, 1, 'النويدرات', 'Nuwaidrat', NULL, NULL, 1, 0.70, NULL, NULL),
(317, 1, 'الهملة', 'Al Hamala', NULL, NULL, 1, 0.70, NULL, NULL),
(318, 1, 'البلاد القديم', 'Bilad Al Qadeem', NULL, NULL, 1, 0.70, NULL, NULL),
(319, 1, 'الكورة', 'Kawarah', NULL, NULL, 1, 0.70, NULL, NULL),
(320, 1, 'سلماباد', 'Salmabad', NULL, NULL, 1, 0.70, NULL, NULL),
(321, 1, 'أبو صيبع', 'Abu Saiba', NULL, NULL, 1, 0.70, NULL, NULL),
(322, 1, 'أبوقوة', 'Bu Quwah', NULL, NULL, 1, 0.70, NULL, NULL),
(323, 1, 'أم الحصم', 'Umm Al Hassam', NULL, NULL, 1, 0.70, NULL, NULL),
(324, 1, 'المصلي', 'Al Musalla', NULL, NULL, 1, 0.70, NULL, NULL),
(325, 1, 'توبلي', 'Tubli', NULL, NULL, 1, 0.70, NULL, NULL),
(326, 1, 'باربار', 'Barbar', NULL, NULL, 1, 0.70, NULL, NULL),
(327, 1, 'البديع', 'Budaiya', NULL, NULL, 1, 0.70, NULL, NULL),
(328, 1, 'البسيتين', 'Busaiten', NULL, NULL, 1, 0.70, NULL, NULL),
(329, 1, 'بوكوارة', 'Bu Kowarah', NULL, NULL, 1, 0.70, NULL, NULL),
(330, 1, 'البحير', 'Al Bahair', NULL, NULL, 1, 0.70, NULL, NULL),
(331, 1, 'بني جمرة', 'Bani Jamra', NULL, NULL, 1, 0.70, NULL, NULL),
(332, 1, 'بوري', 'Buri', NULL, NULL, 1, 0.70, NULL, NULL),
(333, 1, 'جبلة حبشي', 'Jeblat Hebshi', NULL, NULL, 1, 0.70, NULL, NULL),
(334, 1, 'جد الحاج', 'Jid Al Haj', NULL, NULL, 1, 0.70, NULL, NULL),
(335, 1, 'جد حفص', 'Jidhafs', NULL, NULL, 1, 0.70, NULL, NULL),
(336, 1, 'جد علي', 'Jid Ali', NULL, NULL, 1, 0.70, NULL, NULL),
(337, 1, 'جرداب', 'Jurdab', NULL, NULL, 1, 0.70, NULL, NULL),
(338, 1, 'الجسرة', 'Aljasrah', NULL, NULL, 1, 0.70, NULL, NULL),
(339, 1, 'الجفير', 'AlJuffair', NULL, NULL, 1, 0.70, NULL, NULL),
(340, 1, 'الجنبية', 'ُEljanabiya', NULL, NULL, 1, 0.70, NULL, NULL),
(341, 1, 'جنوسان', 'Jannusan', NULL, NULL, 1, 0.70, NULL, NULL),
(342, 1, 'جو', 'Jaw', NULL, NULL, 1, 0.70, NULL, NULL),
(343, 1, 'الحد', 'AL Hidd', NULL, NULL, 1, 0.70, NULL, NULL),
(344, 1, 'الحجيات', 'Alhajiyat', NULL, NULL, 1, 0.70, NULL, NULL),
(345, 1, 'حلة العبد الصالح', 'Hillat Abdul Saleh', NULL, NULL, 1, 0.70, NULL, NULL),
(346, 1, 'الحورة', 'Al Hoora', NULL, NULL, 1, 0.70, NULL, NULL),
(347, 1, 'الخميس', 'Khamis', NULL, NULL, 1, 0.70, NULL, NULL),
(348, 1, 'دار كليب', 'Dar Kulaib', NULL, NULL, 1, 0.70, NULL, NULL),
(349, 1, 'المنطقة الدبلوماسية', 'Diplomatic Area', NULL, NULL, 1, 0.70, NULL, NULL),
(350, 1, 'الدراز', 'Diraz', NULL, NULL, 1, 0.70, NULL, NULL),
(351, 1, 'دمستان', 'Dimstan', NULL, NULL, 1, 0.70, NULL, NULL),
(352, 1, 'الدير', 'Aldair', NULL, NULL, 1, 0.70, NULL, NULL),
(353, 1, 'الديه', 'Daih', NULL, NULL, 1, 0.70, NULL, NULL),
(354, 1, 'رأس رمان', 'Ras Rumman', NULL, NULL, 1, 0.70, NULL, NULL),
(355, 1, 'الرفاع(الشرقي)', 'East Riffa', NULL, NULL, 1, 0.70, NULL, NULL),
(356, 1, 'الرفاع(الغربي)', 'West Riffa', NULL, NULL, 1, 0.70, NULL, NULL),
(357, 1, 'الزلاق', 'Al zallaq', NULL, NULL, 1, 0.70, NULL, NULL),
(358, 1, 'الزنج', 'Zinj', NULL, NULL, 1, 0.70, NULL, NULL),
(359, 1, 'السقيه', 'AL SAGYAH', NULL, NULL, 1, 0.70, NULL, NULL),
(360, 1, 'سار', 'Saar', NULL, NULL, 1, 0.70, NULL, NULL),
(361, 1, 'سترة', 'sitra', NULL, NULL, 1, 0.70, NULL, NULL),
(362, 1, 'سماهيج', 'Samahej', NULL, NULL, 1, 0.70, NULL, NULL),
(363, 1, 'السنابس', 'Sanabis', NULL, NULL, 1, 0.70, NULL, NULL),
(364, 1, 'سند', 'Sanad', NULL, NULL, 1, 0.70, NULL, NULL),
(365, 1, 'السهلة(الشمالية والجنوبية)', 'Sehla', NULL, NULL, 1, 0.70, NULL, NULL),
(366, 1, 'ضاحية السيف', 'seef', NULL, NULL, 1, 0.70, NULL, NULL),
(367, 1, 'الشاخورة', 'Shakhurah', NULL, NULL, 1, 0.70, NULL, NULL),
(368, 1, 'شهركان', 'Sharakan', NULL, NULL, 1, 0.70, NULL, NULL),
(369, 1, 'جامعة البحرين ', 'university of bahrain', NULL, NULL, 1, 0.70, NULL, NULL),
(370, 1, 'الصالحيه', 'Salihiya', NULL, NULL, 1, 0.70, NULL, NULL),
(371, 1, 'صدد', 'Sadad', NULL, NULL, 1, 0.70, NULL, NULL),
(372, 1, 'عالي', 'Aali', NULL, NULL, 1, 0.70, NULL, NULL),
(373, 1, 'العدلية', 'Adliya', NULL, NULL, 1, 0.70, NULL, NULL),
(374, 1, 'عذاري', 'AZARY', NULL, NULL, 1, 0.70, NULL, NULL),
(375, 1, 'عراد', 'Arad', NULL, NULL, 1, 0.70, NULL, NULL),
(376, 1, 'عسكر', 'askr', NULL, NULL, 1, 0.70, NULL, NULL),
(377, 1, 'مدينة حمد من دوار 11 إلى دوار 22', 'Madinat Hamad From R 11 to R 22', NULL, NULL, 1, 0.70, NULL, NULL),
(378, 1, 'اللوزي', 'Al lozy', NULL, NULL, 1, 0.70, NULL, NULL),
(379, 1, 'المرخ', 'Al Markh', NULL, NULL, 1, 0.70, NULL, NULL),
(380, 1, 'مدينة سلمان', 'Salman City', NULL, NULL, 1, 0.70, NULL, NULL),
(381, 1, 'تيست', 'Test', NULL, NULL, 1, 0.70, NULL, NULL),
(382, 1, 'القفول', 'Algufool', NULL, NULL, 1, 0.70, NULL, NULL),
(383, 1, 'المعامير', 'Maameer', NULL, NULL, 1, 0.70, NULL, NULL),
(384, 2, 'تبوك', 'Tabuk', NULL, NULL, 1, 25.00, NULL, NULL),
(385, 2, 'الرياض', 'Riyadh', NULL, NULL, 1, 25.00, NULL, NULL),
(386, 2, 'الطائف', 'At Taif', NULL, NULL, 1, 25.00, NULL, NULL),
(387, 2, 'مكة المكرمة', 'Makkah Al Mukarramah', NULL, NULL, 1, 25.00, NULL, NULL),
(388, 2, 'حائل', 'Hail', NULL, NULL, 1, 25.00, NULL, NULL),
(389, 2, 'بريدة', 'Buraydah', NULL, NULL, 1, 25.00, NULL, NULL),
(390, 2, 'الهفوف', 'Al Hufuf', NULL, NULL, 1, 25.00, NULL, NULL),
(391, 2, 'الدمام', 'Ad Dammam', NULL, NULL, 1, 15.00, NULL, NULL),
(392, 2, 'المدينة المنورة', 'Al Madinah Al Munawwarah', NULL, NULL, 1, 25.00, NULL, NULL),
(393, 2, 'ابها', 'Abha', NULL, NULL, 1, 25.00, NULL, NULL),
(394, 2, 'جازان', 'Jazan', NULL, NULL, 1, 25.00, NULL, NULL),
(395, 2, 'جدة', 'Jeddah', NULL, NULL, 1, 25.00, NULL, NULL),
(396, 2, 'المجمعة', 'Al Majmaah', NULL, NULL, 1, 25.00, NULL, NULL),
(397, 2, 'الخبر', 'Al Khubar', NULL, NULL, 1, 25.00, NULL, NULL),
(398, 2, 'حفر الباطن', 'Hafar Al Batin', NULL, NULL, 1, 25.00, NULL, NULL),
(399, 2, 'خميس مشيط', 'Khamis Mushayt', NULL, NULL, 1, 25.00, NULL, NULL),
(400, 2, 'احد رفيده', 'Ahad Rifaydah', NULL, NULL, 1, 25.00, NULL, NULL),
(401, 2, 'القطيف', 'Al Qatif', NULL, NULL, 1, 25.00, NULL, NULL),
(402, 2, 'عنيزة', 'Unayzah', NULL, NULL, 1, 25.00, NULL, NULL),
(403, 2, 'قرية العليا', 'Qaryat Al Ulya', NULL, NULL, 1, 25.00, NULL, NULL),
(404, 2, 'الجبيل', 'Al Jubail', NULL, NULL, 1, 25.00, NULL, NULL),
(405, 2, 'النعيرية', 'An Nuayriyah', NULL, NULL, 1, 25.00, NULL, NULL),
(406, 2, 'الظهران', 'Dhahran', NULL, NULL, 1, 25.00, NULL, NULL),
(407, 2, 'الوجه', 'Al Wajh', NULL, NULL, 1, 25.00, NULL, NULL),
(408, 2, 'بقيق', 'Buqayq', NULL, NULL, 1, 25.00, NULL, NULL),
(409, 2, 'الزلفي', 'Az Zulfi', NULL, NULL, 1, 25.00, NULL, NULL),
(410, 2, 'خيبر', 'Khaybar', NULL, NULL, 1, 25.00, NULL, NULL),
(411, 2, 'الغاط', 'Al Ghat', NULL, NULL, 1, 25.00, NULL, NULL),
(412, 2, 'املج', 'Umluj', NULL, NULL, 1, 25.00, NULL, NULL),
(413, 2, 'رابغ', 'Rabigh', NULL, NULL, 1, 25.00, NULL, NULL),
(414, 2, 'عفيف', 'Afif', NULL, NULL, 1, 25.00, NULL, NULL),
(415, 2, 'ثادق', 'Thadiq', NULL, NULL, 1, 25.00, NULL, NULL),
(416, 2, 'سيهات', 'Sayhat', NULL, NULL, 1, 25.00, NULL, NULL),
(417, 2, 'تاروت', 'Tarut', NULL, NULL, 1, 25.00, NULL, NULL),
(418, 2, 'ينبع', 'Yanbu', NULL, NULL, 1, 25.00, NULL, NULL),
(419, 2, 'شقراء', 'Shaqra', NULL, NULL, 1, 25.00, NULL, NULL),
(420, 2, 'الدوادمي', 'Ad Duwadimi', NULL, NULL, 1, 25.00, NULL, NULL),
(421, 2, 'الدرعية', 'Ad Diriyah', NULL, NULL, 1, 25.00, NULL, NULL),
(422, 2, 'القويعية', 'Quwayiyah', NULL, NULL, 1, 25.00, NULL, NULL),
(423, 2, 'المزاحمية', 'Al Muzahimiyah', NULL, NULL, 1, 25.00, NULL, NULL),
(424, 2, 'بدر', 'Badr', NULL, NULL, 1, 25.00, NULL, NULL),
(425, 2, 'الخرج', 'Al Kharj', NULL, NULL, 1, 25.00, NULL, NULL),
(426, 2, 'الدلم', 'Ad Dilam', NULL, NULL, 1, 25.00, NULL, NULL),
(427, 2, 'الشنان', 'Ash Shinan', NULL, NULL, 1, 25.00, NULL, NULL),
(428, 2, 'الخرمة', 'Al Khurmah', NULL, NULL, 1, 25.00, NULL, NULL),
(429, 2, 'الجموم', 'Al Jumum', NULL, NULL, 1, 25.00, NULL, NULL),
(430, 2, 'المجاردة', 'Al Majardah', NULL, NULL, 1, 25.00, NULL, NULL),
(431, 2, 'السليل', 'As Sulayyil', NULL, NULL, 1, 25.00, NULL, NULL),
(432, 2, 'تثليث', 'Tathilith', NULL, NULL, 1, 25.00, NULL, NULL),
(433, 2, 'بيشة', 'Bishah', NULL, NULL, 1, 25.00, NULL, NULL),
(434, 2, 'الباحة', 'Al Baha', NULL, NULL, 1, 25.00, NULL, NULL),
(435, 2, 'القنفذة', 'Al Qunfidhah', NULL, NULL, 1, 25.00, NULL, NULL),
(436, 2, 'محايل', 'Muhayil', NULL, NULL, 1, 25.00, NULL, NULL),
(437, 2, 'ثول', 'Thuwal', NULL, NULL, 1, 25.00, NULL, NULL),
(438, 2, 'ضبا', 'Duba', NULL, NULL, 1, 25.00, NULL, NULL),
(439, 2, 'تربه', 'Turbah', NULL, NULL, 1, 25.00, NULL, NULL),
(440, 2, 'صفوى', 'Safwa', NULL, NULL, 1, 25.00, NULL, NULL),
(441, 2, 'عنك', 'Inak', NULL, NULL, 1, 25.00, NULL, NULL),
(442, 2, 'طريف', 'Turaif', NULL, NULL, 1, 25.00, NULL, NULL),
(443, 2, 'عرعر', 'Arar', NULL, NULL, 1, 25.00, NULL, NULL),
(444, 2, 'القريات', 'Al Qurayyat', NULL, NULL, 1, 25.00, NULL, NULL),
(445, 2, 'سكاكا', 'Sakaka', NULL, NULL, 1, 25.00, NULL, NULL),
(446, 2, 'رفحاء', 'Rafha', NULL, NULL, 1, 25.00, NULL, NULL),
(447, 2, 'دومة الجندل', 'Dawmat Al Jandal', NULL, NULL, 1, 25.00, NULL, NULL),
(448, 2, 'الرس', 'Ar Rass', NULL, NULL, 1, 25.00, NULL, NULL),
(449, 2, 'المذنب', 'Al Midhnab', NULL, NULL, 1, 25.00, NULL, NULL),
(450, 2, 'الخفجي', 'Al Khafji', NULL, NULL, 1, 25.00, NULL, NULL),
(451, 2, 'رياض الخبراء', 'Riyad Al Khabra', NULL, NULL, 1, 25.00, NULL, NULL),
(452, 2, 'البدائع', 'Al Badai', NULL, NULL, 1, 25.00, NULL, NULL),
(453, 2, 'رأس تنورة', 'Ras Tannurah', NULL, NULL, 1, 25.00, NULL, NULL),
(454, 2, 'البكيرية', 'Al Bukayriyah', NULL, NULL, 1, 25.00, NULL, NULL),
(455, 2, 'الشماسية', 'Ash Shimasiyah', NULL, NULL, 1, 25.00, NULL, NULL),
(456, 2, 'الحريق', 'Al Hariq', NULL, NULL, 1, 25.00, NULL, NULL),
(457, 2, 'حوطة بني تميم', 'Hawtat Bani Tamim', NULL, NULL, 1, 25.00, NULL, NULL),
(458, 2, 'ليلى', 'Layla', NULL, NULL, 1, 25.00, NULL, NULL),
(459, 2, 'بللسمر', 'Billasmar', NULL, NULL, 1, 25.00, NULL, NULL),
(460, 2, 'شرورة', 'Sharurah', NULL, NULL, 1, 25.00, NULL, NULL),
(461, 2, 'نجران', 'Najran', NULL, NULL, 1, 25.00, NULL, NULL),
(462, 2, 'صبيا', 'Sabya', NULL, NULL, 1, 25.00, NULL, NULL),
(463, 2, 'ابو عريش', 'Abu Arish', NULL, NULL, 1, 25.00, NULL, NULL),
(464, 2, 'صامطة', 'Samtah', NULL, NULL, 1, 25.00, NULL, NULL),
(465, 2, 'احد المسارحة', 'Ahad Al Musarihah', NULL, NULL, 1, 25.00, NULL, NULL),
(466, 2, 'مدينة الملك عبدالله الاقتصادية', 'King Abdullah Economic City', NULL, NULL, 1, 25.00, NULL, NULL),
(467, 1, 'Capital Governorate', 'Capital Governorate', NULL, NULL, 1, 0.70, NULL, NULL),
(468, 1, 'Isa Town', 'Isa Town', NULL, NULL, 1, 0.70, NULL, NULL),
(469, 1, 'Al-Muḥāfaẓat aš-Šamālīyah', 'Al-Muḥāfaẓat aš-Šamālīyah', NULL, NULL, 1, 0.70, NULL, NULL),
(470, 1, 'Hoarat A\'ali', 'Hoarat A\'ali', NULL, NULL, 1, 0.70, NULL, NULL),
(471, 1, 'Al-Muḥāfaẓat al-Janūbīyah', 'Al-Muḥāfaẓat al-Janūbīyah', NULL, NULL, 1, 0.70, NULL, NULL),
(472, 1, 'Northern Governorate', 'Northern Governorate', NULL, NULL, 1, 0.70, NULL, NULL),
(473, 1, 'Al Jasra', 'Al Jasra', NULL, NULL, 1, 0.70, NULL, NULL),
(474, 2, 'Riyadh Province', 'Riyadh Province', NULL, NULL, 1, 25.00, NULL, NULL),
(475, 2, 'Al Madinah Province', 'Al Madinah Province', NULL, NULL, 1, 25.00, NULL, NULL),
(476, 2, 'Medina', 'Medina', NULL, NULL, 1, 25.00, NULL, NULL),
(477, 2, 'Makkah Province', 'Makkah Province', NULL, NULL, 1, 25.00, NULL, NULL),
(478, 2, 'Asfan', 'Asfan', NULL, NULL, 1, 25.00, NULL, NULL),
(479, 2, 'Maysaan', 'Maysaan', NULL, NULL, 1, 25.00, NULL, NULL),
(480, 2, 'Quday\'an', 'Quday\'an', NULL, NULL, 1, 25.00, NULL, NULL),
(481, 2, 'Halban', 'Halban', NULL, NULL, 1, 25.00, NULL, NULL),
(482, 2, 'Al Wahwahi', 'Al Wahwahi', NULL, NULL, 1, 25.00, NULL, NULL),
(483, 2, 'Al Khasrah', 'Al Khasrah', NULL, NULL, 1, 25.00, NULL, NULL),
(484, 2, 'منطقة الرياض', 'منطقة الرياض', NULL, NULL, 1, 25.00, NULL, NULL),
(485, 2, 'الحصاة', 'الحصاة', NULL, NULL, 1, 25.00, NULL, NULL),
(486, 2, 'Alquwayiyah', 'Alquwayiyah', NULL, NULL, 1, 25.00, NULL, NULL),
(487, 2, 'Miz\'il', 'Miz\'il', NULL, NULL, 1, 25.00, NULL, NULL),
(488, 2, 'Al Duwadimi', 'Al Duwadimi', NULL, NULL, 1, 25.00, NULL, NULL),
(489, 2, 'Jilah', 'Jilah', NULL, NULL, 1, 25.00, NULL, NULL),
(490, 2, 'Al Quwaiiyah', 'Al Quwaiiyah', NULL, NULL, 1, 25.00, NULL, NULL),
(491, 2, 'Al Qassim Province', 'Al Qassim Province', NULL, NULL, 1, 25.00, NULL, NULL),
(492, 2, 'Dariyah', 'Dariyah', NULL, NULL, 1, 25.00, NULL, NULL),
(493, 2, 'Al Humaij', 'Al Humaij', NULL, NULL, 1, 25.00, NULL, NULL),
(494, 2, 'Yanbu Al Nakhal', 'Yanbu Al Nakhal', NULL, NULL, 1, 25.00, NULL, NULL),
(495, 2, 'Al Figrah', 'Al Figrah', NULL, NULL, 1, 25.00, NULL, NULL),
(496, 2, 'Alyutamah', 'Alyutamah', NULL, NULL, 1, 25.00, NULL, NULL),
(497, 2, 'Mahd Al Thahab', 'Mahd Al Thahab', NULL, NULL, 1, 25.00, NULL, NULL),
(498, 2, 'Ad Dumayriyah', 'Ad Dumayriyah', NULL, NULL, 1, 25.00, NULL, NULL),
(499, 2, 'Al Uyaynah', 'Al Uyaynah', NULL, NULL, 1, 25.00, NULL, NULL),
(500, 2, 'Rughabah', 'Rughabah', NULL, NULL, 1, 25.00, NULL, NULL),
(501, 2, 'Shaqra', 'Shaqra', NULL, NULL, 1, 25.00, NULL, NULL),
(502, 2, 'الفيضة بالسر', 'الفيضة بالسر', NULL, NULL, 1, 25.00, NULL, NULL),
(503, 2, 'Muhayriqah', 'Muhayriqah', NULL, NULL, 1, 25.00, NULL, NULL),
(504, 2, 'الجله الأعلى', 'الجله الأعلى', NULL, NULL, 1, 25.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `title_ar`, `title_en`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Manager', 'مدير', 'Manager', 'admin', '2023-06-12 09:25:25', '2023-06-12 09:25:25');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `desc_ar` text DEFAULT NULL,
  `desc_en` text DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title_ar`, `title_en`, `desc_ar`, `desc_en`, `file`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, '30 يوم للإرجاع', '30 Days Return', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id erat nulla. Quisque mattis odio vel metus ultrices, sit amet ultrices libero iaculis. Quisque posuere varius sem, sed suscipit nunc rhoncus et.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id erat nulla. Quisque mattis odio vel metus ultrices, sit amet ultrices libero iaculis. Quisque posuere varius sem, sed suscipit nunc rhoncus et.', '/uploads/Services/1699874971_3694.webp', NULL, 1, '2023-06-26 09:24:56', '2023-11-13 11:29:31'),
(2, '24/7 دعم', '24/7 Support', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id erat nulla. Quisque mattis odio vel metus ultrices, sit amet ultrices libero iaculis. Quisque posuere varius sem, sed suscipit nunc rhoncus et.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id erat nulla. Quisque mattis odio vel metus ultrices, sit amet ultrices libero iaculis. Quisque posuere varius sem, sed suscipit nunc rhoncus et.', '/uploads/Services/1699875642_2962.webp', NULL, 1, '2023-06-26 09:26:17', '2023-11-13 11:40:42'),
(3, '100٪ شحن مجاني', '100% Free shipping', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id erat nulla. Quisque mattis odio vel metus ultrices, sit amet ultrices libero iaculis. Quisque posuere varius sem, sed suscipit nunc rhoncus et.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id erat nulla. Quisque mattis odio vel metus ultrices, sit amet ultrices libero iaculis. Quisque posuere varius sem, sed suscipit nunc rhoncus et.', '/uploads/Services/1699875681_6503.webp', NULL, 1, '2023-06-26 09:27:50', '2023-11-13 11:41:21');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'title_ar', 'اليكترو', 'publicSettings', 1, NULL, '2024-06-12 06:39:14'),
(2, 'title_en', 'Electro', 'publicSettings', 1, NULL, '2024-06-12 06:39:14'),
(3, 'logo', '/uploads/Settings/1696419245_5294.webp', 'publicSettings', 1, NULL, '2023-10-04 10:34:09'),
(4, 'email', 'info@gmail.com', 'publicSettings', 1, NULL, '2024-06-12 06:39:14'),
(5, 'phone', '97339555152', 'publicSettings', 1, NULL, '2024-06-12 06:39:14'),
(6, 'whatsapp', NULL, 'publicSettings', 1, NULL, '2024-06-12 06:39:14'),
(7, 'desc', 'Electro', 'publicSettings', 1, NULL, '2024-06-12 06:39:14'),
(8, 'keywords', 'Electro', 'publicSettings', 1, NULL, '2024-06-12 06:39:14'),
(9, 'author', 'Electro', 'publicSettings', 1, NULL, '2024-06-12 06:39:14'),
(10, 'main_color', '#2f957b', 'publicSettings', 1, NULL, '2024-06-12 06:39:14'),
(11, 'vat', '10', 'publicSettings', 1, NULL, '2024-06-12 06:39:14'),
(12, 'about_ar', '<p>اليكترو للاجهزة الكهربائية</p>', 'about', 1, '2022-10-09 05:52:15', '2024-05-09 14:00:16'),
(13, 'about_en', '<p>electro for machines</p>', 'about', 1, '2022-10-09 05:52:15', '2024-05-09 14:00:16'),
(14, 'about_image', '/uploads/Settings/1686556152_8327.webp', 'about', 1, '2022-10-09 05:52:15', '2023-06-12 04:49:12'),
(15, 'privacy_ar', 'electro', 'privacy', 1, '2022-10-09 05:52:15', '2023-06-12 04:49:23'),
(16, 'privacy_en', 'electro', 'privacy', 1, '2022-10-09 05:52:15', '2023-06-12 04:49:23'),
(17, 'privacy_image', '/uploads/Settings/1686556163_1878.webp', 'privacy', 1, '2022-10-09 05:52:15', '2023-06-12 04:49:23'),
(18, 'terms_ar', 'electro', 'terms', 1, '2022-10-09 05:52:15', '2023-06-12 04:49:35'),
(19, 'terms_en', 'electro', 'terms', 1, '2022-10-09 05:52:15', '2023-06-12 04:49:35'),
(20, 'terms_image', '/uploads/Settings/1686556175_4346.webp', 'terms', 1, '2022-10-09 05:52:15', '2023-06-12 04:49:35'),
(21, 'accept_order', '1', 'publicSettings', 1, '2022-10-09 05:52:15', '2024-06-12 06:39:14'),
(22, 'main_color', '#2f957b', 'publicSettings', 1, '2022-10-09 05:52:15', '2024-06-12 06:39:14'),
(23, 'about_display', '1', 'about', 1, '2022-10-09 05:52:15', '2024-05-09 14:00:16'),
(24, 'privacy_display', '1', 'privacy', 1, '2022-10-09 05:52:15', '2023-06-12 04:49:23'),
(25, 'terms_display', '1', 'terms', 1, '2022-10-09 05:52:15', '2023-06-12 04:49:35'),
(26, 'facebook', 'https://www.facebook.com/', 'publicSettings', 1, NULL, '2024-06-12 06:39:14'),
(27, 'twitter', 'https://www.twitter.com/', 'publicSettings', 1, NULL, '2024-06-12 06:39:14'),
(28, 'instagram', 'https://www.instagram.com/', 'publicSettings', 1, '2022-10-09 05:52:15', '2024-06-12 06:39:14'),
(29, 'snapchat', 'https://www.snapchat.com/', 'publicSettings', 1, '2022-10-09 05:52:15', '2024-06-12 06:39:14'),
(30, 'office_ar', '<p style=\"text-align: right;\">احصل على 15 شهرًا بسعر 12 عند شراء Microsoft 365 مع هذا الجهاز</p>\n<p style=\"text-align: right;\">يتضمن تطبيقات Office المتميزة (Word وExcel وPowerPoint والمزيد)<br>تخزين سحابي مع أمان متقدم<br>لأجهزة الكمبيوتر الشخصية، وMac، وiOS، وAndroid<br>لا يتم تجديد الاشتراك تلقائيا</p>\n<p style=\"text-align: right;\">يختلف توفر التطبيق حسب الجهاز/اللغة. يتطلب iOS وAndroid تنزيل تطبيق منفصل.</p>', 'office', 1, '2022-10-09 05:52:15', '2024-05-09 13:56:59'),
(31, 'office_en', '<p>Get 15 months for the price of 12 when you buy Microsoft 365 with this device</p>\n<ul>\n<li>Includes premium Office apps (Word, Excel, PowerPoint, and more)</li>\n<li>Cloud storage with advanced security</li>\n<li>For PC, Mac, iOS, and Android</li>\n<li>Subscription does not automatically renew</li>\n</ul>\n<p>App availability varies by device/language. iOS and Android require separate app download.</p>', 'office', 1, '2022-10-09 05:52:15', '2024-05-09 13:56:59'),
(32, 'office_image', '/uploads/Settings/1715263019_8273.avif', 'office', 1, '2022-10-09 05:52:15', '2024-05-09 13:56:59'),
(33, 'protection_ar', '<p style=\"text-align: right;\">يمكنك العمل واللعب دون قلق مع الحماية والدعم الممتدين لجهازك بما في ذلك تغطية الأضرار العرضية. متاح خلال 45 يومًا من شراء جهاز Surface.</p>\n<p style=\"text-align: right;\">&nbsp;</p>\n<p style=\"text-align: right;\">فوائد</p>\n<ul>\n<li style=\"text-align: right;\">تغطية ودعم لمدة تصل إلى 4 سنوات</li>\n<li style=\"text-align: right;\">دعم البرامج والأجهزة</li>\n<li style=\"text-align: right;\">شحنة العودة المدفوعة مسبقا</li>\n<li style=\"text-align: right;\">الضرر العرضي من المناولة</li>\n<li style=\"text-align: right;\">تغطية الأعطال الميكانيكية</li>\n</ul>', 'protection', 1, '2022-10-09 05:52:15', '2024-05-09 13:58:14'),
(34, 'protection_en', '<p>Work and play worry-free with extended protection and support for your device including accidental damage coverage. Available within 45 days of Surface Device Purchase.</p>\n<p>&nbsp;</p>\n<p>Benefits</p>\n<ul>\n<li>Up to 4 years coverage and support</li>\n<li>Software and hardware support</li>\n<li>Prepaid return shipment</li>\n<li>Accidental damage from handling</li>\n<li>Mechanical breakdown coverage</li>\n</ul>', 'protection', 1, '2022-10-09 05:52:15', '2024-05-09 13:58:14'),
(35, 'protection_image', '/uploads/Settings/1715263094_9633.webp', 'protection', 1, '2022-10-09 05:52:15', '2024-05-09 13:58:14'),
(36, 'coins_no', '15', 'publicSettings', 1, NULL, '2024-06-12 06:39:14'),
(37, 'discount_one_coin', '3', 'publicSettings', 1, NULL, '2024-06-12 06:39:14');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `title_ar`, `title_en`, `status`, `created_at`, `updated_at`) VALUES
(2, '15 بوصة', '15 inch', 1, '2023-06-13 08:36:17', '2023-06-13 08:36:17'),
(4, '17 بوصة', '17 inch', 1, '2023-06-20 09:03:13', '2023-06-20 09:03:13'),
(5, 'عادي', 'Regular', 1, '2023-07-03 07:50:22', '2023-07-03 07:50:22'),
(6, '13 انش', '13 inch', 1, '2024-06-03 09:48:11', '2024-06-03 09:48:11');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `desc_ar` text DEFAULT NULL,
  `desc_en` text DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title_ar`, `title_en`, `desc_ar`, `desc_en`, `file`, `link`, `status`, `created_at`, `updated_at`) VALUES
(2, NULL, NULL, NULL, NULL, '/uploads/Sliders/1699872274_9112.webp', NULL, 1, '2023-11-13 10:44:34', '2024-04-14 10:01:01');

-- --------------------------------------------------------

--
-- Table structure for table `specs`
--

CREATE TABLE `specs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specs`
--

INSERT INTO `specs` (`id`, `title_ar`, `title_en`, `status`, `created_at`, `updated_at`) VALUES
(1, 'المعالج', 'Processor', 1, '2023-06-13 07:16:00', '2023-06-13 07:16:00'),
(2, 'الرسومات', 'Graphics', 1, '2023-06-13 07:16:45', '2023-06-13 07:16:45'),
(3, 'الذاكرة والتخزين', 'Memory and Storage', 1, '2023-06-13 07:16:58', '2023-06-13 07:17:48'),
(4, 'شاشة', 'Display', 1, '2023-06-13 07:17:10', '2023-06-13 07:17:10'),
(5, 'البطارية', 'Battery', 1, '2023-06-13 10:17:32', '2023-06-13 10:17:32'),
(6, 'نوع الدعم', 'Support Type', 1, '2023-11-22 10:15:47', '2023-11-22 10:15:47'),
(7, 'الوزن الكلي', 'Total Weight', 1, '2023-11-22 10:16:00', '2023-11-22 10:16:00');

-- --------------------------------------------------------

--
-- Table structure for table `storages`
--

CREATE TABLE `storages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `storages`
--

INSERT INTO `storages` (`id`, `title_ar`, `title_en`, `status`, `created_at`, `updated_at`) VALUES
(1, '512 جيجا بايت SSD', '512GB SSD', 1, '2023-06-13 09:02:17', '2023-06-13 09:02:17'),
(2, '1 تيرا بايت SSD', '1TB SSD', 1, '2023-06-13 09:02:49', '2023-06-13 09:02:49'),
(3, '256 GB', '256 GB', 1, '2024-06-03 11:59:18', '2024-06-03 11:59:18');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_number` varchar(255) DEFAULT NULL,
  `value` decimal(9,3) NOT NULL,
  `result` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `client_id`, `order_id`, `transaction_number`, `value`, `result`, `type`, `created_at`, `updated_at`) VALUES
(16, 59, NULL, 'chg_TS02A4320241904t6HO1105071', 80.000, 'CANCELLED', 'wallet', '2024-05-11 16:05:01', '2024-05-11 16:05:01');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(255) DEFAULT '0.000',
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `desc_ar` text DEFAULT NULL,
  `desc_en` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `file`, `title_ar`, `title_en`, `desc_ar`, `desc_en`, `status`, `created_at`, `updated_at`) VALUES
(1, '/uploads/Type/1716996251_9024.avif', 'مايكروسوفت اوفيس', 'Microsoft Office', '<p style=\"text-align: right;\">احصل على 15 شهرًا بسعر 12 عند شراء Microsoft 365 مع هذا الجهاز</p>\r\n<p style=\"text-align: right;\">يتضمن تطبيقات Office المتميزة (Word وExcel وPowerPoint والمزيد)<br>تخزين سحابي مع أمان متقدم<br>لأجهزة الكمبيوتر الشخصية، وMac، وiOS، وAndroid<br>لا يتم تجديد الاشتراك تلقائيا</p>\r\n<p style=\"text-align: right;\">يختلف توفر التطبيق حسب الجهاز/اللغة. يتطلب iOS وAndroid تنزيل تطبيق منفصل.</p>', '<p>Get 15 months for the price of 12 when you buy Microsoft 365 with this device</p>\r\n<ul>\r\n<li>Includes premium Office apps (Word, Excel, PowerPoint, and more)</li>\r\n<li>Cloud storage with advanced security</li>\r\n<li>For PC, Mac, iOS, and Android</li>\r\n<li>Subscription does not automatically renew</li>\r\n</ul>\r\n<p>App availability varies by device/language. iOS and Android require separate app download.</p>', 1, '2024-05-09 14:01:42', '2024-05-29 15:24:11'),
(2, '/uploads/Type/1716996314_2426.webp', 'حماية مايكروسوفت', 'Microsoft Protection', '<p style=\"text-align: right;\">يمكنك العمل واللعب دون قلق مع الحماية والدعم الممتدين لجهازك بما في ذلك تغطية الأضرار العرضية. متاح خلال 45 يومًا من شراء جهاز Surface.</p>\r\n<p style=\"text-align: right;\">&nbsp;</p>\r\n<p style=\"text-align: right;\">فوائد</p>\r\n<ul>\r\n<li style=\"text-align: right;\">تغطية ودعم لمدة تصل إلى 4 سنوات</li>\r\n<li style=\"text-align: right;\">دعم البرامج والأجهزة</li>\r\n<li style=\"text-align: right;\">شحنة العودة المدفوعة مسبقا</li>\r\n<li style=\"text-align: right;\">الضرر العرضي من المناولة</li>\r\n<li style=\"text-align: right;\">تغطية الأعطال الميكانيكية</li>\r\n</ul>', '<p>Work and play worry-free with extended protection and support for your device including accidental damage coverage. Available within 45 days of Surface Device Purchase.</p>\r\n<p>&nbsp;</p>\r\n<p>Benefits</p>\r\n<ul>\r\n<li>Up to 4 years coverage and support</li>\r\n<li>Software and hardware support</li>\r\n<li>Prepaid return shipment</li>\r\n<li>Accidental damage from handling</li>\r\n<li>Mechanical breakdown coverage</li>\r\n</ul>', 1, '2024-05-09 14:02:50', '2024-05-29 15:25:14');

-- --------------------------------------------------------

--
-- Table structure for table `type_items`
--

CREATE TABLE `type_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file` varchar(255) DEFAULT '0.000',
  `price` decimal(8,3) DEFAULT 0.000,
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `desc_ar` text DEFAULT NULL,
  `desc_en` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type_items`
--

INSERT INTO `type_items` (`id`, `type_id`, `file`, `price`, `title_ar`, `title_en`, `desc_ar`, `desc_en`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '0.000', 0.000, 'لا شيء', 'None', '<p>لا أريد Microsoft 365 مع عملية الشراء الخاصة بي الآن.</p>', '<p>I don&rsquo;t want Microsoft 365 with my purchase right now.</p>', 1, '2024-05-09 11:01:42', '2024-05-09 11:01:42'),
(2, 1, '0.000', 40.000, 'Microsoft 365 Family – باللغة الإنجليزية (اشتراك لمدة 15 شهرًا)', 'Microsoft 365 Family – English (15-Months Subscription)', '<ul>\r\n<li style=\"text-align: right;\">لما يصل إلى 6 أشخاص</li>\r\n<li style=\"text-align: right;\">سعة تخزينية سحابية تبلغ 6 تيرابايت (1 تيرابايت لكل شخص)</li>\r\n</ul>', '<ul>\r\n<li>&nbsp;For up to 6 people</li>\r\n<li>&nbsp;6 TB of cloud storage (1 TB per person)</li>\r\n</ul>', 1, '2024-05-09 11:02:50', '2024-05-09 11:02:50'),
(3, 1, '0.000', 25.000, 'Microsoft 365 Personal (اشتراك لمدة 15 شهرًا)', 'Microsoft 365 Personal (15-Month Subscription)', '<ul>\r\n<li style=\"text-align: right;\">لشخص واحد</li>\r\n<li style=\"text-align: right;\">&nbsp; 1 تيرابايت من التخزين السحابي</li>\r\n</ul>', '<ul>\r\n<li>&nbsp;For one person</li>\r\n<li>&nbsp;1 TB of cloud storage</li>\r\n</ul>', 1, '2024-05-09 11:03:45', '2024-05-09 11:03:45'),
(8, NULL, '0.000', 0.000, 'لا شيء', 'None', '<p>لا أريد أي حماية إضافية لجهازي في الوقت الحالي.</p>', '<p>I don\'t want any additional protection for my device at this time.</p>', 1, '2024-05-09 11:04:45', '2024-05-09 11:04:45'),
(9, NULL, '0.000', 50.000, 'Microsoft كاملة لجهاز Surface Laptop Go مع تغطية ضد الأضرار العرضية (لمدة عامين)', 'Microsoft Complete for Surface Laptop Go with Accidental Damage Coverage (2-Year)', NULL, NULL, 1, '2024-05-09 11:05:06', '2024-05-09 11:05:06'),
(10, NULL, '0.000', 75.000, 'Microsoft كاملة لجهاز Surface Laptop Go مع تغطية ضد الأضرار العرضية (لمدة 3 سنوات)', 'Microsoft Complete for Surface Laptop Go with Accidental Damage Coverage (3-Year)', NULL, NULL, 1, '2024-05-09 11:05:21', '2024-05-09 11:05:21'),
(11, NULL, '0.000', 100.000, 'Microsoft كاملة لجهاز Surface Laptop Go مع تغطية ضد الأضرار العرضية (4 سنوات)', 'Microsoft Complete for Surface Laptop Go with Accidental Damage Coverage (4-Year)', NULL, NULL, 1, '2024-05-09 11:05:36', '2024-05-09 11:05:36'),
(13, 2, '/uploads/TypeItem/1717514019_5995.webp', 20.000, 'مايكروسوفت 365 الشخصية', 'Microsoft 365 Personal', '<li>لشخص واحد </li>\r\n<li>تسجيل الدخول إلى خمسة أجهزة في وقت واحد</li>\r\n<li>يتم الاستخدام على أجهزة كمبيوتر الشخصية وأجهزة Mac والهواتف وأجهزة الكمبيوتر اللوحية\r\n1 تيرابايت من التخزين السحابي</li>\r\n<li>تطبيقات بميزات مميزة ووصول دون اتصال بالإنترنت\r\nأمان البيانات والأجهزة </li>\r\n<li>البريد الإلكتروني الآمن بدون إعلانات </li>', '<li>High one</li>\r\n<li>Log in to five devices simultaneously</li>\r\n<li>It is used on PCs, Macs, phones and tablets\r\n1 TB cloud storage</li>\r\n<li>Apps with premium features and offline access\r\nSports data</li>\r\n<li>Email Marketing Without Ads</li>', 1, '2024-05-30 16:17:23', '2024-06-04 15:24:14'),
(14, 2, '/uploads/TypeItem/1717514387_9546.webp', 30.000, 'عائلة مايكروسوفت 365', 'Microsoft 365 Family', '<li>لواحد إلى ستة أشخاص </li>\r\n<li>تسجيل الدخول إلى خمسة أجهزة في وقت واحد</li>\r\n<li>يتم الاستخدام على أجهزة كمبيوتر الشخصية وأجهزة Mac والهواتف وأجهزة الكمبيوتر اللوحية</li>\r\n<li>تخزين سحابي آمن حتى 6 تيرابايت </li>\r\n<li>تطبيقات بميزات مميزة ووصول دون اتصال بالإنترنت\r\nأمان البيانات والأجهزة</li>\r\n<li>البريد الإلكتروني الآمن بدون إعلانات</li>', '<li>For one to six people</li>\r\n<li>Log in to five devices simultaneously</li>\r\n<li>Used on PCs, Macs, phones and tablets</li>\r\n<li>Secure cloud storage up to 6TB </li>\r\n<li>Apps with premium features and offline access\r\nData and device security</li>\r\n<li>Secure email without ads</li>', 1, '2024-05-30 16:17:55', '2024-06-04 15:22:09');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `device_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `client_id`, `device_id`, `created_at`, `updated_at`) VALUES
(21, 402473, 150, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_client_id_foreign` (`client_id`),
  ADD KEY `addresses_region_id_foreign` (`region_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blocks_country_id_foreign` (`country_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branches_country_id_foreign` (`country_id`);

--
-- Indexes for table `branch_category`
--
ALTER TABLE `branch_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_category_branch_id_foreign` (`branch_id`),
  ADD KEY `branch_category_category_id_foreign` (`category_id`);

--
-- Indexes for table `branch_device`
--
ALTER TABLE `branch_device`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_device_branch_id_foreign` (`branch_id`),
  ADD KEY `branch_device_category_id_foreign` (`category_id`),
  ADD KEY `branch_device_device_id_foreign` (`device_id`);

--
-- Indexes for table `branch_region`
--
ALTER TABLE `branch_region`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_region_branch_id_foreign` (`branch_id`),
  ADD KEY `branch_region_region_id_foreign` (`region_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_device_id_foreign` (`device_id`);

--
-- Indexes for table `cart_type_items`
--
ALTER TABLE `cart_type_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_client_id_foreign` (`client_id`),
  ADD KEY `chat_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_country_id_foreign` (`country_id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_client_id_foreign` (`client_id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devices_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `device_accessory`
--
ALTER TABLE `device_accessory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_accessory_accessory_id_foreign` (`accessory_id`),
  ADD KEY `device_accessory_device_id_foreign` (`device_id`);

--
-- Indexes for table `device_category`
--
ALTER TABLE `device_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_category_device_id_foreign` (`device_id`),
  ADD KEY `device_category_category_id_foreign` (`category_id`);

--
-- Indexes for table `device_feature`
--
ALTER TABLE `device_feature`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_feature_device_id_foreign` (`device_id`);

--
-- Indexes for table `device_gallery`
--
ALTER TABLE `device_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_gallery_device_id_foreign` (`device_id`),
  ADD KEY `device_gallery_color_id_foreign` (`color_id`);

--
-- Indexes for table `device_header`
--
ALTER TABLE `device_header`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_header_device_id_foreign` (`device_id`),
  ADD KEY `device_header_color_id_foreign` (`color_id`);

--
-- Indexes for table `device_item`
--
ALTER TABLE `device_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_item_device_id_foreign` (`device_id`),
  ADD KEY `device_item_color_id_foreign` (`color_id`),
  ADD KEY `device_item_os_foreign` (`os`),
  ADD KEY `device_item_size_id_foreign` (`size_id`),
  ADD KEY `device_item_processor_id_foreign` (`processor_id`),
  ADD KEY `device_item_memory_id_foreign` (`memory_id`),
  ADD KEY `device_item_storage_id_foreign` (`storage_id`);

--
-- Indexes for table `device_specs`
--
ALTER TABLE `device_specs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_specs_device_id_foreign` (`device_id`),
  ADD KEY `device_specs_specs_id_foreign` (`specs_id`);

--
-- Indexes for table `device_types`
--
ALTER TABLE `device_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devices_device_id_foreign` (`device_id`),
  ADD KEY `types_type_id` (`type_id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `memories`
--
ALTER TABLE `memories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_delivery_id_foreign` (`delivery_id`),
  ADD KEY `orders_client_id_foreign` (`client_id`),
  ADD KEY `orders_address_id_foreign` (`address_id`),
  ADD KEY `orders_branch_id_foreign` (`branch_id`),
  ADD KEY `orders_payment_id_foreign` (`payment_id`),
  ADD KEY `orders_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `order_device`
--
ALTER TABLE `order_device`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_device_order_id_foreign` (`order_id`),
  ADD KEY `order_device_device_id_foreign` (`device_id`),
  ADD KEY `order_device_color_id_foreign` (`color_id`),
  ADD KEY `order_device_item_id_foreign` (`item_id`);

--
-- Indexes for table `os`
--
ALTER TABLE `os`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `processors`
--
ALTER TABLE `processors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `regions_country_id_foreign` (`country_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specs`
--
ALTER TABLE `specs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storages`
--
ALTER TABLE `storages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_client_id_foreign` (`client_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_items`
--
ALTER TABLE `type_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_device_id_foreign` (`device_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=458;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `branch_category`
--
ALTER TABLE `branch_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `branch_device`
--
ALTER TABLE `branch_device`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `branch_region`
--
ALTER TABLE `branch_region`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=356;

--
-- AUTO_INCREMENT for table `cart_type_items`
--
ALTER TABLE `cart_type_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `device_accessory`
--
ALTER TABLE `device_accessory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `device_category`
--
ALTER TABLE `device_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `device_feature`
--
ALTER TABLE `device_feature`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `device_gallery`
--
ALTER TABLE `device_gallery`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=483;

--
-- AUTO_INCREMENT for table `device_header`
--
ALTER TABLE `device_header`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `device_item`
--
ALTER TABLE `device_item`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `device_specs`
--
ALTER TABLE `device_specs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT for table `device_types`
--
ALTER TABLE `device_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `memories`
--
ALTER TABLE `memories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `order_device`
--
ALTER TABLE `order_device`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `os`
--
ALTER TABLE `os`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `processors`
--
ALTER TABLE `processors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=505;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `specs`
--
ALTER TABLE `specs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `storages`
--
ALTER TABLE `storages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `type_items`
--
ALTER TABLE `type_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `addresses_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `blocks`
--
ALTER TABLE `blocks`
  ADD CONSTRAINT `blocks_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branch_category`
--
ALTER TABLE `branch_category`
  ADD CONSTRAINT `branch_category_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branch_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branch_device`
--
ALTER TABLE `branch_device`
  ADD CONSTRAINT `branch_device_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branch_device_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branch_device_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branch_region`
--
ALTER TABLE `branch_region`
  ADD CONSTRAINT `branch_region_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branch_region_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_type_items`
--
ALTER TABLE `cart_type_items`
  ADD CONSTRAINT `cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `devices_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `device_accessory`
--
ALTER TABLE `device_accessory`
  ADD CONSTRAINT `device_accessory_accessory_id_foreign` FOREIGN KEY (`accessory_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `device_accessory_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `device_category`
--
ALTER TABLE `device_category`
  ADD CONSTRAINT `device_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `device_category_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `device_feature`
--
ALTER TABLE `device_feature`
  ADD CONSTRAINT `device_feature_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `device_gallery`
--
ALTER TABLE `device_gallery`
  ADD CONSTRAINT `device_gallery_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `device_gallery_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `device_header`
--
ALTER TABLE `device_header`
  ADD CONSTRAINT `device_header_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `device_header_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `device_item`
--
ALTER TABLE `device_item`
  ADD CONSTRAINT `device_item_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `device_item_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `device_item_memory_id_foreign` FOREIGN KEY (`memory_id`) REFERENCES `memories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `device_item_os_foreign` FOREIGN KEY (`os`) REFERENCES `os` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `device_item_processor_id_foreign` FOREIGN KEY (`processor_id`) REFERENCES `processors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `device_item_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `device_item_storage_id_foreign` FOREIGN KEY (`storage_id`) REFERENCES `storages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `device_specs`
--
ALTER TABLE `device_specs`
  ADD CONSTRAINT `device_specs_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `device_specs_specs_id_foreign` FOREIGN KEY (`specs_id`) REFERENCES `specs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `device_types`
--
ALTER TABLE `device_types`
  ADD CONSTRAINT `devices_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `types_type_id` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_delivery_id_foreign` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_device`
--
ALTER TABLE `order_device`
  ADD CONSTRAINT `order_device_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_device_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_device_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `device_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_device_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `regions_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `type_items`
--
ALTER TABLE `type_items`
  ADD CONSTRAINT `types_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
