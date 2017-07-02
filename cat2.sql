-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2017 at 05:46 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cat2`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `authorID` int(5) UNSIGNED ZEROFILL NOT NULL COMMENT 'Foreign key to the user''s table.',
  `articleTitle` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Identifies the title of the article.',
  `articleFullText` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Content of the article.',
  `articleCreatedDate` datetime NOT NULL COMMENT 'Identifies when the article was created.',
  `articleLastUpdate` datetime NOT NULL COMMENT 'Identifies when the article was last updated.',
  `articleDisplay` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Shows if the article should be displayed or not.',
  `articleOrder` int(5) UNSIGNED ZEROFILL NOT NULL,
  `articleID` int(5) UNSIGNED ZEROFILL NOT NULL COMMENT 'Uniquely identifies each article.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(5) UNSIGNED ZEROFILL NOT NULL COMMENT 'Uniquely identifies a user.',
  `fullName` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Identifies the user''s name.',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Identifies the user''s email.',
  `phoneNumber` varchar(13) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Identifies the user''s phone number.',
  `userName` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Identifies the username uniquely. ',
  `password` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Provides authentication for the user.',
  `userType` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Identifies the type of user.',
  `accessTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Identifies the last time the user logged in.',
  `profileImage` blob NOT NULL COMMENT 'Stores the users profile image.',
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Identifies the user''s district and county.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`articleID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phoneNumber`),
  ADD UNIQUE KEY `username` (`userName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `articleID` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'Uniquely identifies each article.';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
