-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-05-2023 a las 11:07:03
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

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
(75, 'Atlus', 1986, NULL, 'JP', 124, 29);

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
  `nombre_genero` varchar(28) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `nombre_genero`) VALUES
('ACMA', 'Accion - Mundo Abierto'),
('ACT', 'Action'),
('ADV', 'Aventura'),
('ARPG', 'Action-RPG'),
('BEU', 'Beat´Em Up'),
('CON', 'Conduccion - Arcade'),
('CSIM', 'Conduccion - Simulación'),
('DP', 'Deporte'),
('FPS', 'First Person Shooter'),
('HS', 'Hack and Slash'),
('JRPG', 'Japan-RPG'),
('LCH', 'Lucha'),
('MTVN', 'Metroidvania'),
('MUS', 'Musou'),
('MUSIC', 'Musical'),
('PLTF', 'Plataformas'),
('PZZ', 'Puzzles'),
('RPGMA', 'RPG - Mundo Abierto'),
('RTS', 'Real Time Strategy'),
('SIM', 'Simulador'),
('SLK', 'Soulslike'),
('SNBX', 'Sandbox'),
('SRPG', 'Strategy-RPG'),
('TBS', 'Turn-Based Strategy'),
('TERR', 'Terror'),
('TPS', 'Third Person Shooter');

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
('ACMA', 159),
('ACT', 3),
('ACT', 4),
('ACT', 148),
('ACT', 153),
('ACT', 162),
('ADV', 1),
('ADV', 3),
('ADV', 106),
('ADV', 133),
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
('BEU', 4),
('BEU', 183),
('CON', 144),
('CON', 160),
('CON', 163),
('CON', 164),
('CON', 172),
('CON', 184),
('CON', 185),
('CON', 186),
('CON', 191),
('CSIM', 169),
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
('HS', 7),
('HS', 8),
('HS', 9),
('HS', 170),
('HS', 181),
('HS', 194),
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
('LCH', 136),
('LCH', 137),
('LCH', 157),
('LCH', 174),
('LCH', 189),
('LCH', 190),
('MUS', 108),
('MUSIC', 187),
('MUSIC', 188),
('PZZ', 1),
('PZZ', 117),
('PZZ', 142),
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
  `imagen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `juego`
--

INSERT INTO `juego` (`id_juego`, `nombre`, `id_saga`, `id_desarrollador`, `lanzamiento`, `perspectiva`, `solo_multijugador`, `imagen`) VALUES
(1, 'Tales of Onogoro', NULL, 1, '2022-03-17', 'RV-First Person', 0, 1),
(2, 'Elden Ring', NULL, 3, '2022-02-25', 'Third Person', 0, 2),
(3, 'Marvel´s Guardians of the Galaxy', NULL, 6, '2021-10-26', 'Third Person', 0, 3),
(4, 'Sifu', NULL, 8, '2022-02-08', 'Third Person', 0, 4),
(5, 'Alan Wake', NULL, 9, '2010-05-14', 'Third Person', 0, 5),
(6, 'Alan Wake Remastered', NULL, 9, '2021-10-05', 'Third Person', 0, 6),
(7, 'Nier Replicant', 1, 10, '2010-04-23', 'Third Person', 0, 7),
(8, 'NieR Replicant ver.1.22474487139…', 1, 11, '2021-04-23', 'Third Person', 0, 8),
(9, 'NieR Automata', 1, 12, '2017-03-10', 'Third Person', 0, 9),
(10, 'Fire Emblem: Awakening', 2, 13, '2013-04-19', 'God Vision', 0, NULL),
(11, 'Bloodborne', NULL, 3, '2015-03-25', 'Third Person', 0, 11),
(12, 'Tunic', NULL, 14, '2022-03-16', 'Isometric', 0, NULL),
(13, 'The World Ends With You', 3, 15, '2008-04-18', 'Scroll', 0, NULL),
(98, 'Dark Souls', 8, 3, '2011-10-07', 'Third Person', 0, NULL),
(105, 'Immortals Fenyx Rising', NULL, 28, '2020-12-03', 'Third Person', 0, 105),
(106, 'The Legend of Zelda: Ocarina of Time', 38, 7, '1998-12-11', 'Third Person', 0, NULL),
(107, 'StarCraft II: Wings of Liberty', 39, 26, '2010-07-27', 'Isometric', 0, NULL),
(108, 'Dynasty Warriors 4', 41, 33, '2003-06-27', 'Third Person', 0, NULL),
(109, 'Dragon Quest VIII: El periplo del Rey Ma', 15, 36, '2006-04-12', 'Third Person', 0, NULL),
(110, 'Warhammer 40.000: Dawn of War', 42, 35, '2004-09-27', 'Isometric', 0, NULL),
(111, 'Warhammer 40.000: Dawn of War - Winter A', 42, 35, '2005-10-13', 'Isometric', 0, NULL),
(112, 'Warhammer 40.000 : Dawn of War - Dark Cr', 42, 35, '2006-10-25', 'Isometric', 0, NULL),
(113, 'Warhammer 40.000: Dawn of War - Soulstor', 42, 35, '2008-03-04', 'Isometric', 0, NULL),
(114, 'Half Life 2', 43, 37, '2004-11-16', 'First Person', 0, NULL),
(115, 'Half-Life 2 Episode One', 43, 37, '2006-06-01', 'First Person', 0, NULL),
(116, 'Half-Life 2 Episode Two', 43, 37, '2007-10-01', 'First Person', 0, NULL),
(117, 'Portal', 45, 37, '2007-10-10', 'First Person', 0, NULL),
(118, 'Team Fortress 2', NULL, 37, '2007-12-18', 'First Person', 1, NULL),
(130, 'Diablo III', 40, 26, '2012-05-12', 'Isometric', NULL, 130),
(133, 'Shadow of the Colossus', NULL, 38, '2006-02-15', 'Third Person', NULL, NULL),
(136, 'Dragon Ball Z: Budokai 3', 47, 40, '2004-11-19', 'Lateral', NULL, NULL),
(137, 'Dragon Ball FighterZ', 47, 39, '2018-01-26', 'Lateral', NULL, 137),
(138, 'Mass Effect', 49, 41, '2007-11-23', 'Third Person', NULL, 138),
(139, 'Mass Effect 2', 49, 41, '2010-01-29', 'Third Person', NULL, 139),
(140, 'Mass Effect 3', 49, 41, '2012-03-08', 'Third Person', NULL, NULL),
(141, 'Ni no Kuni: La ira de la Bruja Blanca', 51, 36, '2013-02-01', 'Third Person', NULL, NULL),
(142, 'Practise English: Face Everyday Situatio', NULL, 7, '2007-10-26', 'Gestión de Menus', NULL, NULL),
(143, 'Call of Duty 4: Modern Warfare', 28, 43, '2007-11-09', 'First Person', NULL, NULL),
(144, 'Dirt 3', 53, 44, '2011-05-24', 'First Person', NULL, NULL),
(145, 'Call of Duty: Ghosts', 28, 43, '2013-11-05', 'First Person', NULL, NULL),
(146, 'El Señor de los Anillos: La Guerra del Norte', NULL, 47, '2011-11-11', 'Third Person', NULL, 146),
(147, 'Call of Duty: Black Ops II', 28, 45, '2012-11-13', 'First Person', NULL, NULL),
(148, 'Tom Clancy\'s HAWX 2', 55, 28, '2010-09-09', 'First & Third Person', NULL, 148),
(149, 'Call of Duty: Black Ops', 28, 45, '2010-11-09', 'First Person', NULL, NULL),
(150, 'Left 4 Dead 2', NULL, 49, '2009-11-19', 'First Person', 1, NULL),
(151, 'Call of Duty: World at War', 28, 26, '2008-11-14', 'First Person', NULL, NULL),
(152, 'Call of Duty: Modern Warfare 2', 28, 43, '2009-11-10', 'First Person', NULL, NULL),
(153, 'Tom Clancy\'s HAWX', 55, 28, '2009-03-05', 'First & Third Person', NULL, 153),
(154, 'XCOM: Enemy Within', 56, 51, '2013-11-15', 'Isometric', NULL, NULL),
(155, 'Tom Clancy’s Rainbow Six Vegas 2', 55, 28, '2008-04-17', 'First Person', NULL, NULL),
(156, 'Call of Duty: Modern Warfare 3', 28, 52, '2011-11-08', 'First Person', NULL, NULL),
(157, 'Dead or Alive 5 Ultimate', 57, 53, '2013-09-06', 'Lateral', NULL, NULL),
(158, 'Call of Duty: Advanced Warfare', 28, 52, '2014-11-04', 'First Person', NULL, NULL),
(159, 'Red Dead Redemption', 54, 54, '2010-05-21', 'Third Person', NULL, 159),
(160, 'Blur', NULL, 55, '2010-05-28', 'Third Person', NULL, NULL),
(161, 'Top Spin 4', 58, 56, '2011-03-18', 'Third Person', NULL, NULL),
(162, 'Asura\'s Wrath', NULL, 57, '2012-02-24', 'Third Person', NULL, 162),
(163, 'F1 2013', NULL, 44, '2013-10-04', 'First & Third Person', NULL, NULL),
(164, 'Race Driver: GRID', 59, 44, '2008-05-30', 'First & Third Person', NULL, NULL),
(165, 'FIFA 14', NULL, 58, '2013-09-26', 'Third Person', NULL, NULL),
(166, 'Resonance of Fate', NULL, 59, '2010-03-26', 'Third Person', NULL, NULL),
(168, 'Borderlands', 60, 60, '2009-10-23', 'First Person', NULL, NULL),
(169, 'Forza Motorsport 3', 61, 61, '2009-10-23', 'First & Third Person', NULL, NULL),
(170, 'Dante\'s Inferno', NULL, 62, '2010-02-05', 'Third Person', NULL, 170),
(171, 'Star Ocean: The Last Hope', 62, 59, '2009-06-05', 'Third Person', NULL, NULL),
(172, 'FlatOut Ultimate Carnage', 63, 63, '2007-07-12', 'First & Third Person', NULL, NULL),
(173, 'Lost Planet 2', 64, 64, '2010-05-11', 'Third Person', NULL, 173),
(174, 'Dragon Ball Z Budokai HD Collection', NULL, 30, '2012-11-02', 'Lateral', NULL, NULL),
(175, 'Final Fantasy VI', 36, 65, '1994-04-02', 'Isometric', NULL, NULL),
(176, 'Final Fantasy VII', 36, 65, '1997-01-31', 'Isometric', NULL, NULL),
(177, 'Final Fantasy VII Remake', 36, 15, '2020-04-10', 'Third Person', NULL, NULL),
(178, 'Final Fantasy X', 36, 65, '2002-05-29', 'Third Person', NULL, NULL),
(179, 'Final Fantasy XIII', 36, 15, '2010-03-09', 'Third Person', NULL, NULL),
(180, 'Lightning Returns: Final Fantasy', 36, 15, '2014-02-14', 'Third Person', NULL, 180),
(181, 'Castlevania: Lords of Shadow 2', 65, 32, '2014-02-27', 'Third Person', NULL, 181),
(182, 'Air Conflicts: Pacific Carriers', NULL, 66, '2013-02-21', 'First & Third Person', NULL, NULL),
(183, 'Spider-Man: Web of Shadows', NULL, 45, '2008-10-21', 'Third Person', NULL, NULL),
(184, 'MX vs ATV Alive', NULL, 67, '2011-05-20', 'First & Third Person', NULL, NULL),
(185, 'Dirt Showdown', 53, 44, '2012-05-25', 'First & Third Person', NULL, NULL),
(186, 'MotorStorm: Pacific Rift', NULL, 69, '2008-11-07', 'Third Person', NULL, NULL),
(187, 'Rock Band', NULL, 70, '2008-10-02', 'Isometric', NULL, NULL),
(188, 'Guitar Hero 3', NULL, 71, '2007-11-23', 'Isometric', NULL, NULL),
(189, 'Street Fighter IV', NULL, 64, '2009-02-20', 'Lateral', NULL, NULL),
(190, 'Naruto Shippuden: Ultimate Ninja Storm 2', NULL, 57, '2010-10-15', 'Lateral', NULL, NULL),
(191, 'Need for Speed Hot Pursuit', 11, 72, '2010-11-19', 'First & Third Person', NULL, NULL),
(192, 'Eternal Sonata', NULL, 73, '2007-10-19', 'Isometric', NULL, NULL),
(193, 'Grimgrimoire', NULL, 74, '2007-09-28', 'Scroll', NULL, NULL),
(194, 'Onimusha 3', 66, 64, '2004-07-09', 'Third Person', NULL, NULL),
(195, 'Shin Megami Tensei: Digital Devil Saga', 67, 75, '2006-07-21', 'Third Person', NULL, NULL),
(196, 'Shin Megami Tensei: Digital Devil Saga 2', 67, 75, '2007-04-27', 'Third Person', NULL, 196);

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
(67, 196, 2, NULL);

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
(124, 'Ian', 'Curran', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataforma`
--

