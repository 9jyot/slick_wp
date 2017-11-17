-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 16, 2017 at 03:09 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `i8v1g7e3_slickp`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(20) NOT NULL,
  `market_place` varchar(100) NOT NULL,
  `api_key` varchar(50) NOT NULL,
  `status` int(1) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `api_keys`
--

INSERT INTO `api_keys` (`id`, `market_place`, `api_key`, `status`, `created_date`) VALUES
(1, 'dfadfa', 'Nj233ddf', 1, '2017-10-30 11:27:03'),
(2, 'nj', 'fasdffasdfads', 1, '2017-10-30 11:27:52'),
(3, 'asdfasdf', 'fasdfasdf', 1, '2017-10-30 11:40:53'),
(4, 'adfasd', 'sdfasdf', 1, '2017-10-31 04:56:47'),
(5, 'adfasd', 'sdfasdf', 0, '2017-10-31 04:56:55'),
(6, 'fasdf', 'fasd', 0, '2017-10-31 05:10:34'),
(7, 'test', 'arr23sddw', 0, '2017-10-31 05:12:08'),
(8, '', '', 0, '2017-11-01 07:43:02'),
(9, '', '', 0, '2017-11-01 07:56:50');

-- --------------------------------------------------------

--
-- Table structure for table `ip_check`
--

