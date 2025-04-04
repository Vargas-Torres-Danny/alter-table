-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-04-2025 a las 19:06:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `basedatosejemplo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `a`
--

CREATE TABLE `a` (
  `codA` varchar(10) NOT NULL,
  `nomA` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `a`
--

INSERT INTO `a` (`codA`, `nomA`) VALUES
('A1', 'Juan'),
('A2', 'Pedro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `b`
--

CREATE TABLE `b` (
  `codB` varchar(10) NOT NULL,
  `nomB` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `b`
--

INSERT INTO `b` (`codB`, `nomB`) VALUES
('B1', 'Carnet1'),
('B2', 'Carnet2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tab`
--

CREATE TABLE `tab` (
  `codA` varchar(10) NOT NULL,
  `codB` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tab`
--

INSERT INTO `tab` (`codA`, `codB`) VALUES
('A1', 'B1'),
('A2', 'B2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `a`
--
ALTER TABLE `a`
  ADD PRIMARY KEY (`codA`);

--
-- Indices de la tabla `b`
--
ALTER TABLE `b`
  ADD PRIMARY KEY (`codB`);

--
-- Indices de la tabla `tab`
--
ALTER TABLE `tab`
  ADD PRIMARY KEY (`codA`,`codB`),
  ADD KEY `codB` (`codB`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tab`
--
ALTER TABLE `tab`
  ADD CONSTRAINT `tab_ibfk_1` FOREIGN KEY (`codA`) REFERENCES `a` (`codA`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tab_ibfk_2` FOREIGN KEY (`codB`) REFERENCES `b` (`codB`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
