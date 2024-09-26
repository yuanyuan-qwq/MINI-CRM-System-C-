-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2024 at 07:07 AM
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
-- Database: `aec`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `ClientID` int(11) NOT NULL,
  `Company_name` varchar(255) DEFAULT NULL,
  `Company_address` varchar(255) DEFAULT NULL,
  `Company_num` varchar(15) DEFAULT NULL,
  `Fax_num` varchar(255) DEFAULT NULL,
  `PIC_name` varchar(255) DEFAULT NULL,
  `PIC_num` varchar(15) DEFAULT NULL,
  `PIC_email` varchar(255) DEFAULT NULL,
  `StaffID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`ClientID`, `Company_name`, `Company_address`, `Company_num`, `Fax_num`, `PIC_name`, `PIC_num`, `PIC_email`, `StaffID`) VALUES
(1, 'Example Company', '123 Example St, City, Country', '1234567890', '9876543210', 'John Doe', '0123456789', 'john.doe@example.com', 1),
(2, 'Company2', '123 Example St, City, Country', '1234567890', '9876543210', 'John Doe', '0123456789', 'john.doe@example.com', 1),
(13, 'akaman', 'AOT', '41', '', 'mikasa', '45', 'asd', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ordering`
--

CREATE TABLE `ordering` (
  `OrderID` int(11) NOT NULL,
  `StaffID` int(11) DEFAULT NULL,
  `ClientID` int(11) DEFAULT NULL,
  `Order_date` date DEFAULT NULL,
  `Transportation_cost` decimal(15,2) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordering`
--

INSERT INTO `ordering` (`OrderID`, `StaffID`, `ClientID`, `Order_date`, `Transportation_cost`, `Status`) VALUES
(72, 1, 13, '2024-04-06', 12.00, 'Deposit unpaid'),
(73, 2, 1, '2024-04-06', 23.00, 'Order Complete');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `ListID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Size` varchar(255) DEFAULT NULL,
  `Design_fee` decimal(15,2) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `Unit_price` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`ListID`, `OrderID`, `ProductID`, `Quantity`, `Size`, `Design_fee`, `Remarks`, `Unit_price`) VALUES
(359, 72, 3, 1, '110*400', 2.00, 'i will have order', 2.00),
(360, 72, 1, 2, '900*600', 20.00, 'tatakae', 100.00),
(361, 72, 4, 2, 'free size', 8.00, '哇草原', 10.00),
(362, 72, 4, 2, 'free size', 8.00, '哇草原', 10.00),
(363, 72, 1, 6, 'yyds', 8.00, '瓦特发', 10.00),
(364, 72, 3, 3, '1', 1.00, '1', 1.00),
(365, 73, 3, 1, '2', 2.00, '2', 2.00),
(366, 73, 3, 1, '2', 2.00, '2', 43.00),
(367, 73, 3, 1, '2', 2.00, '2', 43.00);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `StaffID` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Material` varchar(255) DEFAULT NULL,
  `Printing` varchar(255) DEFAULT NULL,
  `Printing_block` varchar(255) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `Unit_price` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `StaffID`, `Name`, `Material`, `Printing`, `Printing_block`, `Category`, `Unit_price`) VALUES
(1, 1, 'Product01', 'Example Material', 'Example Printing', 'Example Printing Block', 'Example Category', 10.99),
(3, 1, 'Product02', 'Example Material', 'Example Printing', 'Example Printing Block', 'Example Category', 10.99),
(4, 2, 'Product03', 'Example Material', 'Example Printing', 'Example Printing Block', 'Example Category', 10.99),
(124, 4, 'fff', 'dsf', 'sdf', 'sdf', 'sdf', 123.00);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `IC` varchar(12) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Phone_num` varchar(15) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` int(11) NOT NULL,
  `Salary` decimal(15,2) NOT NULL,
  `Referral_StaffID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `IC`, `Name`, `Phone_num`, `Email`, `Username`, `Password`, `Role`, `Salary`, `Referral_StaffID`) VALUES
(1, '011123135432', 'Darrick', '0163813842', 'darrick0409@gmail.com', '1', '1', 1, -5000.00, 1),
(2, '011125061101', 'yuan', '010101', 'yuan@gmail.com', 'yuan', 'yuan', 3, 10000.00, 1),
(4, '123456789012', 'John Doe', '1234567890', 'john.doe@example.com', 'johndoe', '324', 2, 500.00, 12),
(9, '139', 'mikasa', '139', '139', '139', '139', 139, 139.00, 324),
(10, 'tatakae', 'Eren', '14515649', 'eren@aot.com', 'eren', 'eren', 2, 9999.00, 2),
(15, 'mimimimimimi', 'mimi', 'mi', 'mi', 'mi', 'mi', 546, 456.00, 123);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ClientID`),
  ADD KEY `StaffID` (`StaffID`);

--
-- Indexes for table `ordering`
--
ALTER TABLE `ordering`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `StaffID` (`StaffID`),
  ADD KEY `ClientID` (`ClientID`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`ListID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `StaffID` (`StaffID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ordering`
--
ALTER TABLE `ordering`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `ListID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=368;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`);

--
-- Constraints for table `ordering`
--
ALTER TABLE `ordering`
  ADD CONSTRAINT `ordering_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`),
  ADD CONSTRAINT `ordering_ibfk_2` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`);

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `ordering` (`OrderID`),
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
