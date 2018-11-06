-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 08 Février 2018 à 11:59
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ehpad`
--
CREATE DATABASE IF NOT EXISTS `ehpad` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ehpad`;

-- --------------------------------------------------------

--
-- Structure de la table `resident`
--

CREATE TABLE `resident` (
  `id` int(11) NOT NULL,
  `room` varchar(56) NOT NULL,
  `name` varchar(56) NOT NULL,
  `weight` varchar(56) NOT NULL,
  `datetime` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `resident`
--

INSERT INTO `resident` (`id`, `room`, `name`, `weight`, `datetime`) VALUES
(1, '101', 'Jean Dupont', '72.3', '2018-02-02 13:17:06.000000'),
(208, '101', 'Jean Dupont', '54.77', '2018-02-02 13:28:35.000000'),
(209, '101', 'Jean Dupont', '54.77', '2018-02-02 13:28:35.000000'),
(210, '101', 'Jean Dupont', '54.77', '2018-02-02 13:28:37.000000'),
(211, '101', 'Jean Dupont', '61.03', '2018-02-02 13:28:37.000000'),
(212, '101', 'Jean Dupont', '61.03', '2018-02-02 13:28:38.000000'),
(213, '101', 'Jean Dupont', '61.03', '2018-02-02 13:28:39.000000'),
(242, '101', 'Jean Dupont', '71.04', '2018-02-02 13:29:29.000000'),
(243, '101', 'Jean Dupont', '71.04', '2018-02-02 13:29:30.000000'),
(244, '101', 'Jean Dupont', '71.04', '2018-02-02 13:29:31.000000'),
(245, '101', 'Jean Dupont', '78.48', '2018-02-02 13:29:31.000000'),
(246, '101', 'Jean Dupont', '78.48', '2018-02-02 13:29:32.000000'),
(247, '101', 'Jean Dupont', '78.48', '2018-02-02 13:29:33.000000'),
(248, '101', 'Jean Dupont', '69.33', '2018-02-02 13:29:33.000000'),
(249, '101', 'Jean Dupont', '69.33', '2018-02-02 13:29:34.000000'),
(250, '101', 'Jean Dupont', '54.19', '2018-02-02 13:29:35.000000'),
(251, '101', 'Jean Dupont', '54.19', '2018-02-02 13:29:35.000000'),
(252, '101', 'Jean Dupont', '54.19', '2018-02-02 13:29:36.000000'),
(264, '101', 'Jean Dupont', '80.1', '2018-02-02 13:30:00.000000'),
(265, '101', 'Jean Dupont', '80.1', '2018-02-02 13:30:00.000000'),
(266, '101', 'Jean Dupont', '80.1', '2018-02-02 13:30:01.000000'),
(267, '101', 'Jean Dupont', '82.07', '2018-02-02 13:30:02.000000'),
(268, '101', 'Jean Dupont', '82.07', '2018-02-02 13:30:02.000000'),
(269, '101', 'Jean Dupont', '82.07', '2018-02-02 13:30:04.000000'),
(325, '101', 'Jean Dupont', '85.54', '2018-02-02 13:30:54.000000'),
(326, '101', 'Jean Dupont', '85.54', '2018-02-02 13:30:54.000000'),
(327, '101', 'Jean Dupont', '85.54', '2018-02-02 13:30:55.000000'),
(476, '101', 'Jean Dupont', '77.54', '2018-02-02 13:43:41.000000'),
(477, '101', 'Jean Dupont', '77.54', '2018-02-02 13:43:42.000000'),
(478, '101', 'Jean Dupont', '77.54', '2018-02-02 13:43:43.000000'),
(506, '101', 'Jean Dupont', '54.73', '2018-02-02 13:44:02.000000'),
(507, '101', 'Jean Dupont', '54.73', '2018-02-02 13:44:02.000000'),
(508, '101', 'Jean Dupont', '54.73', '2018-02-02 13:44:03.000000'),
(509, '101', 'Jean Dupont', '54.74', '2018-02-02 13:44:04.000000'),
(510, '101', 'Jean Dupont', '54.74', '2018-02-02 13:44:04.000000'),
(511, '101', 'Jean Dupont', '54.74', '2018-02-02 13:44:05.000000'),
(512, '101', 'Jean Dupont', '54.73', '2018-02-02 13:44:06.000000'),
(513, '101', 'Jean Dupont', '54.73', '2018-02-02 13:44:06.000000'),
(514, '101', 'Jean Dupont', '54.73', '2018-02-02 13:44:09.000000'),
(515, '101', 'Jean Dupont', '54.73', '2018-02-02 13:44:10.000000'),
(683, '101', 'Jean Dupont', '55.97', '2018-02-02 13:48:43.000000'),
(684, '101', 'Jean Dupont', '55.97', '2018-02-02 13:48:44.000000'),
(685, '101', 'Jean Dupont', '55.96', '2018-02-02 13:48:45.000000'),
(686, '101', 'Jean Dupont', '55.96', '2018-02-02 13:48:45.000000'),
(687, '101', 'Jean Dupont', '55.96', '2018-02-02 13:48:46.000000'),
(688, '101', 'Jean Dupont', '55.96', '2018-02-02 13:48:47.000000'),
(689, '101', 'Jean Dupont', '55.96', '2018-02-02 13:48:47.000000'),
(690, '101', 'Jean Dupont', '55.96', '2018-02-02 13:48:48.000000'),
(691, '101', 'Jean Dupont', '55.96', '2018-02-02 13:48:49.000000'),
(692, '101', 'Jean Dupont', '55.96', '2018-02-02 13:48:49.000000'),
(693, '101', 'Jean Dupont', '55.96', '2018-02-02 13:48:50.000000'),
(694, '101', 'Jean Dupont', '55.94', '2018-02-02 13:48:51.000000'),
(695, '101', 'Jean Dupont', '55.94', '2018-02-02 13:48:51.000000'),
(696, '101', 'Jean Dupont', '55.94', '2018-02-02 13:48:52.000000'),
(697, '101', 'Jean Dupont', '55.96', '2018-02-02 13:48:53.000000'),
(698, '101', 'Jean Dupont', '55.96', '2018-02-02 13:48:53.000000'),
(699, '101', 'Jean Dupont', '55.95', '2018-02-02 13:48:54.000000'),
(700, '101', 'Jean Dupont', '55.95', '2018-02-02 13:48:55.000000'),
(701, '101', 'Jean Dupont', '55.95', '2018-02-02 13:48:56.000000'),
(702, '101', 'Jean Dupont', '55.95', '2018-02-02 13:48:56.000000'),
(703, '101', 'Jean Dupont', '55.95', '2018-02-02 13:48:57.000000'),
(704, '101', 'Jean Dupont', '55.95', '2018-02-02 13:48:58.000000'),
(705, '101', 'Jean Dupont', '55.95', '2018-02-02 13:48:58.000000'),
(706, '101', 'Jean Dupont', '55.95', '2018-02-02 13:48:59.000000'),
(707, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:00.000000'),
(708, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:00.000000'),
(709, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:01.000000'),
(710, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:02.000000'),
(711, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:02.000000'),
(712, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:03.000000'),
(713, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:04.000000'),
(714, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:04.000000'),
(715, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:05.000000'),
(716, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:06.000000'),
(717, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:06.000000'),
(718, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:07.000000'),
(719, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:08.000000'),
(720, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:08.000000'),
(721, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:09.000000'),
(722, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:10.000000'),
(723, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:11.000000'),
(724, '101', 'Jean Dupont', '55.94', '2018-02-02 13:49:12.000000'),
(725, '101', 'Jean Dupont', '55.94', '2018-02-02 13:49:12.000000'),
(726, '101', 'Jean Dupont', '55.94', '2018-02-02 13:49:13.000000'),
(727, '101', 'Jean Dupont', '55.98', '2018-02-02 13:49:13.000000'),
(728, '101', 'Jean Dupont', '55.98', '2018-02-02 13:49:14.000000'),
(729, '101', 'Jean Dupont', '55.98', '2018-02-02 13:49:15.000000'),
(730, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:15.000000'),
(731, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:16.000000'),
(732, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:17.000000'),
(733, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:17.000000'),
(734, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:18.000000'),
(735, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:19.000000'),
(736, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:19.000000'),
(737, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:20.000000'),
(738, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:21.000000'),
(739, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:21.000000'),
(740, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:22.000000'),
(741, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:23.000000'),
(742, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:23.000000'),
(743, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:24.000000'),
(744, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:25.000000'),
(745, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:26.000000'),
(746, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:27.000000'),
(747, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:27.000000'),
(748, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:28.000000'),
(749, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:29.000000'),
(750, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:29.000000'),
(751, '101', 'Jean Dupont', '55.95', '2018-02-02 13:49:30.000000'),
(752, '101', 'Jean Dupont', '56.03', '2018-02-02 13:49:31.000000'),
(753, '101', 'Jean Dupont', '56.03', '2018-02-02 13:49:32.000000'),
(754, '101', 'Jean Dupont', '56.03', '2018-02-02 13:49:33.000000'),
(755, '101', 'Jean Dupont', '56.03', '2018-02-02 13:49:34.000000'),
(781, '101', 'Jean Dupont', '62.8', '2018-02-02 13:49:52.000000'),
(782, '101', 'Jean Dupont', '62.8', '2018-02-02 13:49:52.000000'),
(783, '101', 'Jean Dupont', '62.8', '2018-02-02 13:49:53.000000'),
(784, '101', 'Jean Dupont', '75.6', '2018-02-02 13:49:54.000000'),
(785, '101', 'Jean Dupont', '75.6', '2018-02-02 13:49:54.000000'),
(786, '101', 'Jean Dupont', '75.6', '2018-02-02 13:49:55.000000'),
(787, '101', 'Jean Dupont', '80.55', '2018-02-02 13:49:56.000000'),
(788, '101', 'Jean Dupont', '80.55', '2018-02-02 13:49:56.000000'),
(789, '101', 'Jean Dupont', '80.55', '2018-02-02 13:49:57.000000'),
(790, '101', 'Jean Dupont', '82.96', '2018-02-02 13:49:58.000000'),
(791, '101', 'Jean Dupont', '82.96', '2018-02-02 13:49:58.000000'),
(792, '101', 'Jean Dupont', '82.96', '2018-02-02 13:49:59.000000'),
(793, '101', 'Jean Dupont', '81.08', '2018-02-02 13:49:59.000000'),
(794, '101', 'Jean Dupont', '81.08', '2018-02-02 13:50:00.000000'),
(795, '101', 'Jean Dupont', '80.75', '2018-02-02 13:50:01.000000'),
(796, '101', 'Jean Dupont', '80.75', '2018-02-02 13:50:01.000000'),
(797, '101', 'Jean Dupont', '80.75', '2018-02-02 13:50:02.000000'),
(798, '101', 'Jean Dupont', '79.72', '2018-02-02 13:50:03.000000'),
(799, '101', 'Jean Dupont', '79.72', '2018-02-02 13:50:04.000000'),
(800, '101', 'Jean Dupont', '79.72', '2018-02-02 13:50:05.000000'),
(801, '101', 'Jean Dupont', '79.77', '2018-02-02 13:50:05.000000'),
(802, '101', 'Jean Dupont', '79.77', '2018-02-02 13:50:06.000000'),
(803, '101', 'Jean Dupont', '79.77', '2018-02-02 13:50:07.000000'),
(840, '106', 'Marie Amand', '60.00', '2018-02-06 11:16:35.000000'),
(839, '103', 'George Brassens', '83.10', '2018-02-06 11:16:22.000000'),
(838, '103', 'George Brassens', '83.10', '2018-02-06 11:16:20.000000'),
(837, '104', 'Odile Adam', '63.00', '2018-02-06 11:16:15.000000');

-- --------------------------------------------------------

--
-- Structure de la table `rpi`
--

CREATE TABLE `rpi` (
  `id` int(11) NOT NULL,
  `room` varchar(65) NOT NULL,
  `name` varchar(65) NOT NULL,
  `tare` varchar(65) NOT NULL,
  `get_value` varchar(56) NOT NULL DEFAULT 'No'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `rpi`
--

INSERT INTO `rpi` (`id`, `room`, `name`, `tare`, `get_value`) VALUES
(1, '404', '4040', 'No', 'No'),
(2, '404', '4041', 'No', 'No'),
(3, '404', '4042', 'No', 'No'),
(4, '404', '4043', 'No', 'No'),
(5, '101', '1010', 'No', 'No'),
(6, '101', '1011', 'No', 'No'),
(7, '101', '1012', 'No', 'No'),
(8, '101', '1013', 'No', 'No');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(36) NOT NULL,
  `user` varchar(65) NOT NULL,
  `pass` varchar(65) NOT NULL,
  `name` varchar(65) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `user`, `pass`, `name`) VALUES
(1, 'test', 'test', 'test'),
(2, 'ntest', '1234', 'Ntest');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `resident`
--
ALTER TABLE `resident`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rpi`
--
ALTER TABLE `rpi`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `resident`
--
ALTER TABLE `resident`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=841;
--
-- AUTO_INCREMENT pour la table `rpi`
--
ALTER TABLE `rpi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(36) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;--
-- Base de données :  `greenfuture`
--
CREATE DATABASE IF NOT EXISTS `greenfuture` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `greenfuture`;

-- --------------------------------------------------------

--
-- Structure de la table `lille`
--

CREATE TABLE `lille` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `time` int(6) DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `biometeo` float DEFAULT NULL,
  `precipitation` float DEFAULT NULL,
  `humidite` float DEFAULT NULL,
  `pointderosee` float DEFAULT NULL,
  `vitessevent` float DEFAULT NULL,
  `pression` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `lyon`
--

CREATE TABLE `lyon` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `time` int(6) DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `biometeo` float DEFAULT NULL,
  `precipitation` float DEFAULT NULL,
  `humidite` float DEFAULT NULL,
  `pointderosee` float DEFAULT NULL,
  `vitessevent` float DEFAULT NULL,
  `pression` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `marseille`
--

CREATE TABLE `marseille` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `time` int(6) DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `biometeo` float DEFAULT NULL,
  `precipitation` float DEFAULT NULL,
  `humidite` float DEFAULT NULL,
  `pointderosee` float DEFAULT NULL,
  `vitessevent` float DEFAULT NULL,
  `pression` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `members`
--

CREATE TABLE `members` (
  `id` char(36) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `members`
--

INSERT INTO `members` (`id`, `email`, `password`) VALUES
('a9f54797-d796-4569-a320-fb24af801df8', 'test@test.fr', 'test');

-- --------------------------------------------------------

--
-- Structure de la table `paris`
--

CREATE TABLE `paris` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `time` int(6) DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `biometeo` float DEFAULT NULL,
  `precipitation` float DEFAULT NULL,
  `humidite` float DEFAULT NULL,
  `pointderosee` float DEFAULT NULL,
  `vitessevent` float DEFAULT NULL,
  `pression` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rennes`
--

CREATE TABLE `rennes` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `time` int(6) DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `biometeo` float DEFAULT NULL,
  `precipitation` float DEFAULT NULL,
  `humidite` float DEFAULT NULL,
  `pointderosee` float DEFAULT NULL,
  `vitessevent` float DEFAULT NULL,
  `pression` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `rennes`
--

INSERT INTO `rennes` (`id`, `date`, `time`, `temperature`, `biometeo`, `precipitation`, `humidite`, `pointderosee`, `vitessevent`, `pression`) VALUES
(2458, '2017-04-06 00:00:00', 0, 7.1, 4.9, 0, 90, 5.6, 11, 1031),
(2457, '2017-04-06 01:00:00', 1, 5.8, 3.4, 0, 93, 4.8, 11, 1031.1),
(2456, '2017-04-06 02:00:00', 2, 5.4, 3.8, 0, 95, 4.7, 7, 1031.1),
(2455, '2017-04-06 03:00:00', 3, 5.4, 3.8, 0, 97, 5, 7, 1030.8),
(2454, '2017-04-06 04:00:00', 4, 4.8, 4.8, 0, 98, 4.5, 0, 1030.6),
(2453, '2017-04-06 05:00:00', 5, 3.9, 3.5, 0, 98, 3.6, 4, 1030.6),
(2452, '2017-04-06 06:00:00', 6, 3.4, 2.9, 0, 99, 3.3, 4, 1030.7),
(2451, '2017-04-06 07:00:00', 7, 3.1, 2.6, 0, 99, 3, 4, 1030.6),
(2450, '2017-04-06 08:00:00', 8, 2.7, 2.1, 0, 99, 2.6, 4, 1031.2),
(2449, '2017-04-06 09:00:00', 9, 4.1, 3.7, 0, 100, 4.1, 4, 1031.6),
(2448, '2017-04-06 10:00:00', 10, 7.7, 7.6, 0, 99, 7.6, 4, 1031.4),
(2447, '2017-04-06 11:00:00', 11, 11.7, 0, 0, 73, 7, 7, 1031.5),
(2446, '2017-04-06 12:00:00', 12, 14.3, 0, 0, 56, 5.6, 14, 1031.1),
(2445, '2017-04-06 13:00:00', 13, 14.8, 0, 0, 50, 4.5, 14, 1030.7),
(2444, '2017-04-06 14:00:00', 14, 15.7, 0, 0, 50, 5.3, 14, 1030.1),
(2443, '2017-04-06 15:00:00', 15, 16.1, 0, 0, 49, 5.4, 14, 1029.5),
(2442, '2017-04-06 16:00:00', 16, 16.7, 0, 0, 51, 6.5, 14, 1029),
(2441, '2017-04-06 17:00:00', 17, 16.4, 0, 0, 52, 6.5, 22, 1028.5),
(2440, '2017-04-06 18:00:00', 18, 16.1, 0, 0, 53, 6.5, 18, 1028.2),
(2439, '2017-04-06 19:00:00', 19, 15, 0, 0, 57, 6.5, 18, 1028.1),
(2438, '2017-04-06 20:00:00', 20, 13.4, 0, 0, 61, 6, 22, 1028.1),
(2437, '2017-04-06 21:00:00', 21, 11.2, 0, 0, 69, 5.7, 11, 1028.4),
(2436, '2017-04-06 22:00:00', 22, 10, 8.4, 0, 75, 5.8, 11, 1028.8),
(2435, '2017-04-06 23:00:00', 23, 9.1, 7, 0, 82, 6.2, 13, 1029),
(2434, '2017-04-05 02:00:00', 2, 9.2, 7.5, 0, 97, 8.7, 11, 1028.9),
(2433, '2017-04-05 03:00:00', 3, 10.2, 0, 0, 93, 9.1, 11, 1028.9),
(2432, '2017-04-05 04:00:00', 4, 10.3, 0, 0, 93, 9.2, 4, 1028.9),
(2431, '2017-04-05 05:00:00', 5, 10.6, 0, 0, 94, 9.7, 7, 1028.8),
(2430, '2017-04-05 06:00:00', 6, 9.5, 9.5, 0, 94, 8.6, 4, 1028.9),
(2429, '2017-04-05 07:00:00', 7, 8.5, 8.5, 0, 97, 8.1, 4, 1029),
(2428, '2017-04-05 08:00:00', 8, 9.6, 8.6, 0, 98, 9.3, 7, 1029.6),
(2427, '2017-04-05 09:00:00', 9, 10.7, 0, 0, 92, 9.5, 7, 1030),
(2426, '2017-04-05 10:00:00', 10, 11.6, 0, 0, 89, 9.8, 11, 1030.5),
(2425, '2017-04-05 11:00:00', 11, 13.2, 0, 0, 81, 10, 18, 1030.9),
(2424, '2017-04-05 12:00:00', 12, 15.2, 0, 0, 70, 9.8, 14, 1030.5),
(2423, '2017-04-05 13:00:00', 13, 15.8, 0, 0, 61, 8.3, 18, 1030.5),
(2422, '2017-04-05 14:00:00', 14, 16, 0, 0, 58, 7.7, 22, 1030.5),
(2421, '2017-04-05 15:00:00', 15, 15, 0, 0, 59, 7, 25, 1030.2),
(2420, '2017-04-05 16:00:00', 16, 16.4, 0, 0, 52, 6.5, 22, 1029.8),
(2419, '2017-04-05 17:00:00', 17, 15.5, 0, 0, 52, 5.7, 22, 1029.5),
(2418, '2017-04-05 18:00:00', 18, 14.9, 0, 0, 56, 6.2, 22, 1029.4),
(2417, '2017-04-05 19:00:00', 19, 14.2, 0, 0, 59, 6.3, 22, 1029.4),
(2416, '2017-04-05 20:00:00', 20, 12.3, 0, 0, 69, 6.8, 18, 1029.8),
(2415, '2017-04-05 21:00:00', 21, 10.3, 0, 0, 74, 5.9, 14, 1030.3),
(2414, '2017-04-05 22:00:00', 22, 9.1, 6.8, 0, 77, 5.3, 14, 1030.8),
(2413, '2017-04-05 23:00:00', 23, 7.7, 5.7, 0, 86, 5.5, 11, 1031),
(2412, '2017-04-05 00:00:00', 0, 7.1, 4.9, 0, 90, 5.6, 11, 1031),
(2411, '2017-04-05 01:00:00', 1, 5.8, 3.4, 0, 93, 4.8, 11, 1031.1),
(2410, '2017-04-04 02:00:00', 2, 8.5, 8.5, 0, 83, 5.8, 4, 1026.4),
(2409, '2017-04-04 03:00:00', 3, 7.3, 5.2, 0, 84, 4.8, 11, 1026.1),
(2408, '2017-04-04 04:00:00', 4, 6.8, 5.4, 0, 88, 4.9, 7, 1026.1),
(2407, '2017-04-04 05:00:00', 5, 7, 6.9, 0, 89, 5.3, 4, 1026),
(2406, '2017-04-04 06:00:00', 6, 7.2, 7.1, 0, 91, 5.8, 4, 1025.8),
(2405, '2017-04-04 07:00:00', 7, 7.7, 7.6, 0, 91, 6.3, 4, 1025.7),
(2404, '2017-04-04 08:00:00', 8, 8.4, 7.2, 0, 93, 7.3, 7, 1025.8),
(2403, '2017-04-04 09:00:00', 9, 9.1, 9.1, 0.4, 98, 8.8, 4, 1026),
(2402, '2017-04-04 10:00:00', 10, 10.1, 0, 0.2, 98, 9.8, 7, 1026.1),
(2401, '2017-04-04 11:00:00', 11, 11, 0, 0, 87, 8.9, 18, 1026.4),
(2400, '2017-04-04 12:00:00', 12, 12.3, 0, 0, 81, 9.1, 18, 1026.8),
(2399, '2017-04-04 13:00:00', 13, 12.6, 0, 0, 74, 8.1, 22, 1026.9),
(2398, '2017-04-04 14:00:00', 14, 12.5, 0, 0, 70, 7.2, 18, 1026.9),
(2397, '2017-04-04 15:00:00', 15, 12.7, 0, 0, 71, 7.6, 14, 1026.6),
(2396, '2017-04-04 16:00:00', 16, 12.8, 0, 0, 69, 7.2, 18, 1026.4),
(2395, '2017-04-04 17:00:00', 17, 12.5, 0, 0, 69, 7, 22, 1026.3),
(2394, '2017-04-04 18:00:00', 18, 13, 0, 0, 70, 7.7, 18, 1026.3),
(2393, '2017-04-04 19:00:00', 19, 12.9, 0, 0, 70, 7.6, 19, 1026.4),
(2392, '2017-04-04 20:00:00', 20, 12.1, 0, 0, 76, 8, 18, 1026.7),
(2391, '2017-04-04 21:00:00', 21, 11.3, 0, 0, 86, 9, 18, 1027.1),
(2390, '2017-04-04 22:00:00', 22, 10.9, 0, 0, 88, 9, 14, 1027.6),
(2389, '2017-04-04 23:00:00', 23, 10.6, 0, 0, 90, 9, 14, 1028.1),
(2388, '2017-04-04 00:00:00', 0, 9.7, 8, 0, 92, 8.5, 11, 1028.5),
(2387, '2017-04-04 01:00:00', 1, 9.1, 7.3, 0, 96, 8.5, 11, 1028.7),
(2386, '2017-04-03 02:00:00', 2, 6.2, 6, 0, 99, 6.1, 4, 1026.8),
(2385, '2017-04-03 03:00:00', 3, 5.7, 5.4, 0, 99, 5.6, 4, 1026.7),
(2384, '2017-04-03 04:00:00', 4, 5, 3.3, 0, 99, 4.9, 7, 1026.6),
(2383, '2017-04-03 05:00:00', 5, 6.1, 5.9, 0, 100, 6.1, 4, 1026.4),
(2382, '2017-04-03 06:00:00', 6, 5.8, 5.8, 0, 99, 5.7, 0, 1026.4),
(2381, '2017-04-03 07:00:00', 7, 6, 6, 0, 99, 5.9, 0, 1026.3),
(2380, '2017-04-03 08:00:00', 8, 5.6, 5.3, 0, 99, 5.5, 4, 1026.7),
(2379, '2017-04-03 09:00:00', 9, 5.6, 5.6, 0, 100, 5.6, 0, 1027.1),
(2378, '2017-04-03 10:00:00', 10, 6.5, 6.5, 0, 100, 6.5, 0, 1027.3),
(2377, '2017-04-03 11:00:00', 11, 8.7, 8.7, 0, 99, 8.6, 4, 1027.5),
(2376, '2017-04-03 12:00:00', 12, 12.1, 0, 0, 88, 10.2, 4, 1027.3),
(2375, '2017-04-03 13:00:00', 13, 15.3, 0, 0, 65, 8.8, 7, 1026.8),
(2374, '2017-04-03 14:00:00', 14, 17.2, 0, 0, 51, 7, 14, 1026.4),
(2373, '2017-04-03 15:00:00', 15, 17.5, 0, 0, 48, 6.4, 14, 1026.2),
(2372, '2017-04-03 16:00:00', 16, 18, 0, 0, 48, 6.8, 14, 1026.1),
(2371, '2017-04-03 17:00:00', 17, 17.7, 0, 0, 47, 6.2, 4, 1025.7),
(2370, '2017-04-03 18:00:00', 18, 17.9, 0, 0, 46, 6.1, 11, 1025.3),
(2369, '2017-04-03 19:00:00', 19, 16.5, 0, 0, 49, 5.7, 11, 1025.4),
(2368, '2017-04-03 20:00:00', 20, 14.5, 0, 0, 54, 5.3, 11, 1025.4),
(2367, '2017-04-03 21:00:00', 21, 12.6, 0, 0, 62, 5.5, 7, 1025.6),
(2366, '2017-04-03 22:00:00', 22, 11.7, 0, 0, 66, 5.6, 7, 1025.9),
(2365, '2017-04-03 23:00:00', 23, 10.4, 0, 0, 72, 5.6, 7, 1026.4),
(2364, '2017-04-03 00:00:00', 0, 9.7, 8.7, 0, 75, 5.5, 7, 1026.8),
(2363, '2017-04-03 01:00:00', 1, 9.4, 8.4, 0, 78, 5.8, 7, 1026.9),
(2362, '2017-04-02 02:00:00', 2, 8.7, 6.9, 0, 92, 7.5, 11, 1017.2),
(2361, '2017-04-02 03:00:00', 3, 8.9, 7.1, 0, 93, 7.8, 11, 1017.6),
(2360, '2017-04-02 04:00:00', 4, 9.1, 7.3, 0.2, 96, 8.5, 11, 1017.8),
(2359, '2017-04-02 05:00:00', 5, 9.1, 8, 0.4, 97, 8.6, 7, 1018.1),
(2358, '2017-04-02 06:00:00', 6, 9.3, 7.6, 0.2, 96, 8.7, 11, 1018.5),
(2357, '2017-04-02 07:00:00', 7, 9.3, 7.6, 0, 95, 8.5, 11, 1019.3),
(2356, '2017-04-02 08:00:00', 8, 9.2, 8.2, 0, 95, 8.4, 7, 1020.1),
(2355, '2017-04-02 09:00:00', 9, 9.8, 7.6, 0, 87, 7.7, 14, 1021),
(2354, '2017-04-02 10:00:00', 10, 10.5, 0, 0, 87, 8.4, 11, 1021.7),
(2353, '2017-04-02 11:00:00', 11, 11, 0, 0, 81, 7.9, 14, 1022.4),
(2352, '2017-04-02 12:00:00', 12, 12.4, 0, 0, 76, 8.3, 11, 1022.9),
(2351, '2017-04-02 13:00:00', 13, 13.3, 0, 0, 69, 7.7, 14, 1023.1),
(2350, '2017-04-02 14:00:00', 14, 13.7, 0, 0, 65, 7.2, 18, 1023.2),
(2349, '2017-04-02 15:00:00', 15, 14.2, 0, 0, 64, 7.5, 14, 1023.3),
(2348, '2017-04-02 16:00:00', 16, 15.1, 0, 0, 59, 7.1, 7, 1023.3),
(2347, '2017-04-02 17:00:00', 17, 14.7, 0, 0, 63, 7.7, 11, 1023.5),
(2346, '2017-04-02 18:00:00', 18, 16, 0, 0, 57, 7.5, 7, 1023.3),
(2345, '2017-04-02 19:00:00', 19, 14.5, 0, 0, 61, 7.1, 11, 1023.9),
(2344, '2017-04-02 20:00:00', 20, 14, 0, 0, 65, 7.5, 14, 1024.4),
(2343, '2017-04-02 21:00:00', 21, 11.4, 0, 0, 76, 7.3, 11, 1024.9),
(2342, '2017-04-02 22:00:00', 22, 10, 9.5, 0, 85, 7.6, 6, 1025.7),
(2341, '2017-04-02 23:00:00', 23, 7.9, 7.9, 0, 91, 6.5, 4, 1026.5),
(2340, '2017-04-02 00:00:00', 0, 6.5, 5, 0, 97, 6.1, 7, 1026.9),
(2339, '2017-04-02 01:00:00', 1, 6.7, 6.5, 0, 99, 6.6, 4, 1027);

-- --------------------------------------------------------

--
-- Structure de la table `searchs`
--

CREATE TABLE `searchs` (
  `id` int(20) NOT NULL,
  `member_id` char(36) CHARACTER SET utf8 NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `ville` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `lille`
--
ALTER TABLE `lille`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lyon`
--
ALTER TABLE `lyon`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `marseille`
--
ALTER TABLE `marseille`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `paris`
--
ALTER TABLE `paris`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rennes`
--
ALTER TABLE `rennes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `searchs`
--
ALTER TABLE `searchs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `lille`
--
ALTER TABLE `lille`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;
--
-- AUTO_INCREMENT pour la table `lyon`
--
ALTER TABLE `lyon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT pour la table `marseille`
--
ALTER TABLE `marseille`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT pour la table `paris`
--
ALTER TABLE `paris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `rennes`
--
ALTER TABLE `rennes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2459;--
-- Base de données :  `sportmanager`
--
CREATE DATABASE IF NOT EXISTS `sportmanager` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sportmanager`;

-- --------------------------------------------------------

--
-- Structure de la table `bonds`
--

CREATE TABLE `bonds` (
  `id` int(11) NOT NULL,
  `member_id` char(36) NOT NULL,
  `member2_id` char(36) NOT NULL,
  `trusted` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `contests`
--

CREATE TABLE `contests` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `member_id` char(36) NOT NULL,
  `serial` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `trusted` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `devices`
--

INSERT INTO `devices` (`id`, `member_id`, `serial`, `description`, `trusted`) VALUES
(1, '56eb38a4-ee50-421f-bf6e-26beb38f37ff', 'serial123', 'premier device validÃ©', 1),
(2, '56eb38a4-ee50-421f-bf6e-26beb38f37ff', 'serial456', 'second device pas encore validÃ©', 1),
(3, '0223f9b3-dff5-4130-9756-32608bcbc9e7', '666', 'not trust', 1),
(4, '0223f9b3-dff5-4130-9756-32608bcbc9e7', '666', 'not trust', 1),
(5, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', '555', 'enorme', 1),
(6, '0223f9b3-dff5-4130-9756-32608bcbc9e7', '755', 'meca', 1),
(9, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', '666', 'Satan', 1),
(8, '1cb61ad8-57a6-4a54-99e2-928400640694', '666', 'Dodo', 0),
(10, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', '755', 'djthg', 0);

-- --------------------------------------------------------

--
-- Structure de la table `earnings`
--

CREATE TABLE `earnings` (
  `id` int(11) NOT NULL,
  `member_id` char(36) NOT NULL,
  `sticker_id` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `earnings`
--

INSERT INTO `earnings` (`id`, `member_id`, `sticker_id`, `date`) VALUES
(2, '56eb38a4-ee50-421f-bf6e-26beb38f37ff', 1, '2016-03-13 09:00:00'),
(1, '56eb38a4-ee50-421f-bf6e-26beb38f37ff', 4, '2016-03-13 08:16:00'),
(3, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', 5, '2017-03-27 12:14:11'),
(4, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', 5, '2017-03-27 18:20:07'),
(5, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', 5, '2017-03-27 18:21:43'),
(6, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', 5, '2017-03-27 18:21:57'),
(7, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', 5, '2017-03-27 18:24:07'),
(8, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', 5, '2017-03-27 18:27:43'),
(9, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', 5, '2017-03-27 18:28:48'),
(10, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', 5, '2017-03-27 18:30:49'),
(11, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', 5, '2017-03-27 18:31:59'),
(12, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', 5, '2017-03-27 18:32:39'),
(13, '0223f9b3-dff5-4130-9756-32608bcbc9e7', 6, '2017-04-03 09:52:54');

-- --------------------------------------------------------

--
-- Structure de la table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `member_id` char(36) NOT NULL,
  `workout_id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `location_latitude` float NOT NULL,
  `location_logitude` float NOT NULL,
  `log_type` varchar(45) NOT NULL,
  `log_value` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `logs`
--

INSERT INTO `logs` (`id`, `member_id`, `workout_id`, `device_id`, `date`, `location_latitude`, `location_logitude`, `log_type`, `log_value`) VALUES
(1, '56eb38a4-ee50-421f-bf6e-26beb38f37ff', 1, 1, '2016-03-13 08:16:00', 48.49, 2.26, 'Pas couru', 2640),
(2, '56eb38a4-ee50-421f-bf6e-26beb38f37ff', 1, 1, '2016-03-13 07:11:00', 48.49, 2.26, 'Pompes', 74),
(3, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', 2, 1, '2017-03-26 14:12:00', 455, 488, 'Basket', 56),
(4, '0223f9b3-dff5-4130-9756-32608bcbc9e7', 3, 1, '2017-03-26 14:30:00', 455, 400, 'Basket', 70),
(5, '0223f9b3-dff5-4130-9756-32608bcbc9e7', 1, 1, '2017-03-26 20:11:00', 455, 444, 'Basket', 12),
(6, '0223f9b3-dff5-4130-9756-32608bcbc9e7', 1, 1, '2017-03-26 20:28:00', 788, 500, 'Basket', 45),
(7, '0223f9b3-dff5-4130-9756-32608bcbc9e7', 3, 0, '2017-03-26 20:35:00', 422, 488, 'Velo', 42),
(8, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', 0, 0, '2017-03-27 12:07:00', 455, 400, 'Natation', 15),
(9, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', 0, 0, '2017-03-27 12:07:00', 700, 600, 'Ping pong', 11),
(10, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', 6, 5, '2017-03-27 18:32:00', 455, 600, 'voler', 42);

-- --------------------------------------------------------

--
-- Structure de la table `members`
--

CREATE TABLE `members` (
  `id` char(36) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `members`
--

INSERT INTO `members` (`id`, `email`, `password`) VALUES
('56eb38a4-ee50-421f-bf6e-26beb38f37ff', 'user1@test.fr', 'pass'),
('56eb38b4-04b0-4667-ba54-0796b38f37ff', 'user2@test.fr', 'pass'),
('56eb38c1-e384-48c1-a0bc-33f1b38f37ff', 'user3@test.fr', 'pass'),
('58c69b73-3918-4674-977a-2b58c506def9', 'user@test.fr', '4bc1ac0a06dc8942cfb37782ce5ad19de8bf7043'),
('58c69b73-ab14-4458-afe0-2b58c506def9', 'user@test.fr', '4bc1ac0a06dc8942cfb37782ce5ad19de8bf7043'),
('0223f9b3-dff5-4130-9756-32608bcbc9e7', 'test@test.fr', 'test'),
('a2ff9f37-e173-4c80-9d8d-26c259d32695', 'boss@boss.fr', 'boss'),
('1cb61ad8-57a6-4a54-99e2-928400640694', 'bigbrother@bb.fr', 'big');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `member_id` char(36) NOT NULL,
  `member2_id` char(36) NOT NULL,
  `date` datetime NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `read` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `stickers`
--

CREATE TABLE `stickers` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `stickers`
--

INSERT INTO `stickers` (`id`, `name`, `description`) VALUES
(6, 'Log Or', '5eme Log enregistres'),
(5, 'Log Argent', '3eme Log enregistres'),
(4, 'Log Bronze', '1er Log enregistre'),
(3, 'Seance Or', '5eme Seance enregistrees'),
(2, 'Seance Argent', '3eme Seance enregistrees'),
(1, 'Seance Bronze', '1ere Seance enregistree');

-- --------------------------------------------------------

--
-- Structure de la table `workouts`
--

CREATE TABLE `workouts` (
  `id` int(11) NOT NULL,
  `member_id` char(36) NOT NULL,
  `date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `location_name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `sport` varchar(45) NOT NULL,
  `contest_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `workouts`
--

INSERT INTO `workouts` (`id`, `member_id`, `date`, `end_date`, `location_name`, `description`, `sport`, `contest_id`) VALUES
(1, '56eb38a4-ee50-421f-bf6e-26beb38f37ff', '2016-03-13 06:00:00', '2016-03-13 09:00:00', 'Paris - Vincennes', 'SÃ©ance du dimanche matin', 'Course', NULL),
(2, '56eb38a4-ee50-421f-bf6e-26beb38f37ff', '2017-04-30 10:00:00', '2017-04-30 11:00:00', 'Paris - buttes chaumont', 'SÃ©ance prÃ©vue', 'Entrainement', NULL),
(3, '0223f9b3-dff5-4130-9756-32608bcbc9e7', '2017-03-26 00:00:00', '2017-03-26 01:00:00', 'Paris', 'Dodo', 'Dormir', NULL),
(4, '0223f9b3-dff5-4130-9756-32608bcbc9e7', '2017-03-26 11:53:00', '2017-03-26 11:53:00', 'Paris', 'Street', 'Basket', NULL),
(5, '0223f9b3-dff5-4130-9756-32608bcbc9e7', '2017-03-26 11:53:00', '2017-03-26 11:53:00', 'Paris', 'Street', 'Basket', NULL),
(6, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', '2017-03-26 12:32:00', '2017-03-26 12:32:00', 'Paris', '3pts', 'Basket', NULL),
(7, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', '2017-03-26 13:19:00', '2017-03-26 13:19:00', 'Paris', 'pompes', 'muscu', NULL),
(8, '0223f9b3-dff5-4130-9756-32608bcbc9e7', '2017-03-26 17:24:00', '2017-03-26 17:24:00', 'Paris', '3pts', 'Basket', NULL),
(9, '0223f9b3-dff5-4130-9756-32608bcbc9e7', '2017-03-27 11:55:00', '2017-03-27 11:55:00', 'Paris', 'Libre', 'Natation', NULL),
(10, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', '2017-03-27 12:11:00', '2017-03-27 12:11:00', 'Villejuif', 'Dodo', 'Dormir', NULL),
(11, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', '2017-03-27 12:14:00', '2017-03-27 12:14:00', 'Paris', 'projet', 'Web', NULL),
(12, 'a2ff9f37-e173-4c80-9d8d-26c259d32695', '2017-03-27 12:14:00', '2017-03-27 12:14:00', 'Partout', 'Le meilleur', 'Partout', NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `bonds`
--
ALTER TABLE `bonds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bonds_id1_idx` (`member_id`),
  ADD KEY `bonds_id2_idx` (`member2_id`);

--
-- Index pour la table `contests`
--
ALTER TABLE `contests`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devices_id1_idx` (`member_id`);

--
-- Index pour la table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `earnings_id1_idx` (`member_id`),
  ADD KEY `earnings_id2_idx` (`sticker_id`);

--
-- Index pour la table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logs_id1_idx` (`member_id`),
  ADD KEY `logs_id2_idx` (`workout_id`),
  ADD KEY `logs_id3_idx` (`device_id`);

--
-- Index pour la table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_id1_idx` (`member_id`),
  ADD KEY `messages_id2_idx` (`member2_id`);

--
-- Index pour la table `stickers`
--
ALTER TABLE `stickers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `workouts`
--
ALTER TABLE `workouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_id_idx` (`member_id`),
  ADD KEY `sessions_id1_idx` (`contest_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `bonds`
--
ALTER TABLE `bonds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `contests`
--
ALTER TABLE `contests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `stickers`
--
ALTER TABLE `stickers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `workouts`
--
ALTER TABLE `workouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
