-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2023 at 09:58 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marksonair`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessment`
--

CREATE TABLE `assessment` (
  `assessmentName` varchar(50) NOT NULL,
  `assessmentTotalMark` int(11) NOT NULL,
  `assessmentWeightage` int(11) NOT NULL,
  `assessmentCourseCode` varchar(25) NOT NULL,
  `assessmentID` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `content` varchar(500) NOT NULL,
  `studentID` varchar(25) NOT NULL,
  `courseCode` varchar(25) NOT NULL,
  `who` varchar(20) NOT NULL,
  `chatDate` date NOT NULL DEFAULT curdate(),
  `chatTime` time NOT NULL DEFAULT curtime(),
  `newForLecturer` tinyint(1) DEFAULT 1,
  `newForStudent` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `courseCode` varchar(15) NOT NULL,
  `courseName` varchar(50) NOT NULL,
  `courseCoordinatorID` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courseset`
--

CREATE TABLE `courseset` (
  `setNumber` int(50) NOT NULL,
  `setCourseCode` varchar(20) NOT NULL,
  `setID` varchar(20) NOT NULL,
  `setLabel` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courseuser`
--

CREATE TABLE `courseuser` (
  `userID` varchar(20) NOT NULL,
  `setID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mark`
--

CREATE TABLE `mark` (
  `userID` varchar(20) NOT NULL,
  `assessmentID` varchar(50) NOT NULL,
  `score` float DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` varchar(20) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `userName` varchar(150) NOT NULL,
  `userRole` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `userPassword`, `userName`, `userRole`) VALUES
('SUPERUSER', 'qwer', 'SUPERADMIN', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessment`
--
ALTER TABLE `assessment`
  ADD PRIMARY KEY (`assessmentID`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`studentID`,`courseCode`,`chatDate`,`chatTime`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseCode`);

--
-- Indexes for table `courseset`
--
ALTER TABLE `courseset`
  ADD PRIMARY KEY (`setID`);

--
-- Indexes for table `mark`
--
ALTER TABLE `mark`
  ADD PRIMARY KEY (`userID`,`assessmentID`),
  ADD KEY `assessmentID` (`assessmentID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mark`
--
ALTER TABLE `mark`
  ADD CONSTRAINT `mark_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `mark_ibfk_2` FOREIGN KEY (`assessmentID`) REFERENCES `assessment` (`assessmentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
