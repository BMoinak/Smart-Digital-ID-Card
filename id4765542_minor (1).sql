-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 05, 2018 at 12:16 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id4765542_minor`
--
CREATE DATABASE IF NOT EXISTS `id4765542_minor` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id4765542_minor`;

-- --------------------------------------------------------

--
-- Table structure for table `slots`
--

DROP TABLE IF EXISTS `slots`;
CREATE TABLE `slots` (
  `slot` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `teacher_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `student_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `subjectid` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `notification` varchar(3000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slots`
--

INSERT INTO `slots` (`slot`, `teacher_id`, `student_id`, `subjectid`, `notification`) VALUES
('A', 'Demo', 'DemStud', 'ENG101', 'Hi This Is Your Teacher'),
('C', 'Demo', 'DemStud', 'Math101', 'Study Math Bro!');

-- --------------------------------------------------------

--
-- Table structure for table `studentdata`
--

DROP TABLE IF EXISTS `studentdata`;
CREATE TABLE `studentdata` (
  `stud_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `studentid` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `A` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `B` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `C` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `D` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `E` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `F` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `G` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `studentdata`
--

INSERT INTO `studentdata` (`stud_name`, `studentid`, `pass`, `A`, `B`, `C`, `D`, `E`, `F`, `G`) VALUES
('Demo Student', 'DemStud', 'Demo', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `sub_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `subjectid` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`sub_name`, `subjectid`) VALUES
('Chemistry', 'CHM101'),
('English', 'ENG101'),
('English', 'ENG201'),
('History', 'Hist101'),
('Math', 'Math101'),
('Math', 'Math201'),
('Physics', 'PHY101'),
('Physics', 'PHY201');

-- --------------------------------------------------------

--
-- Table structure for table `teacherdata`
--

DROP TABLE IF EXISTS `teacherdata`;
CREATE TABLE `teacherdata` (
  `teacher_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `teacher_id` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `A` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `B` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `C` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `D` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `E` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `F` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `G` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `teacherdata`
--

INSERT INTO `teacherdata` (`teacher_name`, `teacher_id`, `pass`, `A`, `B`, `C`, `D`, `E`, `F`, `G`) VALUES
('Demo Teacher', 'Demo', '81dc9bdb52d04dc20036dbd8313ed055', '', '', '', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `slots`
--
ALTER TABLE `slots`
  ADD KEY `student_id` (`student_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `subjectid` (`subjectid`);

--
-- Indexes for table `studentdata`
--
ALTER TABLE `studentdata`
  ADD PRIMARY KEY (`studentid`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subjectid`);

--
-- Indexes for table `teacherdata`
--
ALTER TABLE `teacherdata`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `slots`
--
ALTER TABLE `slots`
  ADD CONSTRAINT `slots_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `studentdata` (`studentid`),
  ADD CONSTRAINT `slots_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacherdata` (`teacher_id`),
  ADD CONSTRAINT `slots_ibfk_3` FOREIGN KEY (`subjectid`) REFERENCES `subject` (`subjectid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
