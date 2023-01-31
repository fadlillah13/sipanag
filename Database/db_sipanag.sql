-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 27, 2023 at 09:31 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sipanag`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_informasi`
--

DROP TABLE IF EXISTS `tbl_informasi`;
CREATE TABLE IF NOT EXISTS `tbl_informasi` (
  `id_informasi` int(11) NOT NULL AUTO_INCREMENT,
  `judul_informasi` varchar(50) NOT NULL,
  `ket_informasi` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `gambar` varchar(128) NOT NULL,
  PRIMARY KEY (`id_informasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penduduk`
--

DROP TABLE IF EXISTS `tbl_penduduk`;
CREATE TABLE IF NOT EXISTS `tbl_penduduk` (
  `nik` varchar(50) NOT NULL,
  `nm_lengkap` varchar(50) NOT NULL,
  `tmpt_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `agama` varchar(10) NOT NULL,
  `jk` varchar(10) NOT NULL,
  `stts_kawin` varchar(11) NOT NULL,
  `pekerjaan` varchar(15) NOT NULL,
  `stts_penduduk` varchar(50) NOT NULL,
  PRIMARY KEY (`nik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_penduduk`
--

INSERT INTO `tbl_penduduk` (`nik`, `nm_lengkap`, `tmpt_lahir`, `tgl_lahir`, `alamat`, `agama`, `jk`, `stts_kawin`, `pekerjaan`, `stts_penduduk`) VALUES
('1304022807970002', 'Rezky Yuliarmenri Putra', 'Cikarang', '1997-07-28', 'Batang Gadis', 'Islam', 'Laki-Laki', 'Belum Kawin', 'Wiraswasta', 'Pendatang'),
('1304035208980001', 'Gustiani', 'Padang Pulai', '1998-08-12', 'Jorong Padang Pulai Nagari Balimbing', 'Islam', 'Perempuan', 'Belum Kawin', 'Mahasiswa', 'Pindahan'),
('1304101912940002', 'Fadlillah', 'Sumanik', '1994-12-19', 'Komplek MTsN 2 Tanah Datar (Sumanik) / Samping Musholla, Jalan Sawah Rongeh Sumanik', 'Islam', 'Laki-Laki', 'Belum Kawin', 'Wiraswasta', 'Pendatang'),
('1304144508000001', 'Miftahul Khaira', 'Padang Panjang', '2000-05-08', 'Jorong Baing, Nagari Guguak Malalo Kec. Batipuh Selatan. Kab. Tanah Datar', 'Islam', 'Perempuan', 'Belum Kawin', 'Mahasiswa', 'Penduduk tetap'),
('1604095407010001', ' Dahlia Larasati', 'Batusangkar', '2001-12-07', 'Ds.Tanjung Baru', 'Islam', 'Perempuan', 'Belum Kawin', 'Mahasiswa', 'Pendatang');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengaduan`
--

DROP TABLE IF EXISTS `tbl_pengaduan`;
CREATE TABLE IF NOT EXISTS `tbl_pengaduan` (
  `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT,
  `tgl_pengaduan` date NOT NULL,
  `nik` varchar(20) NOT NULL,
  `isi_laporan` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` enum('Proses','Ditanggapi','Selesai','') NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_pengaduan`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `tbl_pengaduan`
--
DROP TRIGGER IF EXISTS `insert_aduan`;
DELIMITER $$
CREATE TRIGGER `insert_aduan` AFTER INSERT ON `tbl_pengaduan` FOR EACH ROW INSERT INTO `tbl_tindakan` (`id_tanggapan`, `id_pengaduan`, `tgl_tanggapan`, `tanggapan`) VALUES (NULL, NEW.id_pengaduan, CURRENT_DATE(), '-')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengajuan_surat`
--

DROP TABLE IF EXISTS `tbl_pengajuan_surat`;
CREATE TABLE IF NOT EXISTS `tbl_pengajuan_surat` (
  `no_surat` int(11) NOT NULL AUTO_INCREMENT,
  `kode_surat` varchar(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nm_surat` varchar(30) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`no_surat`),
  KEY `nik` (`nik`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `tbl_pengajuan_surat`
--
DROP TRIGGER IF EXISTS `after_input_surat`;
DELIMITER $$
CREATE TRIGGER `after_input_surat` AFTER INSERT ON `tbl_pengajuan_surat` FOR EACH ROW INSERT INTO `tbl_validasi` (`id_validasi`, `status_surat`, `tanggal`, `no_surat`) VALUES (NULL, 'Proses', CURRENT_DATE(), NEW.no_surat)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_surat`
--

DROP TABLE IF EXISTS `tbl_surat`;
CREATE TABLE IF NOT EXISTS `tbl_surat` (
  `kode_surat` varchar(11) NOT NULL,
  `nm_surat` varchar(25) NOT NULL,
  PRIMARY KEY (`kode_surat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_surat`
--

INSERT INTO `tbl_surat` (`kode_surat`, `nm_surat`) VALUES
('145.1', 'Surat Keterangan'),
('470', 'Surat Domisili'),
('474', 'Surat Pindah'),
('474.3', 'Surat Kematian'),
('503', 'Surat Izin Usaha');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_surat_izin`
--

DROP TABLE IF EXISTS `tbl_surat_izin`;
CREATE TABLE IF NOT EXISTS `tbl_surat_izin` (
  `no_surat` int(11) NOT NULL AUTO_INCREMENT,
  `kode_surat` varchar(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nm_surat` varchar(20) NOT NULL,
  `nm_usaha` varchar(50) NOT NULL,
  `jenis_usaha` varchar(50) NOT NULL,
  `alamat_usaha` varchar(128) NOT NULL,
  `keterangan` varchar(128) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`no_surat`),
  KEY `relasi_penduduk` (`nik`),
  KEY `relasi_kode_surat` (`kode_surat`),
  KEY `relasi_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `tbl_surat_izin`
--
DROP TRIGGER IF EXISTS `hapus_surat_izin`;
DELIMITER $$
CREATE TRIGGER `hapus_surat_izin` AFTER DELETE ON `tbl_surat_izin` FOR EACH ROW DELETE FROM tbl_validasi WHERE tbl_validasi.no_surat = OLD.no_surat
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_surat_izin`;
DELIMITER $$
CREATE TRIGGER `insert_surat_izin` AFTER INSERT ON `tbl_surat_izin` FOR EACH ROW INSERT INTO `tbl_validasi` (`id_validasi`, `status_surat`, `tanggal`,`ket`, `no_surat`) VALUES (NULL, 'Proses', CURRENT_DATE(), 'Mohon Tunggu', NEW.no_surat)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_surat_ket`
--

DROP TABLE IF EXISTS `tbl_surat_ket`;
CREATE TABLE IF NOT EXISTS `tbl_surat_ket` (
  `no_surat` int(11) NOT NULL AUTO_INCREMENT,
  `kode_surat` varchar(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nm_surat` varchar(20) NOT NULL,
  `keterangan` varchar(128) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`no_surat`),
  KEY `id_user` (`id_user`),
  KEY `relasi_nik` (`nik`),
  KEY `relasi_surat` (`kode_surat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `tbl_surat_ket`
--
DROP TRIGGER IF EXISTS `hapus_surat_ket`;
DELIMITER $$
CREATE TRIGGER `hapus_surat_ket` AFTER DELETE ON `tbl_surat_ket` FOR EACH ROW DELETE FROM tbl_validasi WHERE tbl_validasi.no_surat = OLD.no_surat
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_surat_ket`;
DELIMITER $$
CREATE TRIGGER `insert_surat_ket` AFTER INSERT ON `tbl_surat_ket` FOR EACH ROW INSERT INTO `tbl_validasi` (`id_validasi`, `status_surat`, `tanggal`,`ket`, `no_surat`) VALUES (NULL, 'Proses', CURRENT_DATE(), 'Mohon Tunggu', NEW.no_surat)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_surat_mati`
--

DROP TABLE IF EXISTS `tbl_surat_mati`;
CREATE TABLE IF NOT EXISTS `tbl_surat_mati` (
  `no_surat` int(11) NOT NULL AUTO_INCREMENT,
  `kode_surat` varchar(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nm_surat` varchar(20) NOT NULL,
  `hari_m` varchar(11) NOT NULL,
  `tgl_m` date NOT NULL,
  `sebab` varchar(25) NOT NULL,
  `alamat_m` varchar(100) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`no_surat`),
  KEY `nik` (`nik`),
  KEY `id_user` (`id_user`),
  KEY `kode_surat` (`kode_surat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `tbl_surat_mati`
--
DROP TRIGGER IF EXISTS `hapus_surat_mati`;
DELIMITER $$
CREATE TRIGGER `hapus_surat_mati` AFTER DELETE ON `tbl_surat_mati` FOR EACH ROW DELETE FROM tbl_validasi WHERE tbl_validasi.no_surat = OLD.no_surat
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_surat_mati`;
DELIMITER $$
CREATE TRIGGER `insert_surat_mati` AFTER INSERT ON `tbl_surat_mati` FOR EACH ROW INSERT INTO `tbl_validasi` (`id_validasi`, `status_surat`, `tanggal`,`ket`, `no_surat`) VALUES (NULL, 'Proses', CURRENT_DATE(), 'Mohon Tunggu', NEW.no_surat)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_surat_pindah`
--

DROP TABLE IF EXISTS `tbl_surat_pindah`;
CREATE TABLE IF NOT EXISTS `tbl_surat_pindah` (
  `no_surat` int(11) NOT NULL AUTO_INCREMENT,
  `kode_surat` varchar(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nm_surat` varchar(20) NOT NULL,
  `alamat_baru` varchar(128) NOT NULL,
  `jml_kel` varchar(2) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`no_surat`),
  KEY `kode_surat` (`kode_surat`),
  KEY `id_user` (`id_user`),
  KEY `nik` (`nik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `tbl_surat_pindah`
--
DROP TRIGGER IF EXISTS `hapus_surat_pindah`;
DELIMITER $$
CREATE TRIGGER `hapus_surat_pindah` AFTER DELETE ON `tbl_surat_pindah` FOR EACH ROW DELETE FROM tbl_validasi WHERE tbl_validasi.no_surat = OLD.no_surat
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_surat_pindah`;
DELIMITER $$
CREATE TRIGGER `insert_surat_pindah` AFTER INSERT ON `tbl_surat_pindah` FOR EACH ROW INSERT INTO `tbl_validasi` (`id_validasi`, `status_surat`, `tanggal`,`ket`, `no_surat`) VALUES (NULL, 'Proses', CURRENT_DATE(), 'Mohon Tunggu', NEW.no_surat)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tindakan`
--

DROP TABLE IF EXISTS `tbl_tindakan`;
CREATE TABLE IF NOT EXISTS `tbl_tindakan` (
  `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengaduan` int(11) NOT NULL,
  `tgl_tanggapan` date NOT NULL,
  `tanggapan` varchar(200) NOT NULL,
  PRIMARY KEY (`id_tanggapan`),
  KEY `tbl_tindakan_ibfk_1` (`id_pengaduan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `nama`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(1, 'Administrator', 'admin@sipanag.go.id', 'user.png', '$2y$10$4fU8gRzee0tpOMc22KUJWe2o6tXfvakpVruSMmEWwEAmzz6Ouec6K', 1, 1, 1674667386),
(2, 'Gustiani', 'gustiani@sipanag.go.id', 'user.png', '$2y$10$T0k2Xao0n64WRxp0euf3HuTEpDJ2ogPbMS.cOyWJIXM9OSVC5IoHS', 2, 1, 1674667681);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_validasi`
--

DROP TABLE IF EXISTS `tbl_validasi`;
CREATE TABLE IF NOT EXISTS `tbl_validasi` (
  `id_validasi` int(11) NOT NULL AUTO_INCREMENT,
  `status_surat` enum('Proses','Selesai','Ditolak','') NOT NULL,
  `tanggal` date NOT NULL,
  `ket` varchar(50) NOT NULL,
  `no_surat` int(11) NOT NULL,
  PRIMARY KEY (`id_validasi`),
  KEY `relasi_surat_mati` (`no_surat`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_validasi`
--

INSERT INTO `tbl_validasi` (`id_validasi`, `status_surat`, `tanggal`, `ket`, `no_surat`) VALUES
(1, 'Selesai', '2023-01-27', 'Permohonan surat disetujui', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

DROP TABLE IF EXISTS `user_access_menu`;
CREATE TABLE IF NOT EXISTS `user_access_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

DROP TABLE IF EXISTS `user_menu`;
CREATE TABLE IF NOT EXISTS `user_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Administrator'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Member');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

DROP TABLE IF EXISTS `user_sub_menu`;
CREATE TABLE IF NOT EXISTS `user_sub_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `judul`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'Home', 'user', 'fas fa-fw fa-home', 1),
(4, 1, 'Data Penduduk', 'penduduk', 'fas fa-fw fa-users', 1),
(5, 2, 'Profil', 'user/profil', 'fas fa-fw fa-user', 1),
(6, 2, 'Edit Profil', 'user/edit_user', 'fas fa-fw fa-user-edit', 1),
(7, 2, 'Pengajuan Surat', 'pengajuan_user', 'fas fa-fw fa-book', 1),
(9, 1, 'Kelola Informasi', 'informasi', 'fas fa-fw fa-info-circle', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_pengaduan`
--
ALTER TABLE `tbl_pengaduan`
  ADD CONSTRAINT `tbl_pengaduan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`);

--
-- Constraints for table `tbl_pengajuan_surat`
--
ALTER TABLE `tbl_pengajuan_surat`
  ADD CONSTRAINT `tbl_pengajuan_surat_ibfk_2` FOREIGN KEY (`nik`) REFERENCES `tbl_penduduk` (`nik`),
  ADD CONSTRAINT `tbl_pengajuan_surat_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`);

--
-- Constraints for table `tbl_surat_izin`
--
ALTER TABLE `tbl_surat_izin`
  ADD CONSTRAINT `relasi_kode_surat` FOREIGN KEY (`kode_surat`) REFERENCES `tbl_surat` (`kode_surat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relasi_penduduk` FOREIGN KEY (`nik`) REFERENCES `tbl_penduduk` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relasi_user` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_surat_ket`
--
ALTER TABLE `tbl_surat_ket`
  ADD CONSTRAINT `relasi_nik` FOREIGN KEY (`nik`) REFERENCES `tbl_penduduk` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relasi_surat` FOREIGN KEY (`kode_surat`) REFERENCES `tbl_surat` (`kode_surat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_surat_mati`
--
ALTER TABLE `tbl_surat_mati`
  ADD CONSTRAINT `tbl_surat_mati_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `tbl_penduduk` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_surat_mati_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_surat_mati_ibfk_3` FOREIGN KEY (`kode_surat`) REFERENCES `tbl_surat` (`kode_surat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_surat_pindah`
--
ALTER TABLE `tbl_surat_pindah`
  ADD CONSTRAINT `tbl_surat_pindah_ibfk_1` FOREIGN KEY (`kode_surat`) REFERENCES `tbl_surat` (`kode_surat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_surat_pindah_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_surat_pindah_ibfk_3` FOREIGN KEY (`nik`) REFERENCES `tbl_penduduk` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_tindakan`
--
ALTER TABLE `tbl_tindakan`
  ADD CONSTRAINT `tbl_tindakan_ibfk_1` FOREIGN KEY (`id_pengaduan`) REFERENCES `tbl_pengaduan` (`id_pengaduan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`);

--
-- Constraints for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD CONSTRAINT `user_access_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `user_menu` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
