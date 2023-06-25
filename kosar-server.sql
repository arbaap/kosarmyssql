-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jun 2023 pada 14.18
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
(1, 320407000, 'Admin', 'Admin', 'Active', 'admin', '123'),
(2, 320407010, 'Admins', 'Admin', 'Active', 'admin', 'admin'),
(4, 320407011, 'Arba Adhy', 'noAdmin', 'Active', 'arbaadhy', 'arba123'),
(5, 320407012, 'arbaap', 'noAdmin', 'Active', 'arbaap', 'arbaap');

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
('2023-06-25', '2023-06-25', 61, '0cc95b9c-fd5e-4702-8ea9-6', 'Arba Adhy Pamungkas', 'Jalan Rusak', '2023-06-25', 'Infrastruktur', 'Saya ingin mengajukan pengaduan terkait ketidakpuasan saya terhadap layanan yang diberikan di desa kami. Sebagai warga yang tinggal dan berkontribusi dalam pembangunan desa, saya merasa perlu untuk menyampaikan masalah-masalah yang telah saya hadapi dan memberikan saran agar layanan tersebut dapat ditingkatkan.  Kami sering mengalami keterbatasan pasokan air bersih di desa kami, yang sangat mengganggu aktivitas sehari-hari seperti mandi, mencuci, dan memasak. Kami berharap pemerintah desa dapat melakukan perbaikan sistem penyediaan air agar dapat memenuhi kebutuhan kami.  Selain itu, kondisi jalan di desa kami sangat buruk dengan banyak lubang dan kerusakan yang menghambat aksesibilitas dan mengancam keselamatan pengguna jalan. Kami meminta perbaikan jalan yang lebih rutin dan pemeliharaan yang lebih baik agar warga dapat beraktivitas dengan aman dan nyaman.', 'Completed', '', 0, '1'),
('2023-06-25', '2023-06-25', 62, 'aacc7cdf-481a-4094-b01c-d', 'Arba Adhy Pamungkas', 'Pelayanan Masyarakat', '2023-06-25', 'Pelayan Publik', 'Saya ingin mengajukan pengaduan terkait ketidakpuasan saya terhadap layanan yang diberikan di desa kami. Sebagai warga yang tinggal dan berkontribusi dalam pembangunan desa, saya merasa perlu untuk menyampaikan masalah-masalah yang telah saya hadapi dan memberikan saran agar layanan tersebut dapat ditingkatkan.  Kami sering mengalami keterbatasan pasokan air bersih di desa kami, yang sangat mengganggu aktivitas sehari-hari seperti mandi, mencuci, dan memasak. Kami berharap pemerintah desa dapat melakukan perbaikan sistem penyediaan air agar dapat memenuhi kebutuhan kami.  Selain itu, kondisi jalan di desa kami sangat buruk dengan banyak lubang dan kerusakan yang menghambat aksesibilitas dan mengancam keselamatan pengguna jalan. Kami meminta perbaikan jalan yang lebih rutin dan pemeliharaan yang lebih baik agar warga dapat beraktivitas dengan aman dan nyaman.', 'Rejected', 'Pengaduan Palsu', 0, '1'),
('2023-06-25', '2023-06-25', 63, 'ed95fa72-d7cf-4798-bf6f-4', 'Arba Adhy Pamungkas', 'Banyaknya Barang Hilang', '2023-06-25', 'Keamanan dan Ketertiban', 'Saya ingin mengajukan pengaduan terkait ketidakpuasan saya terhadap layanan yang diberikan di desa kami. Sebagai warga yang tinggal dan berkontribusi dalam pembangunan desa, saya merasa perlu untuk menyampaikan masalah-masalah yang telah saya hadapi dan memberikan saran agar layanan tersebut dapat ditingkatkan.  Kami sering mengalami keterbatasan pasokan air bersih di desa kami, yang sangat mengganggu aktivitas sehari-hari seperti mandi, mencuci, dan memasak. Kami berharap pemerintah desa dapat melakukan perbaikan sistem penyediaan air agar dapat memenuhi kebutuhan kami.  Selain itu, kondisi jalan di desa kami sangat buruk dengan banyak lubang dan kerusakan yang menghambat aksesibilitas dan mengancam keselamatan pengguna jalan. Kami meminta perbaikan jalan yang lebih rutin dan pemeliharaan yang lebih baik agar warga dapat beraktivitas dengan aman dan nyaman.', 'Pending', '', 0, '1'),
('2023-06-25', '2023-06-25', 64, 'bf0c82c9-7ac2-48cf-b4f3-0', 'Agus Tri Adiana', 'Penanganan Longsor', '2023-06-25', 'Lingkungan', 'Saya ingin mengajukan pengaduan terkait ketidakpuasan saya terhadap layanan yang diberikan di desa kami. Sebagai warga yang tinggal dan berkontribusi dalam pembangunan desa, saya merasa perlu untuk menyampaikan masalah-masalah yang telah saya hadapi dan memberikan saran agar layanan tersebut dapat ditingkatkan.  Kami sering mengalami keterbatasan pasokan air bersih di desa kami, yang sangat mengganggu aktivitas sehari-hari seperti mandi, mencuci, dan memasak. Kami berharap pemerintah desa dapat melakukan perbaikan sistem penyediaan air agar dapat memenuhi kebutuhan kami.  Selain itu, kondisi jalan di desa kami sangat buruk dengan banyak lubang dan kerusakan yang menghambat aksesibilitas dan mengancam keselamatan pengguna jalan. Kami meminta perbaikan jalan yang lebih rutin dan pemeliharaan yang lebih baik agar warga dapat beraktivitas dengan aman dan nyaman.', 'Pending', '', 0, '2'),
('2023-06-25', '2023-06-25', 65, 'dca800e7-06f6-48ff-9624-0', 'Agus Tri Adiana', 'Covid - 19', '2023-06-25', 'Kesehatan Masyarakat', 'Saya ingin mengajukan pengaduan terkait ketidakpuasan saya terhadap layanan yang diberikan di desa kami. Sebagai warga yang tinggal dan berkontribusi dalam pembangunan desa, saya merasa perlu untuk menyampaikan masalah-masalah yang telah saya hadapi dan memberikan saran agar layanan tersebut dapat ditingkatkan.  Kami sering mengalami keterbatasan pasokan air bersih di desa kami, yang sangat mengganggu aktivitas sehari-hari seperti mandi, mencuci, dan memasak. Kami berharap pemerintah desa dapat melakukan perbaikan sistem penyediaan air agar dapat memenuhi kebutuhan kami.  Selain itu, kondisi jalan di desa kami sangat buruk dengan banyak lubang dan kerusakan yang menghambat aksesibilitas dan mengancam keselamatan pengguna jalan. Kami meminta perbaikan jalan yang lebih rutin dan pemeliharaan yang lebih baik agar warga dapat beraktivitas dengan aman dan nyaman.', 'Accepted', '', 0, '2'),
('2023-06-25', '2023-06-25', 66, '6af96913-6449-48e6-93cb-a', 'Agus Tri Adiana', 'Maling', '2023-06-25', 'Keamanan dan Ketertiban', 'Saya ingin mengajukan pengaduan terkait ketidakpuasan saya terhadap layanan yang diberikan di desa kami. Sebagai warga yang tinggal dan berkontribusi dalam pembangunan desa, saya merasa perlu untuk menyampaikan masalah-masalah yang telah saya hadapi dan memberikan saran agar layanan tersebut dapat ditingkatkan.  Kami sering mengalami keterbatasan pasokan air bersih di desa kami, yang sangat mengganggu aktivitas sehari-hari seperti mandi, mencuci, dan memasak. Kami berharap pemerintah desa dapat melakukan perbaikan sistem penyediaan air agar dapat memenuhi kebutuhan kami.  Selain itu, kondisi jalan di desa kami sangat buruk dengan banyak lubang dan kerusakan yang menghambat aksesibilitas dan mengancam keselamatan pengguna jalan. Kami meminta perbaikan jalan yang lebih rutin dan pemeliharaan yang lebih baik agar warga dapat beraktivitas dengan aman dan nyaman.', 'Rejected', 'Tidak ada Maling', 0, '2'),
('2023-06-25', '2023-06-25', 67, 'b8c7a0ea-535c-4fc7-a5f6-4', 'Azmi Aldi', 'Pembangunan Got', '2023-06-25', 'Infrastruktur', 'Saya ingin mengajukan pengaduan terkait ketidakpuasan saya terhadap layanan yang diberikan di desa kami. Sebagai warga yang tinggal dan berkontribusi dalam pembangunan desa, saya merasa perlu untuk menyampaikan masalah-masalah yang telah saya hadapi dan memberikan saran agar layanan tersebut dapat ditingkatkan.  Kami sering mengalami keterbatasan pasokan air bersih di desa kami, yang sangat mengganggu aktivitas sehari-hari seperti mandi, mencuci, dan memasak. Kami berharap pemerintah desa dapat melakukan perbaikan sistem penyediaan air agar dapat memenuhi kebutuhan kami.  Selain itu, kondisi jalan di desa kami sangat buruk dengan banyak lubang dan kerusakan yang menghambat aksesibilitas dan mengancam keselamatan pengguna jalan. Kami meminta perbaikan jalan yang lebih rutin dan pemeliharaan yang lebih baik agar warga dapat beraktivitas dengan aman dan nyaman.', 'Pending', '', 0, '3'),
('2023-06-25', '2023-06-25', 68, 'cbf69568-9964-4072-988d-3', 'Azmi Aldi', 'Pembangunan Trotoar', '2023-06-25', 'Infrastruktur', 'Saya ingin mengajukan pengaduan terkait ketidakpuasan saya terhadap layanan yang diberikan di desa kami. Sebagai warga yang tinggal dan berkontribusi dalam pembangunan desa, saya merasa perlu untuk menyampaikan masalah-masalah yang telah saya hadapi dan memberikan saran agar layanan tersebut dapat ditingkatkan.  Kami sering mengalami keterbatasan pasokan air bersih di desa kami, yang sangat mengganggu aktivitas sehari-hari seperti mandi, mencuci, dan memasak. Kami berharap pemerintah desa dapat melakukan perbaikan sistem penyediaan air agar dapat memenuhi kebutuhan kami.  Selain itu, kondisi jalan di desa kami sangat buruk dengan banyak lubang dan kerusakan yang menghambat aksesibilitas dan mengancam keselamatan pengguna jalan. Kami meminta perbaikan jalan yang lebih rutin dan pemeliharaan yang lebih baik agar warga dapat beraktivitas dengan aman dan nyaman.', 'Accepted', '', 0, '3'),
('2023-06-25', '2023-06-25', 69, '15d2518d-acb4-4a05-8182-a', 'Azmi Aldi', 'Paparan Covid - 19', '2023-06-25', 'Kesehatan Masyarakat', 'Saya ingin mengajukan pengaduan terkait ketidakpuasan saya terhadap layanan yang diberikan di desa kami. Sebagai warga yang tinggal dan berkontribusi dalam pembangunan desa, saya merasa perlu untuk menyampaikan masalah-masalah yang telah saya hadapi dan memberikan saran agar layanan tersebut dapat ditingkatkan.  Kami sering mengalami keterbatasan pasokan air bersih di desa kami, yang sangat mengganggu aktivitas sehari-hari seperti mandi, mencuci, dan memasak. Kami berharap pemerintah desa dapat melakukan perbaikan sistem penyediaan air agar dapat memenuhi kebutuhan kami.  Selain itu, kondisi jalan di desa kami sangat buruk dengan banyak lubang dan kerusakan yang menghambat aksesibilitas dan mengancam keselamatan pengguna jalan. Kami meminta perbaikan jalan yang lebih rutin dan pemeliharaan yang lebih baik agar warga dapat beraktivitas dengan aman dan nyaman.', 'Pending', '', 0, '3'),
('2023-06-25', '2023-06-25', 70, 'b6820285-70f5-4d29-9026-8', 'Ayuni Tia', 'Aspirasi Warga', '2023-06-25', 'Pelayan Publik', 'Saya ingin mengajukan pengaduan terkait ketidakpuasan saya terhadap layanan yang diberikan di desa kami. Sebagai warga yang tinggal dan berkontribusi dalam pembangunan desa, saya merasa perlu untuk menyampaikan masalah-masalah yang telah saya hadapi dan memberikan saran agar layanan tersebut dapat ditingkatkan.  Kami sering mengalami keterbatasan pasokan air bersih di desa kami, yang sangat mengganggu aktivitas sehari-hari seperti mandi, mencuci, dan memasak. Kami berharap pemerintah desa dapat melakukan perbaikan sistem penyediaan air agar dapat memenuhi kebutuhan kami.  Selain itu, kondisi jalan di desa kami sangat buruk dengan banyak lubang dan kerusakan yang menghambat aksesibilitas dan mengancam keselamatan pengguna jalan. Kami meminta perbaikan jalan yang lebih rutin dan pemeliharaan yang lebih baik agar warga dapat beraktivitas dengan aman dan nyaman.', 'Pending', '', 0, '4'),
('2023-06-25', '2023-06-25', 71, '7dbe8be4-1063-46bd-ad9f-4', 'Ayuni Tia', 'Saluran Air', '2023-06-25', 'Lingkungan', 'Saya ingin mengajukan pengaduan terkait ketidakpuasan saya terhadap layanan yang diberikan di desa kami. Sebagai warga yang tinggal dan berkontribusi dalam pembangunan desa, saya merasa perlu untuk menyampaikan masalah-masalah yang telah saya hadapi dan memberikan saran agar layanan tersebut dapat ditingkatkan.  Kami sering mengalami keterbatasan pasokan air bersih di desa kami, yang sangat mengganggu aktivitas sehari-hari seperti mandi, mencuci, dan memasak. Kami berharap pemerintah desa dapat melakukan perbaikan sistem penyediaan air agar dapat memenuhi kebutuhan kami.  Selain itu, kondisi jalan di desa kami sangat buruk dengan banyak lubang dan kerusakan yang menghambat aksesibilitas dan mengancam keselamatan pengguna jalan. Kami meminta perbaikan jalan yang lebih rutin dan pemeliharaan yang lebih baik agar warga dapat beraktivitas dengan aman dan nyaman.', 'Accepted', '', 0, '4'),
('2023-06-25', '2023-06-25', 72, 'eaada96b-4fa2-4e3c-95e5-f', 'Ayuni Tia', 'Pembuatan Portal Antar Ko', '2023-06-25', 'Keamanan dan Ketertiban', 'Saya ingin mengajukan pengaduan terkait ketidakpuasan saya terhadap layanan yang diberikan di desa kami. Sebagai warga yang tinggal dan berkontribusi dalam pembangunan desa, saya merasa perlu untuk menyampaikan masalah-masalah yang telah saya hadapi dan memberikan saran agar layanan tersebut dapat ditingkatkan.  Kami sering mengalami keterbatasan pasokan air bersih di desa kami, yang sangat mengganggu aktivitas sehari-hari seperti mandi, mencuci, dan memasak. Kami berharap pemerintah desa dapat melakukan perbaikan sistem penyediaan air agar dapat memenuhi kebutuhan kami.  Selain itu, kondisi jalan di desa kami sangat buruk dengan banyak lubang dan kerusakan yang menghambat aksesibilitas dan mengancam keselamatan pengguna jalan. Kami meminta perbaikan jalan yang lebih rutin dan pemeliharaan yang lebih baik agar warga dapat beraktivitas dengan aman dan nyaman.', 'Pending', '', 0, '4'),
('2023-06-25', '2023-06-25', 73, '0b6b5c12-91a5-4d56-b02b-0', 'Arief Roihan', 'Keluhan Penyebaran Covid', '2023-06-25', 'Pelayan Publik', 'Saya ingin mengajukan pengaduan terkait ketidakpuasan saya terhadap layanan yang diberikan di desa kami. Sebagai warga yang tinggal dan berkontribusi dalam pembangunan desa, saya merasa perlu untuk menyampaikan masalah-masalah yang telah saya hadapi dan memberikan saran agar layanan tersebut dapat ditingkatkan.  Kami sering mengalami keterbatasan pasokan air bersih di desa kami, yang sangat mengganggu aktivitas sehari-hari seperti mandi, mencuci, dan memasak. Kami berharap pemerintah desa dapat melakukan perbaikan sistem penyediaan air agar dapat memenuhi kebutuhan kami.  Selain itu, kondisi jalan di desa kami sangat buruk dengan banyak lubang dan kerusakan yang menghambat aksesibilitas dan mengancam keselamatan pengguna jalan. Kami meminta perbaikan jalan yang lebih rutin dan pemeliharaan yang lebih baik agar warga dapat beraktivitas dengan aman dan nyaman.', 'Pending', '', 0, '5'),
('2023-06-25', '2023-06-25', 74, 'd01001db-e88d-4aa8-9526-2', 'Arief Roihan', 'Penanggulangan Covid - 19', '2023-06-25', 'Kesehatan Masyarakat', 'Saya ingin mengajukan pengaduan terkait ketidakpuasan saya terhadap layanan yang diberikan di desa kami. Sebagai warga yang tinggal dan berkontribusi dalam pembangunan desa, saya merasa perlu untuk menyampaikan masalah-masalah yang telah saya hadapi dan memberikan saran agar layanan tersebut dapat ditingkatkan.  Kami sering mengalami keterbatasan pasokan air bersih di desa kami, yang sangat mengganggu aktivitas sehari-hari seperti mandi, mencuci, dan memasak. Kami berharap pemerintah desa dapat melakukan perbaikan sistem penyediaan air agar dapat memenuhi kebutuhan kami.  Selain itu, kondisi jalan di desa kami sangat buruk dengan banyak lubang dan kerusakan yang menghambat aksesibilitas dan mengancam keselamatan pengguna jalan. Kami meminta perbaikan jalan yang lebih rutin dan pemeliharaan yang lebih baik agar warga dapat beraktivitas dengan aman dan nyaman.', 'Pending', '', 0, '5'),
('2023-06-25', '2023-06-25', 75, 'b3a50e04-5f35-424c-8b0e-7', 'Arief Roihan', 'Menjaga Warga dari Papara', '2023-06-25', 'Keamanan dan Ketertiban', 'Saya ingin mengajukan pengaduan terkait ketidakpuasan saya terhadap layanan yang diberikan di desa kami. Sebagai warga yang tinggal dan berkontribusi dalam pembangunan desa, saya merasa perlu untuk menyampaikan masalah-masalah yang telah saya hadapi dan memberikan saran agar layanan tersebut dapat ditingkatkan.  Kami sering mengalami keterbatasan pasokan air bersih di desa kami, yang sangat mengganggu aktivitas sehari-hari seperti mandi, mencuci, dan memasak. Kami berharap pemerintah desa dapat melakukan perbaikan sistem penyediaan air agar dapat memenuhi kebutuhan kami.  Selain itu, kondisi jalan di desa kami sangat buruk dengan banyak lubang dan kerusakan yang menghambat aksesibilitas dan mengancam keselamatan pengguna jalan. Kami meminta perbaikan jalan yang lebih rutin dan pemeliharaan yang lebih baik agar warga dapat beraktivitas dengan aman dan nyaman.', 'Accepted', '', 0, '5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nik` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `account_state` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `email`, `name`, `nik`, `password`, `account_state`) VALUES
(1, 'arbaadhy@gmail.com', 'Arba Adhy Pamungkas', '320001', 'arba123', 'Verified'),
(2, 'agustri@gmail.com', 'Agus Tri Adiana', '320002', 'agus123', 'Verified'),
(3, 'azmialdi@gmail.com', 'Azmi Aldi', '320003', 'azmi123', 'Verified'),
(4, 'ayunitia@gmail.com', 'Ayuni Tia', '320004', 'ayuni123', 'Verified'),
(5, 'ariefroihan@gmail.com', 'Arief Roihan', '320005', 'arief123', 'Verified'),
(6, 'slamet@gmai.com', 'Slamet', '320006', 'slamet123', 'Unverified'),
(7, 'asep@gmail.com', 'Asep', '320007', 'asep123', 'Unverified'),
(8, 'sumarno@gmail.com', 'Sumarno', '320008', 'sumarno123', 'Verified'),
(9, 'sutisna@gmail.com', 'Sutisna', '320009', 'sutisna123', 'Verified'),
(10, 'ridwankamil@gmail.com', 'Ridwan Kamil', '3200010', 'ridwan123', 'Pending'),
(11, 'tatangs@gmail.com', 'Tatang S', '320011', 'tatang123', 'Pending'),
(12, 'jokowi@gmail.com', 'Joko Wi D', '320012', 'joki123', 'Pending'),
(13, 'maaruf@gmail.com', 'Maaruf', '320013', 'maaruf123', 'Pending'),
(14, 'ronaldo@gmail.com', 'Ronal D o', '320014', 'ronaldo123', 'Pending'),
(15, 'messi@gmail.com', 'Messi', '320015', 'messi123', 'Pending');

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
  MODIFY `complaint_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
