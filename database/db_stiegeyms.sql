-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2024 at 06:30 AM
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
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `game_id` varchar(25) NOT NULL,
  `game_name` varchar(255) NOT NULL,
  `game_developer` varchar(25) NOT NULL,
  `game_publisher` varchar(25) NOT NULL,
  `game_description` text NOT NULL,
  `game_rating` double NOT NULL,
  `game_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `game_status` enum('ACTIVE','ARCHIVED','APPROVAL','') NOT NULL DEFAULT 'ACTIVE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`game_id`, `game_name`, `game_developer`, `game_publisher`, `game_description`, `game_rating`, `game_created`, `game_status`) VALUES
('01', 'Minecraft', 'Mojang', 'Mojang', 'block', 4, '2024-05-29 17:18:05', 'ACTIVE'),
('02', 'Valorant', 'Riot Games', 'Riot Games', '5v5 Tactical FPS Shooter with Agent Abilities', 3.7, '2024-06-01 16:53:24', 'ACTIVE');

--
-- Triggers `games`
--
DELIMITER $$
CREATE TRIGGER `game_id` BEFORE INSERT ON `games` FOR EACH ROW BEGIN

	SET NEW.game_id = CONCAT('0', (SELECT COUNT(*) + 1 FROM games));
    
END
$$
DELIMITER ;

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
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `store_id` varchar(25) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `store_link` varchar(255) NOT NULL,
  `store_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `store_status` enum('ACTIVE','ARCHIVED','APPROVAL','') NOT NULL DEFAULT 'ACTIVE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`store_id`, `store_name`, `store_link`, `store_created`, `store_status`) VALUES
('01', 'Steam', 'https://store.steampowered.com', '2024-06-02 02:26:59', 'ACTIVE');

--
-- Triggers `store`
--
DELIMITER $$
CREATE TRIGGER `store_id` BEFORE INSERT ON `store` FOR EACH ROW BEGIN

	SET NEW.store_id = CONCAT('0', (SELECT COUNT(*) + 1 FROM store));
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `store_items`
--

CREATE TABLE `store_items` (
  `item_id` varchar(25) NOT NULL,
  `store_id` varchar(25) NOT NULL,
  `game_id` varchar(25) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_price` double NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `item_status` enum('ACTIVE','ARCHIVED','APPROVAL','') NOT NULL DEFAULT 'ACTIVE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_items`
--

INSERT INTO `store_items` (`item_id`, `store_id`, `game_id`, `item_quantity`, `item_price`, `date_created`, `item_status`) VALUES
('01', '01', '01', 5, 255.55, '2024-06-02 02:41:25', 'ACTIVE');

--
-- Triggers `store_items`
--
DELIMITER $$
CREATE TRIGGER `item_id` BEFORE INSERT ON `store_items` FOR EACH ROW BEGIN

	SET NEW.item_id = CONCAT('0', (SELECT COUNT(*) + 1 FROM store_items));
    
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
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`game_id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`PRM_ID`),
  ADD UNIQUE KEY `UUID` (`UUID`),
  ADD UNIQUE KEY `PRM_ID` (`PRM_ID`,`UUID`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `store_items`
--
ALTER TABLE `store_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `game_id` (`game_id`);

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

--
-- Constraints for table `store_items`
--
ALTER TABLE `store_items`
  ADD CONSTRAINT `store_items_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `store_items_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
