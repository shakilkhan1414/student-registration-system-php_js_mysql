-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2022 at 05:25 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_registration_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `sesson` varchar(20) NOT NULL,
  `registered_subjects` varchar(1000) NOT NULL,
  `hall_provost` varchar(20) DEFAULT NULL,
  `hall_provost_approvedBy` varchar(20) DEFAULT NULL,
  `finace_department` varchar(20) DEFAULT NULL,
  `finace_department_approvedBy` varchar(20) DEFAULT NULL,
  `registrar` varchar(20) DEFAULT NULL,
  `registrar_approvedBy` varchar(20) DEFAULT NULL,
  `course_coOrdinator` varchar(20) DEFAULT NULL,
  `course_coOrdinator_approvedBy` varchar(20) DEFAULT NULL,
  `department_head` varchar(20) DEFAULT NULL,
  `department_head_approvedBy` varchar(20) DEFAULT NULL,
  `created_at` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `student_id`, `sesson`, `registered_subjects`, `hall_provost`, `hall_provost_approvedBy`, `finace_department`, `finace_department_approvedBy`, `registrar`, `registrar_approvedBy`, `course_coOrdinator`, `course_coOrdinator_approvedBy`, `department_head`, `department_head_approvedBy`, `created_at`) VALUES
(9, '1001', 'Fall', 'a:6:{i:0;s:2:\"24\";i:1;s:2:\"25\";i:2;s:2:\"32\";i:3;s:2:\"31\";i:4;s:1:\"8\";i:5;s:1:\"9\";}', '1', '1015', NULL, NULL, '1', '1016', '1', '1019', '1', '1003', '2022-10-26'),
(10, '1001', 'Fall', 'a:5:{i:0;s:2:\"24\";i:1;s:2:\"28\";i:2;s:2:\"29\";i:3;s:2:\"31\";i:4;s:2:\"33\";}', NULL, NULL, '1', '1017', NULL, NULL, '1', '1019', '', '', '2022-10-26'),
(20, '1001', 'Summer', 'a:3:{i:0;s:1:\"8\";i:1;s:1:\"7\";i:2;s:1:\"9\";}', '1', '1015', '1', '1017', NULL, NULL, NULL, NULL, '0', '', '2022-10-26'),
(25, '1001', 'Fall', 'a:3:{i:0;s:2:\"21\";i:1;s:2:\"20\";i:2;s:2:\"19\";}', '', '', '', '', '1', '1016', '', '', '', '', '2022-10-27'),
(29, '1001', 'Summer', 'a:5:{i:0;s:2:\"11\";i:1;s:1:\"8\";i:2;s:2:\"37\";i:3;s:2:\"35\";i:4;s:2:\"13\";}', '', '', '', '', '', '', '', '', '', '', '2022-10-27');

-- --------------------------------------------------------

--
-- Table structure for table `signatures`
--

CREATE TABLE `signatures` (
  `user_id` varchar(50) NOT NULL,
  `signature` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `signatures`
--

INSERT INTO `signatures` (`user_id`, `signature`) VALUES
('1003', 'elon_musk_signature.png'),
('1015', 'signature1.svg'),
('1016', 'signature2.png'),
('1017', 'signature3.png'),
('1019', 'signature4.png'),
('1020', 'signature5.png'),
('1021', 'signature6.png'),
('1022', 'signature7.png');

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `student_id` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `admission_date` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `completed_credit` varchar(20) NOT NULL,
  `cgpa` varchar(50) NOT NULL,
  `balance` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`student_id`, `department`, `admission_date`, `semester`, `completed_credit`, `cgpa`, `balance`) VALUES
