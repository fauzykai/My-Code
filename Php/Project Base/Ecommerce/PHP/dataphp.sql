-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 30, 2013 at 10:57 PM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dataphp`
--
CREATE DATABASE `dataphp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dataphp`;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `ttl` varchar(20) NOT NULL,
  `notelp` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `gen` varchar(10) NOT NULL,
  `namak` varchar(20) NOT NULL,
  `emailk` varchar(20) NOT NULL,
  `pesank` varchar(50) NOT NULL,
  `pemilikp` varchar(20) NOT NULL,
  `path` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `email`, `nama`, `ttl`, `notelp`, `alamat`, `gen`, `namak`, `emailk`, `pesank`, `pemilikp`, `path`) VALUES
('vega', 'vega', 'fauzykai@gmail.com', 'vega fauzy', '6 juli 1993', '083820122335', 'bandung', '', '', '', '', '', ''),
('fauzykai', 'tes', 'tes', 'tess', 'tes', '083820122335', 'teeess', '', '', '', '', '', 'Photouser/'),
('jun', 'jundan', 'dhanzfreak@yahoo.com', 'jundan', '1213', '9656345', 'sini', 'L', '', '', '', '', ''),
('anita', 'anita', 'anita', 'anita', 'anita', 'anita', 'anita', 'L', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', 'Photouser/');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
