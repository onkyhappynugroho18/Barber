-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Nov 2019 pada 05.58
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyekweb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kategori` char(20) DEFAULT NULL,
  `kode` char(20) DEFAULT NULL,
  `nama` varchar(250) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `harga` double(16,0) DEFAULT NULL,
  `keterangan` text,
  `flag` tinyint(1) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `masuk` datetime DEFAULT NULL,
  `gambar` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`kategori`, `kode`, `nama`, `stok`, `harga`, `keterangan`, `flag`, `time`, `masuk`, `gambar`) VALUES
('Camera', 'SP001', 'DSLR Cannon', 1, 1, 'Jl. Cinta', NULL, '2019-04-30 10:08:21', NULL, 0x616e696d6173692d626572676572616b2d6c7563752d322e676966);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `kode` varchar(50) DEFAULT NULL,
  `nama` varchar(250) DEFAULT NULL,
  `alamat` varchar(500) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `keterangan` text,
  `flag` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`kode`, `nama`, `alamat`, `telp`, `keterangan`, `flag`) VALUES
('SP002', 'ADIB ASSEGAF', 'Pekalongan', '0886587658656', 'adada', NULL),
('SP001', 'ADIB ASSEGAF', 'PURWODADI', '0886587658654', 'jj', NULL),
('SP003', 'Dani Afrizal', 'PURWODADI', '0886587658654', 'jhhh', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(10) UNSIGNED NOT NULL,
  `kategori` varchar(250) NOT NULL DEFAULT '',
  `flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `kategori`, `flag`) VALUES
(30, 'Baju', 1),
(29, 'Celana', 1),
(31, 'Negeri', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `nota` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `user` varchar(250) NOT NULL DEFAULT '',
  `beli` date NOT NULL DEFAULT '0000-00-00',
  `tagih` date NOT NULL DEFAULT '0000-00-00',
  `xnota` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_detil`
--

CREATE TABLE `pembelian_detil` (
  `nota` int(11) NOT NULL DEFAULT '0',
  `supplier` char(50) NOT NULL DEFAULT '',
  `kode` char(20) NOT NULL DEFAULT '',
  `jumlah` int(11) NOT NULL DEFAULT '0',
  `harga` double(16,0) NOT NULL DEFAULT '0',
  `keterangan` text,
  `flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '2 retur habis',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `nota` char(5) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `user` varchar(250) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 lunas 0 belum',
  `tgl_bayar` datetime DEFAULT '0000-00-00 00:00:00',
  `diskon` int(11) DEFAULT '0',
  `total_bayar` double(16,0) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_detil`
--

CREATE TABLE `penjualan_detil` (
  `nota` char(5) NOT NULL DEFAULT '0',
  `kode` char(20) NOT NULL DEFAULT '',
  `jumlah` int(11) NOT NULL DEFAULT '0',
  `harga` double(16,0) NOT NULL DEFAULT '0',
  `keterangan` text,
  `flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '2 = status retur habis',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id` tinyint(1) NOT NULL,
  `nama` varchar(40) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `kode` varchar(50) NOT NULL DEFAULT '',
  `nama` varchar(250) NOT NULL DEFAULT '',
  `alamat` varchar(500) NOT NULL DEFAULT '',
  `telp` varchar(20) NOT NULL DEFAULT '',
  `keterangan` text NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`kode`, `nama`, `alamat`, `telp`, `keterangan`, `flag`) VALUES
('SP003', 'Dani Afrizal', 'Pekalongan', '083344556677', 'Halo', 1),
('SP001', 'Muhammad Abdul', 'Semarang', '083344556677', 'Jl. Cinta', 1),
('SP002', 'ADIB ASSEGAF', 'PURWODADI', '0886587658654', 'jj', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `userlogin`
--

CREATE TABLE `userlogin` (
  `id` int(11) UNSIGNED NOT NULL,
  `npp` varchar(80) NOT NULL DEFAULT '',
  `username` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(60) NOT NULL DEFAULT '',
  `image` varchar(60) NOT NULL DEFAULT '',
  `sid` varchar(80) NOT NULL DEFAULT '',
  `role` char(2) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `browser` varchar(160) NOT NULL DEFAULT '',
  `host` varchar(80) NOT NULL DEFAULT '',
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `timelog` varchar(50) NOT NULL DEFAULT '',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `userlogin`
--

INSERT INTO `userlogin` (`id`, `npp`, `username`, `password`, `image`, `sid`, `role`, `ip`, `browser`, `host`, `timestamp`, `lastlogin`, `timelog`, `created_date`, `flag`) VALUES
(123, '', 'dani', 'dani', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`nota`);

--
-- Indeks untuk tabel `pembelian_detil`
--
ALTER TABLE `pembelian_detil`
  ADD KEY `NewIndex1` (`nota`,`kode`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`nota`);

--
-- Indeks untuk tabel `penjualan_detil`
--
ALTER TABLE `penjualan_detil`
  ADD KEY `NewIndex1` (`nota`,`kode`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`id`,`created_date`),
  ADD UNIQUE KEY `NewIndex1` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
