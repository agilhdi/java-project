-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2020 at 04:36 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiket`
--

-- --------------------------------------------------------

--
-- Table structure for table `gerbong`
--

CREATE TABLE `gerbong` (
  `id_gerbong` int(11) NOT NULL,
  `jumlah_kursi` int(11) NOT NULL,
  `no_kursi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_kereta` int(11) NOT NULL,
  `keberangkatan_kereta` varchar(255) NOT NULL,
  `asal_kereta` varchar(255) NOT NULL,
  `kedatangan_kereta` varchar(255) NOT NULL,
  `tujuan_kereta` varchar(255) NOT NULL,
  `id_pesawat` int(255) NOT NULL,
  `keberangkatan_pesawat` varchar(255) NOT NULL,
  `asal_pesawat` varchar(255) NOT NULL,
  `kedatangan_pesawat` varchar(255) NOT NULL,
  `tujuan_pesawat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kelas_pesawat`
--

CREATE TABLE `kelas_pesawat` (
  `id_kelas` int(11) NOT NULL,
  `jenis_kelas` varchar(255) NOT NULL,
  `id_class` int(11) NOT NULL,
  `no_seat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kereta`
--

CREATE TABLE `kereta` (
  `id_kereta` int(11) NOT NULL,
  `asal_kereta` varchar(255) NOT NULL,
  `id_gerbong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id_user`, `username`, `password`, `role`) VALUES
(1, 'agil', 'agil', 'administrator'),
(3, 'abdul', 'abdul', 'manajemen'),
(5, 'hadi', 'hadi', 'costumer');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `email_pelanggan` varchar(50) NOT NULL,
  `telp_pelanggan` varchar(13) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pesan_kereta`
--

CREATE TABLE `pesan_kereta` (
  `id_pesanKA` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_kereta` int(11) NOT NULL,
  `tgl_keberangkatan` date NOT NULL,
  `harga` int(11) NOT NULL,
  `jml_pesan` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `status_bayar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pesan_pesawat`
--

CREATE TABLE `pesan_pesawat` (
  `id_pesan` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_pesawat` int(11) NOT NULL,
  `tgl_keberangkatan` date NOT NULL,
  `harga` int(11) NOT NULL,
  `jml_pesan` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `status_bayar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pesawat`
--

CREATE TABLE `pesawat` (
  `id_pesawat` int(11) NOT NULL,
  `maskapai` varchar(255) NOT NULL,
  `id_kelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tiket_kereta`
--

CREATE TABLE `tiket_kereta` (
  `id_tiketKA` int(11) NOT NULL,
  `id_pesanKA` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_kereta` int(11) NOT NULL,
  `id_gerbong` int(11) NOT NULL,
  `no_kursi` int(11) NOT NULL,
  `kedatangan_kereta` varchar(255) NOT NULL,
  `keberangkatan_kereta` varchar(255) NOT NULL,
  `asal_kereta` varchar(255) NOT NULL,
  `tujuan_kereta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tiket_pesawat`
--

CREATE TABLE `tiket_pesawat` (
  `id_tiket` int(11) NOT NULL,
  `id_pesan` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_pesawat` int(11) NOT NULL,
  `no_seat` int(11) NOT NULL,
  `keberangkatan_pesawat` varchar(255) NOT NULL,
  `kedatangan_pesawat` varchar(255) NOT NULL,
  `asal_pesawat` varchar(255) NOT NULL,
  `tujuan_pesawat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gerbong`
--
ALTER TABLE `gerbong`
  ADD PRIMARY KEY (`id_gerbong`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_kereta`);

--
-- Indexes for table `kelas_pesawat`
--
ALTER TABLE `kelas_pesawat`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `kereta`
--
ALTER TABLE `kereta`
  ADD PRIMARY KEY (`id_kereta`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pesan_kereta`
--
ALTER TABLE `pesan_kereta`
  ADD PRIMARY KEY (`id_pesanKA`);

--
-- Indexes for table `pesan_pesawat`
--
ALTER TABLE `pesan_pesawat`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `pesawat`
--
ALTER TABLE `pesawat`
  ADD PRIMARY KEY (`id_pesawat`);

--
-- Indexes for table `tiket_kereta`
--
ALTER TABLE `tiket_kereta`
  ADD PRIMARY KEY (`id_tiketKA`);

--
-- Indexes for table `tiket_pesawat`
--
ALTER TABLE `tiket_pesawat`
  ADD PRIMARY KEY (`id_tiket`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gerbong`
--
ALTER TABLE `gerbong`
  MODIFY `id_gerbong` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_kereta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kelas_pesawat`
--
ALTER TABLE `kelas_pesawat`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kereta`
--
ALTER TABLE `kereta`
  MODIFY `id_kereta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesan_kereta`
--
ALTER TABLE `pesan_kereta`
  MODIFY `id_pesanKA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesan_pesawat`
--
ALTER TABLE `pesan_pesawat`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesawat`
--
ALTER TABLE `pesawat`
  MODIFY `id_pesawat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tiket_kereta`
--
ALTER TABLE `tiket_kereta`
  MODIFY `id_tiketKA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tiket_pesawat`
--
ALTER TABLE `tiket_pesawat`
  MODIFY `id_tiket` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
