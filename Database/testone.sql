-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Nov 2020 pada 09.53
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testone`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(105, 'Makanan dan minuman'),
(106, 'Perawatan kecantikan'),
(107, 'Handphone dan Acc'),
(108, 'Ibu dan bayi'),
(109, 'Fashion muslim'),
(110, 'Perlengkapan rumah'),
(111, 'Pakaian pria'),
(112, 'Pakaian wanita'),
(113, 'Kesehatan'),
(114, 'Komputer dan Acc'),
(115, 'Fashion anak'),
(116, 'Sepatu pria'),
(117, 'Sepatu wanita'),
(118, 'Tas pria'),
(119, 'Tas wanita'),
(120, 'Jam tangan'),
(121, 'Elektronik'),
(122, 'Aksesoris fashion'),
(123, 'Hobi dan koleksi'),
(124, 'Fotografi'),
(125, 'Olahraga dan outdoor'),
(126, 'Otomotif'),
(127, 'Buku dan alat tulis'),
(128, 'Voucher'),
(129, 'Serba serbi'),
(130, 'Souvenir dan pesta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_description` text NOT NULL,
  `item_price` int(11) NOT NULL,
  `item_category` int(11) NOT NULL,
  `is_image_exist` int(1) DEFAULT NULL,
  `image_file` int(4) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `items`
--

INSERT INTO `items` (`id`, `seller_id`, `item_name`, `item_description`, `item_price`, `item_category`, `is_image_exist`, `image_file`, `timestamp`) VALUES
(1, 2, 'Contoh Produk', 'Contoh Produk Deskripsi\r\n\r\nNama : Contoh Produk\r\nBerat : 200gr\r\nKondisi : Bekas', 10000, 124, 0, 0, '2020-11-10 00:00:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `username` char(100) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `receiver` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `messages`
--

INSERT INTO `messages` (`id`, `username`, `message`, `timestamp`, `receiver`) VALUES
(1, 'wahyuamirulloh', 'Halo, Kak', '2020-11-10 00:01:59', 'ahmadsaugi'),
(2, 'ahmadsaugi', 'Halo Juga', '2020-11-10 00:01:59', 'wahyuamirulloh'),
(3, 'wahyuamirulloh', 'product_id?1', '2020-11-10 00:01:59', 'ahmadsaugi'),
(4, 'wahyuamirulloh', 'Aku tertarik dengan ini', '2020-11-10 00:01:59', 'ahmadsaugi'),
(59, 'wahyuamirulloh', 'product_id?1', '2020-11-14 11:55:13', 'ahmadsaugi'),
(60, 'wahyuamirulloh', 'Aku mau beli yang ini', '2020-11-14 11:55:13', 'ahmadsaugi'),
(61, 'wahyuamirulloh', 'product_id?1', '2020-11-14 11:55:40', 'ahmadsaugi'),
(62, 'wahyuamirulloh', 'Aku mau beli yang ini', '2020-11-14 11:55:40', 'ahmadsaugi'),
(63, 'ahmadsaugi', 'test', '2020-11-14 11:58:37', 'wahyuamirulloh');

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `username` char(100) NOT NULL,
  `name` char(100) NOT NULL,
  `text` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `username`, `name`, `text`) VALUES
(1, 'wahyuamirulloh', 'Wahyu Amirulloh', 'Aku baru saja membeli barang dari marketplace !');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `buyer_id`, `seller_id`, `item_id`, `timestamp`) VALUES
(1, 1, 2, 1, '2020-11-10 00:05:05'),
(4, 1, 2, 1, '2020-11-14 11:55:13'),
(5, 1, 2, 1, '2020-11-14 11:55:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` char(100) NOT NULL,
  `name` char(100) NOT NULL,
  `bio` varchar(1000) DEFAULT NULL,
  `location` char(255) DEFAULT NULL,
  `friends` varchar(1000) DEFAULT NULL,
  `profile_image` varchar(1000) DEFAULT NULL,
  `password` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `bio`, `location`, `friends`, `profile_image`, `password`) VALUES
(1, 'wahyuamirulloh', 'Wahyu Amirulloh', 'Hello Everyone', 'NULL', 'NULL', '0', 'wahyuamirulloh'),
(2, 'ahmadsaugi', 'Ahmad Saugi', 'Hello, Have a great day', 'NULL', 'NULL', '0', 'ahmadsaugi');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `item_category` (`item_category`);

--
-- Indeks untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `transactions_ibfk_3` (`item_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT untuk tabel `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1014;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
