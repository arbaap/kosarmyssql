-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Bulan Mei 2023 pada 17.40
-- Versi server: 10.4.16-MariaDB
-- Versi PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kosar-server`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee`
--

CREATE TABLE `employee` (
  `employee_number` int(11) NOT NULL,
  `nip` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `position` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `employee`
--

INSERT INTO `employee` (`employee_number`, `nip`, `name`, `position`, `status`, `username`, `password`) VALUES
(1, 1234567890, 'Admin', 'Admin', 'Active', 'admin', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reporting`
--

CREATE TABLE `reporting` (
  `updatedAt` date NOT NULL,
  `createdAt` date NOT NULL,
  `complaint_number` int(11) NOT NULL,
  `complaint_id` varchar(25) NOT NULL,
  `complainants_name` varchar(25) NOT NULL,
  `complaint_title` varchar(25) NOT NULL,
  `complaint_date` date NOT NULL,
  `complaint_category` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `work_status` varchar(20) NOT NULL,
  `reason` text NOT NULL,
  `vote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_number`);

--
-- Indeks untuk tabel `reporting`
--
ALTER TABLE `reporting`
  ADD PRIMARY KEY (`complaint_number`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `reporting`
--
ALTER TABLE `reporting`
  MODIFY `complaint_number` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