CREATE TABLE `plataforma` (
  `id_plataforma` varchar(5) NOT NULL,
  `id_desarrollador` int(11) DEFAULT NULL,
  `nombre_plataforma` varchar(28) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plataforma`
--

INSERT INTO `plataforma` (`id_plataforma`, `id_desarrollador`, `nombre_plataforma`) VALUES
('GBA', 7, 'Game Boy Advance'),
('N3DS', 7, 'Nintendo 3DS'),
('N64', 7, 'Nintendo 64'),
('NDS', 7, 'Nintendo DS'),
('NES', 7, 'NES'),
('NGC', 7, 'Gamecube'),
('NNDS', 7, 'New Nintendo DS'),
('NSW', 7, 'Nintendo Switch'),
('NSWCL', 7, 'Nintendo Switch Cloud'),
('PC', NULL, 'PC'),
('PS1', 5, 'PlayStation'),
('PS2', 5, 'PlayStation 2'),
('PS3', 5, 'PlayStation 3'),
('PS4', 5, 'PlayStation 4'),
('PS5', 5, 'PlayStation 5'),
('PSP', 5, 'PlayStation Portable'),
('PSV', 5, 'PlayStation Vita'),
('QST2', 2, 'Meta Quest 2'),
('SNES', 7, 'Super Nintendo'),
('WII', 7, 'Wii'),
('WIIU', 7, 'Wii U'),
('XB', 4, 'Xbox'),
('XB360', 4, 'Xbox 360'),
('XBO', 4, 'Xbox One'),
('XBSXS', 4, 'Xbox Series X/S');

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
('GBA', 175),
('N3DS', 10),
('N3DS', 109),
('N3DS', 165),
('N64', 106),
('NDS', 13),
('NDS', 142),
('NDS', 149),
('NDS', 151),
('NDS', 156),
('NDS', 164),
('NGC', 106),
('NSW', 105),
('NSW', 137),
('NSW', 141),
('NSW', 176),
('NSW', 182),
('NSW', 190),
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
('PS1', 175),
('PS1', 176),
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
('PS3', 162),
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
('PS5', 2),
('PS5', 3),
('PS5', 4),
('PS5', 6),
('PS5', 105),
('PS5', 137),
('PS5', 177),
('PSP', 165),
('PSP', 170),
('PSP', 175),
('PSV', 165),
('QST2', 1),
('SNES', 175),
('WII', 148),
('WII', 149),
('WII', 151),
('WII', 156),
('WII', 161),
('WII', 165),
('WII', 183),
('WII', 187),
('WII', 188),
('WII', 191),
('WIIU', 145),
('WIIU', 147),
('XB', 108),
('XB', 114),
('XB360', 5),
('XB360', 7),
('XB360', 117),
('XB360', 118),
('XB360', 130),
('XB360', 138),
('XB360', 139),
('XB360', 140),
('XB360', 143),
('XB360', 144),
('XB360', 145),
('XB360', 146),
('XB360', 147),
('XB360', 148),
('XB360', 149),
('XB360', 150),
('XB360', 151),
('XB360', 152),
('XB360', 153),
('XB360', 154),
('XB360', 155),
('XB360', 156),
('XB360', 157),
('XB360', 158),
('XB360', 159),
('XB360', 160),
('XB360', 161),
('XB360', 162),
('XB360', 163),
('XB360', 164),
('XB360', 165),
('XB360', 166),
('XB360', 168),
('XB360', 169),
('XB360', 170),
('XB360', 171),
('XB360', 172),
('XB360', 173),
('XB360', 174),
('XB360', 179),
('XB360', 180),
('XB360', 181),
('XB360', 182),
('XB360', 183),
('XB360', 184),
('XB360', 185),
('XB360', 187),
('XB360', 188),
('XB360', 189),
('XB360', 190),
('XB360', 191),
('XB360', 192),
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
('XBSXS', 2),
('XBSXS', 3),
('XBSXS', 6),
('XBSXS', 12),
('XBSXS', 105),
('XBSXS', 137);

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
(67, 'Shin Megami Tensei: Digital Devil Saga');

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
(1, '', 'Carlos', 'Reales', 'Acon', 'admin', '1986-04-26', 'reales1986@gmail.com', '1234'),
(2, 'reales1986@gmail.com', NULL, NULL, NULL, 'user', NULL, 'reales1986@gmail.com', '$2y$10$pAjG8og0L2f69svvSWBFY.SgpMgryjTDNE5HPB1i3kcKOZbHIx022'),
(3, 'Raulito86', 'Raul', NULL, NULL, 'user', NULL, 'darkwarrior@hotmail.com', '$2y$10$xyGb49PuJCxPtquq2thoseuhRnFaoKZ.IFFGHL043Kc4y5KAJJuay');

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
(3, 'ACMA'),
(3, 'ACT');

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
(3, 'PS4');

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
  ADD UNIQUE KEY `imagen_unica` (`imagen`),
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
  MODIFY `id_desarrollador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de la tabla `distribuidor`
--
ALTER TABLE `distribuidor`
  MODIFY `id_distribuidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `id_juego` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT de la tabla `saga_juegos`
--
ALTER TABLE `saga_juegos`
  MODIFY `id_saga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `fk_director_desarrolladora` FOREIGN KEY (`id_director`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `fk_pais_desarrollador` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`),
  ADD CONSTRAINT `fk_propietario_desarrollador` FOREIGN KEY (`id_propietario`) REFERENCES `desarrollador` (`id_desarrollador`);

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
-- Filtros para la tabla `juego`
--
ALTER TABLE `juego`
  ADD CONSTRAINT `fk_juegos_desarrollador` FOREIGN KEY (`id_desarrollador`) REFERENCES `desarrollador` (`id_desarrollador`),
  ADD CONSTRAINT `fk_saga` FOREIGN KEY (`id_saga`) REFERENCES `saga_juegos` (`id_saga`);

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
  ADD CONSTRAINT `fk_plataforma_juegos` FOREIGN KEY (`id_plataforma`) REFERENCES `plataforma` (`id_plataforma`);

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
-- Filtros para la tabla `usuario_plataformas`
--
ALTER TABLE `usuario_plataformas`
  ADD CONSTRAINT `fk_plataformas_usuarios` FOREIGN KEY (`id_plataforma`) REFERENCES `plataforma` (`id_plataforma`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_plataformas` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
