-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 26 maj 2024 kl 20:49
-- Serverversion: 10.4.28-MariaDB
-- PHP-version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `issue_management_system`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `comment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur `issues`
--

CREATE TABLE `issues` (
  `issue_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_number` varchar(20) DEFAULT NULL,
  `issue_description` text DEFAULT NULL,
  `status` enum('Open','In Progress','Closed') DEFAULT 'Open',
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_email` varchar(255) DEFAULT NULL,
  `customer_number` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumpning av Data i tabell `issues`
--

INSERT INTO `issues` (`issue_id`, `user_id`, `product_number`, `issue_description`, `status`, `creation_date`, `user_email`, `customer_number`, `priority`) VALUES
(16, 0, NULL, 'dwad', 'Open', '2024-05-26 16:43:38', 'Fredrik@kbttjanster.se', '', 'medel_nivå'),
(17, 0, NULL, 'Hejsas', 'Open', '2024-05-26 17:14:25', 'Fredrik@kbttjanster.se', '1232132124', 'akut'),
(18, 0, NULL, 'min färg är för färgig', 'Open', '2024-05-26 17:31:34', 'Fredrik@kbttjanster.se', '321311231', 'akut'),
(19, 0, NULL, 'a,lwpowe', 'Open', '2024-05-26 18:35:53', 'Fredrik@kbttjanster.se', '', ''),
(20, 0, '123', 'a,lwpowe', 'Open', '2024-05-26 18:37:50', 'Fredrik@kbttjanster.se', NULL, NULL),
(21, 0, '123', 'dwadwa', 'Open', '2024-05-26 18:37:58', 'Fredrik@kbttjanster.se', NULL, NULL),
(22, 0, NULL, '', 'Open', '2024-05-26 18:39:33', '', '', ''),
(23, 0, NULL, '', 'Open', '2024-05-26 18:39:36', '', '', ''),
(24, 0, NULL, '', 'Open', '2024-05-26 18:39:39', '', '', ''),
(25, 0, '', 'JAg dör', 'Open', '2024-05-26 18:40:52', 'Fredrik@kbttjanster.se', NULL, NULL),
(26, 0, '123', 'Hejsan!', 'Open', '2024-05-26 18:44:27', 'Fredrik@kbttjanster.se', NULL, NULL),
(27, 0, '520', 'dwada', 'Open', '2024-05-26 18:46:39', 'fwa@s.se', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellstruktur `issue_assignment`
--

CREATE TABLE `issue_assignment` (
  `assignment_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `assigned_to` int(11) NOT NULL,
  `assignment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur `reports`
--

CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL,
  `report_name` varchar(255) DEFAULT NULL,
  `report_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellstruktur `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumpning av Data i tabell `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `is_admin`) VALUES
(1, 'Fredrik@kbttjanster.se', 'Blitzkrieg', 0);

-- --------------------------------------------------------

--
-- Tabellstruktur `user_documentation`
--

CREATE TABLE `user_documentation` (
  `doc_id` int(11) NOT NULL,
  `doc_name` varchar(255) DEFAULT NULL,
  `doc_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `issue_id` (`issue_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index för tabell `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`issue_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index för tabell `issue_assignment`
--
ALTER TABLE `issue_assignment`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `issue_id` (`issue_id`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Index för tabell `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Index för tabell `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index för tabell `user_documentation`
--
ALTER TABLE `user_documentation`
  ADD PRIMARY KEY (`doc_id`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT för tabell `issues`
--
ALTER TABLE `issues`
  MODIFY `issue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT för tabell `issue_assignment`
--
ALTER TABLE `issue_assignment`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT för tabell `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT för tabell `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT för tabell `user_documentation`
--
ALTER TABLE `user_documentation`
  MODIFY `doc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Restriktioner för tabell `issue_assignment`
--
ALTER TABLE `issue_assignment`
  ADD CONSTRAINT `issue_assignment_ibfk_1` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`),
  ADD CONSTRAINT `issue_assignment_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
