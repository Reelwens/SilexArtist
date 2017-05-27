-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Sam 27 Mai 2017 à 17:10
-- Version du serveur :  5.6.35
-- Version de PHP :  7.0.15

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

-- --------------------------------------------------------

--
-- Structure de la table `songs_types`
--

CREATE TABLE `songs_types` (
  `id_albums` int(11) NOT NULL,
  `id_songs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Index pour la table `songs_types`
--
ALTER TABLE `songs_types`
  ADD UNIQUE KEY `id_albums` (`id_albums`),
  ADD UNIQUE KEY `id_songs` (`id_songs`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
