  -- phpMyAdmin SQL Dump
  -- version 5.0.2
  -- https://www.phpmyadmin.net/
  --
  -- Hôte : 127.0.0.1:3306
  -- Généré le : jeu. 28 oct. 2021 à 07:22
  -- Version du serveur :  8.0.21
  -- Version de PHP : 7.4.9

  SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
  START TRANSACTION;
  SET time_zone = "+00:00";


  /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
  /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
  /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
  /*!40101 SET NAMES utf8mb4 */;

  --
  -- Base de données : `blog`
  --

  -- --------------------------------------------------------

  --
  -- Structure de la table `article`
  --

CREATE TABLE `article` (
`id` int(11) NOT NULL,
`title` varchar(100) NOT NULL,
`content` text NOT NULL,
`author` varchar(100) NOT NULL,
`createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `article` (`id`, `title`, `content`, `author`, `createdAt`) VALUES
(1, 'Voici mon premier article', 'Mon super blog est en construction.', 'Karim', '2020-07-01 08:32:14'),
(2, 'Un deuxième article', 'Je continue à ajouter du contenu sur mon blog.', 'Karim', '2020-07-01 11:04:26'),
(3, 'Mon troisième article', 'Mon blog est génial !!!', 'Karim', '2020-07-01 14:17:02');
ALTER TABLE `article`
ADD PRIMARY KEY (`id`);
ALTER TABLE `article`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

  /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
  /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
  /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
