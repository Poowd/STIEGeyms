-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2024 at 01:23 PM
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
-- Database: `db_stiegeyms`
--

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `PRM_ID` varchar(25) NOT NULL,
  `UUID` varchar(25) NOT NULL,
  `AUTH` enum('True','False') NOT NULL DEFAULT 'True'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`PRM_ID`, `UUID`, `AUTH`) VALUES
('00000000001', '00000000001', 'True');

--
-- Triggers `permission`
--
DELIMITER $$
CREATE TRIGGER `PRM_ID` BEFORE INSERT ON `permission` FOR EACH ROW BEGIN
	SET New.PRM_ID = CONCAT('00000', LPAD((SELECT COUNT(*) FROM permission) + 1, 6, "0"));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UUID` varchar(25) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `USER_TYPE` enum('Admin','User') NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `Active` enum('True','False') NOT NULL DEFAULT 'True'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UUID`, `Username`, `Password`, `USER_TYPE`, `DateCreated`, `Active`) VALUES
('00000000001', 'admin', 'admin', 'Admin', '2024-05-13 10:01:42', 'True');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `PERMISSION` AFTER INSERT ON `user` FOR EACH ROW BEGIN
    IF NEW.USER_TYPE = 'Admin' THEN
        INSERT INTO permission (UUID, AUTH)
        	   VALUES (NEW.UUID, "True");
    END IF;
    IF NEW.USER_TYPE = 'User' THEN
        INSERT INTO permission (UUID, AUTH)
        	   VALUES (NEW.UUID, "True");
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UUID` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
	SET New.UUID = CONCAT('00000', LPAD((SELECT COUNT(*) FROM user) + 1, 6, "0"));
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`PRM_ID`),
  ADD UNIQUE KEY `UUID` (`UUID`),
  ADD UNIQUE KEY `PRM_ID` (`PRM_ID`,`UUID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UUID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Password` (`Password`),
  ADD UNIQUE KEY `Username_2` (`Username`,`Password`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission`
--
ALTER TABLE `permission`
  ADD CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`UUID`) REFERENCES `user` (`UUID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
