-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.11:3306
-- Generation Time: Aug 09, 2023 at 09:44 AM
-- Server version: 10.6.14-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u794072879_marksonair2`
--

-- --------------------------------------------------------

--
-- Table structure for table `Assessment`
--

CREATE TABLE `Assessment` (
  `assessmentID` varchar(30) NOT NULL,
  `assessmentName` varchar(50) DEFAULT NULL,
  `assessmentTotalMark` int(11) DEFAULT NULL,
  `assessmentWeightage` float DEFAULT NULL,
  `assessmentCourseCode` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `Assessment`
--

INSERT INTO `Assessment` (`assessmentID`, `assessmentName`, `assessmentTotalMark`, `assessmentWeightage`, `assessmentCourseCode`) VALUES
('TT0001_1', 'QUIZ 1', 20, 5, 'TT0001'),
('TT0001_2', 'QUIZ 2', 20, 5, 'TT0001'),
('TT0001_3', 'TUTOR 1', 30, 5, 'TT0001'),
('TT0001_4', 'TUTOR 2', 10, 5, 'TT0001'),
('TT0001_5', 'LAB 1', 50, 10, 'TT0001'),
('TT0001_6', 'LAB 2', 40, 10, 'TT0001'),
('TT0001_7', 'MID SEM TEST', 100, 20, 'TT0001'),
('TT0002_1', 'QUIZ 1', 50, 5, 'TT0002');

-- --------------------------------------------------------

--
-- Table structure for table `Chat`
--

CREATE TABLE `Chat` (
  `content` varchar(1000) DEFAULT NULL,
  `studentID` varchar(20) NOT NULL,
  `courseCode` varchar(15) NOT NULL,
  `who` varchar(20) DEFAULT NULL,
  `chatDate` date NOT NULL DEFAULT curdate(),
  `chatTime` time NOT NULL DEFAULT curtime(),
  `newForLecturer` tinyint(1) DEFAULT 1,
  `newForStudent` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `Chat`
--

INSERT INTO `Chat` (`content`, `studentID`, `courseCode`, `who`, `chatDate`, `chatTime`, `newForLecturer`, `newForStudent`) VALUES
('tahniah, markah yang bagus.', 'A180001', 'TT0001', 'Lecturer', '2023-07-28', '10:21:47', 0, 0),
('terima kasih dr.', 'A180001', 'TT0001', 'Student', '2023-07-28', '10:24:56', 0, 0),
('assalamualaikum dr', 'A180001', 'TT0001', 'Student', '2023-08-03', '02:51:33', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `courseCode` varchar(15) NOT NULL,
  `courseName` varchar(50) DEFAULT NULL,
  `courseCoordinatorID` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`courseCode`, `courseName`, `courseCoordinatorID`) VALUES
('TT0001', 'PROGRAMMING 1', 'K014001'),
('TT0002', 'PROGRAMMING 2', 'K014002');

-- --------------------------------------------------------

--
-- Table structure for table `CourseSet`
--

CREATE TABLE `CourseSet` (
  `setNumber` tinyint(3) UNSIGNED DEFAULT NULL,
  `setCourseCode` varchar(15) DEFAULT NULL,
  `setID` varchar(20) NOT NULL,
  `setLabel` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `CourseSet`
--

INSERT INTO `CourseSet` (`setNumber`, `setCourseCode`, `setID`, `setLabel`) VALUES
(1, 'TT0001', 'TT0001_SET1', '1CS1'),
(2, 'TT0001', 'TT0001_SET2', '1CS2'),
(3, 'TT0001', 'TT0001_SET3', '1CS3'),
(1, 'TT0002', 'TT0002_SET1', '1CS1');

-- --------------------------------------------------------

--
-- Table structure for table `CourseUser`
--

CREATE TABLE `CourseUser` (
  `userID` varchar(20) NOT NULL,
  `setID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `CourseUser`
--

