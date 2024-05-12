-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2024 at 03:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aplikasi_sekolah`
--

-- --------------------------------------------------------

--
-- Table structure for table `absens`
--

CREATE TABLE `absens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `absensi` enum('Hadir','Izin','Sakit','Alpha') NOT NULL,
  `keterangan` text DEFAULT NULL,
  `kelas_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `absens`
--

INSERT INTO `absens` (`id`, `tanggal`, `absensi`, `keterangan`, `kelas_id`, `siswa_id`, `created_at`, `updated_at`) VALUES
(1, '2024-05-10', 'Alpha', 'Kemungkinan kabur dari rumah', 3, 2, '2024-05-09 13:14:51', '2024-05-11 20:31:04'),
(3, '2024-05-10', 'Hadir', NULL, 2, 3, '2024-05-09 13:15:13', '2024-05-09 13:15:13'),
(4, '2024-05-10', 'Hadir', NULL, 2, 4, '2024-05-09 13:15:22', '2024-05-09 13:15:22'),
(7, '2024-05-10', 'Izin', NULL, 3, 1, '2024-05-11 01:30:30', '2024-05-11 01:30:30');

-- --------------------------------------------------------

--
-- Table structure for table `bacaans`
--

CREATE TABLE `bacaans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(150) NOT NULL,
  `terbit` varchar(150) NOT NULL,
  `isbn` varchar(150) NOT NULL,
  `cover` varchar(150) NOT NULL,
  `ringkasan` varchar(150) NOT NULL,
  `link` varchar(150) NOT NULL,
  `penulis_id` int(11) NOT NULL,
  `penerbit_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gurus`
--

CREATE TABLE `gurus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gurus`
--

INSERT INTO `gurus` (`id`, `nama`, `alamat`, `email`, `telepon`, `created_at`, `updated_at`) VALUES
(1, 'Pak Asep', 'Bondongan', 'asep@gmail.com', '081243567', NULL, NULL),
(2, 'Pak Udin', 'Sukasari', 'udin@gmail.com', '0812487667', NULL, NULL),
(3, 'Pak Endang', 'Cipaku', 'endang@gmail.com', '0812439877', NULL, NULL),
(4, 'Bu Yati', 'Empang', 'yati@gmail.com', '0812435847', NULL, NULL),
(5, 'Pak Ida', 'Ciheulet', 'ida@gmail.com', '081243584467', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_pelajarans`
--

CREATE TABLE `jadwal_pelajarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hari` varchar(50) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `guru_id` int(11) NOT NULL,
  `pelajaran_id` int(11) NOT NULL,
  `kelasjurusan_ta_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurusans`
--

CREATE TABLE `jurusans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kalender_events`
--

CREATE TABLE `kalender_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `penanggungjawab` varchar(100) NOT NULL,
  `kontak` varchar(20) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kalender_events`
--

INSERT INTO `kalender_events` (`id`, `judul`, `tanggal`, `tempat`, `penanggungjawab`, `kontak`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Pentas Seni', '2024-05-11', 'Lapangan', 'Bu Eha', '0876352511', 'Penampilan bakat masing masing siswa', '2024-05-12 02:22:10', '2024-05-12 02:22:10'),
(3, 'Jumat Bersih', '2024-05-11', 'Lingkungan Sekolah', 'Pa Endang', '0897362542', 'Bersih bersih lingkungan sekolah', '2024-05-12 02:23:22', '2024-05-12 02:23:22');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kelas` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `kelas`, `created_at`, `updated_at`) VALUES
(1, 'X', '2024-05-09 13:07:42', '2024-05-09 13:07:42'),
(2, 'XI', '2024-05-09 13:07:52', '2024-05-09 13:07:52'),
(3, 'XII', '2024-05-09 13:08:02', '2024-05-09 13:08:02');

-- --------------------------------------------------------

--
-- Table structure for table `konsultasi_bks`
--

CREATE TABLE `konsultasi_bks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tujuan` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `jam` time NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `konsultasi_bks`
--