CREATE TABLE `ip_check` (
  `id` int(30) NOT NULL,
  `ip_address` varchar(40) NOT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `count` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ip_check`
--

INSERT INTO `ip_check` (`id`, `ip_address`, `time`, `count`) VALUES
(2, '::1', '2017-11-02 05:44:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `url_hits`
--

CREATE TABLE `url_hits` (
  `url_hits_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `url_string` varchar(1000) NOT NULL,
  `keyword` varchar(1000) NOT NULL,
  `hit_time` datetime NOT NULL,
  `buy_url` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `url_hits`
--

INSERT INTO `url_hits` (`url_hits_id`, `user_id`, `url_string`, `keyword`, `hit_time`, `buy_url`) VALUES
(365713, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-26 11:03:02', 'not buy'),
(365714, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-26 16:43:43', 'not buy'),
(365715, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-26 16:46:22', 'not buy'),
(365716, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-26 16:49:45', 'not buy'),
(365717, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-26 17:04:31', 'not buy'),
(365718, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-26 17:04:45', 'not buy'),
(365719, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-26 17:05:23', 'not buy'),
(365720, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 13:10:52', 'not buy'),
(365721, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 13:10:59', 'not buy'),
(365722, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 13:12:21', 'not buy'),
(365723, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 13:12:26', 'not buy'),
(365724, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 13:12:33', 'not buy'),
(365725, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 13:12:44', 'not buy'),
(365726, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 13:12:54', 'not buy'),
(365727, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 13:13:03', 'not buy'),
(365728, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 13:13:44', 'not buy'),
(365729, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 17:55:27', 'not buy'),
(365730, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 17:55:35', 'not buy'),
(365731, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 17:55:49', 'not buy'),
(365732, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 17:56:03', 'not buy'),
(365733, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 17:56:11', 'not buy'),
(365734, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 17:56:18', 'not buy'),
(365735, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 17:56:22', 'not buy'),
(365736, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 17:56:30', 'not buy'),
(365737, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 17:56:50', 'not buy'),
(365738, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 17:57:13', 'not buy'),
(365739, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 17:57:17', 'not buy'),
(365740, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 17:57:20', 'not buy'),
(365741, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 17:57:23', 'not buy'),
(365742, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 17:57:26', 'not buy'),
(365743, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:00:27', 'not buy'),
(365744, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:00:30', 'not buy'),
(365745, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:00:33', 'not buy'),
(365746, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:00:35', 'not buy'),
(365747, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:00:38', 'not buy'),
(365748, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:00:39', 'not buy'),
(365749, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:00:43', 'not buy'),
(365750, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:00:47', 'not buy'),
(365751, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:06:54', 'not buy'),
(365752, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:06:57', 'not buy'),
(365753, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:07:00', 'not buy'),
(365754, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:07:02', 'not buy'),
(365755, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:07:04', 'not buy'),
(365756, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:07:07', 'not buy'),
(365757, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:07:09', 'not buy'),
(365758, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:21:33', 'not buy'),
(365759, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:21:36', 'not buy'),
(365760, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:22:12', 'not buy'),
(365761, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:22:15', 'not buy'),
(365762, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:22:18', 'not buy'),
(365763, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:22:21', 'not buy'),
(365764, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:22:24', 'not buy'),
(365765, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:35:05', 'not buy'),
(365766, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:35:08', 'not buy'),
(365767, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:35:11', 'not buy'),
(365768, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:35:14', 'not buy'),
(365769, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:35:16', 'not buy'),
(365770, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:35:22', 'not buy'),
(365771, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:35:31', 'not buy'),
(365772, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:44:00', 'not buy'),
(365773, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:44:03', 'not buy'),
(365774, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:44:07', 'not buy'),
(365775, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:44:10', 'not buy'),
(365776, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:44:13', 'not buy'),
(365777, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:44:16', 'not buy'),
(365778, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:45:39', 'not buy'),
(365779, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:52:31', 'not buy'),
(365780, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:52:34', 'not buy'),
(365781, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:52:37', 'not buy'),
(365782, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:52:39', 'not buy'),
(365783, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:52:42', 'not buy'),
(365784, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:52:44', 'not buy'),
(365785, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:55:09', 'not buy'),
(365786, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:55:12', 'not buy'),
(365787, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:55:14', 'not buy'),
(365788, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:55:17', 'not buy'),
(365789, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:55:19', 'not buy'),
(365790, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:55:21', 'not buy'),
(365791, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:55:29', 'not buy'),
(365792, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:55:40', 'not buy'),
(365793, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:55:55', 'not buy'),
(365794, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:56:48', 'not buy'),
(365795, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 18:56:56', 'not buy'),
(365796, 18, '/slick/product_page.php?searching_word=140053271X', '140053271X', '2017-10-27 19:02:26', 'not buy'),
(365797, 18, '/slick/product_page.php?searching_word=1559391332', '1559391332', '2017-10-27 19:02:34', 'not buy'),
(365798, 18, '/slick/product_page.php?searching_word=1929243464', '1929243464', '2017-10-27 19:02:43', 'not buy'),
(365799, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:03:00', 'not buy'),
(365800, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:18:11', 'not buy'),
(365801, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:18:15', 'not buy'),
(365802, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:18:18', 'not buy'),
(365803, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:18:21', 'not buy'),
(365804, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:18:24', 'not buy'),
(365805, 18, '/slick/product_page.php?searching_word=1559391332', '1559391332', '2017-10-27 19:18:30', 'not buy'),
(365806, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:18:37', 'not buy'),
(365807, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:18:43', 'not buy'),
(365808, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:19:02', 'not buy'),
(365809, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:24:57', 'not buy'),
(365810, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:25:04', 'not buy'),
(365811, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:25:06', 'not buy'),
(365812, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:25:10', 'not buy'),
(365813, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:25:14', 'not buy'),
(365814, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:25:17', 'not buy'),
(365815, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:25:21', 'not buy'),
(365816, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:25:25', 'not buy'),
(365817, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:26:24', 'not buy'),
(365818, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:26:49', 'not buy'),
(365819, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:27:11', 'not buy'),
(365820, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:27:13', 'not buy'),
(365821, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:27:16', 'not buy'),
(365822, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:27:18', 'not buy'),
(365823, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:28:51', 'not buy'),
(365824, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:29:02', 'not buy'),
(365825, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:29:06', 'not buy'),
(365826, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:29:07', 'not buy'),
(365827, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:29:11', 'not buy'),
(365828, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:29:16', 'not buy'),
(365829, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:29:18', 'not buy'),
(365830, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:32:24', 'not buy'),
(365831, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:32:28', 'not buy'),
(365832, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:32:30', 'not buy'),
(365833, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:32:33', 'not buy'),
(365834, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:32:35', 'not buy'),
(365835, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:32:38', 'not buy'),
(365836, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:38:21', 'not buy'),
(365837, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:38:25', 'not buy'),
(365838, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:38:27', 'not buy'),
(365839, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:38:29', 'not buy'),
(365840, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:38:31', 'not buy'),
(365841, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:38:35', 'not buy'),
(365842, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:40:18', 'not buy'),
(365843, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:40:21', 'not buy'),
(365844, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:40:24', 'not buy'),
(365845, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:40:26', 'not buy'),
(365846, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:40:29', 'not buy'),
(365847, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:40:31', 'not buy'),
(365848, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:41:23', 'not buy'),
(365849, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:41:28', 'not buy'),
(365850, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:41:30', 'not buy'),
(365851, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:41:33', 'not buy'),
(365852, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:41:37', 'not buy'),
(365853, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:41:39', 'not buy'),
(365854, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:42:47', 'not buy'),
(365855, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:46:15', 'not buy'),
(365856, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:46:19', 'not buy'),
(365857, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:46:22', 'not buy'),
(365858, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:46:26', 'not buy'),
(365859, 18, '/slick/product_page.php?searching_word=Thomas', 'Thomas', '2017-10-27 19:46:30', 'not buy'),
(365860, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:46:33', 'not buy'),
(365861, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:46:51', 'not buy'),
(365862, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:46:54', 'not buy'),
(365863, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:47:51', 'not buy'),
(365864, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:47:54', 'not buy'),
(365865, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:47:59', 'not buy'),
(365866, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:48:02', 'not buy'),
(365867, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:48:04', 'not buy'),
(365868, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:48:08', 'not buy'),
(365869, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:48:10', 'not buy'),
(365870, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:48:13', 'not buy'),
(365871, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 19:49:24', 'not buy'),
(365872, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:04:55', 'not buy'),
(365873, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:04:59', 'not buy'),
(365874, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:05:02', 'not buy'),
(365875, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:05:05', 'not buy'),
(365876, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:05:08', 'not buy'),
(365877, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:05:11', 'not buy'),
(365878, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:05:51', 'not buy'),
(365879, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:05:57', 'not buy'),
(365880, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:06:01', 'not buy'),
(365881, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:06:03', 'not buy'),
(365882, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:06:06', 'not buy'),
(365883, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:06:08', 'not buy'),
(365884, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:07:35', 'not buy'),
(365885, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:07:39', 'not buy'),
(365886, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:07:41', 'not buy'),
(365887, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:07:43', 'not buy'),
(365888, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:07:44', 'not buy'),
(365889, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:07:49', 'not buy'),
(365890, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:07:56', 'not buy'),
(365891, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:07:59', 'not buy'),
(365892, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:13:13', 'not buy'),
(365893, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:13:15', 'not buy'),
(365894, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:13:19', 'not buy'),
(365895, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:13:21', 'not buy'),
(365896, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:13:24', 'not buy'),
(365897, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:20:29', 'not buy'),
(365898, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:20:37', 'not buy'),
(365899, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:20:39', 'not buy'),
(365900, 18, '/slick/product_page.php?searching_word=Thomas', 'Thomas', '2017-10-27 20:20:41', 'not buy'),
(365901, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:20:46', 'not buy'),
(365902, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:23:21', 'not buy'),
(365903, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-27 20:23:25', 'not buy'),
(365904, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:39:48', 'not buy'),
(365905, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:40:01', 'not buy'),
(365906, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:41:00', 'not buy'),
(365907, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:41:04', 'not buy'),
(365908, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:41:08', 'not buy'),
(365909, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:41:11', 'not buy'),
(365910, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:41:16', 'not buy'),
(365911, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:41:19', 'not buy'),
(365912, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:41:32', 'not buy'),
(365913, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:41:36', 'not buy'),
(365914, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:48:07', 'not buy'),
(365915, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:49:25', 'not buy'),
(365916, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:49:41', 'not buy'),
(365917, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:49:54', 'not buy'),
(365918, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:50:01', 'not buy'),
(365919, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:50:47', 'not buy'),
(365920, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:50:51', 'not buy'),
(365921, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:50:54', 'not buy'),
(365922, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:50:59', 'not buy'),
(365923, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:51:05', 'not buy'),
(365924, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:53:44', 'not buy'),
(365925, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:53:48', 'not buy'),
(365926, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:53:51', 'not buy'),
(365927, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:53:53', 'not buy'),
(365928, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:54:01', 'not buy'),
(365929, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:54:10', 'not buy'),
(365930, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:54:14', 'not buy'),
(365931, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:54:17', 'not buy'),
(365932, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:55:00', 'not buy'),
(365933, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:55:05', 'not buy'),
(365934, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:55:08', 'not buy'),
(365935, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 09:55:11', 'not buy'),
(365936, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 10:54:43', 'not buy'),
(365937, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 10:54:47', 'not buy'),
(365938, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 10:54:52', 'not buy'),
(365939, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 10:54:58', 'not buy'),
(365940, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 10:55:02', 'not buy'),
(365941, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 10:55:05', 'not buy'),
(365942, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 10:55:13', 'not buy'),
(365943, 18, '/slick/product_page.php?searching_word=1929243464', '1929243464', '2017-10-30 10:55:25', 'not buy'),
(365944, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:01:32', 'not buy'),
(365945, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:15:27', 'not buy'),
(365946, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:16:57', 'not buy'),
(365947, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:17:01', 'not buy'),
(365948, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:17:07', 'not buy'),
(365949, 18, '/slick/product_page.php?searching_word=1929243464', '1929243464', '2017-10-30 11:17:15', 'not buy'),
(365950, 18, '/slick/product_page.php?searching_word=1929243464', '1929243464', '2017-10-30 11:17:23', 'not buy'),
(365951, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:17:27', 'not buy'),
(365952, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:19:02', 'not buy'),
(365953, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:19:05', 'not buy'),
(365954, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:19:08', 'not buy'),
(365955, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:19:10', 'not buy'),
(365956, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:19:12', 'not buy'),
(365957, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:19:14', 'not buy'),
(365958, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:20:42', 'not buy'),
(365959, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:20:45', 'not buy'),
(365960, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:20:47', 'not buy'),
(365961, 18, '/slick/product_page.php?searching_word=1589946863', '1589946863', '2017-10-30 11:20:54', 'not buy'),
(365962, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:20:57', 'not buy'),
(365963, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:21:00', 'not buy'),
(365964, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:24:21', 'not buy'),
(365965, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:25:29', 'not buy'),
(365966, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:25:44', 'not buy'),
(365967, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:25:46', 'not buy'),
(365968, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:25:49', 'not buy'),
(365969, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:25:51', 'not buy'),
(365970, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 11:57:46', 'not buy'),
(365971, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 12:43:07', 'not buy'),
(365972, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 19:52:23', 'not buy'),
(365973, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 20:00:42', 'not buy'),
(365974, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 20:00:46', 'not buy'),
(365975, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 20:00:58', 'not buy'),
(365976, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 20:01:02', 'not buy'),
(365977, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-10-30 20:01:04', 'not buy'),
(365978, 18, '/slick/product_page.php?searching_word=chetan%20bhagat', 'chetan bhagat', '2017-11-02 15:44:11', 'not buy'),
(365979, 18, '/slick/product_page.php?searching_word=chetan%20bhagat&page=2&page_start=1', 'chetan bhagat', '2017-11-02 15:47:37', 'not buy'),
(365980, 18, '/slick/product_page.php?searching_word=chetan%20bhagat&page=3&page_start=1', 'chetan bhagat', '2017-11-02 15:47:40', 'not buy'),
(365981, 18, '/slick/product_page.php?searching_word=chetan%20bhagat&page=4&page_start=1', 'chetan bhagat', '2017-11-02 15:47:43', 'not buy'),
(365982, 18, '/slick/product_page.php?searching_word=chetan%20bhagat&page=1&page_start=1', 'chetan bhagat', '2017-11-02 18:47:58', 'not buy'),
(365983, 18, '/slick/product_page.php?searching_word=chetan%20bhagat&page=4&page_start=1', 'chetan bhagat', '2017-11-02 18:48:01', 'not buy');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `full_name` varchar(500) NOT NULL,
  `password` int(100) NOT NULL,
  `is_active` int(1) NOT NULL,
  `user_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email_id`, `user_name`, `full_name`, `password`, `is_active`, `user_type`) VALUES
(17, 'navjyot.gaonkar@gmail.com', 'navjyot', 'gaonkar', 0, 1, 'admin'),
(18, 'external@gmail.com', 'external', 'external', 0, 1, 'user'),
(26, 'test@test123.com', 'deepti', 'deepti', 123456, 1, 'admin'),
(39, 'avinash.bergode@gmail.com', 'avinash.bergode@gmail.com', 'Avinash B', 0, 1, 'user'),
(40, 'chetan.sergode@gmail.com', 'chetan.sergode@gmail.com', 'Chetan', 0, 1, 'user'),
(41, 'ganesh.rergode@gmail.com', 'ganesh.rergode@gmail.com', 'GaneshR', 0, 1, 'user'),
(44, 'Krishna.mergode@gmail.com', 'Krishna.mergode@gmail.com', 'Krishna M', 0, 0, 'user'),
(45, 'manoj@ergodeinc.com', 'manoj@ergodeinc.com', 'Manoj', 0, 0, 'user'),
(46, 'pooja.kergode@gmail.com', 'pooja.kergode@gmail.com', 'Pooja', 0, 0, 'user'),
(47, 'sachin.kergode@gmail.com', 'sachin.kergode@gmail.com', 'SachinKamble', 0, 1, 'user'),
(48, 'shubhamergode@gmail.com', 'shubhamergode@gmail.com', 'ShubhamPawar', 0, 1, 'user'),
(49, 'swapnil.dergode@gmail.com', 'swapnil.dergode@gmail.com', 'Swapnil', 0, 0, 'user'),
(50, 'shubham.pergode@gmail.com', 'shubham.pergode@gmail.com', 'Shubham', 0, 1, 'user'),
(51, 'suvarna.gergode@gmail.com', 'suvarna.gergode@gmail.com', 'SuvarnaGhadge', 0, 1, 'user'),
(52, 'sandeep.vergode@gmail.com', 'sandeep.vergode@gmail.com', 'Sandeep', 0, 1, 'user'),
(53, 'ravindra.gergode@gmail.com', 'ravindra.gergode@gmail.com', 'Ravindra', 0, 0, 'user'),
(54, 'dipakkumar.gergode@gmail.com', 'dipakkumar.gergode@gmail.com', 'Dipak', 0, 0, 'user'),
(55, 'amol.bergode@gmail.com', 'amol.bergode@gmail.com', 'AmolB', 0, 0, 'user'),
(56, 'anup.aergode@gmail.com', 'anup.aergode@gmail.com', 'Anup', 0, 1, 'user'),
(57, 'sujeet.dergode@gmail.com', 'sujeet.dergode@gmail.com', 'Sujeet', 0, 0, 'user'),
(58, 'hiren.gergode@gmail.com', 'hiren.gergode@gmail.com', 'Hiren', 0, 1, 'user'),
(59, 'harishkumar.bergode@gmail.com', 'harishkumar.bergode@gmail.com', 'Harish', 0, 0, 'user'),
(63, 'pranav@ergodeinc.com', 'pranav@ergodeinc.com', 'PranavKadav', 0, 1, 'admin'),
(64, 'anish@ergodeinc.com', 'superadmin', 'anish doshi', 0, 1, 'admin'),
(65, 'hemangi.mergode@gmail.com', 'hemangi.mergode@gmail.com', 'Hemangi', 0, 1, 'user'),
(66, 'punitkumar.gergode@gmail.com', 'punitkumar.gergode@gmail.com', 'Punit', 0, 1, 'user'),
(67, 'jwalesh.iergode@gmail.com', 'jwalesh.iergode@gmail.com', 'Jwalesh', 0, 1, 'user'),
(68, 'Santosh.yergode@gmail.com', 'Santosh.yergode@gmail.com', 'Santosh', 0, 1, 'user'),
(69, 'admin@gmail.com', 'admin', 'admin', 0, 1, 'admin'),
(70, 'rohan.bergode@gmail.com', 'rohan.bergode@gmail.com', 'Rohan B', 0, 1, 'user'),
(71, 'samruddhee.sergode@gmail.com', 'samruddhee.sergode@gmail.com', 'Samruddhi S', 0, 1, 'user'),
(72, 'tushar.pergode@gmail.com', 'tushar.pergode@gmail.com', 'Tushar P', 0, 1, 'user'),
(73, 'shashank.tergode@gmail.com', 'shashank.tergode@gmail.com', 'Shashank T', 0, 1, 'user'),
(74, 'sumeet.cergode@gmail.com', 'sumeet.cergode@gmail.com', 'Sumeet C', 0, 1, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_rights_detail`
--

CREATE TABLE `user_rights_detail` (
  `user_rights_detail_id` int(11) NOT NULL,
  `user_id` int(1) NOT NULL,
  `new` int(1) NOT NULL,
  `used` int(1) NOT NULL,
  `rental` int(1) NOT NULL,
  `e_book` int(1) NOT NULL,
  `free_shipping` int(1) NOT NULL,
  `dashboard` int(1) NOT NULL,
  `account_setting` int(1) NOT NULL,
  `user_setting` int(1) NOT NULL,
  `manage_user` int(1) NOT NULL,
  `change_password` int(1) NOT NULL,
  `international` int(1) NOT NULL,
  `apply_coupons` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_rights_detail`
--

INSERT INTO `user_rights_detail` (`user_rights_detail_id`, `user_id`, `new`, `used`, `rental`, `e_book`, `free_shipping`, `dashboard`, `account_setting`, `user_setting`, `manage_user`, `change_password`, `international`, `apply_coupons`) VALUES
(14, 17, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1),
(15, 18, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1),
(23, 26, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1),
(36, 39, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(37, 40, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(38, 41, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(41, 44, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(42, 45, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(43, 46, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(44, 47, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(45, 48, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(46, 49, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(47, 50, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(48, 51, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(49, 52, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(50, 53, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(51, 54, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(52, 55, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(53, 56, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(54, 57, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(55, 58, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(56, 59, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(60, 63, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1),
(61, 64, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1),
(62, 65, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(63, 66, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(64, 67, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(65, 68, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(66, 69, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1),
(67, 70, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(68, 71, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(69, 72, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(70, 73, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(71, 74, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ip_check`
--
ALTER TABLE `ip_check`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `url_hits`
--
ALTER TABLE `url_hits`
  ADD PRIMARY KEY (`url_hits_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_rights_detail`
--
ALTER TABLE `user_rights_detail`
  ADD PRIMARY KEY (`user_rights_detail_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `ip_check`
--
ALTER TABLE `ip_check`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `url_hits`
--
ALTER TABLE `url_hits`
  MODIFY `url_hits_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365984;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT for table `user_rights_detail`
--
ALTER TABLE `user_rights_detail`
  MODIFY `user_rights_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
