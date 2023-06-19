-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Jun 2023 pada 12.08
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
  `vote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `reporting`
--

INSERT INTO `reporting` (`updatedAt`, `createdAt`, `complaint_number`, `complaint_id`, `complainants_name`, `complaint_title`, `complaint_date`, `complaint_category`, `description`, `work_status`, `reason`, `vote`) VALUES
('2023-05-30', '2023-05-30', 1, '8bde91f4-89b2-49dd-bbe8-0', 'Arba Adhy Pamungkas', 'Pelanggan', '2023-05-30', 'Infrastruktur', 'Saya ingin melaporkan masalah yang saya alami dengan layanan pelanggan perusahaan Anda. Saya telah mencoba menghubungi tim dukungan pelanggan melalui email dan telepon, tetapi tidak ada tanggapan yang diberikan. Permintaan bantuan saya terkait dengan faktur yang salah dan pembayaran yang tidak dicatat dengan benar dalam sistem Anda.', 'Selesai', '', 1),
('2023-05-31', '2023-05-30', 2, 'a565ddf7-ce3c-498e-94d8-9', 'Agus Tri Adiana', 'Jalan', '2023-05-30', 'Infrastruktur', 'Saya ingin melaporkan masalah yang saya alami dengan layanan pelanggan perusahaan Anda. Saya telah mencoba menghubungi tim dukungan pelanggan melalui email dan telepon, tetapi tidak ada tanggapan yang diberikan. Permintaan bantuan saya terkait dengan faktur yang salah dan pembayaran yang tidak dicatat dengan benar dalam sistem Anda.', 'Selesai', '', 0),
('2023-05-30', '2023-05-30', 3, '38fcfcda-9c4c-4ee3-9451-8', 'Azmi Aldi Syahrial', 'Lampu', '2023-05-30', 'Keamanan dan Ketertiban', 'Saya ingin melaporkan masalah yang saya alami dengan layanan pelanggan perusahaan Anda. Saya telah mencoba menghubungi tim dukungan pelanggan melalui email dan telepon, tetapi tidak ada tanggapan yang diberikan. Permintaan bantuan saya terkait dengan faktur yang salah dan pembayaran yang tidak dicatat dengan benar dalam sistem Anda.', 'Ditolak', 'Pengaduan Bohong', 0),
('2023-05-30', '2023-05-30', 4, 'dac6b819-aa4f-45b7-96a0-1', 'Arief Roihan Nur Rahman', 'Pembangunan', '2023-05-30', 'Kesehatan Masyarakat', 'Saya ingin melaporkan masalah yang saya alami dengan layanan pelanggan perusahaan Anda. Saya telah mencoba menghubungi tim dukungan pelanggan melalui email dan telepon, tetapi tidak ada tanggapan yang diberikan. Permintaan bantuan saya terkait dengan faktur yang salah dan pembayaran yang tidak dicatat dengan benar dalam sistem Anda.', 'Ditolak', 'Pengaduan Palsu', 0),
('2023-05-31', '2023-05-30', 5, 'adb1e705-0a10-43e6-b20f-7', 'Ayuni Tia Sari', 'Longsor', '2023-05-30', 'Keamanan dan Ketertiban', 'Saya ingin melaporkan masalah yang saya alami dengan layanan pelanggan perusahaan Anda. Saya telah mencoba menghubungi tim dukungan pelanggan melalui email dan telepon, tetapi tidak ada tanggapan yang diberikan. Permintaan bantuan saya terkait dengan faktur yang salah dan pembayaran yang tidak dicatat dengan benar dalam sistem Anda.', 'Diterima', '', 0),
('2023-06-12', '2023-05-30', 6, 'da818955-bc51-4220-9fbb-b', 'Arbaap', 'Pembangunan', '2023-05-30', 'Keamanan dan Ketertiban', 'Saya ingin melaporkan masalah yang saya alami dengan layanan pelanggan perusahaan Anda. Saya telah mencoba menghubungi tim dukungan pelanggan melalui email dan telepon, tetapi tidak ada tanggapan yang diberikan. Permintaan bantuan saya terkait dengan faktur yang salah dan pembayaran yang tidak dicatat dengan benar dalam sistem Anda.', 'Selesai', '', 0),
('2023-05-31', '2023-05-30', 7, 'dc787bbb-f91b-4b4b-8e20-e', 'Arba Adhy', 'Longsor', '2023-05-30', 'Infrastruktur', 'Saya ingin melaporkan masalah yang saya alami dengan layanan pelanggan perusahaan Anda. Saya telah mencoba menghubungi tim dukungan pelanggan melalui email dan telepon, tetapi tidak ada tanggapan yang diberikan. Permintaan bantuan saya terkait dengan faktur yang salah dan pembayaran yang tidak dicatat dengan benar dalam sistem Anda.', 'Ditolak', 'Bohongss', 0),
('2023-05-31', '2023-05-30', 8, '3e63bef5-7052-4456-8030-8', 'Agus Tri', 'Jalan Rusak', '2023-05-30', 'Infrastruktur', 'Saya ingin melaporkan masalah yang saya alami dengan layanan pelanggan perusahaan Anda. Saya telah mencoba menghubungi tim dukungan pelanggan melalui email dan telepon, tetapi tidak ada tanggapan yang diberikan. Permintaan bantuan saya terkait dengan faktur yang salah dan pembayaran yang tidak dicatat dengan benar dalam sistem Anda.', 'Selesai', '', 0),
('2023-05-31', '2023-05-30', 9, '2fcec0d4-2efa-4f0b-bfa0-4', 'Arief Roihan', 'Lampu Rusak', '2023-05-30', 'Pelayan Publik', 'Saya ingin melaporkan masalah yang saya alami dengan layanan pelanggan perusahaan Anda. Saya telah mencoba menghubungi tim dukungan pelanggan melalui email dan telepon, tetapi tidak ada tanggapan yang diberikan. Permintaan bantuan saya terkait dengan faktur yang salah dan pembayaran yang tidak dicatat dengan benar dalam sistem Anda.', 'Diterima', '', 0),
('2023-05-30', '2023-05-30', 10, '91efc3d5-9b75-4790-a220-f', 'Adhy Pamungkas', 'Pembangunan', '2023-05-30', 'Pelayan Publik', 'Saya berharap masalah ini dapat segera ditangani dengan baik. Saya mengharapkan komunikasi yang jelas dan respon yang cepat dari tim dukungan pelanggan Anda. Mohon memberikan perhatian yang serius terhadap masalah ini agar dapat diselesaikan dengan baik dan memulihkan kepercayaan saya terhadap perusahaan Anda.', 'Diterima', '', 0),
('2023-05-31', '2023-05-30', 11, '6e6cbd9d-f666-49d7-a1ce-0', 'Arif Roy', 'Covid-19', '2023-05-30', 'Kesehatan Masyarakat', 'Saya berharap masalah ini dapat segera ditangani dengan baik. Saya mengharapkan komunikasi yang jelas dan respon yang cepat dari tim dukungan pelanggan Anda. Mohon memberikan perhatian yang serius terhadap masalah ini agar dapat diselesaikan dengan baik dan memulihkan kepercayaan saya terhadap perusahaan Anda.', 'Selesai', '', 0),
('2023-06-12', '2023-05-31', 12, 'b8c17820-86cb-49dc-9bd8-8', 'Arbaa', 'Proyek', '2023-05-31', 'Pelayan Publik', 'Saya ingin melaporkan masalah yang saya alami deng...', 'Selesai', '', 0),
('2023-05-31', '2023-05-31', 13, '627d2503-7cb3-44da-a90e-b', 'Arbaad', 'Jalan Rusak', '2023-05-31', 'Infrastruktur', 'Form Pengaduan Silahkan Sampaikan Pengaduan Anda Langsung Kepada Kami', 'Ditolak', 'Jangan Bohong', 0),
('2023-05-31', '2023-05-31', 16, '9dfc4011-9a67-486e-97a2-1', 'Arbaas', 'Pengaduan', '2023-05-31', 'Infrastruktur', 'Form Pengaduan Silahkan Sampaikan Pengaduan Anda Langsung Kepada Kami', 'Selesai', '', 0),
('2023-06-12', '2023-05-31', 17, '770256d4-5016-487f-8c66-6', 'Arbaas', 'Pengaduans', '2023-05-31', 'Infrastruktur', 'Silahkan Sampaikan Pengaduan Anda Langsung Kepada Kami', 'Diterima', '', 0),
('2023-05-31', '2023-05-31', 18, 'b0a2cc53-9dd8-4e97-9374-1', 'Arbaal', 'Jalan', '2023-05-31', 'Pelayan Publik', 'Silahkan Sampaikan Pengaduan Anda Langsung Kepada Kami', 'Ditolak', 'Bohong', 0),
('2023-06-12', '2023-06-12', 19, '887d8611-66e8-4ef7-bfbb-7', 'Test', 'Test', '2023-06-12', 'Infrastruktur', 'Testt', 'Ditolak', 'Reporting False', 0),
('2023-06-12', '2023-06-12', 20, '72753888-ec2b-4b1d-b1eb-5', 'Aditya ', 'Kabel Rusak', '2023-06-12', 'Pelayan Publik', 'saya ingin mengeluhkan tentang kondisi jalan di wilayah kami. Jalan-jalan di sekitar kami telah mengalami kerusakan parah, berlubang, dan tidak terawat dengan baik. Hal ini tidak hanya mengganggu kelancaran lalu lintas, tetapi juga membahayakan keselamatan pengguna jalan. Saya telah melihat beberapa kecelakaan terjadi akibat kondisi jalan yang buruk ini, dan saya khawatir akan dampaknya yang lebih besar jika tidak segera diperbaiki.', 'Pending', '', 0),
('2023-06-12', '2023-06-12', 21, '5c4c6a47-fefb-4f74-aa82-d', 'Adi Pratama', 'Maling', '2023-06-12', 'Keamanan dan Ketertiban', 'saya ingin mengeluhkan tentang kondisi jalan di wilayah kami. Jalan-jalan di sekitar kami telah mengalami kerusakan parah, berlubang, dan tidak terawat dengan baik. Hal ini tidak hanya mengganggu kelancaran lalu lintas, tetapi juga membahayakan keselamatan pengguna jalan. Saya telah melihat beberapa kecelakaan terjadi akibat kondisi jalan yang buruk ini, dan saya khawatir akan dampaknya yang lebih besar jika tidak segera diperbaiki.', 'Pending', '', 0),
('2023-06-12', '2023-06-12', 22, 'a831ae8c-aad4-4b58-ab5c-0', 'Anne ', 'Banjir', '2023-06-12', 'Lingkungan', 'saya ingin mengeluhkan tentang kondisi jalan di wilayah kami. Jalan-jalan di sekitar kami telah mengalami kerusakan parah, berlubang, dan tidak terawat dengan baik. Hal ini tidak hanya mengganggu kelancaran lalu lintas, tetapi juga membahayakan keselamatan pengguna jalan. Saya telah melihat beberapa kecelakaan terjadi akibat kondisi jalan yang buruk ini, dan saya khawatir akan dampaknya yang lebih besar jika tidak segera diperbaiki.', 'Pending', '', 0),
('2023-06-12', '2023-06-12', 23, '672ee595-256e-4936-a6d6-7', 'Alen Nurzalalen', 'Dia Maling', '2023-06-12', 'Keamanan dan Ketertiban', 'saya ingin mengeluhkan tentang kondisi jalan di wilayah kami. Jalan-jalan di sekitar kami telah mengalami kerusakan parah, berlubang, dan tidak terawat dengan baik. Hal ini tidak hanya mengganggu kelancaran lalu lintas, tetapi juga membahayakan keselamatan pengguna jalan. Saya telah melihat beberapa kecelakaan terjadi akibat kondisi jalan yang buruk ini, dan saya khawatir akan dampaknya yang lebih besar jika tidak segera diperbaiki.', 'Pending', '', 0),
('2023-06-12', '2023-06-12', 24, '16f61600-7526-41f4-8281-f', 'Ammar', 'Pengembangan Jalan', '2023-06-12', 'Infrastruktur', 'saya ingin mengeluhkan tentang kondisi jalan di wilayah kami. Jalan-jalan di sekitar kami telah mengalami kerusakan parah, berlubang, dan tidak terawat dengan baik. Hal ini tidak hanya mengganggu kelancaran lalu lintas, tetapi juga membahayakan keselamatan pengguna jalan. Saya telah melihat beberapa kecelakaan terjadi akibat kondisi jalan yang buruk ini, dan saya khawatir akan dampaknya yang lebih besar jika tidak segera diperbaiki.', 'Pending', '', 0),
('2023-06-12', '2023-06-12', 25, '1fdd16d4-3172-4cda-95ca-9', 'Adryan', 'Covid - 19', '2023-06-12', 'Kesehatan Masyarakat', 'saya ingin mengeluhkan tentang kondisi jalan di wilayah kami. Jalan-jalan di sekitar kami telah mengalami kerusakan parah, berlubang, dan tidak terawat dengan baik. Hal ini tidak hanya mengganggu kelancaran lalu lintas, tetapi juga membahayakan keselamatan pengguna jalan. Saya telah melihat beberapa kecelakaan terjadi akibat kondisi jalan yang buruk ini, dan saya khawatir akan dampaknya yang lebih besar jika tidak segera diperbaiki.', 'Pending', '', 0),
('2023-06-19', '2023-06-19', 26, 'd43106e7-952d-44ca-a5f9-9', 'asd', '123', '2023-06-19', 'Infrastruktur', '132', 'Pending', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nik`, `email`, `name`, `password`) VALUES
(1, '32040802031', 'user@gmail.com', 'users', 'users123'),
(2, '320403010', 'test@gmail.com.com', 'test', 'password123'),
(3, '321301231', 'asdas@gmail.com.com', 'asd', 'password123'),
(4, '320407010', 'arba@gmail.com', 'arba', 'arba123'),
(5, '12345', 'arief@roihan.nur.rahman', 'Arief', '123');

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `complaint_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
