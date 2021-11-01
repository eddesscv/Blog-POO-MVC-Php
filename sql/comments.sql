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