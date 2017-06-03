-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Sam 03 Juin 2017 à 16:45
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
(1, 'drones', 'Drones', 'MuseDronesCover.jpg', 2015),
(2, 'the_2nd_law', 'The 2nd Law', 'The_2nd_Law.jpg', 2012),
(3, 'the_resistance', 'The Resistance', 'muse-the-resistance-front.jpg', 2009),
(4, 'black_holes_and_revelations', 'Black Holes and Revelations', 'Muse-Black-holes-and-revelation.jpg', 2006),
(5, 'absolution', 'Absolution', '76d9d3dc96e6ae51c01b4651c062947c.jpeg', 2003),
(6, 'origin_of_symmetry', 'Origin of Symmetry', '2_150.jpg', 2001),
(7, 'showbiz', 'Showbiz', '1showbiz.jpg', 1999);

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
(10, 'sunburn', 'Sunburn', '3:54', 'https://www.youtube.com/watch?v=N9SZaOJEWXU'),
(11, 'drill_sergeant', 'Drill Sergeant', '0:21', 'https://www.youtube.com/watch?v=uLOec6g1Pvw'),
(12, 'reapers', 'Reapers', '5:59', 'https://www.youtube.com/watch?v=gcNEC9NaJuE'),
(13, 'jfk', 'JFK', '0:54', 'https://www.youtube.com/watch?v=B2C2XeG0lSE'),
(14, 'defector', 'Defector', '4:32', 'https://www.youtube.com/watch?v=kzbFxLNpguM'),
(15, 'revolt', 'Revolt', '4:05', 'https://www.youtube.com/watch?v=91fQTXrSRZE'),
(16, 'aftermath', 'Aftermath', '5:48', 'https://www.youtube.com/watch?v=YkB9a_DR-7A'),
(17, 'the_globalist', 'The Globalist', '10:07', 'https://www.youtube.com/watch?v=4qagaaZfwXA'),
(18, 'drones', 'Drones', '2:51', 'https://www.youtube.com/watch?v=cE8JlFjzfdQ'),
(19, 'madness', 'Madness', '4:40', 'https://www.youtube.com/watch?v=Ek0SgwWmF9w'),
(20, 'panic_station', 'Panic Station', '3:04', 'https://www.youtube.com/watch?v=6uBK5kvakD8'),
(21, 'prelude', 'Prelude', '0:58', 'https://www.youtube.com/watch?v=gsmQioPt2x0'),
(22, 'survival', 'Survival', '4:17', 'https://www.youtube.com/watch?v=bKFhS0cQLE8'),
(23, 'follow_me', 'Follow Me', '3:51', 'https://www.youtube.com/watch?v=Qiu3rvYveSg'),
(24, 'animals', 'Animals', '4:23', 'https://www.youtube.com/watch?v=tFG_5PBl2K8'),
(25, 'explorers', 'Explorers', '5:47', 'https://www.youtube.com/watch?v=TLsxkxh8Ns0'),
(26, 'big_freeze', 'Big Freeze', '4:40', 'https://www.youtube.com/watch?v=ftHMy7TbH-E'),
(27, 'save_me', 'Save Me', '5:09', 'https://www.youtube.com/watch?v=zV8yLLphihk'),
(28, 'liquid_state', 'Liquid State', '3:03', 'https://www.youtube.com/watch?v=lDjSDqkyQeA'),
(29, 'the_2nd_law_unsustainable', 'The 2nd Law: Unsustainable', '3:48', 'https://www.youtube.com/watch?v=EF_xdvn52As'),
(30, 'the_2nd_law_isolated_system', 'The 2nd Law: Isolated System', '5:00', 'https://www.youtube.com/watch?v=VXPoJAyeF8k');

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
(10, 7),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
