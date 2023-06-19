-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Jun 2023 pada 20.36
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
(1, 1234567890, 'Admin', 'Admin', 'Active', 'admin', '123'),
(2, 123009123, 'Admins', 'Admin', 'Active', 'admin', 'admin'),
(4, 2147483647, 'arba', 'is', 'arba', 'arba', 'arba'),
(5, 0, 'arba', 'undefined', 'undefined', 'undefined', 'arba123');

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
  `vote` int(11) NOT NULL,
  `user_id` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `reporting`
--

INSERT INTO `reporting` (`updatedAt`, `createdAt`, `complaint_number`, `complaint_id`, `complainants_name`, `complaint_title`, `complaint_date`, `complaint_category`, `description`, `work_status`, `reason`, `vote`, `user_id`) VALUES
('2023-06-19', '2023-06-19', 44, 'ac1cf6c0-d89a-40f4-a5fb-f', 'Arba', 'Jalan', '2023-06-19', 'Infrastruktur', 'Jalan Rusak', 'Completed', '', 2, '2'),
('2023-06-19', '2023-06-19', 47, '1a96f0e9-3934-4ba2-97e1-6', 'Arba', 'Jalan Rusak', '2023-06-19', 'Infrastruktur', 'Saya ingin mengajukan pengaduan terkait kondisi jalan desa yang rusak parah. Jalan ini merupakan akses utama bagi penduduk desa untuk beraktivitas sehari-hari, termasuk untuk mengirimkan hasil pertanian dan berangkat kerja. Namun, selama beberapa bulan terakhir, jalan ini semakin parah dan tidak layak untuk dilewati. Permukaannya berlubang-lubang besar, banyak batu yang terlepas, dan beberapa bagian jalan bahkan sudah retak. Kondisi jalan yang buruk ini mengganggu mobilitas kami dan juga membahayakan keselamatan pengguna jalan, terutama saat hujan karena jalan menjadi sangat licin. Saya berharap pemerintah desa dapat segera mengatasi masalah ini dengan memperbaiki jalan dan memastikan kualitasnya agar bisa digunakan dengan aman dan nyaman oleh warga desa. Terima kasih.', 'Rejected', 'Pengaduan Palsu', 1, '3'),
('2023-06-20', '2023-06-19', 48, '22d438b0-b9b8-4fdf-9dbe-a', 'Arbas', 'Pelayanan', '2023-06-19', 'Pelayan Publik', 'Saya ingin mengajukan pengaduan terkait kondisi jalan desa yang rusak parah. Jalan ini merupakan akses utama bagi penduduk desa untuk beraktivitas sehari-hari, termasuk untuk mengirimkan hasil pertanian dan berangkat kerja. Namun, selama beberapa bulan terakhir, jalan ini semakin parah dan tidak layak untuk dilewati. Permukaannya berlubang-lubang besar, banyak batu yang terlepas, dan beberapa bagian jalan bahkan sudah retak. Kondisi jalan yang buruk ini mengganggu mobilitas kami dan juga membahayakan keselamatan pengguna jalan, terutama saat hujan karena jalan menjadi sangat licin. Saya berharap pemerintah desa dapat segera mengatasi masalah ini dengan memperbaiki jalan dan memastikan kualitasnya agar bisa digunakan dengan aman dan nyaman oleh warga desa. Terima kasih.', 'Completed', '', 1, '3'),
('2023-06-20', '2023-06-19', 49, '1735a822-7013-4e2c-84ac-f', 'Arba', 'Pembangunan', '2023-06-19', 'Infrastruktur', 'Saya ingin mengajukan pengaduan terkait kondisi jalan desa yang rusak parah. Jalan ini merupakan akses utama bagi penduduk desa untuk beraktivitas sehari-hari, termasuk untuk mengirimkan hasil pertanian dan berangkat kerja. Namun, selama beberapa bulan terakhir, jalan ini semakin parah dan tidak layak untuk dilewati. Permukaannya berlubang-lubang besar, banyak batu yang terlepas, dan beberapa bagian jalan bahkan sudah retak. Kondisi jalan yang buruk ini mengganggu mobilitas kami dan juga membahayakan keselamatan pengguna jalan, terutama saat hujan karena jalan menjadi sangat licin. Saya berharap pemerintah desa dapat segera mengatasi masalah ini dengan memperbaiki jalan dan memastikan kualitasnya agar bisa digunakan dengan aman dan nyaman oleh warga desa. Terima kasih.', 'Accepted', '', 0, '3'),
('2023-06-20', '2023-06-19', 50, 'dc729666-3c8a-45dc-8b66-4', 'Apoey', 'Lampu Gelap', '2023-06-19', 'Keamanan dan Ketertiban', 'Saya ingin mengajukan pengaduan terkait kondisi jalan desa yang rusak parah. Jalan ini merupakan akses utama bagi penduduk desa untuk beraktivitas sehari-hari, termasuk untuk mengirimkan hasil pertanian dan berangkat kerja. Namun, selama beberapa bulan terakhir, jalan ini semakin parah dan tidak layak untuk dilewati. Permukaannya berlubang-lubang besar, banyak batu yang terlepas, dan beberapa bagian jalan bahkan sudah retak. Kondisi jalan yang buruk ini mengganggu mobilitas kami dan juga membahayakan keselamatan pengguna jalan, terutama saat hujan karena jalan menjadi sangat licin. Saya berharap pemerintah desa dapat segera mengatasi masalah ini dengan memperbaiki jalan dan memastikan kualitasnya agar bisa digunakan dengan aman dan nyaman oleh warga desa. Terima kasih.', 'Rejected', 'Palsu', 0, '4'),
('2023-06-19', '2023-06-19', 51, 'ac1cf6c0-d89a-40f4-a5fb-f', 'Arba', 'Jalan', '2023-06-19', 'Infrastruktur', 'Jalan Rusak', 'Completed', '', 2, '2'),
('2023-06-20', '2023-06-20', 52, '4977acb2-6a8c-4918-a2f1-d', 'Poeyy', 'Pengaduan', '2023-06-20', 'Pelayan Publik', 'Saya ingin mengajukan pengaduan terkait kondisi jalan desa yang rusak parah. Jalan ini merupakan akses utama bagi penduduk desa untuk beraktivitas sehari-hari, termasuk untuk mengirimkan hasil pertanian dan berangkat kerja. Namun, selama beberapa bulan terakhir, jalan ini semakin parah dan tidak layak untuk dilewati. Permukaannya berlubang-lubang besar, banyak batu yang terlepas, dan beberapa bagian jalan bahkan sudah retak. Kondisi jalan yang buruk ini mengganggu mobilitas kami dan juga membahayakan keselamatan pengguna jalan, terutama saat hujan karena jalan menjadi sangat licin. Saya berharap pemerintah desa dapat segera mengatasi masalah ini dengan memperbaiki jalan dan memastikan kualitasnya agar bisa digunakan dengan aman dan nyaman oleh warga desa. Terima kasih.', 'Pending', '', 0, '4');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nik` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `email`, `name`, `nik`, `password`) VALUES
(1, 'arba@gmail.com', 'arba', '3204070', 'arba123'),
(2, 'arba', 'arba', '3204070', 'arba'),
(3, 'arbas', 'arbas', '12345', 'arbas'),
(4, 'apoey@gmail.com', 'apoey', '3010', 'apoey123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `verification`
--

CREATE TABLE `verification` (
  `code` varchar(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `verification`
--

INSERT INTO `verification` (`code`, `created_at`) VALUES
('123456', '2023-05-30 19:21:43'),
('229021', '2023-05-30 19:22:08');

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
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `reporting`
--
ALTER TABLE `reporting`
  MODIFY `complaint_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
