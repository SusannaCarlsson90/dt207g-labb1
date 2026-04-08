-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Värd: localhost
-- Tid vid skapande: 08 apr 2026 kl 20:28
-- Serverversion: 10.4.28-MariaDB
-- PHP-version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `cv`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `coursecode` varchar(10) NOT NULL,
  `coursename` varchar(100) NOT NULL,
  `syllabus` varchar(255) NOT NULL,
  `progression` varchar(5) NOT NULL,
  `term` varchar(10) NOT NULL,
  `points` decimal(4,1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumpning av Data i tabell `courses`
--

INSERT INTO `courses` (`id`, `coursecode`, `coursename`, `syllabus`, `progression`, `term`, `points`, `date_added`) VALUES
(5, 'DT224G', 'Introduktion till webbutveckling med HTML, CSS och JavaScript', 'https://www.miun.se/utbildning/kursplaner-och-utbildningsplaner/DT224G/', 'A', 'HT-2025', 15.0, '2026-04-08 12:28:04'),
(6, 'DT200G', 'Grafisk teknik för webb', 'https://www.miun.se/utbildning/kursplaner-och-utbildningsplaner/DT200G/', 'A', 'HT-2025', 7.5, '2026-04-08 12:29:06'),
(7, 'DT068G', 'Webbanvändbarhet', 'https://www.miun.se/utbildning/kursplaner-och-utbildningsplaner/DT068G/', 'A', 'HT-25', 7.5, '2026-04-08 12:30:01'),
(8, 'DT003G', 'Databaser', 'https://www.miun.se/utbildning/kursplaner-och-utbildningsplaner/DT003G/', 'A', 'VT-26', 7.5, '2026-04-08 12:30:44'),
(9, 'DT211G', 'Frontend-baserad webbutveckling', 'https://www.miun.se/utbildning/kursplaner-och-utbildningsplaner/DT211G/', 'B', 'VT-26', 7.5, '2026-04-08 12:31:38'),
(10, 'DT207G', 'Backend-baserad webbutveckling', 'https://www.miun.se/utbildning/kursplaner-och-utbildningsplaner/DT207G/', 'B', 'VT-26', 7.5, '2026-04-08 12:32:30'),
(12, '12345', 'Test', 'https://www.miun.se/utbildning/kursplaner-och-utbildningsplaner/DT207G/', 'A', 'HT-25', 15.0, '2026-04-08 18:14:58');

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