('1001', 'CSE', '2021-06-25', '2', '23', '3.40', '5000'),
('1002', 'CSE', '2018-01-07', '8', '90', '3.64', '0'),
('1003', 'EEE', '2020-01-18', '5', '57', '2.67', '-500'),
('1004', 'BBA', '2018-08-01-3', '8', '90', '3.75', '0'),
('1014', 'EEE', '2022-09-22', 's', 's', 's', '0'),
('1015', 'EEE', '2022-09-14', '2', '18', '3.10', '17000'),
('1016', 'EEE', '2022-09-15', '3', '32', '3.17', '2000'),
('1017', 'EEE', '2022-09-28', 's', 'a', 'a', '0'),
('1018', 'CSE', '2022-09-06', '5', '50', '3.50', '3300'),
('1022', 'cse', '2018-01-22', '3', '54', '3.05', '-5000');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `semester` int(10) NOT NULL,
  `credit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `course_code`, `name`, `semester`, `credit`) VALUES
(1, 'CSE-1101 ', 'Introduction to Computer Systems', 1, '2.00'),
(2, ' CSE-1102', 'Introduction to Computer Systems Sessional', 1, '1.50'),
(3, 'PHY-1105', 'Physics', 1, '3.00'),
(4, 'PHY-1106', 'Physics Sessional', 1, '0.75'),
(5, 'MATH-1141', 'Differential Calculus and Integral Calculus', 1, '3.00'),
(6, 'HUM-1151', 'Technical and Communicative English', 1, '2.00'),
(7, 'CSE-1211 ', 'Discrete Mathematics', 2, '3.00'),
(8, 'CSE-1213', 'Structured Programming', 2, '3.00'),
(9, 'CSE-1214', 'Structured Programming Sessional', 2, '1.50'),
(10, 'EEE-1261', 'Electrical Circuit Analysis', 2, '3.00'),
(11, 'EEE-1262', 'Electrical Circuit Analysis Sessional', 2, '1.50'),
(12, 'CE-1270', 'Engineering Drawing and CAD Sessional', 2, '0.75'),
(13, 'CHEM-1203', 'Inorganic and Physical Chemistry', 2, '3.00'),
(14, 'HUM-1255', 'Bangladesh Studies', 2, '2.00'),
(15, 'CSE-2101', 'Digital Logic Design', 3, '3.00'),
(16, 'CSE-2102', 'Digital Logic Design Sessional', 3, '0.75'),
(17, 'CSE-2103', 'Data Structures and Algorithms-I', 3, '3.00'),
(18, 'CSE-2104', 'Data Structures and Algorithms-I Sessional', 3, '1.50'),
(19, 'CSE-2105', 'Object Oriented Programming ', 3, '3.00'),
(20, 'CSE-2106', 'Object Oriented Programming Sessional', 3, '1.50'),
(21, 'EEE-2163', 'Electronic Devices and Circuits', 3, '3.00'),
(22, 'EEE-2164', 'Electronic Devices and Circuits Sessional', 3, '0.75'),
(23, 'MATH- 2145', 'Vector Analysis, Matrices and Fourier Analysis', 3, '3.00'),
(24, 'CSE-2211 ', 'Database Management Systems', 4, '3.00'),
(25, 'CSE-2212', 'Database Management Systems Sessional', 4, '0.75'),
(26, 'CSE-2213', 'Data Structures and Algorithms-II', 4, '3.00'),
(27, 'CSE-2214', 'Data Structures and Algorithms-II Sessional', 4, '0.75'),
(28, 'CSE-2215', 'Digital Electronics and Pulse Technique', 4, '3.00'),
(29, 'CSE-2216', 'Digital Electronics and Pulse Technique Sessional', 4, '0.75'),
(30, 'CSE-2216', 'Advanced Programming', 4, '3.00'),
(31, 'EEE-2265', 'Electrical Drives and Instrumentation', 4, '3.00'),
(32, 'EEE-2266', 'Electrical Drives and Instrumentation Sessional', 4, '0.75'),
(33, 'MATH- 2247', 'Complex Variable and Laplace Transformation', 4, '3.00'),
(35, 'CSE-3101 ', 'Numerical Analysis', 5, '3.00'),
(36, 'CSE-3102', 'Numerical Analysis Sessional', 5, '0.75'),
(37, 'CSE-3103', 'Software Engineering and Information System Design', 5, '3.00'),
(38, 'CSE-3104', 'Software Engineering and Information System Design Sessional', 5, '0.75'),
(39, 'CSE-3105', 'Data and Telecommunication', 5, '3.00'),
(40, 'CSE-3106', 'Data and Telecommunication Sessional', 5, '0.75'),
(41, 'CSE-3107', 'Operating System', 5, '3.00'),
(42, 'CSE-3108', 'Operating System Sessional', 5, '1.50'),
(43, 'CSE-3110', 'Web Programming Sessional', 5, '1.50'),
(44, 'HUM-3157', 'Professional Ethics and Environmental Protection', 5, '3.00'),
(45, 'CSE-3200', 'Integrated Design Project / Capstone Project (Phase I)', 6, '0.75'),
(46, 'CSE-3211', 'Computer Network', 6, '3.00'),
(47, 'CSE-3212', 'Computer Network Sessional', 6, '1.50'),
(48, 'CSE-3213', 'Computer Architecture', 6, '3.00'),
(49, 'CSE-3215', 'Digital Image Processing ', 6, '3.00'),
(50, 'CSE-3216', 'Digital Image Processing Sessional', 6, '1.50'),
(51, 'CSE-3222', 'Programming with Assembly Language Sessional', 6, '0.75'),
(52, 'HUM-3259', 'Engineering Economics and Sociology', 6, '3.00'),
(53, 'HUM-3261', 'Financial and Managerial Accounting', 6, '2.00'),
(54, 'CSE-4000', 'Project / Thesis', 7, '3.00'),
(55, 'CSE-4100', 'Integrated Design Project / Capstone Project(Phase II)', 7, '0.75'),
(56, 'CSE-4101', 'Microprocessors, Micro-controllers and Embedded System', 7, '3.00'),
(57, 'CSE-4102', 'Microprocessors, Micro-controllers and Embedded System Sessional\r\n', 7, '0.75'),
(58, 'CSE-4103 ', 'Compiler Design', 7, '3.00'),
(59, 'CSE-4104', 'Compiler Design Sessional ', 7, '0.75'),
(60, 'CSE-4106', 'Technical Writing and Presentation Sessional', 7, '0.75'),
(61, 'MATH-4107', 'Applied Statistics and Queuing Theory ', 7, '3.00'),
(62, 'HUM-4163', 'Technology Entrepreneurship and Leadership', 7, '3.00'),
(63, 'CSE-4000', 'Project / Thesis', 8, '3.00'),
(64, 'CSE-4201', 'Artificial Intelligence', 8, '3.00'),
(65, 'CSE-4202', 'Artificial Intelligence Sessional ', 8, '0.75'),
(66, 'CSE-4203', 'Data and Network Security', 8, '3.00'),
(67, 'CSE-4205', 'Computer Graphics', 8, '3.00'),
(68, 'CSE-4206', 'Computer Graphics Sessional ', 8, '1.50'),
(69, 'CSE-4207', 'Digital Signal Processing', 8, '3.00'),
(70, 'CSE-4207', 'Digital Signal Processing Sessional ', 8, '0.75');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `profile_image` varchar(200) NOT NULL,
  `user_role` varchar(50) NOT NULL,
  `created_at` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `gender`, `dob`, `password`, `profile_image`, `user_role`, `created_at`) VALUES
(1001, 'Rohit Hasan', 'rohit@gmail.com', 'male', '2000-04-13', 'rohit123', 'rohit.jpg', 'student', '2022-09-21'),
(1002, 'Tony Stark', 'tony@gmail.com', 'male', '1990-12-28', 'tony123', 'tony.png', 'student', '2022-09-19'),
(1003, 'Elon Musk', 'elon@gmail.com', 'male', '2002-07-05', 'elon123', 'elon.jpg', 'department_head', '2022-09-17'),
(1004, 'Emilia Clarke', 'emilia@yahoo.com', 'female', '2001-01-17', 'emilia123', 'emilia.jpg', 'student', '2022-09-23'),
(1015, 'Tim David', 'david@gmail.com', 'male', '2022-09-01', 'david123', '1664117174158609785_486680635824569_2812323689388482491_n.jpg', 'hall_provost', '2022-09-25'),
(1016, 'George David', 'georgedavid@gmail.com', 'male', '2022-09-08', '2016013@', '1664117247158609785_486680635824569_2812323689388482491_n.jpg', 'registrar', '2022-09-25'),
(1017, 'Mr Rahim', 'rahim@gmail.com', 'male', '2022-09-01', '502016013@', '1664289228302435386_2250136205156028_4352972352277270401_n.jpg', 'finace_department', '2022-09-27'),
(1019, 'Kajal Rahman', 'kajal@gmail.com', 'Female', '2000-01-13', 'kajal123', 'emilia.jpg', 'course_coOrdinator', '2022-09-29'),
(1020, 'Shakib Al Hasan', 'sakib@gmail.com', 'male', '1990-05-18', 'sakib123', 'shakib-al-hasan.jpg', 'finace_department', '2022-09-15'),
(1021, 'Liam Livingstone', 'liam@gmail.com', 'male', '1995-03-25', 'liam123', 'liam.png', 'course_co-ordinator', '2022-09-26'),
(1022, 'Isaac Newton', 'newton@gmail.com', 'male', '1970-10-23', 'newton123', 'sir-isaac-newton.jpg', 'student', '2022-09-27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signatures`
--
ALTER TABLE `signatures`
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `student_details`
--
ALTER TABLE `student_details`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1023;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