INSERT INTO `konsultasi_bks` (`id`, `tujuan`, `tanggal`, `status`, `tempat`, `jam`, `siswa_id`, `guru_id`, `created_at`, `updated_at`) VALUES
(1, 'Curhat', '2024-05-11', 'diajukan', 'Ruang BK', '07:43:14', 4, 4, '2024-05-12 00:44:16', '2024-05-12 00:44:16'),
(2, 'Curhat', '2024-05-11', 'diajukan', 'Lapangan', '09:03:09', 2, 1, '2024-05-12 00:46:14', '2024-05-12 01:03:48'),
(3, 'Ngeluh', '2024-05-12', 'diproses', 'Kelas', '14:00:00', 3, 3, '2024-05-12 01:02:45', '2024-05-12 01:02:45'),
(4, 'Minata Uang', '2024-05-11', 'Proses', 'Ruang Kepala Sekolah', '15:15:48', 4, 5, '2024-05-12 01:16:38', '2024-05-12 01:16:56');

-- --------------------------------------------------------

--
-- Table structure for table `matpels`
--

CREATE TABLE `matpels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pelajaran` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matpels`
--

INSERT INTO `matpels` (`id`, `pelajaran`, `created_at`, `updated_at`) VALUES
(1, 'Matematika', NULL, NULL),
(2, 'B. Indonesia', NULL, NULL),
(3, 'Agama', NULL, NULL),
(4, 'Fisika', NULL, NULL),
(5, 'Olahraga', NULL, NULL),
(6, 'Seni Budaya', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_09_115305_create_personal_access_tokens_table', 1),
(5, '2024_05_09_115546_create_absens_table', 1),
(6, '2024_05_09_120323_create_bacaans_table', 1),
(7, '2024_05_09_225434_create_jadwal_pelajarans_table', 1),
(8, '2024_05_09_230024_create_jurusans_table', 1),
(9, '2024_05_09_230154_create_kalender_events_table', 1),
(10, '2024_05_09_230953_create_konsultasi_bks_table', 1),
(11, '2024_05_09_232234_create_matpels_table', 1),
(12, '2024_05_09_232451_create_notes_table', 1),
(13, '2024_05_09_232845_create_penerbits_table', 1),
(14, '2024_05_09_233258_create_siswas_table', 1),
(15, '2024_05_09_233543_create_siswa_kelas_table', 1),
(16, '2024_05_09_233757_create_tabungans_table', 1),
(17, '2024_05_09_234409_create_tugassekolahs_table', 1),
(18, '2024_05_09_234854_create_gurus_table', 1),
(19, '2024_05_09_235316_create_penulis_table', 1),
(20, '2024_05_10_014120_create_kelas_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `isi` text NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `judul`, `tanggal`, `isi`, `siswa_id`, `created_at`, `updated_at`) VALUES
(1, 'Diary Hari Ini', '2024-05-11', 'Test test test', 4, '2024-05-12 01:41:50', '2024-05-12 01:41:50'),
(2, 'Curhat ceria', '2024-05-11', 'Hari ini aku bahagia sekali HAHAHAHAHAHA', 1, '2024-05-12 01:42:34', '2024-05-12 01:53:09'),
(4, 'Kisah Sedih dan Mengharukan', '2024-05-11', 'Aku Sedih hmhmhmhm', 2, '2024-05-12 01:54:02', '2024-05-12 01:54:02');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penerbits`
--

CREATE TABLE `penerbits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `telp_kantor` varchar(20) DEFAULT NULL,
  `telp_kontak` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penulis`
--

CREATE TABLE `penulis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `penulis` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswas`
--

CREATE TABLE `siswas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswas`
--

INSERT INTO `siswas` (`id`, `nama`, `alamat`, `email`, `telepon`, `created_at`, `updated_at`) VALUES
(1, 'Rama', 'Pancasan', 'rama@gmail.com', '0812345', '2024-05-09 12:59:09', '2024-05-09 12:59:09'),
(2, 'Devi', 'Rancamaya', 'devi@gmail.com', '089876523', '2024-05-09 13:00:09', '2024-05-09 13:00:09'),
(3, 'Aul', 'Tajur', 'aul@gmail.com', '08932353', '2024-05-09 13:00:50', '2024-05-09 13:00:50'),
(4, 'Tasya', 'Cihideung', 'tasya@gmail.com', '083729564', '2024-05-09 13:01:32', '2024-05-09 13:01:32');

