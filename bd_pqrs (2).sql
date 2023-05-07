-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-05-2023 a las 04:57:42
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_pqrs`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anexos`
--

CREATE TABLE `anexos` (
  `anexo` varchar(12) NOT NULL,
  `id_anexo` decimal(7,0) NOT NULL,
  `pqrs_radicado` decimal(10,0) NOT NULL,
  `respuesta_id_rta` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `id_area` decimal(6,0) NOT NULL,
  `nombre` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `título` varchar(10) DEFAULT NULL,
  `descripcion` varchar(30) DEFAULT NULL,
  `id_estado` decimal(6,0) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pqrs`
--

CREATE TABLE `pqrs` (
  `radicado` decimal(10,0) NOT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `usuario_codigo` decimal(10,0) NOT NULL,
  `prioridad_id_prioridad` decimal(6,0) NOT NULL,
  `area_id_area` decimal(6,0) NOT NULL,
  `estado_id_estado` decimal(6,0) NOT NULL,
  `tipo_id_tipo` decimal(5,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prioridad`
--

CREATE TABLE `prioridad` (
  `id_prioridad` decimal(6,0) NOT NULL,
  `prioridad` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `id_rta` decimal(10,0) NOT NULL,
  `txt_rta` varchar(100) DEFAULT NULL,
  `calificacion` decimal(1,0) DEFAULT NULL,
  `usuario_codigo` decimal(10,0) NOT NULL,
  `pqrs_radicado` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `rol` varchar(15) DEFAULT NULL,
  `id_rol` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`rol`, `id_rol`) VALUES
('Administrador', 1),
('Estudiante', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `nombre` varchar(10) DEFAULT NULL,
  `id_tipo` decimal(5,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `codigo` decimal(10,0) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `teléfono` decimal(15,0) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `rol_id_rol` decimal(10,0) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`codigo`, `nombre`, `email`, `teléfono`, `apellido`, `rol_id_rol`, `password`) VALUES
(11520, 'sunjay', 'sunjay@ufps.edu.co', 0, 'sunshine', 1, '12345');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `anexos`
--
ALTER TABLE `anexos`
  ADD PRIMARY KEY (`id_anexo`),
  ADD KEY `anexos_pqrs_fk` (`pqrs_radicado`),
  ADD KEY `anexos_respuesta_fk` (`respuesta_id_rta`);

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `pqrs`
--
ALTER TABLE `pqrs`
  ADD PRIMARY KEY (`radicado`),
  ADD UNIQUE KEY `pqrs__idx` (`tipo_id_tipo`),
  ADD KEY `pqrs_area_fk` (`area_id_area`),
  ADD KEY `pqrs_estado_fk` (`estado_id_estado`),
  ADD KEY `pqrs_prioridad_fk` (`prioridad_id_prioridad`),
  ADD KEY `pqrs_usuario_fk` (`usuario_codigo`);

--
-- Indices de la tabla `prioridad`
--
ALTER TABLE `prioridad`
  ADD PRIMARY KEY (`id_prioridad`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`id_rta`),
  ADD KEY `respuesta_pqrs_fk` (`pqrs_radicado`),
  ADD KEY `respuesta_usuario_fk` (`usuario_codigo`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `rol_fk` (`rol_id_rol`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `anexos`
--
ALTER TABLE `anexos`
  ADD CONSTRAINT `anexos_pqrs_fk` FOREIGN KEY (`pqrs_radicado`) REFERENCES `pqrs` (`radicado`),
  ADD CONSTRAINT `anexos_respuesta_fk` FOREIGN KEY (`respuesta_id_rta`) REFERENCES `respuesta` (`id_rta`);

--
-- Filtros para la tabla `pqrs`
--
ALTER TABLE `pqrs`
  ADD CONSTRAINT `pqrs_area_fk` FOREIGN KEY (`area_id_area`) REFERENCES `area` (`id_area`),
  ADD CONSTRAINT `pqrs_estado_fk` FOREIGN KEY (`estado_id_estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `pqrs_prioridad_fk` FOREIGN KEY (`prioridad_id_prioridad`) REFERENCES `prioridad` (`id_prioridad`),
  ADD CONSTRAINT `pqrs_tipo_fk` FOREIGN KEY (`tipo_id_tipo`) REFERENCES `tipo` (`id_tipo`),
  ADD CONSTRAINT `pqrs_usuario_fk` FOREIGN KEY (`usuario_codigo`) REFERENCES `usuario` (`codigo`);

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `respuesta_pqrs_fk` FOREIGN KEY (`pqrs_radicado`) REFERENCES `pqrs` (`radicado`),
  ADD CONSTRAINT `respuesta_usuario_fk` FOREIGN KEY (`usuario_codigo`) REFERENCES `usuario` (`codigo`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `rol_fk` FOREIGN KEY (`rol_id_rol`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
