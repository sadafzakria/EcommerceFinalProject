-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2023 at 06:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shmewelry`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `FirstName`, `LastName`, `Email`, `Password`) VALUES
(1, 'Sadaf', 'Zakria', 'sadafzakria@gmail.com', 'Ecommerce');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `ClientID` int(11) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `Quantity` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`ClientID`, `FirstName`, `LastName`, `Email`, `Password`, `Quantity`) VALUES
(1, 'John', 'Doe', 'johndoe@gmail.com', 'Ecommerce', 0);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `ProductID` int(11) NOT NULL,
  `Size` tinyint(4) NOT NULL,
  `Stock` int(11) NOT NULL,
  `Quantity Sold` int(11) NOT NULL,
  `Popularity` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`ProductID`, `Size`, `Stock`, `Quantity Sold`, `Popularity`) VALUES
(1, 4, 100, 0, NULL),
(1, 5, 100, 0, NULL),
(1, 6, 100, 0, NULL),
(1, 7, 100, 0, NULL),
(2, 4, 100, 0, NULL),
(2, 5, 100, 0, NULL),
(2, 6, 100, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `OrderPlaced` date NOT NULL,
  `OrderDelivery` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Description` varchar(30) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Manufacturer` varchar(30) NOT NULL,
  `Rating` tinyint(4) DEFAULT NULL,
  `Image` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `Name`, `Description`, `Price`, `Manufacturer`, `Rating`, `Image`) VALUES
(1, 'Eternal Elegance', 'Gold Ring', 65.00, 'LuxeCraft Jewelers', NULL, 'eternalElegance.png'),
(2, 'Timeless Beauty', 'Silver Ring', 125.00, 'LuxeCraft Jewelers', NULL, 'timelessBeauty.png'),
(3, 'Crystal Cascade', 'Silver Necklace', 110.00, 'Royal Goldsmiths Inc.', NULL, 'crystalCascade.png'),
(4, 'Shimmering Splendor', 'Gold Necklace', 165.00, 'Royal Goldsmiths Inc.', NULL, 'shimmeringSplendor.png'),
(5, 'Golden Gleam', 'Gold Bracelet', 125.00, 'Royal Goldsmiths Inc.', NULL, 'goldenGleam.png'),
(6, 'Radiant Luster', 'Silver Bracelet', 65.00, 'Diamond Haven', NULL, 'radiantLuster.png'),
(7, 'Pearl Paradise', 'Pearl Earrings', 220.00, 'Diamond Haven', NULL, 'pearlParadise.png'),
(8, 'Oceanic Opulence', 'Silver Earrings', 65.00, 'Diamond Haven', NULL, 'oceanicOpulence.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ClientID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD UNIQUE KEY `ProductID_Size_ck` (`ProductID`,`Size`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `ClientID_fk` (`ClientID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `ProductID_fk` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `ClientID_fk` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
