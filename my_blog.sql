-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2020 at 04:43 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `ph_no` varchar(15) NOT NULL,
  `mes` text NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `user_name`, `email`, `ph_no`, `mes`, `date`) VALUES
(1, 'rajib', 'rarrrefd@gmail.com', '917699291997', 'this is first text', '10/10/2010'),
(2, 'rajib manna', 'rathorejagdish647@gmail.com', '919876544321', 'thi is contact form website\r\n', '2020-08-22 11:42:02.692192'),
(3, 'subrata kumar bir', 'subrata2000@gmail.com', '46547747824', 'My name is subrata. ', '2020-08-22 19:30:55.577632');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `sno` int(50) NOT NULL,
  `title` varchar(500) NOT NULL,
  `slug` varchar(500) NOT NULL,
  `content` varchar(500) NOT NULL,
  `date` varchar(50) NOT NULL,
  `img_file` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`sno`, `title`, `slug`, `content`, `date`, `img_file`) VALUES
(1, 'first post', 'first-post', 'this is my first post.\r\ni dont know its work or not\r\n', '10/10/2010', 'a.jpg'),
(2, 'Nikola Tesla', 'p-2', ' Tesla studied engineering and physics in the 1870s without receiving a degree, gaining practical experience in the early 1880s working in telephony and at Continental Edison in the new electric power industry. In 1884 he emigrated to the United States, where he became a naturalized citizen. He worked for a short time at the Edison Machine Works in New York City before he struck out on his own. With the help of partners to finance and market his ideas, Tesla set up laboratories and companies in ', '20/09/2020', 'd.jpg'),
(3, 'JC bose', 'p-3', 'Sir Jagadish Chandra Bose[1] CSI CIE FRS[2][3][4] (/boʊs/;[5], IPA: [dʒɔɡodiʃ tʃɔndro bosu]; 30 November 1858 – 23 November 1937[6]), also spelled Jagdish and Jagadis,[7] was a biologist, physicist, botanist and an early writer of science fiction.[8] He pioneered the investigation of radio and microwave optics, made significant contributions to plant science, and laid the foundations of experimental science in the Indian subcontinent.[9] IEEE named him one of the fathers of radio science.[10] Bo', '24/09/2020', 'd.jpg'),
(4, 'A. P. J. Abdul Kalam', 'p-4', 'Avul Pakir Jainulabdeen Abdul Kalam (/ˈæbdəl kəˈlɑːm/ (About this soundlisten); 15 October 1931 – 27 July 2015) was an Indian aerospace scientist and politician who served as the 11th President of India from 2002 to 2007. He was born and raised in Rameswaram, Tamil Nadu and studied physics and aerospace engineering. He spent the next four decades as a scientist and science administrator, mainly at the Defence Research and Development Organisation (DRDO) and Indian Space Research Organisation (IS', '21/092020', 'a.jpg'),
(5, 'Bill Gates', 'p-5', 'William Henry Gates III (born October 28, 1955) is an American business magnate, software developer, and philanthropist. He is best known as the co-founder of Microsoft Corporation.[2][3] During his career at Microsoft, Gates held the positions of chairman, chief executive officer (CEO), president and chief software architect, while also being the largest individual shareholder until May 2014. He is one of the best-known entrepreneurs and pioneers of the microcomputer revolution of the 1970s and', '22/09/2020', 'c.jpg'),
(8, 'Koushik Pal', 'k-p', 'dfjjkhgklyl;dhdrghsfgfhfjhjhgkjthlk', '2020-09-25', 'kp.jpg'),
(9, 'Rajib Manna', 'r-m', 'gyytiituoeryujsryawrfqegruyuokiuokjtujtyjhyr', '2020-09-25', 'c.jpg'),
(10, 'Ratan Manna', 'Bad gay', 'It\'s work', '2020-09-27', 'C.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
