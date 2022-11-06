-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2022 at 08:18 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `onlytable`
--

CREATE TABLE `onlytable` (
  `id` int(11) NOT NULL,
  `song_name` varchar(55) NOT NULL,
  `artist_name` varchar(55) NOT NULL,
  `genre` varchar(55) NOT NULL,
  `language` varchar(55) NOT NULL,
  `time` int(11) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `onlytable`
--

INSERT INTO `onlytable` (`id`, `song_name`, `artist_name`, `genre`, `language`, `time`, `likes`) VALUES
(1, 'never gonna give you up', 'rick astley', 'rock', 'english', 320, 42),
(2, 'we will rock you', 'queen', 'rock', 'english', 135, 59),
(3, 'sunflower', 'post malone', 'hip hop', 'english', 145, 55),
(4, 'maahi ve', 'sony nigam', 'hip hop', 'hindi', 367, 99),
(5, 'praise god', 'kanye west', 'pop', 'english', 208, 44),
(6, 'dynamite', 'bts', 'pop', 'korean', 207, 30),
(7, 'greatest', 'eminem', 'hip hop', 'english', 210, 29),
(8, 'senortia', 'shawn mendes', 'pop', 'english', 195, 65),
(9, 'if I could turn back time', 'twenty one pilots', 'pop', 'english', 207, 77),
(10, 'see you again', 'wiz khalifa', 'pop', 'english', 214, 12);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
