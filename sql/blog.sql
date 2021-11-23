-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : Dim 21 nov. 2021 à 16:22
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

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `imgUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `chapo` text,
  `content` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `title`, `imgUrl`, `chapo`, `content`, `createdAt`, `updatedAt`, `user_id`) VALUES
(20, 'PHP', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/PHP-logo.svg/131px-PHP-logo.svg.png', 'PHP: Hypertext Preprocessor28, plus connu sous son sigle PHP (sigle auto-référentiel), est un langage de programmation libre29, principalement utilisé pour produire des pages Web dynamiques via un serveur HTTP28, mais pouvant également fonctionner comme n\'importe quel langage interprété de façon locale. PHP est un langage impératif orienté objet.', 'PHP a permis de créer un grand nombre de sites web célèbres, comme Facebook et Wikipédia30. Il est considéré comme une des bases de la création de sites web dits dynamiques mais également des applications web.\r\n\r\nPrésentation\r\nPHP est un langage de script utilisé le plus souvent côté serveur : dans cette architecture, le serveur interprète le code PHP des pages web demandées et génère du code (HTML, XHTML, CSS par exemple) et des données (JPEG, GIF, PNG par exemple) pouvant être interprétés et rendus par un navigateur web. PHP peut également générer d\'autres formats comme le WML, le SVG et le PDF.\r\n\r\nIl a été conçu pour permettre la création d\'applications dynamiques, le plus souvent développées pour le Web. PHP est le plus souvent couplé à un serveur Apache bien qu\'il puisse être installé sur la plupart des serveurs HTTP tels que IIS ou nginx. Ce couplage permet de récupérer des informations issues d\'une base de données, d\'un système de fichiers (contenu de fichiers et de l\'arborescence) ou plus simplement des données envoyées par le navigateur afin d\'être interprétées ou stockées pour une utilisation ultérieure.\r\n\r\nC\'est un langage peu typé et souple et donc facile à apprendre par un débutant mais, de ce fait, des failles de sécurité peuvent rapidement apparaître dans les applications. Pragmatique, PHP ne s\'encombre pas de théorie et a tendance à choisir le chemin le plus direct. Néanmoins, le nom des fonctions (ainsi que le passage des arguments) ne respecte pas toujours une logique uniforme, ce qui peut être préjudiciable à l\'apprentissage.\r\n\r\nSon utilisation commence avec le traitement des formulaires puis par l\'accès aux bases de données. L\'accès aux bases de données est aisé une fois l\'installation des modules correspondants effectuée sur le serveur. La force la plus évidente de ce langage est qu\'il a permis au fil du temps la résolution aisée de problèmes autrefois compliqués et est devenu par conséquent un composant incontournable des offres d\'hébergements.\r\n\r\nIl est multi-plateforme : autant sur Linux qu\'avec Windows il permet aisément de reconduire le même code sur un environnement à peu près semblable (quoiqu\'il faille prendre en compte les règles d\'arborescences de répertoires, qui peuvent changer).\r\n\r\nLibre, gratuit, simple d\'utilisation et d\'installation, ce langage nécessite comme tout langage de programmation une bonne compréhension des principales fonctions usuelles ainsi qu\'une connaissance aiguë des problèmes de sécurité liés à ce langage.\r\n\r\nLa version 5.3 a introduit de nombreuses fonctions nouvelles : les espaces de noms (Namespace) — un élément fondamental de l\'élaboration d\'extensions, de bibliothèques et de frameworks structurés, les fonctions anonymes, les fermetures, etc.\r\n\r\nEn 2018, près de 80 % des sites web utilisent le langage PHP sous ses différentes versions31.\r\n\r\nLe langage PHP fait l\'objet, depuis plusieurs années maintenant, de rassemblements nationaux organisés par l\'AFUP32 (l\'Association Française des Utilisateurs de PHP), où experts de la programmation et du milieu se retrouvent pour échanger autour du PHP et de ses développeurs. L\'association organise ainsi deux évènements33 majeurs : le « Forum PHP », habituellement en fin d\'année, et les « AFUP Day », qui ont lieu au cours du premier semestre, simultanément dans plusieurs villes.', '2021-11-07 22:05:51', '2021-11-08 10:01:08', 1),
(21, 'Python', 'https://img-0.journaldunet.com/Haks9yBny5Kc_kGFABMA9skRKFs=/1500x/smart/8f426d783689454a978c8fbade5e78ec/ccmcms-jdn/14686251.png', 'Python (prononcé /pi.tɔ̃/) est un langage de programmation interprété, multi-paradigme et multiplateformes. Il favorise la programmation impérative structurée, fonctionnelle et orientée objet. Il est doté d\'un typage dynamique fort, d\'une gestion automatique de la mémoire par ramasse-miettes et d\'un système de gestion d\'exceptions ; il est ainsi similaire à Perl, Ruby, Scheme, Smalltalk et Tcl.', 'Le langage Python est placé sous une licence libre proche de la licence BSD7 et fonctionne sur la plupart des plates-formes informatiques, des smartphones aux ordinateurs centraux8, de Windows à Unix avec notamment GNU/Linux en passant par macOS, ou encore Android, iOS, et peut aussi être traduit en Java ou .NET. Il est conçu pour optimiser la productivité des programmeurs en offrant des outils de haut niveau et une syntaxe simple à utiliser.\r\n\r\nIl est également apprécié par certains pédagogues qui y trouvent un langage où la syntaxe, clairement séparée des mécanismes de bas niveau, permet une initiation aisée aux concepts de base de la programmation9.\r\n\r\nUtilisation\r\nPython est un langage de programmation qui peut s\'utiliser dans de nombreux contextes et s\'adapter à tout type d\'utilisation grâce à des bibliothèques spécialisées. Il est cependant particulièrement utilisé comme langage de script pour automatiser des tâches simples mais fastidieuses, comme un script qui récupérerait la météo sur Internet ou qui s\'intégrerait dans un logiciel de conception assistée par ordinateur afin d\'automatiser certains enchaînements d\'actions répétitives (voir la section Adoption). On l\'utilise également comme langage de développement de prototype lorsqu\'on a besoin d\'une application fonctionnelle avant de l\'optimiser avec un langage de plus bas niveau. Il est particulièrement répandu dans le monde scientifique, et possède de nombreuses bibliothèques optimisées destinées au calcul numérique.', '2021-11-08 09:53:12', '2021-11-08 09:58:53', 1),
(23, 'Langage de programmation', 'https://blog.hubspot.fr/hubfs/Blog%20Image-Jul-16-2020-09-36-54-19-AM.png', 'Un langage de programmation est une notation conventionnelle destinée à formuler des algorithmes et produire des programmes informatiques qui les appliquent. D\'une manière similaire à une langue naturelle, un langage de programmation est composé d\'un alphabet, d\'un vocabulaire, de règles de grammaire, de significations, mais aussi d\'un environnement de traduction censé rendre sa syntaxe compréhensible par la machine1,2.', 'Les langages de programmation permettent de décrire d\'une part les structures des données qui seront manipulées par l\'appareil informatique, et d\'autre part d\'indiquer comment sont effectuées les manipulations, selon quels algorithmes. Ils servent de moyens de communication par lesquels le programmeur communique avec l\'ordinateur, mais aussi avec d\'autres programmeurs ; les programmes étant d\'ordinaire écrits, lus, compris et modifiés par une équipe de programmeurs3.\r\n\r\nUn langage de programmation est mis en œuvre par un traducteur automatique : compilateur ou interprète. Un compilateur est un programme informatique qui transforme dans un premier temps un code source écrit dans un langage de programmation donné en un code cible qui pourra être directement exécuté par un ordinateur, à savoir un programme en langage machine ou en code intermédiaire2, tandis que l’interprète réalise cette traduction « à la volée ».\r\n\r\nLes langages de programmation offrent différentes possibilités d\'abstraction et une notation proche de l\'algèbre, permettant de décrire de manière concise et facile à saisir les opérations de manipulation de données et l\'évolution du déroulement du programme en fonction des situations. La possibilité d\'écriture abstraite libère l\'esprit du programmeur d\'un travail superflu, notamment de prise en compte des spécificités du matériel informatique, et lui permet ainsi de se concentrer sur des problèmes plus avancés2.\r\n\r\nChaque langage de programmation supporte une ou plusieurs approches de la programmation – paradigmes. Les notions induisant le paradigme font partie du langage de programmation et permettent au programmeur d\'exprimer dans le langage une solution qui a été imaginée selon ce paradigme.\r\n\r\nLes premiers langages de programmation ont été créés dans les années 1950 en même temps que l\'avènement des ordinateurs. Cependant, de nombreux concepts de programmation ont été initiés par un langage ou parfois plusieurs langages, avant d\'être améliorés puis étendus dans les langages suivants. La plupart du temps la conception d\'un langage de programmation a été fortement influencée par l\'expérience acquise avec les langages précédents4.', '2021-11-08 10:05:58', NULL, 1),
(24, 'Pascal (langage)', 'http://www.ceintec.com/curso_de_pascal_presencial_en_bilbao_bilbo_vizcaya_bizkaia_3992476.jpg', 'Pascal est un langage de programmation impératif qui, conçu pour l\'enseignement, se caractérise par une syntaxe claire, rigoureuse et facilitant la structuration des programmes1.', 'En dehors de la syntaxe et de sa rigueur, le langage Pascal possède des points communs avec le C (voir les pointeurs). Le langage Pascal de base était conçu à usage purement éducatif et était assez limité. Par exemple, les chaînes de caractères, absentes du langage d\'origine, ont rapidement été intégrées2,3.\r\n\r\nSa puissance a été établie, et sa diffusion rapidement facilitée par la rédaction de compilateurs Pascal écrits en Pascal.\r\n\r\nLes développements qu\'il a connus par la suite en ont fait un langage complet et efficace. Plus récemment, la généricité a été ajoutée dans Delphi 20094 et dans Free Pascal depuis la version 2.25,6.\r\n\r\nLes implémentations actuelles de Pascal, utilisées hors du monde éducatif, sont des extensions telles que Turbo Pascal (mode texte), Pascal Objet (programmation objet), et Delphi (fenêtré). Il existe des versions libres comme Free Pascal et Lazarus (fenêtré). On peut programmer en Pascal sous DOS, Windows, Mac OS, Atari ST et FireBee (\"High Speed Pascal\" et \"Pure Pascal\". Pure Pascal est pleinement compatible avec Turbo Pascal 7 et le Pascal Objet), ou encore sous Linux/Unix ou Palm OS.\r\n\r\nLe système d\'exploitation Domain/OS (en) des ordinateurs Apollo7, ainsi qu\'une partie du système du Macintosh ont été écrits en Pascal. La première version d\'Adobe Photoshop également8. Le compilateur GCC a été développé par Richard Stallman à partir d\'un compilateur du LLNL, qui était écrit en langage Pastel, une extension du langage Pascal9.\r\n\r\nLa syntaxe du langage a été adaptée à d\'autres langages comme Ada, Modula-2 (puis Modula-3) ou Oberon.', '2021-11-08 10:13:25', '2021-11-08 10:14:17', 1),
(25, 'Go (langage)', 'https://images.itnewsinfo.com/lmi/articles/grande/000000072886.png', 'Go est un langage de programmation compilé et concurrent inspiré de C et Pascal. Ce langage a été développé par Google6 à partir d’un concept initial de Robert Griesemer, Rob Pike et Ken Thompson. Go possède deux implémentations : la première utilise gc, le compilateur Go ; la seconde utilise gccgo, « frontend » GCC écrit en C++. Go est écrit en C en utilisant yacc et GNU Bison pour l’analyse syntaxique7 jusqu’à la version 1.4, et en Go lui-même pour les versions suivantes (1.5).', 'Un objectif de Go est donné par Rob Pike, l’un de ses trois créateurs, qui dit à propos des développeurs inexpérimentés8 :\r\n\r\n« Ils ne sont pas capables de comprendre un langage brillant, mais nous voulons les amener à réaliser de bons programmes. Ainsi, le langage que nous leur donnons doit être facile à comprendre et facile à adopter »\r\n\r\nGo veut faciliter et accélérer la programmation à grande échelle : en raison de sa simplicité, il est donc concevable de l’utiliser aussi bien pour écrire des applications, des scripts ou de grands systèmes. Cette simplicité est nécessaire aussi pour assurer la maintenance et l’évolution des programmes sur plusieurs générations de développeurs.\r\n\r\nS’il vise aussi la rapidité d’exécution, indispensable à la programmation système, il considère le multithreading comme le moyen le plus robuste d’assurer sur les processeurs actuels cette rapidité9 tout en rendant la maintenance facile par séparation de tâches simples exécutées indépendamment afin d’éviter de créer des « usines à gaz ». Cette conception permet également le fonctionnement sans réécriture sur des architectures multi-cœurs en exploitant immédiatement l’augmentation de puissance correspondante.', '2021-11-08 10:16:03', NULL, 1),
(26, 'C (langage)', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/The_C_Programming_Language_logo.svg/131px-The_C_Programming_Language_logo.svg.png', 'C est un langage de programmation impératif généraliste, de bas niveau. Inventé au début des années 1970 pour réécrire Unix, C est devenu un des langages les plus utilisés, encore de nos jours. De nombreux langages plus modernes comme C++, C#, Java et PHP ou JavaScript ont repris une syntaxe similaire au C et reprennent en partie sa logique. C offre au développeur une marge de contrôle importante sur la machine (notamment sur la gestion de la mémoire) et est de ce fait utilisé pour réaliser les « fondations » (compilateurs, interpréteurs…) de ces langages plus modernes.', 'Histoire\r\n\r\nKen Thompson (à gauche) et Dennis Ritchie (à droite).\r\nLe langage C a été inventé au cours de l\'année 1972 dans les Laboratoires Bell. Il était développé en même temps qu\'Unix par Dennis Ritchie et Kenneth Thompson. Kenneth Thompson avait développé un prédécesseur de C, le langage B, qui est lui-même inspiré de BCPL. Dennis Ritchie a fait évoluer le langage B dans une nouvelle version suffisamment différente, en ajoutant notamment les types, pour qu\'elle soit appelée C1.\r\n\r\nBien que C soit officiellement inspiré de B et de BCPL, on note une forte influence de PL/I (ou de PL360) ; on a pu dire que C était à Unix et au PDP-11 ce que PL/I fut pour la réécriture de Multics.\r\n\r\nPar la suite, Brian Kernighan aida à populariser le langage C. Il procéda aussi à quelques modifications de dernière minute.\r\n\r\nEn 1978, Kernighan fut le principal auteur du livre The C Programming Language décrivant le langage enfin stabilisé ; Ritchie s\'était occupé des appendices et des exemples avec Unix. On appelle aussi ce livre « le K&R », et l\'on parle de C traditionnel ou de C K&R lorsqu\'on se réfère au langage tel qu\'il existait à cette époque.\r\n\r\nNormalisation\r\nEn 1983, l\'Institut national américain de normalisation (ANSI) a formé un comité de normalisation (X3J11) du langage qui a abouti en 1989 à la norme dite ANSI C ou C89 (formellement ANSI X3.159-1989). En 1990, cette norme a également été adoptée par l\'Organisation internationale de normalisation (C90, C ISO, formellement ISO/CEI 9899:1990). ANSI C est une évolution du C K&R qui reste extrêmement compatible. Elle reprend quelques idées de C++, notamment la notion de prototype et les qualificateurs de type2.\r\n\r\nEntre 1994 et 1996, le groupe de travail de l\'ISO (ISO/CEI JTC1/SC22/WG14) a publié deux correctifs et un amendement à C90 : ISO/CEI 9899/COR1:1994 Technical Corrigendum 1, ISO/CEI 9899/AMD1:1995 Intégrité de C et ISO/CEI 9899/COR1:1996 Technical Corrigendum 2. Ces changements assez modestes sont parfois appelés C89 avec amendement 1, ou C94 / C953,4. Trois fichiers d\'entêtes ont été ajoutés, dont deux concernant les caractères larges et un autre définissant un certain nombre de macros en rapport avec la norme de caractères ISO 646.\r\n\r\nEn 1999, une nouvelle évolution du langage est normalisée par l\'ISO : C99 (formellement ISO/CEI 9899:1999). Les nouveautés portent notamment sur les tableaux de taille variable, les pointeurs restreints, les nombres complexes, les littéraux composés, les déclarations mélangées avec les instructions, les fonctions inline, le support avancé des nombres flottants, et la syntaxe de commentaire de C++. La bibliothèque standard du C99 a été enrichie de six fichiers d\'en-tête depuis la précédente norme.\r\n\r\nEn 2011, l\'ISO ratifie une nouvelle version du standard5 : C11, formellement ISO/CEI 9899:2011. Cette évolution introduit notamment le support de la programmation multi-thread, les expressions à type générique, et un meilleur support d\'Unicode.', '2021-11-08 10:17:03', NULL, 1),
(27, 'Fortran', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Fortran_logo.svg/131px-Fortran_logo.svg.png', 'Fortran (mathematical FORmula TRANslating system) est un langage de programmation généraliste dont le domaine de prédilection est le calcul scientifique et le calcul numérique. Il est utilisé aussi bien sur ordinateur personnel que sur les superordinateurs, où il sert d\'ailleurs à tester leurs performances dans le cadre du classement TOP500 des superordinateurs les plus puissants au monde, grâce à la bibliothèque LINPACK.', 'Le nombre de bibliothèques scientifiques écrites en Fortran, éprouvées et améliorées pendant de longues années, et les efforts continus consacrés aux compilateurs pour exploiter au fil des décennies les nouvelles possibilités des calculateurs (vectorisation, coprocesseurs, parallélisme) ont maintenu l\'usage de ce langage qui ne cesse d\'évoluer.\r\n\r\nParmi les fonctionnalités ajoutées ces dernières décennies, on citera le calcul sur les tableaux (qui peuvent comporter jusqu\'à quinze dimensions), la programmation modulaire, la programmation générique (Fortran 90), le calcul haute performance (Fortran 95), la programmation orientée objet et l\'interopérabilité avec les bibliothèques du langage C (Fortran 2003), la programmation concurrente et le calcul parallèle à l\'aide des cotableaux (Fortran 2008), des équipes, des évènements et des sous-routines collectives (Fortran 2018), en plus des interfaces OpenMP, OpenACC et de la bibliothèque Message Passing Interface. La prochaine norme, pour l\'instant désignée par Fortran 202x, est attendue pour 2023. Les discussions sur le contenu de la suivante, Fortran 202y, ont commencé.', '2021-11-08 10:17:58', NULL, 1),
(28, 'C++', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/ISO_C%2B%2B_Logo.svg/800px-ISO_C%2B%2B_Logo.svg.png', 'C++ est un langage de programmation compilé permettant la programmation sous de multiples paradigmes, dont la programmation procédurale, la programmation orientée objet et la programmation générique. Ses bonnes performances, et sa compatibilité avec le C en font un des langages de programmation les plus utilisés dans les applications où la performance est critique.', 'Créé initialement par Bjarne Stroustrup dans les années 1980, le langage C++ est aujourd\'hui normalisé par l\'ISO. Sa première normalisation date de 1998 (ISO/CEI 14882:1998), ensuite amendée par l\'erratum technique de 2003 (ISO/CEI 14882:2003). Une importante mise à jour a été ratifiée et publiée par l\'ISO en septembre 2011 sous le nom de ISO/IEC 14882:2011, ou C++113. Depuis, des mises à jour sont publiées régulièrement : en 2014 (ISO/CEI 14882:2014, ou C++144), en 2017 (ISO/CEI 14882:2017, ou C++175) puis en 2020 (ISO/IEC 14882:2020, ou C++206).\r\n\r\nDénomination\r\nEn langage C, ++ est l\'opérateur d\'incrémentation, c\'est-à-dire l\'augmentation de la valeur d\'une variable de 1. C\'est pourquoi C++ porte ce nom : cela signifie que C++ est un niveau au-dessus de C.\r\n\r\nHistoire\r\n\r\nBjarne Stroustrup, l\'inventeur du C++.\r\nBjarne Stroustrup commence le développement de C with Classes (C avec classes) en 19797. Il travaille alors dans les laboratoires Bell où il est notamment collègue de l\'inventeur du C Dennis Ritchie. L\'idée de créer un nouveau langage venait de l\'expérience en programmation de Stroustrup pour sa thèse de doctorat. Il s\'agissait en l\'occurrence d\'améliorer le langage C. Stroustrup trouvait que Simula avait des fonctionnalités très utiles pour le développement de gros programmes mais qu\'il était trop lent pour être utilisé en pratique (cela était dû à un problème d\'implémentation du compilateur Simula), tandis que BCPL était rapide mais de trop bas niveau et non adapté au développement de gros logiciels. Quand Stroustrup commença à travailler aux laboratoires Bell, on lui demanda d\'analyser le noyau UNIX en vue de faire du calcul distribué. Se rappelant sa thèse, Stroustrup commença à améliorer le langage C avec des fonctionnalités similaires à celle de Simula. C fut choisi parce qu\'il est rapide, portable et d\'usage général. En outre, il était une bonne base pour le principe original et fondateur de C++ : « vous ne payez pas pour ce que vous n\'utilisez pas ». Dès le départ, le langage ajoutait à C la notion de classe (avec encapsulation des données), de classe dérivée, de vérification des types renforcés (typage fort), d\'« inlining », et d\'argument par défaut.\r\n\r\nAlors que Stroustrup développait C with classes, il écrivit CFront, un compilateur qui générait du code source C à partir de code source C with classes. La première commercialisation se fit en octobre 1985. En 1983 le nom « C++ » est inventé, et en 1984 le nom du langage passa de C with classes à celui de « C++ ». Parmi les nouvelles fonctionnalités qui furent ajoutées au langage, il y avait les fonctions virtuelles, la surcharge des opérateurs et des fonctions, les références, les constantes, le contrôle du typage amélioré et les commentaires en fin de ligne. En 1985 fut publiée la première édition de The C++ Programming Language, apportant ainsi une référence importante au langage qui n\'avait pas encore de standard officiel. En 1989, c\'est la sortie de la version 2.0 de C++. Parmi les nouvelles fonctionnalités, il y avait l\'héritage multiple, les classes abstraites, les fonctions membres statiques, les fonctions membres constantes, et les membres protégés. En 1990, The Annotated C++ Reference Manual (« ARM ») fut publié apportant les bases du futur standard. Les ajouts de fonctionnalités tardifs qu\'il comportait couvraient les templates, les exceptions, les espaces de noms, les nouvelles conversions et le type booléen.', '2021-11-08 10:19:25', NULL, 1),
(29, 'JavaScript', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/131px-Unofficial_JavaScript_logo_2.svg.png', 'JavaScript est un langage de programmation de scripts principalement employé dans les pages web interactives et à ce titre est une partie essentielle des applications web. Avec les technologies HTML et CSS, JavaScript est parfois considéré comme l\'une des technologies cœur du World Wide Web3. Une grande majorité des sites web l\'utilisent4, et la majorité des navigateurs web disposent d\'un moteur JavaScript5 dédié pour l\'interpréter, indépendamment des considérations de sécurité qui peuvent se poser le cas échéant.', 'C\'est un langage orienté objet à prototype : les bases du langage et ses principales interfaces sont fournies par des objets.\r\n\r\nCependant, à la différence d\'un langage orienté objets, les objets de base ne sont pas des instances de classes.\r\n\r\nChaque objet de base (ex : l\'objet document ou windows) possède son propre modèle qui lui permettra d\'instancier des objets fils à l\'aide de constructeurs utilisant ses propriétés. Par exemple, la propriété de prototypage va leur permettre de créer des objets héritiers personnalisés.\r\n\r\nEn outre, les fonctions sont des objets de première classe. Le langage supporte le paradigme objet, impératif et fonctionnel. JavaScript est le langage possédant le plus large écosystème grâce à son gestionnaire de dépendances npm, avec environ 500 000 paquets en août 20176.\r\n\r\nJavaScript a été créé en 1995 par Brendan Eich. Il a été standardisé sous le nom d\'ECMAScript en juin 1997 par Ecma International dans le standard ECMA-262. La version actuellement en vigueur de ce standard, depuis juin 2020, est la 11ème édition.\r\n\r\nJavaScript est une implémentation d\'ECMAScript, celle mise en œuvre par la fondation Mozilla. L\'implémentation d\'ECMAScript par Microsoft (dans Internet Explorer jusqu\'à sa version 9) se nomme JScript, tandis que celle d\'Adobe Systems se nomme ActionScript.\r\n\r\nJavaScript est aussi employé pour les serveurs7 avec l\'utilisation (par exemple) de Node.js8 ou de Deno9.', '2021-11-08 10:20:23', '2021-11-21 16:23:07', 1),
(30, 'HTML', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/langfr-130px-HTML5_logo_and_wordmark.svg.png', 'L’anglais « Hypertext Markup Language » se traduit littéralement en « langage de balisage d’hypertexte »1. On utilise généralement le sigle « HTML », parfois même en répétant le mot « langage » comme dans « langage HTML ». Hypertext est parfois écrit HyperText pour marquer le T du sigle HTML.', 'Le HyperText Markup Language, généralement abrégé HTML ou, dans sa dernière version, HTML5, est le langage de balisage conçu pour représenter les pages web.\r\n\r\nCe langage permet :\r\n\r\nd’écrire de l’hypertexte, d’où son nom,\r\nde structurer sémantiquement la page,\r\nde mettre en forme le contenu,\r\nde créer des formulaires de saisie,\r\nd’inclure des ressources multimédias dont des images, des vidéos, et des programmes informatiques,\r\nde créer des documents interopérables avec des équipements très variés de manière conforme aux exigences de l’accessibilité du web.\r\nIl est souvent utilisé conjointement avec le langage de programmation JavaScript et des feuilles de style en cascade (CSS). HTML est inspiré du Standard Generalized Markup Language (SGML). Il s\'agit d\'un format ouvert.\r\n\r\nLe public non averti parle parfois de HTM au lieu de HTML, HTM étant l’extension de nom de fichier tronquée à trois lettres, une limitation que l’on trouve sur d’anciens systèmes d’exploitation de Microsoft.\r\n\r\nÉvolution du langage\r\nDurant la première moitié des années 1990, avant l’apparition des technologies Web comme le langage JavaScript (js), les feuilles de style en cascade (CSS) et le Document Object Model (Dom), l’évolution de HTML a dicté l’évolution du World Wide Web. Depuis 1997 et HTML 4, l’évolution de HTML a fortement ralenti ; dix ans plus tard, HTML 4 reste utilisé dans les pages web. En 2008, la spécification du HTML5 est à l’étude2 et devient d\'usage courant dans la seconde moitié des années 2010.\r\n\r\n1989-1992 : Origine\r\nHTML est une des trois inventions à la base du World Wide Web, avec le Hypertext Transfer Protocol (HTTP) et les adresses web (URL). HTML a été inventé pour permettre d\'écrire des documents hypertextuels liant les différentes ressources d’Internet avec des hyperliens. Aujourd’hui, ces documents sont appelés « page web ». En août 1991, lorsque Tim Berners-Lee annonce publiquement le web sur Usenet, il ne cite que le langage Standard Generalized Markup Language (SGML), mais donne l’URL d’un document de suffixe .html.\r\n\r\nDans son livre Weaving the web3, Tim Berners-Lee décrit la décision de baser HTML sur SGML comme étant aussi « diplomatique » que technique : techniquement, il trouvait SGML trop complexe, mais il voulait attirer la communauté hypertexte qui considérait que SGML était le langage le plus prometteur pour standardiser le format des documents hypertexte. En outre, SGML était déjà utilisé par son employeur, l’Organisation européenne pour la recherche nucléaire (CERN). ;\r\n\r\nLes premiers éléments du langage HTML comprennent :\r\n\r\nle titre du document,\r\nles hyperliens,\r\nla structuration du texte en titres, sous-titres, listes ou texte brut,\r\nun mécanisme rudimentaire de recherche par index.\r\nLa description de HTML est alors assez informelle et principalement définie par le support des divers navigateurs web contemporains. Dan Connolly a aidé à faire de HTML une véritable application de SGML4.\r\n\r\n1993 : Apports de NCSA Mosaic\r\nL’état de HTML correspond alors à ce que l’on pourrait appeler HTML 1.0. Il n’existe cependant aucune spécification portant ce nom, notamment parce que le langage était alors en pleine évolution. Un effort de normalisation était cependant en cours5. À partir de fin 1993, le terme HTML+ est utilisé pour désigner la version future de HTML6,7. Malgré l’effort de normalisation ainsi initié, et jusqu’à la fin des années 1990, HTML est principalement défini par les implémentations des navigateurs web.\r\n\r\nAvec le navigateur NCSA Mosaic, HTML connaît deux inventions majeures :\r\n\r\nd’abord l’invention de l’élément IMG permet d’intégrer des images (dans un premier temps, uniquement aux formats GIF et XBM) aux pages web (Mosaic 0.10) ;\r\nensuite l’invention des formulaires (Mosaic 2.0pre5) rend le web interactif en permettant aux visiteurs de saisir des données dans les pages et de les envoyer au serveur web. Cette invention permet notamment de passer des commandes, donc d’utiliser le web pour faire du commerce électronique.\r\n1994 : Apports de Netscape Navigator\r\nAvec l’apparition de Netscape Navigator 0.9 le 13 octobre 1994, le support de nombreux éléments de présentation est ajouté : attributs de texte, clignotement, centrage, etc.\r\n\r\nLe développement de HTML prend alors deux voies divergentes :\r\n\r\nd’une part, les développeurs de navigateurs s’attachent à maximiser l’impact visuel des pages web en réponse aux demandes des utilisateurs8 ;\r\nd’autre part, les concepteurs du web proposent d’étendre les capacités de description sémantique (logos, notes de bas de page, etc.) et les domaines d’applications (formules mathématiques, tables) de HTML.\r\nLes concepteurs suivent les principes de SGML consistant à laisser la présentation à un langage de style. En l’occurrence, les feuilles de style en cascade (CSS) sont prévues pour HTML. Seul le support des tables est rapidement intégré aux navigateurs, notamment parce qu’il permet une très nette amélioration de la présentation.\r\n\r\nOutre la multiplication des éléments de présentation, les logiciels d’alors produisant et consommant du HTML conçoivent souvent les documents comme une suite de commandes de formatage plutôt que comme un marquage représentant la structure en arbre aujourd’hui appelée Document Object Model (DOM). Le manque de structure du HTML alors mis en œuvre est parfois dénoncé comme étant de la « soupe de balises », en anglais : tag soup.\r\n\r\n1995-1996 : HTML 2.0\r\nEn mars 1995, le World Wide Web Consortium (W3C) nouvellement fondé propose le résultat de ses recherches sur HTML+ : le brouillon HTML 3.0. Il comprend notamment le support des tables, des figures et des expressions mathématiques. Ce brouillon expire le 28 septembre 1995 sans donner de suites directes. Fin 1995, le RFC 18669 décrivant HTML 2.0 est finalisé. Le principal éditeur est Dan Connolly. Ce document décrit HTML tel qu’il existait avant juin 1994, donc sans les nombreuses additions de Netscape Navigator.', '2021-11-08 21:00:14', '2021-11-20 17:04:08', 2);

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `flag` tinyint(1) NOT NULL,
  `validComment` tinyint(1) DEFAULT NULL,
  `article_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_id` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `pseudo`, `content`, `createdAt`, `flag`, `validComment`, `article_id`) VALUES
(35, 'John Doe', 'Article très utile', '2021-11-08 15:19:45', 0, 1, 29),
(36, 'Ednilsdonsds', 'dqsdqsdqssdsqdqsdq', '2021-11-08 20:41:59', 0, 1, 29),
(37, 'Anthony', 'Nice article', '2021-11-09 10:19:07', 0, 1, 26),
(38, 'Encore un commentaire', 'Encore un commentaireEncore un commentaireEncore un commentaireEncore un commentaireEncore un commentaireEncore un commentaireEncore un commentaire', '2021-11-09 15:27:04', 0, 0, 29),
(39, 'John', 'dsdsdsdsd', '2021-11-09 15:31:57', 0, 0, 30),
(40, 'John', 'dsdsdsdsd', '2021-11-09 15:32:30', 0, 0, 30),
(41, 'eddess', 'sqccqcqscsqcqsc', '2021-11-09 15:37:54', 0, 0, 29),
(43, 'ok', 'dsqdqsdqs', '2021-11-09 15:39:39', 0, 0, 29),
(45, 'sdsqdsq', 'dsqdqsdqsdqs dqs dqsd qsd qsd sqd sqd qsdqsd qs dqs', '2021-11-09 15:40:35', 0, 0, 30),
(47, 'dsqdqsdqsdqs', 'dsqdqdsqdq', '2021-11-09 17:28:43', 0, 0, 30),
(48, 'dsqdqsdqsdqs', 'dsqdqdsqdq', '2021-11-09 17:33:21', 0, 1, 30),
(49, 'Belle', 'Bel article', '2021-11-09 17:34:52', 1, 1, 29),
(50, 'ok', 'okokokokok', '2021-11-11 11:08:13', 0, 0, 30),
(51, 'okokok', 'okokokokokok', '2021-11-11 11:15:11', 0, 0, 30),
(52, 'best', 'Bestghjklm', '2021-11-11 11:21:39', 0, 0, 30),
(53, 'Best', 'Best okok okok o', '2021-11-11 11:22:28', 0, 1, 30),
(54, 'ghjkl:!', 'klmù', '2021-11-11 11:23:33', 0, 0, 30),
(55, 'fdfsdf', 'fsdfsdfsdfsd', '2021-11-11 11:25:46', 0, 1, 30),
(56, 'n,kml;ù', 'dfdsfsfsd', '2021-11-11 11:26:34', 0, 1, 30),
(57, 'lksqdlqsjdqlj', 'dokfpdfsdofqd', '2021-11-11 11:26:52', 0, 1, 30),
(58, 'dsqdqsd', 'd^spfsd^p', '2021-11-11 11:27:10', 0, 1, 30),
(59, 'dsqdqdq', 'dqdfsdfsfsd', '2021-11-11 11:27:50', 0, 1, 30),
(61, 'chaletsetcaviar', 'Chadspqd^qsdsq', '2021-11-11 17:47:39', 0, 1, 24),
(62, 'ghijokp^$dqsdpqs', 'pôddpfsooiqî', '2021-11-11 17:56:18', 0, 1, 24),
(63, 'sfqsdfsdfs', 'fsdfsfsfs', '2021-11-15 21:07:22', 0, 1, 26);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `yourName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `yourMessage` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `yourName`, `email`, `subject`, `yourMessage`, `createdAt`) VALUES
(2, 'John DOE', 'johndoe@mail.com', 'Demande', 'Je voulais savoir de cette demande', '2021-11-19 12:44:21'),
(3, 'EDNILSON MOREIRA MENDES', 'ednilsonmendes@outlook.com', 'dqsdq', '			dqsdqsdq', '2021-11-19 18:31:28'),
(16, 'EDNILSON MOREIRA MENDES', 'Correiamendes2012@gmail.com', 'sqdsqdq', '	dsqdqsdqsdqsd		', '2021-11-19 19:06:49'),
(7, 'EDNILSON MOREIRA MENDES', 'ednilsonmendes@outlook.com', 'dsdf', 'zidofiusofigsuo			', '2021-11-19 18:42:38'),
(8, 'EDNILSON MOREIRA MENDES', 'ednilsonmendes@outlook.com', 'qjdsdif', 'dfpdfosdf^psd			', '2021-11-19 18:43:40'),
(9, 'EDNILSON MOREIRA MENDES', 'Correiamendes2012@gmail.com', 'dfdsfsd', 'dpfdfo^sdpfsdô			', '2021-11-19 18:45:05'),
(10, 'EDNILSON MOREIRA MENDES', 'ednilsonmendes@outlook.com', 'ddsfds', 'sdmfùsdlf			', '2021-11-19 18:47:09'),
(12, 'SONIA BARRETO VIEIRA CORREIA', 'dsf@fdsfsd.com', 'dsdfsdkfhj', 'dkfsjdùflkdjfsdflksd jfùsl			', '2021-11-19 18:48:12'),
(17, 'EDNILSON MOREIRA MENDES', 'ednilsonmendes@outlook.com', 'dsdqs', 'sqdqsdqsdqsdqs', '2021-11-19 19:09:10'),
(18, 'EDNILSON MOREIRA MENDES', 'ednilsonmendes@outlook.com', 'dqsdqsdq', 'dqsdqsdsdq', '2021-11-19 19:12:30'),
(19, 'EDNILSON MOREIRA MENDES', 'ednilsonmendes@outlook.com', 'dqsdqsdq', 'ddqsdqsdqsd', '2021-11-19 19:13:02'),
(20, 'EDNILSON MOREIRA MENDES', 'ednilsonmendes@outlook.com', 'dqsdq', 'dd\r\nsf$s\r\nf$sd', '2021-11-19 19:13:24'),
(21, 'EDNILSON MOREIRA MENDES', 'ednilsonmendes@outlook.com', 'dqsdsq', 'dspdqsd^pqso', '2021-11-19 19:16:13'),
(22, 'EDNILSON MOREIRA MENDES', 'ednilsonmendes@outlook.com', 'dqsdqsdqs', 'dsqdqsdqsdqs			', '2021-11-19 19:18:52'),
(26, 'EDNILSON MOREIRA MENDES', 'ednilsonmendes@outlook.com', 'fmsfdms', 'mldkfmdlskgsmlkfgmlkfmlk			', '2021-11-19 19:50:22'),
(25, 'EDNILSON MOREIRA MENDES', 'ednilsonmendes@outlook.com', 'dsqqsqsdq', '			sqsdqsdqsdqs', '2021-11-19 19:44:54'),
(27, 'EDNILSON', '061christelle.bricard@pole-emploi.net', 'dsqdsqdqsdqs', 'dfsdfdsfsd			', '2021-11-19 19:53:40'),
(28, 'Antoion', 'de@fsqdqsd.com', 'dkdsjfsjdkh', 'dfkmjdhsflksdjlskdjsdlkfhdslfkjsdhflsjd			', '2021-11-19 20:01:48'),
(29, 'EDNILSON MOREIRA MENDES', 'ednilsonmendes@outlook.com', 'dsqqsqsdq', 'ededeqdqddeqdeq', '2021-11-19 20:50:48'),
(30, 'EDNILSON MOREIRA MENDES', 'Correiamendes2012@gmail.com', 'Demande', 'Demande 1			', '2021-11-21 14:45:15');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL,
  `createdAt` datetime NOT NULL,
  `validUser` tinyint(1) NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `pseudo`, `password`, `createdAt`, `validUser`, `role_id`) VALUES
(1, 'ednilson', '$2y$10$R4X2h.lSndsuCy694.sDweZavWP1Jwlu6dCxhqPTGhRXk6u3cbOSO', '2021-11-01 16:16:00', 1, 1),
(2, 'marie', '$2y$10$j.Q./1JoKK/JydRvNLuO6OJw3LkZ73AUxOuYVv6Oqv/.mUtyfS6Jm', '2021-11-01 16:16:17', 1, 1),
(8, 'antoine', '$2y$10$etRWyOdiVBsgMbf7XfWKoOyh8MjgFR3ux7/VnbHLkuJzjVfWHf7sy', '2021-11-21 13:18:27', 1, 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
