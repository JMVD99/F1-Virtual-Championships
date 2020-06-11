-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 14, 2020 at 08:27 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `race_reg`
--

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
CREATE TABLE IF NOT EXISTS `driver` (
  `driver_id` int(2) NOT NULL,
  `firstname` varchar(75) NOT NULL,
  `prefix` varchar(25) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `code` varchar(3) NOT NULL,
  `points` int(3) NOT NULL,
  PRIMARY KEY (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `firstname`, `prefix`, `lastname`, `code`, `points`) VALUES
(2, 'Marco', 'van', 'Doeland', 'MVD', 5),
(13, 'Stijn', '', 'Warmels', 'SJW', 10),
(14, 'Eran', 'van der', 'Horst', 'EJF', 22),
(21, 'Jesse', '', 'Malotaux', 'JDM', 14),
(30, 'Stefan', '', 'Schooneveld', 'SSV', 6),
(72, 'Max', '', 'Breunesse', 'BRE', 14);

-- --------------------------------------------------------

--
-- Table structure for table `point_types`
--

DROP TABLE IF EXISTS `point_types`;
CREATE TABLE IF NOT EXISTS `point_types` (
  `type_id` int(3) NOT NULL AUTO_INCREMENT,
  `title` varchar(15) NOT NULL,
  `points` int(2) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `point_types`
--

INSERT INTO `point_types` (`type_id`, `title`, `points`) VALUES
(1, 'First place', 10),
(2, 'Second place', 7),
(3, '3rd place', 5),
(4, '4th place', 3),
(5, '5th place', 1),
(6, '6th place', 0),
(7, '7th place', 0),
(8, '8th place', 0),
(9, '9th place', 0),
(10, '10th place', 0),
(11, 'Fastest Lap', 1);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
CREATE TABLE IF NOT EXISTS `team` (
  `team_id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `shortname` varchar(15) NOT NULL,
  `color` varchar(6) NOT NULL,
  `points` int(3) NOT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`team_id`, `name`, `shortname`, `color`, `points`) VALUES
(1, 'Mercedes-AMG Petronas F1 Team', 'Mercedes', '00D2BE', 0),
(2, 'Haas F1 Team', 'Haas', 'F0D787', 0),
(3, 'Mclaren F1 Team', 'Mclaren', 'FF8700', 36),
(4, 'Alfa Romeo Racing ORLEN', 'Alfa Romeo', '9B0000', 0),
(5, 'Aston Martin Red Bull Racing', 'Red Bull', '004C6C', 0),
(6, 'Renault DP World F1 Team', 'Renault', 'FFF500', 11),
(7, 'Scuderia Ferrari Mission Winnow', 'Ferrari', 'DC0000', 0),
(8, 'Scuderia Toro Rosso Honda', 'Toro Rosso', '469BFF', 0),
(11, 'ROKiT Williams Racing', 'Williams', 'FFFFFF', 0),
(12, 'BWT Racing Point F1 Team', 'Racing Point', 'F596C8', 24);

-- --------------------------------------------------------

--
-- Table structure for table `team_driver`
--

DROP TABLE IF EXISTS `team_driver`;
CREATE TABLE IF NOT EXISTS `team_driver` (
  `team_id` int(2) NOT NULL,
  `driver_id` int(2) NOT NULL,
  PRIMARY KEY (`team_id`,`driver_id`),
  KEY `team_id` (`team_id`),
  KEY `driver_id` (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `team_driver`
--

INSERT INTO `team_driver` (`team_id`, `driver_id`) VALUES
(3, 14),
(3, 21),
(6, 2),
(6, 30),
(12, 13),
(12, 72);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `team_driver`
--
ALTER TABLE `team_driver`
  ADD CONSTRAINT `driver_id` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
