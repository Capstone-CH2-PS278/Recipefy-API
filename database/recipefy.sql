-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 35.237.5.10
-- Generation Time: Dec 14, 2023 at 02:42 PM
-- Server version: 8.0.31-google
-- PHP Version: 8.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipefy`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_ingredients`
--

CREATE TABLE `data_ingredients` (
  `id` int NOT NULL,
  `name_ingredient` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `data_ingredients`
--

INSERT INTO `data_ingredients` (`id`, `name_ingredient`, `image_url`) VALUES
(3, 'Bawang putih', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1702352916464_bawangPutih.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `data_recipe`
--

CREATE TABLE `data_recipe` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ingredients` json NOT NULL,
  `tools` json NOT NULL,
  `instructions` json NOT NULL,
  `likes` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `data_recipe`
--

INSERT INTO `data_recipe` (`id`, `name`, `image_url`, `note`, `ingredients`, `tools`, `instructions`, `likes`) VALUES
('fF8UBBJ9b2yVIhZv', 'Sate Ayam', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/food/1702201241932_sateAyam.jpeg', 'Sate, kelezatan Indonesia yang tak terbantahkan, menghadirkan potongan daging yang lezat, dipanggang sempurna di atas bara api, dan disajikan dengan bumbu kacang yang merangsang selera.', '[\"500 gram daging ayam, potong kotak\", \"200 ml santan kental\", \"2 sendok makan minyak goreng\", \"1 sendok makan kecap manis\", \"1 sendok teh garam\", \"1/2 sendok teh merica bubuk\", \"Tusuk sate secukupnya\", \"150 gram kacang tanah, sangrai dan haluskan\", \"2 siung bawang putih, cincang halus\", \"2 sendok makan kecap manis\", \"1 sendok teh tamarind paste\", \"1/2 sendok teh garam\", \"200 ml air\"]', '[\"Mangkok\", \"Wajan\", \"Pemanggang atau grill\", \"Tusuk sate\"]', '[\"Campur daging ayam dengan minyak goreng, kecap manis, garam, dan merica. Diamkan selama 30 menit.\", \"Tusukkan potongan daging ayam ke tusuk sate.\", \"Panaskan pemanggang atau grill, panggang sate ayam hingga matang dan berwarna kecokelatan.\", \"Untuk bumbu kacang, campur kacang tanah halus dengan bawang putih, kecap manis, tamarind paste, dan garam. Tambahkan air sedikit demi sedikit hingga bumbu kacang mencapai konsistensi yang diinginkan.\", \"Panaskan bumbu kacang di wajan hingga mendidih dan terlihat mengental.\", \"Sajikan sate ayam dengan bumbu kacang di atasnya.\"]', 70),
('Fz1Ll8y_yKlw85id', 'Nasi Goreng', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/food/1702200938839_nasigoreng.jpeg', 'Nasi goreng merupakan makanan tradisional', '[\"2 piring nasi putih\", \"2 telur, kocok lepas\", \"150 gram ayam fillet, potong kecil\", \"100 gram udang, kupas bersih\", \"1 wortel, serut tipis\", \"1 bawang bombay, cincang halus\", \"3 siung bawang putih, cincang halus\", \"2 sendok makan kecap manis\", \"1 sendok makan saus tiram\", \"1 sendok teh garam\", \"1/2 sendok teh merica bubuk\", \"Minyak goreng secukupnya\"]', '[\"Wajan\", \"Spatula\", \"Mangkok\", \"Sendok\"]', '[\"Panaskan minyak goreng di wajan, tumis bawang putih dan bawang bombay hingga harum.\", \"Tambahkan ayam fillet, masak hingga berubah warna.\", \"Masukkan udang dan wortel, aduk rata dan masak hingga udang matang.\", \"Dorong bahan-bahan ke sisi wajan, tuangkan telur kocok, aduk cepat hingga telur setengah matang.\", \"Campurkan nasi putih ke dalam wajan, aduk rata dengan bahan lain.\", \"Tambahkan kecap manis, saus tiram, garam, dan merica bubuk. Aduk hingga semua bahan tercampur sempurna.\", \"Masak nasi goreng hingga tekstur dan rasa sesuai selera.\", \"Angkat dan sajikan nasi goreng di atas piring, bisa ditambahkan irisan mentimun dan kerupuk sebagai pelengkap.\"]', 100),
('HFnl0GxqCFH1ySe2', 'Mie Goreng Seafood', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/food/1702201455776_mieGorengSeafood.jpeg', 'Mie goreng seafood adalah hidangan yang memikat selera dengan kombinasi mie yang digoreng secara merata, disatukan dengan kelezatan seafood seperti udang, cumi-cumi, dan potongan ikan.', '[\"200 gram mie telur, rebus dan tiriskan\", \"100 gram udang, kupas bersih\", \"100 gram cumi-cumi, potong sesuai selera\", \"100 gram kerang, bersihkan\", \"3 siung bawang putih, cincang halus\", \"2 sendok makan minyak sayur\", \"1 wortel, serut tipis\", \"1 batang daun bawang, iris halus\", \"2 sendok makan kecap manis\", \"1 sendok makan saus tiram\", \"1 sendok teh cabai bubuk (sesuaikan selera)\", \"Garam dan merica secukupnya\"]', '[\"Wajan\", \"Sendok\", \"Mangkok\"]', '[\"Panaskan minyak sayur di wajan, tumis bawang putih hingga harum.\", \"Tambahkan udang, cumi-cumi, dan kerang. Aduk rata dan masak hingga seafood matang.\", \"Masukkan wortel, aduk sebentar hingga wortel setengah matang.\", \"Tambahkan mie telur yang sudah direbus dan tiriskan. Aduk rata dengan bumbu dan seafood.\", \"Tuangkan kecap manis, saus tiram, cabai bubuk, garam, dan merica. Aduk hingga semua bahan tercampur sempurna.\", \"Masak mie goreng seafood hingga matang dan bumbu meresap.\", \"Taburkan irisan daun bawang di atas mie goreng sebelum disajikan.\"]', 40),
('N7IvecaAAeA_oGNX', 'mie aduk', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/food/1702352498971_bawangPutih.jpeg', 'Nasi goreng merupakan makanan tradisional Indonesia', '[\"Nasi\", \"Bawang Putih\", \"Kecap\"]', '[\"Wajan\", \"Sotil\"]', '[\"1. Masukkan nasi ke wajan\", \"2. Masukkan kecap \"]', 90);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int NOT NULL,
  `userId` varchar(255) NOT NULL,
  `recipeId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `userId`, `recipeId`) VALUES
(1, 'zMqxfZXyhCWP6cZE9jPvq3971NQ2', 'HFnl0GxqCFH1ySe2');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `email`, `username`, `password`) VALUES
('eouogbSqfzU4m9NrmrRAv2U2Fjn1', 'vio@email.com', 'vio', '$2a$10$ymNIS8GXVu.n/sVXLHpiJeOQwq70HO65TAPI6mQtw6uPJgO6Q7Usy'),
('UJHQo4YSb1QFtYKoxJJ20wU1SO52', 'vio@email.com', 'vio', '$2a$10$ShVfMiq5ejI0CVu89KZZNO5zCKy3kZDDYOp8mSqc5z9SetSqvBJ02'),
('zMqxfZXyhCWP6cZE9jPvq3971NQ2', 'test@email.com', 'sdf', '$2a$10$GflQxx8sNSVQopwgPv7WWegp1mYuyL7ONdGTy6SfixoipP0PH/gEC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_ingredients`
--
ALTER TABLE `data_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_recipe`
--
ALTER TABLE `data_recipe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `recipeId` (`recipeId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_ingredients`
--
ALTER TABLE `data_ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`recipeId`) REFERENCES `data_recipe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
