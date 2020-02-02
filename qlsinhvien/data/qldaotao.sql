-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2013 at 03:34 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `qldaotao`
--
DROP DATABASE IF EXISTS `qldaotao`;
CREATE DATABASE `qldaotao` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `qldaotao`;

-- --------------------------------------------------------

--
-- Table structure for table `dbo_khoa`
--

CREATE TABLE IF NOT EXISTS `dbo_khoa` (
  `MaKhoa` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TenKhoa` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NgayTL` date DEFAULT NULL,
  PRIMARY KEY (`MaKhoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dbo_khoa`
--

INSERT INTO `dbo_khoa` (`MaKhoa`, `TenKhoa`, `NgayTL`) VALUES
('KHOA01', 'Khoa học tự nhiên', '1979-01-01'),
('KHOA02', 'Kĩ thuật công nghệ', '1960-01-01'),
('KHOA03', 'Khoa học Xã hội và Nhân văn', '1996-01-01'),
('KHOA05', 'Kinh tế', '1994-12-03'),
('KHOA06', 'Tiểu học - Mầm non', '1996-01-01'),
('KHOA09', 'Nhạc - Họa - Thể dục', '1976-01-01'),
('KHOA10', 'Ngoại ngữ', '2008-11-21');

-- --------------------------------------------------------

--
-- Table structure for table `dbo_nganh`
--

CREATE TABLE IF NOT EXISTS `dbo_nganh` (
  `MaNganh` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `MaKhoa` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TenNganh` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SoNamDT` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`MaNganh`),
  KEY `MaKhoa` (`MaKhoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dbo_nganh`
--

INSERT INTO `dbo_nganh` (`MaNganh`, `MaKhoa`, `TenNganh`, `SoNamDT`) VALUES
('NG01', 'KHOA01', 'Toán - Tin', 4),
('NG02', 'KHOA01', 'Lý - Kĩ thuật công nghiệp', 4),
('NG03', 'KHOA02', 'Tin - Lý', 4),
('NG13', 'KHOA02', 'Phương pháp dạy học các nội dung môn Tin', 2),
('NG04', 'KHOA03', 'Văn - Công tác đội', 4),
('NG05', 'KHOA03', 'Sư phạm Sử', 4),
('NG06', 'KHOA03', 'Sư phạm Địa', 4),
('NG07', 'KHOA05', 'Quản trị văn phòng', 4),
('NG08', 'KHOA05', 'Kế toán', 4),
('NG09', 'KHOA06', 'Sư phạm Tiểu học', 4),
('NG10', 'KHOA06', 'Sư phạm mầm non', 4),
('NG11', 'KHOA09', 'Thể - Sinh', 4),
('NG12', 'KHOA10', 'Sư phạm Anh', 4);

-- --------------------------------------------------------

--
-- Table structure for table `dbo_chuyennganh`
--

CREATE TABLE IF NOT EXISTS `dbo_chuyennganh` (
  `MaCN` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TenChuyenNganh` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaNganh` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaCN`),
  KEY `MaNganh` (`MaNganh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dbo_chuyennganh`
--

INSERT INTO `dbo_chuyennganh` (`MaCN`, `TenChuyenNganh`, `MaNganh`) VALUES
('CN01', 'Toán - Tin', 'NG01'),
('CN02', 'Tin - Lý', 'NG01'),
('CN03', 'Lý - Kĩ thuật công nghiệp', 'NG02'),
('CN04', 'Văn - Công tác đội', 'NG04'),
('CN05', 'Sư phạm Sử', 'NG04'),
('CN06', 'Sư phạm Địa', 'NG04');

-- --------------------------------------------------------

--
-- Table structure for table `dbo_bcnkhoa`
--

CREATE TABLE IF NOT EXISTS `dbo_bcnkhoa` (
  `MaGV` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `MaCV` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `MaKhoa` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `NhiemKy` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`MaGV`,`MaCV`,`MaKhoa`,`NhiemKy`),
  KEY `MaCV` (`MaCV`),
  KEY `MaKhoa` (`MaKhoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dbo_bcnkhoa`
--

INSERT INTO `dbo_bcnkhoa` (`MaGV`, `MaCV`, `MaKhoa`, `NhiemKy`) VALUES
('900001', '001', 'KHOA01', '2008-2013'),
('900002', '001', 'KHOA01', '2013-2018'),
('900010', '002', 'KHOA01', '2008-2013'),
('900011', '002', 'KHOA03', '2008-2013'),
('900009', '002', 'KHOA03', '2013-2018'),
('900005', '002', 'KHOA03', '2013-2018');

-- --------------------------------------------------------

--
-- Table structure for table `dbo_chucvu`
--

CREATE TABLE IF NOT EXISTS `dbo_chucvu` (
  `MaCV` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TenCV` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaCV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dbo_chucvu`
--

INSERT INTO `dbo_chucvu` (`MaCV`, `TenCV`) VALUES
('001', 'Trưởng Khoa'),
('002', 'Phó Trưởng Khoa'),
('003', 'Trưởng Bộ Môn'),
('004', 'Phó Trưởng Bộ Môn');

-- --------------------------------------------------------

--
-- Table structure for table `dbo_cvht`
--

CREATE TABLE IF NOT EXISTS `dbo_cvht` (
  `MaLOP` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `MaGV` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `NhiemKy` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`MaLOP`,`MaGV`,`NhiemKy`),
  KEY `MaGV` (`MaGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dbo_giangvien`
--

CREATE TABLE IF NOT EXISTS `dbo_giangvien` (
  `MaGV` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `MaKhoa` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaHH` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaHV` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HoLot` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Ten` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `GioiTinh` tinyint(1) NOT NULL,
  `Email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `QueQuan` longtext COLLATE utf8_unicode_ci,
  `MatKhau` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaGV`),
  KEY `MaKhoa` (`MaKhoa`),
  KEY `MaHH` (`MaHH`),
  KEY `MaHV` (`MaHV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dbo_giangvien`
--

INSERT INTO `dbo_giangvien` (`MaGV`, `MaKhoa`, `MaHH`, `MaHV`, `HoLot`, `Ten`, `NgaySinh`, `GioiTinh`, `Email`, `QueQuan`, `MatKhau`) VALUES
('900001', 'KHOA01', NULL, '03', 'Nguyễn Xuân', 'Tranh', '1962-01-01', 1, 'nxtranh@gmail.com', 'Hà Nội', 'abc123'),
('900002', 'KHOA01', NULL, '03', 'Nguyễn Quang', 'Hòa', '1960-01-01', 1, 'nqhoa@gmail.com  ', 'Bắc Giang', 'abc123'),
('900003', 'KHOA01', NULL, '03', 'Hồ Hữu', 'Lộc', '1964-01-01', 1, 'hhloc@gmail.com', 'Hà Nội', 'abc123'),
('900004', 'KHOA01', NULL, '04', 'Trần Ngọc', 'Liên', '1963-01-01', 0, 'tnlien@gmail.com', 'Lạng Sơn', 'abc123'),
('900005', 'KHOA01', NULL, '03', 'Lê Phương', 'Quân', '1967-01-01', 1, 'lpquan@gmail.com', 'Bắc Giang', 'abc123'),
('900006', 'KHOA01', NULL, '04', 'Nguyễn Hữu', 'Khánh', '1960-01-01', 1, 'nhkhanh@gmail.com ', 'Thái Nguyên', 'abc123'),
('900007', 'KHOA03', NULL, '04', 'Võ Văn', 'Tài', '1972-01-01', 1, 'vvtai@gmail.com ', 'Bắc Giang', 'abc123'),
('900008', 'KHOA03', NULL, '03', 'Dương Thị', 'Tuyền', '1969-01-01', 0, 'dttuyen@gmail.com  ', 'Bắc Ninh', 'abc123'),
('900009', 'KHOA03', NULL, '03', 'Lê Thị Kiều', 'Oanh', '1968-01-01', 0, 'ltkoanh@gmail.com  ', 'Bắc Ninh', 'abc123'),
('900010', 'KHOA09', NULL, '04', 'Dương Hiếu', 'Đẩu', '1965-01-01', 1, 'dhdau@gmail.com', 'Bắc Giang', 'abc123'),
('900011', 'KHOA09', NULL, '04', 'Lê Thanh', 'Phước', '1968-01-01', 1, 'ltphuoc@gmail.com', 'Hải Dương', 'abc123'),
('900012', 'KHOA09', 'PGS', '04', 'Bùi Thị Bửu', 'Huê', '1968-01-01', 0, 'btbhue@gmail.com', 'Bắc Ninh', 'abc123');

-- --------------------------------------------------------

--
-- Table structure for table `dbo_hocham`
--

CREATE TABLE IF NOT EXISTS `dbo_hocham` (
  `MaHH` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TenHH` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaHH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dbo_hocham`
--

INSERT INTO `dbo_hocham` (`MaHH`, `TenHH`) VALUES
('GS', 'Giáo Sư'),
('PGS', 'Phó Giáo Sư');

-- --------------------------------------------------------

--
-- Table structure for table `dbo_hocvi`
--

CREATE TABLE IF NOT EXISTS `dbo_hocvi` (
  `MaHV` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TENHV` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaHV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dbo_hocvi`
--

INSERT INTO `dbo_hocvi` (`MaHV`, `TENHV`) VALUES
('01', 'Cử Nhân'),
('02', 'Kỹ Sư'),
('03', 'Thạc Sĩ'),
('04', 'Tiến Sĩ'),
('05', 'Cao Đẳng'),
('06', 'Trung Cấp');

-- --------------------------------------------------------

--
-- Table structure for table `dbo_kehoachhttk`
--

CREATE TABLE IF NOT EXISTS `dbo_kehoachhttk` (
  `MaSV` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `NienKhoa` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `HocKy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaMH` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `HocLai` bit(1) NOT NULL,
  PRIMARY KEY (`MaSV`,`NienKhoa`,`HocKy`,`MaMH`),
  KEY `NienKhoa` (`NienKhoa`),
  KEY `MaMH` (`MaMH`),
  KEY `HocKy` (`HocKy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dbo_khoahoc`
--

CREATE TABLE IF NOT EXISTS `dbo_khoahoc` (
  `Khoa` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Khoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dbo_khoahoc`
--

INSERT INTO `dbo_khoahoc` (`Khoa`) VALUES
(31),
(32),
(33);

-- --------------------------------------------------------

--
-- Table structure for table `dbo_khungctdt`
--

CREATE TABLE IF NOT EXISTS `dbo_khungctdt` (
  `MaMH` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Khoa` smallint(5) NOT NULL DEFAULT '0',
  `MaCN` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TuChon` bit(1) NOT NULL,
  `NhomTC` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaMH`,`Khoa`,`MaCN`),
  KEY `Khoa` (`Khoa`),
  KEY `MaCN` (`MaCN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dbo_khungctdt`
--

INSERT INTO `dbo_khungctdt` (`MaMH`, `Khoa`, `MaCN`, `TuChon`, `NhomTC`) VALUES
('MH001', 32, 'CN01', '1', NULL),
('MH002', 32, 'CN01', '0', NULL),
('MH003', 32, 'CN01', '0', NULL),
('MH004', 32, 'CN01', '0', NULL),
('MH005', 32, 'CN01', '0', NULL),
('MH006', 32, 'CN01', '0', NULL),
('MH007', 32, 'CN01', '0', NULL),
('MH008', 32, 'CN01', '0', NULL),
('MH009', 32, 'CN01', '0', NULL),
('MH010', 32, 'CN01', '0', NULL),
('MH011', 32, 'CN01', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `dbo_lopchuyennganh`
--

CREATE TABLE IF NOT EXISTS `dbo_lopchuyennganh` (
  `MaLop` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Khoa` smallint(5) DEFAULT NULL,
  `MaCN` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TenLop` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaLop`),
  KEY `Khoa` (`Khoa`),
  KEY `MaCN` (`MaCN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dbo_lopchuyennganh`
--

INSERT INTO `dbo_lopchuyennganh` (`MaLop`, `Khoa`, `MaCN`, `TenLop`) VALUES
('CN321', 32, 'CN01', 'Toán - Tin 1 - 32'),
('CN322', 32, 'CN01', 'Toán - Tin 2 - 32'),
('CN323', 32, 'CN01', 'Tin Lý 1 - 32'),
('CN324', 32, 'CN01', 'Tin Lý 2 - 32'),
('CN331', 33, 'CN01', 'Toán - Tin 1 - 33'),
('CN332', 33, 'CN01', 'Toán - Tin 2 - 33'),
('CN333', 33, 'CN01', 'Tin Lý 1 - 33'),
('CN334', 33, 'CN01', 'Tin Lý 2 - 33');

-- --------------------------------------------------------

--
-- Table structure for table `dbo_lophp`
--

CREATE TABLE IF NOT EXISTS `dbo_lophp` (
  `MaNhom` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `MaGV` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaMH` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NienKhoa` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HocKy` tinyint(3) unsigned DEFAULT NULL,
  `SiSoToiDa` tinyint(3) unsigned DEFAULT NULL,
  `Thu` smallint(5) DEFAULT NULL,
  `TietBD` smallint(5) DEFAULT NULL,
  `SoTiet` smallint(5) DEFAULT NULL,
  `Phong` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TuanGD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BiXoa` bit(1) NOT NULL,
  PRIMARY KEY (`MaNhom`),
  KEY `MaGV` (`MaGV`),
  KEY `MaMH` (`MaMH`),
  KEY `NienKhoa` (`NienKhoa`),
  KEY `HocKy` (`HocKy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dbo_monhoc`
--

CREATE TABLE IF NOT EXISTS `dbo_monhoc` (
  `MaMH` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `MaKhoa` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaNhomHP` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TenMH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SoTC` smallint(5) DEFAULT NULL,
  `SoTietLT` smallint(5) DEFAULT NULL,
  `SoTietTH` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`MaMH`),
  KEY `MaKhoa` (`MaKhoa`),
  KEY `MaNhomHP` (`MaNhomHP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dbo_monhoc`
--

INSERT INTO `dbo_monhoc` (`MaMH`, `MaKhoa`, `MaNhomHP`, `TenMH`, `SoTC`, `SoTietLT`, `SoTietTH`) VALUES
('MH001', 'KHOA01', 'NHP001', 'Hình học giải tích', 2, 30, 0),
('MH002', 'KHOA01', 'NHP001', 'Mạng máy tính', 2, 30, 0),
('MH003', 'KHOA01', 'NHP001', 'Đại số sơ cấp', 2, 30, 0),
('MH004', 'KHOA01', 'NHP001', 'Gia công cơ khí', 2, 30, 0),
('MH005', 'KHOA01', 'NHP001', 'Vật lí điện tử', 2, 15, 30),
('MH006', 'KHOA01', 'NHP001', 'Phương tiện dạy học kĩ thuật', 2, 30, 0),
('MH007', 'KHOA01', 'NHP001', 'Phân tích và thiết kế hệ thống thông tin', 2, 20, 20),
('MH008', 'KHOA01', 'NHP001', 'Phương pháp dạy học các nội dung môn Tin', 2, 30, 0),
('MH009', 'KHOA01', 'NHP001', 'Thống kê', 2, 30, 0), 
('MH010', 'KHOA01', 'NHP001', 'Nhập môn Công nghệ phần mềm', 2, 20, 20),
('MH011', 'KHOA01', 'NHP001', 'Lập trình hướng đối tượng C++', 3, 30, 30),
('MH012', 'KHOA01', 'NHP001', 'Lập trình ứng dụng mạng', 2, 30, 0),
('MH013', 'KHOA02', 'NHP002', 'Tiếng việt', 2, 20, 20),
('MH014', 'KHOA02', 'NHP002', 'Anh văn chuyên môn - Tin học', 2, 30, 0),
('MH015', 'KHOA02', 'NHP002', 'Văn học', 3, 45, 0),
('MH016', 'KHOA02', 'NHP002', 'Tâm lí học', 2, 15, 30),
('MH017', 'KHOA02', 'NHP002', 'Tiếng Anh', 2, 30, 0),
('MH018', 'KHOA02', 'NHP002', 'Giáo dục thể chất', 2, 30, 0),
('MH019', 'KHOA02', 'NHP002', 'Giáo dục học', 2, 30, 0),
('MH020', 'KHOA02', 'NHP002', 'Kinh tế học đại cương', 2, 30, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dbo_montienquyet`
--

CREATE TABLE IF NOT EXISTS `dbo_montienquyet` (
  `MaMH` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `MaMHTQ` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`MaMH`,`MaMHTQ`),
  KEY `MaMHTQ` (`MaMHTQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dbo_nhomhocphi`
--

CREATE TABLE IF NOT EXISTS `dbo_nhomhocphi` (
  `MaNhomHP` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TenNhomHP` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MucHocPhi` double DEFAULT NULL,
  PRIMARY KEY (`MaNhomHP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dbo_nhomhocphi`
--

INSERT INTO `dbo_nhomhocphi` (`MaNhomHP`, `TenNhomHP`, `MucHocPhi`) VALUES
('NHP001', 'Nhóm HP KHTN', 140000),
('NHP002', 'Nhóm HP Chuyên Ngành KHTN', 160000);

-- --------------------------------------------------------

--
-- Table structure for table `dbo_nienkhoa`
--

CREATE TABLE IF NOT EXISTS `dbo_nienkhoa` (
  `NienKhoa` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `HocKy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`NienKhoa`,`HocKy`),
  KEY `HocKy` (`HocKy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dbo_nienkhoa`
--

INSERT INTO `dbo_nienkhoa` (`NienKhoa`, `HocKy`) VALUES
('2010-2011', 1),
('2011-2012', 1),
('2010-2011', 2),
('2011-2012', 2),
('2010-2011', 3),
('2011-2012', 3);

-- --------------------------------------------------------

--
-- Table structure for table `dbo_sinhvien`
--

CREATE TABLE IF NOT EXISTS `dbo_sinhvien` (
  `MaSV` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `MaLop` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Holot` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Ten` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `GioiTinh` tinyint(1) NOT NULL,
  `QueQuan` longtext COLLATE utf8_unicode_ci,
  `MatKhau` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaSV`),
  KEY `MaLop` (`MaLop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dbo_sinhvien`
--

INSERT INTO `dbo_sinhvien` (`MaSV`, `MaLop`, `Holot`, `Ten`, `NgaySinh`, `GioiTinh`, `QueQuan`, `MatKhau`, `Email`) VALUES
('100001', 'CN321', 'Đỗ Duy', 'An', '1992-02-15', 1, 'Bắc Giang', 'abc123', 'an100001@gmail.com'),
('100002', 'CN321', 'Trần Tấn', 'An', '1991-01-01', 1, 'Bắc Giang', 'abc123', 'an100002@gmail.com'),
('100003', 'CN321', 'Nguyễn Quốc', 'Bảo', '1992-05-27', 1, 'Bắc Giang', 'abc123', 'bao100003@gmail.com'),
('100004', 'CN321', 'Tạ Tấn', 'Bửu', '1992-01-19', 1, 'Bắc Giang', 'abc123', 'buu100004@gmail.com'),
('100005', 'CN321', 'Mai Hữu', 'Danh', '1992-08-18', 1, 'Bắc Giang', 'abc123', 'danh100005@gmail.com'),
('100006', 'CN321', 'Nguyễn Như', 'Diệu', '1992-01-09', 0, 'Bắc Giang', 'abc123', 'dieu100006@gmail.com'),
('100007', 'CN321', 'Lê Tấn', 'Đạt', '1991-04-07', 1, 'Bắc Giang', 'abc123', 'dat100007@gmail.com'),
('100008', 'CN321', 'Trần Tấn', 'Đạt', '1992-12-10', 1, 'Bắc Giang', 'abc123', 'dat100008@gmail.com'),
('100009', 'CN321', 'Nguyễn Văn', 'Điền', '1992-08-10', 1, 'Bắc Giang', 'abc123', 'dien100009@gmail.com'),
('100010', 'CN321', 'Nguyễn Ngọc Ngân', 'Giang', '1992-10-09', 1, 'Bắc Giang', 'abc123', 'giang100010@gmail.com'),
('100011', 'CN321', 'Lê Văn', 'Hai', '1991-02-27', 1, 'Bắc Giang', 'abc123', 'hai100011@gmail.com'),
('100012', 'CN321', 'Dương Huy', 'Hoàng', '1992-01-01', 1, 'Bắc Giang', 'abc123', 'hoang100012@gmail.com'),
('100013', 'CN321', 'Nguyễn Thanh', 'Hoàng', '1990-10-20', 1, 'Bắc Giang', 'abc123', 'hoang100013@gmail.com'),
('100014', 'CN321', 'Chu Thanh', 'Hùng', '1992-05-06', 1, 'Bắc Giang', 'abc123', 'hung100014@gmail.com'),
('100015', 'CN321', 'Nguyễn Thái', 'Hùng', '1992-08-02', 1, 'Bắc Giang', 'abc123', 'hung100015@gmail.com'),
('100016', 'CN321', 'Hứa Thành', 'Hưng', '1992-06-19', 1, 'Bắc Giang', 'abc123', 'hung100016@gmail.com'),
('100017', 'CN321', 'Nguyễn Anh', 'Khoa', '1992-04-21', 1, 'Hải Dương', 'abc123', 'khoa100017@gmail.com'),
('100018', 'CN321', 'Nguyễn Văn Vu', 'Lanh', '1991-01-01', 1, 'Hải Dương', 'abc123', 'lanh100018@gmail.com'),
('100019', 'CN321', 'Hà Phượng', 'Loan', '1992-12-27', 0, 'Hải Dương', 'abc123', 'loan100019@gmail.com'),
('100020', 'CN321', 'Nguyễn Vĩnh', 'Lợi', '1992-12-02', 1, 'Hải Dương', 'abc123', 'loi100020@gmail.com'),
('100021', 'CN322', 'Phạm Hồng', 'Châu', '1991-09-12', 0, 'Bắc Ninh', 'abc123', 'chau100021@gmail.com'),
('100022', 'CN322', 'Điêu Thị Mỹ', 'Dung', '1991-05-26', 0, 'Bắc Ninh', 'abc123', 'dung100022@gmail.com'),
('100023', 'CN322', 'Lương Thị Ngọc', 'Dung', '1992-08-06', 0, 'Bắc Ninh', 'abc123', 'dung100023@gmail.com'),
('100024', 'CN322', 'Nguyễn Thị Thùy', 'Dương', '1992-09-04', 0, 'Bắc Ninh', 'abc123', 'duong100024@gmail.com'),
('100025', 'CN322', 'Dương Hoàng', 'Đào', '1992-01-01', 0, 'Bắc Ninh', 'abc123', 'dao100025@gmail.com'),
('100026', 'CN322', 'Lê Hữu', 'Đệ', '1992-03-10', 1, 'Bắc Ninh', 'abc123', 'de100026@gmail.com'),
('100027', 'CN322', 'Dương Văn', 'Hiếu', '1992-11-11', 1, 'Bắc Ninh', 'abc123', 'hieu100027@gmail.com'),
('100028', 'CN322', 'Phan Hoàng', 'Huy', '1992-10-07', 1, 'Bắc Ninh', 'abc123', 'huy100028@gmail.com'),
('100029', 'CN322', 'Huỳnh Trúc', 'Hương', '1992-11-27', 0, 'Bắc Ninh', 'abc123', 'huong100029@gmail.com'),
('100030', 'CN322', 'Nguyễn Quốc', 'Khang', '1992-01-12', 1, 'Bắc Ninh', 'abc123', 'khang100030@gmail.com'),
('100031', 'CN322', 'Đặng Đăng', 'Khoa', '1992-11-13', 1, 'Bắc Ninh', 'abc123', 'khoa100031@gmail.com'),
('100032', 'CN322', 'Võ Thị Minh', 'Khuê', '1992-09-05', 0, 'Bắc Ninh', 'abc123', 'khue100032@gmail.com'),
('100033', 'CN322', 'Nguyễn Văn Trung', 'Lập', '1990-01-09', 1, 'Bắc Ninh', 'abc123', 'lap100033@gmail.com'),
('100034', 'CN322', 'Hồ Thị', 'Liên', '1992-08-04', 0, 'Bắc Ninh', 'abc123', 'lien100034@gmail.com'),
('100035', 'CN322', 'Nguyễn Thị Trúc', 'Linh', '1992-01-01', 0, 'Bắc Ninh', 'abc123', 'linh100035@gmail.com'),
('100036', 'CN322', 'Nguyễn Vũ', 'Linh', '1992-11-11', 1, 'Thái Nguyên', 'abc123', 'linh100036@gmail.com'),
('100037', 'CN322', 'Kiều Đa', 'Mễ', '1992-02-01', 1, 'Thái Nguyên', 'abc123', 'me100037@gmail.com'),
('100038', 'CN322', 'Nguyễn Phương', 'Ngân', '1991-03-22', 0, 'Thái Nguyên', 'abc123', 'ngan100038@gmail.com'),
('100039', 'CN322', 'Nguyễn Hữu', 'Nghĩa', '1992-12-26', 1, 'Thái Nguyên', 'abc123', 'nghia100039@gmail.com'),
('100040', 'CN322', 'Võ Văn', 'Nhã', '1991-05-19', 1, 'Thái Nguyên', 'abc123', 'nha100040@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `dbo_diemhp`
--

CREATE TABLE IF NOT EXISTS `dbo_diemhp` (
  `MaSV` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `MaMH` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Diemtp` float COLLATE utf8_unicode_ci,
  `Diemgk` float COLLATE utf8_unicode_ci,
  `Diemck` float COLLATE utf8_unicode_ci,
  `Diemtbc` float COLLATE utf8_unicode_ci,
  PRIMARY KEY (`MaSV`,`MaMH`),
  KEY `MaMH` (`MaMH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dbo_diemhp`
--

INSERT INTO `dbo_diemhp` (`MaSV`, `MaMH`, `Diemtp`, `Diemgk`, `Diemck`, `Diemtbc`) VALUES
('100001', 'MH001', 9, 9, 9, 9),
('100001', 'MH002', 9, 9, 9, 9),
('100001', 'MH003', 8, 8, 8, 8),
('100001', 'MH004', 9, 9, 9, 9),
('100001', 'MH005', 9, 9, 9, 9),
('100001', 'MH006', 8, 8, 8, 8),
('100001', 'MH007', 9, 9, 9, 9),
('100002', 'MH001', 8, 8, 8, 8),
('100002', 'MH002', 9, 9, 9, 9),
('100002', 'MH003', 8, 8, 8, 8),
('100002', 'MH004', 9, 9, 9, 9),
('100002', 'MH005', 9, 9, 9, 9),
('100002', 'MH006', 8, 8, 8, 8),
('100002', 'MH008', 8, 8, 8, 8),
('100002', 'MH009', 9, 9, 9, 9),
('100003', 'MH001', 10, 10, 10, 10),
('100003', 'MH002', 9, 9, 9, 9),
('100003', 'MH003', 9, 9, 9, 9),
('100003', 'MH004', 9, 9, 9, 9),
('100003', 'MH005', 9, 9, 9, 9),
('100003', 'MH006', 8, 8, 8, 8),
('100003', 'MH007', 9, 9, 9, 9),
('100004', 'MH001', 10, 10, 10, 10),
('100004', 'MH002', 9, 9, 9, 9),
('100004', 'MH003', 9, 9, 9, 9),
('100004', 'MH004', 9, 9, 9, 9),
('100004', 'MH005', 9, 9, 9, 9),
('100004', 'MH006', 8, 8, 8, 8),
('100005', 'MH001', 10, 10, 10, 10),
('100005', 'MH002', 9, 9, 9, 9),
('100005', 'MH003', 9, 9, 9, 9),
('100005', 'MH004', 9, 9, 9, 9),
('100005', 'MH005', 9, 9, 9, 9),
('100005', 'MH006', 8, 8, 8, 8),
('100006', 'MH001', 10, 10, 10, 10),
('100006', 'MH002', 9, 9, 9, 9),
('100006', 'MH003', 9, 9, 9, 9),
('100006', 'MH004', 9, 9, 9, 9),
('100006', 'MH005', 9, 9, 9, 9),
('100006', 'MH006', 8, 8, 8, 8),
('100007', 'MH001', 10, 10, 10, 10),
('100007', 'MH002', 9, 9, 9, 9),
('100007', 'MH003', 9, 9, 9, 9),
('100007', 'MH004', 9, 9, 9, 9),
('100007', 'MH005', 9, 9, 9, 9),
('100007', 'MH006', 8, 8, 8, 8),
('100008', 'MH001', 10, 10, 10, 10),
('100008', 'MH002', 9, 9, 9, 9),
('100008', 'MH003', 9, 9, 9, 9),
('100008', 'MH004', 9, 9, 9, 9),
('100008', 'MH005', 9, 9, 9, 9),
('100008', 'MH006', 8, 8, 8, 8),
('100009', 'MH001', 10, 10, 10, 10),
('100009', 'MH002', 9, 9, 9, 9),
('100009', 'MH003', 9, 9, 9, 9),
('100009', 'MH004', 9, 9, 9, 9),
('100009', 'MH005', 9, 9, 9, 9),
('100009', 'MH006', 8, 8, 8, 8),
('100010', 'MH001', 10, 10, 10, 10),
('100010', 'MH002', 9, 9, 9, 9),
('100010', 'MH003', 9, 9, 9, 9),
('100010', 'MH004', 9, 9, 9, 9),
('100010', 'MH005', 9, 9, 9, 9),
('100010', 'MH006', 8, 8, 8, 8),
('100011', 'MH001', 10, 10, 10, 10),
('100011', 'MH002', 9, 9, 9, 9),
('100011', 'MH003', 9, 9, 9, 9),
('100011', 'MH004', 9, 9, 9, 9),
('100011', 'MH005', 9, 9, 9, 9),
('100011', 'MH006', 8, 8, 8, 8),
('100012', 'MH001', 10, 10, 10, 10),
('100012', 'MH002', 9, 9, 9, 9),
('100012', 'MH003', 9, 9, 9, 9),
('100012', 'MH004', 9, 9, 9, 9),
('100012', 'MH005', 9, 9, 9, 9),
('100012', 'MH006', 8, 8, 8, 8),
('100013', 'MH001', 10, 10, 10, 10),
('100013', 'MH002', 9, 9, 9, 9),
('100013', 'MH003', 9, 9, 9, 9),
('100013', 'MH004', 9, 9, 9, 9),
('100013', 'MH005', 9, 9, 9, 9),
('100013', 'MH006', 8, 8, 8, 8),
('100014', 'MH001', 10, 10, 10, 10),
('100014', 'MH002', 9, 9, 9, 9),
('100015', 'MH003', 9, 9, 9, 9),
('100015', 'MH004', 9, 9, 9, 9),
('100015', 'MH005', 9, 9, 9, 9),
('100015', 'MH006', 8, 8, 8, 8),
('100016', 'MH001', 10, 10, 10, 10),
('100016', 'MH002', 9, 9, 9, 9),
('100016', 'MH003', 9, 9, 9, 9),
('100016', 'MH004', 9, 9, 9, 9),
('100016', 'MH005', 9, 9, 9, 9),
('100016', 'MH006', 8, 8, 8, 8),
('100017', 'MH001', 10, 10, 10, 10),
('100017', 'MH002', 9, 9, 9, 9),
('100017', 'MH003', 9, 9, 9, 9),
('100017', 'MH004', 9, 9, 9, 9),
('100017', 'MH005', 9, 9, 9, 9),
('100017', 'MH006', 8, 8, 8, 8),
('100018', 'MH001', 10, 10, 10, 10),
('100018', 'MH002', 9, 9, 9, 9),
('100018', 'MH003', 9, 9, 9, 9),
('100018', 'MH004', 9, 9, 9, 9),
('100018', 'MH005', 9, 9, 9, 9),
('100018', 'MH006', 8, 8, 8, 8),
('100019', 'MH001', 10, 10, 10, 10),
('100019', 'MH002', 9, 9, 9, 9),
('100019', 'MH003', 9, 9, 9, 9),
('100019', 'MH004', 9, 9, 9, 9),
('100019', 'MH005', 9, 9, 9, 9),
('100019', 'MH006', 8, 8, 8, 8),
('100020', 'MH001', 10, 10, 10, 10),
('100020', 'MH002', 9, 9, 9, 9),
('100020', 'MH003', 9, 9, 9, 9),
('100020', 'MH004', 9, 9, 9, 9),
('100020', 'MH005', 9, 9, 9, 9),
('100020', 'MH006', 8, 8, 8, 8),
('100021', 'MH001', 10, 10, 10, 10),
('100021', 'MH002', 9, 9, 9, 9),
('100021', 'MH003', 9, 9, 9, 9),
('100021', 'MH004', 9, 9, 9, 9),
('100021', 'MH005', 9, 9, 9, 9),
('100021', 'MH006', 8, 8, 8, 8),
('100022', 'MH001', 10, 10, 10, 10),
('100022', 'MH002', 9, 9, 9, 9),
('100022', 'MH003', 9, 9, 9, 9),
('100022', 'MH004', 9, 9, 9, 9),
('100022', 'MH005', 9, 9, 9, 9),
('100022', 'MH006', 8, 8, 8, 8),
('100023', 'MH001', 10, 10, 10, 10),
('100023', 'MH002', 9, 9, 9, 9),
('100023', 'MH003', 9, 9, 9, 9),
('100023', 'MH004', 9, 9, 9, 9),
('100023', 'MH005', 9, 9, 9, 9),
('100023', 'MH006', 8, 8, 8, 8),
('100024', 'MH001', 10, 10, 10, 10),
('100024', 'MH002', 9, 9, 9, 9),
('100024', 'MH003', 9, 9, 9, 9),
('100024', 'MH004', 9, 9, 9, 9),
('100024', 'MH005', 9, 9, 9, 9),
('100024', 'MH006', 8, 8, 8, 8),
('100025', 'MH001', 10, 10, 10, 10),
('100025', 'MH002', 9, 9, 9, 9),
('100025', 'MH003', 9, 9, 9, 9),
('100025', 'MH004', 9, 9, 9, 9),
('100025', 'MH005', 9, 9, 9, 9),
('100025', 'MH006', 8, 8, 8, 8),
('100026', 'MH001', 10, 10, 10, 10),
('100026', 'MH002', 9, 9, 9, 9),
('100026', 'MH003', 9, 9, 9, 9),
('100026', 'MH004', 9, 9, 9, 9),
('100026', 'MH005', 9, 9, 9, 9),
('100026', 'MH006', 8, 8, 8, 8),
('100027', 'MH001', 10, 10, 10, 10),
('100027', 'MH002', 9, 9, 9, 9),
('100027', 'MH003', 9, 9, 9, 9),
('100027', 'MH004', 9, 9, 9, 9),
('100027', 'MH005', 9, 9, 9, 9),
('100027', 'MH006', 8, 8, 8, 8),
('100028', 'MH001', 10, 10, 10, 10),
('100028', 'MH002', 9, 9, 9, 9),
('100028', 'MH003', 9, 9, 9, 9),
('100028', 'MH004', 9, 9, 9, 9),
('100028', 'MH005', 9, 9, 9, 9),
('100028', 'MH006', 8, 8, 8, 8),
('100029', 'MH001', 10, 10, 10, 10),
('100029', 'MH002', 9, 9, 9, 9),
('100029', 'MH003', 9, 9, 9, 9),
('100029', 'MH004', 9, 9, 9, 9),
('100029', 'MH005', 9, 9, 9, 9),
('100029', 'MH006', 8, 8, 8, 8),
('100030', 'MH001', 10, 10, 10, 10),
('100030', 'MH002', 9, 9, 9, 9),
('100030', 'MH003', 9, 9, 9, 9),
('100030', 'MH004', 9, 9, 9, 9),
('100030', 'MH005', 9, 9, 9, 9),
('100030', 'MH006', 8, 8, 8, 8),
('100031', 'MH001', 10, 10, 10, 10),
('100031', 'MH002', 9, 9, 9, 9),
('100031', 'MH003', 9, 9, 9, 9),
('100031', 'MH004', 9, 9, 9, 9),
('100031', 'MH005', 9, 9, 9, 9),
('100031', 'MH006', 8, 8, 8, 8),
('100032', 'MH001', 10, 10, 10, 10),
('100032', 'MH002', 9, 9, 9, 9),
('100032', 'MH003', 9, 9, 9, 9),
('100032', 'MH004', 9, 9, 9, 9),
('100032', 'MH005', 9, 9, 9, 9),
('100032', 'MH006', 8, 8, 8, 8),
('100033', 'MH001', 10, 10, 10, 10),
('100033', 'MH002', 9, 9, 9, 9),
('100033', 'MH003', 9, 9, 9, 9),
('100033', 'MH004', 9, 9, 9, 9),
('100033', 'MH005', 9, 9, 9, 9),
('100033', 'MH006', 8, 8, 8, 8),
('100034', 'MH001', 10, 10, 10, 10),
('100034', 'MH002', 9, 9, 9, 9),
('100034', 'MH003', 9, 9, 9, 9),
('100034', 'MH004', 9, 9, 9, 9),
('100034', 'MH005', 9, 9, 9, 9),
('100034', 'MH006', 8, 8, 8, 8),
('100035', 'MH001', 10, 10, 10, 10),
('100035', 'MH002', 9, 9, 9, 9),
('100035', 'MH003', 9, 9, 9, 9),
('100035', 'MH004', 9, 9, 9, 9),
('100035', 'MH005', 9, 9, 9, 9),
('100035', 'MH006', 8, 8, 8, 8),
('100036', 'MH001', 10, 10, 10, 10),
('100036', 'MH002', 9, 9, 9, 9),
('100036', 'MH003', 9, 9, 9, 9),
('100036', 'MH004', 9, 9, 9, 9),
('100036', 'MH005', 9, 9, 9, 9),
('100036', 'MH006', 8, 8, 8, 8),
('100037', 'MH001', 10, 10, 10, 10),
('100037', 'MH002', 9, 9, 9, 9),
('100037', 'MH003', 9, 9, 9, 9),
('100037', 'MH004', 9, 9, 9, 9),
('100037', 'MH005', 9, 9, 9, 9),
('100037', 'MH006', 8, 8, 8, 8),
('100038', 'MH001', 10, 10, 10, 10),
('100038', 'MH002', 9, 9, 9, 9),
('100038', 'MH003', 9, 9, 9, 9),
('100038', 'MH004', 9, 9, 9, 9),
('100038', 'MH005', 9, 9, 9, 9),
('100038', 'MH006', 8, 8, 8, 8),
('100039', 'MH001', 10, 10, 10, 10),
('100039', 'MH002', 9, 9, 9, 9),
('100039', 'MH003', 9, 9, 9, 9),
('100039', 'MH004', 9, 9, 9, 9),
('100039', 'MH005', 9, 9, 9, 9),
('100039', 'MH006', 8, 8, 8, 8),
('100040', 'MH001', 10, 10, 10, 10),
('100040', 'MH002', 9, 9, 9, 9),
('100040', 'MH003', 9, 9, 9, 9),
('100040', 'MH004', 9, 9, 9, 9),
('100040', 'MH005', 9, 9, 9, 9),
('100040', 'MH006', 8, 8, 8, 8);

-- --------------------------------------------------------

--
-- Constraints for table `dbo_bcnkhoa`
--
ALTER TABLE `dbo_bcnkhoa`
  ADD CONSTRAINT `dbo_bcnkhoa_ibfk_1` FOREIGN KEY (`MaGV`) REFERENCES `dbo_giangvien` (`MaGV`),
  ADD CONSTRAINT `dbo_bcnkhoa_ibfk_2` FOREIGN KEY (`MaCV`) REFERENCES `dbo_chucvu` (`MaCV`),
  ADD CONSTRAINT `dbo_bcnkhoa_ibfk_3` FOREIGN KEY (`MaKhoa`) REFERENCES `dbo_khoa` (`MaKhoa`);

--
-- Constraints for table `dbo_chuyennganh`
--
ALTER TABLE `dbo_chuyennganh`
  ADD CONSTRAINT `dbo_chuyennganh_ibfk_1` FOREIGN KEY (`MaNganh`) REFERENCES `dbo_nganh` (`MaNganh`);

--
-- Constraints for table `dbo_cvht`
--
ALTER TABLE `dbo_cvht`
  ADD CONSTRAINT `dbo_cvht_ibfk_1` FOREIGN KEY (`MaLOP`) REFERENCES `dbo_lopchuyennganh` (`MaLoP`),
  ADD CONSTRAINT `dbo_cvht_ibfk_2` FOREIGN KEY (`MaGV`) REFERENCES `dbo_giangvien` (`MaGV`);

--
-- Constraints for table `dbo_diemhp`
--
ALTER TABLE `dbo_diemhp`
  ADD CONSTRAINT `dbo_diemhp_ibfk_1` FOREIGN KEY (`MaSV`) REFERENCES `dbo_sinhvien` (`MaSV`),
  ADD CONSTRAINT `dbo_diemhp_ibfk_2` FOREIGN KEY (`MaMH`) REFERENCES `dbo_monhoc` (`MaMH`);

--
-- Constraints for table `dbo_giangvien`
--
ALTER TABLE `dbo_giangvien`
  ADD CONSTRAINT `dbo_giangvien_ibfk_1` FOREIGN KEY (`MaKhoa`) REFERENCES `dbo_khoa` (`MaKhoa`),
  ADD CONSTRAINT `dbo_giangvien_ibfk_2` FOREIGN KEY (`MaHH`) REFERENCES `dbo_hocham` (`MaHH`),
  ADD CONSTRAINT `dbo_giangvien_ibfk_3` FOREIGN KEY (`MaHV`) REFERENCES `dbo_hocvi` (`MaHV`);

--
-- Constraints for table `dbo_kehoachhttk`
--
ALTER TABLE `dbo_kehoachhttk`
  ADD CONSTRAINT `dbo_kehoachhttk_ibfk_1` FOREIGN KEY (`MaSV`) REFERENCES `dbo_sinhvien` (`MaSV`),
  ADD CONSTRAINT `dbo_kehoachhttk_ibfk_2` FOREIGN KEY (`NienKhoa`) REFERENCES `dbo_nienkhoa` (`NienKhoa`),
  ADD CONSTRAINT `dbo_kehoachhttk_ibfk_3` FOREIGN KEY (`MaMH`) REFERENCES `dbo_monhoc` (`MaMH`),
  ADD CONSTRAINT `dbo_kehoachhttk_ibfk_4` FOREIGN KEY (`HocKy`) REFERENCES `dbo_nienkhoa` (`HocKy`);

--
-- Constraints for table `dbo_khungctdt`
--
ALTER TABLE `dbo_khungctdt`
  ADD CONSTRAINT `dbo_khungctdt_ibfk_1` FOREIGN KEY (`MaMH`) REFERENCES `dbo_monhoc` (`MaMH`),
  ADD CONSTRAINT `dbo_khungctdt_ibfk_2` FOREIGN KEY (`Khoa`) REFERENCES `dbo_khoahoc` (`Khoa`),
  ADD CONSTRAINT `dbo_khungctdt_ibfk_3` FOREIGN KEY (`MaCN`) REFERENCES `dbo_chuyennganh` (`MaCN`);

--
-- Constraints for table `dbo_lopchuyennganh`
--
ALTER TABLE `dbo_lopchuyennganh`
  ADD CONSTRAINT `dbo_lopchuyennganh_ibfk_1` FOREIGN KEY (`Khoa`) REFERENCES `dbo_khoahoc` (`Khoa`),
  ADD CONSTRAINT `dbo_lopchuyennganh_ibfk_2` FOREIGN KEY (`MaCN`) REFERENCES `dbo_chuyennganh` (`MaCN`);

--
-- Constraints for table `dbo_lophp`
--
ALTER TABLE `dbo_lophp`
  ADD CONSTRAINT `dbo_lophp_ibfk_1` FOREIGN KEY (`MaGV`) REFERENCES `dbo_giangvien` (`MaGV`),
  ADD CONSTRAINT `dbo_lophp_ibfk_2` FOREIGN KEY (`MaMH`) REFERENCES `dbo_monhoc` (`MaMH`),
  ADD CONSTRAINT `dbo_lophp_ibfk_3` FOREIGN KEY (`NienKhoa`) REFERENCES `dbo_nienkhoa` (`NienKhoa`),
  ADD CONSTRAINT `dbo_lophp_ibfk_4` FOREIGN KEY (`HocKy`) REFERENCES `dbo_nienkhoa` (`HocKy`);

--
-- Constraints for table `dbo_monhoc`
--
ALTER TABLE `dbo_monhoc`
  ADD CONSTRAINT `dbo_monhoc_ibfk_1` FOREIGN KEY (`MaKhoa`) REFERENCES `dbo_khoa` (`MaKhoa`),
  ADD CONSTRAINT `dbo_monhoc_ibfk_2` FOREIGN KEY (`MaNhomHP`) REFERENCES `dbo_nhomhocphi` (`MaNhomHP`);

--
-- Constraints for table `dbo_montienquyet`
--
ALTER TABLE `dbo_montienquyet`
  ADD CONSTRAINT `dbo_montienquyet_ibfk_1` FOREIGN KEY (`MaMH`) REFERENCES `dbo_monhoc` (`MaMH`),
  ADD CONSTRAINT `dbo_montienquyet_ibfk_2` FOREIGN KEY (`MaMHTQ`) REFERENCES `dbo_monhoc` (`MaMH`);

--
-- Constraints for table `dbo_nganh`
--
ALTER TABLE `dbo_nganh`
  ADD CONSTRAINT `dbo_nganh_ibfk_1` FOREIGN KEY (`MaKhoa`) REFERENCES `dbo_khoa` (`MaKhoa`);

--
-- Constraints for table `dbo_sinhvien`
--
ALTER TABLE `dbo_sinhvien`
  ADD CONSTRAINT `dbo_sinhvien_ibfk_1` FOREIGN KEY (`MaLop`) REFERENCES `dbo_lopchuyennganh` (`MaLoP`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
