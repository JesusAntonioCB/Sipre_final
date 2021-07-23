-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2019 a las 23:30:45
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sipre`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acl_classes`
--

CREATE TABLE `acl_classes` (
  `id` int(10) UNSIGNED NOT NULL,
  `class_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acl_entries`
--

CREATE TABLE `acl_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `object_identity_id` int(10) UNSIGNED DEFAULT NULL,
  `security_identity_id` int(10) UNSIGNED NOT NULL,
  `field_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ace_order` smallint(5) UNSIGNED NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `granting_strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acl_object_identities`
--

CREATE TABLE `acl_object_identities` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_object_identity_id` int(10) UNSIGNED DEFAULT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `object_identifier` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entries_inheriting` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acl_object_identity_ancestors`
--

CREATE TABLE `acl_object_identity_ancestors` (
  `object_identity_id` int(10) UNSIGNED NOT NULL,
  `ancestor_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acl_security_identities`
--

CREATE TABLE `acl_security_identities` (
  `id` int(10) UNSIGNED NOT NULL,
  `identifier` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `username` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int(11) NOT NULL,
  `examen_id` int(11) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `carrera` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `turno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tiempo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `codigoUsuario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `examenAuto_id` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `grupo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `evaluacion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `calificacionE1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `calificacionE2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `calificacionE3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `calificacionS1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `calificacionS2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `calificacionS3` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `examen_id`, `nombre`, `carrera`, `turno`, `fecha`, `tiempo`, `codigoUsuario`, `examenAuto_id`, `username`, `grupo`, `evaluacion`, `contrasena`, `calificacionE1`, `calificacionE2`, `calificacionE3`, `calificacionS1`, `calificacionS2`, `calificacionS3`) VALUES
(61, NULL, 'Avila Chavez', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:15:15', '00:24:48', 'o6mm2va4k88q61s3qu8b', 1, 'Alhinna Jazmin ', '2', 'Entrada', 'jazavi23', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=50'),
(62, NULL, 'Jesus Ramiro Vazquez Treviño', 'Química área Industrial', 'Matutino', '2019-08-19 08:15:32', '00:59:34', 'i9bn5lu8u78h34h4mf4l', 1, 'J.Vazquez19', '2', 'Entrada', 'perry500', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=95'),
(63, NULL, 'Gil Eduardo Martinez Vázquez ', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:15:34', '00:51:50', 'v9xq4dy9j21r58e4fs1z', 1, 'Gil Eduardo', '2', 'Entrada', 'Gileduardo', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=85', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=30'),
(64, NULL, 'Erik Alessandro Wong Arredondo', 'Química área Industrial', 'Matutino', '2019-08-19 08:15:39', '00:52:32', 'y5nk9yl6x78y29v2em1o', 1, 'Erik Wong', '2', 'Entrada', 'Alessandro123', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=90', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=85', 'Pensamiento Matematico y Analitico:=53.33'),
(65, NULL, 'Oscar Valdez Reyes', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:15:39', '00:40:4', 'g1mf1ge5b51m76v4ml4t', 1, 'Oscar Valdez', '2', 'Entrada', 'OGOsKiller', 'Pensamiento Matematico y Analitico:=83.33', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=90', 'Pensamiento Matematico y Analitico:=80', 'Inglés:=80'),
(66, NULL, 'Omar Valdez Reyes', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:15:48', '00:49:22', 'm8dm6an8j64a87a8vr3b', 1, 'Omar valdez', '2', 'Entrada', 'omarvaldez', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=56.67', 'Comprensión Lectora y Argumentación:=25', 'Pensamiento Matematico y Analitico:=63.33', 'Comprensión Lectora y Argumentación:=50', 'Inglés:=50'),
(67, NULL, 'Paola Salazar Gonzalez', 'Lengua Inglesa', 'Matutino', '2019-08-19 08:15:48', '00:50:8', 'd7go2rv6v45w59o8xu6c', 1, 'paola.salazarg', '2', 'Entrada', '1859763', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=90', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=90'),
(68, NULL, 'Leonardo Campos Salazar', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:15:50', '00:40:12', 'd7cw6ms2x95t37x8sz3l', 1, 'Leonardo Campos', '2', 'Entrada', 'SASUKE123', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=73.33', 'Inglés:=30', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=73.33'),
(69, NULL, 'Hector Damian Arredondo Leal', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 08:15:59', '1:1:30', 'q2de9iu3t47j55q8dd7e', 1, 'hectorleal804', '2', 'Entrada', 'aa4smtqc', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=70', 'Pensamiento Matematico y Analitico:=63.33', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=76.67'),
(70, NULL, 'Christian Alejandro Olivares Gonzalez ', 'Química área Industrial', 'Matutino', '2019-08-19 08:16:01', '1:1:52', 'n6cm8fe2g75a71v5qd4w', 1, 'Christian.Gzz', '2', 'Entrada', 'Chaman12345', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=60', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=56.67'),
(71, NULL, 'Nayeli Guadalupe Garza Garza', 'Química área Industrial', 'Matutino', '2019-08-19 08:16:07', '1:4:10', 'f9wg4wj8s98u31z6re6i', 1, 'GG_Nayeli', '2', 'Entrada', '060327naye', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=70', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=100'),
(72, NULL, 'Patricia Nallely De La Garza Salazar', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:16:23', '00:51:43', 'b3dd2ev5g11y66y7tj3a', 1, 'Nallely Dlg', '2', 'Entrada', 'Nallely123', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=25', '0', '0', '0'),
(73, NULL, 'juan ángel sanchez tellez', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:16:36', '00:58:34', 's8nx8eu2k45n95u5gd8h', 1, 'juan sanchez', '2', 'Entrada', 'sasj67', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=30', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=33.33'),
(74, NULL, 'brayan ramiro escamilla lopez', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:16:37', '00:50:52', 'g2sm9qo6e57h56f2aj8k', 1, 'brayan.2001', '2', 'Entrada', 'escamilla20', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=40', 'Comprensión Lectora y Argumentación:=60', 'Comprensión Lectora y Argumentación:=55', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=35'),
(75, NULL, 'Oscar Gonzalez Espinoza', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:16:37', '00:47:24', 'h2xy5ry5l62v57v4fr3u', 1, 'Oscargzz', '2', 'Entrada', 'oscar118', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=43.33', 'Comprensión Lectora y Argumentación:=25', 'Inglés:=30', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=70'),
(76, NULL, 'ramiro adrian rincon rios', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:16:39', '1:6:57', 'u6kg7ap1p51t56n9vs8n', 1, 'ramiro', '2', 'Entrada', 'ramiro', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=25', 'Pensamiento Matematico y Analitico:=26.67', 'Inglés:=40', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=33.33'),
(77, NULL, 'Brandon Rìos Martìnez', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:16:41', '1:2:8', 'p2fp4gi2d67c41t4ia7n', 1, 'Brandon_RìosMTZ', '2', 'Entrada', 'Brandonmtz', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=90', 'Inglés:=85', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=63.33'),
(78, NULL, 'Jesús Reyna Hernandez', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:16:41', '00:52:12', 'q6ig4hf4w64v14s6ps4k', 1, 'reyna1116', '2', 'Entrada', 'libros123', 'Inglés:=30', 'Comprensión Lectora y Argumentación:=55', 'Pensamiento Matematico y Analitico:=33.33', 'Pensamiento Matematico y Analitico:=43.33', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=45'),
(79, NULL, 'Georgina Silva Paz', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:16:42', '00:30:5', 'n4bt9co9w84t72c3ya1f', 1, 'georgina.silva.paz', '2', 'Entrada', 'gina5440', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=35', 'Pensamiento Matematico y Analitico:=43.33', 'Comprensión Lectora y Argumentación:=30'),
(80, NULL, 'celia elizabeth mireles vega', 'Lengua Inglesa', 'Matutino', '2019-08-19 08:16:48', '00:50:27', 'z6qg8dd9h37f54n2ag3e', 1, 'celia123', '2', 'Entrada', 'CnCo123', 'Inglés:=20', 'Pensamiento Matematico y Analitico:=16.67', 'Comprensión Lectora y Argumentación:=45', '0', '0', '0'),
(81, NULL, 'Jorge Octavio Ruiz Olvera ', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:17:03', '1:11:9', 'z5po4uk4j66o76o2co5l', 1, 'Octavio Ruiz', '2', 'Entrada', 'negraso20', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=60', 'Inglés:=85', 'Comprensión Lectora y Argumentación:=55', 'Pensamiento Matematico y Analitico:=66.67'),
(82, NULL, 'Carlos Eduardo Alejandre Chavez', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 08:17:38', '1:11:9', 'k4mb7ak9d43v42o7yy8r', 1, 'ProCarlosC123', '2', 'Entrada', 'carlosc123', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=30', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=60'),
(83, NULL, 'miguel angel martinez cortes', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:20:59', '00:59:53', 'o2lg9ps8c39p99s5qn1s', 1, 'miguel', '2', 'Entrada', 'miguelito', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=66.67', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=90', 'Inglés:=35', 'Pensamiento Matematico y Analitico:=50'),
(84, NULL, 'Armando Garza Maldonado', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:22:25', '00:57:58', 'n1qw8zp6n72n89g1vd7e', 1, 'Armando.Garza', '3', 'Entrada', 'Agm', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=55', 'Pensamiento Matematico y Analitico:=26.67', 'Pensamiento Matematico y Analitico:=26.67', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=65'),
(85, NULL, 'Cesia Anahí Aguilar Pachecano', 'Química área Industrial', 'Matutino', '2019-08-19 08:22:39', '00:56:25', 'a7kb5au4v69e68j5qf8t', 1, 'Cesia.pachecano', '3', 'Entrada', 'CAAP', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=53.33'),
(86, NULL, 'Laisha Joceline Mireles Campos', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:22:40', '00:39:41', 'u5oc3zx1t88k49j8rh4x', 1, 'laishajoceline.mirelescampos', '3', 'Entrada', 'ljmc', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=23.33', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=36.67'),
(87, NULL, 'Priscila Judith Salazazar Resendez ', 'Lengua Inglesa', 'Matutino', '2019-08-19 08:22:40', '00:11:4', 'l8eb5et9c67i77n7in6v', 1, 'Priscila.salazar', '3', 'Entrada', 'pjsr', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=35', 'Pensamiento Matematico y Analitico:=26.67', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=26.67'),
(88, NULL, 'Hector Fabricio Lopez Castillo', 'Química área Industrial', 'Matutino', '2019-08-19 08:22:43', '00:52:26', 'f4hy8yj3i93v63r7dp3r', 1, 'Hector.Lopez ', '3', 'Entrada', 'hflc', 'Inglés:=70', 'Pensamiento Matematico y Analitico:=76.67', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=86.67', 'Inglés:=95', 'Comprensión Lectora y Argumentación:=85'),
(89, NULL, 'Carlos Alfonso Tellez Gutierrez', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:22:43', '1:1:46', 'b2ni1es8k92e86y2jo8t', 1, 'carlos.tellez', '3', 'Entrada', 'catg', 'Pensamiento Matematico y Analitico:=63.33', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=65', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=70', 'Inglés:=60'),
(90, NULL, 'Angel Adrian Hernandez Sanchez', 'Lengua Inglesa', 'Matutino', '2019-08-19 08:22:44', '00:38:57', 'p2hb6ks8f59f57b1hu5l', 1, 'Angel.Hernandez', '3', 'Entrada', 'AAHS', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=95', 'Pensamiento Matematico y Analitico:=43.33', 'Pensamiento Matematico y Analitico:=70', 'Inglés:=100', 'Comprensión Lectora y Argumentación:=85'),
(91, NULL, 'Mariana Isabel de Luca Silva', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:22:45', '00:35:42', 'd8aw3da3j24t63c5xj4l', 1, 'Mariana.de luca', '3', 'Entrada', 'MILS', 'Comprensión Lectora y Argumentación:=25', 'Inglés:=25', 'Pensamiento Matematico y Analitico:=26.67', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=30', 'Inglés:=35'),
(92, NULL, 'angel jasiel piña tello', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:22:45', '00:37:24', 'h2wm4od4k97x93u3mk8k', 1, 'angel.piña', '3', 'Entrada', 'ajpt', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=35', 'Pensamiento Matematico y Analitico:=36.67', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=35'),
(93, NULL, 'Angel Manuel Vazquez Guerra', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:22:46', '00:36:53', 'z5eq3vk3m43r97l3th3s', 1, 'Angel.Vazquez', '3', 'Entrada', 'AMVG', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=75', 'Comprensión Lectora y Argumentación:=55', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=95', 'Comprensión Lectora y Argumentación:=80'),
(94, NULL, 'Gema Jocelyn Aguirre Vasconcelos', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:22:46', '00:42:14', 'r6ch2uu8z99i57m6hv5x', 1, 'Gema. aguirre', '3', 'Entrada', 'GJAV', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=55', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=70'),
(95, NULL, 'Ana cristina garza puente ', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:22:50', '00:55:3', 'w6za5mi7p79j62e3io7v', 1, 'ana.garza', '3', 'Entrada', 'acgp', 'Inglés:=35', 'Pensamiento Matematico y Analitico:=13.33', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=55', 'Pensamiento Matematico y Analitico:=36.67'),
(96, NULL, 'Ramiro Rios Paz', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:22:56', '00:36:27', 'p3fe7bd5j64v82p7xj4l', 1, 'Ramiro.Rios', '3', 'Entrada', 'rrp', 'Comprensión Lectora y Argumentación:=90', 'Pensamiento Matematico y Analitico:=70', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=90', 'Pensamiento Matematico y Analitico:=83.33', 'Inglés:=95'),
(97, NULL, 'Allyson Baldit Rodriguez', 'Química área Industrial', 'Matutino', '2019-08-19 08:23:12', '00:50:40', 'j4gq7jh3g32v67j6xu1p', 1, 'allyson.baldit', '3', 'Entrada', 'abr', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=26.67', 'Inglés:=85', 'Pensamiento Matematico y Analitico:=63.33', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=85'),
(98, NULL, 'Evelyn Jackelin Lara Hernandez ', 'Lengua Inglesa', 'Matutino', '2019-08-19 08:23:13', '00:49:37', 's2gl5ts7b31u61t1ci8q', 1, 'Evelyn.lara ', '3', 'Entrada', 'EJLH', 'Pensamiento Matematico y Analitico:=26.67', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=70'),
(99, NULL, 'Juan Raul Silva Cervantes', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:23:14', '00:32:40', 'o7be6yg4e55x33w3rf7m', 1, 'JuanRaul.SilvaCervantres', '3', 'Entrada', 'jrsc', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=25', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=63.33'),
(100, NULL, 'Williams Quiroz Serraro', 'Química área Industrial', 'Matutino', '2019-08-19 08:23:14', '00:52:4', 's7cl3ll3t37c95a2so8b', 1, 'William.Quiroz.Serrato', '3', 'Entrada', 'WQS', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=50', '0', '0', '0'),
(101, NULL, 'Rodman Baldit Rodriguez', 'Química área Industrial', 'Matutino', '2019-08-19 08:23:14', '00:43:19', 'd7rs5qd4n58s63o4mm1k', 1, 'Rodman. Baldit', '3', 'Entrada', 'RBR', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=36.67', 'Inglés:=60', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=43.33'),
(102, NULL, 'Andres Manuel Requena Rodriguez', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 08:23:14', '00:47:45', 'z5de5et7n71d69t2ta4l', 1, 'Andres.Requena', '3', 'Entrada', 'And', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=63.33', 'Comprensión Lectora y Argumentación:=60', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=50'),
(103, NULL, 'Mariana Veczaida Villa Garza', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:23:15', '00:26:20', 'a5oz1fi2x32l35d5td8d', 1, 'Mariana.Garza', '3', 'Entrada', 'MVVG', 'Inglés:=35', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=40'),
(104, NULL, 'Javier Alejandro Alanis Silva', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 08:23:15', '00:43:41', 'y4vh5jr8k55t68z4om4e', 1, 'Javier.Silva', '3', 'Entrada', 'JAAS', 'Inglés:=30', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=53.33', 'Comprensión Lectora y Argumentación:=85'),
(105, NULL, 'alexis tanilo silva iracheta', 'Química área Industrial', 'Matutino', '2019-08-19 08:23:15', '00:50:56', 'u5ue2wb9c66k13g2li5q', 1, 'alexis.silva', '3', 'Entrada', 'atsi', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=80', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=46.67'),
(106, NULL, 'Brandon Jair Gonzalez Garcia', 'Lengua Inglesa', 'Matutino', '2019-08-19 08:23:19', '00:40:8', 'z3tk3lg7m77l81g6cn2t', 1, 'Brandon.Gzz', '3', 'Entrada', 'bjgg', 'Pensamiento Matematico y Analitico:=76.67', 'Inglés:=80', 'Comprensión Lectora y Argumentación:=65', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=95', 'Pensamiento Matematico y Analitico:=73.33'),
(108, NULL, 'Sara Esther López santiago', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:23:22', '00:56:46', 'd6cb7ta9a83t77p2xv2b', 1, 'Sara.López', '3', 'Entrada', 'Sels', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=60', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=60'),
(109, NULL, 'Elihu Ivan Aparicio Donado', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:24:48', '1:7:27', 'r1zx3zz8q63b65i9gy3z', 1, 'Elihu Ivan ', '2', 'Entrada', 'ivan007', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=40', 'Pensamiento Matematico y Analitico:=36.67', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=46.67'),
(110, NULL, 'Esteban Nicolas Chavez De La Garza', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:25:55', '00:37:21', 'c6vy5sn3x55j87w9xe5l', 1, 'Esteban.Chavez', '4', 'Entrada', 'enchdlg', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=53.33', '0', '0', '0'),
(111, NULL, 'Juan Manuel Zamora Gutierrez', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 08:25:58', '00:42:46', 'h1fm2to9i83b78s1jo7z', 1, 'Juan Zamora', '4', 'Entrada', 'jmzg', 'Pensamiento Matematico y Analitico:=66.67', 'Comprensión Lectora y Argumentación:=90', 'Inglés:=50', 'Inglés:=85', 'Comprensión Lectora y Argumentación:=90', 'Pensamiento Matematico y Analitico:=80'),
(112, NULL, 'heidi jaqueline hernandez garcia', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:25:58', '00:59:34', 't4fb4rn9w91w94a1bo8l', 1, 'heidi.hernandez', '4', 'Entrada', 'hjhg', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=80'),
(113, NULL, 'luis eduardo dominguez reyes', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:25:58', '00:46:42', 't4uu2gj3d59e15l8jh7i', 1, 'luis.dominguez', '4', 'Entrada', 'ledr', 'Inglés:=55', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=30', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=60'),
(114, NULL, 'LILIA MARIANA RAMOS SIERRA', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:25:58', '00:46:55', 'x1zk5kg9s36j23s7vd3r', 1, 'lilia.ramos', '4', 'Entrada', 'lmrs', 'Inglés:=25', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=5', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=50'),
(115, NULL, 'Uriel Alejandro Hernandez Marin', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:25:58', '00:23:2', 'n3mn4il5q13n97l5za7a', 1, 'Uriel.Hernandez', '4', 'Entrada', 'uahm', 'Inglés:=70', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=85', '0', '0', '0'),
(116, NULL, 'sandra mariel fernandez gomez ', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:25:58', '00:38:30', 'c2cf9dp5c36d25k3bc2r', 1, 'mariel.fernandez', '4', 'Entrada', 'smfg', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=16.67', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=26.67', 'Inglés:=85'),
(117, NULL, 'aide joselin gonzalez gaona ', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:25:58', '00:33:57', 'h6ri2jf2x25l71x8xm2u', 1, 'joselin.gonzalez', '4', 'Entrada', 'ajgg', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=20', 'Comprensión Lectora y Argumentación:=40', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=35', 'Pensamiento Matematico y Analitico:=33.33'),
(118, NULL, 'Francisco Eduardo Aguilar Ramirez', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:25:58', '00:39:32', 'n9wo4sj5d43r57g6ap8i', 1, 'francisco.aguilar ', '4', 'Entrada', 'fear', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=30', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=30'),
(119, NULL, 'brayan alexis ruiz parga', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:25:58', '00:48:46', 'v7pa2ej7f61z41f5yk4y', 1, 'brayan.ruiz', '4', 'Entrada', 'barp', 'Inglés:=15', 'Pensamiento Matematico y Analitico:=56.67', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=60', 'Inglés:=60', 'Comprensión Lectora y Argumentación:=90'),
(120, NULL, 'Joel Cantú de León', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 08:25:58', '00:44:25', 'r1gx4xv7e65j21v8ve6p', 1, 'joel.cantu', '4', 'Entrada', 'jcdl', 'Inglés:=95', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=33.33', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=100', 'Comprensión Lectora y Argumentación:=75'),
(121, NULL, 'Daniel Alfonso Hernandez Rivera', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:25:59', '00:36:15', 'x4ox5yp9a39w27a5ar5k', 1, 'Daniel.Hernandez', '4', 'Entrada', 'dahr', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=40', 'Pensamiento Matematico y Analitico:=56.67', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=50'),
(122, NULL, 'Devanhi guadalupe gomez hernandez', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:25:59', '1:3:53', 'o3fw1we7i98b84k7dn1j', 1, 'Devanhi.gomez', '4', 'Entrada', 'dggh', 'Pensamiento Matematico y Analitico:=20', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=40', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=20'),
(123, NULL, 'Rafael Segovia Garcia', 'Química área Industrial', 'Matutino', '2019-08-19 08:25:59', '00:40:19', 'n9zb8jp4t15u26h1eg5o', 1, 'Rafael.Segovia', '4', 'Entrada', 'rag', 'Inglés:=75', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=100', 'Pensamiento Matematico y Analitico:=66.67', 'Comprensión Lectora y Argumentación:=75'),
(124, NULL, 'carlos andres gonzalez salazar', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:25:59', '00:44:47', 'h7xo6jj2q99u22k1kp5h', 1, 'carlos.gonzalez ', '4', 'Entrada', 'cags', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=40', 'Pensamiento Matematico y Analitico:=30', 'Pensamiento Matematico y Analitico:=60', 'Inglés:=55', 'Comprensión Lectora y Argumentación:=55'),
(125, NULL, 'Sofia Alejandra Ochoa Rocha ', 'Química área Industrial', 'Matutino', '2019-08-19 08:26:01', '00:48:24', 'r6hq2au2c31m78d5rg5n', 1, 'Sofia.Ochoa', '4', 'Entrada', 'saor', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=25', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=80'),
(126, NULL, 'Ladislao Diaz Izquierdo', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:26:02', '00:51:3', 'y7go8es6y63q56k8pw7n', 1, 'ladislao.diaz', '4', 'Entrada', 'ldi', 'Inglés:=40', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=66.67'),
(127, NULL, 'yair martinez de dios', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 08:26:02', '00:51:12', 'l4sx5cj5f31p52i6yq1b', 1, 'yair.martinez', '4', 'Entrada', 'ymd', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=56.67', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=80'),
(128, NULL, 'erik eduardo gonzalez romero', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 08:26:02', '00:57:59', 'z9xv1ns1i89h82e8lk6y', 1, 'erik.gonzalez', '4', 'Entrada', 'eegr', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=20', 'Comprensión Lectora y Argumentación:=44', 'Pensamiento Matematico y Analitico:=66.67', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=75'),
(129, NULL, 'maximiliano del angel hernandez ', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:26:11', '00:43:30', 'p2ex4it9s84k84w1vr5p', 1, 'max.delangel ', '4', 'Entrada', 'mdh', 'Pensamiento Matematico y Analitico:=30', 'Inglés:=30', 'Comprensión Lectora y Argumentación:=35', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=30'),
(131, NULL, 'Francisca Ayli Garza Ruiz', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:26:24', '1:5:53', 'v4id5js7o13i72b2cw8y', 1, 'Francisca_Garza', '4', 'Entrada', 'fagr', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=70', '0', '0', '0'),
(132, NULL, 'Marian Iveth Jerez Cruz', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:26:28', '1:18:31', 'a3me9ox6p92h28f4xu1d', 1, 'Marian.Jerez', '4', 'Entrada', 'mijc', 'Inglés:=75', 'Comprensión Lectora y Argumentación:=55', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=75', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=33.33'),
(133, NULL, 'jose angel cabrera deceano', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:26:55', '1:4:00', 'm3ni7jv8v53x98m5mb9q', 1, 'jose.cabrera', '4', 'Entrada', 'jacd', 'Inglés:=30', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=30', 'Pensamiento Matematico y Analitico:=43.33', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=30'),
(134, NULL, 'luis gustavo reyna ramirez', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:26:55', '00:53:46', 'a6kk3qw3z31g15n5fz7b', 1, 'luis.reyna', '4', 'Entrada', 'lgrr', 'Inglés:=15', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=36.67', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=36.67'),
(135, NULL, 'Esmeralda Sanchez Primero ', 'Química área Industrial', 'Matutino', '2019-08-19 08:28:51', '00:39:11', 't2fy2pe3q88x69o1zt1q', 1, 'Esmeralda.Sanchez ', '1', 'Entrada', 'esp', 'Inglés:=40', 'Comprensión Lectora y Argumentación:=40', 'Pensamiento Matematico y Analitico:=30', 'Pensamiento Matematico y Analitico:=36.67', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=65'),
(136, NULL, 'Cinthia Lizeth Ortiz Marroquin', 'Química área Industrial', 'Matutino', '2019-08-19 08:28:52', '00:29:34', 'p7fr1ru2n11g77e8eg7k', 1, 'Cinthia.Ortiz', '1', 'Entrada', 'clom', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=50', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=53.33', 'Comprensión Lectora y Argumentación:=80'),
(138, NULL, 'Gabriela Lourdes Vazquez Vidal', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:28:52', '00:37:8', 'k4uf3qh7o75q87j1ws8w', 1, 'Gabriela.Vazquez', '1', 'Entrada', 'glvv', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=50', 'Inglés:=70', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=70'),
(139, NULL, 'Valeria Alejandra Herrejon Ramirez', 'Química área Industrial', 'Matutino', '2019-08-19 08:28:53', '00:37:36', 's3dw9vq4u68a53z2yx7k', 1, 'Valeria.Herrejon', '1', 'Entrada', 'vahr', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=45'),
(140, NULL, 'Oscar Hugo Rodriguez Tamez', 'Lengua Inglesa', 'Matutino', '2019-08-19 08:28:53', '00:34:4', 'v6qr3ee2w87j67x5cg8c', 1, 'oscar.rodriguez', '1', 'Entrada', 'ohrt', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=63.33', 'Comprensión Lectora y Argumentación:=75'),
(141, NULL, 'Jennifer Rodríguez Loera', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:28:53', '00:44:7', 'r4fn9xf4t53m28k1ms4t', 1, 'jennifer.rodriguez', '1', 'Entrada', 'jrl', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=73.33', 'Inglés:=80', 'Inglés:=100', 'Pensamiento Matematico y Analitico:=83.33', 'Comprensión Lectora y Argumentación:=95'),
(142, NULL, 'Angela Marisol Montemayor Salas', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:28:53', '00:38:38', 'n4md3rm4r97g33z8ig5h', 1, 'angela.montemayor ', '1', 'Entrada', 'amms', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=50', 'Inglés:=25', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=70'),
(143, NULL, 'Rolando Manuel Garza Alfaro ', 'Química área Industrial', 'Matutino', '2019-08-19 08:28:53', '00:43:1', 'b9vr7ds6n76m96k8sy1f', 1, 'Rolando.Garza ', '1', 'Entrada', 'rmga', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=20', 'Pensamiento Matematico y Analitico:=63.33', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=30', 'Pensamiento Matematico y Analitico:=56.67'),
(144, NULL, 'Marlene Maria Bazana Solis ', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:28:53', '00:52:17', 's7fb1mz3h19u57s9pb1a', 1, 'Marlene.Bazana', '1', 'Entrada', 'MMBS', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=55', 'Pensamiento Matematico y Analitico:=33.33', 'Pensamiento Matematico y Analitico:=13.33', 'Inglés:=40', 'Comprensión Lectora y Argumentación:=55'),
(145, NULL, 'Sebastian Alejandro Rincon Cruz', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:28:53', '00:42:13', 'm2pb4gp5r44v61d4tv5o', 1, 'Sebastian.Rincon', '1', 'Entrada', 'sarc', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=95', 'Comprensión Lectora y Argumentación:=85', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=60', 'Inglés:=95'),
(146, NULL, 'Reynaldo Isaac Garcia Rodriguez', 'Lengua Inglesa', 'Matutino', '2019-08-19 08:28:53', '00:26:17', 'l5ze5bo2i93u41p1tf5r', 1, 'reynaldo.garcia', '1', 'Entrada', 'RIGR', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=40', 'Pensamiento Matematico y Analitico:=66.67', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=65'),
(147, NULL, 'Javier Garza Campos', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:28:53', '00:29:17', 'r2ij1cm9r92g58z5au5e', 1, 'Javier.Garza', '1', 'Entrada', 'jgc', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=100', 'Pensamiento Matematico y Analitico:=50', 'Pensamiento Matematico y Analitico:=66.67', 'Inglés:=95', 'Comprensión Lectora y Argumentación:=75'),
(148, NULL, 'Tania Estfania Guillermo Rodriguez', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:28:54', '00:38:38', 'n9gi7hw4p36j67o7jx2q', 1, 'Tania.Guillermo', '1', 'Entrada', 'luna', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=85', 'Pensamiento Matematico y Analitico:=73.33', 'Pensamiento Matematico y Analitico:=80', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=100'),
(149, NULL, 'martin Cesar Tamez Almaguer', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:28:54', '00:31:38', 'c3gy4dc6f38t97l3jb9y', 1, 'Martin.Tamez', '1', 'Entrada', 'mcta', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=25', 'Inglés:=75', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=53.33'),
(150, NULL, 'Cristian Domingo Ortiz Rodríguez', 'Química área Industrial', 'Matutino', '2019-08-19 08:28:54', '00:43:54', 'f5mq4cp2d13r16j9wo4t', 1, 'cristian.ortiz', '1', 'Entrada', 'cdor', 'Pensamiento Matematico y Analitico:=73.33', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=60', 'Inglés:=95', 'Pensamiento Matematico y Analitico:=86.67', 'Comprensión Lectora y Argumentación:=85'),
(151, NULL, 'Karla Samantha Perez Martinez ', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:28:54', '00:26:30', 'u5ku4bw6m11u77a5ku9b', 1, 'Karla.Perez ', '1', 'Entrada', 'kspm', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=85', 'Pensamiento Matematico y Analitico:=33.33', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=80'),
(152, NULL, 'Leonardo Pérez Vela', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:28:54', '00:35:33', 'i3cp2ms4y14e63q9ic5t', 1, 'leonardo.perez', '1', 'Entrada', 'lpv', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=85', 'Pensamiento Matematico y Analitico:=36.67', 'Pensamiento Matematico y Analitico:=53.33', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=90'),
(153, NULL, 'Magaly Nohemy López Pérez', 'Lengua Inglesa', 'Matutino', '2019-08-19 08:28:54', '00:52:11', 'v5hj4fz2j29b22j8oh1w', 1, 'Magaly.Lopez', '1', 'Entrada', 'mnlp', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=63.33', 'Comprensión Lectora y Argumentación:=75', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=95', 'Pensamiento Matematico y Analitico:=73.33'),
(154, NULL, 'Lesly Alejandra Barbosa Sanchez', 'Lengua Inglesa', 'Matutino', '2019-08-19 08:28:55', '00:46:58', 'u5hl1uc7i16e44g4kt1c', 1, 'lesly.barbosa', '1', 'Entrada', 'labs', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=75'),
(155, NULL, 'Gilberto Reyes Garza ', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:28:55', '00:42:22', 'c3sb2ti6e55p14v7pf5f', 1, 'gilberto.reyes', '1', 'Entrada', 'grg', 'Pensamiento Matematico y Analitico:=63.33', 'Comprensión Lectora y Argumentación:=90', 'Inglés:=85', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=85'),
(156, NULL, 'angel cresencio montes salazar ', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:28:56', '00:26:8', 'c9dc4dg8n62z33x5nw1i', 1, 'angel.montes', '1', 'Entrada', 'acms', 'Inglés:=40', 'Pensamiento Matematico y Analitico:=23.33', 'Comprensión Lectora y Argumentación:=35', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=50'),
(157, NULL, 'Fabian Garza Campos', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:28:57', '00:28:16', 'p5sm3rp3r66l33k9sp4g', 1, 'BrunoGrzX', '1', 'Entrada', 'fgc', 'Pensamiento Matematico y Analitico:=66.67', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=80', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=85'),
(159, NULL, 'vanessa medina cantu', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:29:35', '00:51:10', 'q7dw7lg1n27i37d2rs9l', 1, 'vanessa.medina', '5', 'Entrada', 'vmc', 'Pensamiento Matematico y Analitico:=23.33', 'Inglés:=60', 'Comprensión Lectora y Argumentación:=35', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=65'),
(160, NULL, 'Sandra Lucas Gonzalez', 'Química área Industrial', 'Matutino', '2019-08-19 08:29:36', '1:4:11', 'l9qg1pd8w64j86w9hh6c', 1, 'sandra.lucas', '5', 'Entrada', 'slg', 'Pensamiento Matematico y Analitico:=36.67', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=25', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=50', 'Inglés:=30'),
(161, NULL, 'cesar alejandro martinez muñoz ', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 08:29:42', '00:00:00', 'c3xd9bw2a77i57s1lo1y', 1, 'cesar.martinez ', '5', 'Entrada', 'camm', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=36.67', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=36.67', 'Comprensión Lectora y Argumentación:=60'),
(162, NULL, 'Patricia Sarahí Manrique Elver', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:29:58', '00:29:21', 'k6bj1uo3c94o75a8sk2r', 1, 'patricia.manrique', '5', 'Entrada', 'psme', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=63.33', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=66.67', 'Comprensión Lectora y Argumentación:=60'),
(163, NULL, 'fernando de jesus garcia escobedo', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:29:58', '00:36:46', 'q1qt6sr3a68r24s9st4g', 1, 'fernando.garcia', '5', 'Entrada', 'fjge', 'Pensamiento Matematico y Analitico:=26.67', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=40', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=70'),
(164, NULL, 'Jesus Everardo Manrique Elver', 'Química área Industrial', 'Matutino', '2019-08-19 08:29:58', '00:47:45', 'z5no2gv9b56q12s3be1b', 1, 'jesus.manrique', '5', 'Entrada', 'jeme', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=40', 'Comprensión Lectora y Argumentación:=35', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=70', 'Inglés:=55'),
(165, NULL, 'angel gael martinez castillo', 'Química área Industrial', 'Matutino', '2019-08-19 08:29:58', '00:59:43', 'i8yd1vm4z82a21c1bx7d', 1, 'angel.martinez', '5', 'Entrada', 'agmc', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=25', 'Pensamiento Matematico y Analitico:=53.33', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=60'),
(166, NULL, 'Dafne Lopez Abarca', 'Lengua Inglesa', 'Matutino', '2019-08-19 08:29:59', '00:37:49', 'e1wj3dk6e48g42g2ub3f', 1, 'dafne.lopez', '5', 'Entrada', 'dla', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=70', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=80', 'Comprensión Lectora y Argumentación:=60'),
(167, NULL, 'Mario Alberto Castañeda Briones', 'Química área Industrial', 'Matutino', '2019-08-19 08:29:59', '00:42:56', 'z4bd8pz3k94c58u2qo5q', 1, 'mario.castañeda', '5', 'Entrada', '12345678a', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=95'),
(168, NULL, 'Francisco Javier Manrique Rivera', 'Química área Industrial', 'Matutino', '2019-08-19 08:29:59', '00:46:5', 't6gn8uz1l15z46t5ng2u', 1, 'francisco.manrique', '5', 'Entrada', 'fjmr', 'Inglés:=50', 'Pensamiento Matematico y Analitico:=60', 'Comprensión Lectora y Argumentación:=70', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=66.67'),
(169, NULL, 'adrian eduardo diaz garcia', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 08:30:00', '00:53:40', 'u3fx7wi5e89v19a6rv1s', 1, 'adrian.diaz', '5', 'Entrada', 'aedg', 'Pensamiento Matematico y Analitico:=63.33', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=93.33', 'Inglés:=75'),
(170, NULL, 'andrea gonzález garza', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:30:01', '00:37:49', 't2kp7kw4d53o56x4si2w', 1, 'andrea.gonzalez', '5', 'Entrada', 'agg', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=55', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=80'),
(171, NULL, 'Ana Carolina Lucas Gonzalez', 'Química área Industrial', 'Matutino', '2019-08-19 08:30:01', '00:54:38', 'z4ex6ts4n53x46n9pc5u', 1, 'ana.lucas', '5', 'Entrada', 'aclg', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=46.67'),
(172, NULL, 'cynthia natlay tamez salazar', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:30:01', '1:00:56', 'w3gu9df6j54a31t6gw9t', 1, 'cynthia.tamez', '5', 'Entrada', 'cnts', 'Pensamiento Matematico y Analitico:=60', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=35', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=53.33', 'Comprensión Lectora y Argumentación:=80'),
(173, NULL, 'Blanca Berenice Sánchez Segura', 'Lengua Inglesa', 'Matutino', '2019-08-19 08:30:01', '00:30:6', 'w2kq4uy6d24w66o3jk7r', 1, 'blanca.segura', '5', 'Entrada', 'bbss', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=90', 'Pensamiento Matematico y Analitico:=63.33'),
(174, NULL, 'Laura Patricia Acevedo Salazar', 'Lengua Inglesa', 'Nocturno', '2019-08-19 08:30:01', '00:58:13', 'g5ht5if8a12f16n3kg9v', 1, 'laura.acevedo', '5', 'Entrada', 'lpas', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=87', 'Inglés:=70', 'Inglés:=60', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=50'),
(175, NULL, 'sergio humberto tijerina mier', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:30:01', '00:49:54', 'h3vw9iz7x81i76y7ol7b', 1, 'sergio.tijerina', '5', 'Entrada', 'shtm', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=30', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=30', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=60'),
(176, NULL, 'Horacio Tijerina Garza ', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:30:02', '00:48:44', 'z3ix3ym1o77k65l8rp7y', 1, 'horacio.tijerina ', '5', 'Entrada', 'htg', 'Pensamiento Matematico y Analitico:=70', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=35', 'Pensamiento Matematico y Analitico:=70', 'Inglés:=75', 'Comprensión Lectora y Argumentación:=80'),
(177, NULL, 'Eros Salim Delgado Gallardo ', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:30:02', '00:40:22', 'a6mq1ja7g81r64d6ww1h', 1, 'eros.gallardo', '5', 'Entrada', 'esdg', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=45', 'Pensamiento Matematico y Analitico:=30', '0', '0', '0'),
(178, NULL, 'Cesar Antonio Guzmán Sepulveda', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:30:02', '00:52:24', 'p3dj8sb4j44i56d6ku2p', 1, 'cesar.guzman', '5', 'Entrada', 'cags', 'Inglés:=80', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=50', 'Pensamiento Matematico y Analitico:=73.33', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=90'),
(179, NULL, 'Jose Roberto Garcia Fierro', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:30:02', '00:57:4', 'w6vy7sy8y97f78e7re6b', 1, 'Roberto.Garcia', '5', 'Entrada', 'jrgf', 'Inglés:=80', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=95', 'Pensamiento Matematico y Analitico:=70', 'Comprensión Lectora y Argumentación:=85'),
(181, NULL, 'ricardo sanchez martinez', 'Química área Industrial', 'Matutino', '2019-08-19 08:30:12', '00:40:59', 'v9jb9fa6x62g12d9sf6p', 1, 'ricardo.sanchez', '5', 'Entrada', 'rsm', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=36.67', 'Inglés:=70', 'Pensamiento Matematico y Analitico:=53.33', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=80'),
(182, NULL, 'jonas Gomez Medina', 'Química área Industrial', 'Matutino', '2019-08-19 08:30:12', '00:33:57', 'x5kh6fx1y74v92m9ek8t', 1, 'jonas.gomez', '5', 'Entrada', 'jgm', 'Inglés:=15', 'Comprensión Lectora y Argumentación:=45', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=30', 'Comprensión Lectora y Argumentación:=45', 'Pensamiento Matematico y Analitico:=30'),
(183, NULL, 'Jose Miguel Leal Gonzalez', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 08:30:39', '00:57:45', 'a3wj9jn2b41o21b7il8x', 1, 'jose.leal', '5', 'Entrada', 'jmlg', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=56.67', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=25'),
(184, NULL, 'Juan Almaguer Hershberger', 'Química área Industrial', 'Matutino', '2019-08-19 08:30:40', '00:42:28', 'u8lz8wu4l29u96h6zk6o', 1, 'juan.almaguer', '5', 'Entrada', 'jah', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=70', 'Pensamiento Matematico y Analitico:=60', 'Pensamiento Matematico y Analitico:=73.33', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=95'),
(185, NULL, 'Juan Igacio Celvera Jimenez', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 08:43:34', '00:42:27', 'p1ci5do6a53o27n4dh3z', 1, 'juan.celvera', '2', 'Entrada', 'jicj', 'Pensamiento Matematico y Analitico:=36.67', 'Inglés:=60', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=55', 'Comprensión Lectora y Argumentación:=75'),
(186, NULL, 'adriana patricia cazares pinales', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 08:55:56', '00:39:11', 'x3qw4by4s69d15s1rb2b', 1, 'adriana.cazares', '3', 'Entrada', 'apcp', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=90', 'Pensamiento Matematico y Analitico:=53.33', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=70'),
(187, NULL, 'Angel Eduardo Chávez Rivera', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 09:03:03', '00:52:10', 'r4uy6hm2m23j17m3gc7l', 1, 'Angel.Chavez', '4', 'Entrada', 'aecr', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=70', 'Pensamiento Matematico y Analitico:=56.67', 'Pensamiento Matematico y Analitico:=63.33', 'Inglés:=85', 'Comprensión Lectora y Argumentación:=85'),
(188, NULL, 'Javier Isaí De León Martínez ', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 09:04:48', '00:32:38', 'p4ix6ib9d49c45h3yt5g', 1, 'Javier.DeLeon', '1', 'Entrada', 'JIDLM', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=36.67', 'Comprensión Lectora y Argumentación:=45', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=65'),
(189, NULL, 'Juan Manuel Lara Salazar', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 09:07:23', '00:35:11', 'b3pc9wo2s35s21d6sd4i', 1, 'Juan.Lara', '1', 'Entrada', 'jmls', 'Pensamiento Matematico y Analitico:=53.33', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=30', 'Inglés:=50', 'Pensamiento Matematico y Analitico:=53.33', 'Comprensión Lectora y Argumentación:=55'),
(192, NULL, 'Luis Eduardo Alanis Gonzalez', 'Química área Industrial', 'Matutino', '2019-08-19 09:38:45', '1:29:59', 'u6hw1at9j69v91u5ph5v', 1, 'luis.alanis', '6', 'Entrada', 'leag', 'Pensamiento Matematico y Analitico:=63.33', 'Inglés:=5', 'Comprensión Lectora y Argumentación:=0', '0', '0', '0');
INSERT INTO `alumnos` (`id`, `examen_id`, `nombre`, `carrera`, `turno`, `fecha`, `tiempo`, `codigoUsuario`, `examenAuto_id`, `username`, `grupo`, `evaluacion`, `contrasena`, `calificacionE1`, `calificacionE2`, `calificacionE3`, `calificacionS1`, `calificacionS2`, `calificacionS3`) VALUES
(193, NULL, 'Hilda Patricia Geronimo Olan', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 09:38:45', '00:48:17', 'p1xi2nv7v85l15x5kq1s', 1, 'hilda.geronimo', '6', 'Entrada', 'hpgo', 'Pensamiento Matematico y Analitico:=26.67', 'Inglés:=40', 'Comprensión Lectora y Argumentación:=30', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=55'),
(194, NULL, 'Luis Antonio Montemayor Cavazos', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 09:38:46', '00:46:10', 'm3da3qs2i88g78h6sa1z', 1, 'luis.montemayor', '6', 'Entrada', 'lamc', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=40', 'Pensamiento Matematico y Analitico:=23.33', 'Inglés:=40', 'Comprensión Lectora y Argumentación:=45', 'Pensamiento Matematico y Analitico:=36.67'),
(195, NULL, 'Ana Paola Rivas Roman ', 'Química área Industrial', 'Matutino', '2019-08-19 09:38:46', '00:54:19', 'g9ey9zr5c39h59v3lb6f', 1, 'ana.rivas', '6', 'Entrada', 'eaprr', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=95', 'Comprensión Lectora y Argumentación:=80'),
(196, NULL, 'Mario Felix Martinez Daniel', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 09:38:46', '1:15:11', 'z5ov1mu9n43q25l9tu5s', 1, 'mariomartinez', '6', 'Entrada', 'mfmd', 'Pensamiento Matematico y Analitico:=43.66', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=63.33', 'Comprensión Lectora y Argumentación:=50', 'Inglés:=75'),
(197, NULL, 'Jesus Emmanuel Oviedo Reyna', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 09:38:46', '00:55:21', 'o6mf2ge1v36v84w6xy5o', 1, 'jesus.oviedo', '6', 'Entrada', 'jeor', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=55', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=70', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=80'),
(198, NULL, 'Max Emiliano Marroquín González', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 09:38:46', '00:45:9', 's6nk2fp7b92i21z8pr2l', 1, 'max.marroquin', '6', 'Entrada', 'memg', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=100', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=63.33'),
(199, NULL, 'Ana Caren Romero Oliva', 'Química área Industrial', 'Matutino', '2019-08-19 09:38:47', '00:54:58', 'e2ns3ie8u24k86u8cn1p', 1, 'ana.romero', '6', 'Entrada', 'acro', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=70'),
(201, NULL, 'Clara Estefania Navarro Martínez', 'Lengua Inglesa', 'Matutino', '2019-08-19 09:38:50', '00:48:28', 'x3ys3ls2c37c89u1gp1t', 1, 'clara.navarro', '6', 'Entrada', 'cenm', 'Inglés:=75', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=40', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=70'),
(202, NULL, 'Jaqueline Arleth Cortes Tenorio', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 09:38:52', '00:54:17', 'j4cu5qy2k12r64g8ns5a', 1, 'jaqueline.cortes', '6', 'Entrada', 'ja', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=23.33', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=70'),
(203, NULL, 'Esmeralda Herrera Saenz', 'Química área Industrial', 'Matutino', '2019-08-19 09:38:52', '00:48:51', 't6fq5pg5n34y38z5yi9y', 1, 'esmeralda.herrera', '6', 'Entrada', 'ehs', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=90', 'Pensamiento Matematico y Analitico:=53.33', 'Comprensión Lectora y Argumentación:=70'),
(205, NULL, 'Luis Alfredo De León Fuentes', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 09:38:53', '00:38:26', 'z4zd9gb7e98f95r7ff6l', 1, 'luis.deleon', '6', 'Entrada', 'ladlf', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=55', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=36.67', 'Inglés:=70'),
(207, NULL, 'Fatima Aidee Saldivar Ojeda', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Nocturno', '2019-08-19 09:38:54', '00:43:55', 'e9nb1aq2d15l67z1yk6f', 1, 'fatimasaldivar', '6', 'Entrada', 'FASO', 'Pensamiento Matematico y Analitico:=53', 'Inglés:=80', 'Comprensión Lectora y Argumentación:=57', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=20', 'Pensamiento Matematico y Analitico:=50'),
(208, NULL, 'Monserrat Irene Torres Azamar', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 09:38:55', '00:46:7', 'b6lz1px4u25b83v6ue6r', 1, 'monserrat.torres', '6', 'Entrada', 'mita', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=63.33', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=86.67'),
(209, NULL, 'Mayra Nallely Aparicio Evangelista', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 09:38:57', '00:46:8', 'y4wo1ht3c83b17k2gi4f', 1, 'MAYRA.APARICIO', '1', 'Entrada', 'MNAE', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=25', 'Inglés:=40', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=60'),
(213, NULL, 'Karen Arlette Aguilar Gamez', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 09:39:09', '1:10:7', 's1hq8my6q52l73h2vp2a', 1, 'karen.aguilar', '6', 'Entrada', 'kaag', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=30', 'Inglés:=55', 'Comprensión Lectora y Argumentación:=60'),
(215, NULL, 'eliseo lopez aragon ', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 09:39:37', '00:55:15', 'a9kq9hj6q71k56e8ra4s', 1, 'cheo', '7', 'Entrada', '1793', 'Inglés:=25', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=30', 'Pensamiento Matematico y Analitico:=26.67', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=25'),
(219, NULL, 'daniel de jesus martìnez juàrez', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 09:40:17', '00:37:55', 'p6lg4cc6n85e98o1jn6s', 1, 'daniel martìnez', '7', 'Entrada', '2208', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=60', 'Inglés:=30', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=56.67'),
(239, NULL, 'LUIS GERARDO PEÑA CASTRO', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 09:46:11', '00:54:53', 'k3rl3tw3h23d84r3fl2x', 1, 'luis.peña', '7', 'Entrada', 'lgpc', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=50', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=66.67', 'Inglés:=75'),
(240, NULL, 'erika alejandra grande grimaldo', 'Lengua Inglesa', 'Matutino', '2019-08-19 09:46:13', '00:49:12', 'e2pt8nl9n15k89u8pk1i', 1, 'erika.grande', '7', 'Entrada', 'eagg', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=36.67', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=65'),
(241, NULL, 'Giza Shanik Tamez Sariñana', 'Química área Industrial', 'Matutino', '2019-08-19 09:47:41', '00:39:53', 'p1ww5rv4v12a91x9yn6r', 1, 'giza.tamez', '8', 'Entrada', 'GSTS', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=25', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=46.67'),
(242, NULL, 'Leslye Paola Bernal Mireles', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 09:47:52', '00:45:11', 'a2st3ee3m31a47p5pt9u', 1, 'Leslye.bernal', '8', 'Entrada', 'lPbM', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=10', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=85', 'Pensamiento Matematico y Analitico:=23.33'),
(243, NULL, 'Nailea Alessandra Gallegos Mendez', 'Lengua Inglesa', 'Matutino', '2019-08-19 09:47:58', '00:38:50', 'y8ip5wv5l31v46x2lh4r', 1, 'Nailea.gallegos', '8', 'Entrada', 'NAGM', 'Pensamiento Matematico y Analitico:=56.67', 'Comprensión Lectora y Argumentación:=0', 'Inglés:=0', 'Pensamiento Matematico y Analitico:=76.67', 'Inglés:=85', 'Comprensión Lectora y Argumentación:=25'),
(244, NULL, 'Brayan Eduardo Hernandez Treviño', 'Química área Industrial', 'Matutino', '2019-08-19 09:48:00', '00:46:35', 'a6rt5rp5f87i75l6xv3u', 1, 'Brayan.Hernandez', '8', 'Entrada', 'BEHT', 'Inglés:=85', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=50'),
(245, NULL, 'Diego Eliasib Hernandez Sanchez', 'Química área Industrial', 'Matutino', '2019-08-19 09:48:07', '00:45:12', 'r1nq8yk8j49a33d7uo4f', 1, 'Diego.Hernandez', '8', 'Entrada', 'DEHS', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=0', 'Inglés:=90', 'Pensamiento Matematico y Analitico:=76.67', 'Comprensión Lectora y Argumentación:=80'),
(246, NULL, 'diana mildret perez gonzalez', 'Lengua Inglesa', 'Matutino', '2019-08-19 09:48:07', '00:20:40', 'y5ne8ji5t33q38m5ck4o', 1, 'mildret.perez', '8', 'Entrada', 'DMPG', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=25', 'Pensamiento Matematico y Analitico:=20', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=50'),
(247, NULL, 'MARÍA GISELA SANTIAGO MIRANDA', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 09:48:07', '00:55:57', 'p4tt4uv2z71m58p5el8m', 1, 'GISELA.MIRANDA', '8', 'Entrada', 'MGSM', 'Pensamiento Matematico y Analitico:=56.67', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=30', 'Pensamiento Matematico y Analitico:=66.67', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=80'),
(248, NULL, 'Dulce Viridiana Mateos Molina', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 09:48:11', '00:58:59', 'n7qb2ad9j16c78c9gw3r', 1, 'Dulce.Mateos', '8', 'Entrada', 'DVMM', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=36.67', 'Comprensión Lectora y Argumentación:=30'),
(249, NULL, 'yesenia', 'Química área Industrial', 'Matutino', '2019-08-19 09:48:12', '1:15:54', 'b8gb8pn4m27u47p1ow4x', 1, 'yesenia.gonzalez', '8', 'Entrada', 'YGB', 'Inglés:=30', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=15', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=13.33', 'Inglés:=25'),
(250, NULL, 'Leonardo Alejandro Perez Elizondo', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 09:48:14', '00:21:00', 't2kw5ur3s47c48r3yw1s', 1, 'Leonardo.Elizondo', '8', 'Entrada', 'LAPE', 'Pensamiento Matematico y Analitico:=23.33', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=40', 'Comprensión Lectora y Argumentación:=40', 'Inglés:=50', 'Pensamiento Matematico y Analitico:=33.33'),
(251, NULL, 'lucero guajardo perez', 'Química área Industrial', 'Matutino', '2019-08-19 09:48:19', '1:3:34', 'd6oc5pv8s66p28z1fy1f', 1, 'lucero.guajardo', '8', 'Entrada', 'LGP', 'Pensamiento Matematico y Analitico:=36.67', 'Comprensión Lectora y Argumentación:=15', 'Inglés:=0', 'Pensamiento Matematico y Analitico:=63.33', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=80'),
(252, NULL, 'Axel Eduardo Almguer  Guzman ', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 09:48:22', '00:43:25', 'k3zr7dc5k77j29o8ro2y', 1, 'Axel.Almaguer', '8', 'Entrada', 'AEAG', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=50', 'Inglés:=15', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=60'),
(253, NULL, 'David De Jesus Ceja Medrano', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 09:48:30', '00:22:11', 'x5mt3ye8p11h98k5tt5t', 1, 'David.Medrano', '8', 'Entrada', 'djcm', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=40', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=60'),
(254, NULL, 'Eduardo jair salas Galvan', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 09:48:31', '00:41:21', 'a7ow8km6h78i98y4od8m', 1, 'Eduardo.Salas', '8', 'Entrada', 'EJSG', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=50', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=65'),
(255, NULL, 'LUIS ANTONIO CAMPOS GONZALEZ', 'Química área Industrial', 'Matutino', '2019-08-19 09:48:46', '00:23:34', 'g6cs3by8v16p24a6yg3b', 1, 'LUIS.CAMPOS', '8', 'Entrada', 'LACG', 'Inglés:=15', 'Pensamiento Matematico y Analitico:=23.33', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=23.33', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=45'),
(256, NULL, 'Christian de los Santos Torres Rentería', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 09:49:14', '00:25:50', 'q1in2op5v62g43i3gp2v', 1, 'ChristiandelosSantos.TorresRentería', '8', 'Entrada', 'CSTR', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=75', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=53.33', 'Comprensión Lectora y Argumentación:=70'),
(257, NULL, 'Ricardo Bermudez Martinez', 'Química área Industrial', 'Matutino', '2019-08-19 09:49:18', '00:45:21', 'g7tw3bu9u38q96u3kz1s', 1, 'ricardo.martinez', '8', 'Entrada', 'RBM', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=26.67', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=80'),
(258, NULL, 'Andrea Guadalupe Mendoza Garza', 'Lengua Inglesa', 'Matutino', '2019-08-19 09:49:23', '1:29:59', 'u7xt2aa2e71s31w5wj3f', 1, 'Andrea.Garza', '8', 'Entrada', 'AGMG', 'Pensamiento Matematico y Analitico:=20', 'Inglés:=20', 'Comprensión Lectora y Argumentación:=50', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=40'),
(259, NULL, 'Lesley Izaguirre', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 09:49:23', '00:38:1', 'b6nw1dm6v15y74v8hz7b', 1, 'lesley.izaguirre', '10', 'Entrada', 'li', 'Inglés:=100', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=65', '0', '0', '0'),
(260, NULL, 'Magaly Nohemi Martinez Zapata', 'Química área Industrial', 'Matutino', '2019-08-19 09:49:28', '1:5:20', 'z4xn9fb9j29c42q4ry1k', 1, 'magaly.martinez', '8', 'Entrada', 'MNMZ', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=13.33', 'Pensamiento Matematico y Analitico:=56.67', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=60'),
(261, NULL, 'Luis Daniel Garibay Sanchez', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 09:49:29', '1:5:55', 'c6jz7lg5d75b97u8um2w', 1, 'Luis.Garibay', '8', 'Entrada', 'LDGS', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=35', 'Inglés:=20', 'Comprensión Lectora y Argumentación:=30', 'Inglés:=40', 'Pensamiento Matematico y Analitico:=36.67'),
(262, NULL, 'Evelyn Anahi Ochoa Hernandez ', 'Química área Industrial', 'Matutino', '2019-08-19 09:49:35', '00:46:56', 'j4wt9kv4d69f78a6zc9u', 1, 'evelyn.hernandez ', '8', 'Entrada', 'EAOH', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=0', 'Inglés:=0', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=70', 'Comprensión Lectora y Argumentación:=65'),
(263, NULL, 'José Juan Alvarado Torres', 'Química área Industrial', 'Matutino', '2019-08-19 09:49:35', '00:52:3', 'x1ku7sp4w21k61i6qi7c', 1, 'jose.Alvarado', '8', 'Entrada', 'JJAT', 'Pensamiento Matematico y Analitico:=60', 'Comprensión Lectora y Argumentación:=40', 'Inglés:=0', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=73.33', 'Comprensión Lectora y Argumentación:=90'),
(264, NULL, 'Fernanda Guadalupe Guerra Reyna', 'Lengua Inglesa', 'Matutino', '2019-08-19 09:49:35', '00:45:22', 'a4mk6ex2i79q23r1mq7t', 1, 'fernanda.guerra', '8', 'Entrada', 'fggr', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=85', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=95', 'Pensamiento Matematico y Analitico:=66.67'),
(265, NULL, 'Katia Berenice Cardona Guillermo ', 'Química área Industrial', 'Matutino', '2019-08-19 09:49:41', '00:45:32', 's3kk4iy5c35g55b3yy9d', 1, 'Berenice.cardona', '8', 'Entrada', 'kbcg', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=50', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=83.33', 'Inglés:=80'),
(266, NULL, 'kevin daniel Martinez Pancardo', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 09:50:03', '00:31:24', 'b4bh6pm4l83c93k1bx1z', 1, 'kevin. Martinez', '10', 'Entrada', 'kdmp', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=35', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=43.33'),
(267, NULL, 'MISSAEL GARZA MEDRANO', 'Química área Industrial', 'Matutino', '2019-08-19 09:50:15', '00:37:30', 's9aw7wn8p11o93x1pr1k', 1, 'MISSAEL.GARZA', '10', 'Entrada', 'mgm', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=0', 'Inglés:=0', 'Pensamiento Matematico y Analitico:=63.33', 'Comprensión Lectora y Argumentación:=90', 'Inglés:=85'),
(268, NULL, 'daniela Elizabeth Gonzalez Ibarra', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 09:50:30', '00:25:8', 'y3xd8rk9j17i37o9py2l', 1, 'daniela.gonzalez', '10', 'Entrada', 'degi', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=35', 'Comprensión Lectora y Argumentación:=35', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=45'),
(269, NULL, 'Jonathan Romero Coronado', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 09:50:39', '00:36:16', 'f9eh9wa6p12w92l5if8h', 1, 'jonathan.romero', '10', 'Entrada', 'JRC', 'Comprensión Lectora y Argumentación:=35', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=30', '0', '0', '0'),
(270, NULL, 'viviana monserrat cisneros  soto ', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 09:50:41', '00:52:44', 't4cu5ce8c38k66i1an8d', 1, 'Sebastian Alejandro Rincon Cruz', '10', 'Entrada', 'vmcs', 'Pensamiento Matematico y Analitico:=13.33', 'Inglés:=30', 'Comprensión Lectora y Argumentación:=30', '0', '0', '0'),
(271, NULL, 'Debanhi Azeneth Acosta Ruiz', 'Química área Industrial', 'Matutino', '2019-08-19 09:50:48', '00:38:4', 'w2xn2la9s74s67w1rj5t', 1, 'debanhi.acosta', '10', 'Entrada', 'daar', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=63.33', 'Inglés:=75', 'Comprensión Lectora y Argumentación:=80'),
(272, NULL, 'Ricardo Jordan Guzman Gonzalez', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 09:50:53', '00:22:56', 'i1sf9wn8m27i98v3fh5v', 1, 'Ricardo.Guzman', '10', 'Entrada', 'rjgg', 'Comprensión Lectora y Argumentación:=30', 'Inglés:=100', 'Pensamiento Matematico y Analitico:=33.33', 'Pensamiento Matematico y Analitico:=26.67', 'Comprensión Lectora y Argumentación:=25', 'Inglés:=100'),
(273, NULL, 'daniel eusebio hernandez garcia ', 'Química área Industrial', 'Matutino', '2019-08-19 09:50:53', '00:55:9', 'q2gy1kj9h29b56p9km6z', 1, 'daniel eusebio hernandez garcia ', '10', 'Entrada', 'dehg', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=70', 'Pensamiento Matematico y Analitico:=53.33', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=85'),
(274, NULL, 'Gabriel Chavarria Rosas', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 09:51:06', '00:27:22', 'p1yl3zy4h98i33d7ig9p', 1, 'Gabriel.Chavarria', '10', 'Entrada', '260814', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=15', 'Inglés:=20', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=40'),
(275, NULL, 'sebastian ramirez martinez', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 09:51:06', '00:22:15', 'm5yl2xa1k35h57q1gd2d', 1, 'sebastian.ramirez', '10', 'Entrada', 'srm', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=26.67', '0', '0', '0'),
(276, NULL, 'Pedro Del Angel Saucedo Bustamante ', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 09:51:18', '00:16:46', 'f2js8ep1h99l12h5wv1b', 1, 'pedrosaucedo ', '10', 'Entrada', 'psb', 'Comprensión Lectora y Argumentación:=45', 'Pensamiento Matematico y Analitico:=26.67', 'Inglés:=30', 'Inglés:=75', 'Comprensión Lectora y Argumentación:=45', 'Pensamiento Matematico y Analitico:=26.67'),
(277, NULL, 'Armando Perez Oyervidez', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 09:51:20', '00:27:17', 't5ep9gk4h17i16y7pf3q', 1, 'Armando Perez Oyervidez ', '10', 'Entrada', 'APO', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=36.67', 'Inglés:=35', 'Pensamiento Matematico y Analitico:=23.33', 'Inglés:=40', 'Comprensión Lectora y Argumentación:=35'),
(278, NULL, 'norma karina rivas garcia', 'Lengua Inglesa', 'Matutino', '2019-08-19 09:51:21', '00:48:2', 'h8wc5pm9y34t83h9mo5g', 1, 'karina.garcia ', '10', 'Entrada', 'nkrg', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=26.67', 'Inglés:=70', '0', '0', '0'),
(279, NULL, 'Diego Diaz Hernández', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 09:51:33', '00:00:00', 'd8ml3uv4g42u26z1zq7u', 1, 'diegodiazhdz', '10', 'Entrada', 'ddh', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=35', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=60'),
(280, NULL, 'susan hilary medina vazquez ', 'Lengua Inglesa', 'Matutino', '2019-08-19 09:51:43', '00:47:20', 'b2zo8is3f48w77g2ln4r', 1, 'Hilary.medina ', '10', 'Entrada', 'shmv', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=90', 'Pensamiento Matematico y Analitico:=36.67', '0', '0', '0'),
(282, NULL, 'Pablo Hernandez Martinez', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 09:52:00', '00:40:59', 'k7yh3bd4u53t81p8hz7i', 1, 'Pablo.Hernandez', '10', 'Entrada', 'phm', 'Inglés:=50', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=65', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=65'),
(283, NULL, 'Nereyda Mayhualira Puga Palacios ', 'Lengua Inglesa', 'Matutino', '2019-08-19 09:52:26', '00:34:44', 'm6oj4aj4q47t41m8sr4h', 1, 'Nereyda.Puga', '10', 'Entrada', 'nmpp', 'Inglés:=85', 'Pensamiento Matematico y Analitico:=26.67', 'Comprensión Lectora y Argumentación:=40', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=26.67'),
(284, NULL, 'brenda sarai rios martinez ', 'Lengua Inglesa', 'Matutino', '2019-08-19 09:52:30', '00:20:44', 'g3aj7sn5x42n44i6fw6w', 1, 'brenda.rios', '10', 'Entrada', 'bsrm', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=23.33', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=80'),
(285, NULL, 'veronica verenice martinez de la garza', 'Lengua Inglesa', 'Nocturno', '2019-08-19 09:53:28', '00:43:25', 'q9vk6mw1y64r73h8ts7c', 1, 'veronica.verenice', '10', 'Entrada', 'vvmg', 'Inglés:=50', 'Pensamiento Matematico y Analitico:=6.67', 'Comprensión Lectora y Argumentación:=80', '0', '0', '0'),
(286, NULL, 'Andrea Reyes Nava', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 09:55:25', '00:37:39', 'w7th1yj3x49s43z8xe4r', 1, 'andrea.reyes ', '9', 'Entrada', 'arn', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=26.67', 'Comprensión Lectora y Argumentación:=25', 'Pensamiento Matematico y Analitico:=36.67', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=75'),
(287, NULL, 'Hector Mares Espinoza ', 'Química área Industrial', 'Matutino', '2019-08-19 09:55:26', '00:57:10', 'i8nv2ve6p78g58o4cp3w', 1, 'hector.mares', '9', 'Entrada', 'hme', 'Pensamiento Matematico y Analitico:=60', 'Comprensión Lectora y Argumentación:=35', 'Inglés:=55', 'Inglés:=80', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=76.67'),
(288, NULL, 'jose emanuel torres ruiz', 'Lengua Inglesa', 'Matutino', '2019-08-19 09:55:26', '00:34:49', 'h8vp3sh7q15h45w4fw1c', 1, 'emanuel.torres', '9', 'Entrada', 'jetr', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=70', 'Pensamiento Matematico y Analitico:=60', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=95'),
(289, NULL, 'Fernando Gonzalez', 'Lengua Inglesa', 'Matutino', '2019-08-19 09:55:26', '00:47:16', 'c3ih3sz6k32c61f3uc4h', 1, 'fernando.gonzalez', '9', 'Entrada', 'lfgs', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=50'),
(290, NULL, 'Cassandra Abigail Canchola Cantú', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 09:55:26', '00:18:10', 'q9kk5re2i89o78d3xb4y', 1, 'cassandra.canchola ', '9', 'Entrada', 'cacc', 'Inglés:=30', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=80'),
(291, NULL, 'mitzy albino cordero', 'Química área Industrial', 'Matutino', '2019-08-19 09:55:26', '00:54:52', 'q8ts6wf7d27k85l5ok9k', 1, 'mitzy.albino ', '9', 'Entrada', 'mac', 'Inglés:=30', 'Pensamiento Matematico y Analitico:=43.33', 'Comprensión Lectora y Argumentación:=25', 'Pensamiento Matematico y Analitico:=26.67', 'Comprensión Lectora y Argumentación:=40', 'Inglés:=35'),
(292, NULL, 'Alan Alexander Alanis Dose ', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 09:55:27', '00:16:49', 'x3ty1cp1c38a13m2fa3w', 1, 'alan.alanis', '9', 'Entrada', 'AAAD', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=23.33', 'Pensamiento Matematico y Analitico:=16.67', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=75'),
(293, NULL, 'Cristina Alessandra Ortegón Salais', 'Lengua Inglesa', 'Matutino', '2019-08-19 09:55:27', '00:40:42', 'h6si1fd9p52h18w2rx8u', 1, 'cristina.ortegón', '9', 'Entrada', 'CAOS', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=56.67', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=75'),
(294, NULL, 'debanhi andrea perez nava', 'Lengua Inglesa', 'Matutino', '2019-08-19 09:55:27', '00:52:19', 'f5ed7xm9l66h33h8if3k', 1, 'debanhi.perez', '9', 'Entrada', 'dapn', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=26.67', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=75', 'Comprensión Lectora y Argumentación:=85'),
(295, NULL, 'luis javier castillo damian', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 09:55:27', '00:37:37', 's1lq9lp9f81m13h9dc6d', 1, 'luis.castillo', '9', 'Entrada', 'ljcd', 'Pensamiento Matematico y Analitico:=36.67', 'Inglés:=35', 'Comprensión Lectora y Argumentación:=40', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=43.33'),
(296, NULL, 'Elias Jehosafat Miranda Vazquez', 'Química área Industrial', 'Matutino', '2019-08-19 09:55:28', '00:46:7', 'z4fn7ik6e71j36t5uf8v', 1, 'eliaas.miranda', '9', 'Entrada', 'ejmv', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=85'),
(297, NULL, 'Jonathan Alfredo González Garza ', 'Química área Industrial', 'Matutino', '2019-08-19 09:55:28', '00:35:37', 'q1rs9ua4u12b72v8hq6r', 1, 'jonathan.gonzalez ', '9', 'Entrada', 'jagg', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=66.67', 'Comprensión Lectora y Argumentación:=50', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=80', 'Comprensión Lectora y Argumentación:=55'),
(298, NULL, 'Brandon Guadalupe Garza Zacarias', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 09:55:28', '00:55:29', 'a1ee5ro7u66f26k6do1r', 1, 'brandon.garza', '9', 'Entrada', 'BGGZ', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=60', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=80'),
(299, NULL, 'kelvin alexander moreno lara', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 09:55:28', '00:24:55', 'j5cm1gn6k15b31v5vb3k', 1, 'kelvin.moreno', '9', 'Entrada', 'kaml', 'Inglés:=15', 'Pensamiento Matematico y Analitico:=23.33', 'Comprensión Lectora y Argumentación:=35', 'Inglés:=15', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=30'),
(300, NULL, 'Brenda Sarahí Sánchez Pérez ', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 09:55:29', '1:18:31', 'h1gn4nt9f86h16e5sg8e', 1, 'brenda sánchez', '9', 'Entrada', 'bssp', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=90', 'Inglés:=85', 'Pensamiento Matematico y Analitico:=53.33'),
(301, NULL, 'Martin Campos', 'Química área Industrial', 'Matutino', '2019-08-19 09:55:29', '1:4:43', 'g8xb2ni3o11k17q2ta5u', 1, 'martin.campos', '9', 'Entrada', 'macg', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=73.33'),
(302, NULL, 'Perla Nohemi Valencia Sánchez', 'Lengua Inglesa', 'Matutino', '2019-08-19 09:55:34', '00:43:38', 'i1vb8sa4y83d27h9nm4t', 1, 'perla.valencia', '9', 'Entrada', 'pnvs', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=23.33', 'Comprensión Lectora y Argumentación:=80', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=90'),
(303, NULL, 'Eduardo Nava Cordero', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 09:55:35', '00:46:31', 'n3si2kb6u19c87r8be8t', 1, 'eduardo.nava', '9', 'Entrada', 'enc', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=75', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=70', 'Pensamiento Matematico y Analitico:=63.33'),
(304, NULL, 'Marcela De Leon Villarreal', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 09:55:40', '00:21:52', 'f4dp2ji2b66w31p4wf5q', 1, 'marcela.deleon', '9', 'Entrada', 'mdlv', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=95', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=100', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=70'),
(305, NULL, 'Carlos Mares', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 09:55:46', '00:47:42', 'x7cc6pj4x78f36h4ji4d', 1, 'Carlos Mares', '4', 'Entrada', 'cdmv', 'Pensamiento Matematico y Analitico:=26.67', 'Comprensión Lectora y Argumentación:=25', 'Inglés:=25', 'Inglés:=55', 'Comprensión Lectora y Argumentación:=45', 'Pensamiento Matematico y Analitico:=36.67'),
(306, NULL, 'brayan valdez', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 09:55:50', '00:54:42', 's4bk7iv1n58c72n6xq7k', 1, 'brayan valdez', '9', 'Entrada', 'braya', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=23.33', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=75', 'Comprensión Lectora y Argumentación:=60'),
(307, NULL, 'Manuel Eduardo Liñan Contreras ', 'Química área Industrial', 'Matutino', '2019-08-19 09:55:53', '00:52:21', 'j9bv2zs4w77u11c4ky1j', 1, 'manuel_liñan10', '9', 'Entrada', 'melc', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=50', 'Pensamiento Matematico y Analitico:=36.67', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=55'),
(308, NULL, 'victor hugo morales hernandez', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 09:55:59', '1:1:16', 'p4oi3wn4o46b62z3iq2b', 1, 'victor.morales', '9', 'Entrada', 'vhmh', 'Pensamiento Matematico y Analitico:=60', 'Inglés:=20', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=60', 'Comprensión Lectora y Argumentación:=55', 'Pensamiento Matematico y Analitico:=60'),
(309, NULL, 'david alejandro ochoa leal', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 09:56:27', '00:32:37', 'z8ha1po8a83q91m5zy2u', 1, 'david.ochoa', '9', 'Entrada', 'daol', 'Comprensión Lectora y Argumentación:=55', 'Pensamiento Matematico y Analitico:=20', 'Inglés:=45', 'Inglés:=40', 'Pensamiento Matematico y Analitico:=43.33', 'Comprensión Lectora y Argumentación:=50'),
(311, NULL, 'Daniela Yamileth Plascencia Garcia', 'Química área Industrial', 'Matutino', '2019-08-19 10:06:27', '00:41:25', 'k7te9nm8i48u42k6ep5p', 1, 'daniela.plascencia', '8', 'Entrada', 'dypg', 'Pensamiento Matematico y Analitico:=36.67', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=55', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=80'),
(312, NULL, 'Hector Armando Frayre Puente ', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 10:08:15', '00:35:46', 'p9jx2wb4k47l78e8mz6c', 1, 'Hector Armando.frayre', '10', 'Entrada', 'hafp', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=13.33', 'Inglés:=0', 'Pensamiento Matematico y Analitico:=36.67', 'Inglés:=100', 'Comprensión Lectora y Argumentación:=65'),
(313, NULL, 'ingris magalli hernadez cortes', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 10:10:19', '1:2:50', 'm1za5ra9k24a91w1sj2y', 1, 'hernandez.ingris', '6', 'Entrada', 'mag', 'Pensamiento Matematico y Analitico:=43.33', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=30', 'Inglés:=25', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=55'),
(314, NULL, 'Yulissa Lara Moreno', 'Química área Industrial', 'Matutino', '2019-08-19 10:10:58', '00:55:51', 'r7np7mg1b91i63e6od5r', 1, 'yulissa.moreno', '6', 'Entrada', 'ylm', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=85', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=85', 'Pensamiento Matematico y Analitico:=76.67', 'Comprensión Lectora y Argumentación:=75'),
(315, NULL, 'Jesus Uriel Rodriguez Silguero', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 10:15:03', '00:56:55', 'w3qo6up7k45p35g1px5g', 1, 'jesus.silguero', '6', 'Entrada', 'jurs', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=56.67', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=90', 'Pensamiento Matematico y Analitico:=46.67'),
(316, NULL, 'Luis David Hernández Correa', 'Mecatrónica área Automatización', 'Matutino', '2019-08-19 10:18:23', '00:38:37', 't4bz3jh5u43p14s7ts4t', 1, 'luis.correa', '6', 'Entrada', 'ldhc', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=60', 'Inglés:=75'),
(317, NULL, 'Luis Alberto Tristan Puga', 'Química área Industrial', 'Matutino', '2019-08-19 10:19:17', '00:53:18', 'e7jw5an8y63d32m7uw7d', 1, 'luis.puga', '6', 'Entrada', 'latp', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=30', 'Pensamiento Matematico y Analitico:=63.33', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=63.33', 'Comprensión Lectora y Argumentación:=65'),
(319, NULL, 'Angelica Yamileth Vazquez Bustos', 'Lengua Inglesa', 'Matutino', '2019-08-19 10:20:50', '1:4:45', 'z6tm8wd6d33o77s7vu5m', 1, 'Angelica.Bustos', '6', 'Entrada', 'ayvb', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=95'),
(320, NULL, 'Mayra Nallely Aparicio Evangelista ', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 10:20:52', '00:51:32', 'q2bm5hn1k74c55l7oe1z', 1, 'MAYRA.EVANGELISTA', '1', 'Entrada', 'MNAE', 'Inglés:=35', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=40', '0', '0', '0'),
(321, NULL, 'MISSAEL GARZA MEDRANO', 'Química área Industrial', 'Matutino', '2019-08-19 10:21:17', '00:31:57', 'i9gi1yq8n25b33l7ow6y', 1, 'MISSAEL GARZA MEDRANO', '10', 'Entrada', 'mgm', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=60', 'Comprensión Lectora y Argumentación:=70', '0', '0', '0'),
(322, NULL, 'Erick Alejandro Jaramillo Rivera', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 10:21:19', '00:36:50', 'c7tg3zf6b74b87n4wu7n', 1, 'erick.rivera', '7', 'Entrada', 'eajr', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=55', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=60'),
(323, NULL, 'Hector Mario Fregoso Cortez ', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 10:21:27', '00:55:58', 'u3hk6ng4z68y48w4sf4j', 1, 'Hector Mario.Fregoso', '7', 'Entrada', 'hmfc', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=26.67', 'Comprensión Lectora y Argumentación:=60', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=70'),
(324, NULL, 'lucero de los angeles najera lira', 'Lengua Inglesa', 'Matutino', '2019-08-19 10:21:28', '00:45:10', 'a5kf8hw9e53w34e4vg9m', 1, 'lucero.najera', '7', 'Entrada', 'lanl', 'Inglés:=55', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=53.33'),
(325, NULL, 'Robinson Rodriguez Soto', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 10:21:37', '00:57:53', 'r2tw6ov1z58e29t4pc5g', 1, 'Robinson.Rodriguez', '7', 'Entrada', 'RRS', 'Inglés:=20', 'Pensamiento Matematico y Analitico:=36.67', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=50'),
(326, NULL, 'Brandon Alexander Rincón Pérez', 'Química área Industrial', 'Matutino', '2019-08-19 10:21:54', '00:23:53', 'h1dq1ef8d17g66a1fs6r', 1, 'Brandon Alexander. Rincón ', '7', 'Entrada', 'BARP', 'Inglés:=90', 'Pensamiento Matematico y Analitico:=60', 'Comprensión Lectora y Argumentación:=95', 'Inglés:=85', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=53.33'),
(327, NULL, 'angeles judith martinez ayala', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 10:22:01', '1:11:17', 'r9cd2fn6o38g55a3oy9k', 1, 'angelesjudith.martinez', '7', 'Entrada', 'ajma', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=40', 'Pensamiento Matematico y Analitico:=73.33', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=50'),
(328, NULL, 'karla monserrath zendeja garcia', 'Lengua Inglesa', 'Matutino', '2019-08-19 10:22:02', '1:00:52', 'q5ik6ds5u55q87l9vs8r', 1, 'karla monserrath zendeja garcia', '7', 'Entrada', 'kmzg', 'Pensamiento Matematico y Analitico:=23.33', 'Inglés:=30', 'Comprensión Lectora y Argumentación:=40', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=35'),
(329, NULL, 'dallana hamud ortiz', 'Lengua Inglesa', 'Matutino', '2019-08-19 10:22:03', '00:58:9', 'k9js7eh2o76d46f1ow7p', 1, 'dallana hamud ortiz', '7', 'Entrada', 'dho', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=45', 'Pensamiento Matematico y Analitico:=20', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=70'),
(330, NULL, 'Edson Alberto Segura Sandoval', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 10:22:04', '00:36:28', 't6bl5tw6j67o49v3wp8l', 1, 'edsonalberto.segura', '7', 'Entrada', 'edsonalberto.segura', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=25', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=80'),
(331, NULL, 'Daniel Maldonado Garcia', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 10:22:07', '00:49:4', 'e9op1em1v54j93g2zx4y', 1, 'daniel.maldonado', '6', 'Entrada', 'dmg', 'Pensamiento Matematico y Analitico:=0', 'Inglés:=0', 'Comprensión Lectora y Argumentación:=0', 'Pensamiento Matematico y Analitico:=16.67', 'Inglés:=60', 'Comprensión Lectora y Argumentación:=65'),
(333, NULL, 'Luis Antonio Aguirre Medrano', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 10:22:19', '00:54:48', 'j9pz6uw9p58x74b4yx6h', 1, 'LuisAntonio.Aguirre', '7', 'Entrada', 'LAAM', 'Pensamiento Matematico y Analitico:=43.33', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=30', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=43.33', 'Comprensión Lectora y Argumentación:=75'),
(334, NULL, 'ernesto enrique suarez gonzalez', 'Química área Industrial', 'Matutino', '2019-08-19 10:22:21', '00:44:6', 'd8lx3pi1i54b38f1uk5q', 1, 'ernestoenrique.suarez', '7', 'Entrada', 'eesg', 'Inglés:=60', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=33.33', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=90'),
(335, NULL, 'fernanda prieto', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 10:22:22', '00:45:34', 't6zg8nf2b39x82e9pc1a', 1, 'fernanda.prieto', '7', 'Entrada', 'fpg', 'Pensamiento Matematico y Analitico:=26.67', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=50', 'Inglés:=60', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=46.67'),
(336, NULL, 'Kenia Yazmin Treviño Fernandez', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 10:22:26', '00:43:58', 'h2hu4fb6j28x28w3vo5o', 1, 'keniayazmin.treviño', '7', 'Entrada', 'kytf', 'Inglés:=60', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=70', 'Inglés:=75', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=56.67'),
(337, NULL, 'Miguel Cepeda Moreno', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 10:22:26', '00:57:57', 'g4py9cv4f23d72z4kk3i', 1, 'miguel.cepeda', '7', 'Entrada', 'mcm', 'Pensamiento Matematico y Analitico:=63.33', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=40', 'Pensamiento Matematico y Analitico:=66.67', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=85'),
(338, NULL, 'Maria Guadalupe Villalobos Barbosa', 'Lengua Inglesa', 'Matutino', '2019-08-19 10:22:31', '00:49:56', 'u3ok7av4f59s78g4ro9e', 1, 'mariaguadalupe.villalobos', '7', 'Entrada', 'mgvb', 'Pensamiento Matematico y Analitico:=26.67', 'Inglés:=40', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=75', 'Comprensión Lectora y Argumentación:=80'),
(340, NULL, 'Esau Emiliano Rico Solis', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 10:22:50', '00:56:25', 'i2ib9ag7r53k31b9kq4o', 1, 'Esau.rico', '7', 'Entrada', 'eers', 'Comprensión Lectora y Argumentación:=55', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=35', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=50', 'Pensamiento Matematico y Analitico:=56.67'),
(341, NULL, 'Paola Arodi Aguilar Gamez', 'Lengua Inglesa', 'Matutino', '2019-08-19 10:23:04', '00:54:3', 'r7sq2pv7k78c55s7tj2j', 1, 'paola.gamez', '6', 'Entrada', 'paag', 'Pensamiento Matematico y Analitico:=36.67', 'Inglés:=85', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=53.33', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=95'),
(342, NULL, 'Angela Magdalena Cardona Martinez', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 10:23:10', '00:45:5', 'o9af5ut7v12p25n3hn4o', 1, 'angelamagdalena.cardona', '7', 'Entrada', 'amcm', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=70', 'Pensamiento Matematico y Analitico:=60', 'Comprensión Lectora y Argumentación:=75'),
(343, NULL, 'Nallely Anahí Gutiérrez Resendez', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-19 10:23:16', '00:49:44', 's3mg6cd3r45l78k1cn9w', 1, 'NallelyAnahi.Gutiérrez', '7', 'Entrada', 'nagr', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=60', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=66.67'),
(344, NULL, 'Angelica Lizbeth Martinez Saenz', 'Química área Industrial', 'Matutino', '2019-08-19 10:23:20', '1:5:2', 'c3fw2jq9f66w35k7ej7a', 1, 'AngelicaLizbeth.Martinez', '7', 'Entrada', 'alms', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=30', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=55'),
(345, NULL, 'brittney rodriguez rincon ', 'Química área Industrial', 'Nocturno', '2019-08-19 10:23:42', '00:52:9', 'u7us3al8d76x81p8by8j', 1, 'brittney', '7', 'Entrada', 'brr', 'Inglés:=15', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=30', '0', '0', '0'),
(348, NULL, 'Luis Eduardo Alanis Gonzalez', 'Química área Industrial', 'Matutino', '2019-08-19 10:49:01', '1:14:54', 'u6bi6bs8h14v92q1ri1w', 1, 'luis.gonzalez', '6', 'Entrada', 'leag', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=70', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=100', 'Comprensión Lectora y Argumentación:=90', 'Pensamiento Matematico y Analitico:=83.33'),
(349, NULL, 'Samantha guadalupe alvarez almazan', 'Química área Industrial', 'Nocturno', '2019-08-19 18:10:40', '00:34:15', 'z6jk5hp2m64d95j3fb1j', 1, 'samantha.alvarez', '1', 'Entrada', 'sgaa', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=55', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=36.67', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=90'),
(350, NULL, 'jesus eduardo salazar rodriguez', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:10:45', '1:2:38', 'm1fr3oo9z31z59n4ug5o', 1, 'jesus salazar', '1', 'Entrada', 'jesr', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=65', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=40'),
(351, NULL, 'Daniel Isai Caldera Santos', 'Química área Industrial', 'Nocturno', '2019-08-19 18:10:53', '00:41:8', 'p5fx9wk8o54u33h4mc3f', 1, 'Daniel.Caldera', '1', 'Entrada', 'dics', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=35', 'Inglés:=35', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=30'),
(352, NULL, 'Jakeline Guadalupe Ruiz Romero', 'Lengua Inglesa', 'Nocturno', '2019-08-19 18:10:54', '00:39:5', 'r8yh9bn6x11n55b6zd3v', 1, 'jakeline.ruiz', '1', 'Entrada', 'jgrr', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=100', 'Pensamiento Matematico y Analitico:=53.33', 'Comprensión Lectora y Argumentación:=80'),
(353, NULL, 'mayra guadalupe fernandez chagoya ', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:11:16', '1:4:53', 's1jj9ft6w41e53x8ea9n', 1, 'mayra.fernandez ', '1', 'Entrada', 'mgfch', 'Inglés:=20', 'Pensamiento Matematico y Analitico:=43.33', 'Comprensión Lectora y Argumentación:=40', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=55', 'Comprensión Lectora y Argumentación:=45'),
(354, NULL, 'efrain alejandro fernandez chagoya', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:11:19', '00:55:10', 'd1vm2hz8h86q68w3mj3x', 1, 'efrain. fernandez', '1', 'Entrada', 'eafcg', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=30', 'Inglés:=35', 'Comprensión Lectora y Argumentación:=40', 'Inglés:=50', 'Pensamiento Matematico y Analitico:=63.33');
INSERT INTO `alumnos` (`id`, `examen_id`, `nombre`, `carrera`, `turno`, `fecha`, `tiempo`, `codigoUsuario`, `examenAuto_id`, `username`, `grupo`, `evaluacion`, `contrasena`, `calificacionE1`, `calificacionE2`, `calificacionE3`, `calificacionS1`, `calificacionS2`, `calificacionS3`) VALUES
(355, NULL, 'jesus fabian garcia tellez', 'Mecatrónica área Automatización', 'Nocturno', '2019-08-19 18:11:21', '1:4:56', 'h6jp7da1u43p24s5yd9j', 1, 'jesus.garcia', '1', 'Entrada', 'jfgt', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=30', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=50'),
(356, NULL, 'juan antonio gonzalez hernandez', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:11:22', '00:39:37', 'y7og9hj5p33s87o2zi8k', 1, 'juan.gonzalez', '1', 'Entrada', 'jagh', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=33.33', '0', '0', '0'),
(357, NULL, 'Elian Josue Moreno Silva', 'Mecatrónica área Automatización', 'Nocturno', '2019-08-19 18:11:23', '00:54:5', 'k6ty4di3j48v41c3jy4e', 1, 'Elian.Moreno', '1', 'Entrada', 'ejms', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=40'),
(358, NULL, 'devora rodriguez marroquin', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:11:23', '00:26:39', 's1qo3qt2h45p77p5fd5e', 1, 'devora.rodriguez', '1', 'Entrada', 'drm', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=50', 'Pensamiento Matematico y Analitico:=36.67', '0', '0', '0'),
(359, NULL, 'arturo damian leal perez', 'Mecatrónica área Automatización', 'Nocturno', '2019-08-19 18:11:24', '00:49:8', 'n1hf7tt6g71e72z7rd2i', 1, 'arturo.leal', '1', 'Entrada', 'adlp', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=33.33', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=20', 'Comprensión Lectora y Argumentación:=55'),
(360, NULL, 'emmanuel perez hernandez', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:11:32', '00:32:13', 'w4pt6vt3k84b68v9zn9m', 1, 'emmanuel.perez', '1', 'Entrada', 'eph', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=30', 'Comprensión Lectora y Argumentación:=40', 'Pensamiento Matematico y Analitico:=26.67', 'Inglés:=30', 'Comprensión Lectora y Argumentación:=40'),
(361, NULL, 'horacio galindo torres', 'Mantenimiento área Industrial', 'Matutino', '2019-08-19 18:11:37', '00:41:7', 'z7bi3xy2p62u99i5me1f', 1, 'horacio.galindo', '1', 'Entrada', 'hgt', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=25', '0', '0', '0'),
(362, NULL, 'juan arturo ortiz martinez', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:11:40', '00:54:23', 'q4nj4ey8f91f94d8nn1m', 1, 'juan.ortiz', '1', 'Entrada', 'jaom', 'Pensamiento Matematico y Analitico:=83.33', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=70', '0', '0', '0'),
(363, NULL, 'Mauricio damian de león de león ', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:12:09', '00:48:40', 'e6lp8bm9e55o97w3ue3t', 1, 'Mauricio.Leon  ', '1', 'Entrada', 'mdll', 'Inglés:=55', 'Comprensión Lectora y Argumentación:=45', 'Pensamiento Matematico y Analitico:=36.67', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=60', 'Comprensión Lectora y Argumentación:=70'),
(365, NULL, 'miguel de la cruz lara', 'Química área Industrial', 'Nocturno', '2019-08-19 18:12:15', '1:29:59', 'l4to1cz7o27i59r2hr1i', 1, 'miguel. de la cruz', '1', 'Entrada', 'mdlcl', 'Pensamiento Matematico y Analitico:=83.33', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=45'),
(366, NULL, 'jesus antonio lopez vela', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:12:16', '1:5:20', 'd9cu9px8u14n28d3ix8v', 1, 'jesus.lopez', '1', 'Entrada', 'jalv', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=33.33', 'Pensamiento Matematico y Analitico:=53.33', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=70'),
(367, NULL, 'Brayan Alejandro Camacho Vasquez', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:12:22', '00:30:13', 'w5ap4cy4r95m87h1lo9d', 1, 'Brayan Camacho', '1', 'Entrada', 'bacv', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=53.33'),
(368, NULL, 'Josue Daniel Valdez Vazquez', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Nocturno', '2019-08-19 18:12:52', '1:2:5', 'u3ke9be5i74d21b3um7n', 1, 'Josue. Valdez', '1', 'Entrada', 'jdvv', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=33.33', 'Pensamiento Matematico y Analitico:=73.33', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=70'),
(369, NULL, 'Héctor Manuel Jaramillo De La Paz', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Nocturno', '2019-08-19 18:12:53', '1:15:3', 'g8on1me3y35x75g4eh3g', 1, 'hector.jaramillo', '1', 'Entrada', 'hmjdlp', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=73.33'),
(371, NULL, 'jose sebastian rodriguez garza', 'Química área Industrial', 'Nocturno', '2019-08-19 18:13:43', '00:30:24', 'y6xr9hw8b65o96i9cq3k', 1, 'jose sebastian rodriguez garza', '2', 'Entrada', 'rodriguezgarza', 'Comprensión Lectora y Argumentación:=35', 'Pensamiento Matematico y Analitico:=30', 'Inglés:=40', 'Comprensión Lectora y Argumentación:=25', 'Inglés:=25', 'Pensamiento Matematico y Analitico:=36.67'),
(372, NULL, 'flor isela mora guajardo', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:14:11', '00:56:57', 'r6zt6pz2x49n31m3fg6i', 1, 'flor.mora', '2', 'Entrada', 'fimg', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=55', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=55'),
(373, NULL, 'veronica morales venegas', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:14:13', '00:48:17', 'y4gl1md3t86a55q1ua3i', 1, 'veronica.morales', '2', 'Entrada', 'vmv', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=55', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=65'),
(374, NULL, 'Casandra Kislevi Garza Rodriguez', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:14:16', '00:59:30', 'h4oh1hp5b87v32y6in6a', 1, 'casandrakislevi.garza', '2', 'Entrada', 'garza25garza', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=45', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=70'),
(375, NULL, 'BRANDON HERNANDEZ LOPEZ', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:15:21', '1:12:2', 'm8qc5us3d12e38r3zd2o', 1, 'BRANDON', '2', 'Entrada', 'BHL', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=45', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=40', 'Comprensión Lectora y Argumentación:=60'),
(376, NULL, 'jose angel vazquez velazquez', 'Química área Industrial', 'Nocturno', '2019-08-19 18:15:24', '00:59:2', 'p3be7of4l36l93k7ky2u', 1, 'joseangel.vazquez', '2', 'Entrada', 'javv', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=100', 'Pensamiento Matematico y Analitico:=83.33', 'Comprensión Lectora y Argumentación:=85'),
(377, NULL, 'Luis Isaias Reyes Ascencion', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:15:25', '1:00:27', 'm3cd7sj6o92g57f3wb6f', 1, 'LuisIsaias.Ascencion', '2', 'Entrada', 'lira', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=55', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=66.67'),
(378, NULL, 'miguel eduardo avalos esquivel', 'Química área Industrial', 'Nocturno', '2019-08-19 18:15:25', '00:52:57', 'd2xs8gf5o98y43y2cq5t', 1, 'migueleduardo.avalos', '2', 'Entrada', 'MEAE', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=50', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=85', 'Comprensión Lectora y Argumentación:=65'),
(379, NULL, 'david jatniel garcia', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:15:26', '00:55:40', 'k5tf7qn3q41f66s6pc3q', 1, 'davidjatniel.garcia', '2', 'Entrada', 'djgp', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=80', 'Comprensión Lectora y Argumentación:=85', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=70', 'Pensamiento Matematico y Analitico:=50'),
(380, NULL, 'Elias Jonathan Torres Garcia', 'Mecatrónica área Automatización', 'Nocturno', '2019-08-19 18:15:33', '1:9:40', 'm8pg4hf7z36f39p9tj9s', 1, 'Elias J.', '2', 'Entrada', '200319c00836', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=45', 'Pensamiento Matematico y Analitico:=80', 'Inglés:=85', 'Comprensión Lectora y Argumentación:=85'),
(381, NULL, 'adrian almaguer garcia ', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:15:36', '00:40:6', 'z9yl8zm5b63z51p1nk9a', 1, 'adrian. almaguer ', '2', 'Entrada', 'adrian64', 'Inglés:=40', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=43.33', 'Pensamiento Matematico y Analitico:=66.67', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=70'),
(382, NULL, 'itzamara pantoja', 'Química área Industrial', 'Nocturno', '2019-08-19 18:15:47', '1:5:25', 'v3km3rr3c55j82j3vw1r', 1, 'itzamara.pantoja', '2', 'Entrada', 'ipc', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=80', 'Comprensión Lectora y Argumentación:=60'),
(383, NULL, 'Jose Daniel Campos Lopez ', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:15:50', '00:46:00', 'p7dr7xb2z24z12p1uk1q', 1, 'Daniel Campos', '2', 'Entrada', 'jose daniel', 'Pensamiento Matematico y Analitico:=20', 'Inglés:=30', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=40', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=26.67'),
(384, NULL, 'adamary guzman ', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:15:52', '00:43:17', 'n3cg3it3f83z15x3dw7t', 1, 'torres', '2', 'Entrada', 'agt', 'Pensamiento Matematico y Analitico:=36.67', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=65', 'Inglés:=80', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=43.33'),
(385, NULL, 'Hilda Guadalupe Castro Gutierrez', 'Química área Industrial', 'Nocturno', '2019-08-19 18:16:00', '00:43:39', 'n2mm3ws8h91i58h1ay2c', 1, 'hildaguadalupe.castro', '2', 'Entrada', 'hgcg', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=43.33', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=95', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=53.33'),
(386, NULL, 'Erika Abigail Rodriguez Oviedo.', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:16:13', '00:55:41', 's4je5ds5k29e33c2ku5v', 1, 'erikaabigail.rodriguez', '2', 'Entrada', 'earo', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=60'),
(387, NULL, 'Eugenia Sofia Rodriguez Oviedo', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:16:15', '00:55:40', 'v5nf7ka5e21j37z6fd5r', 1, 'eugeniasofia.rodriguez', '2', 'Entrada', 'esro', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=80', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=30', 'Inglés:=80', 'Comprensión Lectora y Argumentación:=80'),
(388, NULL, 'Erwin Garcia Gonzalez', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:16:15', '1:2:29', 'y4ja9si6p55k52j9nb5z', 1, 'Erwin Garcia', '2', 'Entrada', 'theerwin2001', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=20', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=36.67'),
(389, NULL, 'jhoanna america ramirez ramirez', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:16:15', '00:41:59', 'm7yw2ue4f99j73p7ne7u', 1, 'jhoannaamerica.ramirez', '2', 'Entrada', 'jarr', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=60', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=80'),
(390, NULL, 'carlos manuel nerio hernandez', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:16:20', '00:46:34', 'i2mt6xc8b26p66z7gt4n', 1, 'carlosmanuel.nerio', '2', 'Entrada', 'cmnh', 'Inglés:=30', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=50', 'Comprensión Lectora y Argumentación:=35', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=65'),
(391, NULL, 'jesus alejandro junco padron', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:16:20', '00:55:48', 'o4ui1qm3m81g81g4ap3l', 1, 'jesusalejandro.junco', '2', 'Entrada', 'jajp', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=55', 'Pensamiento Matematico y Analitico:=30', 'Inglés:=70', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=60'),
(392, NULL, 'luis alberto hernandez lopez', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:16:22', '1:1:6', 'o1dj4ar3y22w62r5fy6x', 1, 'luis.alberto', '2', 'Entrada', 'lahl', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=65', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=40', 'Pensamiento Matematico y Analitico:=26.67'),
(393, NULL, 'cesar antonio montoya hernandez ', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:16:33', '00:40:41', 'a5uz1nw3e81u87u6aa2s', 1, 'cesarantonio.montoya', '2', 'Entrada', 'camh', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=40', 'Inglés:=30', 'Comprensión Lectora y Argumentación:=25', 'Inglés:=40', 'Pensamiento Matematico y Analitico:=23.33'),
(394, NULL, 'Arlyn Ahtziri Lopez Garza', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:16:42', '00:58:36', 'z6zs8zl5b24k99y5vo1f', 1, 'arlynahtziri.lopez', '2', 'Entrada', 'AALG', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=50', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=70'),
(395, NULL, 'hugo hernandez hernandez', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Nocturno', '2019-08-19 18:17:14', '00:44:42', 'w1oz5tz7w98l41o7gi3x', 1, 'hugo herandez', '2', 'Entrada', 'hugota16', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=55', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=40', 'Inglés:=40'),
(396, NULL, 'BENJAMIN EMMANUEL DAVILA RAMIREZ', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Nocturno', '2019-08-19 18:20:47', '1:12:15', 'p1gr3gt6y86n11l4nv4b', 1, 'BENJAMIN.DAVILA', '3', 'Entrada', 'jashe300500', 'Comprensión Lectora y Argumentación:=55', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=20', 'Pensamiento Matematico y Analitico:=70', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=65'),
(397, NULL, 'Isauro Emmanuel leal Rodriguez', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:20:48', '1:4:19', 'h1fr5kl8j72j31s8qj6p', 1, 'Isauro. leal', '3', 'Entrada', 'iemlr', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=20', 'Pensamiento Matematico y Analitico:=40', 'Pensamiento Matematico y Analitico:=43.33', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=55'),
(398, NULL, 'jose angel sanchez gonzalez', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:20:48', '1:15:50', 'm2ew6ei4h42p74y2sr3h', 1, 'jose.sanchez', '3', 'Entrada', 'sanchez12', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=35', 'Pensamiento Matematico y Analitico:=46.67', 'Pensamiento Matematico y Analitico:=53.33', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=30'),
(399, NULL, 'fernanda abigail aguirre lopez', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:20:48', '1:16:57', 'p7rp8ec4r52o46c4bn3h', 1, 'fernanda.aguirre', '3', 'Entrada', 'aguirre07', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=75', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=60'),
(401, NULL, 'Diego Alexis Flores Garza', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:20:48', '00:59:39', 'm7qf5jw2m62x59h7qr4v', 1, 'Diego.flores', '3', 'Entrada', 'Diegoflores', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=55', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=70'),
(402, NULL, 'Reyna Nallely Mendez Ordoñez', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:20:49', '00:53:8', 'o6ku2cz6e86h39l7rx8z', 1, 'Reyna.mendez', '3', 'Entrada', 'reyna1925', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=75', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=45'),
(403, NULL, 'Angel Guadalupe Ruiz Valdez', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:20:49', '00:59:49', 'v4pe9bo6f13h97i8wu9p', 1, 'AngelGuadalupe.Ruiz', '3', 'Entrada', 'AGRV', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=26.67', 'Inglés:=85', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=73.33'),
(404, NULL, 'Jose Leonardo Guajardo de la Rosa', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:20:49', '1:6:47', 'u4dc7kn2i14p65g9xm5v', 1, 'Jose Guajardo', '3', 'Entrada', 'JOAE010529', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=60', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=50'),
(405, NULL, 'aileen yuliana barrientos guillermo', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:20:49', '00:38:12', 'w8iu8vu3h54c39m6bh5s', 1, 'aileen barreintos', '3', 'Entrada', 'barrientos17', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=75', 'Comprensión Lectora y Argumentación:=35', 'Inglés:=30', 'Pensamiento Matematico y Analitico:=13.33'),
(406, NULL, 'Jesús Antonio Elizondo Valero', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:20:50', '1:7:51', 'b4wf9ot1y98e35z5sl7d', 1, 'Jesus.Elizondo', '3', 'Entrada', 'Elizondo123', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=80', 'Inglés:=80', 'Comprensión Lectora y Argumentación:=85'),
(407, NULL, 'cristina alejandra garza de león', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:20:50', '00:54:23', 'i8qh7bu1h74a46g7du8j', 1, 'alejandra_2001.garza@hotmail.com', '3', 'Entrada', 'garza', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=75', '0', '0', '0'),
(408, NULL, 'Alondra Garza Cantú', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:20:50', '01:10:8', 't8im2dj9l71k69h7yw8h', 1, 'Alondra Garza Cantú', '3', 'Entrada', 'alondra28', 'Inglés:=48', 'Comprensión Lectora y Argumentación:=38', 'Pensamiento Matematico y Analitico:=68', '0', '0', '0'),
(409, NULL, 'Maria Fernanda Ramirez Sanchez', 'Mecatrónica área Automatización', 'Nocturno', '2019-08-19 18:20:51', '00:58:11', 'i8qo7ds3c77l28j1ih1r', 1, 'Fernanda.Sanchez', '3', 'Entrada', 'mfrs', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=30', 'Inglés:=70'),
(410, NULL, 'Valeria Guadalupe Cruz Sandoval', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Nocturno', '2019-08-19 18:20:52', '1:1:40', 'w7dq2ta5j44v69a3nu1s', 1, 'Valeria Sandoval', '3', 'Entrada', 'vada1806', 'Comprensión Lectora y Argumentación:=55', '0', '0', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=80'),
(411, NULL, 'AMADA ELIZABETH HERNANDEZ GARCIA', 'Química área Industrial', 'Nocturno', '2019-08-19 18:20:56', '00:41:44', 'w3ep3cm4f96o85e3vh6h', 1, ' ELIZABETH.HERNANDEZ ', '3', 'Entrada', 'AEHG', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=30', '0', '0', '0'),
(412, NULL, 'Alexis Manuel Garcia hdz', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:20:58', '1:1:27', 'b7ad3st7i82z42p3cn4t', 1, 'Alexis.Garcia ', '3', 'Entrada', 'tigres2610', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=26.67', 'Pensamiento Matematico y Analitico:=20', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=60'),
(413, NULL, 'carlos gerardo mendoza mendoza', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-19 18:20:59', '00:39:46', 't4gn4qy8u49m36f3vu8b', 1, 'carlos mendoza', '3', 'Entrada', 'cgmm', 'Inglés:=30', 'Pensamiento Matematico y Analitico:=26.67', 'Comprensión Lectora y Argumentación:=45', '0', '0', '0'),
(414, NULL, 'Maria Salome Garza Arrieta', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:21:04', '1:23:5', 'y5bd8zd2o25t62y4qa6v', 1, 'salome.garza', '3', 'Entrada', 'msga', 'Comprensión Lectora y Argumentación:=25', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=48', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=85', 'Comprensión Lectora y Argumentación:=70'),
(415, NULL, 'Lesly Daniela Coronado Garcia', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:21:12', '00:51:27', 'l1yz5kr3n69z86f5db1q', 1, 'Daniela.Garcia', '3', 'Entrada', 'Configuracion2', 'Inglés:=50', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=40', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=26.67'),
(416, NULL, 'Juan Arnulfo Longoria Flores', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:21:20', '1:19:6', 's7ms4nq9b24i93m2mi1p', 1, 'Juan. Longoria', '3', 'Entrada', 'juan1234', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=80', 'Comprensión Lectora y Argumentación:=65'),
(418, NULL, 'GUSTAVO SANTIAGO TORRES', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:21:33', '1:29:59', 'h5ru5tw8b73p58z5qo6r', 1, 'GUSTAVO SANTIAGO', '3', 'Entrada', 'GST', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=26.67', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=25'),
(419, NULL, 'jesus eduardo novoa torres', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:21:44', '1:23:43', 'v2vd9kg5m62i99b2vd1o', 1, 'eduardo.novoa', '3', 'Entrada', 'JENT', 'Comprensión Lectora y Argumentación:=64', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=28', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=95', 'Pensamiento Matematico y Analitico:=33.33'),
(420, NULL, 'Ricardo Jazael Martinez Rodriguez', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:21:53', '00:48:28', 'p6ej2qu2f83n25j4cv4s', 1, 'Ricardo.Rodriguez', '3', 'Entrada', 'RJMR', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=75', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=70'),
(421, NULL, 'Aneth Johana Briceño Martinez', 'Mecatrónica área Automatización', 'Nocturno', '2019-08-19 18:23:47', '00:42:54', 'o2ot8jq3n27m93a3kw9e', 1, 'Anethjohana.briceño', '4', 'Entrada', 'AJBM', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=84', 'Comprensión Lectora y Argumentación:=40', 'Inglés:=85', 'Pensamiento Matematico y Analitico:=73.33', 'Comprensión Lectora y Argumentación:=85'),
(422, NULL, 'Sandra Yudith Guerrero Palomo', 'Química área Industrial', 'Nocturno', '2019-08-19 18:24:01', '00:58:1', 'g9tx6dv5j23f86s2kf8p', 1, 'sandrayudith.guerrero', '4', 'Entrada', 'sygp', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=87', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=63.33', 'Inglés:=70'),
(423, NULL, 'karem lizeth turrubiates orozco', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:24:02', '00:46:00', 'r4gt4yu6m18a91c7vf2s', 1, 'karemlizeth.turrubiates', '4', 'Entrada', 'klto', 'Pensamiento Matematico y Analitico:=30', 'Inglés:=78', 'Comprensión Lectora y Argumentación:=80', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=33.33'),
(425, NULL, 'Jesus Alejandro Najera Ortega', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:24:21', '00:51:24', 'a6gl4gk3o62n41o5be1c', 1, 'JesusAlejandro.Najera', '4', 'Entrada', 'JANO', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=62', 'Pensamiento Matematico y Analitico:=32.67', 'Inglés:=85', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=70'),
(426, NULL, 'José Alexis Acosta Guerrero', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Nocturno', '2019-08-19 18:24:21', '00:49:22', 'f9ac4fr3r27x73w4vw3a', 1, 'JoseAlexis.Acosta', '4', 'Entrada', 'JAAG', 'Comprensión Lectora y Argumentación:=87', 'Inglés:=54', 'Pensamiento Matematico y Analitico:=70.6', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=60'),
(427, NULL, 'Merced Aurelio Ramirez Hernandez', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:24:22', '1:3:28', 'k2zd7by7p86u78n6ul5r', 1, 'MercedAurelioRamirez', '4', 'Entrada', 'marh', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=48', 'Pensamiento Matematico y Analitico:=50', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=50'),
(428, NULL, 'Juan Antonio Gonzalez Trevino', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:24:54', '00:48:21', 'g6kj7rd5e48h98z6tg3x', 1, 'Juanantonio.gonzalez', '4', 'Entrada', 'jagt', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=26.67', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=90'),
(429, NULL, 'jesus emilio ortega de la cruz', 'Química área Industrial', 'Nocturno', '2019-08-19 18:24:57', '00:35:00', 'o2ht1jt4t67r79m3br5s', 1, 'Jesus Emilio. Ortega', '4', 'Entrada', 'jeoc', 'Pensamiento Matematico y Analitico:=20', 'Inglés:=30', 'Comprensión Lectora y Argumentación:=20', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=50'),
(430, NULL, 'Pedro Adriel Mireles De León ', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:25:26', '00:40:24', 'i5ip6dm4k19q76c7wz7m', 1, 'pedro adriel mireles ', '4', 'Entrada', 'paml', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=26.67', 'Inglés:=25', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=40'),
(431, NULL, 'Jose Guadalupe Berino Ortega', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Nocturno', '2019-08-19 18:25:30', '00:37:59', 'i5cn6ti1m34r96y2uw1s', 1, 'Jose Guadalupe. Berino', '4', 'Entrada', 'jgbo', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=45', 'Pensamiento Matematico y Analitico:=56.67', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=75'),
(432, NULL, 'eduardo jose martinez flores', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:25:30', '00:45:9', 'n2xh8uq2g28n63l8xa9c', 1, 'eduardojose.martinez', '4', 'Entrada', 'ejmf', 'Pensamiento Matematico y Analitico:=56', 'Inglés:=54', 'Comprensión Lectora y Argumentación:=46', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=70', 'Pensamiento Matematico y Analitico:=63.33'),
(433, NULL, 'Leonel Alejandro Bernal Macias', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:25:31', '00:37:52', 'g2le7sl6a95x67j7cm8k', 1, 'Leonel Alejandro. Bernal', '4', 'Entrada', 'LABM', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=83', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=43.33', 'Comprensión Lectora y Argumentación:=65'),
(434, NULL, 'Gerardo Ivan Solis Ruiz', 'Química área Industrial', 'Nocturno', '2019-08-19 18:25:36', '00:32:42', 'y3yq7ce6j97s33o1al4n', 1, 'GerardoIvan.Solis', '4', 'Entrada', 'gisr', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=50', 'Pensamiento Matematico y Analitico:=33.33'),
(435, NULL, 'Wendy Brigitte Ordoñez Silva', 'Química área Industrial', 'Nocturno', '2019-08-19 18:25:37', '00:35:25', 'v5jv7pm2o26p95j2qe1l', 1, 'WendyBrigitte.Ordoñez', '4', 'Entrada', 'wbos', 'Inglés:=84', 'Pensamiento Matematico y Analitico:=76', '0', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=60', 'Inglés:=70'),
(436, NULL, 'jesus manuel esquivel diaz', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:25:39', '1:18:31', 'z8zh3lx1e17o72n6pc1r', 1, 'jesusmanuel.esquivel', '4', 'Entrada', 'jmed', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=15', 'Comprensión Lectora y Argumentación:=68', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=65'),
(437, NULL, 'Miguel Angel fonseca Aleman', 'Química área Industrial', 'Nocturno', '2019-08-19 18:25:39', '00:29:8', 'u4sw7gk8h67h98c2uz2k', 1, 'miguelangel.Fonseca', '4', 'Entrada', 'MAFA', 'Inglés:=48', 'Comprensión Lectora y Argumentación:=56', 'Pensamiento Matematico y Analitico:=48', 'Inglés:=85', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=76.67'),
(438, NULL, 'Federico Guadalupe Rodriguez Hernandez', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:25:40', '00:29:49', 'n7um4wd9a49r29e5fl9k', 1, 'Federico Guadalupe .Rodriguez ', '4', 'Entrada', 'fgrh', 'Inglés:=35', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=20', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=55', 'Pensamiento Matematico y Analitico:=33.33'),
(439, NULL, 'Sheyla Elizabeth Martinez Olvera', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Nocturno', '2019-08-19 18:25:40', '1:7:20', 'f6wr9aj3h36b99s5nt6c', 1, 'sheylaelizabeth.', '4', 'Entrada', 'SEM', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=60', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=35', 'Inglés:=45'),
(440, NULL, 'Yaretssi Irasema Serrato Duran', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:25:41', '00:39:19', 'e4fq1ar6f98g62p8qq7x', 1, 'YaretssiIrasema.Serrato', '4', 'Entrada', 'YISD', 'Pensamiento Matematico y Analitico:=48', 'Inglés:=20', 'Comprensión Lectora y Argumentación:=75', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=36.67'),
(441, NULL, 'Jesus Adrian Banda Aguilar', 'Mecatrónica área Automatización', 'Nocturno', '2019-08-19 18:25:59', '00:49:44', 'w1hv1sf2s73g22p1gz1x', 1, 'jesusadrian.banda', '4', 'Entrada', 'jaba', 'Comprensión Lectora y Argumentación:=84', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=47', 'Inglés:=90', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=40'),
(442, NULL, 'CESAR GERARDO PEÑA ACOSTA', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:26:06', '00:37:36', 'd7sn5hz5d43w56v7ej7e', 1, 'CESARGERARDO.PEÑA', '-1', 'Entrada', 'CGPA', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=32', 'Pensamiento Matematico y Analitico:=65', 'Inglés:=50', 'Pensamiento Matematico y Analitico:=20', 'Comprensión Lectora y Argumentación:=55'),
(443, NULL, 'Geronimo Severiano Del Angel', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:26:24', '1:12:12', 'i8qu1kb8g34n15f1he6d', 1, 'geronimoseveriano', '4', 'Entrada', 'gsda', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=45', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=60', 'Inglés:=60'),
(447, NULL, 'marco antonio sandoval beaza', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:29:28', '01:30:00', 'u2my3ih9u54s52n6yb7e', 1, 'marcoantonio.sandoval', '4', 'Entrada', 'masb', 'Inglés:=84', 'Comprensión Lectora y Argumentación:=27', 'Pensamiento Matematico y Analitico:=86', '0', '0', '0'),
(449, NULL, 'Omar Israel López Guerrero', 'Química área Industrial', 'Nocturno', '2019-08-19 18:31:34', '1:9:6', 'k6kq1mn1v42o11m3zc1f', 1, 'Omar.Lopez', '1', 'Entrada', 'OILG', 'Pensamiento Matematico y Analitico:=43.33', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=70'),
(450, NULL, 'Johana Catalina Cavazos Flores', 'Mecatrónica área Automatización', 'Nocturno', '2019-08-19 18:32:26', '00:20:47', 'x2ds5ls5c44p41t4zn8b', 1, 'Johana Cavazos', '5', 'Entrada', 'jccf', 'Comprensión Lectora y Argumentación:=25', 'Pensamiento Matematico y Analitico:=48', 'Inglés:=84', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=16.67'),
(451, NULL, 'paola carolina gonzalez turrubiates', 'Lengua Inglesa', 'Nocturno', '2019-08-19 18:32:27', '00:30:42', 'h2ga2kx2q11d68u4rw7u', 1, 'paola.gonzalez', '5', 'Entrada', 'pcgt', 'Comprensión Lectora y Argumentación:=23', 'Inglés:=52', 'Pensamiento Matematico y Analitico:=24', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=40', 'Pensamiento Matematico y Analitico:=20'),
(452, NULL, 'julian alejandro villela baez', 'Mecatrónica área Automatización', 'Nocturno', '2019-08-19 18:32:31', '00:39:46', 'f4un8ud2c99z34m9mb5g', 1, 'julian alejandro villela baez', '1', 'Entrada', 'javb', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=55', '0', '0', '0'),
(453, NULL, 'jorge Miguel Aleman Hernandez', 'Química área Industrial', 'Nocturno', '2019-08-19 18:32:34', '00:56:31', 'j4sb4xv1b62n21g8vn2j', 1, 'jorge.alemam', '5', 'Entrada', 'JMAH', 'Comprensión Lectora y Argumentación:=87', 'Pensamiento Matematico y Analitico:=58', 'Inglés:=78', 'Pensamiento Matematico y Analitico:=23.33', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=45'),
(454, NULL, 'rene antonio delgado flores', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Nocturno', '2019-08-19 18:32:37', '00:36:6', 'c6fg1vy8m46r29z9dt2y', 1, 'rene.delgado', '5', 'Entrada', 'radf', 'Comprensión Lectora y Argumentación:=90', 'Pensamiento Matematico y Analitico:=56', 'Inglés:=60', 'Inglés:=60', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=50'),
(455, NULL, 'abraham martinez aguilar', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:32:38', '1:00:6', 'm8cl2vv6p85o37w9vp4m', 1, 'abraham.martinez', '5', 'Entrada', 'ama', 'Comprensión Lectora y Argumentación:=48', 'Inglés:=87', 'Pensamiento Matematico y Analitico:=57', 'Pensamiento Matematico y Analitico:=36.67', 'Inglés:=35', 'Comprensión Lectora y Argumentación:=45'),
(456, NULL, 'ricardo de jesus garcia lopez', 'Química área Industrial', 'Nocturno', '2019-08-19 18:32:39', '1:5:2', 'e9gl8sp5v59x24i6aj4q', 1, 'ricardo.garcia', '5', 'Entrada', 'r.j.g.l.', 'Comprensión Lectora y Argumentación:=78', 'Inglés:=58', 'Pensamiento Matematico y Analitico:=44', 'Comprensión Lectora y Argumentación:=50', 'Inglés:=30', 'Pensamiento Matematico y Analitico:=56.67'),
(457, NULL, 'juan angel mireles gonzalez', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:32:40', '00:40:52', 'h1pd2xd9j36a46c9ge7v', 1, 'juan. mireles', '3', 'Entrada', 'jamg', 'Pensamiento Matematico y Analitico:=56.67', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=75', 'Comprensión Lectora y Argumentación:=40', 'Inglés:=25', 'Pensamiento Matematico y Analitico:=26.67'),
(458, NULL, 'jose angel de santiago zamora', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:32:41', '00:37:55', 'z8bn5tq7u58i64s4gp5z', 1, 'jose de santiago', '5', 'Entrada', 'jadsz', 'Comprensión Lectora y Argumentación:=47', 'Pensamiento Matematico y Analitico:=59', 'Inglés:=70', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=56.67'),
(459, NULL, 'Ricardo Jesus Cruz Bautista', 'Química área Industrial', 'Nocturno', '2019-08-19 18:32:43', '1:1:1', 'q9pn6sv9s27e83u2sa8z', 1, 'ricardo.cruz', '5', 'Entrada', 'rjcb', 'Comprensión Lectora y Argumentación:=34', 'Inglés:=32', 'Pensamiento Matematico y Analitico:=32', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=90', 'Inglés:=95'),
(460, NULL, 'eduardo galvan trejo', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:32:47', '00:38:2', 'l5ai8cx6i28i94e5zc7c', 1, 'eduardo galvan', '5', 'Entrada', 'egt', 'Comprensión Lectora y Argumentación:=58', 'Pensamiento Matematico y Analitico:=57', 'Inglés:=84', 'Inglés:=20', 'Pensamiento Matematico y Analitico:=16.67', 'Comprensión Lectora y Argumentación:=45'),
(461, NULL, 'Graciela Llamas Hernández', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:32:48', '00:59:22', 'r9uy6mk2m54s62r1tl7l', 1, 'Graciela.Llamas', '5', 'Entrada', 'GLH', 'Comprensión Lectora y Argumentación:=58', 'Inglés:=48', 'Pensamiento Matematico y Analitico:=48', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=63.33', 'Comprensión Lectora y Argumentación:=75'),
(462, NULL, 'Daniel Salazar Cortes', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:32:55', '00:42:28', 'b8ca8lq6j25v63i6nk2e', 1, 'Daniel. salazar.', '5', 'Entrada', 'dsc', 'Comprensión Lectora y Argumentación:=35', 'Inglés:=86', 'Pensamiento Matematico y Analitico:=27', 'Comprensión Lectora y Argumentación:=35', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=53.33'),
(463, NULL, 'Ariana Lizbet Morales Ramos', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:32:56', '1:1:55', 'n5sl1iy7l66x14d3tc8p', 1, 'ariana.morales', '5', 'Entrada', 'ALMR', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=23.33', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=30'),
(464, NULL, 'Ernesto Salinas Martinez', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-19 18:32:57', '1:00:00', 'v5ni1wy3b14i92x5zj2s', 1, 'Ernesto.Salinas', '5', 'Entrada', 'ESM', 'Inglés:=58', 'Comprensión Lectora y Argumentación:=47', 'Pensamiento Matematico y Analitico:=33.88', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=55', 'Comprensión Lectora y Argumentación:=65'),
(465, NULL, 'Cassandra Yamileth Martinez Alejandro', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:33:01', '1:2:22', 'v3lw8ux7v61c25s4mm8k', 1, 'cassandra.martinez', '5', 'Entrada', 'cyma', 'Inglés:=87', 'Comprensión Lectora y Argumentación:=68', 'Pensamiento Matematico y Analitico:=58', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=55', 'Inglés:=45'),
(467, NULL, 'ALEXIS EMANUEL SOTO BUSTILLOS', 'Química área Industrial', 'Nocturno', '2019-08-19 18:33:46', '00:58:19', 't3bb6ao3w75r84p8kk8b', 1, 'ALEXIS.SOTO', '5', 'Entrada', 'aesb', 'Comprensión Lectora y Argumentación:=40', 'Inglés:=90', 'Pensamiento Matematico y Analitico:=40', 'Pensamiento Matematico y Analitico:=56.67', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=60'),
(470, NULL, 'erik ramirez torres', 'Mecatrónica área Automatización', 'Nocturno', '2019-08-19 18:35:02', '1:26:2', 's4aw7tg5z83i96w6or9s', 1, 'Erik.Ramirez', '3', 'Entrada', 'erik2304', 'Pensamiento Matematico y Analitico:=87', 'Comprensión Lectora y Argumentación:=72', 'Inglés:=84', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=73.33', 'Inglés:=60'),
(472, NULL, 'luis adrian vela garza', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:39:17', '00:12:51', 'q1cn4yt8w21j37h5bi5o', 1, 'luis.vela', '3', 'Entrada', 'lavg', 'Comprensión Lectora y Argumentación:=25', 'Inglés:=25', 'Pensamiento Matematico y Analitico:=16.67', 'Inglés:=35', 'Comprensión Lectora y Argumentación:=5', 'Pensamiento Matematico y Analitico:=46.67'),
(473, NULL, 'raul gibran jimenez salinas', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Nocturno', '2019-08-19 18:40:39', '1:13:5', 'o2az5ta6z13p95d9hr3k', 1, 'raul.jimenez', '1', 'Entrada', 'rgjs', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=66.67', 'Inglés:=90'),
(485, NULL, 'orlando de jesus ramirez rangel', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:42:44', '00:47:36', 'j6hx4gw5k32h95n7jr4h', 1, 'orlando.ramirez', '1', 'Entrada', 'ORR', 'Comprensión Lectora y Argumentación:=85', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=40', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=50', 'Comprensión Lectora y Argumentación:=55'),
(501, NULL, 'Abraham Rodriguez Fernandez ', 'Química área Industrial', 'Nocturno', '2019-08-19 18:47:18', '00:48:00', 'u1cj3lh2a57q65y7ns9k', 1, 'AbrahamRodriguez', '4', 'Entrada', 'arf', 'Pensamiento Matematico y Analitico:=63.33', 'Inglés:=80', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=70', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=90'),
(540, NULL, 'Julio Tadeo Martínez Pérez', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-19 18:59:49', '00:20:51', 'i2th5yk9w87q44g9sd1b', 1, 'Julio.Martínez', '1', 'Entrada', 'jtmp', 'Inglés:=95', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=50', '0', '0', '0'),
(541, NULL, 'jose sebastian rodriguez garza', 'Química área Industrial', 'Nocturno', '2019-08-19 19:00:32', '00:43:9', 'w2fb6av1k27v19e2uj7y', 1, 'jose sebastian rodrigue garza', '2', 'Entrada', 'rodriguezgarza', 'Pensamiento Matematico y Analitico:=36.67', 'Comprensión Lectora y Argumentación:=20', 'Inglés:=15', '0', '0', '0'),
(544, NULL, 'Alan Eduardo Canseco Franco', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-20 08:28:40', '00:2:9', 'u9yk5lv6j78x17l1mf9i', 1, 'Alan.canseco', '11', 'Entrada', 'aecf', 'Pensamiento Matematico y Analitico:=60', 'Inglés:=70', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=40', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=15'),
(545, NULL, 'hector ivan garcia garcia', 'Química área Industrial', 'Matutino', '2019-08-20 08:28:41', '00:59:54', 'p6ie5os9a65t89d9ca7d', 1, 'hector.garcia', '11', 'Entrada', 'higg', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=30', 'Pensamiento Matematico y Analitico:=16.67', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=23.33', 'Inglés:=65'),
(546, NULL, 'Nataly González', 'Lengua Inglesa', 'Matutino', '2019-08-20 08:28:42', '00:54:27', 'i8so7ma9b63o84b4kk3i', 1, 'Nataly.Gónzalez', '11', 'Entrada', 'nmg', 'Pensamiento Matematico y Analitico:=46.67', 'Inglés:=80', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=30', 'Inglés:=95', 'Comprensión Lectora y Argumentación:=70'),
(547, NULL, 'Elvis Jared Tamez Herrera', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-20 08:28:42', '00:45:9', 'x7xb9cr8w58o17s2lw5t', 1, 'Elvis Tamez', '11', 'Entrada', 'EJTH', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=50'),
(548, NULL, 'Gloria Maria Gonzalez Rivera ', 'Química área Industrial', 'Matutino', '2019-08-20 08:28:43', '00:42:25', 'a6ga2pd2s43v84k4zd8n', 1, 'Gloria.Gonzalez', '11', 'Entrada', 'GMGR', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=33.33', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=75', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=40'),
(549, NULL, 'fernando jair ramos bernal', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-20 08:28:44', '00:25:17', 'n8eu8me1k87d17l7yd4h', 1, 'fernando.ramos', '11', 'Entrada', 'fjrb', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=65', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=23.33'),
(550, NULL, 'Luis Gerardo Diaz Chavez', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-20 08:28:46', '00:21:37', 'n2te3nt7j79c94i1ng5n', 1, 'Gerardo Diaz', '11', 'Entrada', 'lgdc', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=63.33', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=43.33', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=30'),
(551, NULL, 'Gabriela Sarahi Hernandez Flores', 'Lengua Inglesa', 'Matutino', '2019-08-20 08:28:52', '00:28:31', 'n5qj7yg6q24v82j1qm2g', 1, 'Gabriela.hernandez', '11', 'Entrada', 'gshf', 'Comprensión Lectora y Argumentación:=40', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=26.67', 'Pensamiento Matematico y Analitico:=43.33', 'Comprensión Lectora y Argumentación:=40', 'Inglés:=75'),
(552, NULL, 'Jose Alfredo Trejo Fernandez', '-1', 'Matutino', '2019-08-20 08:29:17', '00:55:47', 'i2bt4ok5z58n27k1nh1t', 1, 'sergio.cavazos', '11', 'Entrada', 'jatf', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=55', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=43.33'),
(553, NULL, 'Pablo Adrian Salvador Cantu', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-20 08:29:19', '1:14:27', 'y3rj5bd3j49h96t3nq9q', 1, 'Pablo Cantu', '11', 'Entrada', 'pasc', 'Pensamiento Matematico y Analitico:=56.67', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=30', '0', '0', '0'),
(558, NULL, 'nayeli perez mazariegos', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-20 08:29:57', '1:10:18', 'b9tw2vq3b65f56s1xg7n', 1, 'nayeli perez mazariegos', '11', 'Entrada', 'nayeli perez mazariegos', 'Inglés:=25', 'Pensamiento Matematico y Analitico:=16.67', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=36.67', 'Inglés:=55', 'Comprensión Lectora y Argumentación:=70'),
(559, NULL, 'Estefania Salazar', 'Química área Industrial', 'Matutino', '2019-08-20 08:30:10', '1:2:8', 'x1gf5kd5l49w62f4eh4g', 1, 'Estefania salazar sanchez', '11', 'Entrada', 'ess', 'Pensamiento Matematico y Analitico:=53.33', 'Comprensión Lectora y Argumentación:=30', 'Inglés:=40', '0', '0', '0'),
(560, NULL, 'sergio guadalupe cavazos rodriguez ', 'Mantenimiento área Industrial', 'Matutino', '2019-08-20 08:30:11', '00:16:9', 's8qh9oo6c86q29l2la7s', 1, 'sergio.rodriguez', '11', 'Entrada', 'sgcr', '0', '0', '0', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=40', 'Inglés:=30'),
(562, NULL, 'gonzalo misael perez hernandez', '-1', 'Nocturno', '2019-08-20 18:40:04', '1:2:33', 'i8nc5co6i69f22k5iy5t', 1, 'gonzalo.perez', '5', 'Entrada', 'gmph', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=40', '0', '0', '0'),
(563, NULL, 'gustavo angel lara gonzalez', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-20 18:40:04', '00:45:00', 'w7xn4ds3u92n97x7mx5p', 1, 'gustavo.angel', '5', 'Entrada', 'galg', 'Pensamiento Matematico y Analitico:=33.33', 'Inglés:=40', 'Comprensión Lectora y Argumentación:=70', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=30', 'Inglés:=30'),
(564, NULL, 'jose mauricio silva dominguez', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-20 18:40:04', '00:51:6', 'a1gt3yr8k82c83h2ve4q', 1, 'mauricio.silva', '5', 'Entrada', 'jmsd', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=75', 'Inglés:=50', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=56.67', 'Comprensión Lectora y Argumentación:=85'),
(565, NULL, 'Jesus Carreon', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-23 16:26:48', '1:29:59', 'h9ma1zu3q85e79b8bi3d', 1, 'BORRAR', '2', 'Entrada', '123', 'Inglés:=25', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=20', 'Pensamiento Matematico y Analitico:=26.67', 'Inglés:=20', 'Comprensión Lectora y Argumentación:=30');
INSERT INTO `alumnos` (`id`, `examen_id`, `nombre`, `carrera`, `turno`, `fecha`, `tiempo`, `codigoUsuario`, `examenAuto_id`, `username`, `grupo`, `evaluacion`, `contrasena`, `calificacionE1`, `calificacionE2`, `calificacionE3`, `calificacionS1`, `calificacionS2`, `calificacionS3`) VALUES
(566, NULL, 'tabatha analine leal resendiz', 'Lengua Inglesa', 'Matutino', '2019-08-30 08:59:58', '00:11:27', 'g7aq7kc6y44m56h3wk6n', 1, 'tabatha.leal', '1', 'Entrada', 'talr', 'Pensamiento Matematico y Analitico:=26.67', 'Inglés:=35', 'Comprensión Lectora y Argumentación:=25', '0', '0', '0'),
(567, NULL, 'hugo garza', 'Mantenimiento área Industrial', 'Matutino', '2019-08-30 09:13:41', '00:33:50', 'y5kb2yv8h48y63i7uu8g', 1, 'hugo.garza', '5', 'Entrada', 'hags', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=60', '0', '0', '0'),
(568, NULL, 'lars garcias jacinto', 'Mantenimiento área Industrial', 'Matutino', '2019-08-30 09:15:54', '00:52:34', 'h9cb2wc9g75x57k1fl7y', 1, 'lars. gacias.', '4', 'Entrada', 'lgj', 'Inglés:=25', 'Comprensión Lectora y Argumentación:=45', 'Pensamiento Matematico y Analitico:=43.33', '0', '0', '0'),
(569, NULL, 'oswaldo sanchez', 'Química área Industrial', 'Matutino', '2019-08-30 09:17:38', '00:41:32', 'c2da9da4j93j67s1xt4w', 1, 'oswaldo.sanchez', '5', 'Entrada', 'osj', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=40', 'Pensamiento Matematico y Analitico:=43.33', '0', '0', '0'),
(570, NULL, 'Manuel Alejandro Sandoval Escamilla', 'Mantenimiento área Industrial', 'Matutino', '2019-08-30 09:47:35', '1:1:31', 'o2db8kp2l11z41h6ak7j', 1, 'Manuel.Sandoval', '6', 'Entrada', 'MASE', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=40', '0', '0', '0'),
(571, NULL, 'Nelly Alejandra Aparicio Evangelista', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-30 09:59:05', '00:47:00', 'v7py8tp5z87h13d4zc9t', 1, 'nelly.aparicio', '6', 'Entrada', 'naae', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=70', 'Pensamiento Matematico y Analitico:=33.33', '0', '0', '0'),
(572, NULL, 'Raul Edelmiro Partida Davila', 'Mantenimiento área Industrial', 'Matutino', '2019-08-30 10:05:07', '00:54:17', 'o9pc8pp7m58z53u5nl6o', 1, 'raul.partida', '7', 'Entrada', 'repd', 'Inglés:=90', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=65', '0', '0', '0'),
(573, NULL, 'brittney rodriguez rincon ', 'Química área Industrial', 'Matutino', '2019-08-30 10:05:26', '00:48:5', 'k2fp6bo8c14n42c6gz2d', 1, 'brittney rodriguez', '7', 'Entrada', 'brr', 'Pensamiento Matematico y Analitico:=40', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=50', '0', '0', '0'),
(574, NULL, 'laura marisol ', 'Química área Industrial', 'Matutino', '2019-08-30 10:28:58', '00:44:38', 'j9bb6yu4a84r93k5ap7z', 1, 'laura.martinez', '10', 'Entrada', 'lmml', 'Inglés:=55', 'Comprensión Lectora y Argumentación:=70', 'Pensamiento Matematico y Analitico:=46.67', '0', '0', '0'),
(575, NULL, 'Héctor David Subiria Gonzalez', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Matutino', '2019-08-30 10:29:02', '00:31:50', 'd1as1le8n98z73w3xj2r', 1, 'Hector', '10', 'Entrada', 'HDSG', 'Comprensión Lectora y Argumentación:=45', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=43.33', '0', '0', '0'),
(576, NULL, 'gerardo alcocer macias ', 'Química área Industrial', 'Matutino', '2019-08-30 10:29:05', '00:43:47', 'w3sc4mu4q88y43i4rl5v', 1, 'gerardo ', '10', 'Entrada', 'gam', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=50', 'Pensamiento Matematico y Analitico:=36.67', '0', '0', '0'),
(577, NULL, 'gerardo garza oyervidez', 'Química área Industrial', 'Matutino', '2019-08-30 10:29:28', '00:00:00', 't9fx9he8q37v94j9wt9u', 1, 'geragza15', '10', 'Entrada', 'ggo', 'Pensamiento Matematico y Analitico:=26.67', 'Inglés:=65', 'Comprensión Lectora y Argumentación:=55', '0', '0', '0'),
(578, NULL, 'Damaris Sarahi Puga Quintanilla', 'Lengua Inglesa', 'Matutino', '2019-08-30 10:59:06', '00:40:7', 'w4ji3yl3s43g75z8sa8n', 1, 'damarispuga', '11', 'Entrada', 'dspq', 'Comprensión Lectora y Argumentación:=70', 'Inglés:=65', 'Pensamiento Matematico y Analitico:=30', '0', '0', '0'),
(579, NULL, 'DIEGO ARMANDO DIAZ MARTINI', 'Mecatrónica área Automatización', 'Matutino', '2019-08-30 10:59:29', '00:58:51', 'w5ox8mx7e38l37a2yq8b', 1, 'Diego.Diaz', '11', 'Entrada', 'dadm', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=50', 'Inglés:=85', '0', '0', '0'),
(580, NULL, 'Oscar Yamil Ham Hernandez', 'Mantenimiento área Industrial', 'Matutino', '2019-08-30 10:59:42', '00:7:52', 'e7ef5iv9a69l74r6vc9z', 1, 'Oscar.Ham', '11', 'Entrada', 'oyhh', 'Comprensión Lectora y Argumentación:=35', 'Inglés:=30', 'Pensamiento Matematico y Analitico:=30', '0', '0', '0'),
(581, NULL, 'Paola Lizbeth Garza Tamez ', 'Desarrollo de Negocios área Mercadotecnia', 'Matutino', '2019-08-30 10:59:54', '00:39:2', 'z3lt5so1l85m33e6kp7g', 1, 'Paola.Garza ', '11', 'Entrada', 'plgt', 'Inglés:=45', 'Comprensión Lectora y Argumentación:=65', 'Pensamiento Matematico y Analitico:=50', '0', '0', '0'),
(582, NULL, 'cristopher Rodriguez Trejo ', 'Mecatrónica área Automatización', 'Matutino', '2019-08-30 10:59:54', '00:54:51', 't7pm6je7e92f69n5pb8m', 1, 'cristopher.Rodriguez ', '11', 'Entrada', 'crt', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=30', 'Pensamiento Matematico y Analitico:=30', '0', '0', '0'),
(583, NULL, ' Ericka Alejandra Aguillón Peña ', 'Lengua Inglesa', 'Matutino', '2019-08-30 10:59:55', '00:41:6', 'z8xw6aj2n16p26h4vl7j', 1, 'Ericka.Aguillón ', '11', 'Entrada', 'eaap', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=40', 'Comprensión Lectora y Argumentación:=60', '0', '0', '0'),
(587, NULL, 'Daniela Gonzalez Padron', 'Lengua Inglesa', 'Matutino', '2019-08-30 11:02:57', '00:39:25', 'z9sv6yb6a52v34c1io9c', 1, 'Daniela.Padron', '11', 'Entrada', 'dgp', 'Pensamiento Matematico y Analitico:=36.67', 'Inglés:=55', 'Comprensión Lectora y Argumentación:=55', '0', '0', '0'),
(588, NULL, 'jared manuel zamudio', 'Mantenimiento área Industrial', 'Matutino', '2019-08-30 11:13:25', '00:29:48', 't7tz5pr8s41t48z4al7o', 1, 'jared.manuel', '11', 'Entrada', 'jmz', 'Pensamiento Matematico y Analitico:=43.33', 'Comprensión Lectora y Argumentación:=35', 'Inglés:=45', '0', '0', '0'),
(589, NULL, 'Eduardo Alexander Cabello Treviño', 'Química área Industrial', 'Matutino', '2019-08-30 11:13:30', '00:32:42', 'p8yl6xt9k66f77i3tg5o', 1, 'eduardo.cabello', '11', 'Entrada', 'eact', 'Inglés:=75', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=30', '0', '0', '0'),
(590, NULL, 'Brenda del Angel Alejo', 'Lengua Inglesa', 'Matutino', '2019-08-30 11:14:05', '00:52:37', 'h4zz7xg3j58m84f4fe1r', 1, 'Brenda.del Angel', '11', 'Entrada', 'BAA', 'Inglés:=85', 'Comprensión Lectora y Argumentación:=75', 'Pensamiento Matematico y Analitico:=46.67', '0', '0', '0'),
(591, NULL, 'Jesus Dibenhi Acosta Mata', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-30 18:55:26', '00:56:45', 'd4rg4yg1a47j56a5rs4a', 1, 'jesus.acosta', '5', 'Entrada', 'j.d.a.m', 'Inglés:=45', 'Pensamiento Matematico y Analitico:=30', 'Comprensión Lectora y Argumentación:=50', '0', '0', '0'),
(592, NULL, 'stephany.martinez ', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-30 18:56:57', '1:4:15', 'e9eu8vd3v59b71x9qp6j', 1, 'stephany.martinez', '5', 'Entrada', 'SGMD', 'Pensamiento Matematico y Analitico:=53.33', 'Comprensión Lectora y Argumentación:=80', 'Inglés:=80', '0', '0', '0'),
(593, NULL, 'JORGE LUIS LOPEZ ', 'Mecatrónica área Automatización', 'Nocturno', '2019-08-30 18:57:12', '1:3:56', 'd7al8bn2w15a37s1fj2u', 1, 'JORGE ESCOBEDO', '5', 'Entrada', 'JORGE987', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=30', 'Inglés:=80', '0', '0', '0'),
(594, NULL, 'Luis Gerardo Sosa Sosa', 'Mecatrónica área Automatización', 'Nocturno', '2019-08-30 18:59:08', '00:59:38', 'h7ok2ds9t71l22e1rf7b', 1, 'Luis.Sosa', '5', 'Entrada', 'LGSS', 'Comprensión Lectora y Argumentación:=60', 'Pensamiento Matematico y Analitico:=30', 'Inglés:=55', '0', '0', '0'),
(595, NULL, 'Angel Daniel Gonzalez Rico', 'Mecatrónica área Automatización', 'Nocturno', '2019-08-30 19:32:32', '1:12:56', 'c8fj1sk7c84l71l3cv3h', 1, 'Daniel Gonzalez', '6', 'Entrada', 'seckerphg', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=86.67', 'Inglés:=75', '0', '0', '0'),
(596, NULL, 'jesus antonio', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-30 19:34:47', '00:56:3', 't3sx4mu4z47d69y1ov7d', 1, 'jesus galvez', '6', 'Entrada', '8281224096', 'Inglés:=60', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=40', '0', '0', '0'),
(597, NULL, 'CHRISTIAN EDUARDO VILLEGAS MALDONADO', 'Química área Industrial', 'Nocturno', '2019-08-30 19:38:13', '1:20:14', 'q3dg7qd7y39n87r9ez1g', 1, 'CHRISTIAN.VILLEGAS', '6', 'Entrada', 'VILLEGAS1993', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=55', 'Pensamiento Matematico y Analitico:=26.67', '0', '0', '0'),
(598, NULL, 'Armando Martínez García ', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Nocturno', '2019-08-30 19:40:49', '1:3:16', 'f3sn7zb7z57a17n1rd5j', 1, 'armandoMG', '6', 'Entrada', 'armando18977', 'Pensamiento Matematico y Analitico:=46.67', 'Comprensión Lectora y Argumentación:=65', 'Inglés:=45', '0', '0', '0'),
(599, NULL, 'Giovanna Cardenas Paz ', 'Mantenimiento área Industrial', 'Nocturno', '2019-08-30 19:40:58', '00:34:10', 'g2rj4nx9y87q95w7ay9w', 1, 'Giovanna Cardenas Paz', '6', 'Entrada', 'giovanna2020', 'Pensamiento Matematico y Analitico:=43.33', 'Comprensión Lectora y Argumentación:=25', 'Inglés:=45', '0', '0', '0'),
(600, NULL, 'Nadia Alexandra González Espinosa', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-30 19:41:00', '00:32:17', 'b1uh8ua6s57t88z7be1x', 1, 'Nadia', '6', 'Entrada', '4546', 'Comprensión Lectora y Argumentación:=60', 'Inglés:=50', 'Pensamiento Matematico y Analitico:=33.33', '0', '0', '0'),
(601, NULL, 'Adriana Sofia Montes Gonzalez', 'Mecatrónica área Automatización', 'Nocturno', '2019-08-30 19:41:14', '00:50:30', 'r5al5xz7r33w57k5hw5v', 1, 'adriana.montes', '6', 'Entrada', '1110396gzz', '0', '0', '0', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=80', 'Pensamiento Matematico y Analitico:=76.67'),
(602, NULL, 'GERARDO ITURBIDE SANTIAGO', 'Química área Industrial', 'Nocturno', '2019-08-30 19:41:23', '1:20:00', 'g5gb7xg4u39v21z5kr7o', 1, 'GERARDO ITURBIDE SANTIAGO', '6', 'Entrada', 'CRUZ AZUL', 'Comprensión Lectora y Argumentación:=85', 'Pensamiento Matematico y Analitico:=53.33', 'Inglés:=50', '0', '0', '0'),
(603, NULL, 'alexandra de jesus arredondo gonzalez', 'Desarrollo de Negocios área Mercadotecnia', 'Nocturno', '2019-08-30 19:41:42', '00:18:8', 'u8da3ee5g11h67k7go9y', 1, 'alexandra arredondo', '6', 'Entrada', 'alexandradejesusarredondo123', 'Pensamiento Matematico y Analitico:=23.33', 'Comprensión Lectora y Argumentación:=20', 'Inglés:=25', '0', '0', '0'),
(604, NULL, 'JOSE MANUEL NAJERA DIAZ', 'Tecnologías de la Información área Entornos Virtuales y Negocios Digitales', 'Nocturno', '2019-08-30 19:41:54', '1:29:59', 'u5sb2my8o21y39x3dq8l', 1, 'MANE NAJERA', '6', 'Entrada', 'manuel62', 'Inglés:=80', 'Pensamiento Matematico y Analitico:=50', 'Comprensión Lectora y Argumentación:=0', '0', '0', '0'),
(605, NULL, 'Johan Ariel Gutierrez Rodriguez', 'Mecatrónica área Automatización', 'Nocturno', '2019-08-30 19:42:18', '1:14:19', 'f2de3jp3u93u13e1ir3p', 1, 'Johan Gtz Rdz', '6', 'Entrada', 'johanlive5', 'Pensamiento Matematico y Analitico:=83.33', 'Inglés:=90', 'Comprensión Lectora y Argumentación:=70', '0', '0', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_en_examen`
--

CREATE TABLE `alumnos_en_examen` (
  `id` int(11) NOT NULL,
  `examen_id` int(11) DEFAULT NULL,
  `alumno_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_maestros`
--

CREATE TABLE `alumnos_maestros` (
  `alumnos_id` int(11) NOT NULL,
  `maestros_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `alumnos_maestros`
--

INSERT INTO `alumnos_maestros` (`alumnos_id`, `maestros_id`) VALUES
(61, 5),
(61, 12),
(61, 18),
(62, 5),
(62, 12),
(62, 18),
(63, 5),
(63, 12),
(63, 18),
(64, 5),
(64, 12),
(64, 18),
(65, 5),
(65, 13),
(65, 18),
(66, 5),
(66, 12),
(66, 18),
(67, 5),
(67, 12),
(67, 18),
(68, 5),
(68, 12),
(68, 18),
(69, 5),
(69, 12),
(69, 18),
(70, 5),
(70, 12),
(70, 18),
(71, 5),
(71, 13),
(71, 18),
(72, 5),
(72, 13),
(72, 18),
(73, 5),
(73, 12),
(73, 18),
(74, 5),
(74, 12),
(74, 18),
(75, 5),
(75, 12),
(75, 18),
(76, 5),
(76, 13),
(76, 18),
(77, 5),
(77, 12),
(77, 18),
(78, 5),
(78, 12),
(78, 18),
(79, 5),
(79, 13),
(79, 18),
(80, 5),
(80, 13),
(80, 18),
(81, 5),
(81, 12),
(81, 18),
(82, 5),
(82, 13),
(82, 18),
(83, 5),
(83, 12),
(83, 18),
(84, 5),
(84, 12),
(84, 18),
(85, 5),
(85, 12),
(85, 18),
(86, 5),
(86, 12),
(86, 18),
(87, 5),
(87, 12),
(87, 18),
(88, 5),
(88, 12),
(88, 18),
(89, 5),
(89, 12),
(89, 18),
(90, 5),
(90, 12),
(90, 18),
(91, 5),
(91, 12),
(91, 18),
(92, 5),
(92, 12),
(92, 18),
(93, 5),
(93, 13),
(93, 18),
(94, 5),
(94, 12),
(94, 18),
(95, 5),
(95, 12),
(95, 18),
(96, 5),
(96, 13),
(96, 18),
(97, 5),
(97, 12),
(97, 18),
(98, 5),
(98, 12),
(98, 18),
(99, 5),
(99, 12),
(99, 18),
(100, 5),
(100, 12),
(100, 18),
(101, 5),
(101, 13),
(101, 18),
(102, 5),
(102, 12),
(102, 18),
(103, 5),
(103, 12),
(103, 18),
(104, 5),
(104, 12),
(104, 18),
(105, 5),
(105, 12),
(105, 18),
(106, 5),
(106, 12),
(106, 18),
(108, 5),
(108, 12),
(108, 18),
(109, 5),
(109, 12),
(109, 18),
(110, 5),
(110, 12),
(110, 18),
(111, 5),
(111, 12),
(111, 18),
(112, 5),
(112, 12),
(112, 18),
(113, 5),
(113, 12),
(113, 18),
(114, 5),
(114, 12),
(114, 18),
(115, 5),
(115, 12),
(115, 18),
(116, 5),
(116, 12),
(116, 18),
(117, 5),
(117, 12),
(117, 18),
(118, 5),
(118, 12),
(118, 18),
(119, 5),
(119, 12),
(119, 18),
(120, 5),
(120, 12),
(120, 18),
(121, 5),
(121, 12),
(121, 18),
(122, 5),
(122, 12),
(122, 18),
(123, 5),
(123, 12),
(123, 18),
(124, 5),
(124, 12),
(124, 18),
(125, 5),
(125, 12),
(125, 18),
(126, 5),
(126, 12),
(126, 18),
(127, 5),
(127, 12),
(127, 18),
(128, 5),
(128, 12),
(128, 18),
(129, 5),
(129, 12),
(129, 18),
(131, 5),
(131, 12),
(131, 18),
(132, 5),
(132, 12),
(132, 18),
(133, 5),
(133, 12),
(133, 18),
(134, 5),
(134, 12),
(134, 18),
(135, 5),
(135, 12),
(135, 18),
(136, 5),
(136, 12),
(136, 18),
(138, 5),
(138, 12),
(138, 18),
(139, 5),
(139, 12),
(139, 18),
(140, 5),
(140, 12),
(140, 18),
(141, 5),
(141, 12),
(141, 18),
(142, 5),
(142, 12),
(142, 18),
(143, 5),
(143, 12),
(143, 18),
(144, 5),
(144, 12),
(144, 18),
(145, 5),
(145, 12),
(145, 18),
(146, 5),
(146, 12),
(146, 18),
(147, 5),
(147, 12),
(147, 18),
(148, 5),
(148, 12),
(148, 18),
(149, 5),
(149, 12),
(149, 18),
(150, 5),
(150, 12),
(150, 18),
(151, 5),
(151, 12),
(151, 18),
(152, 5),
(152, 12),
(152, 18),
(153, 5),
(153, 12),
(153, 18),
(154, 5),
(154, 12),
(154, 18),
(155, 5),
(155, 12),
(155, 18),
(156, 5),
(156, 12),
(156, 18),
(157, 5),
(157, 12),
(157, 18),
(159, 5),
(159, 13),
(159, 18),
(160, 5),
(160, 13),
(160, 18),
(161, 5),
(161, 13),
(161, 18),
(162, 5),
(162, 13),
(162, 18),
(163, 5),
(163, 13),
(163, 18),
(164, 5),
(164, 13),
(164, 18),
(165, 5),
(165, 13),
(165, 18),
(166, 5),
(166, 13),
(166, 18),
(167, 5),
(167, 13),
(167, 18),
(168, 5),
(168, 13),
(168, 18),
(169, 5),
(169, 13),
(169, 18),
(170, 5),
(170, 13),
(170, 18),
(171, 5),
(171, 13),
(171, 18),
(172, 5),
(172, 13),
(172, 18),
(173, 5),
(173, 13),
(173, 18),
(174, 5),
(174, 13),
(174, 18),
(175, 5),
(175, 13),
(175, 18),
(176, 5),
(176, 13),
(176, 18),
(177, 5),
(177, 13),
(177, 18),
(178, 5),
(178, 13),
(178, 18),
(179, 5),
(179, 13),
(179, 18),
(181, 5),
(181, 13),
(181, 18),
(182, 5),
(182, 13),
(182, 18),
(183, 5),
(183, 13),
(183, 18),
(184, 5),
(184, 13),
(184, 18),
(185, 5),
(185, 12),
(185, 18),
(186, 5),
(186, 13),
(186, 18),
(187, 5),
(187, 12),
(187, 18),
(188, 5),
(188, 12),
(188, 18),
(189, 5),
(189, 12),
(189, 18),
(192, 5),
(192, 13),
(192, 18),
(193, 5),
(193, 13),
(193, 18),
(194, 5),
(194, 13),
(194, 18),
(195, 5),
(195, 13),
(195, 18),
(196, 5),
(196, 13),
(196, 18),
(197, 5),
(197, 13),
(197, 18),
(198, 5),
(198, 13),
(198, 18),
(199, 5),
(199, 13),
(199, 18),
(201, 5),
(201, 13),
(201, 18),
(202, 5),
(202, 13),
(202, 18),
(203, 5),
(203, 13),
(203, 18),
(205, 5),
(205, 13),
(205, 18),
(207, 5),
(207, 13),
(207, 18),
(208, 5),
(208, 13),
(208, 18),
(209, 5),
(209, 13),
(209, 18),
(213, 5),
(213, 13),
(213, 18),
(215, 5),
(215, 12),
(215, 18),
(219, 5),
(219, 12),
(219, 18),
(239, 5),
(239, 12),
(239, 18),
(240, 5),
(240, 12),
(240, 18),
(241, 5),
(241, 12),
(241, 18),
(242, 5),
(242, 12),
(242, 18),
(243, 5),
(243, 12),
(243, 18),
(244, 5),
(244, 12),
(244, 18),
(245, 5),
(245, 12),
(245, 18),
(246, 5),
(246, 12),
(246, 18),
(247, 5),
(247, 12),
(247, 18),
(248, 5),
(248, 12),
(248, 18),
(249, 5),
(249, 12),
(249, 18),
(250, 5),
(250, 12),
(250, 18),
(251, 5),
(251, 13),
(251, 18),
(252, 5),
(252, 12),
(252, 18),
(253, 5),
(253, 12),
(253, 18),
(254, 5),
(254, 12),
(254, 18),
(255, 5),
(255, 12),
(255, 18),
(256, 5),
(256, 12),
(256, 18),
(257, 5),
(257, 12),
(257, 18),
(258, 5),
(258, 13),
(258, 18),
(259, 5),
(259, 12),
(259, 18),
(260, 5),
(260, 12),
(260, 18),
(261, 5),
(261, 12),
(261, 18),
(262, 5),
(262, 12),
(262, 18),
(263, 5),
(263, 12),
(263, 18),
(264, 5),
(264, 13),
(264, 18),
(265, 5),
(265, 12),
(265, 18),
(266, 5),
(266, 12),
(266, 18),
(267, 5),
(267, 13),
(267, 18),
(268, 5),
(268, 12),
(268, 18),
(269, 5),
(269, 13),
(269, 18),
(270, 21),
(270, 30),
(270, 32),
(271, 5),
(271, 12),
(271, 18),
(272, 5),
(272, 12),
(272, 18),
(273, 5),
(273, 12),
(273, 18),
(274, 5),
(274, 12),
(274, 18),
(275, 5),
(275, 12),
(275, 18),
(276, 5),
(276, 12),
(276, 18),
(277, 5),
(277, 12),
(277, 18),
(278, 5),
(278, 12),
(278, 18),
(279, 5),
(279, 12),
(279, 18),
(280, 5),
(280, 12),
(280, 18),
(282, 5),
(282, 12),
(282, 18),
(283, 5),
(283, 12),
(283, 18),
(284, 5),
(284, 12),
(284, 18),
(285, 8),
(285, 19),
(285, 32),
(286, 5),
(286, 12),
(286, 18),
(287, 5),
(287, 12),
(287, 18),
(288, 5),
(288, 12),
(288, 18),
(289, 5),
(289, 12),
(289, 18),
(290, 5),
(290, 12),
(290, 18),
(291, 5),
(291, 12),
(291, 18),
(292, 5),
(292, 12),
(292, 18),
(293, 5),
(293, 12),
(293, 18),
(294, 5),
(294, 12),
(294, 18),
(295, 5),
(295, 12),
(295, 18),
(296, 5),
(296, 12),
(296, 18),
(297, 5),
(297, 12),
(297, 18),
(298, 5),
(298, 12),
(298, 18),
(299, 5),
(299, 12),
(299, 18),
(300, 5),
(300, 12),
(300, 18),
(301, 5),
(301, 12),
(301, 18),
(302, 5),
(302, 12),
(302, 18),
(303, 5),
(303, 12),
(303, 18),
(304, 5),
(304, 12),
(304, 18),
(305, 5),
(305, 12),
(305, 18),
(306, 5),
(306, 12),
(306, 18),
(307, 5),
(307, 12),
(307, 18),
(308, 5),
(308, 12),
(308, 18),
(309, 5),
(309, 12),
(309, 18),
(311, 5),
(311, 12),
(311, 18),
(312, 5),
(312, 12),
(312, 18),
(313, 5),
(313, 13),
(313, 18),
(314, 5),
(314, 13),
(314, 18),
(315, 5),
(315, 13),
(315, 18),
(316, 5),
(316, 12),
(316, 18),
(317, 5),
(317, 12),
(317, 18),
(319, 5),
(319, 13),
(319, 18),
(320, 5),
(320, 13),
(320, 18),
(321, 5),
(321, 13),
(321, 18),
(322, 5),
(322, 12),
(322, 18),
(323, 5),
(323, 13),
(323, 18),
(324, 5),
(324, 12),
(324, 18),
(325, 5),
(325, 12),
(325, 18),
(326, 5),
(326, 13),
(326, 18),
(327, 5),
(327, 13),
(327, 18),
(328, 5),
(328, 12),
(328, 18),
(329, 5),
(329, 12),
(329, 18),
(330, 5),
(330, 12),
(330, 18),
(331, 5),
(331, 13),
(331, 18),
(333, 5),
(333, 12),
(333, 18),
(334, 5),
(334, 13),
(334, 18),
(335, 8),
(335, 20),
(335, 33),
(336, 5),
(336, 13),
(336, 18),
(337, 5),
(337, 12),
(337, 18),
(338, 5),
(338, 13),
(338, 18),
(340, 5),
(340, 12),
(340, 18),
(341, 5),
(341, 13),
(341, 18),
(342, 5),
(342, 12),
(342, 18),
(343, 5),
(343, 13),
(343, 18),
(344, 5),
(344, 13),
(344, 18),
(345, 22),
(345, 31),
(345, 35),
(348, 5),
(348, 13),
(348, 18),
(349, 8),
(349, 19),
(349, 32),
(350, 8),
(350, 19),
(350, 32),
(351, 20),
(351, 28),
(351, 35),
(352, 8),
(352, 19),
(352, 32),
(353, 8),
(353, 19),
(353, 32),
(354, 8),
(354, 19),
(354, 32),
(355, 24),
(355, 31),
(355, 36),
(356, 24),
(356, 28),
(356, 35),
(357, 8),
(357, 22),
(357, 32),
(358, 24),
(358, 26),
(358, 33),
(359, 8),
(359, 22),
(359, 32),
(360, 24),
(360, 28),
(360, 34),
(361, 19),
(361, 27),
(361, 36),
(362, 19),
(362, 31),
(362, 36),
(363, 24),
(363, 26),
(363, 33),
(365, 20),
(365, 36),
(365, 37),
(366, 24),
(366, 26),
(366, 33),
(367, 24),
(367, 26),
(367, 33),
(368, 19),
(368, 26),
(368, 33),
(369, 25),
(369, 26),
(369, 36),
(371, 19),
(371, 31),
(371, 33),
(372, 8),
(372, 20),
(372, 32),
(373, 8),
(373, 20),
(373, 36),
(374, 8),
(374, 20),
(374, 32),
(375, 8),
(375, 20),
(375, 33),
(376, 21),
(376, 27),
(376, 33),
(377, 8),
(377, 20),
(377, 32),
(378, 20),
(378, 28),
(378, 33),
(379, 20),
(379, 27),
(379, 33),
(380, 8),
(380, 19),
(380, 32),
(381, 20),
(381, 28),
(381, 33),
(382, 22),
(382, 28),
(382, 32),
(383, 8),
(383, 19),
(383, 33),
(384, 19),
(384, 30),
(384, 36),
(385, 20),
(385, 31),
(385, 35),
(386, 8),
(386, 19),
(386, 33),
(387, 8),
(387, 23),
(387, 32),
(388, 20),
(388, 30),
(388, 33),
(389, 19),
(389, 28),
(389, 36),
(390, 8),
(390, 22),
(390, 35),
(391, 8),
(391, 22),
(391, 35),
(392, 21),
(392, 28),
(392, 32),
(393, 24),
(393, 27),
(393, 32),
(394, 19),
(394, 30),
(394, 33),
(395, 20),
(395, 27),
(395, 32),
(396, 21),
(396, 28),
(396, 34),
(397, 21),
(397, 28),
(397, 34),
(398, 21),
(398, 28),
(398, 34),
(399, 21),
(399, 28),
(399, 34),
(401, 21),
(401, 28),
(401, 34),
(402, 21),
(402, 28),
(402, 34),
(403, 21),
(403, 28),
(403, 34),
(404, 21),
(404, 28),
(404, 34),
(405, 21),
(405, 28),
(405, 34),
(406, 21),
(406, 28),
(406, 34),
(407, 21),
(407, 28),
(407, 34),
(408, 21),
(408, 28),
(408, 34),
(409, 21),
(409, 28),
(409, 34),
(410, 21),
(410, 28),
(410, 34),
(411, 21),
(411, 28),
(411, 34),
(412, 21),
(412, 28),
(412, 34),
(413, 5),
(413, 12),
(413, 18),
(414, 21),
(414, 28),
(414, 34),
(415, 21),
(415, 28),
(415, 34),
(416, 21),
(416, 28),
(416, 34),
(418, 21),
(418, 28),
(418, 34),
(419, 21),
(419, 28),
(419, 34),
(420, 21),
(420, 28),
(420, 34),
(421, 22),
(421, 28),
(421, 35),
(422, 8),
(422, 19),
(422, 34),
(423, 21),
(423, 35),
(423, 37),
(425, 8),
(425, 20),
(425, 36),
(426, 8),
(426, 20),
(426, 36),
(427, 20),
(427, 30),
(427, 33),
(428, 19),
(428, 27),
(428, 35),
(429, 21),
(429, 28),
(429, 33),
(430, 19),
(430, 31),
(430, 32),
(431, 22),
(431, 27),
(431, 36),
(432, 8),
(432, 22),
(432, 33),
(433, 22),
(433, 29),
(433, 36),
(434, 8),
(434, 19),
(434, 32),
(435, 8),
(435, 19),
(435, 32),
(436, 8),
(436, 22),
(436, 33),
(437, 8),
(437, 19),
(437, 32),
(438, 19),
(438, 31),
(438, 32),
(439, 24),
(439, 27),
(439, 33),
(440, 22),
(440, 26),
(440, 34),
(441, 23),
(441, 34),
(441, 37),
(442, 22),
(442, 27),
(442, 36),
(443, 19),
(443, 27),
(443, 35),
(447, 8),
(447, 19),
(447, 32),
(449, 23),
(449, 26),
(449, 34),
(450, 23),
(450, 28),
(450, 32),
(451, 8),
(451, 19),
(451, 32),
(452, 22),
(452, 26),
(452, 33),
(453, 19),
(453, 26),
(453, 34),
(454, 8),
(454, 19),
(454, 32),
(455, 21),
(455, 29),
(455, 34),
(456, 8),
(456, 20),
(456, 33),
(457, 19),
(457, 26),
(457, 35),
(458, 25),
(458, 26),
(458, 34),
(459, 8),
(459, 20),
(459, 32),
(460, 19),
(460, 26),
(460, 33),
(461, 8),
(461, 21),
(461, 36),
(462, 19),
(462, 28),
(462, 32),
(463, 8),
(463, 21),
(463, 34),
(464, 8),
(464, 21),
(464, 34),
(465, 19),
(465, 27),
(465, 34),
(467, 20),
(467, 28),
(467, 34),
(470, 21),
(470, 28),
(470, 34),
(472, 19),
(472, 27),
(472, 33),
(473, 19),
(473, 29),
(473, 32),
(485, 19),
(485, 26),
(485, 34),
(501, 8),
(501, 19),
(501, 32),
(540, 20),
(540, 28),
(540, 33),
(541, 23),
(541, 31),
(541, 34),
(544, 2),
(544, 9),
(544, 18),
(545, 2),
(545, 9),
(545, 18),
(546, 2),
(546, 9),
(546, 18),
(547, 2),
(547, 9),
(547, 18),
(548, 2),
(548, 9),
(548, 18),
(549, 2),
(549, 9),
(549, 18),
(550, 2),
(550, 9),
(550, 18),
(551, 2),
(551, 9),
(551, 18),
(552, 2),
(552, 9),
(552, 18),
(553, 2),
(553, 9),
(553, 18),
(558, 2),
(558, 9),
(558, 18),
(559, 2),
(559, 9),
(559, 18),
(560, 2),
(560, 9),
(560, 41),
(562, 20),
(562, 27),
(562, 32),
(563, 20),
(563, 26),
(563, 33),
(564, 20),
(564, 28),
(564, 33),
(565, 1),
(565, 9),
(565, 14),
(566, 1),
(566, 14),
(566, 39),
(567, 5),
(567, 18),
(567, 40),
(568, 7),
(568, 9),
(568, 16),
(569, 5),
(569, 18),
(569, 42),
(570, 6),
(570, 13),
(570, 14),
(571, 6),
(571, 13),
(571, 14),
(572, 7),
(572, 15),
(572, 39),
(573, 1),
(573, 9),
(573, 14),
(574, 4),
(574, 11),
(574, 16),
(575, 1),
(575, 9),
(575, 14),
(576, 1),
(576, 9),
(576, 14),
(577, 1),
(577, 9),
(577, 15),
(578, 2),
(578, 9),
(578, 18),
(579, 2),
(579, 9),
(579, 41),
(580, 2),
(580, 9),
(580, 18),
(581, 2),
(581, 9),
(581, 18),
(582, 2),
(582, 9),
(582, 18),
(583, 2),
(583, 9),
(583, 18),
(587, 2),
(587, 9),
(587, 18),
(588, 2),
(588, 9),
(588, 18),
(589, 4),
(589, 18),
(589, 38),
(590, 2),
(590, 9),
(590, 18),
(591, 19),
(591, 26),
(591, 33),
(592, 23),
(592, 29),
(592, 33),
(593, 23),
(593, 29),
(593, 33),
(594, 23),
(594, 29),
(594, 33),
(595, 24),
(595, 30),
(595, 32),
(596, 22),
(596, 30),
(596, 32),
(597, 19),
(597, 26),
(597, 35),
(598, 24),
(598, 30),
(598, 32),
(599, 24),
(599, 30),
(599, 32),
(600, 24),
(600, 30),
(600, 32),
(601, 24),
(601, 30),
(601, 32),
(602, 24),
(602, 30),
(602, 32),
(603, 24),
(603, 30),
(603, 32),
(604, 24),
(604, 30),
(604, 32),
(605, 24),
(605, 30),
(605, 32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audio`
--

CREATE TABLE `audio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `correcto` tinyint(1) NOT NULL,
  `archive` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audio_pregunta`
--

CREATE TABLE `audio_pregunta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `archive` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

CREATE TABLE `examen` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instrucciones` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `codigoExam` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nivel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tiempo` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `examen`
--

INSERT INTO `examen` (`id`, `user_id`, `titulo`, `instrucciones`, `codigoExam`, `fecha`, `tipo`, `nivel`, `tiempo`) VALUES
(1, 1, 'Examen Prueba', 'Conteste Correctamente', 'Primer Examen', '2019-06-21 17:00:02', '0', '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenauto_preguntasauto`
--

CREATE TABLE `examenauto_preguntasauto` (
  `examenAuto_id` int(11) NOT NULL,
  `PreguntasAuto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `examenauto_preguntasauto`
--

INSERT INTO `examenauto_preguntasauto` (`examenAuto_id`, `PreguntasAuto_id`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen_auto`
--

CREATE TABLE `examen_auto` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instrucciones` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `codigoExam` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nivel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tiempo` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `examen_auto`
--

INSERT INTO `examen_auto` (`id`, `user_id`, `titulo`, `instrucciones`, `codigoExam`, `fecha`, `tipo`, `nivel`, `tiempo`) VALUES
(1, 1, 'Propedeutico', 'Conteste Correctamente las preguntras', 'primer', '2019-06-28 18:01:01', '0', '0.33333333333333', '1970-01-01 01:30:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fos_user_group`
--

CREATE TABLE `fos_user_group` (
  `id` int(11) NOT NULL,
  `name` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fos_user_user`
--

CREATE TABLE `fos_user_user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `biography` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `twitter_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `gplus_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `two_step_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fos_user_user`
--

INSERT INTO `fos_user_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `created_at`, `updated_at`, `date_of_birth`, `firstname`, `lastname`, `website`, `biography`, `gender`, `locale`, `timezone`, `phone`, `facebook_uid`, `facebook_name`, `facebook_data`, `twitter_uid`, `twitter_name`, `twitter_data`, `gplus_uid`, `gplus_name`, `gplus_data`, `token`, `two_step_code`) VALUES
(1, 'FelipeRMZ', 'felipermz', 'felipe@gmail.com', 'felipe@gmail.com', 1, 'q8aIWxB8LK7J1tGELChUUvb7aXYVwnpM1fzun7SfiQ8', '0+TB0uGpncjJrsTT40tj/OCdCZrgO7TEGbM36rGm+V6ruDk4ZSs/dK/h5fCPQiS0WIY1JanxukxQa6TbyNdzNw==', '2019-11-16 03:46:25', NULL, NULL, 'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}', '2019-06-21 23:46:14', '2019-11-16 03:46:25', NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL),
(2, 'hcastillo', 'hcastillo', 'h.castillo@utcadereyta.edu.mx', 'h.castillo@utcadereyta.edu.mx', 1, '2rWsjjhqX5kw/cEFu5hu0kEuqNYAVF7tAWLjLkxTB14', 'dOUhb0fgIgWac/ptVLDgfNYSMUydvu7swiHaYFWMG4cYfaIJzQl359sscYaHJBUrtrljR2uDwGHfaYewcf7AfQ==', '2019-06-22 00:18:20', NULL, NULL, 'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}', '2019-06-22 00:11:45', '2019-06-22 00:18:20', NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL),
(5, 'Adriana.Madrazo', 'adriana.madrazo', 'a.sosa@utcadereyta.edu.mx', 'a.sosa@utcadereyta.edu.mx', 1, 'flpYQJqZ.joLjP00cacmhVGIvqm3DZonfkdC5VKAD6M', '8VT1svUO6qgS/CybMeLvX6f4jVD0a/NT/sfkY/iDd+MX/CpcWGHeIAtZ/gON8OS37aHtRXzqNj+bh2F9RiVXJA==', '2019-07-31 23:07:46', NULL, NULL, 'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}', '2019-06-25 22:57:22', '2019-07-31 23:07:46', NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL),
(6, 'Erick.Gonzalez', 'erick.gonzalez', 'e.gonzalez@utcaderetya.edu.mx', 'e.gonzalez@utcaderetya.edu.mx', 1, 'oBk.T5B2mv73atp8/sYDIm1TkCvbDiGsa0wHM7o8OJo', 'A0iYMDDI5/zYts7paLaVmAfgG8Mm7BKR9Btk+QazjZrdIWm5hItfnKohrq3wbH4+lNh4RXaHyAhJnU4x0vWk+g==', '2019-07-02 21:43:53', NULL, NULL, 'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}', '2019-06-25 22:58:23', '2019-07-02 21:43:53', NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL),
(7, 'Gloria.Aguilar', 'gloria.aguilar', 'g.aguilar@utcadereyta.edu.mx', 'g.aguilar@utcadereyta.edu.mx', 1, 'D4WtyBAqNHdZfklvYi5fHN5Zq8YIk.6NKvDXvNujLfA', '+5VtwiWbE9hojvutRS8Yga2aAzAPCQBCASHDyn0fLmpswwakKTgRQlnVTUuOPkVucfKw3GSH/PYVJvmAruF1Bw==', '2019-07-03 22:28:07', NULL, NULL, 'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}', '2019-06-27 23:07:14', '2019-07-03 22:28:07', NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fos_user_user_group`
--

CREATE TABLE `fos_user_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `correcto` tinyint(1) NOT NULL,
  `archive` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id`, `nombre`, `url`, `correcto`, `archive`) VALUES
(1, 'A', 'NO APLICA', 1, 'A.png'),
(2, 'imagen2a', 'NO APLICA', 0, 'imagen2a.jpg'),
(3, 'img2', 'NO APLICA', 0, 'circulored2.jpg'),
(4, 'img3', 'NO APLICA', 0, 'circulored3.jpg'),
(5, 'img3', 'NO APLICA', 1, 'circulored4.jpg'),
(6, 'img4', 'NO APLICA', 0, 'NINGUNA.jpg'),
(7, 'img2', 'NO APLICA', 1, 'img2.jpg'),
(8, 'img3', 'NO APLICA', 0, 'img3.jpg'),
(9, 'img4', 'NO APLICA', 0, 'img4.jpg'),
(10, 'img5', 'NO APLICA', 0, 'NINGUNA.jpg'),
(11, 'img2', 'NO APLICA', 0, 'vocal2.jpg'),
(12, 'img3', 'NO APLICA', 0, 'vocal3.jpg'),
(13, 'img4', 'NO APLICA', 1, 'vocal4.jpg'),
(14, 'img5', 'NO APLICA', 0, 'NINGUNA.jpg'),
(15, 'img1', 'NO APLICA', 0, 'imagenT2.jpg'),
(16, 'img2', 'NO APLICA', 0, 'imagenT3.jpg'),
(17, 'img3', 'NO APLICA', 1, 'imagenT4.jpg'),
(18, 'img4', 'NO APLICA', 0, 'NINGUNA.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_pregunta`
--

CREATE TABLE `imagen_pregunta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `archive` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `imagen_pregunta`
--

INSERT INTO `imagen_pregunta` (`id`, `nombre`, `url`, `archive`) VALUES
(1, 'B', 'NO APLICA', 'B.png'),
(2, 'imagen 1', 'NO APLICA', 'imagenes de examen.jpg'),
(3, 'globo', 'NO APLICA', 'C:\\xampp\\tmp\\phpF8E2.tmp'),
(4, 'tabla', 'NO APLICA', 'tabla examen.jpg'),
(5, 'ladrillos', 'NO APLICA', 'ladrillo.jpg'),
(6, 'globos', 'NO APLICA', 'globos.jpg'),
(7, 'img1', 'NO APLICA', 'imgenT1.jpg'),
(8, 'img1', 'NO APLICA', 'circulored1.jpg'),
(9, 'img1', 'NO APLICA', 'img1.jpg'),
(10, 'img1', 'NO APLICA', 'vocal1.jpg'),
(11, 'Tabla x,y', 'NO APLICA', 'tabla.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestros`
--

CREATE TABLE `maestros` (
  `id` int(11) NOT NULL,
  `materias_id` int(11) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `turno` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `maestros`
--

INSERT INTO `maestros` (`id`, `materias_id`, `nombre`, `turno`) VALUES
(1, 1, 'Perla Lizeth Vázquez Loredo', 'Matutino'),
(2, 1, 'Francisco Javier Enrique Arce Correa', 'Matutino'),
(3, 1, 'Celeste Elizabeth de la Cerda Denigri', 'Matutino'),
(4, 1, 'Elsa Maragrita Guevara Merino', 'Matutino'),
(5, 1, 'Neri Hernández García', 'Matutino'),
(6, 1, 'Jorge Antonio Cach Pérez', 'Matutino'),
(7, 1, 'Ernesto Salazar Machorro', 'Matutino'),
(8, 2, 'Arely Eunice Cotero Rodríguez', 'Nocturno'),
(9, 2, 'Adriana de Lourdes Sosa Madrazo', 'Matutino'),
(10, 2, 'Marcela Yunuent Guzmán Muñuz', 'Matutino'),
(11, 2, 'Elvia Elisa Balderas Sabanero', 'Matutino'),
(12, 2, 'Juan Zuñiga Moreno', 'Matutino'),
(13, 2, 'Anibal Olguín León', 'Matutino'),
(14, 3, 'Gonzalo Alejandro Cabrera Castillo', 'Matutino'),
(15, 3, 'Arianna Iveth Castillo González', 'Matutino'),
(16, 3, 'Ana Daniela Treviño Ruiz', 'Matutino'),
(17, 3, 'Aracely Anaís Martínez Martínez', 'Matutino'),
(18, 3, 'Arturo Nava Ramírez', 'Matutino'),
(19, 1, 'Erick Arturo González', 'Nocturno'),
(20, 1, 'Adalberta Jiménez Salgado', 'Nocturno'),
(21, 1, 'Jorge Guadalupe González', 'Nocturno'),
(22, 1, 'Jesús Leal Campos', 'Nocturno'),
(23, 1, 'Francisco Javier Enrique Arce Correa', 'Nocturno'),
(24, 1, 'Felipe Ramírez Turrubiartes', 'Nocturno'),
(25, 1, 'Adalberta Jiménez Salgado', 'Nocturno'),
(26, 2, 'Anibal Olguín León', 'Nocturno'),
(27, 2, 'Karina Elizabeth Montoya ', 'Nocturno'),
(28, 2, 'Juan Zuñiga Moreno', 'Nocturno'),
(29, 2, 'Paul Azuara Castillo', 'Nocturno'),
(30, 2, 'Elvia Elisa Balderas', 'Nocturno'),
(31, 2, 'Arely Eunice Cotero Rodríguez', 'Nocturno'),
(32, 3, 'Arturo Nava Ramírez', 'Nocturno'),
(33, 3, 'Aracely Anaís Martínez', 'Nocturno'),
(34, 3, 'Gloria Aguilar Pachecano', 'Nocturno'),
(35, 3, 'Gonzalo Alejandro Cabrera Castillo', 'Nocturno'),
(36, 3, 'Flor Edith Sahagún Sánchez', 'Nocturno'),
(37, 2, 'Lucía Patricia López Cuevas', 'Nocturno'),
(38, 2, 'Víctor Morales Hernández', 'Matutino'),
(39, 2, 'Arely Eunice Cotero Rodríguez', 'Matutino'),
(40, 2, 'Juan Zúñiga Moreno', 'Matutino'),
(41, 3, 'Arturo Nava Ramírez', 'Matutino'),
(42, 2, 'Aníbal Olguín León', 'Matutino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id`, `nombre`) VALUES
(1, 'Comprensión Lectora y Argumentación'),
(2, 'Pensamiento Matematico y Analitico'),
(3, 'Inglés');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL,
  `materias_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `audio_id` int(11) DEFAULT NULL,
  `Escrito` varchar(20000) COLLATE utf8_unicode_ci NOT NULL,
  `nivel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipoPregunta_id` int(11) DEFAULT NULL,
  `Respuestas_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id`, `materias_id`, `video_id`, `audio_id`, `Escrito`, `nivel`, `tipoPregunta_id`, `Respuestas_id`) VALUES
(4, 2, NULL, NULL, '9500 mandarinas fueron envasadas en cajas y vendidas por $475 a razón de $2.5 la caja. ¿Cuántas mandarinas había en cada caja?', '1', 2, 6),
(5, 2, NULL, NULL, 'Una llave que vierte 1000 litros en 1 hora, llena un tanque hasta los 2/3 en una hora. ¿Cuál es la capacidad del tanque?', '1', 2, 7),
(6, 2, NULL, NULL, 'Un almacén anuncia que por liquidación de su mercadería todos los precios tienen el 30% de descuento. Si el precio de la oferta de una pelota es $28 ¿Cuál es el precio normal?', '1', 2, 10),
(7, 3, NULL, NULL, 'When we leave we say', '1', 2, 9),
(8, 2, NULL, NULL, '¿Qué número sigue en la serie 4, 8, 7, 14, 13, 26, 25, 50, … ?', '1', 2, 12),
(9, 3, NULL, NULL, 'When we meet a person for the first time we say', '1', 2, 11),
(11, 3, NULL, NULL, 'If someone says \"Thank you\", you say: \"You\'re ______\"', '1', 2, 15),
(13, 3, NULL, NULL, 'I _____ 24 years old', '1', 2, 16),
(14, 2, NULL, NULL, 'En un examen de admisión, el número de preguntas es 100, la calificación es de 1 punto por respuesta correcta y menos 0,5 puntos por cada respuesta incorrecta.  Rosita ha obtenido 70 puntos y ha respondido todas las preguntas. ¿En cuántas acertó?', '1', 2, 17),
(15, 2, NULL, NULL, '¿Qué es lo primero al último que es necesario para que se realice un partido de fútbol? a)pelota       b)cancha     c)árbitro     d)jugador    e)arco', '1', 2, 18),
(16, 2, NULL, NULL, 'Jorge es mayor que Sandra y ésta es menor que Fidel, Marco es mayor que Jorge y Fidel y éste es menor que Jorge. ¿Cuál de los siguientes enunciados es verdadero?', '1', 2, 19),
(17, 1, NULL, NULL, 'En un equipo de trabajo de 20 desarrolladores de software educativo, la producción es de 30 unidades didácticas al año por cada integrante. Un estudio ha estimado que el rendimiento de cada miembro disminuiría en 1 unidad cada vez que se añadiera un nuevo miembro al equipo. ¿De cuántos miembros debería ser el equipo para maximizar el número total de unidades producidas al año?  <br>	¿A qué se refiere el término producción en el texto?', '1', 2, 20),
(18, 3, NULL, NULL, 'At 9 o\'clock a.m., you say:', '1', 2, 21),
(19, 2, NULL, NULL, 'Cierta clase de microbios tienen la propiedad de duplicar su número en cada día, si después de 9 días un recipiente se encuentra con la mitad de los miembros. ¿En cuántos días se llenará el recipiente?', '1', 2, 22),
(20, 3, NULL, NULL, 'You: Hi Katie, how are you?      Katie: I’m ____, how are you?', '1', 2, 23),
(21, 2, NULL, NULL, 'Una calculadora y un libro costaron $ 72. Si la calculadora costó el triple del libro. ¿Cuánto costó la calculadora?', '1', 2, 24),
(22, 3, NULL, NULL, 'You: Hi, mom, this is John. He is in my history class. Your mom: Hi John.______.to meet you. I’m Lysa', '1', 2, 25),
(23, 2, NULL, NULL, 'Consultados a un grupo de 20 estudiantes sobre los diarios locales que leen se registró la siguiente información: 8 leen el diario El Norte, 7 el diario La verdad y tres los 2 diarios. ¿Cuántos estudiantes leen solo el diario la verdad?', '1', 2, 26),
(24, 3, NULL, NULL, 'Which of the statements expresses a request for permission?   _____', '1', 2, 27),
(25, 2, NULL, NULL, 'Una caja contiene 50 tomates. Si 2 de cada 10 tomates salen dañados. ¿Cuántas cajas se debe comprar si se necesitan 480 tomates?', '1', 2, 28),
(26, 1, NULL, NULL, 'La ley de la gravitación universal propuesta por Newton establece que entre dos cuerpos cualesquiera se produce una fuerza gravitatoria de atracción, proporcional al producto de las masas respectivas y al inverso del cuadrado de la distancia entre los mis', '1', 2, 29),
(27, 3, NULL, NULL, 'Which statement expresses a negative response for permission?', '1', 2, 30),
(28, 2, NULL, NULL, 'En una escuela 7 de cada 100 estudiantes no presentan los deberes. Si en toda la escuela hay 900 niños. ¿Cuántos estudiantes incumplen en la presentación de tareas?', '1', 2, 31),
(29, 3, NULL, NULL, '______ the door, please?', '1', 2, 32),
(30, 1, NULL, NULL, 'La ley de la gravitación universal propuesta por Newton establece que entre dos cuerpos cualesquiera se produce una fuerza gravitatoria de atracción, proporcional al producto de las masas respectivas y al inverso del cuadrado de la distancia entre los mis', '1', 2, 33),
(31, 3, NULL, NULL, 'Question: Can I borrow your pen, please?', '1', 2, 34),
(32, 2, NULL, NULL, 'Cuando E es mayor que C, A es menor que C. Pero B no es nunca mayor que C. Por lo tanto:', '1', 2, 35),
(33, 3, NULL, NULL, 'What object can you find in your pockets?', '1', 2, 36),
(34, 1, NULL, NULL, 'Aviones y automóviles, calefacción, industrias químicas...Para satisfacer sus necesidades de energía, que cada vez son mayores, el hombre explota a un ritmo desenfrenado los yacimientos, que han tardado decenas de millones de años en formarse, se agotarán en unos pocos decenios, ¿Durarán las reservas mundiales 20 años? Es de esperar que nuevos descubrimientos resuelvan milagrosamente la crisis de energía.  <br> ¿Cuál es el tema?:', '1', 2, 37),
(35, 3, NULL, NULL, 'What object can you find in your backpack?', '1', 2, 38),
(36, 2, NULL, NULL, 'Un aserrador para cortar un árbol en dos partes cobra $4. ¿Cuánto cobrará para cortarlo en tres partes?', '1', 2, 39),
(37, 3, NULL, NULL, 'What object can you find in your wallet?', '1', 2, 40),
(38, 1, NULL, NULL, 'Aviones y automóviles, calefacción, industrias químicas...Para satisfacer sus necesidades de energía, que cada vez son mayores, el hombre explota a un ritmo desenfrenado los yacimientos, que han tardado decenas de millones de años en formarse, se agotarán en unos pocos decenios, ¿Durarán las reservas mundiales 20 años? Es de esperar que nuevos descubrimientos resuelvan milagrosamente la crisis de energía.  <br>  ¿Cuál es la idea más importante?:', '1', 2, 41),
(39, 3, NULL, NULL, 'Reading 1: Mexico. <br> One of my favorite vacation places is Mexico. I really like the weather there because it never gets cold. The people are very nice too. They never laugh at my bad Spanish. The food is really good. Mexico City is a very interesting place to visit. It has some great museums and lots of fascinating old buildings. The hotels are too expensive to stay but there are more affordable options. For example, you can stay at one of the beach resorts like Acapulco. If you are planning to visit Mexico, you should definitely see the Mayan temples near Merida.  <br>  Which of these statements is TRUE?', '1', 2, 42),
(40, 2, NULL, NULL, 'Ordenar los datos en forma lógica.  a) comer helado. b) cerrar el congelador. c) sacar el helado del congelador. d) ir al congelador. e) abrir el congelador. f) botar el palo del helado en el basurero.', '1', 2, 43),
(41, 1, NULL, NULL, 'Elige el argumento deductivo según las premisas presentadas. <br> La mayoría de los estudiantes utilizan los medios digitales para estudiar. Ana es estudiante.', '1', 2, 44),
(43, 3, NULL, NULL, 'Reading 1: Mexico. <br> One of my favorite vacation places is Mexico. I really like the weather there because it never gets cold. The people are very nice too. They never laugh at my bad Spanish. The food is really good. Mexico City is a very interesting place to visit. It has some great museums and lots of fascinating old buildings. The hotels are too expensive to stay but there are more affordable options. For example, you can stay at one of the beach resorts like Acapulco. If you are planning to visit Mexico, you should definitely see the Mayan temples near Merida. <br>  Which of these statements is TRUE?', '1', 2, 46),
(44, 1, NULL, NULL, 'Elige el argumento deductivo según las premisas presentadas. <br> Todos los hombres son mortales. Pitágoras es hombre.', '1', 2, 47),
(46, 3, NULL, NULL, 'Reading 1: Mexico. <br> One of my favorite vacation places is Mexico. I really like the weather there because it never gets cold. The people are very nice too. They never laugh at my bad Spanish. The food is really good. Mexico City is a very interesting place to visit. It has some great museums and lots of fascinating old buildings. The hotels are too expensive to stay but there are more affordable options. For example, you can stay at one of the beach resorts like Acapulco. If you are planning to visit Mexico, you should definitely see the Mayan temples near Merida. <br>  Which of these statements is TRUE?', '1', 2, 48),
(47, 3, NULL, NULL, 'Reading 2: The Moon. <br> The Moon is the satellite of the Earth. It is about the quarter size of the Earth. It goes around the Earth approximately in one month. It is about 384,000 kilometers away from the Earth. There is no air or atmosphere around it, so there is no life on the Moon. It has about 13 and a half days daylight and 13 and a half nights of darkness. Temperatures on the Moon is 120 °C during the lunar day and -150 °C during the lunar night. Because there is no air or atmosphere, there is also no sound as the sound waves travel through the air. So, The Moon is very silent. <br> Why there is no life on the Moon?', '1', 2, 49),
(48, 3, NULL, NULL, 'Reading 2: The Moon. <br> The Moon is the satellite of the Earth. It is about the quarter size of the Earth. It goes around the Earth approximately in one month. It is about 384,000 kilometers away from the Earth. There is no air or atmosphere around it, so there is no life on the Moon. It has about 13 and a half days daylight and 13 and a half nights of darkness. Temperatures on the Moon is 120 °C during the lunar day and -150 °C during the lunar night. Because there is no air or atmosphere, there is also no sound as the sound waves travel through the air. So, The Moon is very silent. <br> Which of the followings is INCORRECT?', '1', 2, 50),
(49, 1, NULL, NULL, 'Elige el argumento inductivo según las premisas presentadas. <br> Valente comió pollo, pero le hizo mal. Sofía también comió pollo y le hizo mal.', '1', 2, 51),
(50, 2, NULL, NULL, 'Indique que  número sigue de la siguiente sucesión: 1, 4, 9, 16, 25...', '1', 2, 52),
(51, 1, NULL, NULL, 'Elige el argumento inductivo según las premisas presentadas. <br> En un camión que contiene 300 cajas con mercadería, se encontró una que contenía un florero roto. Al abrir una segunda caja, se encontró un adorno en porcelana roto.', '1', 2, 53),
(53, 2, NULL, NULL, 'Indique que  número sigue en la siguiente sucesión:  5, 7, 4, 8, 3, 9, 2, …', '1', 2, 55),
(54, 2, NULL, NULL, 'Indique que  número sigue en la siguiente sucesión:7, 15, 31, 63, ...', '1', 2, 56),
(55, 1, NULL, NULL, 'Elige el argumento inductivo según las premisas presentadas. <br> El refrigerador se descompuso luego de la carga de alta tensión. La lavadora se descompuso después de la carga de alta tensión.', '1', 2, 58),
(56, 1, NULL, NULL, 'Elige el tipo de proposición presentada: de hecho, de valor, o de política. <br> Los automovilistas deben detenerse cuando los transportes escolares se paren para bajar o subir a los niños.', '1', 2, 59),
(57, 1, NULL, NULL, 'Elige el tipo de proposición presentada: de hecho, de valor, o de política. <br> Es bueno instalar refugios para los animales.', '1', 2, 60),
(58, 1, NULL, NULL, 'Elige el tipo de proposición presentada: de hecho, de valor, o de política. <br> El señor Alanís es culpable de extorsión.', '1', 2, 61),
(59, 2, NULL, NULL, 'Indique que letra sigue en la siguiente sucesión:  A, D, G, K, Ñ, S,..', '1', 2, 62),
(60, 1, NULL, NULL, 'Carlos A., un empresario mexicano, fundó la compañía QRT, la cual inició con una cierta cantidad de millones de pesos. Con el primer contrato duplicó su dinero, si bien tuvo que gastar 100 millones en sobornos y abogados (fue acusado de fraude); con su segundo contrato triplicó el dinero que le quedaba, aunque se gastó 180 millones en la compra de voluntades políticas; con el tercer contrato cuadriplicó el dinero que le había quedado, pero gastó 240 millones para salir de la cárcel. Sabiendo que le quedaron 192 millones ¿con cuántos millones empezó?  <br> El término soborno hace referencia a:', '1', 2, 63),
(61, 1, NULL, NULL, 'Carlos A., un empresario mexicano, fundó la compañía QRT, la cual inició con una cierta cantidad de millones de pesos. Con el primer contrato duplicó su dinero, si bien tuvo que gastar 100 millones en sobornos y abogados (fue acusado de fraude); con su segundo contrato triplicó el dinero que le quedaba, aunque se gastó 180 millones en la compra de voluntades políticas; con el tercer contrato cuadriplicó el dinero que le había quedado, pero gastó 240 millones para salir de la cárcel. Sabiendo que le quedaron 192 millones ¿con cuántos millones empezó?  <br> Cuadriplicar significa:', '1', 2, 64),
(62, 1, NULL, NULL, 'En una muestra de 50 famosas, 35 han recurrido a la mamoplastia, 20 a la rinoplastia y 15 a la liposucción. Se logró averiguar también que 15 se habían practicado mamo y rinoplastia, 12 rinoplastia y liposucción, y 10 liposucción y mamoplastia. Se supo adicionalmente que 8 se habían sometido a las tres intervenciones estéticas. ¿Cuántas de estas famosas no tienen ninguna de las tres intervenciones?  <br> La rinoplastia es la cirugía de:', '1', 2, 65),
(63, 1, NULL, NULL, 'En una muestra de 50 famosas, 35 han recurrido a la mamoplastia, 20 a la rinoplastia y 15 a la liposucción. Se logró averiguar también que 15 se habían practicado mamo y rinoplastia, 12 rinoplastia y liposucción, y 10 liposucción y mamoplastia. Se supo adicionalmente que 8 se habían sometido a las tres intervenciones estéticas. ¿Cuántas de estas famosas no tienen ninguna de las tres intervenciones?  <br>  La liposucción se refiere a:', '1', 2, 66),
(64, 1, NULL, NULL, 'La camioneta del partido XYZ llegó al ejido a repartir despensas. Como sólo eran 6 familias, el candidato rifó los números del 1 al 6. Al 1 le dio la mitad de las despensas menos 1, al 2 la mitad de las restantes menos 1, al 3 la mitad de las que quedaban menos 1, y así hasta que llegó al 6 a quien le dio las 3 despensas que le habían quedado. ¿Cuántas despensas llevó el candidato al ejido y cuántas le tocaron a cada número?  <br> En el texto el término partido hace referencia a:', '1', 2, 67),
(65, 1, NULL, NULL, 'Cada 3 minutos sale un autobús del aeropuerto y le toma 60 minutos llegar al centro de la ciudad. Un carro sale del aeropuerto al mismo tiempo que uno de los autobuses, usa la misma ruta que los autobuses, y le toma 35 minutos llegar al centro de la ciudad. ¿Cuántos autobuses rebasa el carro en su camino al centro de la ciudad, excluyendo al autobús con el que salió?  <br>  En el texto el término excluyendo al autobús hace referencia a:', '1', 2, 68),
(66, 2, NULL, NULL, 'La edad de Juan (x) y la de Pedro (y) se relacionan de la siguiente manera: x = y + 6,    3x - 6 = 7y,  ¿Cuál es la interpretación del modelo anterior?', '1', 2, 69),
(67, 1, NULL, NULL, 'Los Canguros Salt y Arín empezaron a saltar al mismo tiempo, desde el mismo lugar y en la misma dirección, a razón de un salto por segundo. La longitud de cada uno de los saltos de Salt fue 5 m. La longitud del primer salto de Arín fue 1 m, la del segundo fue 2 m, la del tercero fue 3 m y así sucesivamente. ¿Después de cuántos saltos Arín alcanzó a Salt?  <br> La longitud hace referencia al término:', '1', 2, 70),
(68, 3, NULL, NULL, 'A: Nice to meet you Mr. Alvarez. I’m Angela Smith.     B: Nice to meet you, ____', '1', 2, 71),
(69, 3, NULL, NULL, 'These are formal greetings', '1', 2, 73),
(70, 2, NULL, NULL, 'Para la escuela secundaria de una localidad se va a comprar un terreno de forma rectangular con un área de 1,500 m2. Debido a que se tenía prisa, no se anotaron las dimensiones de su ancho y largo; sin embargo, sí se conoció que el largo era el triple de su ancho menos cuatro. <br> ¿Cuál es la ecuación que resuelve este problema?', '1', 2, 72),
(71, 1, NULL, NULL, 'Los Canguros Salt y Arín empezaron a saltar al mismo tiempo, desde el mismo lugar y en la misma dirección, a razón de un salto por segundo. La longitud de cada uno de los saltos de Salt fue 5 m. La longitud del primer salto de Arín fue 1 m, la del segundo fue 2 m, la del tercero fue 3 m y así sucesivamente. ¿Después de cuántos saltos Arín alcanzó a Salt?  <br>  ¿A que ciencia corresponde el concepto de longitud?', '1', 2, 74),
(72, 3, NULL, NULL, 'You say good morning:', '1', 2, 75),
(73, 2, NULL, NULL, 'Juan compra 12 dulces por 30 pesos. Si al día siguiente el precio de cada dulce se incrementó a 6 pesos, cuanto se ahorró Juan por dulce al comprarlos con el precio anterior.', '1', 2, 76),
(74, 3, NULL, NULL, 'Choose a farewell:', '1', 2, 77),
(75, 3, NULL, NULL, 'Choose the incorrect word in the sentence: “What are your name?”', '1', 2, 78),
(76, 2, NULL, NULL, 'Si x&#178;=3 a que es igual x<sup>6</sup>', '1', 2, 79),
(77, 3, NULL, NULL, 'Choose the incorrect word in the sentence: “Hello Anna! Hi are you today?”', '1', 2, 80),
(78, 3, NULL, NULL, 'Choose the word that best completes the sentence: “He comes from _______”.', '1', 2, 81),
(79, 2, NULL, NULL, 'Determina la fórmula que da el termino general en función de n en la siguiente secuencia: 3, 6, 11, 18,... (considera el primer término cuando n=1)', '1', 2, 82),
(81, 2, NULL, NULL, 'Si x es un número par, ¿cuál de las siguientes expresiones resulta número impar?', '1', 2, 83),
(82, 3, NULL, NULL, 'Choose the correct question for the answer provided.   Question: ___________________   Answer: T-O-R-R-E-S', '1', 2, 84),
(83, 3, NULL, NULL, 'Choose the word that best completes the sentence:   “______ me, can you repeat that?', '1', 2, 85),
(84, 2, NULL, NULL, 'La suma de dos números enteros impares consecutivos es 104, determina el impar mayor.', '1', 2, 86),
(85, 3, NULL, NULL, 'Choose the word that best completes the sentence:   “May I _____ your eraser, please?', '1', 2, 87),
(86, 2, NULL, NULL, 'El precio de un traje de caballero es de 3060 pesos una vez que se ha efectuado un descuento del 15 %. ¿Cuál es el precio original del traje?', '1', 2, 88),
(87, 2, NULL, NULL, 'Determina un número mayor a 50 que al dividirlo entre 3 y 5 da residuo 2', '1', 2, 89),
(88, 1, NULL, NULL, 'Un sultán encierra a un prisionero en una celda con dos guardianes, uno que dice siempre la verdad y otro que siempre miente. La celda tiene dos puertas: la de la libertad y la de la esclavitud. La puerta que elija el prisionero para salir de la celda dec', '1', 2, 90),
(89, 1, NULL, NULL, 'En el caso de la escritura, la posibilidad de enviar y recibir información de una forma ágil y práctica, por medio de la Internet o de un teléfono celular, ha provocado que se redacte sin el menor cuidado. Nuestra escritura en estos medios ha llegado a un', '1', 2, 91),
(90, 2, NULL, NULL, '¿Qué número falta en la figura?', '1', 2, 92),
(91, 1, NULL, NULL, 'Tres personas compran una casa por 89.729 €uros. Luego la venden por 92.720 €uros. ¿Qué beneficio ha obtenido cada una de ellas?  Se trata de un negocio de:', '1', 2, 93),
(92, 1, NULL, NULL, 'Tres personas compran una casa por 89.729 €uros. Luego la venden por 92.720 €uros. ¿Qué beneficio ha obtenido cada una de ellas? En el texto utilizan la palabra “beneficio” ¿por cuál de estas la podemos cambiar?', '1', 2, 94),
(93, 1, NULL, NULL, 'Unos pescadores atraparon 63 atunes. Durante el viaje de regreso a tierra se comieron 9 atunes. Cuando llegaron al puerto cada pescador se llevó 18 atunes. ¿Cuántos pescadores eran?  Los señores del problema ¿qué vehículo utilizaron para su trabajo?', '1', 2, 95),
(94, 1, NULL, NULL, 'Unos pescadores atraparon 63 atunes. Durante el viaje de regreso a tierra se comieron 9 atunes. Cuando llegaron al puerto cada pescador se llevó 18 atunes. ¿Cuántos pescadores eran? Con los atunes que llegaron al puerto ¿qué hicieron?', '1', 2, 96),
(95, 2, NULL, NULL, 'Observe la imagen. ¿Cuál es la opción que explica la razón por la que un globo sale proyectado al desinflarse?', '1', 2, 98),
(96, 1, NULL, NULL, 'Un almacenista ha comprado 460 litros de vino a 80 céntimos el litro. Les añade 34 litros de agua y vende la mezcla a 90 céntimos el litro. ¿Cuál es su ganancia? El problema nos habla de “un almacenista” es este caso ¿qué es un almacenista?', '1', 2, 100),
(97, 1, NULL, NULL, 'Un almacenista ha comprado 460 litros de vino a 80 céntimos el litro. Les añade 34 litros de agua y vende la mezcla a 90 céntimos el litro.  Podemos decir que este almacenista es “algo tramposo” ¿Por qué?', '1', 2, 101),
(103, 1, NULL, NULL, 'Una caja de 50 Kg se encuentra sobre el piso se le aplica una fuerza de 30 o de la horizontal mediante una cuerda. ¿Cuál es la magnitud de la fuerza aplicada necesaria para mover la caja?  Interpreta la imagen que identifica el problema:', '1', 2, 108),
(107, 2, NULL, NULL, 'Observe la siguiente imagen.De acuerdo con ella, ¿cuál es el fenómeno químico que se lleva a cabo en el pabilo de la vela al cubrirse con un vaso?', '1', 2, 112),
(108, 2, NULL, NULL, 'Determina el valor que falta en la siguiente tabla:', '1', 2, 113),
(109, 2, NULL, NULL, 'Un niño que ha de multiplicar un número por 40, se olvida de poner cero a la derecha del producto. Ha hallado un producto que se diferencia del verdadero en 900. ¿Cuál es el multiplicando?', '1', 2, 114),
(110, 3, NULL, NULL, 'Choose the word that completes the sentence:  \"___ your hand if you have a question\".', '1', 2, 116),
(111, 3, NULL, NULL, 'Choose the word that completes the sentence: \"___ attention to the teacher\".', '1', 2, 117),
(112, 3, NULL, NULL, 'When people say \"Thank you\", you can say:', '1', 2, 118),
(113, 3, NULL, NULL, 'When people say \"I\'m sorry\", you can say:', '1', 2, 119),
(114, 3, NULL, NULL, 'Choose the sentence that expresses permission:', '1', 2, 120),
(115, 3, NULL, NULL, 'This is way of asking for permission:', '1', 2, 121),
(116, 3, NULL, NULL, 'This is a way of refusing to give permission:', '1', 2, 122),
(117, 2, NULL, NULL, 'Compré 50 libros, vendí 20 en $60 perdiendo $2 en cada uno, y 20 ganando $1 en cada uno. ¿A cómo debe vender los libros restantes para no ganar ni perder?', '1', 2, 123),
(118, 2, NULL, NULL, '¿Cúal es la figura que sigue?', '1', 2, 148),
(119, 2, NULL, NULL, '¿Cuál es la figura que sigue?', '1', 2, 145),
(120, 2, NULL, NULL, '¿Cuál es la figura que sigue?', '1', 2, 146),
(121, 3, NULL, NULL, 'Object used for math operations:', '1', 2, 127),
(122, 3, NULL, NULL, 'Object used to write on the whiteboard:', '1', 2, 128),
(123, 3, NULL, NULL, 'Object used to check the time:', '1', 2, 129),
(124, 3, NULL, NULL, 'Object used to check the date:', '1', 2, 130),
(125, 2, NULL, NULL, '¿Cuál es la figura que sigue?', '1', 2, 147),
(126, 3, NULL, NULL, 'Object used to look for words:', '1', 2, 132),
(127, 3, NULL, NULL, 'Object used to listen to music:', '1', 2, 133),
(128, 3, NULL, NULL, 'Object used to post information:', '1', 2, 134),
(129, 3, NULL, NULL, 'Object used to carry things:', '1', 2, 135),
(130, 2, NULL, NULL, 'Un quinto de la quinta parte de un número es 20. ¿Cuánto será un cuarto de la cuarta parte de dicho número?', '1', 2, 137),
(131, 2, NULL, NULL, 'Si se vendio 2/7 de una tela y luego los 3/8 del resto, ¿Cuánto quedó sin vender?', '1', 2, 138),
(132, 2, NULL, NULL, 'Cada niño de una escuela recibe 10 frutas por semana, pero como se retiran 20 niños ahora cada uno recibe 15 frutas por semana. ¿Cuántos niños eran en total al inicio?', '1', 2, 139),
(133, 2, NULL, NULL, 'Un quinto de la quinta parte de un número es 20. ¿Cuánto será un cuarto de la cuarta parte de dicho número?', '1', 2, 140),
(134, 2, NULL, NULL, 'María tuvo su primer hijo a los 20 años y 5 años después tuvo a su segundo hijo. Si en el 2004 las edades de los tres sumaban 60 años, cuánto suman las cifras del año en que nació María', '1', 2, 141),
(135, 2, NULL, NULL, 'Si A= 3/8  del 0.2 % de 160000      B= 5/6 del 0.3 % de 40000 Halle el 10% de (A + B)', '1', 2, 142);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntasauto_pregunta`
--

CREATE TABLE `preguntasauto_pregunta` (
  `preguntasAuto_id` int(11) NOT NULL,
  `Pregunta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `preguntasauto_pregunta`
--

INSERT INTO `preguntasauto_pregunta` (`preguntasAuto_id`, `Pregunta_id`) VALUES
(1, 4),
(1, 5),
(1, 8),
(1, 16),
(1, 19),
(1, 21),
(1, 25),
(1, 32),
(1, 36),
(1, 50),
(1, 53),
(1, 54),
(1, 59),
(1, 66),
(1, 73),
(1, 76),
(1, 79),
(1, 81),
(1, 86),
(1, 87),
(1, 90),
(1, 108),
(1, 109),
(1, 119),
(1, 120),
(1, 125),
(1, 130),
(1, 132),
(1, 134),
(1, 135),
(2, 17),
(2, 38),
(2, 41),
(2, 44),
(2, 49),
(2, 51),
(2, 55),
(2, 56),
(2, 57),
(2, 60),
(2, 61),
(2, 63),
(2, 64),
(2, 65),
(2, 67),
(2, 71),
(2, 91),
(2, 92),
(2, 96),
(2, 97),
(3, 11),
(3, 13),
(3, 20),
(3, 27),
(3, 31),
(3, 37),
(3, 39),
(3, 43),
(3, 48),
(3, 68),
(3, 69),
(3, 74),
(3, 77),
(3, 82),
(3, 83),
(3, 85),
(3, 111),
(3, 113),
(3, 116),
(3, 128);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntasin_examen`
--

CREATE TABLE `preguntasin_examen` (
  `id` int(11) NOT NULL,
  `examen_id` int(11) DEFAULT NULL,
  `pregunta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `preguntasin_examen`
--

INSERT INTO `preguntasin_examen` (`id`, `examen_id`, `pregunta_id`) VALUES
(1, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas_auto`
--

CREATE TABLE `preguntas_auto` (
  `id` int(11) NOT NULL,
  `materias_id` int(11) DEFAULT NULL,
  `cantidad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nivel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipoPregunta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `preguntas_auto`
--

INSERT INTO `preguntas_auto` (`id`, `materias_id`, `cantidad`, `nivel`, `tipoPregunta_id`) VALUES
(1, 2, '30', '1', 2),
(2, 1, '20', '1', 2),
(3, 3, '20', '1', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta_imagenpregunta`
--

CREATE TABLE `pregunta_imagenpregunta` (
  `pregunta_id` int(11) NOT NULL,
  `imagen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pregunta_imagenpregunta`
--

INSERT INTO `pregunta_imagenpregunta` (`pregunta_id`, `imagen_id`) VALUES
(90, 2),
(95, 6),
(108, 11),
(118, 7),
(119, 8),
(120, 9),
(125, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48),
(49),
(50),
(51),
(52),
(53),
(54),
(55),
(56),
(57),
(58),
(59),
(60),
(61),
(62),
(63),
(64),
(65),
(66),
(67),
(68),
(69),
(70),
(71),
(72),
(73),
(74),
(75),
(76),
(77),
(78),
(79),
(80),
(81),
(82),
(83),
(84),
(85),
(86),
(87),
(88),
(89),
(90),
(91),
(92),
(93),
(94),
(95),
(96),
(97),
(98),
(99),
(100),
(101),
(103),
(105),
(107),
(108),
(109),
(110),
(111),
(112),
(113),
(114),
(115),
(116),
(117),
(118),
(119),
(120),
(121),
(122),
(123),
(124),
(125),
(126),
(127),
(128),
(129),
(130),
(131),
(132),
(133),
(134),
(135),
(136),
(137),
(138),
(139),
(140),
(141),
(142),
(143),
(144),
(145),
(146),
(147),
(148);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas_audio`
--

CREATE TABLE `respuestas_audio` (
  `respuestas_id` int(11) NOT NULL,
  `audio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas_imagen`
--

CREATE TABLE `respuestas_imagen` (
  `respuestas_id` int(11) NOT NULL,
  `imagen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `respuestas_imagen`
--

INSERT INTO `respuestas_imagen` (`respuestas_id`, `imagen_id`) VALUES
(13, 1),
(97, 2),
(145, 3),
(145, 4),
(145, 5),
(145, 6),
(146, 7),
(146, 8),
(146, 9),
(146, 10),
(147, 11),
(147, 12),
(147, 13),
(147, 14),
(148, 15),
(148, 16),
(148, 17),
(148, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas_texto`
--

CREATE TABLE `respuestas_texto` (
  `respuestas_id` int(11) NOT NULL,
  `texto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `respuestas_texto`
--

INSERT INTO `respuestas_texto` (`respuestas_id`, `texto_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(5, 13),
(5, 14),
(5, 15),
(5, 16),
(6, 17),
(6, 18),
(6, 19),
(6, 20),
(7, 21),
(7, 22),
(7, 23),
(7, 24),
(8, 25),
(8, 26),
(8, 27),
(8, 28),
(9, 29),
(9, 30),
(9, 31),
(9, 32),
(10, 33),
(10, 34),
(10, 35),
(10, 36),
(11, 37),
(11, 38),
(11, 39),
(11, 40),
(12, 41),
(12, 42),
(12, 43),
(12, 44),
(14, 45),
(14, 46),
(14, 47),
(14, 48),
(15, 49),
(15, 50),
(15, 51),
(15, 52),
(16, 53),
(16, 54),
(16, 55),
(16, 56),
(17, 57),
(17, 58),
(17, 59),
(17, 60),
(18, 61),
(18, 62),
(18, 63),
(18, 64),
(19, 65),
(19, 66),
(19, 67),
(19, 68),
(20, 69),
(20, 70),
(20, 71),
(20, 72),
(21, 73),
(21, 74),
(21, 75),
(21, 76),
(22, 77),
(22, 78),
(22, 79),
(22, 80),
(23, 89),
(23, 90),
(23, 91),
(23, 92),
(24, 93),
(24, 94),
(24, 95),
(24, 96),
(25, 97),
(25, 98),
(25, 99),
(25, 100),
(26, 101),
(26, 102),
(26, 103),
(26, 104),
(27, 105),
(27, 106),
(27, 107),
(27, 108),
(28, 109),
(28, 110),
(28, 111),
(28, 112),
(29, 113),
(29, 114),
(29, 115),
(29, 116),
(30, 117),
(30, 118),
(30, 119),
(30, 120),
(31, 121),
(31, 122),
(31, 123),
(31, 124),
(32, 125),
(32, 126),
(32, 127),
(32, 128),
(33, 129),
(33, 130),
(33, 131),
(33, 132),
(34, 133),
(34, 134),
(34, 135),
(34, 136),
(35, 137),
(35, 138),
(35, 139),
(35, 140),
(36, 141),
(36, 142),
(36, 143),
(36, 144),
(37, 145),
(37, 146),
(37, 147),
(37, 148),
(38, 149),
(38, 150),
(38, 151),
(38, 152),
(39, 153),
(39, 154),
(39, 155),
(39, 156),
(40, 157),
(40, 158),
(40, 159),
(40, 160),
(41, 161),
(41, 162),
(41, 163),
(41, 164),
(42, 165),
(42, 166),
(42, 167),
(42, 168),
(43, 169),
(43, 170),
(43, 171),
(43, 172),
(44, 173),
(44, 174),
(44, 175),
(44, 176),
(45, 177),
(45, 178),
(45, 179),
(45, 180),
(46, 181),
(46, 182),
(46, 183),
(46, 184),
(47, 185),
(47, 186),
(47, 187),
(47, 188),
(48, 189),
(48, 190),
(48, 191),
(48, 192),
(49, 193),
(49, 194),
(49, 195),
(49, 196),
(50, 197),
(50, 198),
(50, 199),
(50, 200),
(51, 201),
(51, 202),
(51, 203),
(51, 204),
(52, 205),
(52, 206),
(52, 207),
(52, 208),
(53, 209),
(53, 210),
(53, 211),
(53, 212),
(54, 213),
(54, 214),
(54, 215),
(54, 216),
(55, 217),
(55, 218),
(55, 219),
(55, 220),
(56, 221),
(56, 222),
(56, 223),
(56, 224),
(57, 225),
(57, 226),
(57, 227),
(57, 228),
(58, 229),
(58, 230),
(58, 231),
(58, 232),
(59, 233),
(59, 234),
(59, 235),
(59, 236),
(60, 237),
(60, 238),
(60, 239),
(60, 240),
(61, 241),
(61, 242),
(61, 243),
(61, 244),
(62, 245),
(62, 246),
(62, 247),
(62, 248),
(63, 249),
(63, 250),
(63, 251),
(63, 252),
(64, 253),
(64, 254),
(64, 255),
(64, 256),
(65, 257),
(65, 258),
(65, 259),
(65, 260),
(66, 261),
(66, 262),
(66, 263),
(66, 264),
(67, 265),
(67, 266),
(67, 267),
(67, 268),
(68, 269),
(68, 270),
(68, 271),
(68, 272),
(69, 273),
(69, 274),
(69, 275),
(69, 276),
(70, 277),
(70, 278),
(70, 279),
(70, 280),
(71, 281),
(71, 282),
(71, 283),
(71, 284),
(72, 285),
(72, 286),
(72, 287),
(72, 288),
(73, 289),
(73, 290),
(73, 291),
(73, 292),
(74, 293),
(74, 294),
(74, 295),
(74, 296),
(75, 297),
(75, 298),
(75, 299),
(75, 300),
(76, 301),
(76, 302),
(76, 303),
(76, 304),
(77, 305),
(77, 306),
(77, 307),
(77, 308),
(78, 309),
(78, 310),
(78, 311),
(78, 312),
(79, 313),
(79, 314),
(79, 315),
(79, 316),
(80, 317),
(80, 318),
(80, 319),
(80, 320),
(81, 321),
(81, 322),
(81, 323),
(81, 324),
(82, 325),
(82, 326),
(82, 327),
(82, 328),
(83, 329),
(83, 330),
(83, 331),
(83, 332),
(84, 333),
(84, 334),
(84, 335),
(84, 336),
(85, 337),
(85, 338),
(85, 339),
(85, 340),
(86, 341),
(86, 342),
(86, 343),
(86, 344),
(87, 345),
(87, 346),
(87, 347),
(87, 348),
(88, 349),
(88, 350),
(88, 351),
(88, 352),
(89, 353),
(89, 354),
(89, 355),
(89, 356),
(90, 357),
(90, 358),
(90, 359),
(90, 360),
(91, 361),
(91, 362),
(91, 363),
(91, 364),
(92, 365),
(92, 366),
(92, 367),
(92, 368),
(93, 369),
(93, 370),
(93, 371),
(93, 372),
(94, 373),
(94, 374),
(94, 375),
(94, 376),
(95, 377),
(95, 378),
(95, 379),
(95, 380),
(96, 381),
(96, 382),
(96, 383),
(96, 384),
(97, 385),
(98, 386),
(98, 387),
(98, 388),
(98, 389),
(99, 390),
(99, 391),
(99, 392),
(99, 393),
(100, 394),
(100, 395),
(100, 396),
(100, 397),
(101, 398),
(101, 399),
(101, 400),
(101, 401),
(103, 403),
(105, 404),
(107, 405),
(109, 406),
(110, 407),
(111, 408),
(111, 409),
(111, 410),
(111, 411),
(112, 412),
(112, 413),
(112, 414),
(112, 415),
(113, 416),
(113, 417),
(113, 418),
(113, 419),
(114, 420),
(114, 421),
(114, 422),
(114, 423),
(116, 424),
(116, 425),
(116, 426),
(116, 427),
(117, 428),
(117, 429),
(117, 430),
(117, 431),
(118, 432),
(118, 433),
(118, 434),
(118, 435),
(119, 436),
(119, 437),
(119, 438),
(119, 439),
(120, 440),
(120, 441),
(120, 442),
(120, 443),
(121, 444),
(121, 445),
(121, 446),
(121, 447),
(122, 448),
(122, 449),
(122, 450),
(122, 451),
(123, 452),
(123, 453),
(123, 454),
(123, 455),
(127, 456),
(127, 457),
(127, 458),
(127, 459),
(128, 460),
(128, 461),
(128, 462),
(128, 463),
(129, 464),
(129, 465),
(129, 466),
(129, 467),
(130, 468),
(130, 469),
(130, 470),
(130, 471),
(132, 472),
(132, 473),
(132, 474),
(132, 475),
(133, 476),
(133, 477),
(133, 478),
(133, 479),
(134, 480),
(134, 481),
(134, 482),
(134, 483),
(135, 484),
(135, 485),
(135, 486),
(135, 487),
(136, 488),
(137, 489),
(137, 490),
(137, 491),
(137, 492),
(138, 493),
(138, 494),
(138, 495),
(138, 496),
(139, 497),
(139, 498),
(139, 499),
(139, 500),
(140, 501),
(140, 502),
(140, 503),
(140, 504),
(141, 505),
(141, 506),
(141, 507),
(141, 508),
(142, 509),
(142, 510),
(142, 511),
(142, 512),
(143, 513),
(143, 514),
(143, 515),
(143, 516),
(144, 517),
(144, 518),
(144, 519),
(144, 520);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas_video`
--

CREATE TABLE `respuestas_video` (
  `respuestas_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `texto`
--

CREATE TABLE `texto` (
  `id` int(11) NOT NULL,
  `Escrito` varchar(20000) COLLATE utf8_unicode_ci NOT NULL,
  `correcto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `texto`
--

INSERT INTO `texto` (`id`, `Escrito`, `correcto`) VALUES
(1, 'Verdadero', 0),
(2, 'Falso', 1),
(3, 'Verdadero', 0),
(4, 'Falso', 1),
(5, '3', 1),
(6, '5', 0),
(7, '6', 0),
(8, '10', 0),
(9, 'Hello', 1),
(10, 'Goodbye', 0),
(11, 'See you', 0),
(12, 'Now', 0),
(13, '$7', 1),
(14, '$9', 0),
(15, '$8', 0),
(16, '$10', 0),
(17, '50', 1),
(18, '40', 0),
(19, '70', 0),
(20, '30', 0),
(21, '2000 L.', 0),
(22, '3000 L.', 0),
(23, '1500 L.', 1),
(24, '2500 L', 0),
(25, 'Hello', 0),
(26, 'Hi', 0),
(27, 'Goodbye', 0),
(28, 'Welcome', 0),
(29, 'Hellow', 0),
(30, 'Hi', 0),
(31, 'Goodbye', 1),
(32, 'Welcome', 0),
(33, '$750', 0),
(34, '$20', 0),
(35, '$40', 1),
(36, '$670', 0),
(37, 'Pleased', 0),
(38, 'Nice to meet you', 1),
(39, 'Good for you', 0),
(40, 'Good luck', 0),
(41, '100', 0),
(42, '51', 0),
(43, '49', 1),
(44, '110', 0),
(45, '1', 0),
(46, '2', 0),
(47, '3', 1),
(48, '4', 0),
(49, 'Welcome', 1),
(50, 'well', 0),
(51, 'nothing', 0),
(52, 'not welcome', 0),
(53, 'have', 0),
(54, 'am', 1),
(55, 'has', 0),
(56, 'is', 0),
(57, '80', 1),
(58, '75', 0),
(59, '70', 0),
(60, '85', 0),
(61, 'adebc', 0),
(62, 'dabec', 1),
(63, 'aebdc', 0),
(64, 'dcab', 0),
(65, 'Fidel es mayor que Jorge y menor que Sandra.', 0),
(66, 'Jorge es mayor que Sandra y Fidel.', 1),
(67, 'Marco es menor que Jorge y mayor que Fidel.', 0),
(68, 'Sandra es menor que Fidel y Jorge.', 0),
(69, 'A la cantidad de unidades fabricadas.', 1),
(70, 'A la cantidad de unidades rechazadas.', 0),
(71, 'A la cantidad de desarrolladores integrados al equipo.', 0),
(72, 'A la cantidad los miembros que no participaron.', 0),
(73, 'Good evening', 0),
(74, 'Good afternoon', 0),
(75, 'Good morning', 1),
(76, 'See you', 0),
(77, '18 días', 0),
(78, '12 días', 0),
(79, '10 días', 1),
(80, '20 días', 0),
(89, 'good', 1),
(90, 'well done', 0),
(91, 'not very fine', 0),
(92, 'bye', 0),
(93, '$12', 0),
(94, '$24', 0),
(95, '$54', 1),
(96, '$74', 0),
(97, 'nice', 1),
(98, ') it\'s not a pleasure', 0),
(99, 'best', 0),
(100, 'ok', 0),
(101, '4', 1),
(102, '7', 0),
(103, '5', 0),
(104, '8', 0),
(105, 'You can go', 0),
(106, 'Let me go', 0),
(107, 'Do you like it?', 0),
(108, 'May I go, please?', 1),
(109, '10 cajas', 0),
(110, '11 cajas', 0),
(111, '12 cajas', 1),
(112, '13 cajas', 0),
(113, 'Si aumenta, aumenta de forma igual', 0),
(114, 'Si disminuye, disminuye de forma igual', 0),
(115, 'Si se multiplica se multiplica de forma igual', 0),
(116, 'Todas las opciones anteriores', 1),
(117, 'No, it’s ok', 0),
(118, 'No problem', 0),
(119, 'I’m sorry, but you can’t', 1),
(120, 'Sure', 0),
(121, '63 estudiantes', 1),
(122, '70 estudiantes', 0),
(123, '90 estudiantes', 0),
(124, '54 estudiantes', 0),
(125, 'Can I open', 1),
(126, 'Do I can open', 0),
(127, 'Can I to open', 0),
(128, 'Open', 0),
(129, 'Se divide la distancia al cuadrado', 1),
(130, 'Se multiplica la distancia al cuadrado', 0),
(131, 'Se resta la distancia al cuadrado', 0),
(132, 'Ninguno', 0),
(133, 'You’re welcome', 0),
(134, 'Sure', 1),
(135, 'Thanks anyway', 0),
(136, 'Thank you', 0),
(137, 'A nunca es menor que C.', 0),
(138, 'E nunca es mayor que C.', 0),
(139, 'B nunca es mayor que E.', 1),
(140, 'C nunca es menor que A.', 0),
(141, 'a stapler', 0),
(142, 'a wallet', 1),
(143, 'a ruler', 0),
(144, 'a dictionary', 0),
(145, 'La explotación desenfrenada de yacimientos y su crisis', 1),
(146, 'Obtención de las energías Limpias', 0),
(147, 'Formación de yacimientos', 0),
(148, 'De Aviones, automóviles, calefacciones e industrias químicas.', 0),
(149, 'a pencil', 1),
(150, 'a projector', 0),
(151, 'a desk', 0),
(152, 'a clock', 0),
(153, '$4', 0),
(154, '$8', 1),
(155, '$12', 0),
(156, '$18', 0),
(157, 'a chair', 0),
(158, 'headphones', 0),
(159, 'an I.D. card', 1),
(160, 'a binder', 0),
(161, 'Obtención de energías limpias', 0),
(162, 'Crisis de Energía', 1),
(163, 'Formación de Yacimientos', 0),
(164, 'De Aviones, automóviles, calefacciones e industrias químicas', 0),
(165, 'Sam likes warm weather', 1),
(166, 'Sam doesn\'t like warm weather at all', 0),
(167, 'Sam hates warm water', 0),
(168, 'Sam likes cold weather', 0),
(169, 'd, c, b, a, e, f', 0),
(170, 'b, a, c, d, e, f', 0),
(171, 'd, e, c, b, a, f', 1),
(172, 'b, c, a, d, f, e', 0),
(173, 'Ana va a la escuela.', 0),
(174, 'Ana seguramente utiliza los medios digitales para estudiar.', 1),
(175, 'Ana tiene celular.', 0),
(176, 'Ana vive en la era de la tecnología.', 0),
(177, '36', 1),
(178, '49', 0),
(179, '35', 0),
(180, '59', 0),
(181, 'His Spanish is very good', 0),
(182, 'He speaks Spanish very well', 0),
(183, 'He is Spanish', 0),
(184, 'He doesn\'t speak Spanish very well', 1),
(185, 'La mortalidad es una característica.', 0),
(186, 'Todos los hombres van a morir.', 0),
(187, 'La inmortalidad es un deseo natural.', 0),
(188, 'Pitágoras es mortal.', 1),
(189, 'There\'s a lot to see and do in Mexico', 1),
(190, 'There aren\'t a lof of beautiful places in Mexico', 0),
(191, 'Mexico is a dirty place', 0),
(192, 'Tourists never come to Mexico', 0),
(193, 'Because it is so far away', 0),
(194, 'Because it has only 13 days of daylight', 0),
(195, 'Because there is no atmosphere or air', 1),
(196, 'Because there is no sound', 0),
(197, 'The Moon turns around the Earth', 0),
(198, 'The Moon is hotter than the Earth in daytime', 0),
(199, 'The Moon is bigger than the Earth', 1),
(200, 'It takes one month for the Moon to go around the Earth', 0),
(201, 'El pollo es un alimento saludable.', 0),
(202, 'Si comes pollo te caerá mal.', 1),
(203, 'Si el pollo no está sazonado te caerá mal.', 0),
(204, 'Si comes pollo no pasará nada.', 0),
(205, '36', 1),
(206, '49', 0),
(207, '35', 0),
(208, '59', 0),
(209, 'Los camiones trasladan mercaderías.', 0),
(210, 'Las mercaderías salen rotas.', 0),
(211, 'Tal vez todos los objetos estén rotos.', 1),
(212, 'Las mercaderías están en buen estado.', 0),
(213, 'thanks', 0),
(214, 'me', 0),
(215, 'too', 1),
(216, 'you', 0),
(217, '12', 0),
(218, '10', 1),
(219, '14', 0),
(220, '18', 0),
(221, '95', 0),
(222, '127', 1),
(223, '126', 0),
(224, '96', 0),
(225, 'X', 1),
(226, 'Y', 0),
(227, 'w', 0),
(228, 'z', 0),
(229, 'Es probable que continúen averiándose artefactos en el hogar.', 1),
(230, 'La carga de alta tensión cae todos los días.', 0),
(231, 'Los artefactos del hogar reciben cargas de alta tensión.', 0),
(232, 'La compañía de luz manda cargas de alta tensión.', 0),
(233, 'Proposición de hecho.', 0),
(234, 'Proposición de valor.', 0),
(235, 'Proposición de política.', 1),
(236, 'Proposición de hecho y de valor.', 0),
(237, 'Proposición de hecho.', 0),
(238, 'Proposición de valor.', 1),
(239, 'Proposición de política.', 0),
(240, 'Proposición de hecho y de valor.', 0),
(241, 'Proposición de hecho.', 1),
(242, 'Proposición de valor.', 0),
(243, 'Proposición de política.', 0),
(244, 'Proposición de hecho y de valor.', 0),
(245, 'X', 1),
(246, 'Y', 0),
(247, 'W', 0),
(248, 'Z', 0),
(249, 'Dar salario a los trabajadores.', 0),
(250, 'Premiar a los abogados.', 0),
(251, 'Corromper a alguien con dinero.', 1),
(252, 'Castigar económicamente a una persona.', 0),
(253, 'Multiplicar dos veces.', 0),
(254, 'Multiplicar cinco veces.', 0),
(255, 'Multiplicar seis veces.', 0),
(256, 'Multiplicar cuatro veces.', 1),
(257, 'Reducción de grasa corporal o tejido.', 0),
(258, 'Reconstrucción de los senos.', 0),
(259, 'Reconstrucción de la nariz.', 1),
(260, 'Operación de los ojos.', 0),
(261, 'Reducción de grasa corporal o tejido.', 1),
(262, 'Reconstrucción de los senos.', 0),
(263, 'Reconstrucción de la nariz.', 0),
(264, 'Operación de los ojos.', 0),
(265, 'Un juego de futbol.', 0),
(266, 'Un camión dividido a la mitad.', 0),
(267, 'Una organización política.', 1),
(268, 'A despensas divididas.', 0),
(269, 'Integrar al vehículo.', 0),
(270, 'Detener al vehículo.', 0),
(271, 'Quitar al vehículo.', 1),
(272, 'Ignorar al vehículo.', 0),
(273, 'Juan supera por 6 años la edad de Pedro y el triple de la edad de Juan supera en 6 años a 7 veces la edad de Pedro', 1),
(274, 'Juan supera por 6 años la edad de Pedro y al triple de la edad de Juan le faltan 6 años para igualar 7 veces la edad de Pedro', 0),
(275, 'Pedro supera por 6 años la edad de Juan y el triple de la edad de Pedro supera en 6 años a 7 veces la edad de Juan', 0),
(276, 'Pedro supera por 6 años la edad de Juan y al triple de la edad de Pedro le faltan 6 años para igualar 7 veces la edad de Juan', 0),
(277, 'Distancia.', 1),
(278, 'Tiempo.', 0),
(279, 'Peso.', 0),
(280, 'Volumen.', 0),
(281, 'thanks', 0),
(282, 'me', 0),
(283, 'too', 1),
(284, 'you', 0),
(285, '3x - 1504 = 0', 0),
(286, '4x - 1504 = 0', 0),
(287, '3x2 - 4x -1500 = 0', 1),
(288, '3x2 - 4x + 1500 = 0', 0),
(289, 'Bye/Goodbye', 0),
(290, 'See you/Bye', 0),
(291, 'Hello/Goodbye', 0),
(292, 'Hello/Good morning', 1),
(293, 'Psicología', 0),
(294, 'Física', 1),
(295, 'Pedagogía', 0),
(296, 'Didáctica', 0),
(297, 'At 3 pm', 0),
(298, 'At 5 pm', 0),
(299, 'At 9 am', 1),
(300, 'At 10 pm', 0),
(301, '2 pesos', 0),
(302, '2.5 pesos', 0),
(303, '3 pesos', 0),
(304, '3.5 pesos', 1),
(305, 'Hi', 0),
(306, 'See you later', 1),
(307, 'How are you?', 0),
(308, 'Fine', 0),
(309, 'What', 0),
(310, 'are', 1),
(311, 'your', 0),
(312, 'name', 0),
(313, '3', 0),
(314, '6', 0),
(315, '9', 0),
(316, '27', 1),
(317, 'Hello', 0),
(318, 'Hi', 1),
(319, 'are', 0),
(320, 'Today', 0),
(321, 'morning', 0),
(322, 'classroom', 0),
(323, 'Mexican', 0),
(324, 'Brazil', 1),
(325, '2n', 0),
(326, '2n+1', 0),
(327, 'n2+1', 0),
(328, 'n2+2', 1),
(329, 'x - 4', 0),
(330, 'x + 4', 0),
(331, 'x (x - 1)', 0),
(332, 'x + 1', 1),
(333, 'How are you?', 0),
(334, 'Who are you?', 0),
(335, 'How do you spell your last name?', 1),
(336, 'Are you ok?', 0),
(337, 'Hi', 0),
(338, 'What', 0),
(339, 'Is', 0),
(340, 'Excuse', 1),
(341, '41', 0),
(342, '53', 1),
(343, '51', 0),
(344, '55', 0),
(345, 'borrow', 1),
(346, 'can', 0),
(347, 'play', 0),
(348, 'is', 0),
(349, '2601', 0),
(350, '3519', 0),
(351, '3600', 1),
(352, '3825', 0),
(353, '15', 0),
(354, '107', 1),
(355, '75', 0),
(356, '93', 0),
(357, 'Guardia.', 0),
(358, 'Juez.', 0),
(359, 'Militar.', 0),
(360, 'Gobernador.', 1),
(361, 'La resolución de problemas.', 0),
(362, 'La escritura.', 1),
(363, 'La lectura.', 0),
(364, 'Los profesores.', 0),
(365, '8', 0),
(366, '10', 0),
(367, '12', 1),
(368, 'Ninguna', 0),
(369, 'Compra y venta de coches.', 0),
(370, 'Ganar dinero.', 0),
(371, 'Compra y venta de viviendas.', 1),
(372, 'Unión de socios.', 0),
(373, 'Pérdida.', 0),
(374, 'Benefactor.', 0),
(375, 'Perjuicio.', 0),
(376, 'Ganancia.', 1),
(377, 'Un camión.', 0),
(378, 'Una moto.', 0),
(379, 'Un coche.', 0),
(380, 'Un barco.', 1),
(381, 'Los vendieron.', 0),
(382, 'El patrón se los llevó todos.', 0),
(383, 'Los repartieron en partes iguales entre los pescadores que iban.', 1),
(384, 'Se los comieron en el puerto.', 0),
(385, 'Ninguna', 0),
(386, 'La fuerza con que sale proyectado el globo es inversamente proporcional a la fuerza con que sale el aire', 0),
(387, 'Al salir el aire, el globo permanece en movimiento hasta que una fuerza no modifique dicho movimiento', 0),
(388, 'La fuerza ejercida al salir el aire es igual a la fuerza con que sale proyectado el globo en sentido opuesto', 1),
(389, 'Al salir el aire, el globo sale proyectado con una aceleración proporcional al contenido de su masa', 0),
(390, 'Se agota el combustible al cubrirse con el vaso, por lo tanto, se apaga', 0),
(391, 'El monóxido de carbono retenido apaga el fuego', 0),
(392, 'El vapor de agua liberado apaga el pabilo de la vela', 1),
(393, 'Se agota el comburente al cubrirse con el vaso, por lo tanto, se apaga', 0),
(394, 'Un señor que tiene un café-bar.', 0),
(395, 'Un señor que vende vino.', 0),
(396, 'Un señor que compra y vende vino.', 1),
(397, 'Un señor que le gusta beber vino.', 0),
(398, 'Le gusta hacer trampa con los naipes.', 0),
(399, 'Le pone agua al vino.', 1),
(400, 'Gana dinero con la compra-venta.', 0),
(401, 'Mezcla más vino que agua.', 0),
(402, 'Ninguna', 0),
(403, 'Ninguna', 0),
(404, 'Ninguna', 0),
(405, 'Ninguna', 0),
(406, 'Ninguna', 0),
(407, 'Ninguna', 0),
(408, 'La fuerza con que sale proyectado el globo es inversamente proporcional a la fuerza con que sale el aire .', 0),
(409, 'Al salir el aire, el globo permanece en movimiento hasta que una fuerza no modifique dicho movimiento .', 0),
(410, 'La fuerza ejercida al salir el aire es igual a la fuerza con que sale proyectado el globo en sentido opuesto .', 1),
(411, 'Al salir el aire, el globo sale proyectado con una aceleración proporcional al contenido de su masa.', 0),
(412, 'Se agota el combustible al cubrirse con el vaso, por lo tanto, se apaga', 0),
(413, 'El monóxido de carbono retenido apaga el fuego', 0),
(414, 'El vapor de agua liberado apaga el pabilo de la vela', 0),
(415, 'El vapor de agua liberado apaga el pábilo de la vela', 1),
(416, '8', 0),
(417, '9', 1),
(418, '10', 0),
(419, '11', 0),
(420, '25', 1),
(421, '30', 0),
(422, '35', 0),
(423, '40', 0),
(424, 'Write', 0),
(425, 'Stop', 0),
(426, 'Stand', 0),
(427, 'Raise', 1),
(428, 'Pay', 1),
(429, 'Listen', 0),
(430, 'Work', 0),
(431, 'Check', 0),
(432, 'I\'m sorry', 0),
(433, 'You\'re welcome', 1),
(434, 'I don\'t know', 0),
(435, 'Hello', 0),
(436, 'Bye', 0),
(437, 'That\'s ok', 1),
(438, 'Thanks', 0),
(439, 'See you', 0),
(440, 'Sure, go ahead', 1),
(441, 'Not right now', 0),
(442, 'I\'m sorry', 0),
(443, 'Please', 0),
(444, 'What\'s your name?', 0),
(445, 'What\'s the word for this?', 0),
(446, 'How do you spell that?', 0),
(447, 'May I go out, please?', 1),
(448, 'Please feel free', 0),
(449, 'Can I come in?', 0),
(450, 'I\'m sorry, but that\'s not possible', 1),
(451, 'Here  you go', 0),
(452, '$ 7', 1),
(453, '$ 9', 0),
(454, '$ 8', 0),
(455, '$ 10', 0),
(456, 'speakers', 0),
(457, 'a calculator', 1),
(458, 'a marker', 0),
(459, 'an eraser', 0),
(460, 'a marker', 1),
(461, 'a pencil', 0),
(462, 'a highlighter', 0),
(463, 'a pen', 0),
(464, 'a poster', 0),
(465, 'a bulletin board', 0),
(466, 'a wallet', 0),
(467, 'a clock', 1),
(468, 'a book', 0),
(469, 'a whiteboard', 0),
(470, 'a calendar', 1),
(471, 'a calculator', 0),
(472, 'a dictionary', 1),
(473, 'a binder', 0),
(474, 'a wallet', 0),
(475, 'a projector', 0),
(476, 'a folder', 0),
(477, 'a backpack', 0),
(478, 'speakers', 1),
(479, 'a stapler', 0),
(480, 'a clock', 0),
(481, 'a pen', 0),
(482, 'a highlighter', 0),
(483, 'a bulletin board', 1),
(484, 'a binder', 0),
(485, 'a table', 0),
(486, 'a backpack', 1),
(487, 'a locker', 0),
(488, '125/4', 1),
(489, '125/4', 1),
(490, '115/4', 0),
(491, '105/4', 0),
(492, '135/4', 0),
(493, '25/55', 0),
(494, '15/56', 0),
(495, '19/56', 1),
(496, '13/56', 0),
(497, '50', 0),
(498, '60', 1),
(499, '70', 0),
(500, '80', 0),
(501, '120/4', 0),
(502, '130/4', 0),
(503, '135/4', 0),
(504, '125/4', 1),
(505, '20', 0),
(506, '27', 0),
(507, '30', 0),
(508, '25', 1),
(509, '25', 0),
(510, '22', 1),
(511, '18', 0),
(512, '15', 0),
(513, '28', 0),
(514, '25', 0),
(515, '32', 1),
(516, '30', 0),
(517, '4', 0),
(518, '7', 0),
(519, '5', 1),
(520, '6', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pregunta`
--

CREATE TABLE `tipo_pregunta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_pregunta`
--

INSERT INTO `tipo_pregunta` (`id`, `nombre`) VALUES
(1, 'Falso y Verdadero'),
(2, 'Opción Múltiple');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `correcto` tinyint(1) NOT NULL,
  `archive` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_pregunta`
--

CREATE TABLE `video_pregunta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `archive` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acl_classes`
--
ALTER TABLE `acl_classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_69DD750638A36066` (`class_type`);

--
-- Indices de la tabla `acl_entries`
--
ALTER TABLE `acl_entries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_46C8B806EA000B103D9AB4A64DEF17BCE4289BF4` (`class_id`,`object_identity_id`,`field_name`,`ace_order`),
  ADD KEY `IDX_46C8B806EA000B103D9AB4A6DF9183C9` (`class_id`,`object_identity_id`,`security_identity_id`),
  ADD KEY `IDX_46C8B806EA000B10` (`class_id`),
  ADD KEY `IDX_46C8B8063D9AB4A6` (`object_identity_id`),
  ADD KEY `IDX_46C8B806DF9183C9` (`security_identity_id`);

--
-- Indices de la tabla `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9407E5494B12AD6EA000B10` (`object_identifier`,`class_id`),
  ADD KEY `IDX_9407E54977FA751A` (`parent_object_identity_id`);

--
-- Indices de la tabla `acl_object_identity_ancestors`
--
ALTER TABLE `acl_object_identity_ancestors`
  ADD PRIMARY KEY (`object_identity_id`,`ancestor_id`),
  ADD KEY `IDX_825DE2993D9AB4A6` (`object_identity_id`),
  ADD KEY `IDX_825DE299C671CEA1` (`ancestor_id`);

--
-- Indices de la tabla `acl_security_identities`
--
ALTER TABLE `acl_security_identities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8835EE78772E836AF85E0677` (`identifier`,`username`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_uniq` (`username`),
  ADD KEY `IDX_5EC5A6AB5C8659A` (`examen_id`),
  ADD KEY `IDX_5EC5A6AB17BC3758` (`examenAuto_id`);

--
-- Indices de la tabla `alumnos_en_examen`
--
ALTER TABLE `alumnos_en_examen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CAB9A5395C8659A` (`examen_id`),
  ADD KEY `IDX_CAB9A539FC28E5EE` (`alumno_id`);

--
-- Indices de la tabla `alumnos_maestros`
--
ALTER TABLE `alumnos_maestros`
  ADD PRIMARY KEY (`alumnos_id`,`maestros_id`),
  ADD KEY `IDX_F1B59B4EA03F5ABF` (`alumnos_id`),
  ADD KEY `IDX_F1B59B4E5FECFC3B` (`maestros_id`);

--
-- Indices de la tabla `audio`
--
ALTER TABLE `audio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `audio_pregunta`
--
ALTER TABLE `audio_pregunta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_514C8FECA76ED395` (`user_id`);

--
-- Indices de la tabla `examenauto_preguntasauto`
--
ALTER TABLE `examenauto_preguntasauto`
  ADD PRIMARY KEY (`examenAuto_id`,`PreguntasAuto_id`),
  ADD KEY `IDX_8938B8B617BC3758` (`examenAuto_id`),
  ADD KEY `IDX_8938B8B6966CE725` (`PreguntasAuto_id`);

--
-- Indices de la tabla `examen_auto`
--
ALTER TABLE `examen_auto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B9A1C1E3A76ED395` (`user_id`);

--
-- Indices de la tabla `fos_user_group`
--
ALTER TABLE `fos_user_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_583D1F3E5E237E06` (`name`);

--
-- Indices de la tabla `fos_user_user`
--
ALTER TABLE `fos_user_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C560D76192FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_C560D761A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_C560D761C05FB297` (`confirmation_token`);

--
-- Indices de la tabla `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `IDX_B3C77447A76ED395` (`user_id`),
  ADD KEY `IDX_B3C77447FE54D947` (`group_id`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `imagen_pregunta`
--
ALTER TABLE `imagen_pregunta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `maestros`
--
ALTER TABLE `maestros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7D07F5BFEB72EBA6` (`materias_id`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_AEE0E1F76C0E8E43` (`Respuestas_id`),
  ADD KEY `IDX_AEE0E1F7EB72EBA6` (`materias_id`),
  ADD KEY `IDX_AEE0E1F745F4FD99` (`tipoPregunta_id`),
  ADD KEY `IDX_AEE0E1F729C1004E` (`video_id`),
  ADD KEY `IDX_AEE0E1F73A3123C7` (`audio_id`);

--
-- Indices de la tabla `preguntasauto_pregunta`
--
ALTER TABLE `preguntasauto_pregunta`
  ADD PRIMARY KEY (`preguntasAuto_id`,`Pregunta_id`),
  ADD KEY `IDX_FE4FBF7D81539C58` (`preguntasAuto_id`),
  ADD KEY `IDX_FE4FBF7DB7390FC9` (`Pregunta_id`);

--
-- Indices de la tabla `preguntasin_examen`
--
ALTER TABLE `preguntasin_examen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B5DFEB905C8659A` (`examen_id`),
  ADD KEY `IDX_B5DFEB9031A5801E` (`pregunta_id`);

--
-- Indices de la tabla `preguntas_auto`
--
ALTER TABLE `preguntas_auto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D9738AACEB72EBA6` (`materias_id`),
  ADD KEY `IDX_D9738AAC45F4FD99` (`tipoPregunta_id`);

--
-- Indices de la tabla `pregunta_imagenpregunta`
--
ALTER TABLE `pregunta_imagenpregunta`
  ADD PRIMARY KEY (`pregunta_id`,`imagen_id`),
  ADD KEY `IDX_8CF1CCA831A5801E` (`pregunta_id`),
  ADD KEY `IDX_8CF1CCA8763C8AA7` (`imagen_id`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `respuestas_audio`
--
ALTER TABLE `respuestas_audio`
  ADD PRIMARY KEY (`respuestas_id`,`audio_id`),
  ADD KEY `IDX_2623BDB8DF70C5B6` (`respuestas_id`),
  ADD KEY `IDX_2623BDB83A3123C7` (`audio_id`);

--
-- Indices de la tabla `respuestas_imagen`
--
ALTER TABLE `respuestas_imagen`
  ADD PRIMARY KEY (`respuestas_id`,`imagen_id`),
  ADD KEY `IDX_C6F8D04DDF70C5B6` (`respuestas_id`),
  ADD KEY `IDX_C6F8D04D763C8AA7` (`imagen_id`);

--
-- Indices de la tabla `respuestas_texto`
--
ALTER TABLE `respuestas_texto`
  ADD PRIMARY KEY (`respuestas_id`,`texto_id`),
  ADD KEY `IDX_346AC4DDDF70C5B6` (`respuestas_id`),
  ADD KEY `IDX_346AC4DD85D01195` (`texto_id`);

--
-- Indices de la tabla `respuestas_video`
--
ALTER TABLE `respuestas_video`
  ADD PRIMARY KEY (`respuestas_id`,`video_id`),
  ADD KEY `IDX_42995101DF70C5B6` (`respuestas_id`),
  ADD KEY `IDX_4299510129C1004E` (`video_id`);

--
-- Indices de la tabla `texto`
--
ALTER TABLE `texto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_pregunta`
--
ALTER TABLE `tipo_pregunta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `video_pregunta`
--
ALTER TABLE `video_pregunta`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acl_classes`
--
ALTER TABLE `acl_classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `acl_entries`
--
ALTER TABLE `acl_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `acl_security_identities`
--
ALTER TABLE `acl_security_identities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=606;

--
-- AUTO_INCREMENT de la tabla `alumnos_en_examen`
--
ALTER TABLE `alumnos_en_examen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `audio`
--
ALTER TABLE `audio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `audio_pregunta`
--
ALTER TABLE `audio_pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `examen_auto`
--
ALTER TABLE `examen_auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fos_user_group`
--
ALTER TABLE `fos_user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fos_user_user`
--
ALTER TABLE `fos_user_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `imagen_pregunta`
--
ALTER TABLE `imagen_pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `maestros`
--
ALTER TABLE `maestros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT de la tabla `preguntasin_examen`
--
ALTER TABLE `preguntasin_examen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `preguntas_auto`
--
ALTER TABLE `preguntas_auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT de la tabla `texto`
--
ALTER TABLE `texto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=521;

--
-- AUTO_INCREMENT de la tabla `tipo_pregunta`
--
ALTER TABLE `tipo_pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `video_pregunta`
--
ALTER TABLE `video_pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acl_entries`
--
ALTER TABLE `acl_entries`
  ADD CONSTRAINT `FK_46C8B8063D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_46C8B806DF9183C9` FOREIGN KEY (`security_identity_id`) REFERENCES `acl_security_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_46C8B806EA000B10` FOREIGN KEY (`class_id`) REFERENCES `acl_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
  ADD CONSTRAINT `FK_9407E54977FA751A` FOREIGN KEY (`parent_object_identity_id`) REFERENCES `acl_object_identities` (`id`);

--
-- Filtros para la tabla `acl_object_identity_ancestors`
--
ALTER TABLE `acl_object_identity_ancestors`
  ADD CONSTRAINT `FK_825DE2993D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_825DE299C671CEA1` FOREIGN KEY (`ancestor_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `FK_5EC5A6AB17BC3758` FOREIGN KEY (`examenAuto_id`) REFERENCES `examen_auto` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_5EC5A6AB5C8659A` FOREIGN KEY (`examen_id`) REFERENCES `examen` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `alumnos_en_examen`
--
ALTER TABLE `alumnos_en_examen`
  ADD CONSTRAINT `FK_CAB9A5395C8659A` FOREIGN KEY (`examen_id`) REFERENCES `examen` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_CAB9A539FC28E5EE` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `alumnos_maestros`
--
ALTER TABLE `alumnos_maestros`
  ADD CONSTRAINT `FK_F1B59B4E5FECFC3B` FOREIGN KEY (`maestros_id`) REFERENCES `maestros` (`id`),
  ADD CONSTRAINT `FK_F1B59B4EA03F5ABF` FOREIGN KEY (`alumnos_id`) REFERENCES `alumnos` (`id`);

--
-- Filtros para la tabla `examen`
--
ALTER TABLE `examen`
  ADD CONSTRAINT `FK_514C8FECA76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_user` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `examenauto_preguntasauto`
--
ALTER TABLE `examenauto_preguntasauto`
  ADD CONSTRAINT `FK_8938B8B617BC3758` FOREIGN KEY (`examenAuto_id`) REFERENCES `examen_auto` (`id`),
  ADD CONSTRAINT `FK_8938B8B6966CE725` FOREIGN KEY (`PreguntasAuto_id`) REFERENCES `preguntas_auto` (`id`);

--
-- Filtros para la tabla `examen_auto`
--
ALTER TABLE `examen_auto`
  ADD CONSTRAINT `FK_B9A1C1E3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_user` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
  ADD CONSTRAINT `FK_B3C77447A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B3C77447FE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_user_group` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `maestros`
--
ALTER TABLE `maestros`
  ADD CONSTRAINT `FK_7D07F5BFEB72EBA6` FOREIGN KEY (`materias_id`) REFERENCES `materias` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `FK_AEE0E1F729C1004E` FOREIGN KEY (`video_id`) REFERENCES `video_pregunta` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_AEE0E1F73A3123C7` FOREIGN KEY (`audio_id`) REFERENCES `audio_pregunta` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_AEE0E1F745F4FD99` FOREIGN KEY (`tipoPregunta_id`) REFERENCES `tipo_pregunta` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_AEE0E1F76C0E8E43` FOREIGN KEY (`Respuestas_id`) REFERENCES `respuestas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_AEE0E1F7EB72EBA6` FOREIGN KEY (`materias_id`) REFERENCES `materias` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `preguntasauto_pregunta`
--
ALTER TABLE `preguntasauto_pregunta`
  ADD CONSTRAINT `FK_FE4FBF7D81539C58` FOREIGN KEY (`preguntasAuto_id`) REFERENCES `preguntas_auto` (`id`),
  ADD CONSTRAINT `FK_FE4FBF7DB7390FC9` FOREIGN KEY (`Pregunta_id`) REFERENCES `pregunta` (`id`);

--
-- Filtros para la tabla `preguntasin_examen`
--
ALTER TABLE `preguntasin_examen`
  ADD CONSTRAINT `FK_B5DFEB9031A5801E` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_B5DFEB905C8659A` FOREIGN KEY (`examen_id`) REFERENCES `examen` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `preguntas_auto`
--
ALTER TABLE `preguntas_auto`
  ADD CONSTRAINT `FK_D9738AAC45F4FD99` FOREIGN KEY (`tipoPregunta_id`) REFERENCES `tipo_pregunta` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_D9738AACEB72EBA6` FOREIGN KEY (`materias_id`) REFERENCES `materias` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `pregunta_imagenpregunta`
--
ALTER TABLE `pregunta_imagenpregunta`
  ADD CONSTRAINT `FK_8CF1CCA831A5801E` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`),
  ADD CONSTRAINT `FK_8CF1CCA8763C8AA7` FOREIGN KEY (`imagen_id`) REFERENCES `imagen_pregunta` (`id`);

--
-- Filtros para la tabla `respuestas_audio`
--
ALTER TABLE `respuestas_audio`
  ADD CONSTRAINT `FK_2623BDB83A3123C7` FOREIGN KEY (`audio_id`) REFERENCES `audio` (`id`),
  ADD CONSTRAINT `FK_2623BDB8DF70C5B6` FOREIGN KEY (`respuestas_id`) REFERENCES `respuestas` (`id`);

--
-- Filtros para la tabla `respuestas_imagen`
--
ALTER TABLE `respuestas_imagen`
  ADD CONSTRAINT `FK_C6F8D04D763C8AA7` FOREIGN KEY (`imagen_id`) REFERENCES `imagen` (`id`),
  ADD CONSTRAINT `FK_C6F8D04DDF70C5B6` FOREIGN KEY (`respuestas_id`) REFERENCES `respuestas` (`id`);

--
-- Filtros para la tabla `respuestas_texto`
--
ALTER TABLE `respuestas_texto`
  ADD CONSTRAINT `FK_346AC4DD85D01195` FOREIGN KEY (`texto_id`) REFERENCES `texto` (`id`),
  ADD CONSTRAINT `FK_346AC4DDDF70C5B6` FOREIGN KEY (`respuestas_id`) REFERENCES `respuestas` (`id`);

--
-- Filtros para la tabla `respuestas_video`
--
ALTER TABLE `respuestas_video`
  ADD CONSTRAINT `FK_4299510129C1004E` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`),
  ADD CONSTRAINT `FK_42995101DF70C5B6` FOREIGN KEY (`respuestas_id`) REFERENCES `respuestas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