-- --------------------------------------------------------

--
-- Table structure for table `siswa_kelas`
--

CREATE TABLE `siswa_kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `keterangan` text NOT NULL,
  `kelasjurusan_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tabungans`
--

CREATE TABLE `tabungans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nominal` int(11) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jumlah_tabungan` int(11) NOT NULL,
  `jumlah_penarikan` int(11) DEFAULT NULL,
  `total_penarikan` int(11) DEFAULT NULL,
  `siswa_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tugassekolahs`
--

CREATE TABLE `tugassekolahs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tgl` date NOT NULL,
  `tgl_pengumpulan` date NOT NULL,
  `deskripsi` varchar(150) NOT NULL,
  `isi_tugas` text NOT NULL,
  `matpel_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tugassekolahs`
--

INSERT INTO `tugassekolahs` (`id`, `tgl`, `tgl_pengumpulan`, `deskripsi`, `isi_tugas`, `matpel_id`, `siswa_id`, `guru_id`, `created_at`, `updated_at`) VALUES
(1, '2024-05-11', '2024-05-19', 'Senam Irama', 'Hafal gerakan senam irama secara berkelompok', 5, 4, 2, '2024-05-12 05:41:54', '2024-05-12 05:41:54'),
(2, '2024-05-11', '2024-05-27', 'Persamaan Linier Tiga Variabel', 'Selesaikan persamaan linier tiga variabel pada buku paket hal 57', 1, 1, 1, '2024-05-12 05:43:05', '2024-05-12 05:43:05'),
(3, '2024-05-11', '2024-05-27', 'Hafalan Quran', 'Hafalkan Al-Quran surah Al-Baqarah ayat 1 - 286', 3, 2, 5, '2024-05-12 05:45:21', '2024-05-12 05:45:21'),
(4, '2024-05-11', '2024-05-28', 'Fisika Quatum', 'Jika seseorang memasuki dunia quantum, maka seseorang tersebut akan terjebak didalamnya, akan tetapi mengapa  Antman dapat keluar dari dunia tersebut ?', 4, 3, 3, '2024-05-12 05:47:58', '2024-05-12 05:47:58'),
(6, '2024-05-11', '2024-05-11', 'test wkwkwkwk', 'test uhuy', 1, 4, 1, '2024-05-12 05:48:31', '2024-05-12 05:51:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absens`
--
ALTER TABLE `absens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bacaans`
--
ALTER TABLE `bacaans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gurus`
--
ALTER TABLE `gurus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_pelajarans`
--
ALTER TABLE `jadwal_pelajarans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurusans`
--
ALTER TABLE `jurusans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kalender_events`
--
ALTER TABLE `kalender_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `konsultasi_bks`
--
ALTER TABLE `konsultasi_bks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matpels`
--
ALTER TABLE `matpels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `penerbits`
--
ALTER TABLE `penerbits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penulis`
--
ALTER TABLE `penulis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `siswas`
--
ALTER TABLE `siswas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa_kelas`
--
ALTER TABLE `siswa_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tabungans`
--
ALTER TABLE `tabungans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tugassekolahs`
--
ALTER TABLE `tugassekolahs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absens`
--
ALTER TABLE `absens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bacaans`
--
ALTER TABLE `bacaans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gurus`
--
ALTER TABLE `gurus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jadwal_pelajarans`
--
ALTER TABLE `jadwal_pelajarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jurusans`
--
ALTER TABLE `jurusans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kalender_events`
--
ALTER TABLE `kalender_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `konsultasi_bks`
--
ALTER TABLE `konsultasi_bks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `matpels`
--
ALTER TABLE `matpels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `penerbits`
--
ALTER TABLE `penerbits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penulis`
--
ALTER TABLE `penulis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `siswas`
--
ALTER TABLE `siswas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `siswa_kelas`
--
ALTER TABLE `siswa_kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabungans`
--
ALTER TABLE `tabungans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tugassekolahs`
--
ALTER TABLE `tugassekolahs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
