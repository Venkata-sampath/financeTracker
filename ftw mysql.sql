-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2024 at 04:53 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ftw`
--

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` enum('Income','Expense') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `category` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `user_id`, `type`, `amount`, `category`, `date`, `description`, `created_at`) VALUES
(1, 1, 'Income', 10.00, 'salary', '2024-06-18', 'june salary', '2024-06-18 10:31:39'),
(2, 2, 'Income', 20.00, 'salary', '2024-06-18', 'hello', '2024-06-18 10:32:25'),
(3, 1, 'Expense', 5.00, 'food', '2024-06-18', 'lunch', '2024-06-18 10:36:37'),
(4, 1, 'Expense', 5.00, 'clothing', '2024-06-18', 'shoes', '2024-06-18 10:37:11'),
(5, 2, 'Expense', 6.00, 'bills', '2024-06-18', 'electricity bill', '2024-06-18 10:37:55'),
(6, 3, 'Income', 100.00, 'salary', '2024-06-18', 'june salary', '2024-06-18 10:39:19'),
(7, 1, 'Income', 10.00, 'freelance', '2024-06-18', 'video edit', '2024-06-18 10:51:44'),
(8, 3, 'Expense', 200.00, 'others', '2024-06-18', 'car', '2024-06-18 10:59:13'),
(9, 2, 'Expense', 2.00, 'food', '2024-06-18', 'dinner', '2024-06-18 11:20:18'),
(10, 2, 'Income', 20.00, 'investment', '2024-06-18', 'reliance stocks', '2024-06-18 11:20:39'),
(11, 3, 'Income', 300.00, 'investment', '2024-06-18', 'stocks', '2024-06-18 11:22:33'),
(12, 3, 'Expense', 35.00, 'food', '2024-06-18', 'lunch', '2024-06-18 11:38:33'),
(13, 3, 'Expense', 20.00, 'clothing', '2024-06-18', 'shirt', '2024-06-18 11:39:01'),
(14, 3, 'Expense', 45.00, 'bills', '2024-06-18', 'rent', '2024-06-18 11:39:16'),
(15, 1, 'Expense', 25.00, 'bills', '2024-06-18', 'tax', '2024-06-18 11:39:51'),
(16, 1, 'Income', 300.00, 'freelance', '2024-06-18', 'website for client', '2024-06-18 11:40:41'),
(17, 1, 'Income', 23.00, 'freelance', '2024-06-18', 'edit', '2024-06-18 12:11:48'),
(18, 3, 'Expense', 24.00, 'others', '2024-06-18', 'jimpak', '2024-06-18 12:17:07'),
(20, 1, 'Expense', 30.00, 'food', '2024-06-19', 'lunch', '2024-06-19 16:25:37'),
(21, 1, 'Income', 100.00, 'investment', '2024-06-10', 'stocks', '2024-06-19 17:41:22'),
(22, 1, 'Expense', 25.00, 'clothing', '2024-06-17', 'shoes', '2024-06-19 17:42:08'),
(23, 1, 'Expense', 30.00, 'clothing', '2024-06-10', 'shirt', '2024-06-19 17:43:15'),
(24, 1, 'Expense', 10.00, 'bills', '2024-06-17', 'parking ticket', '2024-06-19 18:18:38'),
(26, 4, 'Income', 20000.00, 'salary', '2024-06-27', '', '2024-06-21 06:41:21'),
(27, 4, 'Expense', 2000.00, 'clothing', '2024-06-21', 'mall', '2024-06-21 06:42:13'),
(28, 4, 'Expense', 300.00, 'bills', '2024-06-22', '', '2024-06-21 06:42:53'),
(29, 4, 'Expense', 200.00, 'others', '2024-06-22', 'ebill', '2024-06-21 06:43:59'),
(30, 5, 'Income', 10000.00, 'freelance', '2024-06-01', '', '2024-06-21 07:04:43'),
(31, 5, 'Expense', 500.00, 'food', '2024-06-05', '', '2024-06-21 07:05:37'),
(32, 1, 'Income', 100.00, 'salary', '2024-07-02', 'july salary', '2024-07-02 16:14:41'),
(33, 2, 'Expense', 10.00, 'clothing', '2024-07-02', 'shirt', '2024-07-02 16:15:16'),
(34, 2, 'Income', 100.00, 'salary', '2024-07-08', 'july salary', '2024-07-08 16:57:54'),
(35, 2, 'Expense', 10.00, 'clothing', '2024-07-08', 'shirt', '2024-07-08 16:58:17'),
(36, 2, 'Expense', 10.00, 'food', '2024-07-08', 'dinner', '2024-07-08 16:58:47'),
(37, 6, 'Income', 50000.00, 'salary', '2024-07-10', '', '2024-07-11 04:39:12'),
(38, 6, 'Expense', 560.00, 'food', '2024-08-09', 'food', '2024-07-11 04:46:51'),
(39, 1, 'Income', 150.00, 'finance', '2024-07-12', 'sdkj', '2024-07-11 07:16:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'sampath', '123@gmail.com', '$2y$10$NZqmfLgCh2nBQP6UxrtPd.syuPm2FXotMxq/hB65RNKJvRl55RdQC'),
(2, 'ravi', '1234@gmail.com', '$2y$10$oX.YSXe1fnWoOsNg6nHZBeI8R/PksNT.MR2MvPUplTRKaubNiHu8y'),
(3, 'hari', '12345@gmail.com', '$2y$10$EL145o1eBWjFElVGwWF03eAep902TxlpurF3MWSuEIpAsrJh/0D0S'),
(4, 'test', 'test@g.com', '$2y$10$7IdeoWoqIpeATPXx4lObq.a7HWniHZnLR6n/eEy6b/alKCBYNMgES'),
(5, 'akhil', 'akhil@gmail.com', '$2y$10$6E0lfPpvQOnIQivuz55Zfe9unzSj3zGKC.UFmLeBsXKVZ0BPNqB6y'),
(6, 'ram', '098@gmail.com', '$2y$10$dKwkjN.iXLMS7kkP2WjgPO3cn.QhU/sYBt/zEA8x6EsNIgA7q6vm6'),
(7, '123', '1234@gmail.com', '$2y$10$bMQh0EvgL7./X9PvMoICkeVlnSLm2VBpS6cqoHI4qKsuFhVFxZ6xS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
