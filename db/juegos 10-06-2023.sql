-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 10-06-2023 a las 20:39:50
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
-- Base de datos: `real_is_gamer`
--

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
  `perspectiva` varchar(48) DEFAULT NULL,
  `solo_multijugador` tinyint(1) DEFAULT 0,
  `imagen` int(11) DEFAULT NULL,
  `descripcion` varchar(700) DEFAULT NULL,
  `punt_usuarios` decimal(10,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `juego`:
--

--
-- Volcado de datos para la tabla `juego`
--

INSERT INTO `juego` (`id_juego`, `nombre`, `id_saga`, `id_desarrollador`, `lanzamiento`, `perspectiva`, `solo_multijugador`, `imagen`, `descripcion`, `punt_usuarios`) VALUES
(1, 'Tales of Onogoro', NULL, 1, '2022-03-17', 'RV-First Person', 0, 1, NULL, 8.2),
(2, 'Elden Ring', NULL, 3, '2022-02-25', 'Third Person', 0, 2, NULL, 9.0),
(3, 'Marvel´s Guardians of the Galaxy', NULL, 6, '2021-10-26', 'Third Person', 0, 3, NULL, 9.5),
(4, 'Sifu', NULL, 8, '2022-02-08', 'Third Person', 0, 4, NULL, 7.3),
(5, 'Alan Wake', NULL, 9, '2010-05-14', 'Third Person', 0, 5, NULL, NULL),
(6, 'Alan Wake Remastered', NULL, 9, '2021-10-05', 'Third Person', 0, 6, NULL, NULL),
(7, 'Nier', 1, 10, '2010-04-23', 'Third Person', 0, 7, NULL, 8.1),
(8, 'NieR Replicant ver.1.22474487139…', 1, 11, '2021-04-23', 'Third Person', 0, 8, NULL, 7.0),
(9, 'NieR Automata', 1, 12, '2017-03-10', 'Third Person', 0, 9, NULL, 5.7),
(10, 'Fire Emblem: Awakening', 2, 13, '2013-04-19', 'God Vision', 0, 10, NULL, NULL),
(11, 'Bloodborne', NULL, 3, '2015-03-25', 'Third Person', 0, 11, NULL, 8.0),
(12, 'Tunic', NULL, 14, '2022-03-16', 'Isometric', 0, 12, 'Tunic es un juego de aventura y rol de corte independiente desarrollada por Finji Games. Pensado para Xbox One y PC, este videojuego bebe de títulos muy venerados como Zelda y nos cuenta la fantástica historia de un zorro que se embarca en una bonita historia para recordar su pasado y su vida anteriorTunic es un juego de aventura y rol de corte independiente desarrollada por Finji Games. Pensado para Xbox One y PC, este videojuego bebe de títulos muy venerados como Zelda y nos cuenta la fantástica historia de un zorro que se embarca en una bonita historia para recordar su pasado y su vida anterior.', 8.7),
(13, 'The World Ends With You', 3, 15, '2008-04-18', 'Scroll', 0, 13, NULL, NULL),
(98, 'Dark Souls', 8, 3, '2011-10-07', 'Third Person', 0, 98, NULL, NULL),
(105, 'Immortals Fenyx Rising', NULL, 28, '2020-12-03', 'Third Person', 0, 105, NULL, 8.2),
(106, 'The Legend of Zelda: Ocarina of Time', 38, 7, '1998-12-11', 'Third Person', 0, 106, NULL, NULL),
(107, 'StarCraft II: Wings of Liberty', 39, 26, '2010-07-27', '', 0, 107, NULL, NULL),
(108, 'Dynasty Warriors 4', 41, 33, '2003-06-27', 'Third Person', 0, 108, NULL, NULL),
(109, 'Dragon Quest VIII: El periplo del Rey Maldito', 15, 36, '2006-04-12', 'Third Person', 0, 109, NULL, NULL),
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
(133, 'Shadow of the Colossus', NULL, 38, '2006-02-15', 'Third Person', NULL, 133, NULL, 10.0),
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
(159, 'Red Dead Redemption', 54, 54, '2010-05-21', 'Third Person', NULL, 159, NULL, 9.5),
(160, 'Blur', NULL, 55, '2010-05-28', 'Third Person', NULL, 160, NULL, NULL),
(161, 'Top Spin 4', 58, 56, '2011-03-18', 'Third Person', NULL, 161, NULL, NULL),
(163, 'F1 2013', NULL, 44, '2013-10-04', 'First & Third Person', NULL, 163, NULL, NULL),
(164, 'Race Driver: GRID', 59, 44, '2008-05-30', 'First & Third Person', NULL, 164, NULL, NULL),
(165, 'FIFA 14', NULL, 58, '2013-09-26', 'Third Person', NULL, 165, NULL, 8.5),
(166, 'Resonance of Fate', NULL, 59, '2010-03-26', 'Third Person', NULL, 166, NULL, NULL),
(168, 'Borderlands', 60, 60, '2009-10-23', 'First Person', NULL, 168, NULL, NULL),
(169, 'Forza Motorsport 3', 61, 61, '2009-10-23', 'First & Third Person', NULL, 169, NULL, NULL),
(170, 'Dante\'s Inferno', NULL, 62, '2010-02-05', 'Third Person', NULL, 170, NULL, NULL),
(171, 'Star Ocean: The Last Hope', 62, 59, '2009-06-05', 'Third Person', NULL, 171, NULL, NULL),
(172, 'FlatOut Ultimate Carnage', 63, 63, '2007-07-12', 'First & Third Person', NULL, 172, NULL, NULL),
(173, 'Lost Planet 2', 64, 64, '2010-05-11', 'Third Person', NULL, 173, 'Volvemos a un planeta helado lleno de aliens con los que acabar en esta segunda parte de Lost Planet para PS3 que apuesta por el modo cooperativo. Tanto si estamos jugando realmente online como si no, estaremos siempre acompañado por otros personajes (controlados por la máquina u otros jugadores) que nos ayudarán en la lucha contra aliens, piratas espaciales y demás fauna. Contaremos con un considerable arsenal a nuestra disposición, aparte de mechas, en una segunda parte que hace los entornos mucho más variados que en el original.', 7.1),
(174, 'Dragon Ball Z Budokai HD Collection', NULL, 30, '2012-11-02', 'Lateral', NULL, 174, '', NULL),
(175, 'Final Fantasy VI', 36, 65, '1994-04-02', 'Isometric', NULL, 175, NULL, NULL),
(176, 'Final Fantasy VII', 36, 65, '1997-01-31', 'Isometric', NULL, 176, NULL, NULL),
(177, 'Final Fantasy VII Remake', 36, 15, '2020-04-10', 'Third Person', NULL, 177, NULL, NULL),
(178, 'Final Fantasy X', 36, 65, '2002-05-29', 'Third Person', NULL, 178, NULL, NULL),
(179, 'Final Fantasy XIII', 36, 15, '2010-03-09', 'Third Person', NULL, 179, NULL, 7.1),
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
(192, 'Eternal Sonata', NULL, 73, '2007-10-19', 'Isometric', NULL, 192, NULL, 8.0),
(193, 'Grimgrimoire', NULL, 74, '2007-09-28', 'Scroll', NULL, 295, NULL, NULL),
(194, 'Onimusha 3', 66, 64, '2004-07-09', 'Third Person', NULL, 295, NULL, NULL),
(195, 'Shin Megami Tensei: Digital Devil Saga', 67, 75, '2006-07-21', 'Third Person', NULL, 295, NULL, NULL),
(196, 'Shin Megami Tensei: Digital Devil Saga 2', 67, 75, '2007-04-27', 'Third Person', NULL, 295, NULL, NULL),
(197, 'Rocket Knight Adventures', NULL, 76, '1993-08-05', 'Scroll', NULL, 295, NULL, NULL),
(230, 'Red Dead Redemption 2', 54, 54, '2018-10-26', 'Third Person', 0, 230, 'Red Dead Redemption 2 es la secuela de la aventura de acción Red Dead Redemption a cargo de Rockstar Games para PlayStation 4, Xbox One, PC y Stadia que nos trae una historia épica sobre la vida en el despiadado corazón de América. Su vasto y evocador mundo sentará, a su vez, los cimientos para una experiencia multijugador online totalmente nueva. América, 1899. Con los representantes de la ley dando caza a las últimas bandas de forajidos, el fin del Salvaje Oeste es ya una realidad. Aquellos que no se rinden o sucumben son eliminados. Después de que un atraco se vaya al traste en la ciudad de', 9.1),
(233, 'Vagrant Story', NULL, 78, '0000-00-00', '', 0, 233, 'Square demuestra nuevamente su arte y maestría a la hora de hacer RPGS con Vagrant Story, una historia épica que gira entorno a un círculo de conspiraciones entre la iglesia, la nobleza y la monarquía, en un marco como la bella ciudad de Lea-Monde y con el secreto de la vida eterna como trasfondo...', NULL),
(235, 'Papetura', NULL, 79, '0000-00-00', '', 0, 235, 'Papetura es una aventura gráfica tipo point &amp; click realizada por completo con recortes de papel a cargo de Petums para PC, PlayStation 4, Xbox One, PlayStation 5, Xbox Series y Switch. Las pequeñas criaturas Pape y Tura habrán de enfrentarse a unos monstruos que intentarán quemar su amado mundo de papel. Entra en este mundo de papel único y misterioso, envuelto en luces y sombras y con música ambiental compuesta de Floex.', NULL),
(290, 'Ys IX: Monstrum Nox', 68, 80, '2021-02-05', '', 0, 290, 'Ys IX: Monstrum Nox es un videojuego de acción RPG a cargo de Nihon Falcom y NIS America para PC, PlayStation 4 y Switch en el que Adol Christin es maldecido por una misteriosa mujer y se convierte en un Monstrum, un poderoso ser que puede exorcizar monstruos. Para escapar de la ciudad de Balduq, debe aliarse con otros cinco Monstrums, cada uno con sus propios y exclusivos Gifts, y detener al Grimwald Nox, una dimensión sombría a punto de desbordarse en el mundo real.', NULL),
(291, 'Returnal', NULL, 81, '2021-04-30', 'Third Person', 0, 291, 'Returnal es un videojuego de acción y disparos de corte toguelike con una ambientación de ciencia ficción a cargo de Housemarque y Sony Interactive Entertainment para PlayStation 5 y PC. Tras el aterrizaje forzoso en este mundo cambiante, Selene debe buscar en el desolado paisaje una antigua civilización para poder escapar. Sola y aislada, se ve abocada a luchar con uñas y dientes para sobrevivir. Cae derrotada una y otra vez, lo que la obliga a reiniciar su viaje cada vez que muere.', 9.1),
(292, 'Doom Eternal', NULL, 82, '2020-03-20', 'First Person', 0, 292, 'DOOM Eternal, desarrollado por id Software y editado por Bethesda para PC, PlayStation 4, Xbox One y Switch, es la secuela directa del celebrado título de acción tipo shooter de 2016, el reboot de tan mítica franquicia. Un personaje mucho más poderoso deberá enfrentarse al doble de demonios de la primera entrega. En el papel del DOOM Slayer, descubrirás a tu regreso que los demonios han invadido la Tierra. Mándalos al infierno y descubre los orígenes del Slayer y su perpetua misión de matanza y destrucción... hasta el final.', NULL),
(293, 'Doom', NULL, 82, '2016-05-13', 'First Person', 0, 293, 'DOOM, el terror y la acción de la serie FPS de id Software regresan gracias a Bethesda en forma de reboot para PC, PlayStation 4, Xbox One y Nintendo Switch. La acción frenética, la velocidad y el gore vuelven a ser los protagonistas en esta nueva entrega de la saga del aclamado shooter en primera persona, en el que volveremos a cazar a los demonios a lo largo de una intensa campaña. Además, como creador del formato &quot;deathmatch&quot; en los videojuegos, DOOM vuelve otra vez con un potente modo multijugador y un editor de juego que permitirá crear y compartir contenidos con el resto del mu', NULL),
(294, 'Ghost of Tsushima', NULL, 83, '2020-07-17', '', 0, 294, 'Ghost of Tsushima, desarrollado por Sucker Punch y editado por Sony para PlayStation 4, es una aventura de acción ambientada en el Japón feudal y en el que un samurái trata de hacer frente a la invasión del ejército mongol en el año 1274. Acero y dominio de la espada: domina ambos aspectos para sobrevivir a este tremendo desafío, donde el ejército mongol se ha hecho con el control de la isla de Tsushima. Colócate la armadura, afila tu katana y tensa el arco en tu rol como Jin, un maltratado samurái que permanece en la isla con la esperanza de acabar con el despiadado khan y su salvaje imperio.', NULL),
(295, 'Lost Odyssey', NULL, 84, '2008-02-29', '', 0, 295, '', NULL),
(296, 'Asura´s Wrath', NULL, 57, '2012-02-24', 'Third Person', 0, 296, 'Juego de acción del estudio CyberConnect2 en el que el protagonista podrá invocar una gran criatura para combatir a los enemigos.', NULL),
(298, 'Until Dawn', NULL, 86, '2015-08-26', 'Third Person', 0, 298, 'Supermassive Games convierte la típica película de miedo adolescente en un videojuego de misterio donde reina la oscuridad y el terror. Ideado en un principio para PlayStation 3, da el salto finalmente a PlayStation 4.', 8.2),
(299, 'Soul Hackers 2', NULL, 75, '2022-08-25', 'Third Person', 0, 299, 'Soul Hackers 2 es un RPG a cargo de Atlus y Sega para PC, PlayStation 4, Xbox One, PlayStation 5 y Xbox Series que escribe un nuevo capítulo en la saga Devil Summoner Megami Tensei. Entre el brillo de las luces de neón, los avances tecnológicos han hecho que el ser humano haya quedado dominado por el influjo del consumismo. Entre las sombras se está gestando una guerra entre Yatagarasu y la Sociedad Fantasma, invocadores de demonios que aprovechan los poderes sobrenaturales de estos seres.', 7.5),
(300, 'Bayonetta', 48, 87, '2010-01-08', 'Third Person', 0, 300, 'Bayonetta es un título de acción en tercera persona a cargo de Platinum Games, creadores del Devil May Cry original, y Sega para PlayStation 3, Xbox 360, PC, Wii U y Nintendo Switch que nos pondrá en el papel de una bruja que podrá disparar tanto con las manos como con unas pistolas atadas a sus tobillos.', NULL),
(301, 'Tales of Xillia', NULL, 88, '2013-08-09', 'Third Person', 0, 301, 'Tales of Xillia es la decimotercera entrega de la serie J-RPG Tales de Namco Bandai Games en el que podremos controlar a dos personajes: Jude Mathis y Mila Maxwell; un estudiante de medicina y una mujer capaz de controlar los elementos respectivamente. En exclusiva para PlayStation 3.', NULL),
(302, 'Diablo II', NULL, 89, '2000-06-25', '', 0, 302, '', NULL),
(303, 'Bayonetta 2', 48, 87, '2014-10-24', 'Third Person', 0, 303, 'Bayonetta 2 es la secuela del hack&#x27;n&#x27;slash de Platinum Games creado por Hideki Kamiya exclusivo para Wii U y Nintendo Switch. Nacida de la unión prohibida entre los Sabios de Lumen y las Brujas de Umbra, la poderosa bruja Bayonetta viaja desde un pasado lejano al tiempo presente. Con su grácil estilo de lucha e incomparables poderes mágicos, es capaz de cautivar y aterrorizar a sus oponentes en sus momentos finales. Armada con nuevas armas y habilidades, Bayonetta abruma a sus enemigos con sus nuevos movimientos y ataques. Gracias a la magia, puede desatar una nueva habilidad llamada', NULL),
(304, 'Bayonetta 3', 48, 87, '2022-10-28', 'Third Person', 0, 304, 'Bayonetta 3, desarrollado por Platinum Games y editado por Nintendo para Switch, es la tercera entrega de la popular saga de acción beat&#x27;em up protagonizada por la bruja frente a malvados ángeles. La conocida bruja de Umbra luce nuevo vestuario de infarto y dos coletas que resultan curiosamente familiares, y deberá enfrentarse a una misteriosa fuerza maligna echando mano de sus inseparables pistolas y del Tiempo Brujo, una habilidad que ralentiza el paso del tiempo. En esta ocasión, Bayonetta se verá las caras con armas biológicas creadas por el hombre llamadas &quot;homúnculos&quot;.', 6.8),
(305, 'Xenoblade Chronicles 2', NULL, 90, '2017-12-01', 'Third Person', 0, 305, 'Xenoblade Chronicles 2, desarrollado por Monolith Soft y distribuido por Nintendo para Nintendo Switch, sigue las aventuras de acción y rol de Xenoblade Chronicles y Xenoblade Chronicles X. Explorarás un océano infinito de nubes entre las que perviven los restos de una civilización sobre los lomos de enormes bestias llamadas titanes. Descubre la historia de Rex y su nueva amiga Pyra, un ser misterioso ser conocido como Blade que le otorga enorme poder. Juntos emprenderán la búsqueda del hogar perdido de Pyra, el Elíseo, la cuna de la humanidad.', NULL),
(306, 'Halo', 23, 91, '2002-03-14', 'First Person', 0, 306, '', NULL),
(307, 'Ys VIII lacrimosa of dana', 68, 92, '2017-09-15', 'Third Person', 0, 307, 'YS VIII: Lacrimosa of Dana es un nuevo JRPG a cargo de Falcom para PC, PlayStation 4 y PlayStation Vita en el que visitaremos la Isla de las Sirenas para vivir nuevas aventuras junto a sus protagonistas.', NULL),
(308, 'Super Mario Galaxy', NULL, 93, '2007-11-16', 'Third Person', 0, 308, '', NULL),
(309, 'Super Mario Galaxy 2', NULL, 93, '2010-06-11', 'Third Person', 0, 309, '', NULL),
(311, 'Live a live', NULL, 95, '2022-07-22', '', 0, 311, 'Live A Live, que se lanzó originalmente solo en Japón para la consola Super Famicom, revive en Switch, PC, PlayStation 4 y PlayStation 5 a cargo de historia y Square Enix. Disfruta por primera vez de este juego de rol en occidente, con gráficos HD-2D. Conoce a siete héroes, cada uno con su propia vida y habilidades, cuyas aventuras se desarrollan a lo largo de distintas épocas. Puedes jugar a cada historia en el orden que prefieras, descubriendo increíbles acontecimientos por el camino.', NULL),
(313, 'Metroid Dread', NULL, 32, '2021-10-08', 'Scroll', 0, 313, 'La historia de Samus continúa tras los acontecimientos de Metroid Fusion cuando aterriza en el planeta ZDR para investigar una misteriosa transmisión enviada a la Federación Galáctica. Este planeta remoto está totalmente dominado por agresivas formas de vida alienígena y seres mecánicos aterradores. Samus es más ágil que nunca, pero ¿logrará escapar de las garras de la amenaza inhumana que merodea por las profundidades de ZDR? Metroid Dread es un plataformas de acción y disparos a cargo de MercurySteam y Nintendo para Switch.', 10.0),
(314, 'Hollow knight', NULL, 96, '2017-02-24', 'Scroll', 0, 314, 'Hollow Knight, desarrollado por Team Cherry para PC, Nintendo Switch, PlayStation 4 y Xbox One, es un plataformas de acción en 2D ambientado en un oscuro mundo de insectos y en el que deberemos enfrentarnos a 130 tipos de enemigos diferentes e incluso auténticos jefes finales de nivel gracias a nuestros extraños poderes.', 10.0),
(315, 'Resident Evil', NULL, 64, '1997-08-12', 'Third Person', 0, 315, 'La aventura trascurre en un escenario espeluznante de terror, una verdadera pesadilla. El protagonista se enfrentará a zombies que escupen ácido, luchará contra perros mutantes, todo esto para unir las piezas de los rompecabezas que liberarán la casa de los monstruos resultantes de un experimento del govierno que ha salido mal.', NULL),
(317, 'Resident Evil 3', NULL, 64, '2000-01-01', 'Third Person', 0, 317, '', 8.1),
(319, 'The quarry', NULL, 86, '2022-06-10', '', 0, 319, 'The Quarry es una aventura de terror a cargo de Supermassive Games y 2K Games para PC, PlayStation 4, Xbox One, PlayStation 5 y Xbox Series. Es el final del verano en los remotos bosques del norte del estado de Nueva York, y los jóvenes monitores de Hackett&#x27;s Quarry tienen el campamento para ellos solos durante una última noche. Eso significa que no hay niños, ni adultos, ni reglas. En esta emocionante historia cinematográfica, controlarás el destino de los nueve monitores del campamento a medida que sus planes de fiesta se convierten en una imprevisible noche de terror.', 8.4),
(320, 'Xenoblade Chronicles ', NULL, 90, '2011-08-19', 'Third Person', 0, 320, 'Monolith Soft desarrolla este juego de rol para Wii  siguiendo la estela de  Xenogears y Xenoblade.', NULL),
(321, 'Xenoblade Chronicles Definitive Edition', NULL, 90, '2020-05-29', 'Third Person', 0, 321, 'Xenoblade Chronicles Definitive Edition es una nueva versión del exitoso RPG de acción de Wii a cargo de Monolith Soft y Nintendo para Switch. Gracias a un nuevo epílogo, gráficos en alta definición, mecánicas de juego más pulidas, pistas musicales remasterizadas y mucho más, tanto los jugadores curtidos como aquellos que se atrevan por primera vez con este juego podrán disfrutar al máximo de la versión definitiva de las aventuras de Shulk y compañía.', NULL),
(323, 'Destiny', NULL, 91, '2014-09-09', 'First Person', 0, 323, 'Destiny, desarrollado por Bungie y distribuido por Activision para PlayStation 3, PlayStation 4, Xbox 360 y Xbox One es el nuevo proyecto de los creadores de Halo, una aventura de acción first person shooter de ciencia ficción enfocado al juego cooperativo en línea.', NULL),
(324, 'Destiny 2', NULL, 91, '2017-09-06', 'First Person', 0, 324, 'Destiny 2, desarrollado por Bungie para PC, PlayStation 4, Xbox One y Stadia, es la secuela del título de acción first person shooter Destiny. La última ciudad segura de la humanidad ha caído ante una abrumadora fuerza invasora dirigida por Ghaul, el imponente comandante de la brutal Legión Roja, que ha despojado de su poder a los guardianes y obligado a huir a los supervivientes. Te aventurarás en mundos misteriosos e inexplorados del sistema solar para descubrir un arsenal de armas y nuevas habilidades de combate devastadoras. Para derrotar a la Legión Roja y hacer frente a Ghaul, deberás re', 8.4),
(325, 'Blue Dragon', NULL, 84, '2007-08-31', '', 0, 325, '', NULL),
(326, 'Ghostwire Tokyo', NULL, 100, '2022-03-25', 'First Person', 0, 326, 'Ghostwire: Tokyo, desarrollado por Tango Gameworks y editado por Bethesda para PC, PlayStation 5 y Xbox Series, es una aventura de acción y terror en la que las fuerzas sobrenaturales mortales, provocadas por un peligroso ocultista, invaden Tokio y hacen que su población desaparezca en un instante. Alíate con una poderosa entidad espectral en su búsqueda de venganza. Domina un poderoso arsenal de habilidades para desentrañar la oscura verdad que se esconde tras la desaparición mientras te enfrentas a lo desconocido.', 9.3),
(327, 'Gran Turismo 7', NULL, 101, '2022-03-04', '', 0, 327, 'Gran Turismo 7 es la nueva entrega de la saga de conducción a cargo de Polyphony Digital y Sony Interactive Entertainment para PlayStation 4 y PlayStation 5. Ya te guste competir, pilotar por diversión, coleccionar coches, optimizarlos, crear diseños o sacar fotografías, podrás encontrar tu trazada con esta increíble colección de modos de juego, que incluye algunos tan emblemáticos como Campaña GT, Arcade o Escuela de conducción. Con más de 420 coches disponibles en Brand Central y el concesionario de coches de segunda mano desde el primer día, Gran Turismo 7 recrea los modelos más clásicos y ', NULL),
(328, 'Kid Icarus', NULL, 102, '1987-02-15', '', 0, 328, 'Plataformas bidimensional en el que un ángel, Pit, debe salvar a una diosa, Palutena.', NULL),
(329, 'Spiderman', NULL, 42, '2018-09-07', '', 0, 329, 'En Spider-Man para PlayStation 4 encarnarás al superhéroe más emblemático del mundo y usarás las habilidades acrobáticas, la improvisación y las telarañas que han hecho famoso al trepamuros. Además, encontraremos en él elementos jamás vistos en un juego de Spider-Man. Desde cruzar la ciudad haciendo parkour y usando el entorno hasta un sistema de combate novedoso y escenas nuevas de superproducción... Este es un Spider-Man como nunca antes habías visto. Marvel e Insomniac Games se han unido para crear una historia de Spider-Man completamente nueva y auténtica.', NULL),
(330, 'Batman: Arkham Knight', NULL, 103, '2015-06-23', '', 0, 330, 'Batman llega a PlayStation 4, Xbox One y PC de la mano de Rocksteady y Warner Bros. con Batman: Arkham Knight, entrega que cierra la saga Arkham en una Gotham totalmente abierta y con la posibilidad de conducir el Batmóvil; una nueva aventura de acción en la que tendremos que enfrentarnos a los villanos más célebres de DC Comics.', NULL),
(331, 'Assassin’s Creed Odyssey', NULL, 28, '2018-10-05', '', 0, 331, 'Assassin&#x27;s Creed: Odyssey, desarrollado y editado por Ubisoft para PC, PlayStation 4, Xbox One y Stadia, es una nueva entrega de la popular saga de aventura y acción Assassin&#x27;s Creed en la que esta vez viajamos hasta la antigua Grecia. Pasa de la marginación a la gloria embarcándote en una odisea para descubrir los secretos de tu pasado y cambiar el destino de la antigua Grecia.', NULL),
(332, 'Overwatch', NULL, 89, '2016-05-24', NULL, 0, 332, 'Overwatch es un nuevo título de acción first person shooter online por equipos a cargo de Blizzard para PC, PlayStation 4, Xbox One y Switch con una marcada estética cartoon y la particularidad de que los personajes pueden usar los llamados amplificadores para desatar diferentes poderes y habilidades. Elige a tu héroe de entre un variopinto elenco de soldados, científicos, aventureros y rarezas. Retuerce el tiempo, desafía la física y da rienda suelta a un arsenal de armas y poderes extraordinarios. Únete al shooter por equipos definitivo. El mundo necesita héroes.', NULL),
(333, 'Ico', NULL, 38, '2002-03-20', NULL, 0, 333, 'Misteriosa aventura desarrollada por los estudios de Sony en la que encarnamos el papel de un joven condenado al encierro en un castillo por una deformidad física en la Europa Medieval. Unos sueños pondrán al héroe sobre la pista de una joven que se encuentra atrapada en el castillo, dando comienzo así una inquietante aventura.', NULL),
(335, 'Conkers Bad Fur Day', NULL, 105, '2001-04-05', NULL, 0, 335, 'Es el último juego de RARE para la Nintendo 64. Conker es un plataformas 3D con grandes dosis de acción, violencia y humor escatológico.', NULL),
(336, 'Banjo-Kazooie:Baches y Cachivaches', NULL, 105, '2008-11-14', NULL, 0, 336, '', NULL),
(337, 'Ratchet and Clank', NULL, 42, '2016-04-20', 'Third Person', 0, 337, 'Ratchet &amp; Clank con lanzamiento planeado para 2016, ha sido desarrollado por Insomniac Games y distribuido por Sony. Se trata de una remasterización de la primera aventura de Ratchet &amp; Clank para PlayStation 4 que acompañará al estreno de la película basada en la popular franquicia.', NULL),
(338, 'Bulletstorm', NULL, 106, '2011-02-24', 'First Person', 0, 338, '', NULL),
(339, 'Lies of P', NULL, 107, '2023-09-19', 'Third Person', 0, 339, 'Lies of P es un videojuego de acción RPG de estilo Soulslike a cargo de Round8 Studio y Neowiz para PC, PlayStation 4, Xbox One, PlayStation 5 y Xbox Series ambientado en la era de la Belle Époque que da un giro oscuro al conocido cuento de Pinocho. Despertado por una voz misteriosa, Pinocho debe encontrar la manera de salvar la ciudad de Krat de ser asolada por los títeres. Pinocho, con su corazón especial, aprende a convertirse en un verdadero humano mintiendo.', NULL),
(340, 'The Legend of Zelda: Breath of the Wild', NULL, 7, '2017-03-03', 'Third Person', 0, 340, 'The Legend of Zelda: Breath of the Wild es la nueva aventura de acción de Nintendo para Wii U y Nintendo Switch que nos presenta el título más ambicioso de la saga con un mundo abierto por explorar y en el que realizar todo tipo de acciones como escalar además de otras clásicas como nadar o montar a caballo. Link despierta tras un profundo sueño de 100 años en un misterioso templo en el reino de Hyrule; junto a él, deberemos descubrir su pasado mientras escuchamos una voz que nos incita a enfrentarnos a un malvado ser que provocó el llamado cataclismo: Ganon.', 9.7),
(341, 'The Legend of Zelda: Tears of the Kingdom', NULL, 7, '2023-05-12', 'Third Peron', 0, 341, 'The Legend of Zelda: Tears of the Kingdom es una aventura de acción a cargo de Nintendo para Switch. En esta secuela de The Legend of Zelda: Breath of the Wild, el escenario de la aventura de Link se ha ampliado para incluir los vastos cielos de Hyrule. Sigue tu propio camino a lo largo y ancho de los inmensos paisajes de Hyrule y las extrañas islas que flotan en las alturas. ¿Lograrás dominar el poder de las nuevas habilidades de Link y luchar contra las fuerzas malévolas que amenazan al reino?', 10.0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `juego`
--
ALTER TABLE `juego`
  ADD PRIMARY KEY (`id_juego`),
  ADD UNIQUE KEY `un_juegos` (`nombre`),
  ADD KEY `fk_juegos_desarrollador` (`id_desarrollador`),
  ADD KEY `fk_saga` (`id_saga`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `id_juego` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=342;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
