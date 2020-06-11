-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 20, 2020 at 03:51 PM
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
  `driver_id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_number` int(2) NOT NULL,
  `firstname` varchar(75) NOT NULL,
  `prefix` varchar(25) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `code` varchar(3) NOT NULL,
  `points` int(3) NOT NULL,
  PRIMARY KEY (`driver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `driver_number`, `firstname`, `prefix`, `lastname`, `code`, `points`) VALUES
(1, 2, 'Marco', 'van', 'Doeland', 'MVD', 10),
(2, 13, 'Stijn', '', 'Warmels', 'SJW', 11),
(3, 14, 'Eran', 'van der', 'Horst', 'EJF', 32),
(4, 21, 'Jesse', '', 'Malotaux', 'JDM', 17),
(5, 28, 'Aron', 'van de', 'Ridder', 'VLD', 0),
(6, 30, 'Stefan', '', 'Schooneveld', 'SSV', 6),
(7, 72, 'Max', '', 'Breunesse', 'BRE', 22);

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
(3, 'Mclaren F1 Team', 'Mclaren', 'FF8700', 49),
(4, 'Alfa Romeo Racing ORLEN', 'Alfa Romeo', '9B0000', 0),
(5, 'Aston Martin Red Bull Racing', 'Red Bull', '004C6C', 0),
(6, 'Renault DP World F1 Team', 'Renault', 'FFF500', 16),
(7, 'Scuderia Ferrari Mission Winnow', 'Ferrari', 'DC0000', 0),
(8, 'Scuderia Toro Rosso Honda', 'Toro Rosso', '469BFF', 0),
(11, 'ROKiT Williams Racing', 'Williams', 'FFFFFF', 0),
(12, 'BWT Racing Point F1 Team', 'Racing Point', 'F596C8', 33);

-- --------------------------------------------------------

--
-- Table structure for table `tournament`
--

DROP TABLE IF EXISTS `tournament`;
CREATE TABLE IF NOT EXISTS `tournament` (
  `tournament_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hash` varchar(32) NOT NULL,
  PRIMARY KEY (`tournament_id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tournament`
--

INSERT INTO `tournament` (`tournament_id`, `title`, `user_id`, `hash`) VALUES
(1, 'Test', 1, 'asdf'),
(2, 'Grand Prix', 1, 'asdfzcxv');

-- --------------------------------------------------------

--
-- Table structure for table `tournament_team_driver`
--

DROP TABLE IF EXISTS `tournament_team_driver`;
CREATE TABLE IF NOT EXISTS `tournament_team_driver` (
  `tournament_id` int(11) NOT NULL,
  `team_id` int(2) NOT NULL,
  `driver_id` int(2) NOT NULL,
  PRIMARY KEY (`tournament_id`,`team_id`,`driver_id`),
  KEY `team_id` (`team_id`),
  KEY `driver_id` (`driver_id`),
  KEY `tournament_id` (`tournament_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tournament_team_driver`
--

INSERT INTO `tournament_team_driver` (`tournament_id`, `team_id`, `driver_id`) VALUES
(1, 3, 3),
(1, 3, 4),
(1, 6, 1),
(1, 6, 6),
(1, 12, 2),
(1, 12, 7),
(2, 1, 6),
(2, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `hash` varchar(32) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_driver`
--

DROP TABLE IF EXISTS `user_driver`;
CREATE TABLE IF NOT EXISTS `user_driver` (
  `user_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`driver_id`),
  KEY `user_driverid` (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tournament_team_driver`
--
ALTER TABLE `tournament_team_driver`
  ADD CONSTRAINT `driver_id` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tournament_id` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`tournament_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_driver`
--
ALTER TABLE `user_driver`
  ADD CONSTRAINT `user_driverid` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