INSERT INTO `CourseUser` (`userID`, `setID`) VALUES
('A123456', 'TT0002_SET1'),
('A180001', 'TT0001_SET1'),
('A180001', 'TT0002_SET1'),
('A180002', 'TT0001_SET1'),
('A180002', 'TT0002_SET1'),
('A180003', 'TT0001_SET1'),
('A180003', 'TT0002_SET1'),
('A180004', 'TT0001_SET1'),
('A180004', 'TT0002_SET1'),
('A180005', 'TT0001_SET1'),
('A180006', 'TT0001_SET1'),
('A180007', 'TT0001_SET1'),
('A180008', 'TT0001_SET1'),
('A180009', 'TT0001_SET1'),
('A180010', 'TT0001_SET1'),
('A180011', 'TT0001_SET1'),
('A180012', 'TT0001_SET1'),
('A180013', 'TT0001_SET1'),
('A180014', 'TT0001_SET1'),
('A180015', 'TT0001_SET1'),
('K014001', 'TT0001_SET1'),
('K014001', 'TT0002_SET1'),
('K014002', 'TT0001_SET1'),
('K014008', 'TT0001_SET2');

-- --------------------------------------------------------

--
-- Table structure for table `Mark`
--

CREATE TABLE `Mark` (
  `userID` varchar(20) NOT NULL,
  `assessmentID` varchar(30) NOT NULL,
  `score` float DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `Mark`
--

INSERT INTO `Mark` (`userID`, `assessmentID`, `score`, `percentage`) VALUES
('A180001', 'TT0001_1', 15, 3.75),
('A180001', 'TT0001_2', 17, 4.25),
('A180001', 'TT0001_3', 28, 4.67),
('A180001', 'TT0001_4', 7, 3.50),
('A180001', 'TT0001_5', 45, 9.00),
('A180001', 'TT0001_6', 39, 9.75),
('A180001', 'TT0001_7', 91, 18.20),
('A180002', 'TT0001_1', 5, 1.25),
('A180002', 'TT0001_2', 6, 1.50),
('A180002', 'TT0001_3', 22, 3.67),
('A180002', 'TT0001_4', 18, 9.00),
('A180002', 'TT0001_5', 40, 8.00),
('A180002', 'TT0001_6', 38, 9.50),
('A180002', 'TT0001_7', 91, 18.20),
('A180003', 'TT0001_1', 20, 5.00),
('A180003', 'TT0001_2', 8, 2.00),
('A180003', 'TT0001_3', 23, 3.83),
('A180003', 'TT0001_4', 8, 4.00),
('A180003', 'TT0001_5', 42, 8.40),
('A180003', 'TT0001_6', 34, 8.50),
('A180003', 'TT0001_7', 84, 16.80),
('A180004', 'TT0001_1', 10, 2.50),
('A180004', 'TT0001_2', 10, 2.50),
('A180004', 'TT0001_3', 28, 4.67),
('A180004', 'TT0001_4', 16, 8.00),
('A180004', 'TT0001_5', 42, 8.40),
('A180004', 'TT0001_6', 32, 8.00),
('A180004', 'TT0001_7', 79, 15.80),
('A180005', 'TT0001_1', 17, 4.25),
('A180005', 'TT0001_2', 9, 2.25),
('A180005', 'TT0001_3', 20, 3.33),
('A180005', 'TT0001_4', 15, 7.50),
('A180005', 'TT0001_5', 41, 8.20),
('A180005', 'TT0001_6', 35, 8.75),
('A180005', 'TT0001_7', 73, 14.60),
('A180006', 'TT0001_1', 20, 5.00),
('A180006', 'TT0001_2', 14, 3.50),
('A180006', 'TT0001_3', 27, 4.50),
('A180006', 'TT0001_4', 10, 5.00),
('A180006', 'TT0001_5', 45, 9.00),
('A180006', 'TT0001_6', 31, 7.75),
('A180006', 'TT0001_7', 99, 19.80),
('A180007', 'TT0001_1', 19, 4.75),
('A180007', 'TT0001_2', 8, 2.00),
('A180007', 'TT0001_3', 25, 4.17),
('A180007', 'TT0001_4', 14, 7.00),
('A180007', 'TT0001_5', 44, 8.80),
('A180007', 'TT0001_6', 40, 10.00),
('A180007', 'TT0001_7', 85, 17.00),
('A180008', 'TT0001_1', 17, 4.25),
('A180008', 'TT0001_2', 7, 1.75),
('A180008', 'TT0001_3', 26, 4.33),
('A180008', 'TT0001_4', 15, 7.50),
('A180008', 'TT0001_5', 45, 9.00),
('A180008', 'TT0001_6', 36, 9.00),
('A180008', 'TT0001_7', 71, 14.20),
('A180009', 'TT0001_1', 15, 3.75),
('A180009', 'TT0001_2', 11, 2.75),
('A180009', 'TT0001_3', 27, 4.50),
('A180009', 'TT0001_4', 17, 8.50),
('A180009', 'TT0001_5', 45.5, 9.10),
('A180009', 'TT0001_6', 35, 8.75),
('A180009', 'TT0001_7', 94, 18.80),
('A180010', 'TT0001_1', 14, 3.50),
('A180010', 'TT0001_2', 20, 5.00),
('A180010', 'TT0001_3', 26, 4.33),
('A180010', 'TT0001_4', 13, 6.50),
('A180010', 'TT0001_5', 46, 9.20),
('A180010', 'TT0001_6', 39, 9.75),
('A180010', 'TT0001_7', 100, 20.00),
('A180011', 'TT0001_1', 17, 4.25),
('A180011', 'TT0001_2', 13, 3.25),
('A180011', 'TT0001_3', 22, 3.67),
('A180011', 'TT0001_4', 10, 5.00),
('A180011', 'TT0001_5', 47, 9.40),
('A180011', 'TT0001_6', 30, 7.50),
('A180011', 'TT0001_7', 96, 19.20),
('A180012', 'TT0001_1', 9, 2.25),
('A180012', 'TT0001_2', 10, 2.50),
('A180012', 'TT0001_3', 21, 3.50),
('A180012', 'TT0001_4', 7, 3.50),
('A180012', 'TT0001_5', 49.5, 9.90),
('A180012', 'TT0001_6', 31, 7.75),
('A180012', 'TT0001_7', 94, 18.80),
('A180013', 'TT0001_1', 14, 3.50),
('A180013', 'TT0001_2', 15, 3.75),
('A180013', 'TT0001_3', 27, 4.50),
('A180013', 'TT0001_4', 16, 8.00),
('A180013', 'TT0001_5', 41.5, 8.30),
('A180013', 'TT0001_6', 31, 7.75),
('A180013', 'TT0001_7', 75, 15.00),
('A180014', 'TT0001_1', 7, 1.75),
('A180014', 'TT0001_2', 10, 2.50),
('A180014', 'TT0001_3', 23, 3.83),
('A180014', 'TT0001_4', 9, 4.50),
('A180014', 'TT0001_5', 42, 8.40),
('A180014', 'TT0001_6', 30, 7.50),
('A180014', 'TT0001_7', 98, 19.60),
('A180015', 'TT0001_1', 20, 5.00),
('A180015', 'TT0001_2', 16, 4.00),
('A180015', 'TT0001_3', 24, 4.00),
('A180015', 'TT0001_4', 14, 7.00),
('A180015', 'TT0001_5', 44, 8.80),
('A180015', 'TT0001_6', 38, 9.50),
('A180015', 'TT0001_7', 98, 19.60);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `userID` varchar(20) NOT NULL,
  `userPassword` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userRole` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`userID`, `userPassword`, `userName`, `userRole`) VALUES
('A123456', 'qwer', 'ADAM HAIKAL', 'Student'),
('A180001', 'qwer', 'ABDUL SALMAN', 'Student'),
('A180002', 'password', 'ABU HAIKAL', 'Student'),
('A180003', 'password', 'DANIEL FARIS', 'Student'),
('A180004', 'password', 'AIMAN HANAN', 'Student'),
('A180005', 'password', 'AHMAD FAIZ', 'Student'),
('A180006', 'password', 'SAIFUL MUIZ', 'Student'),
('A180007', 'password', 'AKMAL FIRDAUS', 'Student'),
('A180008', 'password', 'RAZIF OSMAN', 'Student'),
('A180009', 'password', 'KHUSAIRI FERKARN', 'Student'),
('A180010', 'password', 'IRFAN SYAFIQ', 'Student'),
('A180011', 'password', 'DARWISH ISKANDAR', 'Student'),
('A180012', 'password', 'NUR BALQIS', 'Student'),
('A180013', 'password', 'SITI SYAFIQAH', 'Student'),
('A180014', 'password', 'SABRINA HANIM', 'Student'),
('A180015', 'password', 'NATASYA INSYIRAH', 'Student'),
('ADMIN', 'qwer', 'ROY KAJAI', 'Admin'),
('K014001', 'qwer', 'DR. AZMAN IKHWAN', 'Lecturer'),
('K014002', 'qwer', 'DR. HILMAN AFFENDI', 'Lecturer'),
('K014003', 'password', 'PROF. AHMAD BORHAN', 'Lecturer'),
('K014004', 'password', 'PROF. JAMES PAUL', 'Lecturer'),
('K014005', 'password', 'DR. SOLEHAH AISYAH', 'Lecturer'),
('K014006', 'password', 'PROF. KHALISYA AINA', 'Lecturer'),
('K014007', 'password', 'DR. HALIZAH ISMAWATI', 'Lecturer'),
('K014008', 'password', 'DR. OCTAVIUS WALKER', 'Lecturer'),
('SUPERUSER', 'qwer', 'SUPERADMIN', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Assessment`
--
ALTER TABLE `Assessment`
  ADD PRIMARY KEY (`assessmentID`),
  ADD KEY `Assessment_ibfk_1` (`assessmentCourseCode`);

--
-- Indexes for table `Chat`
--
ALTER TABLE `Chat`
  ADD PRIMARY KEY (`studentID`,`courseCode`,`chatDate`,`chatTime`),
  ADD KEY `Chat_ibfk_2` (`courseCode`);

--
-- Indexes for table `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`courseCode`),
  ADD KEY `Course_ibfk_1` (`courseCoordinatorID`);

--
-- Indexes for table `CourseSet`
--
ALTER TABLE `CourseSet`
  ADD PRIMARY KEY (`setID`),
  ADD KEY `CourseSet_ibfk_1` (`setCourseCode`);

--
-- Indexes for table `CourseUser`
--
ALTER TABLE `CourseUser`
  ADD PRIMARY KEY (`userID`,`setID`),
  ADD KEY `CourseUser_ibfk_2` (`setID`);

--
-- Indexes for table `Mark`
--
ALTER TABLE `Mark`
  ADD PRIMARY KEY (`userID`,`assessmentID`),
  ADD KEY `Mark_ibfk_2` (`assessmentID`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`userID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Assessment`
--
ALTER TABLE `Assessment`
  ADD CONSTRAINT `Assessment_ibfk_1` FOREIGN KEY (`assessmentCourseCode`) REFERENCES `Course` (`courseCode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Chat`
--
ALTER TABLE `Chat`
  ADD CONSTRAINT `Chat_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `User` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Chat_ibfk_2` FOREIGN KEY (`courseCode`) REFERENCES `Course` (`courseCode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Course`
--
ALTER TABLE `Course`
  ADD CONSTRAINT `Course_ibfk_1` FOREIGN KEY (`courseCoordinatorID`) REFERENCES `User` (`userID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `CourseSet`
--
ALTER TABLE `CourseSet`
  ADD CONSTRAINT `CourseSet_ibfk_1` FOREIGN KEY (`setCourseCode`) REFERENCES `Course` (`courseCode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `CourseUser`
--
ALTER TABLE `CourseUser`
  ADD CONSTRAINT `CourseUser_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CourseUser_ibfk_2` FOREIGN KEY (`setID`) REFERENCES `CourseSet` (`setID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Mark`
--
ALTER TABLE `Mark`
  ADD CONSTRAINT `Mark_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Mark_ibfk_2` FOREIGN KEY (`assessmentID`) REFERENCES `Assessment` (`assessmentID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
