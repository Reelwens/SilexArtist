-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mer 31 Mai 2017 à 07:32
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `silex-artist`
--

-- --------------------------------------------------------

--
-- Structure de la table `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `albums`
--

INSERT INTO `albums` (`id`, `slug`, `name`, `picture`, `year`) VALUES
(1, 'drones', 'Drones', 'https://upload.wikimedia.org/wikipedia/en/4/44/MuseDronesCover.jpg', 2015),
(2, 'the_2nd_law', 'The 2nd Law', 'http://www.musewiki.org/images/The_2nd_Law.jpg', 2012),
(3, 'the_resistance', 'The Resistance', 'http://planetgong.fr/admin/wp-content/uploads/2009/09/muse-the-resistance-front.jpg', 2009),
(4, 'black_holes_and_revelations', 'Black Holes and Revelations', 'http://www.muse-france.fr/wp-content/uploads/2014/02/Muse-Black-holes-and-revelation.jpg', 2006),
(5, 'absolution', 'Absolution', 'https://lastfm-img2.akamaized.net/i/u/ar0/76d9d3dc96e6ae51c01b4651c062947c', 2003),
(6, 'origin_of_symmetry', 'Origin of Symmetry', 'http://www.albumrock.net/dyn_img/pochettes_album/2_150.jpg', 2001),
(7, 'showbiz', 'Showbiz', 'http://www.muse-france.fr/wp-content/uploads/2013/04/1showbiz.jpg', 1999);

-- --------------------------------------------------------

--
-- Structure de la table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `songs`
--

INSERT INTO `songs` (`id`, `slug`, `name`, `time`, `link`) VALUES
(1, 'dead_inside', 'Dead Inside', '4:23', 'https://www.youtube.com/watch?v=aTcJWhmdzpg'),
(2, 'psycho', 'Psycho', '5:16', 'https://www.youtube.com/watch?v=UqLRqzTp6Rk'),
(3, 'mercy', 'Mercy', '3:51', 'https://www.youtube.com/watch?v=yj8Xpdx60Ws'),
(4, 'the_handler', 'The Handler', '4:33', 'https://www.youtube.com/watch?v=BF1DQr5dKW8'),
(5, 'supremacy', 'Supremacy', '4:55', 'https://www.youtube.com/watch?v=avM_UsVo0IA'),
(6, 'uprising', 'Uprising', '5:04', 'https://www.youtube.com/watch?v=w8KQmps-Sog'),
(7, 'take_a_bow', 'Take a Bow', '4:35', 'https://www.youtube.com/watch?v=wQXit0vly2I'),
(8, 'apocalypse_please', 'Apocalypse Please', '4:12', 'https://www.youtube.com/watch?v=YFrl01aPPkA'),
(9, 'new_born', 'New Born', '6:03', 'https://www.youtube.com/watch?v=qhduQhDqtb4'),
(10, 'sunburn', 'Sunburn', '3:54', 'https://www.youtube.com/watch?v=N9SZaOJEWXU');

-- --------------------------------------------------------

--
-- Structure de la table `songs_albums`
--

CREATE TABLE `songs_albums` (
  `id_songs` int(11) NOT NULL,
  `id_albums` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `songs_albums`
--

INSERT INTO `songs_albums` (`id_songs`, `id_albums`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 2),
(6, 3),
(7, 4),
(8, 5),
(9, 6),
(10, 7);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
