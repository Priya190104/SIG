-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jul 2024 pada 06.29
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `websig`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kabupaten`
--

CREATE TABLE `kabupaten` (
  `id_kabupaten` int(11) NOT NULL,
  `kode_kabupaten` varchar(100) NOT NULL,
  `nama_kabupaten` varchar(100) NOT NULL,
  `koordinat` varchar(100) NOT NULL,
  `jumlah_penduduk` int(11) NOT NULL,
  `luas_wilayah` float(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kabupaten`
--

INSERT INTO `kabupaten` (`id_kabupaten`, `kode_kabupaten`, `nama_kabupaten`, `koordinat`, `jumlah_penduduk`, `luas_wilayah`) VALUES
(1, '3301', 'Cilacap', '-7.7064271,108.9912947', 2007829, 2249.28);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kecamatan`
--

CREATE TABLE `kecamatan` (
  `kode_kecamatan` varchar(100) NOT NULL,
  `id_kabupaten` int(11) NOT NULL,
  `nama_kecamatan` varchar(100) NOT NULL,
  `jumlah_penduduk` int(11) NOT NULL,
  `luas_wilayah` float(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kecamatan`
--

INSERT INTO `kecamatan` (`kode_kecamatan`, `id_kabupaten`, `nama_kecamatan`, `jumlah_penduduk`, `luas_wilayah`) VALUES
('3301010', 1, 'Dayaehluhur', 5, 1000.00),
('3301020', 1, 'Wanareja', 107479, 195.92),
('3301030', 1, 'Majenang', 143101, 167.60),
('3301040', 1, 'Cimanggu', 104785, 163.35),
('3301050\r\n', 1, 'Karangpucung\r\n', 80927, 124.74),
('3301060', 1, 'Cipari', 68843, 107.53),
('3301070', 1, 'Sidareja', 63829, 49.31),
('3301080', 1, 'Kedungreja\r\n', 91489, 82.01),
('3301090', 1, 'Patimuan\r\n', 50658, 78.68),
('3301100', 1, 'Gandrungmangu', 113366, 119.00),
('3301110', 1, 'Bantarsari', 77597, 100.00),
('3301120', 1, 'Kawunganten', 87423, 138.00),
('3301121', 1, 'Kampung Laut', 16153, 134.00),
('3301130', 1, 'Jeruklegi', 81075, 99.00),
('3301140', 1, 'Kesugihan', 139176, 89.00),
('3301150', 1, 'Adipala', 98327, 75.00),
('3301160', 1, 'Maos', 47100, 34.00),
('3301170', 1, 'Sampang', 44754, 29.00),
('3301180', 1, 'Kroya', 118370, 62.00),
('3301190', 1, 'Binangun', 72026, 54.00),
('3301200', 1, 'Nusawungu', 89988, 67.00),
('3301710', 1, 'Cilacap Selatan', 84858, 8.00),
('3301720', 1, 'Cilacap Tengah', 91572, 51.00),
('3301730', 1, 'Cilacap Utara', 85315, 30.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sekolah`
--

CREATE TABLE `sekolah` (
  `npsn` int(11) NOT NULL,
  `kode_kecamatan` varchar(100) NOT NULL,
  `nama_sekolah` varchar(100) NOT NULL,
  `alamat_sekolah` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `jenjang_pendidikan` varchar(100) NOT NULL,
  `koordinat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sekolah`
--

INSERT INTO `sekolah` (`npsn`, `kode_kecamatan`, `nama_sekolah`, `alamat_sekolah`, `status`, `jenjang_pendidikan`, `koordinat`) VALUES
(20300138, '3301120', 'SD NEGERI SARWADADI 02', 'Jl. Raya Sarwadadi', 'NEGERI', 'SD', '-7.5564,108.9172'),
(20300168, '3301030', 'SD NEGERI PENGADEGAN', 'Jl. Balekambang No. 01', 'NEGERI', 'SD', '-7.2779,108.7798'),
(20300209, '3301130', 'SD NEGERI SUMINGKIR 03', 'Jl. Wijaya Kusuma No 8', 'NEGERI', 'SD', '-7.5968,109.0559'),
(20300225, '3301710', 'SD NEGERI TAMBAKREJA 11', 'Jl. Slamet Riyadi No. 188', 'NEGERI', 'SD', '-7.740427,109.002498'),
(20300263, '3301720', 'SD NEGERI SIDANEGARA 11', 'Jl Dr Soetomo 103', 'NEGERI', 'SD', '-7.6932,109.0081'),
(20300450, '3301070', 'SMP NASIONAL SIDAREJA', 'Jl. Jend. Sudirman No.01', 'SWASTA', 'SMP', '-7.4872,108.7491'),
(20300465, '3301070', 'SMP PIUS SIDAREJA', 'Jalan Ranggasena No 596', 'SWASTA', 'SMP', '-7.4879,108.7976'),
(20300483, '3301060', 'SMP ISLAM CARUY', 'Jl. Masijd Karangjambu', 'SWASTA', 'SMP', '-7.3744,108.7812'),
(20300486, '3301170', 'SMP DIPONEGORO SAMPANG', 'Jl. Gerilya No.70', 'SWASTA', 'SMP', '-7.5742,109.2017'),
(20300487, '3301090', 'SMP DIPONEGORO PATIMUAN', 'Jl. Kauman No.01', 'SWASTA', 'SMP', '-7.6513,108.7837'),
(20300494, '3301150', 'SMP KRISTEN ADIPALA', 'Jalan Srandil No. 223 Adiraja', 'SWASTA', 'SMP', '-7.6618,109.1657'),
(20300627, '3301100', 'SMA PGRI 4 GANDRUNGMANGU', 'JL. RAYA GANDRUNGMANGU', 'SWASTA', 'SMA', '-7.5263,108.8171'),
(20300699, '3301190', 'SMP 10 NOPEMBER BINANGUN', 'Jl. Jetis Km 39', 'SWASTA', 'SMP', '-7.6937,109.3038'),
(20300840, '3301110', 'SD NEGERI BINANGUN 01', 'Jl. Raya Kedung Borang', 'NEGERI', 'SD', '-7.5447,108.9196'),
(20301098, '3301080', 'SD NEGERI KALIWUNGU 03', 'Jl Kyai Surawal', 'NEGERI', 'SD', '-7.5457,108.7823'),
(20301106, '3301160', 'SD NEGERI KARANGKEMIRI 04', 'Jl. Wanaroba No.125', 'NEGERI', 'SD', '-7.6249,109.1468'),
(20301185, '3301730', 'SD NEGERI KEBONMANIS 01', 'Jl   Setia Budi No 19', '', '', '-7.6856,109.0253'),
(20301336, '3301180', 'SD NEGERI KARANGTURI 02', 'Jl. Turangga', 'NEGERI', 'SD', '-7.6495,109.2124'),
(20301356, '3301040', 'SD NEGERI CILEMPUYANG 03', 'Jl. Leber RT. 03 RW. VII', 'NEGERI', 'SD', '-7.3256,108.8082'),
(20301372, '3301020', 'SD NEGERI CILONGKRANG 03', 'Jl. Raya Cilongkrang Timur Rt 02 Rw 05', 'NEGERI', 'SD', '-7.4069,108.7085'),
(20301395, '3301080', 'SD NEGERI BUMIREJA 02', 'Jl. Prayadinangga No.04', 'NEGERI', 'SD', '-7.5492,108.7994'),
(20301418, '3301030', 'SD NEGERI CIBEUNYING 05', 'Jl. Kamboja Rt 03 Rw 02', 'NEGERI', 'SD', '-7.2908,108.7161'),
(20301486, '3301060', 'SD NEGERI CISURU 03', 'Jl Jendral sudirman no.02', 'NEGERI', 'SD', '-7.3934,108.7506'),
(20301506, '3301200', 'SD NEGERI DANASRI KIDUL 02', 'Glagah Wangi, Rt 04 Rw 04', 'NEGERI', 'SD', '-7.6464,109.3174'),
(20338598, '3301090', 'SD NEGERI SIDAMUKTI 04', 'Jl. Jend. Sudirman No. 19', 'NEGERI', 'SD', '-7.6261,108.7661'),
(20338661, '3301040', 'SD NEGERI REJODADI 05', 'Kubangwaru', 'NEGERI', 'SD', '-7.306,108.8466'),
(20338732, '3301050\r\n', 'SD NEGERI CIPOROS 03', 'Jl Raya Ciporos RT 04 RW 04', 'NEGERI', 'SD', '-7.3421,108.9496'),
(20339047, '3301121', 'SD NEGERI PANIKEL 03', 'Dusun Bugel, RT05/011 Desa Panikel', 'NEGERI', 'SD', '-7.641777,108.852949'),
(20340895, '3301020', 'SMP NEGERI SATU ATAP 1 WANAREJA', 'Dusun Jambu Rt.05/Rw.04', 'NEGERI', 'SMP', '-7.2581,108.6452'),
(20341172, '3301050\r\n', 'SD NEGERI BABAKAN 02', 'Jl. Raya Babakan', 'NEGERI', 'SD', '-7.3729,108.8963'),
(20341214, '3301140', 'SD NEGERI BULUPAYUNG 02', 'Jl Tambangan RT 04 RW 02', 'NEGERI', 'SD', '-7.5968,109.128817');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`id_kabupaten`);

--
-- Indeks untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`kode_kecamatan`),
  ADD KEY `kecamatan_ibfk_1` (`id_kabupaten`);

--
-- Indeks untuk tabel `sekolah`
--
ALTER TABLE `sekolah`
  ADD PRIMARY KEY (`npsn`),
  ADD KEY `kode_kecamatan` (`kode_kecamatan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kabupaten`
--
ALTER TABLE `kabupaten`
  MODIFY `id_kabupaten` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD CONSTRAINT `kecamatan_ibfk_2` FOREIGN KEY (`id_kabupaten`) REFERENCES `kabupaten` (`id_kabupaten`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sekolah`
--
ALTER TABLE `sekolah`
  ADD CONSTRAINT `sekolah_ibfk_2` FOREIGN KEY (`kode_kecamatan`) REFERENCES `kecamatan` (`kode_kecamatan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
