-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 06, 2021 at 04:40 PM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sshub`
--

-- --------------------------------------------------------

--
-- Table structure for table `colleges`
--

CREATE TABLE `colleges` (
  `id` int(11) NOT NULL,
  `college_code` varchar(10) NOT NULL,
  `college_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `colleges`
--

INSERT INTO `colleges` (`id`, `college_code`, `college_name`, `created_at`, `updated_at`) VALUES
(1, 'COAES', 'AGRICULTURE, ENGINEERING AND SCIENCE', '2021-11-06 15:09:14', NULL),
(2, 'COCCS', 'COMPUTING AND COMMUNICATION STUDIES', '2021-11-06 15:09:14', NULL),
(3, 'COEVS', 'ENVIRONMENTAL SCIENCES', '2021-11-06 15:09:14', NULL),
(4, 'COGES', 'GENERAL STUDIES', '2021-11-06 15:09:14', NULL),
(5, 'COHES', 'HEALTH SCIENCES', '2021-11-06 15:09:14', NULL),
(6, 'COLAW', 'LAW', '2021-11-06 15:09:14', NULL),
(7, 'COLBS', 'LIBERAL STUDIES', '2021-11-06 15:09:14', NULL),
(8, 'COMSS', 'MANAGEMENT AND SOCIAL SCIENCES', '2021-11-06 15:09:14', NULL),
(9, 'COPGS', 'POSTGRADUATE STUDIES', '2021-11-06 15:09:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matric_numbers`
--

CREATE TABLE `matric_numbers` (
  `id` int(11) NOT NULL,
  `matric_number` varchar(25) NOT NULL,
  `form_number` varchar(25) NOT NULL,
  `email` varchar(150) NOT NULL,
  `college` varchar(5) NOT NULL,
  `programme` varchar(4) NOT NULL,
  `session` varchar(9) NOT NULL,
  `level` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matric_numbers`
--

INSERT INTO `matric_numbers` (`id`, `matric_number`, `form_number`, `email`, `college`, `programme`, `session`, `level`, `active`, `created_at`, `updated_at`) VALUES
(4, 'BU21CIT1001', '50000', 'lolu@bowen.edu.ng', 'COCCS', 'CIT', '2021/2022', 100, 1, '2021-11-06 16:35:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matric_numbers_logs`
--

CREATE TABLE `matric_numbers_logs` (
  `id` int(11) NOT NULL,
  `user_ip` varchar(15) NOT NULL,
  `request` text NOT NULL,
  `response` text NOT NULL,
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `matric_number_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matric_numbers_logs`
--

INSERT INTO `matric_numbers_logs` (`id`, `user_ip`, `request`, `response`, `error`, `matric_number_id`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', '{\"formNumber\":\"50000\",\"email\":\"lolu@bowen.edu.ng\",\"college\":\"COCCS\",\"programme\":\"CIT\",\"session\":\"2021\\/2022\",\"level\":\"100\",\"isFreshStudent\":\"1\",\"extra\":\"yes\"}', '{\"status\":1,\"error\":false,\"mesage\":\"Matric number generated\",\"data\":{\"matric_number\":\"BU21CIT1001\",\"form_number\":\"50000\",\"email\":\"lolu@bowen.edu.ng\",\"college\":\"COCCS\",\"programme\":\"CIT\",\"session\":\"2021\\/2022\",\"level\":100,\"old_matric\":null}}', 0, 1, '2021-11-06 16:02:57', NULL),
(2, '127.0.0.1', '{\"formNumber\":\"50000\",\"email\":\"lolu@bowen.edu.ng\",\"college\":\"COCCS\",\"programme\":\"CIT\",\"session\":\"2021\\/2022\",\"level\":\"100\",\"isFreshStudent\":\"0\",\"extra\":\"yes\"}', '{\"status\":2,\"error\":true,\"mesage\":\"Matric number does not exist\",\"data\":null}', 1, NULL, '2021-11-06 16:03:07', NULL),
(3, '127.0.0.1', '{\"matricNumber\":\"BU21CIT1001\",\"reason\":\"hh\"}', '{\"status\":1,\"error\":false,\"mesage\":\"Matric number deleted\",\"data\":{\"matric_number\":null,\"form_number\":null,\"email\":null,\"college\":null,\"programme\":null,\"session\":null,\"level\":null,\"old_matric\":null}}', 0, NULL, '2021-11-06 16:24:46', NULL),
(4, '127.0.0.1', '{\"formNumber\":\"50000\",\"email\":\"lolu@bowen.edu.ng\",\"college\":\"COCCS\",\"programme\":\"CIT\",\"session\":\"2021\\/2022\",\"level\":\"100\",\"isFreshStudent\":\"0\",\"extra\":\"yes\"}', '{\"status\":2,\"error\":true,\"mesage\":\"Matric number does not exist\",\"data\":null}', 1, NULL, '2021-11-06 16:27:23', NULL),
(5, '127.0.0.1', '{\"formNumber\":\"50000\",\"email\":\"lolu@bowen.edu.ng\",\"college\":\"COCCS\",\"programme\":\"CIT\",\"session\":\"2021\\/2022\",\"level\":\"100\",\"isFreshStudent\":\"1\",\"extra\":\"yes\"}', '{\"status\":1,\"error\":false,\"mesage\":\"Matric number generated\",\"data\":{\"matric_number\":\"BU21CIT1001\",\"form_number\":\"50000\",\"email\":\"lolu@bowen.edu.ng\",\"college\":\"COCCS\",\"programme\":\"CIT\",\"session\":\"2021\\/2022\",\"level\":100,\"old_matric\":null}}', 0, 2, '2021-11-06 16:27:37', NULL),
(6, '127.0.0.1', '{\"matricNumber\":\"BU21CIT1001\",\"reason\":\"hh\"}', '{\"status\":1,\"error\":false,\"mesage\":\"Matric number deleted\",\"data\":{\"matric_number\":\"BU21CIT1001\",\"form_number\":\"50000\",\"email\":\"lolu@bowen.edu.ng\",\"college\":\"COCCS\",\"programme\":\"CIT\",\"session\":\"2021\\/2022\",\"level\":100,\"old_matric\":\"50000\"}}', 0, NULL, '2021-11-06 16:27:41', NULL),
(7, '127.0.0.1', '{\"formNumber\":\"50000\",\"email\":\"lolu@bowen.edu.ng\",\"college\":\"COCCS\",\"programme\":\"CIT\",\"session\":\"2021\\/2022\",\"level\":\"100\",\"isFreshStudent\":\"1\",\"extra\":\"yes\"}', '{\"status\":1,\"error\":false,\"mesage\":\"Matric number generated\",\"data\":{\"matric_number\":\"BU21CIT1001\",\"form_number\":\"50000\",\"email\":\"lolu@bowen.edu.ng\",\"college\":\"COCCS\",\"programme\":\"CIT\",\"session\":\"2021\\/2022\",\"level\":100,\"old_matric\":null}}', 0, 3, '2021-11-06 16:28:21', NULL),
(8, '127.0.0.1', '{\"matricNumber\":\"BU21CIT1001\",\"reason\":\"hh\"}', '{\"status\":1,\"error\":false,\"mesage\":\"Matric number deleted\",\"data\":{\"matric_number\":\"BU21CIT1001\",\"form_number\":\"50000\",\"email\":\"lolu@bowen.edu.ng\",\"college\":\"COCCS\",\"programme\":\"CIT\",\"session\":\"2021\\/2022\",\"level\":100,\"old_matric\":null}}', 0, NULL, '2021-11-06 16:28:31', NULL),
(9, '127.0.0.1', '{\"formNumber\":\"50000\",\"email\":\"lolu@bowen.edu.ng\",\"college\":\"COCCS\",\"programme\":\"CIT\",\"session\":\"2021\\/2022\",\"level\":\"100\",\"isFreshStudent\":\"1\",\"extra\":\"yes\"}', '{\"status\":1,\"error\":false,\"mesage\":\"Matric number generated\",\"data\":{\"matric_number\":\"BU21CIT1001\",\"form_number\":\"50000\",\"email\":\"lolu@bowen.edu.ng\",\"college\":\"COCCS\",\"programme\":\"CIT\",\"session\":\"2021\\/2022\",\"level\":100,\"old_matric\":null}}', 0, 4, '2021-11-06 16:35:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `programmes`
--

CREATE TABLE `programmes` (
  `id` int(11) NOT NULL,
  `programme_code` varchar(10) NOT NULL,
  `programme_name` varchar(100) NOT NULL,
  `college_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `programmes`
--

INSERT INTO `programmes` (`id`, `programme_code`, `programme_name`, `college_id`, `created_at`, `updated_at`) VALUES
(1, 'ACC', 'ACCOUNTING', 8, '2021-11-06 15:15:38', NULL),
(2, 'AGR', 'AGRICULTURE', 1, '2021-11-06 15:15:38', NULL),
(3, 'ANA', 'ANATOMY', 5, '2021-11-06 15:15:38', NULL),
(4, 'ANAB', 'ANATOMY INTERCALATED', 5, '2021-11-06 15:15:38', NULL),
(5, 'ARC', 'ARCHITECTURE', 3, '2021-11-06 15:15:38', NULL),
(6, 'ASE', 'AGRICULTURAL EXTENSION AND SOCIAL ENGINEERING', 1, '2021-11-06 15:15:38', NULL),
(7, 'BCH', 'BIOCHEMISTRY', 1, '2021-11-06 15:15:38', NULL),
(8, 'BCHB', 'BIOCHEMISTRY INTERCALATED', 1, '2021-11-06 15:15:38', NULL),
(9, 'BFN', 'BANKING AND FINANCE', 8, '2021-11-06 15:15:38', NULL),
(10, 'BUS', 'BUSINESS ADMINISTRATION', 8, '2021-11-06 15:15:38', NULL),
(11, 'CBS', 'CYBER SECURITY', 2, '2021-11-06 15:15:38', NULL),
(12, 'CIT', 'COMPUTER SCIENCE', 2, '2021-11-06 15:15:38', NULL),
(13, 'CMA', 'COMMUNICATION ARTS', 2, '2021-11-06 15:15:38', NULL),
(14, 'CSA', 'COMPUTER STUDIES', 4, '2021-11-06 15:15:38', NULL),
(15, 'CYB', 'CYBER SECURITY', 2, '2021-11-06 15:15:38', NULL),
(16, 'ECN', 'ECONOMICS', 8, '2021-11-06 15:15:38', NULL),
(17, 'EEE', 'ELECTRICAL AND ELECTRONICS ENGINEERING', 1, '2021-11-06 15:15:38', NULL),
(18, 'EES', 'ENTREPRENEURSHIP EMPLOYABILITY STUDIES', 4, '2021-11-06 15:15:38', NULL),
(19, 'ENG', 'ENGLISH', 7, '2021-11-06 15:15:38', NULL),
(20, 'FST', 'FOOD SCIENCE AND TECHNOLOGY', 1, '2021-11-06 15:15:38', NULL),
(21, 'GEL', 'GODLINESS, EXCELLENCE AND LEADERSHIP', 4, '2021-11-06 15:15:38', NULL),
(22, 'GST', 'GENERAL STUDIES', 4, '2021-11-06 15:15:38', NULL),
(23, 'HIS', 'HISTORY AND INTERNATIONAL STUDIES', 7, '2021-11-06 15:15:38', NULL),
(24, 'ICH', 'INDUSTRIAL CHEMISTRY', 1, '2021-11-06 15:15:38', NULL),
(25, 'IFT', 'INFORMATION TECHNOLOGY', 2, '2021-11-06 15:15:38', NULL),
(26, 'INT', 'INFORMATION TECHNOLOGY', 2, '2021-11-06 15:15:38', NULL),
(27, 'IRD', 'INTERNATIONAL RELATIONS', 8, '2021-11-06 15:15:38', NULL),
(28, 'IRP', 'INDUSTRIAL RELATIONS AND PERSONNEL MANAGEMENT', 8, '2021-11-06 15:15:38', NULL),
(29, 'LAW', 'LAW', 6, '2021-11-06 15:15:38', NULL),
(30, 'MAS', 'MASS COMMUNICATION', 2, '2021-11-06 15:15:38', NULL),
(31, 'MAT', 'MATHEMATICS', 1, '2021-11-06 15:15:38', NULL),
(32, 'MCB', 'MICROBIOLOGY', 1, '2021-11-06 15:15:38', NULL),
(33, 'MCT', 'MECHATRONICS ENGINEERING', 1, '2021-11-06 15:15:38', NULL),
(34, 'MED', 'MEDICINE AND SURGERY', 5, '2021-11-06 15:15:38', NULL),
(35, 'MLS', 'MEDICAL LABORATORY SCIENCE', 5, '2021-11-06 15:15:38', NULL),
(36, 'MUS', 'MUSIC', 7, '2021-11-06 15:15:38', NULL),
(37, 'NSC', 'NURSING SCIENCE', 5, '2021-11-06 15:15:38', NULL),
(38, 'NTD', 'NUTRITION AND DIETETICS', 5, '2021-11-06 15:15:38', NULL),
(39, 'PAB', 'PURE AND APPLIED BIOLOGY', 1, '2021-11-06 15:15:38', NULL),
(40, 'PDS', 'POLITICAL SCIENCE', 8, '2021-11-06 15:15:38', NULL),
(41, 'PHL', 'PHILOSOPHY', 7, '2021-11-06 15:15:38', NULL),
(42, 'PHS', 'PHYSIOLOGY', 5, '2021-11-06 15:15:38', NULL),
(43, 'PHSB', 'PHYSIOLOGY INTERCARLATED', 5, '2021-11-06 15:15:38', NULL),
(44, 'PHY', 'PHYSICS', 1, '2021-11-06 15:15:38', NULL),
(45, 'PST', 'PHYSIOTHERAPY', 5, '2021-11-06 15:15:38', NULL),
(46, 'PSTB', 'PHYSIOTHERAPY INTERCARLATED', 5, '2021-11-06 15:15:38', NULL),
(47, 'PUH', 'PUBLIC HEALTH', 5, '2021-11-06 15:15:38', NULL),
(48, 'REL', 'RELIGIOUS STUDIES', 7, '2021-11-06 15:15:38', NULL),
(49, 'RELB', 'RELIGIOUS STUDIES', 7, '2021-11-06 15:15:38', NULL),
(50, 'SEN', 'SOFTWARE ENGINEERING', 2, '2021-11-06 15:15:38', NULL),
(51, 'SGI', 'SURVEYING AND GEO-INFORMATICS', 1, '2021-11-06 15:15:38', NULL),
(52, 'SOC', 'SOCIOLOGY', 8, '2021-11-06 15:15:38', NULL),
(53, 'STA', 'STATISTICS', 1, '2021-11-06 15:15:39', NULL),
(54, 'SWE', 'SOFTWARE ENGINEERING', 2, '2021-11-06 15:15:39', NULL),
(55, 'THA', 'THEATRE ARTS', 7, '2021-11-06 15:15:39', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `colleges`
--
ALTER TABLE `colleges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matric_numbers`
--
ALTER TABLE `matric_numbers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matric_number` (`matric_number`),
  ADD UNIQUE KEY `form_number` (`form_number`,`session`,`active`);

--
-- Indexes for table `matric_numbers_logs`
--
ALTER TABLE `matric_numbers_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `programmes`
--
ALTER TABLE `programmes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `colleges`
--
ALTER TABLE `colleges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `matric_numbers`
--
ALTER TABLE `matric_numbers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `matric_numbers_logs`
--
ALTER TABLE `matric_numbers_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `programmes`
--
ALTER TABLE `programmes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
