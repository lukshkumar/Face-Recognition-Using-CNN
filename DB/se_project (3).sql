-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 03, 2019 at 12:27 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `se_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities_illegal`
--

CREATE TABLE `activities_illegal` (
  `activities_illegal_id` int(11) NOT NULL,
  `date_time` varchar(500) NOT NULL,
  `criminal_id` int(11) NOT NULL,
  `jail_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `activities_legal`
--

CREATE TABLE `activities_legal` (
  `activity_id` int(11) NOT NULL,
  `criminal_id` int(11) NOT NULL,
  `jail_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `guard_id` int(11) NOT NULL,
  `date_time` varchar(500) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activities_legal`
--

INSERT INTO `activities_legal` (`activity_id`, `criminal_id`, `jail_id`, `description`, `guard_id`, `date_time`, `status`) VALUES
(12, 1, 3, 'Test', 3, '2019-05-08 13:46:31', 1),
(11, 1, 3, 'Test', 3, '2019-05-08 13:46:07', 0),
(9, 1, 3, 'Test', 3, '2019-05-07 21:14:58', 0),
(10, 1, 3, 'Test In', 3, '2019-05-07 21:25:54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `email`, `password`) VALUES
(1, 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_guard`
--

CREATE TABLE `attendance_guard` (
  `attendance_guard_id` int(11) NOT NULL,
  `guard_id` int(11) NOT NULL,
  `date` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance_guard`
--

INSERT INTO `attendance_guard` (`attendance_guard_id`, `guard_id`, `date`) VALUES
(1, 3, '2019-05-07');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_officer`
--

CREATE TABLE `attendance_officer` (
  `attendance_officer_id` int(11) NOT NULL,
  `officer_id` int(11) NOT NULL,
  `date` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance_officer`
--

INSERT INTO `attendance_officer` (`attendance_officer_id`, `officer_id`, `date`) VALUES
(1, 6, '2019-05-07'),
(2, 0, '2019-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `criminal`
--

CREATE TABLE `criminal` (
  `criminal_id` int(11) NOT NULL,
  `warrant_no` varchar(500) DEFAULT NULL,
  `cell_number` int(11) DEFAULT NULL,
  `jail_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `entry_date` varchar(500) DEFAULT NULL,
  `exit_date` varchar(500) DEFAULT NULL,
  `gang_id` int(11) DEFAULT NULL,
  `type` varchar(500) DEFAULT NULL,
  `url` varchar(500) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `time_per_week` varchar(500) DEFAULT NULL,
  `gcmtoken` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `criminal`
--

INSERT INTO `criminal` (`criminal_id`, `warrant_no`, `cell_number`, `jail_id`, `name`, `description`, `entry_date`, `exit_date`, `gang_id`, `type`, `url`, `status`, `time_per_week`, `gcmtoken`) VALUES
(18, NULL, NULL, 3, 'Luksh', NULL, NULL, NULL, NULL, NULL, 'http://localhost/se/imgs_training/luksh6.png', NULL, NULL, NULL),
(19, NULL, NULL, 3, 'Luksh', NULL, NULL, NULL, NULL, NULL, 'http://localhost/se/imgs_training/luksh6.png', NULL, NULL, NULL),
(17, NULL, NULL, 3, 'Ali', NULL, NULL, NULL, NULL, NULL, 'http://localhost/se/imgs_training/Ali.jpg', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `criminal_works`
--

CREATE TABLE `criminal_works` (
  `criminal_works_id` int(11) NOT NULL,
  `criminal_id` int(11) NOT NULL,
  `jail_id` int(11) NOT NULL,
  `date` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `criminal_works`
--

INSERT INTO `criminal_works` (`criminal_works_id`, `criminal_id`, `jail_id`, `date`) VALUES
(2, 1, 1, 'vsfvsf');

-- --------------------------------------------------------

--
-- Table structure for table `gang`
--

CREATE TABLE `gang` (
  `gang_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `description` varchar(500) NOT NULL,
  `activity` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gang`
--

INSERT INTO `gang` (`gang_id`, `name`, `description`, `activity`) VALUES
(2, 'Gaddu gang', 'this is very dangerous', 'they kill people'),
(3, 'Test Gang', 'Test', 'Test');

-- --------------------------------------------------------

--
-- Table structure for table `guard`
--

CREATE TABLE `guard` (
  `guard_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `time_in` varchar(11) DEFAULT NULL,
  `time_out` varchar(11) DEFAULT NULL,
  `jail_id` int(11) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `sal_per_day` varchar(500) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `verified` tinyint(4) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guard`
--

INSERT INTO `guard` (`guard_id`, `name`, `email`, `password`, `time_in`, `time_out`, `jail_id`, `url`, `sal_per_day`, `phone`, `otp`, `verified`) VALUES
(2, ' amir  ali', '', '', '1', '1', 0, 'imgs/Snapchat-914896986.jpg', '15', NULL, NULL, 0),
(3, 'ali', 'guard@gmail.com', 'df4ad9d5c22ecabca116e2b8dd0c140c', '1', '14', 3, 'imgs/me.jpg', '200', '', '', 0),
(58, 'bilal', 'bilal@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '111', '1115', 3, 'https://i0.wp.com/zblogged.com/wp-content/uploads/2019/02/FakeDP.jpeg?resize=567%2C580&ssl=1', '10000', '923368274539', '814023', 1),
(59, 'vsjkb', 'jvsjkb@gmail.com', '6fc58352aec394f91b1c33abb57f1918', '00:59', '01:00', 4, 'imgs/test2.png', '1', '', '', 0),
(60, 'bilal', NULL, '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, NULL, NULL, NULL, '085', '290313', 0),
(69, 'luksh', NULL, '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, NULL, NULL, NULL, '923353073796', '576674', 1),
(62, 'bilalaha', NULL, '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, NULL, NULL, NULL, '125', '806057', 0),
(63, 'ahmed', NULL, 'c4ca4238a0b923820dcc509a6f75849b', NULL, NULL, NULL, NULL, NULL, '92345682', '333398', 0),
(64, 'hahaha', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, '84546', '908308', 0),
(68, 'abdullah', NULL, '74b87337454200d4d33f80c4663dc5e5', NULL, NULL, NULL, NULL, NULL, '923111367147', '177657', 0),
(70, 'aliakbar', NULL, 'b59c67bf196a4758191e42f76670ceba', NULL, NULL, NULL, NULL, NULL, '923242818662', '642332', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jail`
--

CREATE TABLE `jail` (
  `jail_id` int(11) NOT NULL,
  `city` varchar(500) NOT NULL,
  `name` varchar(500) NOT NULL,
  `total_cell` int(11) NOT NULL,
  `location` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jail`
--

INSERT INTO `jail` (`jail_id`, `city`, `name`, `total_cell`, `location`) VALUES
(4, 'Karachi', 'New for testing', 2, '5th street north nazimabad'),
(3, 'Attock', 'Main Jail', 5, '5th street near mosque'),
(5, 'Islamabad', 'Test Prison', 10, '22'),
(6, 'Islamabad', 'Test', 10, '22');

-- --------------------------------------------------------

--
-- Table structure for table `live_chat`
--

CREATE TABLE `live_chat` (
  `live_chat_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `officer_id` int(11) DEFAULT NULL,
  `guard_id` int(11) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `sender` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `live_chat`
--

INSERT INTO `live_chat` (`live_chat_id`, `sender_id`, `receiver_id`, `officer_id`, `guard_id`, `message`, `sender`) VALUES
(1, 3, 6, 6, 3, 'Hi', 'guard'),
(2, 6, 3, 6, 3, 'Hello', 'officer'),
(3, 3, 6, 6, 3, 'How are you?', 'guard');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `message` varchar(100) NOT NULL,
  `users_id` int(11) NOT NULL,
  `sentat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `criminal_id` int(11) DEFAULT '0',
  `name` varchar(500) NOT NULL,
  `description` varchar(500) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `officer`
--

CREATE TABLE `officer` (
  `officer_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `time_in` varchar(500) NOT NULL,
  `time_out` varchar(500) NOT NULL,
  `jail_id` int(11) NOT NULL,
  `url` varchar(500) NOT NULL,
  `sal_per_day` varchar(500) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `otp` varchar(10) NOT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `officer`
--

INSERT INTO `officer` (`officer_id`, `name`, `email`, `password`, `time_in`, `time_out`, `jail_id`, `url`, `sal_per_day`, `phone`, `otp`, `verified`) VALUES
(6, 'Ali Akbar', 'officer@gmail.com', 'd31d86d0de8dd34fc535c67e480deaa2', '09:00', '18:00', 3, 'imgs/Snapchat-719740619.jpg', '500', '', '', 0),
(7, 'Ali', 'ali@gmail.com', '984d8144fa08bfc637d2825463e184fa', '05:00', '01:00', 4, 'imgs/image.jpeg', '500', '0335-3073796', '', 0),
(8, 'jvbsjk', 'vbs@gmail.com', '49c9f483451d2c43d26b999f34c11a62', '01:00', '01:00', 4, 'imgs/test.png', '1', '0335-1156', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `packet`
--

CREATE TABLE `packet` (
  `id` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `seq` int(11) NOT NULL,
  `checksum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `packet`
--

INSERT INTO `packet` (`id`, `message`, `seq`, `checksum`) VALUES
(133, 'ali', 0, 310),
(134, 'Luksh Kumar', 1, 1063),
(135, 'Luksh Kumar', 1, 1063),
(136, 'washing', 0, 753),
(137, 'amir', 1, 425),
(138, 'amir', 1, 425),
(139, 'Amir ali', 0, 735),
(140, 'CN ', 1, 177),
(141, 'cn lab ', 0, 576),
(142, 'bit by bit', 1, 921),
(143, 'yes', 0, 337),
(144, 'no ', 1, 253),
(145, 'no ', 1, 253);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `tittle` varchar(1000) NOT NULL,
  `shortdesc` varchar(500) NOT NULL,
  `rating` float NOT NULL,
  `price` double NOT NULL,
  `image` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `tittle`, `shortdesc`, `rating`, `price`, `image`) VALUES
(1, 'qdqwdqwd', 'wefqedqedqe', 663.5, 151, 'https://www.postplanner.com/hs-fs/hub/513577/file-2886416984-png/blog-files/facebook-profile-pic-vs-cover-photo-sq.png?width=250&height=250&name=facebook-profile-pic-vs-cover-photo-sq.png'),
(2, 'scsdcsdc', 'sdcsdcsd', 55.25, 4555, 'https://www.postplanner.com/hs-fs/hub/513577/file-2886416984-png/blog-files/facebook-profile-pic-vs-cover-photo-sq.png?width=250&height=250&name=facebook-profile-pic-vs-cover-photo-sq.pngs'),
(3, 'qdqwdqwd', 'wefqedqedqe', 663.5, 151, 'https://www.postplanner.com/hs-fs/hub/513577/file-2886416984-png/blog-files/facebook-profile-pic-vs-cover-photo-sq.png?width=250&height=250&name=facebook-profile-pic-vs-cover-photo-sq.png'),
(4, 'scsdcsdc', 'sdcsdcsd', 55.25, 4555, 'https://www.postplanner.com/hs-fs/hub/513577/file-2886416984-png/blog-files/facebook-profile-pic-vs-cover-photo-sq.png?width=250&height=250&name=facebook-profile-pic-vs-cover-photo-sq.pngs');

-- --------------------------------------------------------

--
-- Table structure for table `reference`
--

CREATE TABLE `reference` (
  `reference_id` int(11) NOT NULL,
  `criminal_id` int(11) NOT NULL,
  `relation` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reference`
--

INSERT INTO `reference` (`reference_id`, `criminal_id`, `relation`) VALUES
(1, 1, 'Ali bhai'),
(2, 1, 'Luksh Bhai'),
(3, 1, 'Amir bhai'),
(4, 1, 'test'),
(5, 2, 'Test Ref');

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `location` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `training`
--

INSERT INTO `training` (`id`, `name`, `location`) VALUES
(3, 'Ali', 'http://tdsp.org.pk/se/imgs_training/Ali.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `validate`
--

CREATE TABLE `validate` (
  `id` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `seq` varchar(500) NOT NULL,
  `checksum` varchar(500) NOT NULL,
  `result` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `validate`
--

INSERT INTO `validate` (`id`, `message`, `seq`, `checksum`, `result`) VALUES
(133, 'ali', '0', '310', 'No Error'),
(134, '', 'NA', 'NA', 'Packet Lost'),
(135, 'Luksh Kumar', '1', '1063', 'No Error'),
(136, 'washing', '0', '753', 'No Error'),
(137, '', 'NA', 'NA', 'Packet Lost'),
(138, 'amir', '1', '425', 'No Error'),
(139, 'Amir ali', '0', '735', 'No Error'),
(140, 'CN ', '1', '177', 'No Error'),
(141, 'cn lab ', '0', '576', 'No Error'),
(142, 'bit by bit', '1', '921', 'No Error'),
(143, 'yes', '0', '337', 'No Error'),
(144, '', 'NA', 'NA', 'Packet Lost'),
(145, ' ', '0', '32', 'Bit Error');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_activities`
--

CREATE TABLE `visitor_activities` (
  `visitor_activities_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `criminal_id` int(11) NOT NULL,
  `reference_id` int(11) DEFAULT '0',
  `time_in` varchar(500) NOT NULL,
  `time_out` varchar(500) NOT NULL,
  `jail_id` int(11) NOT NULL,
  `date_at` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visitor_activities`
--

INSERT INTO `visitor_activities` (`visitor_activities_id`, `name`, `criminal_id`, `reference_id`, `time_in`, `time_out`, `jail_id`, `date_at`) VALUES
(1, 'Test 1', 1, 1, '18:00', '19:00', 4, '2019-05-04'),
(2, 'Test 2', 1, 1, '18:36', '20:36', 4, '2019-05-04'),
(3, 'Test 3', 1, 1, '18:50', '21:50', 4, '2019-05-04'),
(4, 'Test 4', 1, 1, '18:41', '21:41', 4, '2019-05-04'),
(8, 'Test 6', 2, 1, '18:49', '19:49', 4, '2019-05-04'),
(7, 'Test 5', 1, 1, '18:48', '19:48', 4, '2019-05-04');

-- --------------------------------------------------------

--
-- Table structure for table `works`
--

CREATE TABLE `works` (
  `works_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `description` varchar(500) NOT NULL,
  `wage` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `works`
--

INSERT INTO `works` (`works_id`, `name`, `description`, `wage`) VALUES
(2, 'cleaning the floor', 'its a long duty ', '50'),
(3, 'cleaning ', 'cleanring the floor is necessary ', '50'),
(4, 'Testing Work', '10', '10');

-- --------------------------------------------------------

--
-- Table structure for table `works_allowed`
--

CREATE TABLE `works_allowed` (
  `works_allowed_id` int(11) NOT NULL,
  `works_id` int(11) NOT NULL,
  `warrant_no` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities_illegal`
--
ALTER TABLE `activities_illegal`
  ADD PRIMARY KEY (`activities_illegal_id`);

--
-- Indexes for table `activities_legal`
--
ALTER TABLE `activities_legal`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `attendance_guard`
--
ALTER TABLE `attendance_guard`
  ADD PRIMARY KEY (`attendance_guard_id`);

--
-- Indexes for table `attendance_officer`
--
ALTER TABLE `attendance_officer`
  ADD PRIMARY KEY (`attendance_officer_id`);

--
-- Indexes for table `criminal`
--
ALTER TABLE `criminal`
  ADD PRIMARY KEY (`criminal_id`);

--
-- Indexes for table `criminal_works`
--
ALTER TABLE `criminal_works`
  ADD PRIMARY KEY (`criminal_works_id`);

--
-- Indexes for table `gang`
--
ALTER TABLE `gang`
  ADD PRIMARY KEY (`gang_id`);

--
-- Indexes for table `guard`
--
ALTER TABLE `guard`
  ADD PRIMARY KEY (`guard_id`);

--
-- Indexes for table `jail`
--
ALTER TABLE `jail`
  ADD PRIMARY KEY (`jail_id`);

--
-- Indexes for table `live_chat`
--
ALTER TABLE `live_chat`
  ADD PRIMARY KEY (`live_chat_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_users` (`users_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `officer`
--
ALTER TABLE `officer`
  ADD PRIMARY KEY (`officer_id`);

--
-- Indexes for table `packet`
--
ALTER TABLE `packet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reference`
--
ALTER TABLE `reference`
  ADD PRIMARY KEY (`reference_id`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `validate`
--
ALTER TABLE `validate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_activities`
--
ALTER TABLE `visitor_activities`
  ADD PRIMARY KEY (`visitor_activities_id`);

--
-- Indexes for table `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`works_id`);

--
-- Indexes for table `works_allowed`
--
ALTER TABLE `works_allowed`
  ADD PRIMARY KEY (`works_allowed_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities_illegal`
--
ALTER TABLE `activities_illegal`
  MODIFY `activities_illegal_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activities_legal`
--
ALTER TABLE `activities_legal`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance_guard`
--
ALTER TABLE `attendance_guard`
  MODIFY `attendance_guard_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance_officer`
--
ALTER TABLE `attendance_officer`
  MODIFY `attendance_officer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `criminal`
--
ALTER TABLE `criminal`
  MODIFY `criminal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `criminal_works`
--
ALTER TABLE `criminal_works`
  MODIFY `criminal_works_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gang`
--
ALTER TABLE `gang`
  MODIFY `gang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `guard`
--
ALTER TABLE `guard`
  MODIFY `guard_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `jail`
--
ALTER TABLE `jail`
  MODIFY `jail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `live_chat`
--
ALTER TABLE `live_chat`
  MODIFY `live_chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `officer`
--
ALTER TABLE `officer`
  MODIFY `officer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `packet`
--
ALTER TABLE `packet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reference`
--
ALTER TABLE `reference`
  MODIFY `reference_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `validate`
--
ALTER TABLE `validate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `visitor_activities`
--
ALTER TABLE `visitor_activities`
  MODIFY `visitor_activities_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `works`
--
ALTER TABLE `works`
  MODIFY `works_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `works_allowed`
--
ALTER TABLE `works_allowed`
  MODIFY `works_allowed_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
