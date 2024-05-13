-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2024 at 08:14 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sticlasskode`
--

-- --------------------------------------------------------

--
-- Table structure for table `con_coach_course`
--

CREATE TABLE `con_coach_course` (
  `CCHID` varchar(25) NOT NULL,
  `CRSID` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `con_coach_course`
--

INSERT INTO `con_coach_course` (`CCHID`, `CRSID`) VALUES
('00000000001', '00000000001'),
('00000000001', '00000000026'),
('00000000002', '00000000002'),
('00000000002', '00000000009'),
('00000000003', '00000000009'),
('00000000004', '00000000017'),
('00000000005', '00000000040'),
('00000000007', '00000000003'),
('00000000007', '00000000007'),
('00000000007', '00000000013'),
('00000000007', '00000000029');

-- --------------------------------------------------------

--
-- Table structure for table `con_course_course`
--

CREATE TABLE `con_course_course` (
  `PRGID` varchar(25) NOT NULL,
  `CRSID` varchar(25) NOT NULL,
  `Type` enum('Lecture','Laboratory','Tutorial') NOT NULL,
  `AssignedUnits` double(1,1) NOT NULL,
  `Minutes` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `con_course_course`
--

INSERT INTO `con_course_course` (`PRGID`, `CRSID`, `Type`, `AssignedUnits`, `Minutes`) VALUES
('00000000001', '00000000001', 'Lecture', 0.9, 180),
('00000000001', '00000000002', 'Lecture', 0.9, 180),
('00000000001', '00000000002', 'Laboratory', 0.9, 180),
('00000000001', '00000000009', 'Laboratory', 0.9, 180),
('00000000001', '00000000009', 'Lecture', 0.9, 180),
('00000000001', '00000000017', 'Lecture', 0.9, 120),
('00000000002', '00000000002', 'Lecture', 0.9, 180),
('00000000002', '00000000002', 'Laboratory', 0.9, 180),
('00000000002', '00000000009', 'Lecture', 0.9, 180),
('00000000002', '00000000009', 'Laboratory', 0.9, 180),
('00000000001', '00000000003', 'Lecture', 0.9, 180),
('00000000001', '00000000007', 'Lecture', 0.9, 180),
('00000000001', '00000000013', 'Lecture', 0.9, 180),
('00000000002', '00000000026', 'Lecture', 0.9, 120),
('00000000002', '00000000026', 'Laboratory', 0.9, 180),
('00000000003', '00000000001', 'Lecture', 0.9, 180),
('00000000003', '00000000001', 'Laboratory', 0.9, 180),
('00000000003', '00000000002', 'Lecture', 0.9, 180),
('00000000003', '00000000002', 'Laboratory', 0.9, 180),
('00000000003', '00000000009', 'Lecture', 0.9, 120),
('00000000003', '00000000009', 'Laboratory', 0.9, 180),
('00000000001', '00000000029', 'Lecture', 0.9, 180),
('00000000001', '00000000029', 'Laboratory', 0.9, 180),
('00000000001', '00000000040', 'Lecture', 0.9, 150),
('00000000001', '00000000040', 'Laboratory', 0.9, 90);

--
-- Triggers `con_course_course`
--
DELIMITER $$
CREATE TRIGGER `Units_to_Minutes` BEFORE INSERT ON `con_course_course` FOR EACH ROW BEGIN

	SET New.Minutes = New.AssignedUnits * 60;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `con_course_curriculum`
--

CREATE TABLE `con_course_curriculum` (
  `CRRID` varchar(25) NOT NULL,
  `DPTID` varchar(25) NOT NULL,
  `PRGID` varchar(25) NOT NULL,
  `CRSID` varchar(25) NOT NULL,
  `SCTID` varchar(25) NOT NULL,
  `Units` decimal(2,1) NOT NULL DEFAULT 0.0,
  `ClassType` enum('Lecture','Laboratory') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `con_course_curriculum`
--

INSERT INTO `con_course_curriculum` (`CRRID`, `DPTID`, `PRGID`, `CRSID`, `SCTID`, `Units`, `ClassType`) VALUES
('00000000001', '00000000001', '00000000001', '00000000001', '00000000001', 3.0, 'Lecture'),
('00000000001', '00000000001', '00000000001', '00000000002', '00000000002', 3.0, 'Lecture'),
('00000000001', '00000000001', '00000000001', '00000000002', '00000000002', 3.0, 'Laboratory'),
('00000000001', '00000000001', '00000000001', '00000000003', '00000000001', 3.0, 'Lecture'),
('00000000001', '00000000001', '00000000001', '00000000007', '00000000001', 3.0, 'Lecture'),
('00000000001', '00000000001', '00000000001', '00000000009', '00000000003', 3.0, 'Lecture'),
('00000000001', '00000000001', '00000000001', '00000000009', '00000000003', 3.0, 'Laboratory'),
('00000000001', '00000000001', '00000000001', '00000000013', '00000000003', 3.0, 'Lecture'),
('00000000001', '00000000001', '00000000001', '00000000017', '00000000005', 3.0, 'Lecture'),
('00000000001', '00000000001', '00000000001', '00000000029', '00000000003', 3.0, 'Lecture'),
('00000000001', '00000000001', '00000000001', '00000000029', '00000000003', 3.0, 'Laboratory'),
('00000000001', '00000000001', '00000000002', '00000000002', '00000000009', 3.0, 'Lecture'),
('00000000001', '00000000001', '00000000002', '00000000002', '00000000009', 3.0, 'Laboratory'),
('00000000001', '00000000001', '00000000002', '00000000009', '00000000011', 3.0, 'Lecture'),
('00000000001', '00000000001', '00000000002', '00000000009', '00000000011', 3.0, 'Laboratory'),
('00000000001', '00000000001', '00000000002', '00000000026', '00000000011', 3.0, 'Lecture'),
('00000000001', '00000000001', '00000000002', '00000000026', '00000000011', 3.0, 'Laboratory'),
('00000000001', '00000000001', '00000000003', '00000000001', '00000000032', 3.0, 'Lecture'),
('00000000001', '00000000001', '00000000003', '00000000001', '00000000032', 3.0, 'Laboratory'),
('00000000001', '00000000001', '00000000003', '00000000002', '00000000032', 3.0, 'Lecture'),
('00000000001', '00000000001', '00000000003', '00000000002', '00000000032', 3.0, 'Laboratory'),
('00000000001', '00000000001', '00000000003', '00000000009', '00000000032', 3.0, 'Lecture'),
('00000000001', '00000000001', '00000000003', '00000000009', '00000000032', 3.0, 'Laboratory'),
('00000000001', '00000000001', '00000000003', '00000000040', '00000000034', 3.0, 'Lecture'),
('00000000001', '00000000004', '00000000005', '00000000003', '00000000018', 2.5, 'Lecture');

-- --------------------------------------------------------

--
-- Table structure for table `con_section_course`
--

CREATE TABLE `con_section_course` (
  `SCTID` varchar(25) NOT NULL,
  `CRSID` varchar(25) NOT NULL,
  `PRGID` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `con_section_course`
--

INSERT INTO `con_section_course` (`SCTID`, `CRSID`, `PRGID`) VALUES
('00000000001', '00000000001', '00000000001'),
('00000000001', '00000000003', '00000000001'),
('00000000001', '00000000007', '00000000001'),
('00000000002', '00000000002', '00000000001'),
('00000000003', '00000000009', '00000000001'),
('00000000003', '00000000013', '00000000001'),
('00000000003', '00000000029', '00000000001'),
('00000000005', '00000000017', '00000000001'),
('00000000006', '00000000040', '00000000001'),
('00000000009', '00000000002', '00000000002'),
('00000000011', '00000000009', '00000000002'),
('00000000011', '00000000024', '00000000002'),
('00000000011', '00000000026', '00000000002'),
('00000000032', '00000000001', '00000000003'),
('00000000032', '00000000002', '00000000003'),
('00000000032', '00000000009', '00000000003'),
('00000000034', '00000000040', '00000000003'),
('00000000018', '00000000003', '00000000005');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_academicyear`
--

