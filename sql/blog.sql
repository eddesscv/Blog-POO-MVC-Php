-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 28 oct. 2021 à 07:22
-- Version du serveur :  8.0.21
-- Version de PHP : 7.4.9
SET
    SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
    time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8mb4 */
;

--
-- Base de données : `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

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
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT INTO
    `article` (`id`, `title`, `content`, `author`, `createdAt`)
VALUES
    (
        1,
        'Voici mon premier article',
        'Mon super blog est en construction.',
        'Karim',
        '2020-07-01 08:32:14'
    ),
    (
        2,
        'Un deuxième article',
        'Je continue à ajouter du contenu sur mon blog.',
        'Karim',
        '2020-07-01 11:04:26'
    ),
    (
        3,
        'Mon troisième article',
        'Mon blog est génial !!!',
        'Karim',
        '2020-07-01 14:17:02'
    );

ALTER TABLE
    `article`
ADD
    PRIMARY KEY (`id`);

ALTER TABLE
    `article`
MODIFY
    `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 4;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;

CREATE TABLE `comment` (
    `id` int(11) NOT NULL,
    `pseudo` varchar(100) NOT NULL,
    `content` text NOT NULL,
    `createdAt` datetime NOT NULL,
    `article_id` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT INTO
    `comment` (
        `id`,
        `pseudo`,
        `content`,
        `createdAt`,
        `article_id`
    )
VALUES
    (
        1,
        'Jean',
        'Génial, hâte de voir ce que ça donne !',
        '2020-01-01 10:27:36',
        1
    ),
    (
        2,
        'Nina',
        'Trop cool ! depuis le temps',
        '2020-01-01 13:08:04',
        1
    ),
    (
        3,
        'Rodrigo',
        'Great ! ',
        '2020-01-01 20:21:01',
        1
    ),
    (
        4,
        'Hélène',
        'je suis heureuse de découvrir un super site ! Continuez comme ça ',
        '2020-01-01 15:19:47',
        2
    ),
    (
        5,
        'Moussa',
        'Un peu déçu par le contenu pour le moment...',
        '2020-01-01 15:22:34',
        2
    ),
    (
        6,
        'Barbara',
        'pressée de voir la suite',
        '2020-01-01 22:27:37',
        2
    ),
    (
        7,
        'Paul',
        'Je viens ici pour voir du contenu !',
        '2020-01-01 15:05:59',
        3
    ),
    (
        8,
        'Alexandra',
        'Enfin un blog cool, où on peut surfer en toute tranquilité !',
        '2020-01-01 15:07:07',
        3
    ),
    (
        9,
        'Julien',
        'Je suis fan ! Amateur de contenu !',
        '2020-01-01 16:42:12',
        3
    );

ALTER TABLE
    `comment`
ADD
    PRIMARY KEY (`id`),
ADD
    KEY `fk_article_id` (`article_id`);

ALTER TABLE
    `comment`
MODIFY
    `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 10;

ALTER TABLE
    `comment`
ADD
    CONSTRAINT `fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);