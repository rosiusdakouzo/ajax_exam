-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : ven. 14 juin 2024 à 20:48
-- Version du serveur : 10.6.5-MariaDB
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `football_scores`
--

-- --------------------------------------------------------

--
-- Structure de la table `matches`
--

DROP TABLE IF EXISTS `matches`;
CREATE TABLE IF NOT EXISTS `matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_home_id` int(11) NOT NULL,
  `team_away_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_home_id` (`team_home_id`),
  KEY `team_away_id` (`team_away_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `matches`
--

INSERT INTO `matches` (`id`, `team_home_id`, `team_away_id`, `date`) VALUES
(1, 1, 2, '2024-06-15 15:00:00'),
(2, 1, 3, '2024-06-16 16:00:00'),
(3, 1, 4, '2024-06-17 17:00:00'),
(4, 1, 5, '2024-06-18 18:00:00'),
(5, 2, 1, '2024-06-19 19:00:00'),
(6, 2, 3, '2024-06-20 20:00:00'),
(7, 2, 4, '2024-06-21 21:00:00'),
(8, 2, 5, '2024-06-22 22:00:00'),
(9, 3, 1, '2024-06-23 23:00:00'),
(10, 3, 2, '2024-06-24 10:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `scores`
--

DROP TABLE IF EXISTS `scores`;
CREATE TABLE IF NOT EXISTS `scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `score_home` int(11) NOT NULL,
  `score_away` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `match_id` (`match_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `scores`
--

INSERT INTO `scores` (`id`, `match_id`, `score_home`, `score_away`, `timestamp`) VALUES
(5, 1, 2, 1, '2024-06-14 21:07:25'),
(6, 2, 1, 2, '2024-06-14 21:07:25'),
(7, 3, 3, 0, '2024-06-14 21:07:25'),
(8, 4, 0, 1, '2024-06-14 21:07:25'),
(9, 5, 2, 2, '2024-06-14 21:07:25'),
(10, 6, 1, 0, '2024-06-14 21:07:25'),
(11, 7, 2, 1, '2024-06-14 21:07:25'),
(12, 8, 3, 2, '2024-06-14 21:07:25'),
(13, 9, 1, 3, '2024-06-14 21:07:25'),
(14, 10, 0, 2, '2024-06-14 21:07:25'),
(15, 11, 2, 0, '2024-06-14 21:07:25'),
(16, 12, 1, 1, '2024-06-14 21:07:25'),
(17, 13, 1, 0, '2024-06-14 21:07:25'),
(18, 14, 0, 1, '2024-06-14 21:07:25'),
(19, 15, 2, 2, '2024-06-14 21:07:25'),
(20, 16, 0, 1, '2024-06-14 21:07:25'),
(21, 17, 2, 0, '2024-06-14 21:07:25'),
(22, 18, 1, 1, '2024-06-14 21:07:25'),
(23, 19, 3, 1, '2024-06-14 21:07:25'),
(24, 20, 0, 3, '2024-06-14 21:07:25'),
(26, 0, 2, 4, '2024-06-14 20:44:22'),
(27, 0, 10, 4, '2024-06-14 20:44:31');

-- --------------------------------------------------------

--
-- Structure de la table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `teams`
--

INSERT INTO `teams` (`id`, `name`, `city`) VALUES
(1, 'ASPAC Football CLUB', 'Cotonou'),
(2, 'Buffles FC', 'Parakou'),
(3, 'Avrankou Omnisport FC', 'Avrankou'),
(4, 'AS Tonnerre FC', 'Bohicon'),
(5, 'Loto-Popo FC', 'Grand-Popo');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