CREATE TABLE `tbl_academicyear` (
  `AYID` varchar(25) NOT NULL,
  `AcademicYear` varchar(25) NOT NULL,
  `Start` varchar(4) NOT NULL,
  `End` varchar(4) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `Deleted` enum('True','False') NOT NULL DEFAULT 'False'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_academicyear`
--

INSERT INTO `tbl_academicyear` (`AYID`, `AcademicYear`, `Start`, `End`, `DateCreated`, `Deleted`) VALUES
('00000000001', 'AY-2024-2025', '2024', '2025', '2024-03-23 08:53:25', 'False');

--
-- Triggers `tbl_academicyear`
--
DELIMITER $$
CREATE TRIGGER `Academic_Year_ID` BEFORE INSERT ON `tbl_academicyear` FOR EACH ROW BEGIN
	SET New.AYID = CONCAT('00000', LPAD((SELECT COUNT(*) FROM tbl_academicyear) + 1, 6, "0"));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coach`
--

CREATE TABLE `tbl_coach` (
  `CCHID` varchar(25) NOT NULL,
  `SCHLID` varchar(25) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleInitial` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `CoachType` enum('Fulltime','Parttime') NOT NULL,
  `Units` varchar(5) NOT NULL,
  `DPTID` varchar(25) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `ContactNumber` varchar(11) NOT NULL,
  `Facebook` varchar(255) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `Deleted` enum('True','False') NOT NULL DEFAULT 'False'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_coach`
--

INSERT INTO `tbl_coach` (`CCHID`, `SCHLID`, `FirstName`, `MiddleInitial`, `LastName`, `CoachType`, `Units`, `DPTID`, `Email`, `ContactNumber`, `Facebook`, `DateCreated`, `Deleted`) VALUES
('00000000001', '25', 'Joshua Rhey', 'N', 'Oliveros', 'Fulltime', '26', '00000000001', 'oliveros.257907@munoz.sti.edu.ph', '09682349311', 'https://www.facebook.com', '0000-00-00 00:00:00', 'False'),
('00000000002', '1', 'Genesis ', '', 'Demetillo', 'Fulltime', '24', '00000000001', 'a@b.c', '0', '0', '0000-00-00 00:00:00', 'False'),
('00000000003', '2', 'John Rexon ', '', 'Insigne', 'Fulltime', '26', '00000000001', 'd@e.f', '1', '1', '0000-00-00 00:00:00', 'False'),
('00000000004', '3', 'Miguel Jerome ', '', 'Silverio', 'Fulltime', '24', '00000000001', 'g@h.i', '2', '2', '0000-00-00 00:00:00', 'False'),
('00000000005', '4', 'Monaliza ', '', 'Reyes', 'Fulltime', '26', '00000000001', 'j@k.l', '3', '3', '0000-00-00 00:00:00', 'False'),
('00000000006', '5', 'Reynante ', '', 'Pascua', 'Fulltime', '24', '00000000001', 'm@n.o', '4', '4', '0000-00-00 00:00:00', 'False'),
('00000000007', '9', 'Cristylen', 'Q', 'Esporsado', 'Fulltime', '24', '00000000007', 'l@l.l', '5', '5', '0000-00-00 00:00:00', 'False');

--
-- Triggers `tbl_coach`
--
DELIMITER $$
CREATE TRIGGER `Coach_ID` BEFORE INSERT ON `tbl_coach` FOR EACH ROW BEGIN
	SET New.CCHID = CONCAT('00000', LPAD((SELECT COUNT(*) FROM tbl_coach) + 1, 6, "0"));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_course`
--

CREATE TABLE `tbl_course` (
  `CRSID` varchar(25) NOT NULL,
  `CourseCode` varchar(25) NOT NULL,
  `CourseName` varchar(255) NOT NULL,
  `CourseLevel` enum('Major','Minor') NOT NULL,
  `DPTID` varchar(25) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `Deleted` enum('True','False') NOT NULL DEFAULT 'False'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_course`
--

INSERT INTO `tbl_course` (`CRSID`, `CourseCode`, `CourseName`, `CourseLevel`, `DPTID`, `DateCreated`, `Deleted`) VALUES
('00000000001', 'CITE1004', 'Introduction to Computing', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000002', 'CITE1003', 'Computer Programming 1', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000003', 'GEDC1002', 'The Contemporary World', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000004', 'STIC1002', 'Euthenics 1', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000005', 'GEDC1005', 'Mathematics in the Modern World', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000006', 'NSTP1008', 'National Service Training Program 1', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000007', 'PHED1001', 'Physical Education 1', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000008', 'GEDC1008', 'Understanding the Self', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000009', 'CITE1006', 'Computer Programming 2', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000010', 'COSC1002', 'Discrete Structure 1', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000011', 'GEDC1010', 'Art Appreciation', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000012', 'NSTP1010', 'National Service Training Program 2', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000013', 'PHED1002', 'Physical Education 2', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000014', 'GEDC1016', 'Purposive Communication', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000015', 'GEDC1013', 'Science, Technology, and Society', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000016', 'COSC1046', 'College Calculus', 'Major', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000017', 'COSC1003', 'Data Structures and Algorithms', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000018', 'COSC1006', 'Discrete Structure 2', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000019', 'GEDC1003', 'The Entrepreneurial Mind', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000020', 'GEDC1014', 'Rizal\'s Life and Works', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000021', 'PHED1003', 'Physical Education 3', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000022', 'GEDC1006', 'Readings of Philippine History', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000023', 'COSC1001', 'Principles of Communication', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000024', 'CITE1010', 'Computer Programming 3', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000025', 'COSC1009', 'Design and Analysis of Algorithms', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000026', 'CITE1011', 'Information Management', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000027', 'GEDC1041', 'Philippine Pop Culture', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000028', 'GEDC1009', 'Ethics', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000029', 'PHED1004', 'Physical Education 4', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000030', 'COSC1007', 'Human Computer Interaction', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000031', 'GEDC1045', 'Great Books', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000032', 'COSC1015', 'Introduction to Web Programming (CS Elective 1)', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000033', 'INTE1023', 'Computer Systems Architecture', 'Major', '00000000005', '0000-00-00 00:00:00', 'False'),
('00000000034', 'COSC1014', 'Theory of Computations with Automata', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000035', 'INTE1007', 'Quantitative Methods (Data Analysis)', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000036', 'INSY1010', 'Information Assurance and Security (Cybersecurity Essentials)', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000037', 'COSC1023', 'Intermediate Web Programming', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000038', 'COSC1028', 'Artificial Intelligence', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000039', 'CITE1008', 'Application Development and Emerging Technologies', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000040', 'COSC1021', 'Software Engineering 1', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000041', 'COSC1048', 'Methods of Research (Thesis 0)', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000042', 'INTE1005', 'Network Technology 1', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000043', 'COSC1008', 'Platform Technology (Operating Systems)', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000044', 'COSC1050', 'CS Thesis 2', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000045', 'STIC1007', 'Euthenics 2', 'Minor', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000046', 'BUSS1013', 'Technopreneurship', 'Minor', '00000000002', '0000-00-00 00:00:00', 'False'),
('00000000047', 'INSY1003', 'Professional Issues in Information Systems and Technology', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000048', 'INSY1005', 'Information Assurance and Security (Data Privacy)', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000049', 'INSY1007', 'Software Quality Assurance', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000050', 'COSC1016', 'Modeling and Simulation', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000051', 'CITE1013', 'Computer Organization', 'Major', '00000000005', '0000-00-00 00:00:00', 'False'),
('00000000052', 'COSC1025', 'Software Engineering 2', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000053', 'COSC1042', 'Game Programming', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000054', 'COSC1020', 'Programming Languages', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000055', 'COSC1026', 'Advance Web Programming', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000056', 'COSC1049', 'CS Thesis 1', 'Major', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000057', 'COSC1010', 'Web Developement (REACTJS)', 'Major', '00000000001', '0000-00-00 00:00:00', 'True'),
('00000000058', '321', '321', 'Major', '00000000001', '0000-00-00 00:00:00', 'True'),
('00000000059', 'A', 'a', '', '00000000001', '0000-00-00 00:00:00', 'True'),
('00000000060', 'ADSA', 'adsa', 'Major', '00000000002', '0000-00-00 00:00:00', 'True');

--
-- Triggers `tbl_course`
--
DELIMITER $$
CREATE TRIGGER `Capitalize_Course_Code` BEFORE INSERT ON `tbl_course` FOR EACH ROW BEGIN
	SET NEW.CourseCode = UPPER(NEW.CourseCode);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Course_ID` BEFORE INSERT ON `tbl_course` FOR EACH ROW BEGIN
	SET New.CRSID = CONCAT('00000', LPAD((SELECT COUNT(*) FROM tbl_course) + 1, 6, "0"));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_curriculum`
--

CREATE TABLE `tbl_curriculum` (
  `CRRID` varchar(25) NOT NULL,
  `CRRname` varchar(255) NOT NULL,
  `CRRdescription` text NOT NULL,
  `CRRstartyear` varchar(4) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `Deleted` enum('True','False') NOT NULL DEFAULT 'False'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_curriculum`
--

INSERT INTO `tbl_curriculum` (`CRRID`, `CRRname`, `CRRdescription`, `CRRstartyear`, `DateCreated`, `Deleted`) VALUES
('00000000001', 'Sample Curriculum', 'This is the description for sample curriculum.', '2024', '2024-03-28 23:29:45', 'False');

--
-- Triggers `tbl_curriculum`
--
DELIMITER $$
CREATE TRIGGER `Curriculum_ID` BEFORE INSERT ON `tbl_curriculum` FOR EACH ROW BEGIN
	SET New.CRRID = CONCAT('00000', LPAD((SELECT COUNT(*) FROM tbl_curriculum) + 1, 6, "0"));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

CREATE TABLE `tbl_department` (
  `DPTID` varchar(25) NOT NULL,
  `DepartmentCode` varchar(25) NOT NULL,
  `DepartmentName` varchar(255) NOT NULL,
  `DepartmentAbbrev` varchar(25) NOT NULL,
  `DepartmentDescription` varchar(255) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `Deleted` enum('True','False') NOT NULL DEFAULT 'False'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_department`
--

INSERT INTO `tbl_department` (`DPTID`, `DepartmentCode`, `DepartmentName`, `DepartmentAbbrev`, `DepartmentDescription`, `DateCreated`, `Deleted`) VALUES
('00000000001', 'INF-ICT-001', 'Information Communication and Technology', 'ICT', '', '0000-00-00 00:00:00', 'False'),
('00000000002', 'BUS-BM-001', 'Business & Management', 'BMA', '...', '0000-00-00 00:00:00', 'False'),
('00000000003', 'HOS-HM-001', 'Hospitality Management', 'HM', ' ', '0000-00-00 00:00:00', 'False'),
('00000000004', 'TOU-TM-001', 'Tourism Management', 'TM', '', '0000-00-00 00:00:00', 'False'),
('00000000005', 'ENG-ENG-001', 'Engineering', 'ENG', ' ', '0000-00-00 00:00:00', 'False'),
('00000000006', 'ART-AAS-001', 'Arts & Sciences', 'AAS', '', '0000-00-00 00:00:00', 'False'),
('00000000007', 'GEE-GEE-001', 'General Education', 'GE', '', '0000-00-00 00:00:00', 'False'),
('00000000008', 'ACAD-TRK-001', 'Academic Track', 'ACD', '', '0000-00-00 00:00:00', 'False'),
('00000000009', 'TECH-VOC-001', 'Technical Vocational Livelihood Track', 'TVL', '', '0000-00-00 00:00:00', 'False'),
('00000000010', '2s', '12', '12', '12', '0000-00-00 00:00:00', 'True'),
('00000000011', 'a', 'a', 'a', 'a', '0000-00-00 00:00:00', 'True'),
('00000000012', 'adsa', 'sad', 'dss', 'asdsa', '0000-00-00 00:00:00', 'True');

--
-- Triggers `tbl_department`
--
DELIMITER $$
CREATE TRIGGER `Department_ID` BEFORE INSERT ON `tbl_department` FOR EACH ROW BEGIN
	SET New.DPTID = CONCAT('00000', LPAD((SELECT COUNT(*) FROM tbl_department) + 1, 6, "0"));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logs`
--

CREATE TABLE `tbl_logs` (
  `LOGID` varchar(25) NOT NULL,
  `TargetedUser` varchar(255) NOT NULL,
  `TargetedUserLevel` varchar(255) NOT NULL,
  `Action` varchar(255) NOT NULL,
  `DateCreated` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permission`
--

CREATE TABLE `tbl_permission` (
  `PRMID` varchar(25) NOT NULL,
  `UUID` varchar(25) NOT NULL,
  `File_Maintainance` enum('True','False') NOT NULL DEFAULT 'False',
  `Access_View` enum('True','False') NOT NULL DEFAULT 'False',
  `Access_Edit` enum('True','False') NOT NULL DEFAULT 'False',
  `Access_Insert` enum('True','False') NOT NULL DEFAULT 'False'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_permission`
--

INSERT INTO `tbl_permission` (`PRMID`, `UUID`, `File_Maintainance`, `Access_View`, `Access_Edit`, `Access_Insert`) VALUES
('00000000001', '00000000001', 'True', 'True', 'True', 'True'),
('00000000002', '00000000002', 'False', 'True', 'False', 'False'),
('00000000003', '00000000003', 'False', 'True', 'False', 'False'),
('00000000004', '00000000004', 'False', 'True', 'False', 'False');

--
-- Triggers `tbl_permission`
--
DELIMITER $$
CREATE TRIGGER `Permission_ID` BEFORE INSERT ON `tbl_permission` FOR EACH ROW BEGIN
	SET New.PRMID = CONCAT('00000', LPAD((SELECT COUNT(*) FROM tbl_permission) + 1, 6, "0"));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_program`
--

CREATE TABLE `tbl_program` (
  `PRGID` varchar(25) NOT NULL,
  `ProgramCode` varchar(25) NOT NULL,
  `ProgramName` varchar(255) NOT NULL,
  `ProgramAbbrev` varchar(25) NOT NULL,
  `YearLevel` enum('Tertiary','SHS') NOT NULL,
  `ProgramDescription` varchar(255) NOT NULL,
  `DPTID` varchar(25) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `Deleted` enum('True','False') NOT NULL DEFAULT 'False'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_program`
--

INSERT INTO `tbl_program` (`PRGID`, `ProgramCode`, `ProgramName`, `ProgramAbbrev`, `YearLevel`, `ProgramDescription`, `DPTID`, `DateCreated`, `Deleted`) VALUES
('00000000001', 'INF-CS-001', 'Bachelor of Science in Computer Science', 'BS', 'Tertiary', '', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000002', 'INF-IT-001', 'Bachelor of Science in Information Technology', 'IT', 'Tertiary', '', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000003', 'INF-IS-001', 'Bachelor of Science in Information Systems', 'IS', 'Tertiary', '', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000004', 'ENG-COE-001', 'Bachelor of Science in Computer Engineering', 'COE', 'Tertiary', '', '00000000005', '0000-00-00 00:00:00', 'False'),
('00000000005', 'TOU-TM-001', 'Bachelor of Science in Tourism Management', 'TM', 'Tertiary', '', '00000000004', '0000-00-00 00:00:00', 'False'),
('00000000006', 'HOS-HM-001', 'Bachelor of Science in Hospitality Management', 'HM', 'Tertiary', '', '00000000003', '0000-00-00 00:00:00', 'False'),
('00000000007', 'ACD-STEM-001', 'Science, Technology, Engineering, and Mathematics', 'STEM', 'SHS', '', '00000000008', '0000-00-00 00:00:00', 'False'),
('00000000008', 'ACD-HUMM-001', 'Humanities and Social Sciences', 'HUMMS', 'SHS', '', '00000000008', '0000-00-00 00:00:00', 'False'),
('00000000009', 'ACD-GAA-001', 'General Academic', 'GA', 'SHS', '', '00000000008', '0000-00-00 00:00:00', 'False'),
('00000000010', 'ACD-ACC-001', 'Accountancy, Business, and Management', 'ABM', 'SHS', '', '00000000008', '0000-00-00 00:00:00', 'False'),
('00000000011', 'TVL-CCT-001', 'Computer and Communications Technology', 'CCTECH', 'SHS', '', '00000000009', '0000-00-00 00:00:00', 'False'),
('00000000012', 'TVL-DGAR-001', 'Digital Arts', 'DGAR', 'SHS', '', '00000000009', '0000-00-00 00:00:00', 'False'),
('00000000013', 'a', 'a', 'a', 'Tertiary', '', '00000000005', '0000-00-00 00:00:00', 'True'),
('00000000014', 'gd', 'gd', 'gd', 'SHS', '', '00000000002', '0000-00-00 00:00:00', 'True');

--
-- Triggers `tbl_program`
--
DELIMITER $$
CREATE TRIGGER `Program_ID` BEFORE INSERT ON `tbl_program` FOR EACH ROW BEGIN
	SET New.PRGID = CONCAT('00000', LPAD((SELECT COUNT(*) FROM tbl_program) + 1, 6, "0"));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_room`
--

CREATE TABLE `tbl_room` (
  `RMID` varchar(25) NOT NULL,
  `RoomName` varchar(255) NOT NULL,
  `Capacity` int(5) NOT NULL,
  `Type` enum('Regular Room','Laboratory','Audio Visual Room','Court','Others') NOT NULL,
  `Building` enum('Main','Annex-A','Annex-B') NOT NULL,
  `Floor` enum('First Floor','Second Floor','Third Floor') NOT NULL,
  `DateCreated` datetime NOT NULL,
  `Deleted` enum('True','False') NOT NULL DEFAULT 'False'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_room`
--

INSERT INTO `tbl_room` (`RMID`, `RoomName`, `Capacity`, `Type`, `Building`, `Floor`, `DateCreated`, `Deleted`) VALUES
('00000000001', '301M', 45, 'Regular Room', 'Main', 'Third Floor', '0000-00-00 00:00:00', 'False'),
('00000000002', '302M', 45, 'Regular Room', 'Main', 'Third Floor', '0000-00-00 00:00:00', 'False'),
('00000000003', '303M', 45, 'Regular Room', 'Main', 'Third Floor', '0000-00-00 00:00:00', 'False'),
('00000000004', '304M', 45, 'Regular Room', 'Main', 'Third Floor', '0000-00-00 00:00:00', 'False'),
('00000000005', 'ComLab1', 50, 'Laboratory', 'Main', 'Second Floor', '0000-00-00 00:00:00', 'False'),
('00000000006', 'ComLab2', 50, 'Laboratory', 'Main', 'Second Floor', '0000-00-00 00:00:00', 'False'),
('00000000007', 'ComLab3', 50, 'Laboratory', 'Main', 'Second Floor', '0000-00-00 00:00:00', 'False'),
('00000000008', 'ComLab4', 50, 'Laboratory', 'Main', 'Second Floor', '0000-00-00 00:00:00', 'False'),
('00000000009', 'Conference Room', 45, 'Others', 'Annex-A', 'First Floor', '0000-00-00 00:00:00', 'False'),
('00000000010', 'SciLab', 45, 'Laboratory', 'Annex-A', 'Second Floor', '0000-00-00 00:00:00', 'False'),
('00000000011', '101B', 45, 'Regular Room', 'Annex-B', 'First Floor', '0000-00-00 00:00:00', 'False'),
('00000000012', '102B', 45, 'Regular Room', 'Annex-B', 'First Floor', '0000-00-00 00:00:00', 'False'),
('00000000013', '103B', 45, 'Regular Room', 'Annex-B', 'First Floor', '0000-00-00 00:00:00', 'False'),
('00000000014', '104B', 45, 'Regular Room', 'Annex-B', 'First Floor', '0000-00-00 00:00:00', 'False'),
('00000000015', '105B', 25, 'Regular Room', 'Annex-B', 'First Floor', '0000-00-00 00:00:00', 'False'),
('00000000016', '106B', 45, 'Regular Room', 'Annex-B', 'First Floor', '0000-00-00 00:00:00', 'False'),
('00000000017', '107B', 45, 'Regular Room', 'Annex-B', 'First Floor', '0000-00-00 00:00:00', 'False'),
('00000000018', 'Court', 100, 'Court', 'Annex-B', 'First Floor', '0000-00-00 00:00:00', 'False'),
('00000000019', '201B', 45, 'Regular Room', 'Annex-B', 'Second Floor', '0000-00-00 00:00:00', 'False'),
('00000000020', '202B', 45, 'Regular Room', 'Annex-B', 'Second Floor', '0000-00-00 00:00:00', 'False'),
('00000000021', '203B', 45, 'Regular Room', 'Annex-B', 'Second Floor', '0000-00-00 00:00:00', 'False'),
('00000000022', '204B', 45, 'Regular Room', 'Annex-B', 'Second Floor', '0000-00-00 00:00:00', 'False'),
('00000000023', '205B', 45, 'Regular Room', 'Annex-B', 'Second Floor', '0000-00-00 00:00:00', 'False'),
('00000000024', '206B', 45, 'Regular Room', 'Annex-B', 'Second Floor', '0000-00-00 00:00:00', 'False'),
('00000000025', 'NSTP Room', 15, 'Others', 'Annex-B', 'Second Floor', '0000-00-00 00:00:00', 'False'),
('00000000026', 'AVR1', 50, 'Audio Visual Room', 'Annex-B', 'Third Floor', '0000-00-00 00:00:00', 'False'),
('00000000027', 'AVR2', 50, 'Audio Visual Room', 'Annex-B', 'Third Floor', '0000-00-00 00:00:00', 'False'),
('00000000028', 'AVR3', 50, 'Audio Visual Room', 'Annex-B', 'Third Floor', '0000-00-00 00:00:00', 'False'),
('00000000029', '305M', 45, 'Regular Room', 'Main', 'Third Floor', '0000-00-00 00:00:00', 'True'),
('00000000030', 'hi', 52, 'Regular Room', 'Annex-A', 'First Floor', '0000-00-00 00:00:00', 'True'),
('00000000031', '101M', 32, 'Regular Room', 'Main', 'First Floor', '0000-00-00 00:00:00', 'True');

--
-- Triggers `tbl_room`
--
DELIMITER $$
CREATE TRIGGER `Create_Room_Name` BEFORE INSERT ON `tbl_room` FOR EACH ROW BEGIN
	DECLARE currFloor INT;
    DECLARE currBuilding VARCHAR(1);
    
    IF NEW.RoomName = '' THEN
        IF NEW.Floor = 'First Floor' THEN
            SET currFloor = '1';
        END IF;

        IF NEW.Floor = 'Second Floor' THEN
            SET currFloor = '2';
        END IF;

        IF NEW.Floor = 'Third Floor' THEN
            SET currFloor = '3';
        END IF;

        IF NEW.Building = 'Main' THEN
            SET currBuilding = 'M';
        END IF;

        IF NEW.Building = 'Annex-A' THEN
            SET currBuilding = 'A';
        END IF;

        IF NEW.Building = 'Annex-B' THEN
            SET currBuilding = 'B';
        END IF;
        
        IF NEW.Type = 'Court' THEN
            SET New.RoomName = CONCAT('Court');
        END IF;

        IF NEW.Type = 'Regular Room' THEN
            SET New.RoomName = CONCAT(currFloor, 
                           LPAD(COALESCE((SELECT COUNT(*) + 1
                                          FROM tbl_room
                                          WHERE Building = NEW.Building 
                                          AND Floor = New.Floor), 1), 2, '0'), 
                                  currBuilding);
        END IF;

        IF NEW.Type = 'Audio Visual Room' THEN
            SET New.RoomName = CONCAT('AVR', 
                           LPAD(COALESCE((SELECT COUNT(*) + 1
                                          FROM tbl_room
                                          WHERE Building = NEW.Building 

                                          AND Floor = New.Floor), 1), 1, '0'));
        END IF;

        IF NEW.Type = 'Practical Area' THEN
            SET New.RoomName = CONCAT('Court', 
                           LPAD(COALESCE((SELECT COUNT(*) + 1
                                          FROM tbl_room
                                          WHERE Building = NEW.Building 
                                          AND Floor = New.Floor), 1), 1, '0'));
        END IF;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Room_ID` BEFORE INSERT ON `tbl_room` FOR EACH ROW BEGIN
	SET New.RMID = CONCAT('00000', LPAD((SELECT COUNT(*) FROM tbl_room) + 1, 6, "0"));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_schedule`
--

CREATE TABLE `tbl_schedule` (
  `SCDID` varchar(25) NOT NULL,
  `CRSID` varchar(25) NOT NULL,
  `SCTID` varchar(25) NOT NULL,
  `Day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Sunday') NOT NULL,
  `StartTime` int(5) NOT NULL,
  `EndTime` int(5) NOT NULL,
  `Time` varchar(25) NOT NULL,
  `RMID` varchar(25) NOT NULL,
  `CCHID` varchar(25) NOT NULL,
  `ScheduledSemester` enum('First Semester','Second Semester') NOT NULL,
  `AYID` varchar(50) NOT NULL,
  `CRRID` varchar(25) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `Deleted` enum('True','False') NOT NULL DEFAULT 'False'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_schedule`
--

INSERT INTO `tbl_schedule` (`SCDID`, `CRSID`, `SCTID`, `Day`, `StartTime`, `EndTime`, `Time`, `RMID`, `CCHID`, `ScheduledSemester`, `AYID`, `CRRID`, `DateCreated`, `Deleted`) VALUES
('00000000001', '00000000001', '00000000032', 'Monday', 480, 660, '8:00 AM - 11:00 AM', '00000000001', '00000000001', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000002', '00000000017', '00000000005', 'Monday', 840, 1020, '2:00 PM - 5:00 PM', '00000000002', '00000000004', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000003', '00000000001', '00000000001', 'Monday', 480, 660, '8:00 AM - 11:00 AM', '00000000003', '00000000001', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000004', '00000000003', '00000000018', 'Monday', 660, 810, '11:00 AM - 1:30 PM', '00000000003', '00000000007', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000005', '00000000009', '00000000003', 'Monday', 660, 840, '11:00 AM - 2:00 PM', '00000000001', '00000000002', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000006', '00000000002', '00000000009', 'Monday', 810, 990, '1:30 PM - 4:30 PM', '00000000003', '00000000002', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000007', '00000000003', '00000000001', 'Sunday', 990, 1170, '4:30 PM - 7:30 PM', '00000000003', '00000000007', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000008', '00000000007', '00000000001', 'Tuesday', 480, 660, '8:00 AM - 11:00 AM', '00000000004', '00000000007', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000009', '00000000009', '00000000011', 'Tuesday', 660, 840, '11:00 AM - 2:00 PM', '00000000004', '00000000002', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000010', '00000000029', '00000000003', 'Tuesday', 840, 1020, '2:00 PM - 5:00 PM', '00000000004', '00000000007', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000011', '00000000009', '00000000032', 'Tuesday', 480, 660, '8:00 AM - 11:00 AM', '00000000005', '00000000003', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000012', '00000000002', '00000000032', 'Tuesday', 660, 840, '11:00 AM - 2:00 PM', '00000000005', '00000000002', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000013', '00000000002', '00000000009', 'Tuesday', 840, 1020, '2:00 PM - 5:00 PM', '00000000005', '00000000002', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000014', '00000000009', '00000000011', 'Wednesday', 480, 660, '8:00 AM - 11:00 AM', '00000000006', '00000000002', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000015', '00000000029', '00000000003', 'Wednesday', 480, 660, '8:00 AM - 11:00 AM', '00000000007', '00000000007', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000016', '00000000001', '00000000032', 'Wednesday', 480, 660, '8:00 AM - 11:00 AM', '00000000008', '00000000001', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000017', '00000000026', '00000000011', 'Thursday', 660, 840, '11:00 AM - 2:00 PM', '00000000006', '00000000001', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000018', '00000000040', '00000000034', 'Monday', 660, 840, '11:00 AM - 2:00 PM', '00000000002', '00000000005', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000019', '00000000009', '00000000003', 'Thursday', 840, 1020, '2:00 PM - 5:00 PM', '00000000006', '00000000003', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000020', '00000000002', '00000000032', 'Thursday', 480, 660, '8:00 AM - 11:00 AM', '00000000011', '00000000002', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000021', '00000000013', '00000000003', 'Friday', 660, 840, '11:00 AM - 2:00 PM', '00000000011', '00000000007', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000022', '00000000009', '00000000032', 'Monday', 840, 1020, '2:00 PM - 5:00 PM', '00000000001', '00000000002', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000023', '00000000002', '00000000002', 'Monday', 480, 660, '8:00 AM - 11:00 AM', '00000000001', '00000000002', 'Second Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000024', '00000000002', '00000000002', 'Tuesday', 480, 660, '8:00 AM - 11:00 AM', '00000000005', '00000000002', 'Second Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000025', '00000000026', '00000000011', 'Monday', 480, 660, '8:00 AM - 11:00 AM', '00000000002', '00000000001', 'First Semester', '00000000001', '00000000001', '0000-00-00 00:00:00', 'False');

--
-- Triggers `tbl_schedule`
--
DELIMITER $$
CREATE TRIGGER `Schedule_ID` BEFORE INSERT ON `tbl_schedule` FOR EACH ROW BEGIN
	SET New.SCDID = CONCAT('00000', LPAD((SELECT COUNT(*) FROM tbl_schedule) + 1, 6, "0"));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_section`
--

CREATE TABLE `tbl_section` (
  `SCTID` varchar(25) NOT NULL,
  `SectionName` varchar(255) NOT NULL,
  `Population` int(5) NOT NULL,
  `Year` enum('Grade 11','Grade 12','First Year','Second Year','Third Year','Fourth Year') NOT NULL,
  `Semester` enum('First Semester','Second Semester') NOT NULL,
  `PRGID` varchar(25) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `Deleted` enum('True','False') NOT NULL DEFAULT 'False'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_section`
--

INSERT INTO `tbl_section` (`SCTID`, `SectionName`, `Population`, `Year`, `Semester`, `PRGID`, `DateCreated`, `Deleted`) VALUES
('00000000001', 'BS101', 12, 'First Year', 'First Semester', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000002', 'BS201', 12, 'First Year', 'Second Semester', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000003', 'BS301', 32, 'Second Year', 'First Semester', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000004', 'BS401', 25, 'Second Year', 'Second Semester', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000005', 'BS501', 12, 'Third Year', 'First Semester', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000006', 'BS601', 32, 'Third Year', 'Second Semester', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000007', 'BS701', 12, 'Fourth Year', 'First Semester', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000008', 'BS801', 32, 'Fourth Year', 'Second Semester', '00000000001', '0000-00-00 00:00:00', 'False'),
('00000000009', 'IT101', 45, 'First Year', 'First Semester', '00000000002', '0000-00-00 00:00:00', 'False'),
('00000000010', 'IT201', 45, 'First Year', 'Second Semester', '00000000002', '0000-00-00 00:00:00', 'False'),
('00000000011', 'IT301', 45, 'Second Year', 'First Semester', '00000000002', '0000-00-00 00:00:00', 'False'),
('00000000012', 'IT401', 45, 'Second Year', 'Second Semester', '00000000002', '0000-00-00 00:00:00', 'False'),
('00000000013', 'IT501', 45, 'Third Year', 'First Semester', '00000000002', '0000-00-00 00:00:00', 'False'),
('00000000014', 'IT601', 45, 'Third Year', 'Second Semester', '00000000002', '0000-00-00 00:00:00', 'False'),
('00000000015', 'IT701', 45, 'Fourth Year', 'First Semester', '00000000002', '0000-00-00 00:00:00', 'False'),
('00000000016', 'IT801', 45, 'Fourth Year', 'Second Semester', '00000000002', '0000-00-00 00:00:00', 'False'),
('00000000017', '0', 42, 'Second Year', 'Second Semester', '00000000004', '0000-00-00 00:00:00', 'True'),
('00000000018', 'TM101', 32, 'First Year', 'First Semester', '00000000005', '0000-00-00 00:00:00', 'False'),
('00000000019', 'TM201', 42, 'First Year', 'Second Semester', '00000000005', '0000-00-00 00:00:00', 'False'),
('00000000020', 'TM301', 12, 'Second Year', 'First Semester', '00000000005', '0000-00-00 00:00:00', 'False'),
('00000000021', 'TM401', 32, 'Second Year', 'Second Semester', '00000000005', '0000-00-00 00:00:00', 'False'),
('00000000022', 'TM501', 24, 'Third Year', 'First Semester', '00000000005', '0000-00-00 00:00:00', 'False'),
('00000000023', 'TM601', 12, 'Third Year', 'Second Semester', '00000000005', '0000-00-00 00:00:00', 'False'),
('00000000024', 'TM701', 32, 'Fourth Year', 'First Semester', '00000000005', '0000-00-00 00:00:00', 'False'),
('00000000025', 'TM801', 24, 'Fourth Year', 'Second Semester', '00000000005', '0000-00-00 00:00:00', 'False'),
('00000000026', 'GA101', 1, 'Grade 11', 'First Semester', '00000000009', '0000-00-00 00:00:00', 'False'),
('00000000027', 'GA201', 6, 'Grade 11', 'Second Semester', '00000000009', '0000-00-00 00:00:00', 'False'),
('00000000028', 'GA301', 3, 'Grade 12', 'First Semester', '00000000009', '0000-00-00 00:00:00', 'False'),
('00000000029', 'GA401', 4, 'Grade 12', 'Second Semester', '00000000009', '0000-00-00 00:00:00', 'False'),
('00000000030', 'HUMMS101', 23, 'First Year', 'First Semester', '00000000008', '0000-00-00 00:00:00', 'False'),
('00000000031', 'STEM701', 43, 'Fourth Year', 'First Semester', '00000000007', '0000-00-00 00:00:00', 'False'),
('00000000032', 'IS101', 32, 'First Year', 'First Semester', '00000000003', '0000-00-00 00:00:00', 'False'),
('00000000033', 'IS201', 12, 'First Year', 'Second Semester', '00000000003', '0000-00-00 00:00:00', 'False'),
('00000000034', 'IS301', 32, 'Second Year', 'First Semester', '00000000003', '0000-00-00 00:00:00', 'False'),
('00000000035', 'IS401', 32, 'Second Year', 'Second Semester', '00000000003', '0000-00-00 00:00:00', 'False'),
('00000000036', 'IS501', 42, 'Third Year', 'First Semester', '00000000003', '0000-00-00 00:00:00', 'False'),
('00000000037', 'IS601', 22, 'Third Year', 'Second Semester', '00000000003', '0000-00-00 00:00:00', 'False'),
('00000000038', 'IS701', 32, 'Fourth Year', 'First Semester', '00000000003', '0000-00-00 00:00:00', 'False'),
('00000000039', 'IS801', 12, 'Fourth Year', 'Second Semester', '00000000003', '0000-00-00 00:00:00', 'False');

--
-- Triggers `tbl_section`
--
DELIMITER $$
CREATE TRIGGER `Create_Section_Name` BEFORE INSERT ON `tbl_section` FOR EACH ROW BEGIN
	DECLARE x INT;
    
    IF NEW.SectionName = '' THEN
        IF NEW.Year = 'First Year' && NEW.Semester = 'First Semester' THEN
            SET x = '1';
        END IF;
        IF NEW.Year = 'First Year' && NEW.Semester = 'Second Semester' THEN
            SET x = '2';
        END IF;
        IF NEW.Year = 'Second Year' && NEW.Semester = 'First Semester' THEN
            SET x = '3';
        END IF;
        IF NEW.Year = 'Second Year' && NEW.Semester = 'Second Semester' THEN
            SET x = '4';
        END IF;
        IF NEW.Year = 'Third Year' && NEW.Semester = 'First Semester' THEN
            SET x = '5';
        END IF;
        IF NEW.Year = 'Third Year' && NEW.Semester = 'Second Semester' THEN
            SET x = '6';
        END IF;
        IF NEW.Year = 'Fourth Year' && NEW.Semester = 'First Semester' THEN
            SET x = '7'; 
        END IF;
        IF NEW.Year = 'Fourth Year' && NEW.Semester = 'Second Semester' THEN
            SET x = '8';
        END IF;
        
        SET New.SectionName = CONCAT((SELECT ProgramAbbrev FROM tbl_program WHERE Deleted = 'False' AND PRGID = NEW.PRGID), x, LPAD(COALESCE((SELECT COUNT(*) + 1 FROM tbl_section JOIN tbl_program ON tbl_section.PRGID = tbl_program.PRGID WHERE tbl_section.Deleted = 'False' AND tbl_section.Year = NEW.Year AND tbl_section.Semester = NEW.Semester AND tbl_section.PRGID = NEW.PRGID), 1), 2, '0'));
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Section_ID` BEFORE INSERT ON `tbl_section` FOR EACH ROW BEGIN
	SET New.SCTID = CONCAT('00000', LPAD((SELECT COUNT(*) FROM tbl_section) + 1, 6, "0"));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `UUID` varchar(25) NOT NULL,
  `SCHLID` varchar(25) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `UserType` enum('Admin','Coach','Student') NOT NULL DEFAULT 'Student',
  `DateCreated` datetime NOT NULL,
  `Deleted` enum('True','False') NOT NULL DEFAULT 'False'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`UUID`, `SCHLID`, `FirstName`, `LastName`, `Email`, `Password`, `UserType`, `DateCreated`, `Deleted`) VALUES
('00000000001', '0', '', 'admin', 'admin@admin.com', 'admin', 'Admin', '2024-03-23 12:20:39', 'False'),
('00000000002', '02000257907', 'Mark Limuel', 'Lape', 'Lape.257907@munoz.sti.edu.ph', 'Lape_Mark', 'Student', '0000-00-00 00:00:00', 'False'),
('00000000003', '02000255661', 'James Bernard', 'Gerena', 'gerena.255661@munoz.sti.edu.ph', 'Gerena_James Bernard', 'Student', '0000-00-00 00:00:00', 'False'),
('00000000004', '02000252675', 'Yranimez', 'Repil', 'repil.252675@munoz.sti.edu.ph', 'Repil_Yranimez', 'Student', '0000-00-00 00:00:00', 'False');

--
-- Triggers `tbl_user`
--
DELIMITER $$
CREATE TRIGGER `ID` BEFORE INSERT ON `tbl_user` FOR EACH ROW BEGIN
	SET New.UUID = CONCAT('00000', LPAD((SELECT COUNT(*) FROM tbl_user) + 1, 6, "0"));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Set_Password` BEFORE INSERT ON `tbl_user` FOR EACH ROW BEGIN
    SET New.Password = CONCAT(New.LastName, "_", New.FirstName);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Set_Permission` AFTER INSERT ON `tbl_user` FOR EACH ROW BEGIN
    IF NEW.UserType = 'Student' THEN
        INSERT INTO tbl_permission (UUID, 
                                     File_Maintainance,
                                     Access_View,
                                     Access_Edit,
                                     Access_Insert)
        					 VALUES (NEW.UUID,
                                     "False", 
                                     "True", 
                                     "False", 
                                     "False");
    END IF;
    
    IF New.UserType = 'Coach' THEN
        INSERT INTO tbl_permission (UUID,
                                     File_Maintainance,
                                     Access_View,
                                     Access_Edit,
                                     Access_Insert)
        					 VALUES (NEW.UUID,
                                     "False", 
                                     "True", 
                                     "False", 
                                     "False");
    END IF;
    
    IF NEW.UserType = 'Admin' THEN
        INSERT INTO tbl_permission (UUID, 
                                     File_Maintainance,
                                     Access_View,
                                     Access_Edit,
                                     Access_Insert)
        					 VALUES (NEW.UUID, 
                                     "True", 
                                     "True",  
                                     "True",   
                                     "True");
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Set_Permission_Update` BEFORE UPDATE ON `tbl_user` FOR EACH ROW BEGIN
    IF NEW.UserType = 'Student' THEN
        UPDATE tbl_permission 
        SET File_Maintainance = "False",
        	Access_View = "True",
            Access_Edit = "False",
            Access_Insert = "False"
        WHERE UUID = NEW.UUID;
    END IF;
    
    IF New.UserType = 'Coach' THEN
        UPDATE tbl_permission 
        SET File_Maintainance = "False",
        	Access_View = "True",
            Access_Edit = "False",
            Access_Insert = "False"
        WHERE UUID = NEW.UUID;
    END IF;
    
    IF NEW.UserType = 'Admin' THEN
        UPDATE tbl_permission 
        SET File_Maintainance = "True",
        	Access_View = "True",
            Access_Edit = "True",
            Access_Insert = "True"
        WHERE UUID = NEW.UUID;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `temp_course`
--

CREATE TABLE `temp_course` (
  `CRSID` varchar(25) NOT NULL,
  `PRGID` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `temp_course`
--

INSERT INTO `temp_course` (`CRSID`, `PRGID`) VALUES
('00000000001', '00000000001'),
('00000000002', '00000000001'),
('00000000009', '00000000001'),
('00000000017', '00000000001'),
('00000000002', '00000000002'),
('00000000009', '00000000002'),
('00000000024', '00000000002'),
('00000000040', '00000000001'),
('00000000003', '00000000005'),
('00000000003', '00000000001'),
('00000000007', '00000000001'),
('00000000013', '00000000001'),
('00000000026', '00000000002'),
('00000000001', '00000000003'),
('00000000002', '00000000003'),
('00000000009', '00000000003'),
('00000000040', '00000000003'),
('00000000029', '00000000001');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `con_coach_course`
--
ALTER TABLE `con_coach_course`
  ADD UNIQUE KEY `CCHID_2` (`CCHID`,`CRSID`),
  ADD KEY `CCHID` (`CCHID`),
  ADD KEY `CRSID` (`CRSID`);

--
-- Indexes for table `con_course_course`
--
ALTER TABLE `con_course_course`
  ADD KEY `CRSID` (`CRSID`),
  ADD KEY `PRGID` (`PRGID`);

--
-- Indexes for table `con_course_curriculum`
--
ALTER TABLE `con_course_curriculum`
  ADD UNIQUE KEY `CRRID_2` (`CRRID`,`PRGID`,`CRSID`,`SCTID`,`ClassType`),
  ADD KEY `CRRID` (`CRRID`),
  ADD KEY `DPTID` (`DPTID`),
  ADD KEY `PRGID` (`PRGID`),
  ADD KEY `CRSID` (`CRSID`),
  ADD KEY `SCTID` (`SCTID`);

--
-- Indexes for table `con_section_course`
--
ALTER TABLE `con_section_course`
  ADD UNIQUE KEY `SCTID_2` (`SCTID`,`CRSID`),
  ADD UNIQUE KEY `CRSID_2` (`CRSID`,`PRGID`),
  ADD KEY `SCTID` (`SCTID`),
  ADD KEY `CRSID` (`CRSID`),
  ADD KEY `PRGID` (`PRGID`);

--
-- Indexes for table `tbl_academicyear`
--
ALTER TABLE `tbl_academicyear`
  ADD PRIMARY KEY (`AYID`);

--
-- Indexes for table `tbl_coach`
--
ALTER TABLE `tbl_coach`
  ADD PRIMARY KEY (`CCHID`),
  ADD UNIQUE KEY `SCLID` (`SCHLID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `ContactNumber` (`ContactNumber`),
  ADD UNIQUE KEY `Facebook` (`Facebook`),
  ADD KEY `DPTID` (`DPTID`);

--
-- Indexes for table `tbl_course`
--
ALTER TABLE `tbl_course`
  ADD PRIMARY KEY (`CRSID`),
  ADD UNIQUE KEY `CourseCode` (`CourseCode`),
  ADD KEY `PRGID` (`DPTID`);

--
-- Indexes for table `tbl_curriculum`
--
ALTER TABLE `tbl_curriculum`
  ADD PRIMARY KEY (`CRRID`);

--
-- Indexes for table `tbl_department`
--
ALTER TABLE `tbl_department`
  ADD PRIMARY KEY (`DPTID`),
  ADD UNIQUE KEY `Name` (`DepartmentName`),
  ADD UNIQUE KEY `Abbrev` (`DepartmentAbbrev`),
  ADD UNIQUE KEY `DepartmentCode` (`DepartmentCode`);

--
-- Indexes for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  ADD PRIMARY KEY (`PRMID`),
  ADD KEY `UID` (`UUID`);

--
-- Indexes for table `tbl_program`
--
ALTER TABLE `tbl_program`
  ADD PRIMARY KEY (`PRGID`),
  ADD UNIQUE KEY `Name` (`ProgramName`,`ProgramAbbrev`),
  ADD UNIQUE KEY `ProgramCode` (`ProgramCode`),
  ADD KEY `DPTID` (`DPTID`);

--
-- Indexes for table `tbl_room`
--
ALTER TABLE `tbl_room`
  ADD PRIMARY KEY (`RMID`),
  ADD UNIQUE KEY `Name` (`RoomName`);

--
-- Indexes for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  ADD PRIMARY KEY (`SCDID`),
  ADD UNIQUE KEY `CRSID_2` (`CRSID`,`SCTID`,`Day`,`Time`,`RMID`,`CCHID`,`ScheduledSemester`,`AYID`,`CRRID`),
  ADD KEY `CRSID` (`CRSID`),
  ADD KEY `SCTID` (`SCTID`),
  ADD KEY `RMID` (`RMID`),
  ADD KEY `CCHID` (`CCHID`),
  ADD KEY `Curriculum` (`CRRID`),
  ADD KEY `AYID` (`AYID`);

--
-- Indexes for table `tbl_section`
--
ALTER TABLE `tbl_section`
  ADD PRIMARY KEY (`SCTID`),
  ADD KEY `PRGID` (`PRGID`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`UUID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Password` (`Password`),
  ADD KEY `SchoolID` (`SCHLID`);

--
-- Indexes for table `temp_course`
--
ALTER TABLE `temp_course`
  ADD KEY `CRSID` (`CRSID`),
  ADD KEY `PRGID` (`PRGID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `con_coach_course`
--
ALTER TABLE `con_coach_course`
  ADD CONSTRAINT `con_coach_course_ibfk_1` FOREIGN KEY (`CCHID`) REFERENCES `tbl_coach` (`CCHID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `con_coach_course_ibfk_2` FOREIGN KEY (`CRSID`) REFERENCES `tbl_course` (`CRSID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `con_course_course`
--
ALTER TABLE `con_course_course`
  ADD CONSTRAINT `con_course_course_ibfk_1` FOREIGN KEY (`CRSID`) REFERENCES `tbl_course` (`CRSID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `con_course_course_ibfk_2` FOREIGN KEY (`PRGID`) REFERENCES `tbl_program` (`PRGID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `con_course_curriculum`
--
ALTER TABLE `con_course_curriculum`
  ADD CONSTRAINT `con_course_curriculum_ibfk_1` FOREIGN KEY (`CRRID`) REFERENCES `tbl_curriculum` (`CRRID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `con_course_curriculum_ibfk_2` FOREIGN KEY (`DPTID`) REFERENCES `tbl_department` (`DPTID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `con_course_curriculum_ibfk_3` FOREIGN KEY (`PRGID`) REFERENCES `tbl_program` (`PRGID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `con_course_curriculum_ibfk_4` FOREIGN KEY (`CRSID`) REFERENCES `tbl_course` (`CRSID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `con_course_curriculum_ibfk_5` FOREIGN KEY (`SCTID`) REFERENCES `tbl_section` (`SCTID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `con_section_course`
--
ALTER TABLE `con_section_course`
  ADD CONSTRAINT `con_section_course_ibfk_1` FOREIGN KEY (`SCTID`) REFERENCES `tbl_section` (`SCTID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `con_section_course_ibfk_2` FOREIGN KEY (`CRSID`) REFERENCES `tbl_course` (`CRSID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `con_section_course_ibfk_3` FOREIGN KEY (`PRGID`) REFERENCES `tbl_program` (`PRGID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_coach`
--
ALTER TABLE `tbl_coach`
  ADD CONSTRAINT `tbl_coach_ibfk_1` FOREIGN KEY (`DPTID`) REFERENCES `tbl_department` (`DPTID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_course`
--
ALTER TABLE `tbl_course`
  ADD CONSTRAINT `tbl_course_ibfk_1` FOREIGN KEY (`DPTID`) REFERENCES `tbl_department` (`DPTID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  ADD CONSTRAINT `tbl_permission_ibfk_1` FOREIGN KEY (`UUID`) REFERENCES `tbl_user` (`UUID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_program`
--
ALTER TABLE `tbl_program`
  ADD CONSTRAINT `tbl_program_ibfk_2` FOREIGN KEY (`DPTID`) REFERENCES `tbl_department` (`DPTID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  ADD CONSTRAINT `tbl_schedule_ibfk_1` FOREIGN KEY (`SCTID`) REFERENCES `tbl_section` (`SCTID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_schedule_ibfk_2` FOREIGN KEY (`CCHID`) REFERENCES `tbl_coach` (`CCHID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_schedule_ibfk_3` FOREIGN KEY (`CRSID`) REFERENCES `tbl_course` (`CRSID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_schedule_ibfk_4` FOREIGN KEY (`RMID`) REFERENCES `tbl_room` (`RMID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_schedule_ibfk_5` FOREIGN KEY (`CRRID`) REFERENCES `tbl_curriculum` (`CRRID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_schedule_ibfk_6` FOREIGN KEY (`AYID`) REFERENCES `tbl_academicyear` (`AYID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_section`
--
ALTER TABLE `tbl_section`
  ADD CONSTRAINT `tbl_section_ibfk_1` FOREIGN KEY (`PRGID`) REFERENCES `tbl_program` (`PRGID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `temp_course`
--
ALTER TABLE `temp_course`
  ADD CONSTRAINT `temp_course_ibfk_1` FOREIGN KEY (`CRSID`) REFERENCES `tbl_course` (`CRSID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `temp_course_ibfk_2` FOREIGN KEY (`PRGID`) REFERENCES `tbl_program` (`PRGID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
