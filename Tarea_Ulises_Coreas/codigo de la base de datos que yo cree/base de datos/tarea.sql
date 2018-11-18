-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-11-2018 a las 04:52:34
-- Versión del servidor: 5.7.23
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tarea`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `Cod_cliente` int(10) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(40) NOT NULL,
  `Tel` varchar(9) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Correo` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Cod_cliente`, `Nombre`, `Apellido`, `Tel`, `Direccion`, `Correo`) VALUES
(1, 'Carlos', 'Hernandez', '74213456', 'san miguel', 'edgar8888@hotmail.com'),
(2, 'Juan', 'Ramirez', '76430029', 'Usulutan', 'juaR09@gmail.com'),
(3, 'Jose', 'Coreas', '70532039', 'Santa Elena', 'joseC12@gmail.com'),
(4, 'Karla', 'Duran', '70039232', 'Union', 'Kaarla9@hotmail.com'),
(5, 'Marcela', 'Torrez', '610293222', 'Jiquilisco', 'marcelat.2@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

DROP TABLE IF EXISTS `cotizacion`;
CREATE TABLE IF NOT EXISTS `cotizacion` (
  `Cod_cotizacion` int(10) NOT NULL,
  `Cod_producto` int(10) NOT NULL,
  `Cod_cliente` int(10) NOT NULL,
  `Fecha_cotizado` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cotizacion`
--

INSERT INTO `cotizacion` (`Cod_cotizacion`, `Cod_producto`, `Cod_cliente`, `Fecha_cotizado`) VALUES
(223, 203, 1, '2018-11-16 13:40:15.000000'),
(423, 223, 2, '2018-11-16 15:50:35.000000'),
(12, 11, 3, '2018-11-16 15:55:05.000000'),
(55, 102, 4, '2018-11-16 17:55:05.000000'),
(10, 23, 5, '2018-11-16 20:55:05.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `Cod_producto` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Cod_producto`, `nombre`, `precio`) VALUES
(102, 'salsa de tomate', 0.5),
(11, 'lb. papas', 0.65),
(5, 'lb. manzana', 0.8),
(203, 'melon', 1.5),
(223, 'sandia', 2.1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `Cod_venta` int(11) NOT NULL,
  `Cod_producto` varchar(8) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Fecha_venta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Cod_cliente` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`Cod_venta`, `Cod_producto`, `Cantidad`, `Fecha_venta`, `Cod_cliente`) VALUES
(211, '102', 4, '2018-10-09 08:40:04', 2),
(121, '223', 2, '2018-10-09 09:35:34', 4),
(23, '11', 4, '2018-10-09 11:55:40', 1),
(11, '5', 4, '2018-10-09 14:35:41', 3),
(23, '203', 2, '2018-10-09 15:35:41', 5);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
