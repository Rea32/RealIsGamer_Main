-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-05-2023 a las 21:13:25
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `juegos2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compositores_juegos`
--

CREATE TABLE `compositores_juegos` (
  `id_compositor` int(11) NOT NULL,
  `id_juego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compositores_juegos`
--

INSERT INTO `compositores_juegos` (`id_compositor`, `id_juego`) VALUES
(11, 2),
(13, 1),
(17, 3),
(25, 5),
(25, 6),
(30, 7),
(30, 8),
(30, 9),
(31, 7),
(32, 7),
(32, 9),
(33, 7),
(44, 10),
(45, 10),
(47, 11),
(48, 11),
(49, 11),
(50, 11),
(51, 11),
(52, 11),
(55, 12),
(56, 12),
(60, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desarrollador`
--

CREATE TABLE `desarrollador` (
  `id_desarrollador` int(11) NOT NULL,
  `nombre_desarrollador` varchar(28) NOT NULL,
  `año_fundacion` int(11) NOT NULL,
  `año_disolucion` int(11) DEFAULT NULL,
  `id_pais` varchar(5) DEFAULT NULL,
  `id_director` int(11) DEFAULT NULL,
  `id_propietario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `desarrollador`
--

INSERT INTO `desarrollador` (`id_desarrollador`, `nombre_desarrollador`, `año_fundacion`, `año_disolucion`, `id_pais`, `id_director`, `id_propietario`) VALUES
(1, 'AMATA K.K.', 2008, NULL, 'JP', 1, NULL),
(2, 'Meta Platforms', 2004, NULL, 'EEUU', 7, NULL),
(3, 'FromSoftware', 1986, NULL, 'JP', 8, NULL),
(4, 'Microsoft', 1986, NULL, 'EEUU', 9, NULL),
(5, 'Sony', 1946, NULL, 'JP', 10, NULL),
(6, 'Eidos Montréal', 2007, NULL, 'CAN', 14, NULL),
(7, 'Nintendo', 1889, NULL, 'JP', 18, NULL),
(8, 'Sloclap', 2015, NULL, 'FR', 20, NULL),
(9, 'Remedy Entertainment', 1995, NULL, 'FIN', 22, NULL),
(10, 'Cavia Inc.', 2000, 2010, 'JP', 26, NULL),
(11, 'Toylogic', 2006, NULL, 'JP', 34, NULL),
(12, 'PlatinumGames', 2007, NULL, 'JP', 36, NULL),
(13, 'Intelligent Systems', 1986, NULL, 'JP', 40, NULL),
(14, 'Finji', 2014, NULL, 'EEUU', 53, NULL),
(15, 'Square Enix', 2003, NULL, 'JP', 57, NULL),
(16, 'Riot Games', 2006, NULL, 'EEUU', 61, NULL),
(17, 'Supercell', 2010, NULL, 'FIN', 62, NULL),
(18, 'Epic Games', 1999, NULL, 'EEUU', 63, NULL),
(19, 'Naughty Dog', 1989, NULL, 'EEUU', 64, NULL),
(20, 'SIE Santa Monica Studio', 1999, NULL, 'EEUU', 66, NULL),
(21, 'Guerrilla Games', 2000, NULL, 'NL', 67, NULL),
(22, 'Xbox Game Studios', 2000, NULL, 'EEUU', 69, NULL),
(23, '343 Industries', 2007, NULL, 'EEUU', 70, NULL),
(24, 'Bethesda Game Studios', 2001, NULL, 'EEUU', 71, NULL),
(25, 'Ninja Theory', 2007, NULL, 'GB', 72, NULL),
(26, 'Activision Blizzard', 2008, NULL, 'EEUU', 73, NULL),
(27, 'Electronic Arts', 1982, NULL, 'EEUU', 74, NULL),
(28, 'Ubisoft', 1986, NULL, 'FR', 75, NULL),
(29, 'Sega', 1960, NULL, 'JP', 76, NULL),
(30, 'Bandai Namco Entertainment', 2006, NULL, 'JP', 77, NULL),
(31, 'Retro Studios', 1998, NULL, 'EEUU', 78, NULL),
(32, 'MercurySteam', 2002, NULL, 'ES', 79, NULL),
(33, 'Koei', 1978, 2010, 'JP', 80, NULL),
(34, 'Koei Tecmo', 2010, NULL, 'JP', 81, NULL),
(35, 'Relic Entertainment', 1997, NULL, 'CAN', 82, NULL),
(36, 'Level-5', 1998, NULL, 'JP', 83, NULL),
(37, 'Valve', 1996, NULL, 'EEUU', 84, NULL),
(38, 'Team ICO', 1997, NULL, 'JP', 85, NULL),
(39, 'Arc System Works', 1988, NULL, 'JP', 86, NULL),
(40, 'Dimps', 2000, NULL, 'JP', 87, NULL),
(41, 'BioWare', 1995, NULL, 'CAN', 88, NULL),
(42, 'Insomniac Games', 1994, NULL, 'EEUU', 89, NULL),
(43, 'Infinity Ward', 2002, NULL, 'EEUU', 90, 26),
(44, 'Codemasters', 1986, NULL, 'GB', 91, 27),
(45, 'Treyarch', 1996, NULL, 'EEUU', 92, 26),
(46, 'Warner Bros', 1993, NULL, 'EEUU', 94, NULL),
(47, 'Snowblind Studios', 1997, 2012, 'EEUU', 93, 46),
(48, 'Tencent Games', 2003, NULL, 'CN', 96, NULL),
(49, 'Turtle Rock Studios', 2002, NULL, 'EEUU', 95, 48),
(50, 'Take-Two Interactive', 1993, NULL, 'EEUU', 98, NULL),
(51, 'Firaxis Games', 1996, NULL, 'EEUU', 97, 50),
(52, 'Sledgehammer Games', 2009, NULL, 'EEUU', 99, 26),
(53, 'Team Ninja', 1995, NULL, 'JP', 100, 34),
(54, 'Rockstar Games', 1998, NULL, 'EEUU', 101, 50),
(55, 'Bizarre Creations', 1994, 2011, 'GB', 102, 26),
(56, '2K Games', 2005, NULL, 'EEUU', 103, 50),
(57, 'CyberConnect2', 1996, NULL, 'JP', 104, NULL),
(58, 'EA Sports', 1991, NULL, 'EEUU', 105, 27),
(59, 'Tri-Ace', 1995, NULL, 'JP', 106, NULL),
(60, 'Gearbox Software', 1999, NULL, 'EEUU', 107, NULL),
(61, 'Turn 10 Studios', 2001, NULL, 'EEUU', 108, 22),
(62, 'Visceral Games', 1998, 2017, 'EEUU', 99, 27),
(63, 'Eutechnyx', 1987, NULL, 'GB', 109, NULL),
(64, 'Capcom', 1979, NULL, 'JP', 110, NULL),
(65, 'Squaresoft', 1986, 2003, 'JP', 111, NULL),
(66, 'bitComposer Interactive', 2009, NULL, 'GER', 112, NULL),
(67, 'THQ', 1990, 2013, 'EEUU', 113, NULL),
(68, 'PlayStation Studios', 2005, NULL, 'EEUU', 114, 5),
(69, 'Evolution Studios', 1999, 2016, 'GB', 115, 68),
(70, 'Harmonix', 1995, NULL, 'EEUU', 116, NULL),
(71, 'Neversoft', 1994, NULL, 'EEUU', 118, 26),
(72, 'Criterion Games', 1993, NULL, 'GB', 121, 27),
(73, 'Tri-Crescendo', 1999, NULL, 'JP', 122, NULL),
(74, 'Vanillaware', 2002, NULL, 'JP', 123, NULL),
(75, 'Atlus', 1986, NULL, 'JP', 124, 29),
(76, 'Konami', 1969, NULL, 'JP', 125, NULL),
(77, 'Triumph Studios', 0, NULL, NULL, NULL, NULL),
(78, 'Square', 0, NULL, NULL, NULL, NULL),
(79, 'Petums', 0, NULL, NULL, NULL, NULL),
(80, 'Nihon Falcom', 0, NULL, NULL, NULL, NULL),
(81, 'Housemarque', 0, NULL, NULL, NULL, NULL),
(82, 'id Software', 0, NULL, NULL, NULL, NULL),
(83, 'Sucker Punch', 0, NULL, NULL, NULL, NULL),
(84, 'Mistwalker', 0, NULL, NULL, NULL, NULL),
(85, 'Rockstar San Diego', 0, NULL, NULL, NULL, NULL),
(86, 'Supermassive Games', 0, NULL, NULL, NULL, NULL),
(87, 'Platinum Games', 0, NULL, NULL, NULL, NULL),
(88, 'Namco Tales Studio', 0, NULL, NULL, NULL, NULL),
(89, 'Blizzard Entertainment', 0, NULL, NULL, NULL, NULL),
(90, 'Monolith Soft', 0, NULL, NULL, NULL, NULL),
(91, 'Bungie', 0, NULL, NULL, NULL, NULL),
(92, 'Falcom', 0, NULL, NULL, NULL, NULL),
(93, 'Nintendo EAD', 0, NULL, NULL, NULL, NULL),
(95, 'historia', 0, NULL, NULL, NULL, NULL),
(96, 'Team Cherry', 0, NULL, NULL, NULL, NULL),
(100, 'Tango Gameworks', 0, NULL, NULL, NULL, NULL),
(101, 'Polyphony Digital', 0, NULL, NULL, NULL, NULL),
(102, 'Nintendo R&amp;D1', 0, NULL, NULL, NULL, NULL),
(103, 'Rocksteady Studios', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desarrollador_persona`
--

CREATE TABLE `desarrollador_persona` (
  `id_persona` int(4) NOT NULL,
  `id_desarrollador` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `desarrollador_persona`
--

INSERT INTO `desarrollador_persona` (`id_persona`, `id_desarrollador`) VALUES
(116, 70),
(117, 70),
(118, 70),
(119, 70),
(120, 70),
(121, 72),
(122, 73),
(123, 74),
(124, 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directores_juegos`
--

CREATE TABLE `directores_juegos` (
  `id_director` int(11) NOT NULL,
  `id_juego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `directores_juegos`
--

INSERT INTO `directores_juegos` (`id_director`, `id_juego`) VALUES
(4, 1),
(5, 1),
(6, 1),
(8, 2),
(8, 11),
(15, 3),
(16, 3),
(24, 5),
(24, 6),
(29, 7),
(29, 8),
(29, 9),
(35, 8),
(43, 10),
(44, 10),
(54, 12),
(59, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribuidor`
--

CREATE TABLE `distribuidor` (
  `id_distribuidor` int(11) NOT NULL,
  `nombre_distribuidor` varchar(28) NOT NULL,
  `id_pais` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `distribuidor`
--

INSERT INTO `distribuidor` (`id_distribuidor`, `nombre_distribuidor`, `id_pais`) VALUES
(1, 'META QUEST STORE', 'EEUU'),
(2, 'Bandai Namco Entertainment', 'JP'),
(3, 'Epic Games Store', 'EEUU'),
(4, 'PlayStation Store', 'JP'),
(5, 'Microsoft', 'EEUU'),
(6, 'Epic Games Publishing', 'EEUU'),
(7, 'Koch Media', 'GER'),
(8, 'Square Enix', 'JP'),
(9, 'Nintendo', 'JP'),
(10, 'Japan Studio', 'JP'),
(11, 'Steam', 'EEUU');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribuidores_juegos`
--

CREATE TABLE `distribuidores_juegos` (
  `id_distribuidor` int(11) NOT NULL,
  `id_juego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `distribuidores_juegos`
--

INSERT INTO `distribuidores_juegos` (`id_distribuidor`, `id_juego`) VALUES
(1, 1),
(2, 2),
(2, 3),
(3, 4),
(4, 4),
(5, 5),
(5, 12),
(6, 6),
(7, 7),
(8, 7),
(8, 8),
(8, 9),
(8, 13),
(9, 10),
(10, 11),
(11, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` varchar(5) NOT NULL,
  `nombre_genero` varchar(28) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `nombre_genero`, `descripcion`) VALUES
('ACT', 'Acción', '\r\n<p>Un <b>videojuego de acción</b> es un <a href=\"/wiki/Videojuego\" title=\"Videojuego\">videojuego</a> en el que el jugador debe usar su <a href=\"/wiki/Velocidad\" title=\"Velocidad\">velocidad</a>, <a href=\"/wiki/Destreza\" title=\"Destreza\">destreza</a> y <a href=\"/wiki/Tiempo_de_reacci%C3%B3n\" title=\"Tiempo de reacción\">tiempo de reacción</a>. Entre los diversos <a href=\"/wiki/G%C3%A9nero_de_videojuegos\" title=\"Género de videojuegos\">géneros de videojuegos</a>, el género de acción es el más amplio y abarcativo, englobando muchos subgéneros como <a href=\"/wiki/Videojuego_de_lucha\" title=\"Videojuego de lucha\">videojuegos de lucha</a>, <a href=\"/wiki/Videojuego_de_disparos_en_primera_persona\" title=\"Videojuego de disparos en primera persona\">videojuegos de disparos en primera persona</a>, <i><a href=\"/wiki/Beat_%27em_up\" class=\"mw-disambig\" title=\"Beat \'em up\">beat \'em ups</a></i> y <a href=\"/wiki/Videojuego_de_plataformas\" title=\"Videojuego de plataformas\">videojuegos de plataformas</a>.\r\n</p><p>Muy a menudo, los videojuegos de acción usan la <a href=\"/wiki/Violencia\" title=\"Violencia\">violencia</a>.\r\n</p>\r\n<meta property=\"mw:PageProp/toc\">\r\n<h2><span id=\"Caracter.C3.ADsticas\"></span><span class=\"mw-headline\" id=\"Características\">Características</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a href=\"/w/index.php?title=Videojuego_de_acci%C3%B3n&amp;action=edit&amp;section=1\" title=\"Editar sección: Características\">editar</a><span class=\"mw-editsection-bracket\">]</span></span></h2>\r\n<p>Si bien los primeros videojuegos de acción eran para computadora, gran parte de los géneros de videojuegos de acción se popularizaron en los <a href=\"/wiki/Arcade\" title=\"Arcade\">arcades</a>, que tomaron popularidad en los años 1970 y 1980. Por entonces, la gran mayoría de los videojuegos se enfocaban en desafiar la destreza del jugador, lo cual conllevó a que adoptasen ese estilo de juego corto y adictivo que caracteriza al arcade. Las temáticas de deportes y conducción eran comunes, pero otros videojuegos con temas más variados (y usualmente violentos) comenzaron a formar parte del género de acción.\r\n</p><p>Entre algunos de los primeros videojuegos de acción podemos encontrar a <i><a href=\"/wiki/Space_Invaders\" title=\"Space Invaders\">Space Invaders</a></i> y <i><a href=\"/w/index.php?title=Kung_Fu_Master&amp;action=edit&amp;redlink=1\" class=\"new\" title=\"Kung Fu Master (aún no redactado)\">Kung Fu Master</a></i>, los cuales contribuyeron a popularizar los subgéneros <i><a href=\"/wiki/Matamarcianos\" title=\"Matamarcianos\">Matamarcianos</a></i> y <i><a href=\"/wiki/Beat_%27em_up\" class=\"mw-disambig\" title=\"Beat \'em up\">beat \'em up</a></i>, respectivamente. A medida que las <a href=\"/wiki/Videoconsola\" title=\"Videoconsola\">videoconsolas</a> y las <a href=\"/wiki/Computadora_personal\" title=\"Computadora personal\">computadoras personales</a> se volvían más populares, era cada vez más común que los videojuegos de acción incluyeran otros elementos que no fueran de acción para prolongar el juego y reducir la repetición.\r\n</p>\r\n<h2><span class=\"mw-headline\" id=\"Objetivos_y_jugabilidad\">Objetivos y jugabilidad</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a href=\"/w/index.php?title=Videojuego_de_acci%C3%B3n&amp;action=edit&amp;section=2\" title=\"Editar sección: Objetivos y jugabilidad\">editar</a><span class=\"mw-editsection-bracket\">]</span></span></h2>\r\n<p>Si bien los objetivos de estos videojuegos varían de videojuego a videojuego, generalmente implican avanzar a través de niveles, eliminando hordas de enemigos y resolviendo problemas. Muchos videojuegos incluyen uno o más \"jefes\", a veces precedidos por \"minijefes\". Un minijefe es generalmente el clímax hacia un nivel o serie de niveles, con un jefe al final del juego o periódicamente por el juego, llevando a un \"jefe final\", el cual derrotar es el objetivo principal.\r\n</p><p>Para derrotar jefes se suele usar el \"<a href=\"/wiki/Reconocimiento_de_patrones\" title=\"Reconocimiento de patrones\">reconocimiento de patrones</a>\" y la velocidad de reacción física. En la mayor parte de los videojuegos viejos (e inclusive algunos modernos) los jefes son programados con un patrón de ataques simple o con movimientos que el jugador aprende a través de la experiencia. Estos patrones simples a menudo abarcan \"combos\" que exigen al jugador saltar, esquivar o bloquear ataques para luego atacar en ciertos puntos claves, todo esto mientras se maneja el tiempo de los patrones para poder atacar.\r\n</p><p>Muchos subgéneros, como los <a href=\"/wiki/Videojuego_de_plataformas\" title=\"Videojuego de plataformas\">videojuegos de plataformas</a>, incluyen problemas de estilo gimnástico, como por ejemplo saltos de tiempos regulados hacia y desde plataformas móviles. Los videojuegos de plataformas, ya sean en <a href=\"/wiki/Computaci%C3%B3n_gr%C3%A1fica_2D\" title=\"Computación gráfica 2D\">dos</a> o <a href=\"/wiki/Gr%C3%A1ficos_3D_por_computadora\" title=\"Gráficos 3D por computadora\">tres dimensiones</a>, son similares en concepto a la serie de videojuegos <i><a href=\"/wiki/Mario_Bros.\" title=\"Mario Bros.\">Mario Bros.</a></i>. Algunos videojuegos de acción tienen una jugabilidad al estilo de los <a href=\"/wiki/Videojuego_de_disparos_en_tercera_persona\" title=\"Videojuego de disparos en tercera persona\">videojuegos de disparos en tercera persona</a>, permitiéndole al jugador adquirir y (a veces) mejorar un conjunto de armas, cada una con una habilidad especial.\r\n</p><p>Otro subgénero común es el <i><a href=\"/wiki/Matamarcianos\" title=\"Matamarcianos\">Matamarcianos</a></i>, en el cual el jugador controla un personaje o vehículo con muchas armas, y debe disparar a una gran cantidad de enemigos y objetos.\r\n</p>\r\n<h2><span id=\"Consecuencias_f.C3.ADsicas\"></span><span class=\"mw-headline\" id=\"Consecuencias_físicas\">Consecuencias físicas</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a href=\"/w/index.php?title=Videojuego_de_acci%C3%B3n&amp;action=edit&amp;section=3\" title=\"Editar sección: Consecuencias físicas\">editar</a><span class=\"mw-editsection-bracket\">]</span></span></h2>\r\n<p>Ciertos estudios han demostrado que la gente puede mejorar su <a href=\"/wiki/Visi%C3%B3n\" title=\"Visión\">visión</a> jugando videojuegos de acción. Pruebas llevadas a cabo por científicos de la <a href=\"/wiki/Universidad_de_Rochester\" title=\"Universidad de Rochester\">Universidad de Rochester</a> en estudiantes indicaban que en un período de un mes, el rendimiento de los exámenes oculares mejoraba un 20% en aquellos que jugaban <i><a href=\"/wiki/Unreal_Tournament\" title=\"Unreal Tournament\">Unreal Tournament</a></i> en comparación con aquellos que jugaban <i><a href=\"/wiki/Tetris\" title=\"Tetris\">Tetris</a></i>.<sup id=\"cite_ref-1\" class=\"reference separada\"><a href=\"#cite_note-1\"><span class=\"corchete-llamada\">[</span>1<span class=\"corchete-llamada\">]</span></a></sup>​ Se cree que esto se debe a que el videojuego de acción mejora la resolución espacial de la visión de los jugadores.\r\n</p>\r\n'),
('ADV', 'Aventura', NULL),
('ARPG', 'Action-RPG', NULL),
('AVG', 'Aventura gráfica', NULL),
('BEU', 'Beat´Em Up', NULL),
('CARC', 'Conduccion - Arcade', NULL),
('CON', 'Conducción', NULL),
('CSIM', 'Conduccion - Simulación', NULL),
('DP', 'Deportes', NULL),
('EST', 'Estrategia', NULL),
('FPS', 'First Person Shooter', NULL),
('HS', 'Hack and Slash', NULL),
('JRPG', 'Japan-RPG', NULL),
('LCH', 'Lucha', NULL),
('MA', 'Mundo Abierto', 'Un videojuego de mundo abierto es un diseño con una vasta zona no lineal con muchos caminos por los que llegar al objetivo.​ Algunos videojuegos son diseñados como niveles tradicionales y con mundo abierto.​ Un mundo abierto facilita una exploración mucho mayor que una serie de pequeños niveles o un nivel con muchos desafíos lineales.\r\n\r\nEl término, a menudo, se usa alternativamente a otros como sandbox y free-roaming; sin embargo, los términos mundo abierto y free-roaming describen el ambiente del juego en sí y alude más a la carencia de cualquier tipo de barrera artificial, en oposición a las paredes invisibles y la aparición de otras pantallas que suelen ser comunes en los videojuegos lineales. Por su parte, el término sandbox se refiere a la mecánica de un videojuego y cómo el jugador se entretiene con su capacidad para jugar creativamente, sin límites estructurales artificiales y sin \"una manera correcta\" de jugar el videojuego.'),
('MTVN', 'Metroidvania', NULL),
('MUS', 'Musou', NULL),
('MUSIC', 'Musical', NULL),
('PLTF', 'Plataformas', NULL),
('PZZ', 'Puzzles', NULL),
('RPG', 'RPG', NULL),
('RPGMA', 'RPG - Mundo Abierto', NULL),
('RTS', 'Real Time Strategy', NULL),
('SB', 'Sandbox', NULL),
('SIM', 'Simulación', NULL),
('SLK', 'Soulslike', NULL),
('SNBX', 'Sandbox', NULL),
('SRPG', 'Strategy-RPG', NULL),
('TBS', 'Turn-Based Strategy', NULL),
('TERR', 'Terror', NULL),
('TPS', 'Third Person Shooter', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero_juegos`
--

CREATE TABLE `genero_juegos` (
  `id_genero` varchar(5) NOT NULL,
  `id_juego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genero_juegos`
--

INSERT INTO `genero_juegos` (`id_genero`, `id_juego`) VALUES
('ACT', 3),
('ACT', 4),
('ACT', 148),
('ACT', 153),
('ACT', 291),
('ACT', 292),
('ACT', 293),
('ACT', 294),
('ACT', 296),
('ACT', 306),
('ACT', 317),
('ACT', 323),
('ACT', 324),
('ACT', 326),
('ACT', 329),
('ACT', 330),
('ACT', 331),
('ADV', 3),
('ADV', 106),
('ADV', 133),
('ADV', 294),
('ADV', 296),
('ADV', 315),
('ADV', 317),
('ADV', 326),
('ADV', 329),
('ADV', 330),
('ADV', 331),
('ARPG', 2),
('ARPG', 7),
('ARPG', 8),
('ARPG', 9),
('ARPG', 11),
('ARPG', 12),
('ARPG', 13),
('ARPG', 105),
('ARPG', 130),
('ARPG', 138),
('ARPG', 139),
('ARPG', 140),
('ARPG', 146),
('ARPG', 290),
('ARPG', 302),
('ARPG', 305),
('ARPG', 307),
('AVG', 235),
('AVG', 298),
('AVG', 319),
('BEU', 4),
('BEU', 183),
('CARC', 144),
('CARC', 160),
('CARC', 163),
('CARC', 164),
('CARC', 172),
('CARC', 184),
('CARC', 185),
('CARC', 186),
('CARC', 191),
('CON', 327),
('CSIM', 169),
('CSIM', 327),
('DP', 161),
('DP', 165),
('FPS', 114),
('FPS', 115),
('FPS', 116),
('FPS', 118),
('FPS', 143),
('FPS', 145),
('FPS', 147),
('FPS', 149),
('FPS', 150),
('FPS', 151),
('FPS', 152),
('FPS', 155),
('FPS', 156),
('FPS', 158),
('FPS', 292),
('FPS', 293),
('HS', 7),
('HS', 8),
('HS', 9),
('HS', 170),
('HS', 181),
('HS', 194),
('HS', 300),
('HS', 303),
('HS', 304),
('JRPG', 13),
('JRPG', 109),
('JRPG', 141),
('JRPG', 166),
('JRPG', 171),
('JRPG', 175),
('JRPG', 176),
('JRPG', 177),
('JRPG', 178),
('JRPG', 179),
('JRPG', 180),
('JRPG', 192),
('JRPG', 195),
('JRPG', 196),
('JRPG', 320),
('JRPG', 321),
('LCH', 136),
('LCH', 137),
('LCH', 157),
('LCH', 174),
('LCH', 189),
('LCH', 190),
('MA', 159),
('MA', 230),
('MA', 330),
('MA', 331),
('MTVN', 313),
('MTVN', 314),
('MTVN', 328),
('MUS', 108),
('MUSIC', 187),
('MUSIC', 188),
('PLTF', 197),
('PLTF', 308),
('PLTF', 309),
('PZZ', 1),
('PZZ', 117),
('PZZ', 142),
('RPG', 233),
('RPG', 295),
('RPG', 299),
('RPG', 301),
('RPG', 311),
('RPG', 325),
('RPGMA', 168),
('RTS', 107),
('RTS', 110),
('RTS', 111),
('RTS', 112),
('RTS', 113),
('RTS', 193),
('SIM', 182),
('SLK', 2),
('SLK', 11),
('SLK', 98),
('SRPG', 10),
('SRPG', 154),
('TERR', 5),
('TERR', 6),
('TERR', 298),
('TERR', 315),
('TERR', 317),
('TERR', 319),
('TPS', 5),
('TPS', 6),
('TPS', 173);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idioma`
--

CREATE TABLE `idioma` (
  `id_idioma` varchar(5) NOT NULL,
  `idioma` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `idioma`
--

INSERT INTO `idioma` (`id_idioma`, `idioma`) VALUES
('ENG', 'Inglés'),
('JAP', 'Japonés'),
('SPA', 'Español');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idioma_texto`
--

CREATE TABLE `idioma_texto` (
  `id_idioma` varchar(5) NOT NULL,
  `id_juego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `idioma_texto`
--

INSERT INTO `idioma_texto` (`id_idioma`, `id_juego`) VALUES
('ENG', 7),
('ENG', 13),
('SPA', 1),
('SPA', 2),
('SPA', 3),
('SPA', 4),
('SPA', 5),
('SPA', 6),
('SPA', 8),
('SPA', 9),
('SPA', 10),
('SPA', 11),
('SPA', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idioma_voces`
--

CREATE TABLE `idioma_voces` (
  `id_idioma` varchar(5) NOT NULL,
  `id_juego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `idioma_voces`
--

INSERT INTO `idioma_voces` (`id_idioma`, `id_juego`) VALUES
('ENG', 1),
('ENG', 2),
('ENG', 4),
('ENG', 8),
('ENG', 9),
('ENG', 10),
('ENG', 13),
('JAP', 1),
('JAP', 7),
('JAP', 8),
('JAP', 9),
('JAP', 10),
('SPA', 3),
('SPA', 5),
('SPA', 6),
('SPA', 11),
('SPA', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_juego`
--

CREATE TABLE `imagenes_juego` (
  `id_juego` int(11) NOT NULL,
  `id_imagen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego`
--

CREATE TABLE `juego` (
  `id_juego` int(11) NOT NULL,
  `nombre` varchar(48) NOT NULL,
  `id_saga` int(11) DEFAULT NULL,
  `id_desarrollador` int(11) NOT NULL,
  `lanzamiento` date NOT NULL,
  `perspectiva` varchar(48) NOT NULL,
  `solo_multijugador` tinyint(1) DEFAULT 0,
  `imagen` int(11) DEFAULT NULL,
  `descripcion` varchar(700) DEFAULT NULL,
  `punt_usuarios` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `juego`
--

INSERT INTO `juego` (`id_juego`, `nombre`, `id_saga`, `id_desarrollador`, `lanzamiento`, `perspectiva`, `solo_multijugador`, `imagen`, `descripcion`, `punt_usuarios`) VALUES
(1, 'Tales of Onogoro', NULL, 1, '2022-03-17', 'RV-First Person', 0, 1, NULL, NULL),
(2, 'Elden Ring', NULL, 3, '2022-02-25', 'Third Person', 0, 2, NULL, NULL),
(3, 'Marvel´s Guardians of the Galaxy', NULL, 6, '2021-10-26', 'Third Person', 0, 3, NULL, NULL),
(4, 'Sifu', NULL, 8, '2022-02-08', 'Third Person', 0, 4, NULL, NULL),
(5, 'Alan Wake', NULL, 9, '2010-05-14', 'Third Person', 0, 5, NULL, NULL),
(6, 'Alan Wake Remastered', NULL, 9, '2021-10-05', 'Third Person', 0, 6, NULL, NULL),
(7, 'Nier', 1, 10, '2010-04-23', 'Third Person', 0, 7, NULL, NULL),
(8, 'NieR Replicant ver.1.22474487139…', 1, 11, '2021-04-23', 'Third Person', 0, 8, NULL, NULL),
(9, 'NieR Automata', 1, 12, '2017-03-10', 'Third Person', 0, 9, NULL, NULL),
(10, 'Fire Emblem: Awakening', 2, 13, '2013-04-19', 'God Vision', 0, 10, NULL, NULL),
(11, 'Bloodborne', NULL, 3, '2015-03-25', 'Third Person', 0, 11, NULL, NULL),
(12, 'Tunic', NULL, 14, '2022-03-16', 'Isometric', 0, 12, NULL, NULL),
(13, 'The World Ends With You', 3, 15, '2008-04-18', 'Scroll', 0, 13, NULL, NULL),
(98, 'Dark Souls', 8, 3, '2011-10-07', 'Third Person', 0, 98, NULL, NULL),
(105, 'Immortals Fenyx Rising', NULL, 28, '2020-12-03', 'Third Person', 0, 105, NULL, NULL),
(106, 'The Legend of Zelda: Ocarina of Time', 38, 7, '1998-12-11', 'Third Person', 0, 106, NULL, NULL),
(107, 'StarCraft II: Wings of Liberty', 39, 26, '2010-07-27', '', 0, 107, NULL, NULL),
(108, 'Dynasty Warriors 4', 41, 33, '2003-06-27', 'Third Person', 0, 108, NULL, NULL),
(109, 'Dragon Quest VIII: El periplo del Rey Ma', 15, 36, '2006-04-12', 'Third Person', 0, 109, NULL, NULL),
(110, 'Warhammer 40.000: Dawn of War', 42, 35, '2004-09-27', 'Isometric', 0, 110, NULL, NULL),
(111, 'Warhammer 40.000: Dawn of War - Winter A', 42, 35, '2005-10-13', 'Isometric', 0, 111, NULL, NULL),
(112, 'Warhammer 40.000 : Dawn of War - Dark Cr', 42, 35, '2006-10-25', 'Isometric', 0, 112, NULL, NULL),
(113, 'Warhammer 40.000: Dawn of War - Soulstor', 42, 35, '2008-03-04', 'Isometric', 0, 113, NULL, NULL),
(114, 'Half Life 2', 43, 37, '2004-11-16', 'First Person', 0, 114, NULL, NULL),
(115, 'Half-Life 2 Episode One', 43, 37, '2006-06-01', 'First Person', 0, 115, NULL, NULL),
(116, 'Half-Life 2 Episode Two', 43, 37, '2007-10-01', 'First Person', 0, 116, NULL, NULL),
(117, 'Portal', 45, 37, '2007-10-10', 'First Person', 0, 117, NULL, NULL),
(118, 'Team Fortress 2', NULL, 37, '2007-12-18', 'First Person', 1, 118, NULL, NULL),
(130, 'Diablo III', 40, 26, '2012-05-12', 'Isometric', NULL, 130, NULL, NULL),
(133, 'Shadow of the Colossus', NULL, 38, '2006-02-15', 'Third Person', NULL, 133, NULL, NULL),
(136, 'Dragon Ball Z: Budokai 3', 47, 40, '2004-11-19', 'Lateral', NULL, 136, NULL, NULL),
(137, 'Dragon Ball FighterZ', 47, 39, '2018-01-26', 'Lateral', NULL, 137, NULL, NULL),
(138, 'Mass Effect', 49, 41, '2007-11-23', 'Third Person', NULL, 138, NULL, NULL),
(139, 'Mass Effect 2', 49, 41, '2010-01-29', 'Third Person', NULL, 139, NULL, NULL),
(140, 'Mass Effect 3', 49, 41, '2012-03-08', 'Third Person', NULL, 140, NULL, NULL),
(141, 'Ni no Kuni: La ira de la Bruja Blanca', 51, 36, '2013-02-01', 'Third Person', NULL, 141, NULL, NULL),
(142, 'Practise English: Face Everyday Situatio', NULL, 7, '2007-10-26', 'Gestión de Menus', NULL, 142, NULL, NULL),
(143, 'Call of Duty 4: Modern Warfare', 28, 43, '2007-11-09', 'First Person', NULL, 143, NULL, NULL),
(144, 'Dirt 3', 53, 44, '2011-05-24', 'First Person', NULL, 144, NULL, NULL),
(145, 'Call of Duty: Ghosts', 28, 43, '2013-11-05', 'First Person', NULL, 145, NULL, NULL),
(146, 'El Señor de los Anillos: La Guerra del Norte', NULL, 47, '2011-11-11', 'Third Person', NULL, 146, NULL, NULL),
(147, 'Call of Duty: Black Ops II', 28, 45, '2012-11-13', 'First Person', NULL, 147, NULL, NULL),
(148, 'Tom Clancy\'s HAWX 2', 55, 28, '2010-09-09', 'First & Third Person', NULL, 148, NULL, NULL),
(149, 'Call of Duty: Black Ops', 28, 45, '2010-11-09', 'First Person', NULL, 149, NULL, NULL),
(150, 'Left 4 Dead 2', NULL, 49, '2009-11-19', 'First Person', 1, 150, NULL, NULL),
(151, 'Call of Duty: World at War', 28, 26, '2008-11-14', 'First Person', NULL, 151, NULL, NULL),
(152, 'Call of Duty: Modern Warfare 2', 28, 43, '2009-11-10', 'First Person', NULL, 152, NULL, NULL),
(153, 'Tom Clancy\'s HAWX', 55, 28, '2009-03-05', 'First & Third Person', NULL, 153, NULL, NULL),
(154, 'XCOM: Enemy Within', 56, 51, '2013-11-15', 'Isometric', NULL, 154, NULL, NULL),
(155, 'Tom Clancy’s Rainbow Six Vegas 2', 55, 28, '2008-04-17', 'First Person', NULL, 155, NULL, NULL),
(156, 'Call of Duty: Modern Warfare 3', 28, 52, '2011-11-08', 'First Person', NULL, 156, NULL, NULL),
(157, 'Dead or Alive 5 Ultimate', 57, 53, '2013-09-06', 'Lateral', NULL, 157, NULL, NULL),
(158, 'Call of Duty: Advanced Warfare', 28, 52, '2014-11-04', 'First Person', NULL, 158, NULL, NULL),
(159, 'Red Dead Redemption', 54, 54, '2010-05-21', 'Third Person', NULL, 159, NULL, NULL),
(160, 'Blur', NULL, 55, '2010-05-28', 'Third Person', NULL, 160, NULL, NULL),
(161, 'Top Spin 4', 58, 56, '2011-03-18', 'Third Person', NULL, 161, NULL, NULL),
(163, 'F1 2013', NULL, 44, '2013-10-04', 'First & Third Person', NULL, 163, NULL, NULL),
(164, 'Race Driver: GRID', 59, 44, '2008-05-30', 'First & Third Person', NULL, 164, NULL, NULL),
(165, 'FIFA 14', NULL, 58, '2013-09-26', 'Third Person', NULL, 165, NULL, NULL),
(166, 'Resonance of Fate', NULL, 59, '2010-03-26', 'Third Person', NULL, 166, NULL, NULL),
(168, 'Borderlands', 60, 60, '2009-10-23', 'First Person', NULL, 168, NULL, NULL),
(169, 'Forza Motorsport 3', 61, 61, '2009-10-23', 'First & Third Person', NULL, 169, NULL, NULL),
(170, 'Dante\'s Inferno', NULL, 62, '2010-02-05', 'Third Person', NULL, 170, NULL, NULL),
(171, 'Star Ocean: The Last Hope', 62, 59, '2009-06-05', 'Third Person', NULL, 171, NULL, NULL),
(172, 'FlatOut Ultimate Carnage', 63, 63, '2007-07-12', 'First & Third Person', NULL, 172, NULL, NULL),
(173, 'Lost Planet 2', 64, 64, '2010-05-11', 'Third Person', NULL, 173, NULL, NULL),
(174, 'Dragon Ball Z Budokai HD Collection', NULL, 30, '2012-11-02', 'Lateral', NULL, 174, '', NULL),
(175, 'Final Fantasy VI', 36, 65, '1994-04-02', 'Isometric', NULL, 175, NULL, NULL),
(176, 'Final Fantasy VII', 36, 65, '1997-01-31', 'Isometric', NULL, 176, NULL, NULL),
(177, 'Final Fantasy VII Remake', 36, 15, '2020-04-10', 'Third Person', NULL, 177, NULL, NULL),
(178, 'Final Fantasy X', 36, 65, '2002-05-29', 'Third Person', NULL, 178, NULL, NULL),
(179, 'Final Fantasy XIII', 36, 15, '2010-03-09', 'Third Person', NULL, 179, NULL, NULL),
(180, 'Lightning Returns: Final Fantasy', 36, 15, '2014-02-14', 'Third Person', NULL, 295, NULL, NULL),
(181, 'Castlevania: Lords of Shadow 2', 65, 32, '2014-02-27', 'Third Person', NULL, 295, NULL, NULL),
(182, 'Air Conflicts: Pacific Carriers', NULL, 66, '2013-02-21', 'First & Third Person', NULL, 295, NULL, NULL),
(183, 'Spider-Man: Web of Shadows', NULL, 45, '2008-10-21', 'Third Person', NULL, 295, NULL, NULL),
(184, 'MX vs ATV Alive', NULL, 67, '2011-05-20', 'First & Third Person', NULL, 295, NULL, NULL),
(185, 'Dirt Showdown', 53, 44, '2012-05-25', 'First & Third Person', NULL, 185, NULL, NULL),
(186, 'MotorStorm: Pacific Rift', NULL, 69, '2008-11-07', 'Third Person', NULL, 295, NULL, NULL),
(187, 'Rock Band', NULL, 70, '2008-10-02', 'Isometric', NULL, 295, NULL, NULL),
(188, 'Guitar Hero 3', NULL, 71, '2007-11-23', 'Isometric', NULL, 295, NULL, NULL),
(189, 'Street Fighter IV', NULL, 64, '2009-02-20', 'Lateral', NULL, 295, NULL, NULL),
(190, 'Naruto Shippuden: Ultimate Ninja Storm 2', NULL, 57, '2010-10-15', 'Lateral', NULL, 295, NULL, NULL),
(191, 'Need for Speed Hot Pursuit', 11, 72, '2010-11-19', 'First & Third Person', NULL, 295, NULL, NULL),
(192, 'Eternal Sonata', NULL, 73, '2007-10-19', 'Isometric', NULL, 192, NULL, NULL),
(193, 'Grimgrimoire', NULL, 74, '2007-09-28', 'Scroll', NULL, 295, NULL, NULL),
(194, 'Onimusha 3', 66, 64, '2004-07-09', 'Third Person', NULL, 295, NULL, NULL),
(195, 'Shin Megami Tensei: Digital Devil Saga', 67, 75, '2006-07-21', 'Third Person', NULL, 295, NULL, NULL),
(196, 'Shin Megami Tensei: Digital Devil Saga 2', 67, 75, '2007-04-27', 'Third Person', NULL, 295, NULL, NULL),
(197, 'Rocket Knight Adventures', NULL, 76, '1993-08-05', 'Scroll', NULL, 295, NULL, NULL),
(230, 'Red Dead Redemption 2', 54, 54, '2018-10-26', 'Third Person', 0, 230, 'Red Dead Redemption 2 es la secuela de la aventura de acción Red Dead Redemption a cargo de Rockstar Games para PlayStation 4, Xbox One, PC y Stadia que nos trae una historia épica sobre la vida en el despiadado corazón de América. Su vasto y evocador mundo sentará, a su vez, los cimientos para una experiencia multijugador online totalmente nueva. América, 1899. Con los representantes de la ley dando caza a las últimas bandas de forajidos, el fin del Salvaje Oeste es ya una realidad. Aquellos que no se rinden o sucumben son eliminados. Después de que un atraco se vaya al traste en la ciudad de', NULL),
(233, 'Vagrant Story', NULL, 78, '0000-00-00', '', 0, 233, 'Square demuestra nuevamente su arte y maestría a la hora de hacer RPGS con Vagrant Story, una historia épica que gira entorno a un círculo de conspiraciones entre la iglesia, la nobleza y la monarquía, en un marco como la bella ciudad de Lea-Monde y con el secreto de la vida eterna como trasfondo...', NULL),
(235, 'Papetura', NULL, 79, '0000-00-00', '', 0, 235, 'Papetura es una aventura gráfica tipo point &amp; click realizada por completo con recortes de papel a cargo de Petums para PC, PlayStation 4, Xbox One, PlayStation 5, Xbox Series y Switch. Las pequeñas criaturas Pape y Tura habrán de enfrentarse a unos monstruos que intentarán quemar su amado mundo de papel. Entra en este mundo de papel único y misterioso, envuelto en luces y sombras y con música ambiental compuesta de Floex.', NULL),
(290, 'Ys IX: Monstrum Nox', 68, 80, '2021-02-05', '', 0, 290, 'Ys IX: Monstrum Nox es un videojuego de acción RPG a cargo de Nihon Falcom y NIS America para PC, PlayStation 4 y Switch en el que Adol Christin es maldecido por una misteriosa mujer y se convierte en un Monstrum, un poderoso ser que puede exorcizar monstruos. Para escapar de la ciudad de Balduq, debe aliarse con otros cinco Monstrums, cada uno con sus propios y exclusivos Gifts, y detener al Grimwald Nox, una dimensión sombría a punto de desbordarse en el mundo real.', NULL),
(291, 'Returnal', NULL, 81, '2021-04-30', 'Third Person', 0, 291, 'Returnal es un videojuego de acción y disparos de corte toguelike con una ambientación de ciencia ficción a cargo de Housemarque y Sony Interactive Entertainment para PlayStation 5 y PC. Tras el aterrizaje forzoso en este mundo cambiante, Selene debe buscar en el desolado paisaje una antigua civilización para poder escapar. Sola y aislada, se ve abocada a luchar con uñas y dientes para sobrevivir. Cae derrotada una y otra vez, lo que la obliga a reiniciar su viaje cada vez que muere.', NULL),
(292, 'Doom Eternal', NULL, 82, '2020-03-20', 'First Person', 0, 292, 'DOOM Eternal, desarrollado por id Software y editado por Bethesda para PC, PlayStation 4, Xbox One y Switch, es la secuela directa del celebrado título de acción tipo shooter de 2016, el reboot de tan mítica franquicia. Un personaje mucho más poderoso deberá enfrentarse al doble de demonios de la primera entrega. En el papel del DOOM Slayer, descubrirás a tu regreso que los demonios han invadido la Tierra. Mándalos al infierno y descubre los orígenes del Slayer y su perpetua misión de matanza y destrucción... hasta el final.', NULL),
(293, 'Doom', NULL, 82, '2016-05-13', 'First Person', 0, 293, 'DOOM, el terror y la acción de la serie FPS de id Software regresan gracias a Bethesda en forma de reboot para PC, PlayStation 4, Xbox One y Nintendo Switch. La acción frenética, la velocidad y el gore vuelven a ser los protagonistas en esta nueva entrega de la saga del aclamado shooter en primera persona, en el que volveremos a cazar a los demonios a lo largo de una intensa campaña. Además, como creador del formato &quot;deathmatch&quot; en los videojuegos, DOOM vuelve otra vez con un potente modo multijugador y un editor de juego que permitirá crear y compartir contenidos con el resto del mu', NULL),
(294, 'Ghost of Tsushima', NULL, 83, '2020-07-17', '', 0, 294, 'Ghost of Tsushima, desarrollado por Sucker Punch y editado por Sony para PlayStation 4, es una aventura de acción ambientada en el Japón feudal y en el que un samurái trata de hacer frente a la invasión del ejército mongol en el año 1274. Acero y dominio de la espada: domina ambos aspectos para sobrevivir a este tremendo desafío, donde el ejército mongol se ha hecho con el control de la isla de Tsushima. Colócate la armadura, afila tu katana y tensa el arco en tu rol como Jin, un maltratado samurái que permanece en la isla con la esperanza de acabar con el despiadado khan y su salvaje imperio.', NULL),
(295, 'Lost Odyssey', NULL, 84, '2008-02-29', '', 0, 295, '', NULL),
(296, 'Asura´s Wrath', NULL, 57, '2012-02-24', 'Third Person', 0, 296, 'Juego de acción del estudio CyberConnect2 en el que el protagonista podrá invocar una gran criatura para combatir a los enemigos.', NULL),
(298, 'Until Dawn', NULL, 86, '2015-08-26', 'Third Person', 0, 298, 'Supermassive Games convierte la típica película de miedo adolescente en un videojuego de misterio donde reina la oscuridad y el terror. Ideado en un principio para PlayStation 3, da el salto finalmente a PlayStation 4.', NULL),
(299, 'Soul Hackers 2', NULL, 75, '2022-08-25', 'Third Person', 0, 299, 'Soul Hackers 2 es un RPG a cargo de Atlus y Sega para PC, PlayStation 4, Xbox One, PlayStation 5 y Xbox Series que escribe un nuevo capítulo en la saga Devil Summoner Megami Tensei. Entre el brillo de las luces de neón, los avances tecnológicos han hecho que el ser humano haya quedado dominado por el influjo del consumismo. Entre las sombras se está gestando una guerra entre Yatagarasu y la Sociedad Fantasma, invocadores de demonios que aprovechan los poderes sobrenaturales de estos seres.', NULL),
(300, 'Bayonetta', 48, 87, '2010-01-08', 'Third Person', 0, 300, 'Bayonetta es un título de acción en tercera persona a cargo de Platinum Games, creadores del Devil May Cry original, y Sega para PlayStation 3, Xbox 360, PC, Wii U y Nintendo Switch que nos pondrá en el papel de una bruja que podrá disparar tanto con las manos como con unas pistolas atadas a sus tobillos.', NULL),
(301, 'Tales of Xillia', NULL, 88, '2013-08-09', 'Third Person', 0, 301, 'Tales of Xillia es la decimotercera entrega de la serie J-RPG Tales de Namco Bandai Games en el que podremos controlar a dos personajes: Jude Mathis y Mila Maxwell; un estudiante de medicina y una mujer capaz de controlar los elementos respectivamente. En exclusiva para PlayStation 3.', NULL),
(302, 'Diablo II', NULL, 89, '2000-06-25', '', 0, 302, '', NULL),
(303, 'Bayonetta 2', 48, 87, '2014-10-24', 'Third Person', 0, 303, 'Bayonetta 2 es la secuela del hack&#x27;n&#x27;slash de Platinum Games creado por Hideki Kamiya exclusivo para Wii U y Nintendo Switch. Nacida de la unión prohibida entre los Sabios de Lumen y las Brujas de Umbra, la poderosa bruja Bayonetta viaja desde un pasado lejano al tiempo presente. Con su grácil estilo de lucha e incomparables poderes mágicos, es capaz de cautivar y aterrorizar a sus oponentes en sus momentos finales. Armada con nuevas armas y habilidades, Bayonetta abruma a sus enemigos con sus nuevos movimientos y ataques. Gracias a la magia, puede desatar una nueva habilidad llamada', NULL),
(304, 'Bayonetta 3', 48, 87, '2022-10-28', 'Third Person', 0, 304, 'Bayonetta 3, desarrollado por Platinum Games y editado por Nintendo para Switch, es la tercera entrega de la popular saga de acción beat&#x27;em up protagonizada por la bruja frente a malvados ángeles. La conocida bruja de Umbra luce nuevo vestuario de infarto y dos coletas que resultan curiosamente familiares, y deberá enfrentarse a una misteriosa fuerza maligna echando mano de sus inseparables pistolas y del Tiempo Brujo, una habilidad que ralentiza el paso del tiempo. En esta ocasión, Bayonetta se verá las caras con armas biológicas creadas por el hombre llamadas &quot;homúnculos&quot;.', NULL),
(305, 'Xenoblade Chronicles 2', NULL, 90, '2017-12-01', 'Third Person', 0, 305, 'Xenoblade Chronicles 2, desarrollado por Monolith Soft y distribuido por Nintendo para Nintendo Switch, sigue las aventuras de acción y rol de Xenoblade Chronicles y Xenoblade Chronicles X. Explorarás un océano infinito de nubes entre las que perviven los restos de una civilización sobre los lomos de enormes bestias llamadas titanes. Descubre la historia de Rex y su nueva amiga Pyra, un ser misterioso ser conocido como Blade que le otorga enorme poder. Juntos emprenderán la búsqueda del hogar perdido de Pyra, el Elíseo, la cuna de la humanidad.', NULL),
(306, 'Halo', 23, 91, '2002-03-14', 'First Person', 0, 306, '', NULL),
(307, 'Ys VIII lacrimosa of dana', 68, 92, '2017-09-15', 'Third Person', 0, 307, 'YS VIII: Lacrimosa of Dana es un nuevo JRPG a cargo de Falcom para PC, PlayStation 4 y PlayStation Vita en el que visitaremos la Isla de las Sirenas para vivir nuevas aventuras junto a sus protagonistas.', NULL),
(308, 'Super Mario Galaxy', NULL, 93, '2007-11-16', 'Third Person', 0, 308, '', NULL),
(309, 'Super Mario Galaxy 2', NULL, 93, '2010-06-11', 'Third Person', 0, 309, '', NULL),
(311, 'Live a live', NULL, 95, '2022-07-22', '', 0, 311, 'Live A Live, que se lanzó originalmente solo en Japón para la consola Super Famicom, revive en Switch, PC, PlayStation 4 y PlayStation 5 a cargo de historia y Square Enix. Disfruta por primera vez de este juego de rol en occidente, con gráficos HD-2D. Conoce a siete héroes, cada uno con su propia vida y habilidades, cuyas aventuras se desarrollan a lo largo de distintas épocas. Puedes jugar a cada historia en el orden que prefieras, descubriendo increíbles acontecimientos por el camino.', NULL),
(313, 'Metroid Dread', NULL, 32, '2021-10-08', 'Scroll', 0, 313, 'La historia de Samus continúa tras los acontecimientos de Metroid Fusion cuando aterriza en el planeta ZDR para investigar una misteriosa transmisión enviada a la Federación Galáctica. Este planeta remoto está totalmente dominado por agresivas formas de vida alienígena y seres mecánicos aterradores. Samus es más ágil que nunca, pero ¿logrará escapar de las garras de la amenaza inhumana que merodea por las profundidades de ZDR? Metroid Dread es un plataformas de acción y disparos a cargo de MercurySteam y Nintendo para Switch.', NULL),
(314, 'Hollow knight', NULL, 96, '2017-02-24', 'Scroll', 0, 314, 'Hollow Knight, desarrollado por Team Cherry para PC, Nintendo Switch, PlayStation 4 y Xbox One, es un plataformas de acción en 2D ambientado en un oscuro mundo de insectos y en el que deberemos enfrentarnos a 130 tipos de enemigos diferentes e incluso auténticos jefes finales de nivel gracias a nuestros extraños poderes.', NULL),
(315, 'Resident Evil', NULL, 64, '1997-08-12', 'Third Person', 0, 315, 'La aventura trascurre en un escenario espeluznante de terror, una verdadera pesadilla. El protagonista se enfrentará a zombies que escupen ácido, luchará contra perros mutantes, todo esto para unir las piezas de los rompecabezas que liberarán la casa de los monstruos resultantes de un experimento del govierno que ha salido mal.', NULL),
(317, 'Resident Evil 3', NULL, 64, '2000-01-01', 'Third Person', 0, 317, '', NULL),
(319, 'The quarry', NULL, 86, '2022-06-10', '', 0, 319, 'The Quarry es una aventura de terror a cargo de Supermassive Games y 2K Games para PC, PlayStation 4, Xbox One, PlayStation 5 y Xbox Series. Es el final del verano en los remotos bosques del norte del estado de Nueva York, y los jóvenes monitores de Hackett&#x27;s Quarry tienen el campamento para ellos solos durante una última noche. Eso significa que no hay niños, ni adultos, ni reglas. En esta emocionante historia cinematográfica, controlarás el destino de los nueve monitores del campamento a medida que sus planes de fiesta se convierten en una imprevisible noche de terror.', NULL),
(320, 'Xenoblade Chronicles ', NULL, 90, '2011-08-19', 'Third Person', 0, 320, 'Monolith Soft desarrolla este juego de rol para Wii  siguiendo la estela de  Xenogears y Xenoblade.', NULL),
(321, 'Xenoblade Chronicles Definitive Edition', NULL, 90, '2020-05-29', 'Third Person', 0, 321, 'Xenoblade Chronicles Definitive Edition es una nueva versión del exitoso RPG de acción de Wii a cargo de Monolith Soft y Nintendo para Switch. Gracias a un nuevo epílogo, gráficos en alta definición, mecánicas de juego más pulidas, pistas musicales remasterizadas y mucho más, tanto los jugadores curtidos como aquellos que se atrevan por primera vez con este juego podrán disfrutar al máximo de la versión definitiva de las aventuras de Shulk y compañía.', NULL),
(323, 'Destiny', NULL, 91, '2014-09-09', 'First Person', 0, 323, 'Destiny, desarrollado por Bungie y distribuido por Activision para PlayStation 3, PlayStation 4, Xbox 360 y Xbox One es el nuevo proyecto de los creadores de Halo, una aventura de acción first person shooter de ciencia ficción enfocado al juego cooperativo en línea.', NULL),
(324, 'Destiny 2', NULL, 91, '2017-09-06', 'First Person', 0, 324, 'Destiny 2, desarrollado por Bungie para PC, PlayStation 4, Xbox One y Stadia, es la secuela del título de acción first person shooter Destiny. La última ciudad segura de la humanidad ha caído ante una abrumadora fuerza invasora dirigida por Ghaul, el imponente comandante de la brutal Legión Roja, que ha despojado de su poder a los guardianes y obligado a huir a los supervivientes. Te aventurarás en mundos misteriosos e inexplorados del sistema solar para descubrir un arsenal de armas y nuevas habilidades de combate devastadoras. Para derrotar a la Legión Roja y hacer frente a Ghaul, deberás re', NULL),
(325, 'Blue Dragon', NULL, 84, '2007-08-31', '', 0, 325, '', NULL),
(326, 'Ghostwire Tokyo', NULL, 100, '2022-03-25', 'First Person', 0, 326, 'Ghostwire: Tokyo, desarrollado por Tango Gameworks y editado por Bethesda para PC, PlayStation 5 y Xbox Series, es una aventura de acción y terror en la que las fuerzas sobrenaturales mortales, provocadas por un peligroso ocultista, invaden Tokio y hacen que su población desaparezca en un instante. Alíate con una poderosa entidad espectral en su búsqueda de venganza. Domina un poderoso arsenal de habilidades para desentrañar la oscura verdad que se esconde tras la desaparición mientras te enfrentas a lo desconocido.', NULL),
(327, 'Gran Turismo 7', NULL, 101, '2022-03-04', '', 0, 327, 'Gran Turismo 7 es la nueva entrega de la saga de conducción a cargo de Polyphony Digital y Sony Interactive Entertainment para PlayStation 4 y PlayStation 5. Ya te guste competir, pilotar por diversión, coleccionar coches, optimizarlos, crear diseños o sacar fotografías, podrás encontrar tu trazada con esta increíble colección de modos de juego, que incluye algunos tan emblemáticos como Campaña GT, Arcade o Escuela de conducción. Con más de 420 coches disponibles en Brand Central y el concesionario de coches de segunda mano desde el primer día, Gran Turismo 7 recrea los modelos más clásicos y ', NULL),
(328, 'Kid Icarus', NULL, 102, '1987-02-15', '', 0, 328, 'Plataformas bidimensional en el que un ángel, Pit, debe salvar a una diosa, Palutena.', NULL),
(329, 'Spiderman', NULL, 42, '2018-09-07', '', 0, 329, 'En Spider-Man para PlayStation 4 encarnarás al superhéroe más emblemático del mundo y usarás las habilidades acrobáticas, la improvisación y las telarañas que han hecho famoso al trepamuros. Además, encontraremos en él elementos jamás vistos en un juego de Spider-Man. Desde cruzar la ciudad haciendo parkour y usando el entorno hasta un sistema de combate novedoso y escenas nuevas de superproducción... Este es un Spider-Man como nunca antes habías visto. Marvel e Insomniac Games se han unido para crear una historia de Spider-Man completamente nueva y auténtica.', NULL),
(330, 'Batman: Arkham Knight', NULL, 103, '2015-06-23', '', 0, 330, 'Batman llega a PlayStation 4, Xbox One y PC de la mano de Rocksteady y Warner Bros. con Batman: Arkham Knight, entrega que cierra la saga Arkham en una Gotham totalmente abierta y con la posibilidad de conducir el Batmóvil; una nueva aventura de acción en la que tendremos que enfrentarnos a los villanos más célebres de DC Comics.', NULL),
(331, 'Assassin’s Creed Odyssey', NULL, 28, '2018-10-05', '', 0, 331, 'Assassin&#x27;s Creed: Odyssey, desarrollado y editado por Ubisoft para PC, PlayStation 4, Xbox One y Stadia, es una nueva entrega de la popular saga de aventura y acción Assassin&#x27;s Creed en la que esta vez viajamos hasta la antigua Grecia. Pasa de la marginación a la gloria embarcándote en una odisea para descubrir los secretos de tu pasado y cambiar el destino de la antigua Grecia.', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos_remastered`
--

CREATE TABLE `juegos_remastered` (
  `id_original` int(11) NOT NULL,
  `id_remaster` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `juegos_remastered`
--

INSERT INTO `juegos_remastered` (`id_original`, `id_remaster`) VALUES
(5, 6),
(7, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_saga_juegos`
--

CREATE TABLE `orden_saga_juegos` (
  `id_saga` int(11) NOT NULL,
  `id_juego` int(11) NOT NULL,
  `orden` int(11) DEFAULT NULL,
  `es_spinof` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden_saga_juegos`
--

INSERT INTO `orden_saga_juegos` (`id_saga`, `id_juego`, `orden`, `es_spinof`) VALUES
(1, 7, 1, NULL),
(1, 8, 1, NULL),
(1, 9, 2, NULL),
(2, 10, 11, NULL),
(11, 191, 0, NULL),
(28, 143, 0, NULL),
(28, 145, 0, NULL),
(28, 147, 0, NULL),
(28, 149, 0, NULL),
(28, 151, 0, NULL),
(28, 152, 0, NULL),
(28, 156, 0, NULL),
(28, 158, 0, NULL),
(36, 175, 8, NULL),
(36, 176, 11, NULL),
(36, 177, 13, NULL),
(36, 178, 18, NULL),
(36, 179, 23, NULL),
(36, 180, 25, NULL),
(40, 130, 3, NULL),
(47, 136, 0, NULL),
(47, 137, 0, NULL),
(48, 300, 1, NULL),
(48, 303, 2, NULL),
(48, 304, 3, NULL),
(49, 138, 1, NULL),
(49, 139, 2, NULL),
(49, 140, 3, NULL),
(51, 141, 1, NULL),
(53, 144, 0, NULL),
(53, 185, 0, NULL),
(54, 159, 0, NULL),
(55, 148, 0, NULL),
(55, 153, 0, NULL),
(55, 155, 0, NULL),
(56, 154, 1, NULL),
(57, 157, 0, NULL),
(58, 161, 0, NULL),
(59, 164, 0, NULL),
(60, 168, 1, NULL),
(61, 169, 0, NULL),
(62, 171, 7, NULL),
(63, 172, 0, NULL),
(64, 173, 2, NULL),
(65, 181, 3, NULL),
(66, 194, 0, NULL),
(67, 195, 1, NULL),
(67, 196, 2, NULL),
(68, 290, 10, NULL),
(68, 307, 9, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id_pais` varchar(5) NOT NULL,
  `nombre_pais` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id_pais`, `nombre_pais`) VALUES
('CAN', 'Cánada'),
('CN', 'China'),
('EEUU', 'Estados Unidos'),
('ES', 'España'),
('FIN', 'Finlandia'),
('FR', 'Francia'),
('GB', 'Reino Unido'),
('GER', 'Alemania'),
('IT', 'Italia'),
('JP', 'Japón'),
('NL', 'Países Bajos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `nombre` varchar(24) NOT NULL,
  `apellido1` varchar(12) DEFAULT NULL,
  `apellido2` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre`, `apellido1`, `apellido2`) VALUES
(1, 'Shinichi', 'Okamoto', NULL),
(2, 'Yasumasa', 'Kimizuka', NULL),
(3, 'Yuki', 'Mikamo', NULL),
(4, 'Hiroyo', 'Matsuyama', NULL),
(5, 'Tetsuya', 'Watanabe', NULL),
(6, 'Hiromichi', 'Takahashi', NULL),
(7, 'Mark', 'Zuckerberg', NULL),
(8, 'Hidetaka', 'Miyazaki', NULL),
(9, 'Bill', 'Gates', NULL),
(10, 'Kenichiro', 'Yoshida', NULL),
(11, 'Yuka', 'Kitamura', NULL),
(12, 'Yasuhiro', 'Kitao', NULL),
(13, 'Berens', NULL, NULL),
(14, 'David', 'Anfossi', NULL),
(15, 'Jean-François', 'Dugas', NULL),
(16, 'Robert Darryl', 'Purdy', NULL),
(17, 'Richard', 'Jacques', NULL),
(18, 'Shuntaro', 'Furukawa ', NULL),
(19, 'Olivier', 'Proulx', NULL),
(20, 'Pierre', 'Tarno', NULL),
(21, 'Edward', 'Sananikone', NULL),
(22, 'Markus', 'Mäki', NULL),
(23, 'Lasse', 'Seppänen', NULL),
(24, 'Moisés', 'Rodolfo', NULL),
(25, 'Petri', 'Alanko', NULL),
(26, 'Chikara', 'Uchino', NULL),
(27, 'Takuya', 'Iwasaki', NULL),
(28, 'Yosuke', 'Saito', NULL),
(29, 'Yoko', 'Taro', NULL),
(30, 'Keiichi', 'Okabe', NULL),
(31, 'Kakeru', 'Ishihama', NULL),
(32, 'Keigo', 'Hoashi', NULL),
(33, 'Takafumi', 'Nishimura', NULL),
(34, 'Yoichi', 'Take', NULL),
(35, 'Ito', 'Saki', NULL),
(36, 'Atsushi', 'Inaba', NULL),
(37, 'Hideki', 'Kamiya', NULL),
(38, 'Eijiro', 'Nishimura', NULL),
(39, 'Ryouichi', 'Kitanishi', NULL),
(40, 'Toshiyuki', 'Nakamura', NULL),
(41, 'Toru', 'Narihiro', NULL),
(42, 'Kouhei', 'Maeda', NULL),
(43, 'Genki', 'Yokota', NULL),
(44, 'Hiroki', 'Morishita', NULL),
(45, 'Rei', 'Kondoh', NULL),
(46, 'Teruyuki', 'Toriyama', NULL),
(47, 'Ryan', 'Amon', NULL),
(48, 'Tsukasa', 'Saitoh', NULL),
(49, 'Michael', 'Wandmacher', NULL),
(50, 'Yuka', 'Kitamura', NULL),
(51, 'Cris', 'Velasco', NULL),
(52, 'Nobuyoshi', 'Suzuki', NULL),
(53, 'Adam', 'Saltsman', NULL),
(54, 'Andrew', 'Shouldice', NULL),
(55, 'Lifeformed', NULL, NULL),
(56, 'Janice', 'Kwan', NULL),
(57, 'Yosuke', 'Matsuda', NULL),
(58, 'Tetsuya', 'Nomura', NULL),
(59, 'Tatsuya', 'Kando', NULL),
(60, 'Takeharu', 'Ishimoto', NULL),
(61, 'Nicolo', 'Laurent', NULL),
(62, 'Ilkka', 'Paananen', NULL),
(63, 'Tim', 'Sweeney', NULL),
(64, 'Andy', 'Gavin', NULL),
(65, 'Jason', 'Rubin', NULL),
(66, 'Yumi', 'Yang', NULL),
(67, 'Hermen', 'Hulst', NULL),
(68, 'Arjan ', 'Brussee', NULL),
(69, 'Phil', 'Spencer', NULL),
(70, 'Bonnie', 'Ross', NULL),
(71, 'Ashley', 'Cheng', NULL),
(72, 'Nina', 'Kristensen', NULL),
(73, 'Bobby', 'Kotick', NULL),
(74, 'Andrew', 'Wilson', NULL),
(75, 'Yves ', 'Guillemot', NULL),
(76, 'Haruki', 'Satomi', NULL),
(77, 'Satoshi', 'Oshita', NULL),
(78, 'Jeff', 'Spangenberg', NULL),
(79, 'Enric', 'Alvarez', NULL),
(80, 'Kou', 'Shibusawa', NULL),
(81, 'Yasuharu', 'Kakihara', NULL),
(82, 'Alex', 'Garden', NULL),
(83, 'Akihiro', 'Hino', NULL),
(84, 'Gabe ', 'Newell', NULL),
(85, 'Fumito', 'Ueda', NULL),
(86, 'Minoru', 'Kidooka', NULL),
(87, 'Takashi', 'Nishiyama', NULL),
(88, 'Ray', 'Muzyka', NULL),
(89, 'Ted', 'Price', NULL),
(90, 'James', 'Livingston', NULL),
(91, 'Frank Theodore', 'Sagnier', NULL),
(92, 'Peter', 'Akerman', NULL),
(93, 'Ryan', 'Geithman', NULL),
(94, 'David', 'Zaslav', NULL),
(95, 'Steve', 'Goldstein', NULL),
(96, 'Ma', 'Huateng', NULL),
(97, 'Sid', 'Meier', NULL),
(98, 'Strauss', 'Zelnick', NULL),
(99, 'Glen', 'Schofield', NULL),
(100, 'Yosuke', 'Hayashi', NULL),
(101, 'Sam', 'Houser', NULL),
(102, 'Martyn', 'Chudley', NULL),
(103, 'Christoph', 'Hartmann', NULL),
(104, 'Hiroshi', 'Matsuyama', NULL),
(105, 'Daryl', 'Holt', NULL),
(106, 'Yoshiharu', 'Gotanda', NULL),
(107, 'Randy', 'Pitchford', NULL),
(108, 'Dan', 'Greenawalt', NULL),
(109, 'Darren', 'Jobling', NULL),
(110, 'Kenzō', 'Tsujimoto', NULL),
(111, 'Masafumi', 'Miyamoto', NULL),
(112, 'Wolfgang', 'Duhr', NULL),
(113, 'Brian', 'Farrell', NULL),
(114, 'Hermen', 'Hulst', NULL),
(115, 'Martin', 'Kenwright', NULL),
(116, 'Alex', 'Rigopulos', NULL),
(117, 'Eran', 'Egozy', NULL),
(118, 'Joel', 'Jewett', NULL),
(119, 'Mick', 'West', NULL),
(120, 'Christopher', 'Ward', NULL),
(121, 'David ', 'Lau-Kee', NULL),
(122, 'Hiroya', 'Hatsushiba', NULL),
(123, 'George', 'Kamitani', NULL),
(124, 'Ian', 'Curran', NULL),
(125, 'Kagemasa', 'Kozuki', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataforma`
--

CREATE TABLE `plataforma` (
  `id_plataforma` varchar(5) NOT NULL,
  `id_desarrollador` int(11) DEFAULT NULL,
  `nombre_plataforma` varchar(28) NOT NULL,
  `logo` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plataforma`
--

INSERT INTO `plataforma` (`id_plataforma`, `id_desarrollador`, `nombre_plataforma`, `logo`) VALUES
('360', 4, 'Xbox 360', '360'),
('3DS', 7, 'Nintendo 3DS', NULL),
('DC', 29, 'Dreamcast', NULL),
('DS', 7, 'Nintendo DS', NULL),
('GB', 7, 'Game Boy', 'GB'),
('GBA', 7, 'Game Boy Advance', NULL),
('GC', 7, 'Gamecube', NULL),
('MDR', 29, 'Mega Drive', 'MDR'),
('N64', 7, 'Nintendo 64', NULL),
('NES', 7, 'NES', NULL),
('NNDS', 7, 'New Nintendo DS', NULL),
('NSW', 7, 'Nintendo Switch', NULL),
('NSWCL', 7, 'Nintendo Switch Cloud', NULL),
('PC', NULL, 'PC', NULL),
('PS1', 5, 'PlayStation', NULL),
('PS2', 5, 'PlayStation 2', NULL),
('PS3', 5, 'PlayStation 3', NULL),
('PS4', 5, 'PlayStation 4', NULL),
('PS5', 5, 'PlayStation 5', NULL),
('PSP', 5, 'PlayStation Portable', NULL),
('PSV', 5, 'PlayStation Vita', NULL),
('QST2', 2, 'Meta Quest 2', NULL),
('SNES', 7, 'Super Nintendo', NULL),
('STD', NULL, 'Stadia', 'STD'),
('Wii', 7, 'Wii', NULL),
('WiiU', 7, 'Wii U', NULL),
('XBO', 4, 'Xbox One', NULL),
('XBS', 4, 'Xbox Series X/S', NULL),
('XBX', 4, 'Xbox', 'XBX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataformas_juegos`
--

CREATE TABLE `plataformas_juegos` (
  `id_plataforma` varchar(5) NOT NULL,
  `id_juego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plataformas_juegos`
--

INSERT INTO `plataformas_juegos` (`id_plataforma`, `id_juego`) VALUES
('360', 5),
('360', 7),
('360', 117),
('360', 118),
('360', 130),
('360', 138),
('360', 139),
('360', 140),
('360', 143),
('360', 144),
('360', 145),
('360', 146),
('360', 147),
('360', 148),
('360', 149),
('360', 150),
('360', 151),
('360', 152),
('360', 153),
('360', 154),
('360', 155),
('360', 156),
('360', 157),
('360', 158),
('360', 159),
('360', 160),
('360', 161),
('360', 163),
('360', 164),
('360', 165),
('360', 166),
('360', 168),
('360', 169),
('360', 170),
('360', 171),
('360', 172),
('360', 173),
('360', 174),
('360', 179),
('360', 180),
('360', 181),
('360', 182),
('360', 183),
('360', 184),
('360', 185),
('360', 187),
('360', 188),
('360', 189),
('360', 190),
('360', 191),
('360', 192),
('360', 295),
('360', 296),
('360', 300),
('360', 323),
('360', 325),
('3DS', 10),
('3DS', 109),
('3DS', 165),
('DS', 13),
('DS', 142),
('DS', 149),
('DS', 151),
('DS', 156),
('DS', 164),
('GBA', 175),
('GC', 106),
('MDR', 197),
('N64', 106),
('NES', 328),
('NSW', 105),
('NSW', 137),
('NSW', 141),
('NSW', 176),
('NSW', 182),
('NSW', 190),
('NSW', 235),
('NSW', 290),
('NSW', 292),
('NSW', 293),
('NSW', 300),
('NSW', 303),
('NSW', 304),
('NSW', 305),
('NSW', 311),
('NSW', 313),
('NSW', 314),
('NSW', 321),
('NSWCL', 3),
('PC', 2),
('PC', 3),
('PC', 4),
('PC', 5),
('PC', 6),
('PC', 8),
('PC', 9),
('PC', 12),
('PC', 105),
('PC', 107),
('PC', 108),
('PC', 110),
('PC', 111),
('PC', 112),
('PC', 113),
('PC', 114),
('PC', 115),
('PC', 116),
('PC', 117),
('PC', 118),
('PC', 130),
('PC', 137),
('PC', 138),
('PC', 139),
('PC', 140),
('PC', 143),
('PC', 144),
('PC', 145),
('PC', 146),
('PC', 147),
('PC', 148),
('PC', 149),
('PC', 150),
('PC', 151),
('PC', 152),
('PC', 153),
('PC', 154),
('PC', 155),
('PC', 156),
('PC', 158),
('PC', 160),
('PC', 163),
('PC', 164),
('PC', 165),
('PC', 168),
('PC', 172),
('PC', 173),
('PC', 176),
('PC', 177),
('PC', 179),
('PC', 180),
('PC', 181),
('PC', 182),
('PC', 183),
('PC', 185),
('PC', 188),
('PC', 189),
('PC', 190),
('PC', 191),
('PC', 194),
('PC', 230),
('PC', 290),
('PC', 291),
('PC', 292),
('PC', 293),
('PC', 299),
('PC', 302),
('PC', 307),
('PC', 314),
('PC', 315),
('PC', 317),
('PC', 319),
('PC', 331),
('PS1', 175),
('PS1', 176),
('PS1', 233),
('PS2', 108),
('PS2', 109),
('PS2', 133),
('PS2', 136),
('PS2', 165),
('PS2', 178),
('PS2', 187),
('PS2', 188),
('PS2', 193),
('PS2', 194),
('PS2', 195),
('PS2', 196),
('PS3', 7),
('PS3', 98),
('PS3', 117),
('PS3', 118),
('PS3', 130),
('PS3', 138),
('PS3', 139),
('PS3', 140),
('PS3', 141),
('PS3', 143),
('PS3', 144),
('PS3', 145),
('PS3', 146),
('PS3', 147),
('PS3', 148),
('PS3', 149),
('PS3', 151),
('PS3', 152),
('PS3', 153),
('PS3', 154),
('PS3', 155),
('PS3', 156),
('PS3', 157),
('PS3', 158),
('PS3', 159),
('PS3', 160),
('PS3', 161),
('PS3', 163),
('PS3', 164),
('PS3', 165),
('PS3', 166),
('PS3', 168),
('PS3', 170),
('PS3', 173),
('PS3', 174),
('PS3', 176),
('PS3', 179),
('PS3', 180),
('PS3', 181),
('PS3', 182),
('PS3', 183),
('PS3', 184),
('PS3', 185),
('PS3', 186),
('PS3', 187),
('PS3', 188),
('PS3', 189),
('PS3', 190),
('PS3', 191),
('PS3', 192),
('PS3', 296),
('PS3', 300),
('PS3', 301),
('PS3', 323),
('PS4', 2),
('PS4', 3),
('PS4', 4),
('PS4', 6),
('PS4', 8),
('PS4', 9),
('PS4', 11),
('PS4', 105),
('PS4', 137),
('PS4', 145),
('PS4', 158),
('PS4', 165),
('PS4', 176),
('PS4', 177),
('PS4', 182),
('PS4', 190),
('PS4', 230),
('PS4', 235),
('PS4', 290),
('PS4', 292),
('PS4', 293),
('PS4', 294),
('PS4', 298),
('PS4', 299),
('PS4', 307),
('PS4', 311),
('PS4', 314),
('PS4', 319),
('PS4', 323),
('PS4', 324),
('PS4', 327),
('PS4', 329),
('PS4', 330),
('PS4', 331),
('PS5', 2),
('PS5', 3),
('PS5', 4),
('PS5', 6),
('PS5', 105),
('PS5', 137),
('PS5', 177),
('PS5', 235),
('PS5', 290),
('PS5', 291),
('PS5', 299),
('PS5', 311),
('PS5', 319),
('PS5', 326),
('PS5', 327),
('PSP', 165),
('PSP', 170),
('PSP', 175),
('PSV', 165),
('PSV', 307),
('QST2', 1),
('SNES', 175),
('STD', 230),
('STD', 324),
('STD', 331),
('Wii', 148),
('Wii', 149),
('Wii', 151),
('Wii', 156),
('Wii', 161),
('Wii', 165),
('Wii', 183),
('Wii', 187),
('Wii', 188),
('Wii', 191),
('Wii', 300),
('Wii', 303),
('Wii', 308),
('Wii', 309),
('Wii', 320),
('WiiU', 145),
('WiiU', 147),
('XBO', 2),
('XBO', 3),
('XBO', 6),
('XBO', 8),
('XBO', 9),
('XBO', 12),
('XBO', 105),
('XBO', 137),
('XBO', 145),
('XBO', 158),
('XBO', 165),
('XBO', 176),
('XBO', 190),
('XBO', 230),
('XBO', 235),
('XBO', 292),
('XBO', 293),
('XBO', 299),
('XBO', 314),
('XBO', 319),
('XBO', 323),
('XBO', 324),
('XBO', 330),
('XBO', 331),
('XBS', 2),
('XBS', 3),
('XBS', 6),
('XBS', 12),
('XBS', 105),
('XBS', 137),
('XBS', 235),
('XBS', 299),
('XBS', 319),
('XBS', 326),
('XBX', 108),
('XBX', 114),
('XBX', 306);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productores_juegos`
--

CREATE TABLE `productores_juegos` (
  `id_productor` int(11) NOT NULL,
  `id_juego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productores_juegos`
--

INSERT INTO `productores_juegos` (`id_productor`, `id_juego`) VALUES
(2, 1),
(3, 1),
(6, 1),
(12, 2),
(19, 3),
(21, 4),
(23, 5),
(23, 6),
(27, 7),
(28, 7),
(28, 8),
(28, 9),
(38, 9),
(41, 10),
(42, 10),
(46, 11),
(53, 12),
(58, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saga_juegos`
--

CREATE TABLE `saga_juegos` (
  `id_saga` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `saga_juegos`
--

INSERT INTO `saga_juegos` (`id_saga`, `nombre`) VALUES
(1, 'NieR'),
(2, 'Fire Emblem'),
(3, 'The World Ends With You'),
(8, 'Souls'),
(9, 'Fallout'),
(10, 'Animal Crossing'),
(11, 'Need for Speed'),
(12, 'Castlevania'),
(13, 'Metroid'),
(14, 'Mortal Kombat'),
(15, 'Dragon Quest'),
(16, 'Gears of War'),
(17, 'Doom'),
(18, 'Devil May Cry'),
(19, 'God of War'),
(20, 'Silent Hill'),
(21, 'Assassin\'s Creed'),
(22, 'Super Smash Bros'),
(23, 'Halo'),
(24, 'Fifa'),
(25, 'Gran Turismo'),
(26, 'Uncharted'),
(27, 'Kingdom Hearts'),
(28, 'Call of Duty'),
(29, 'Street Fighter'),
(30, 'Sonic'),
(31, 'Pokémon'),
(32, 'Tomb Raider'),
(33, 'Resident Evil'),
(34, 'Metal Gear'),
(35, 'Grand Theft Auto'),
(36, 'Final Fantasy'),
(37, 'Super Mario'),
(38, 'The Legend of Zelda'),
(39, 'Starcraft'),
(40, 'Diablo'),
(41, 'Dynasty Warriors'),
(42, 'Warhammer 40.000'),
(43, 'Half Life'),
(44, 'Tales of'),
(45, 'Portal'),
(46, 'Tha Last of Us'),
(47, 'Dragon Ball'),
(48, 'Bayonetta'),
(49, 'Mass Effect'),
(50, 'Shin Megami Tensei: Persona'),
(51, 'Ni no Kuni'),
(52, 'Shin Megami Tensei: Soul Hackers'),
(53, 'Colin McRae - Dirt'),
(54, 'Red Dead'),
(55, 'Tom Clancy'),
(56, 'XCOM'),
(57, 'Dead or Alive'),
(58, 'Top Spin'),
(59, 'GRID'),
(60, 'Borderlands'),
(61, 'Forza'),
(62, 'Star Ocean'),
(63, 'FlatOut'),
(64, 'Lost Planet'),
(65, 'Castlevania Lords of Shadow'),
(66, 'Onimusha'),
(67, 'Shin Megami Tensei: Digital Devil Saga'),
(68, 'Ys');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `user` varchar(28) NOT NULL,
  `nombre` varchar(28) DEFAULT NULL,
  `apellido1` varchar(28) DEFAULT NULL,
  `apellido2` varchar(28) DEFAULT NULL,
  `tipo_usuario` varchar(5) NOT NULL,
  `fecha_nac` date DEFAULT NULL,
  `correo` varchar(40) NOT NULL,
  `contraseña` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `user`, `nombre`, `apellido1`, `apellido2`, `tipo_usuario`, `fecha_nac`, `correo`, `contraseña`) VALUES
(3, 'Raulito86', 'Raul', NULL, NULL, 'user', NULL, 'darkwarrior@hotmail.com', '$2y$10$xyGb49PuJCxPtquq2thoseuhRnFaoKZ.IFFGHL043Kc4y5KAJJuay'),
(4, 'Lopez86', 'Alberto', 'Lopez', '', 'user', '0000-00-00', 'lopezwoo@hotmail.com', '$2y$10$23bD3AREciMIudHfu2PJc.jB7izpJ421PbWPDp/PY4rW2IxC0AZQa'),
(5, 'Rea33', 'Carlos', 'Reales', 'Acon', 'admin', '1986-08-26', 'reales1986@gmail.com', '$2y$10$Gv1Dy6uMG2ZZMri/2P9tY.vpoxyCEDNI33s8uWlU9XQZgMt5mN9mW'),
(6, 'David32', 'David', '', '', 'user', '1987-03-24', 'diablohispano@hotmail.com', '$2y$10$dPFUvv5Et7v7Fzlfzzj5rOP1O9okNuyGcQVH1vyGGgUG4N6c8fGeS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_generos`
--

CREATE TABLE `usuario_generos` (
  `id_usuario` int(11) NOT NULL,
  `id_genero` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_generos`
--

INSERT INTO `usuario_generos` (`id_usuario`, `id_genero`) VALUES
(3, 'ACT'),
(3, 'MA'),
(4, 'ACT'),
(4, 'ARPG'),
(4, 'HS'),
(4, 'LCH'),
(5, 'ACT'),
(5, 'CON'),
(5, 'CSIM'),
(5, 'DP'),
(5, 'JRPG'),
(5, 'MA'),
(5, 'RPG'),
(5, 'TPS'),
(6, 'ARPG'),
(6, 'MA'),
(6, 'SIM'),
(6, 'SLK'),
(6, 'SRPG');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_juegosvotados`
--

CREATE TABLE `usuario_juegosvotados` (
  `id_juego` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `puntuacion` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_juegosvotados`
--

INSERT INTO `usuario_juegosvotados` (`id_juego`, `id_usuario`, `puntuacion`) VALUES
(1, 3, '8.20'),
(2, 3, '8.20'),
(2, 5, '9.80'),
(3, 3, '9.50'),
(11, 5, '10.00'),
(133, 5, '10.00'),
(159, 5, '9.00'),
(165, 6, '8.50'),
(179, 3, '6.70'),
(179, 5, '7.40'),
(192, 5, '8.00'),
(230, 5, '9.10'),
(291, 4, '9.30'),
(291, 5, '8.90'),
(298, 5, '8.20'),
(324, 5, '8.40'),
(326, 5, '7.70');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_plataformas`
--

CREATE TABLE `usuario_plataformas` (
  `id_usuario` int(11) NOT NULL,
  `id_plataforma` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_plataformas`
--

INSERT INTO `usuario_plataformas` (`id_usuario`, `id_plataforma`) VALUES
(3, 'PS3'),
(3, 'PS4'),
(4, 'PS1'),
(4, 'PS2'),
(4, 'PS3'),
(4, 'PS4'),
(4, 'PS5'),
(5, 'NSW'),
(5, 'PS2'),
(5, 'PS3'),
(5, 'PS4'),
(5, 'PS5'),
(6, '360'),
(6, 'PS2'),
(6, 'PS3');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compositores_juegos`
--
ALTER TABLE `compositores_juegos`
  ADD PRIMARY KEY (`id_compositor`,`id_juego`),
  ADD KEY `fk_juegos_compositores` (`id_juego`);

--
-- Indices de la tabla `desarrollador`
--
ALTER TABLE `desarrollador`
  ADD PRIMARY KEY (`id_desarrollador`),
  ADD KEY `fk_pais_desarrollador` (`id_pais`),
  ADD KEY `fk_director_desarrolladora` (`id_director`),
  ADD KEY `fk_propietario_desarrollador` (`id_propietario`);

--
-- Indices de la tabla `desarrollador_persona`
--
ALTER TABLE `desarrollador_persona`
  ADD PRIMARY KEY (`id_persona`,`id_desarrollador`),
  ADD KEY `fk_desarrollador_persona` (`id_desarrollador`);

--
-- Indices de la tabla `directores_juegos`
--
ALTER TABLE `directores_juegos`
  ADD PRIMARY KEY (`id_director`,`id_juego`),
  ADD KEY `fk_juegos_directores` (`id_juego`);

--
-- Indices de la tabla `distribuidor`
--
ALTER TABLE `distribuidor`
  ADD PRIMARY KEY (`id_distribuidor`),
  ADD KEY `fk_pais_distribuidor` (`id_pais`);

--
-- Indices de la tabla `distribuidores_juegos`
--
ALTER TABLE `distribuidores_juegos`
  ADD PRIMARY KEY (`id_distribuidor`,`id_juego`),
  ADD KEY `fk_juegos_distribuidor` (`id_juego`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `genero_juegos`
--
ALTER TABLE `genero_juegos`
  ADD PRIMARY KEY (`id_genero`,`id_juego`),
  ADD KEY `fk_juegos_generos` (`id_juego`);

--
-- Indices de la tabla `idioma`
--
ALTER TABLE `idioma`
  ADD PRIMARY KEY (`id_idioma`);

--
-- Indices de la tabla `idioma_texto`
--
ALTER TABLE `idioma_texto`
  ADD PRIMARY KEY (`id_idioma`,`id_juego`),
  ADD KEY `fk_juegos_texto` (`id_juego`);

--
-- Indices de la tabla `idioma_voces`
--
ALTER TABLE `idioma_voces`
  ADD PRIMARY KEY (`id_idioma`,`id_juego`),
  ADD KEY `fk_juegos_voces` (`id_juego`);

--
-- Indices de la tabla `imagenes_juego`
--
ALTER TABLE `imagenes_juego`
  ADD PRIMARY KEY (`id_juego`,`id_imagen`),
  ADD KEY `fk_imagen` (`id_imagen`);

--
-- Indices de la tabla `juego`
--
ALTER TABLE `juego`
  ADD PRIMARY KEY (`id_juego`),
  ADD UNIQUE KEY `un_juegos` (`nombre`),
  ADD KEY `fk_juegos_desarrollador` (`id_desarrollador`),
  ADD KEY `fk_saga` (`id_saga`);

--
-- Indices de la tabla `juegos_remastered`
--
ALTER TABLE `juegos_remastered`
  ADD PRIMARY KEY (`id_remaster`,`id_original`),
  ADD KEY `fk_original` (`id_original`);

--
-- Indices de la tabla `orden_saga_juegos`
--
ALTER TABLE `orden_saga_juegos`
  ADD PRIMARY KEY (`id_saga`,`id_juego`),
  ADD KEY `fk_juego_orden` (`id_juego`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id_pais`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `plataforma`
--
ALTER TABLE `plataforma`
  ADD PRIMARY KEY (`id_plataforma`),
  ADD UNIQUE KEY `logoUnico` (`logo`),
  ADD KEY `fk_plataforma_desarrollador` (`id_desarrollador`);

--
-- Indices de la tabla `plataformas_juegos`
--
ALTER TABLE `plataformas_juegos`
  ADD PRIMARY KEY (`id_plataforma`,`id_juego`),
  ADD KEY `fk_juegos_plataformas` (`id_juego`);

--
-- Indices de la tabla `productores_juegos`
--
ALTER TABLE `productores_juegos`
  ADD PRIMARY KEY (`id_productor`,`id_juego`),
  ADD KEY `fk_juegos_productores` (`id_juego`);

--
-- Indices de la tabla `saga_juegos`
--
ALTER TABLE `saga_juegos`
  ADD PRIMARY KEY (`id_saga`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`user`);

--
-- Indices de la tabla `usuario_generos`
--
ALTER TABLE `usuario_generos`
  ADD PRIMARY KEY (`id_usuario`,`id_genero`),
  ADD KEY `fk_generos_usuario` (`id_genero`);

--
-- Indices de la tabla `usuario_juegosvotados`
--
ALTER TABLE `usuario_juegosvotados`
  ADD PRIMARY KEY (`id_juego`,`id_usuario`),
  ADD KEY `fk_id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuario_plataformas`
--
ALTER TABLE `usuario_plataformas`
  ADD PRIMARY KEY (`id_usuario`,`id_plataforma`),
  ADD KEY `fk_plataformas_usuarios` (`id_plataforma`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `desarrollador`
--
ALTER TABLE `desarrollador`
  MODIFY `id_desarrollador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de la tabla `distribuidor`
--
ALTER TABLE `distribuidor`
  MODIFY `id_distribuidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `id_juego` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT de la tabla `saga_juegos`
--
ALTER TABLE `saga_juegos`
  MODIFY `id_saga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compositores_juegos`
--
ALTER TABLE `compositores_juegos`
  ADD CONSTRAINT `fk_compositores_juegos` FOREIGN KEY (`id_compositor`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `fk_juegos_compositores` FOREIGN KEY (`id_juego`) REFERENCES `juego` (`id_juego`);

--
-- Filtros para la tabla `desarrollador`
--
ALTER TABLE `desarrollador`
  ADD CONSTRAINT `fk_director_desarrolladora` FOREIGN KEY (`id_director`) REFERENCES `persona` (`id_persona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pais_desarrollador` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_propietario_desarrollador` FOREIGN KEY (`id_propietario`) REFERENCES `desarrollador` (`id_desarrollador`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `desarrollador_persona`
--
ALTER TABLE `desarrollador_persona`
  ADD CONSTRAINT `fk_desarrollador_persona` FOREIGN KEY (`id_desarrollador`) REFERENCES `desarrollador` (`id_desarrollador`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_persona_desarrollador` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `directores_juegos`
--
ALTER TABLE `directores_juegos`
  ADD CONSTRAINT `fk_directores_juegos` FOREIGN KEY (`id_director`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `fk_juegos_directores` FOREIGN KEY (`id_juego`) REFERENCES `juego` (`id_juego`);

--
-- Filtros para la tabla `distribuidor`
--
ALTER TABLE `distribuidor`
  ADD CONSTRAINT `fk_pais_distribuidor` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`);

--
-- Filtros para la tabla `distribuidores_juegos`
--
ALTER TABLE `distribuidores_juegos`
  ADD CONSTRAINT `fk_distribuidor_juegos` FOREIGN KEY (`id_distribuidor`) REFERENCES `distribuidor` (`id_distribuidor`),
  ADD CONSTRAINT `fk_juegos_distribuidor` FOREIGN KEY (`id_juego`) REFERENCES `juego` (`id_juego`);

--
-- Filtros para la tabla `genero_juegos`
--
ALTER TABLE `genero_juegos`
  ADD CONSTRAINT `fk_generos_juegos` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_juegos_generos` FOREIGN KEY (`id_juego`) REFERENCES `juego` (`id_juego`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `idioma_texto`
--
ALTER TABLE `idioma_texto`
  ADD CONSTRAINT `fk_idiomas_texto` FOREIGN KEY (`id_idioma`) REFERENCES `idioma` (`id_idioma`),
  ADD CONSTRAINT `fk_juegos_texto` FOREIGN KEY (`id_juego`) REFERENCES `juego` (`id_juego`);

--
-- Filtros para la tabla `idioma_voces`
--
ALTER TABLE `idioma_voces`
  ADD CONSTRAINT `fk_idiomas_voces` FOREIGN KEY (`id_idioma`) REFERENCES `idioma` (`id_idioma`),
  ADD CONSTRAINT `fk_juegos_voces` FOREIGN KEY (`id_juego`) REFERENCES `juego` (`id_juego`);

--
-- Filtros para la tabla `imagenes_juego`
--
ALTER TABLE `imagenes_juego`
  ADD CONSTRAINT `fk_imagen` FOREIGN KEY (`id_imagen`) REFERENCES `juego` (`imagen`),
  ADD CONSTRAINT `fk_juego` FOREIGN KEY (`id_juego`) REFERENCES `juego` (`id_juego`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `juegos_remastered`
--
ALTER TABLE `juegos_remastered`
  ADD CONSTRAINT `fk_original` FOREIGN KEY (`id_original`) REFERENCES `juego` (`id_juego`),
  ADD CONSTRAINT `fk_remaster` FOREIGN KEY (`id_remaster`) REFERENCES `juego` (`id_juego`);

--
-- Filtros para la tabla `orden_saga_juegos`
--
ALTER TABLE `orden_saga_juegos`
  ADD CONSTRAINT `fk_juego_orden` FOREIGN KEY (`id_juego`) REFERENCES `juego` (`id_juego`),
  ADD CONSTRAINT `fk_saga_orden` FOREIGN KEY (`id_saga`) REFERENCES `saga_juegos` (`id_saga`);

--
-- Filtros para la tabla `plataforma`
--
ALTER TABLE `plataforma`
  ADD CONSTRAINT `fk_plataforma_desarrollador` FOREIGN KEY (`id_desarrollador`) REFERENCES `desarrollador` (`id_desarrollador`);

--
-- Filtros para la tabla `plataformas_juegos`
--
ALTER TABLE `plataformas_juegos`
  ADD CONSTRAINT `fk_juegos_plataformas` FOREIGN KEY (`id_juego`) REFERENCES `juego` (`id_juego`),
  ADD CONSTRAINT `fk_plataforma_juegos` FOREIGN KEY (`id_plataforma`) REFERENCES `plataforma` (`id_plataforma`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `productores_juegos`
--
ALTER TABLE `productores_juegos`
  ADD CONSTRAINT `fk_juegos_productores` FOREIGN KEY (`id_juego`) REFERENCES `juego` (`id_juego`),
  ADD CONSTRAINT `fk_productores_juegos` FOREIGN KEY (`id_productor`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `usuario_generos`
--
ALTER TABLE `usuario_generos`
  ADD CONSTRAINT `fk_generos_usuario` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_generos` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_juegosvotados`
--
ALTER TABLE `usuario_juegosvotados`
  ADD CONSTRAINT `fk_id_juego` FOREIGN KEY (`id_juego`) REFERENCES `juego` (`id_juego`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_plataformas`
--
ALTER TABLE `usuario_plataformas`
  ADD CONSTRAINT `fk_plataformas_usuarios` FOREIGN KEY (`id_plataforma`) REFERENCES `plataforma` (`id_plataforma`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_plataformas` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
