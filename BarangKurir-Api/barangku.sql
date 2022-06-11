-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2022 at 01:34 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barangku`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_item`
--

CREATE TABLE `tb_item` (
  `id` int(11) NOT NULL,
  `item_code` text NOT NULL,
  `item_name` text NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `gambar` text DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_item`
--

INSERT INTO `tb_item` (`id`, `item_code`, `item_name`, `price`, `stock`, `gambar`, `status`) VALUES
(1, 'jl.ngeksigondo.no17', 'laptop gaming', 18000000, 40002, 'https://cdn.medcom.id/images/library/images/asus%20rog%20strix%20g15%20(6).jpeg', 'belum'),
(3, 'jl.kariurang .km5', 'Air softgun', 500000, 1000, 'https://mmc.tirto.id/image/otf/500x0/2021/04/13/istock-1269300683_ratio-16x9.jpg', 'terkirim'),
(4, 'jl. Magelang. km6', 'Ps Vita 2000', 1500000, 500, 'https://images.pushsquare.com/5ce305fb98c91/1280x720.jpg', NULL),
(5, 'surakarta', 'samurai', 3000000, 2500, 'https://bagi-in.com/wp-content/uploads/2017/08/Nodachi.jpg', NULL),
(9, 'denpasar', 'samurai', 3000000, 2500, 'https://i0.wp.com/www.theweddingvowsg.com/wp-content/uploads/2021/04/Shadow-Roadster-5.jpg?w=1024&ssl=1', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_item`
--
ALTER TABLE `tb_item`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_item`
--
ALTER TABLE `tb_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
