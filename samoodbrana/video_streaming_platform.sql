-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2024 at 03:10 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `video_streaming_platform`
--

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `genre` varchar(50) NOT NULL,
  `release_year` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `slika` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `description`, `genre`, `release_year`, `created_at`, `slika`) VALUES
(1, 'Sejtanov ratnik', 'Film govori o grupi srednjoškolaca, koji upadaju u niz komičnih i strašnih situacija. Cane (Radovan Vujović), Tića (Staša Koprivica) i Mirko (Miloš Tanasković) su srednjoškolci, koji pokušavaju da zaustave iskonsko zlo. Njihov školski drug, iskompleksirani Stanislav (Vladimir Tešović), dokopao se mistične knjige i oslobodio monstruoznog Šejtana. ', 'triler', 2006, '2024-05-22 17:33:52', 'img/sejtan.jpg'),
(2, 'Dune', 'Melanž, ili začin, najvrednija je i najređa supstanca u vaseljeni. Droga čije se posledice kreću u rasponu od produžetka životnog veka do trenutačnog putovanja međuzvezdanim prostranstvom može se naći samo na jednoj planeti: na negostoljubivom pustinjskom svetu Arakisu, poznatijem kao Dina.', 'Akcija', 2021, '2024-05-22 18:13:12', 'img/dina.jpg'),
(3, 'Kad porastem bicu kengur', 'Film govori o mladim ljudima koji su na granici prelaska u tridesete godine, a nisu uradili ništa konkretno u svom životu. Radnja filma sastoji se iz tri međusobno isprepletene paralelne priče koje se odigravaju na beogradskoj opštini Voždovac.', 'Komedija', 2004, '2024-05-22 18:13:12', 'img/kpbk.jpg'),
(4, 'Munje', 'Obična urbana beogradska noć - dva drugara pokušavaju da vrate novac od svog školskog druga, kojeg su maltretirali kada su bili deca. Gojko Sisa ne zaboravlja tako lako stare dušmane.', 'Komedija', 2001, '2024-05-22 18:19:49', 'img/munje.jpg'),
(5, 'Kingsman', 'Mladić po imenu Eggsi čiji je otac umro dok je bio dečak, bavi se životom sa jezikom s kojim je sada njegova majka i koji maltretira nju i njega. Izađe i učini nešto jednom od puzivih prijatelja.', 'Akcija', 2014, '2024-05-22 18:19:49', 'img/kingsman.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `preferences`
--

CREATE TABLE `preferences` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `series_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `preferences`
--

INSERT INTO `preferences` (`id`, `user_id`, `movie_id`, `series_id`) VALUES
(1, 2, 5, 3),
(2, 1, 1, 2),
(3, 3, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

CREATE TABLE `series` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `genre` varchar(50) NOT NULL,
  `release_year` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `series`
--

INSERT INTO `series` (`id`, `title`, `description`, `genre`, `release_year`, `created_at`, `image_path`) VALUES
(1, 'Game of Thrones', 'Smeštena na izmišljenim kontinentima Vesteros i Esos, Igra prestola ima veliki glumački ansambl i prati nekoliko priča tokom svog trajanja. Prva velika priča tiče se Gvozdenog prestola Sedam kraljevstava Vesterosa, kroz mrežu političkih sukoba između plemićkih porodica koje se ili nadmeću da preuzmu presto ili bore za nezavisnost od onoga ko sedi na njemu. ', 'avantura', 2019, '2024-05-23 18:42:06', 'img/got.jpg'),
(2, 'Shameless', 'Besramnici (eng. Shameless) američka je televizijska serija s elementima komedije i drame koja se prikazuje na američkom kablovskom kanalu Showtime. Adaptacija je istoimene britanske serije, a radnja je smještena u susjedstvu Canaryville u Chicagu, saveznoj državi Illinois, mada se serija snima u Los Angelesu s nekoliko vanjskih scena snimljenih u Chicagu.', 'Komedija', 2011, '2024-05-23 19:16:06', 'img/shame.jpg'),
(3, 'Friends', 'Prijatelji (engl. Friends) američka je humoristička televizijska serija čiji su tvorci Dejvid Krejn i Marta Kaufman, a koja se emitovala na kanalu NBC od 22. septembra 1994. do 6. maja 2004. u trajanju od 10 sezona.[1] Sa glumačkim ansamblom koji su činili Dženifer Aniston, Kortni Koks, Lisa Kudrou, Met Leblank, Metju Peri i Dejvid Švimer, serija govori o životu šest prijatelja starosti od 20 do 30 godina koji žive na Menhetnu u Njujorku. Prvobitno izvršni producenti su bili Kevin S. Brajt, Kaufmanova i Krejn.', 'Komedija', 1994, '2024-05-23 19:21:42', 'img/friends.jpg'),
(4, 'Euphoria', 'Euforija (engl. Euphoria) američka je televizijska serija koju je stvorio Sem Levinson za HBO. Temelji se na istoimenoj izraelskoj mini-seriji čiji su autori Ron Lešem i Dafna Levin. Serija prati Ru Benet (Zendeja), tinejdžerku i zavisnicu od droge koja se bori da pronađe svoje mesto u svetu, kao i grupu srednjoškolaca kroz svoja iskustva identiteta, traume, droge, samopovređivanja, porodice, prijateljstva, ljubavi i seksa.', 'Drama', 2014, '2024-05-23 19:21:42', 'img/eup.jpg'),
(5, 'Gomora', 'Kad je Pjetro Savastano, jedan od najvećih i najopakijih Kamorinih šefova podzemlja uhapšen i poslat u zatvor, njegova desna ruka, Čiro di Marcio vidi priliku da konačno postane novi vođa. Ali njegovo vreme još nije došlo. Dok je Pjetro u zatvoru, njegova žena Ima preuzima posao, a njegov naslednik, sin Đeni kuje zanat u Hondurasu. U međuvremenu, suparnički klan koji vodi Salvatore Konte planira da jednom zauvek uništi Savastanove. Rat za kontrolu „Sistema“ tek je počeo, na teritoriji koja ne želi da se preda kriminalu i bezakonju. ', 'Drama', 2014, '2024-05-23 19:23:14', 'img/ciro.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'savas', 'savasimic5@gmail.com', '$2y$10$uiRhYe41VWGfju3NCoHgT.ug9Ma.r5zqpvHWTwqN7uIIh6iyPZ4t2', '2024-05-22 17:10:41'),
(2, 'marko', 'marko21@gmail.com', '$2y$10$miyD5oG.yY6MunSmQe0js.5K02HQU3qxtP4tj/5m8dAWBSfnTFXyW', '2024-05-22 17:24:59'),
(3, 'Duda', 'duda@gmail.com', '$2y$10$RCDDta7kig4btowEm0F7Ue/RvD6j2sr0F06EDXMfbOQNAWE04qwlC', '2024-05-23 21:03:24'),
(10, 'duda32', 'duda5@gmail.com', '$2y$10$T9oQPQz1IY8BrDPK9wjQ0.Ku1W5pHjXgeM.stfZgO/GMn1darSL46', '2024-05-23 21:06:49'),
(11, 'kosta', 'kole@gmail.com', '$2y$10$Nb1jDmuvQJ7cUYsDP8epEO3238iBS4/F3AWlGQdPKoQFzuCA7fJPi', '2024-05-23 21:09:14'),
(13, 'asd', 'aaf@gmail.com', '$2y$10$6qpOi943gpVgciUwHikvauQXzs52a9eL5Y6PQhYHSoRxrzxbrp.F2', '2024-05-23 21:12:29'),
(14, 'pele', 'doncic@gmial.com', '$2y$10$efCYWNipzPgrM69qq7tZTuvqwBr8rMNin6/88PiPvGKZ4dDr/GApu', '2024-05-23 21:13:19'),
(15, 'ende', 'ende@gmail.com', '$2y$10$OkrXPs2ROtzdd4TgQrFoSueD9ZOIenrfWpzpcZtT0oP5AD8ykjmX.', '2024-05-23 21:14:05'),
(16, 'vlada', 'vlada@gmail.com', '$2y$10$Kp8T.HK8yw31MtcIWFKqvO8PCndt4Tzgy/bArmc9LO/YMtad4e44m', '2024-05-23 23:07:16'),
(17, 'miki', 'mikicar@gmail.com', '$2y$10$fiNbabK4Oj4PQta0NPimVeAM.UiVSJMaH.G9Knx3ykPKCuj0gcR5.', '2024-08-13 12:00:47'),
(24, 'sssss', 'ss@gmail.com', '$2y$10$NeTs/vQjT1SYJr.CbT4ULuH2.xd19siFBJNhdli2qjSw6vvGXMkvu', '2024-08-13 14:54:44'),
(25, 'sava21', 'sava21@gmail.com', '$2y$10$2KGcXXfocNZSHor.ZtIn7.GsU/nsTUWkIUERkGrbhMNEbCeR6wQPK', '2024-08-13 15:21:54'),
(26, 'odbrana21', 'odbrana@gmail.com', '$2y$10$nWBrDolwqJe97zUdLpu8He8iptblbJT/47r1IQQGZdICUTnFt2QSe', '2024-08-15 12:13:16'),
(30, 'odbrana', 'projekat@gmail.com', '$2y$10$MI.wCjxfxc.glikKspX0JuN.L.SiLSS6mRifumcVcarLcQG.EH1oO', '2024-08-18 13:11:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `series_id` (`series_id`);

--
-- Indexes for table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `preferences`
--
ALTER TABLE `preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `series`
--
ALTER TABLE `series`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `preferences`
--
ALTER TABLE `preferences`
  ADD CONSTRAINT `preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `preferences_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `preferences_ibfk_3` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
