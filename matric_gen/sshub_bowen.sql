-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 14, 2021 at 06:48 PM
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
-- Database: `sshub_bowen`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `DepartmentCode` varchar(45) NOT NULL,
  `DepartmentName` varchar(150) NOT NULL,
  `Faculty_FacultyCode1` varchar(45) NOT NULL,
  `levels` int(11) NOT NULL,
  `DeptCodeID` varchar(3) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`DepartmentCode`, `DepartmentName`, `Faculty_FacultyCode1`, `levels`, `DeptCodeID`, `created_at`, `updated_at`) VALUES
('ACC', 'Accounting', 'COMSS', 4, NULL, '2021-07-27 09:07:24', NULL),
('AGR', 'Agriculture', 'COAES', 5, NULL, '2021-07-27 09:07:24', NULL),
('ANA', 'Anatomy', 'COHES', 4, NULL, '2021-07-27 09:07:24', NULL),
('ANAB', 'Anatomy Intercalated', 'COHES', 4, NULL, '2021-07-27 09:07:24', NULL),
('ARC', 'Architecture', 'COEVS', 5, NULL, '2021-07-27 09:07:24', NULL),
('ASE', 'Agricultural Extension and Social Engineering', 'COAES', 5, NULL, '2021-07-27 09:07:24', NULL),
('BCH', 'Biochemistry', 'COAES', 4, NULL, '2021-07-27 09:07:24', NULL),
('BCHB', 'Biochemistry Intercalated', 'COAES', 4, NULL, '2021-07-27 09:07:24', NULL),
('BFN', 'Banking and Finance', 'COMSS', 4, NULL, '2021-07-27 09:07:24', NULL),
('BUS', 'Business Administration', 'COMSS', 4, NULL, '2021-07-27 09:07:24', NULL),
('CBS', 'Cyber Security', 'COCCS', 4, NULL, '2021-07-27 09:07:24', NULL),
('CIT', 'Computer Science', 'COCCS', 4, NULL, '2021-07-27 09:07:24', NULL),
('CMA', 'Communication Arts', 'COCCS', 4, NULL, '2021-07-27 09:07:24', NULL),
('CSA', 'Computer Studies', 'COGES', 5, NULL, '2021-07-27 09:07:24', NULL),
('CYB', 'Cyber Security', 'COCCS', 4, NULL, '2021-07-27 09:07:24', NULL),
('DDS', 'Directorate of Digital Services', 'CODES', 4, 'DDS', '2021-07-27 09:07:24', NULL),
('ECN', 'Economics', 'COMSS', 4, NULL, '2021-07-27 09:07:24', NULL),
('EEE', 'Electrical and Electronics Engineering', 'COAES', 5, NULL, '2021-07-27 09:07:24', NULL),
('EES', 'Entrepreneurship Employability Studies', 'COGES', 4, NULL, '2021-07-27 09:07:24', NULL),
('ENG', 'English', 'COLBS', 4, NULL, '2021-07-27 09:07:24', NULL),
('FST', 'Food Science and Technology', 'COAES', 5, NULL, '2021-07-27 09:07:24', NULL),
('GEL', 'Godliness, Excellence and Leadership', 'COGES', 4, NULL, '2021-07-27 09:07:24', NULL),
('GST', 'General Studies', 'COGES', 4, NULL, '2021-07-27 09:07:24', NULL),
('HIS', 'History and International Studies', 'COLBS', 4, NULL, '2021-07-27 09:07:24', NULL),
('ICH', 'Industrial Chemistry', 'COAES', 4, NULL, '2021-07-27 09:07:24', NULL),
('IFT', 'Information Technology', 'COCCS', 4, NULL, '2021-07-27 09:07:24', NULL),
('INT', 'Information Technology', 'COCCS', 4, NULL, '2021-07-27 09:07:24', NULL),
('IRD', 'International Relations', 'COMSS', 4, NULL, '2021-07-27 09:07:24', NULL),
('IRP', 'Industrial Relations and Personnel Management', 'COMSS', 4, NULL, '2021-07-27 09:07:24', NULL),
('LAW', 'Law', 'COLAW', 5, NULL, '2021-07-27 09:07:24', NULL),
('MAS', 'Mass Communication', 'COCCS', 4, NULL, '2021-07-27 09:07:24', NULL),
('MAT', 'Mathematics', 'COAES', 4, NULL, '2021-07-27 09:07:24', NULL),
('MCB', 'Microbiology', 'COAES', 4, NULL, '2021-07-27 09:07:24', NULL),
('MCT', 'Mechatronics Engineering', 'COAES', 5, NULL, '2021-07-27 09:07:24', NULL),
('MED', 'Medicine and Surgery', 'COHES', 7, NULL, '2021-07-27 09:07:24', NULL),
('MLS', 'Medical Laboratory Science', 'COHES', 5, NULL, '2021-07-27 09:07:24', NULL),
('MUS', 'Music', 'COLBS', 4, NULL, '2021-07-27 09:07:24', NULL),
('NSC', 'Nursing Science', 'COHES', 5, NULL, '2021-07-27 09:07:24', NULL),
('NTD', 'Nutrition and Dietetics', 'COHES', 4, NULL, '2021-07-27 09:07:24', NULL),
('PAB', 'Pure and Applied Biology', 'COAES', 4, NULL, '2021-07-27 09:07:24', NULL),
('PDS', 'Political Science', 'COMSS', 4, NULL, '2021-07-27 09:07:24', NULL),
('PHL', 'Philosophy', 'COLBS', 4, NULL, '2021-07-27 09:07:24', NULL),
('PHS', 'Physiology', 'COHES', 4, NULL, '2021-07-27 09:07:24', NULL),
('PHSB', 'Physiology Intercarlated', 'COHES', 4, NULL, '2021-07-27 09:07:24', NULL),
('PHY', 'Physics', 'COAES', 4, NULL, '2021-07-27 09:07:24', NULL),
('PST', 'Physiotherapy', 'COHES', 5, NULL, '2021-07-27 09:07:24', NULL),
('PSTB', 'Physiotherapy Intercarlated', 'COHES', 5, NULL, '2021-07-27 09:07:24', NULL),
('PUH', 'Public Health', 'COHES', 4, NULL, '2021-07-27 09:07:24', NULL),
('REL', 'Religious Studies', 'COLBS', 4, NULL, '2021-07-27 09:07:24', NULL),
('RELB', 'Religious Studies', 'COLBS', 4, NULL, '2021-07-27 09:07:24', NULL),
('SEN', 'Software Engineering', 'COCCS', 4, NULL, '2021-07-27 09:07:24', NULL),
('SGI', 'Surveying and Geo-Informatics', 'COAES', 4, NULL, '2021-07-27 09:07:24', NULL),
('SOC', 'Sociology', 'COMSS', 4, NULL, '2021-07-27 09:07:24', NULL),
('STA', 'Statistics', 'COAES', 4, NULL, '2021-07-27 09:07:24', NULL),
('SWE', 'Software Engineering', 'COCCS', 4, NULL, '2021-07-27 09:07:24', NULL),
('THA', 'Theatre Arts', 'COLBS', 4, NULL, '2021-07-27 09:07:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `FacultyCode` varchar(45) NOT NULL,
  `FacultyName` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`FacultyCode`, `FacultyName`) VALUES
('COAES', 'AGRICULTURE, ENGINEERING AND SCIENCE'),
('COCCS', 'COMPUTING AND COMMUNICATION STUDIES'),
('COEVS', 'ENVIRONMENTAL SCIENCES'),
('COGES', 'GENERAL STUDIES'),
('COHES', 'HEALTH SCIENCES'),
('COLAW', 'LAW'),
('COLBS', 'LIBERAL STUDIES'),
('COMSS', 'MANAGEMENT AND SOCIAL SCIENCES'),
('COPGS', 'POSTGRADUATE STUDIES');

-- --------------------------------------------------------

--
-- Table structure for table `matric_numbers`
--

CREATE TABLE `matric_numbers` (
  `id` int(11) NOT NULL,
  `matric_number` varchar(25) NOT NULL,
  `form_number` varchar(25) NOT NULL,
  `email` varchar(150) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `college` varchar(5) NOT NULL,
  `programme` varchar(4) NOT NULL,
  `session` varchar(9) NOT NULL,
  `level` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DepartmentCode`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`FacultyCode`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `matric_numbers`
--
ALTER TABLE `matric_numbers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matric_numbers_logs`
--
ALTER TABLE `matric_numbers_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
