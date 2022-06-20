CREATE DATABASE IF NOT EXISTS escuelawhatsapp;

USE escuelawhatsapp;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2022 a las 03:18:39
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuelawhatsapp`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumnoAddOrEdit` (IN `_ID` INT, IN `_ID_ALUMNO` VARCHAR(45), IN `_NOMBRES` VARCHAR(45), IN `_APELLIDOS` VARCHAR(45), IN `_IDENTIFICACION` VARCHAR(45), IN `_GENERO` VARCHAR(45), IN `_CORREO` VARCHAR(45), IN `_TELEFONO` VARCHAR(45), IN `_DIRECCION` VARCHAR(45), IN `_GRADO` VARCHAR(45), IN `_OBSERVACIONES` VARCHAR(45))   BEGIN 
  IF _ID = 0 THEN
    INSERT INTO alumnos ( ID_ALUMNO,NOMBRES,APELLIDOS,IDENTIFICACION,GENERO,CORREO,TELEFONO,DIRECCION, GRADO, OBSERVACIONES)
    VALUES (_ID_ALUMNO, _NOMBRES, _APELLIDOS ,_IDENTIFICACION ,_GENERO ,_CORREO ,_TELEFONO ,_DIRECCION ,_GRADO ,_OBSERVACIONES );

    SET _ID = LAST_INSERT_ID();
  ELSE
    UPDATE alumnos
    SET
     ID_ALUMNO =_ID_ALUMNO ,
     NOMBRES=  _NOMBRES,
     APELLIDOS = _APELLIDOS,
     IDENTIFICACION = _IDENTIFICACION ,
     GENERO = _GENERO ,
     CORREO = _CORREO,
     TELEFONO = _TELEFONO ,
     DIRECCION = _DIRECCION ,
     GRADO = _GRADO ,
     OBSERVACIONES=_OBSERVACIONES 
    WHERE ID = _ID;
  END IF;

  SELECT _ID AS 'ID';
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `ID` bigint(255) NOT NULL,
  `ID_ALUMNO` bigint(20) NOT NULL,
  `NOMBRES` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `APELLIDOS` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `IDENTIFICACION` bigint(20) NOT NULL,
  `GENERO` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `CORREO` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `TELEFONO` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `DIRECCION` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `GRADO` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `OBSERVACIONES` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `ESTADO` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`ID`, `ID_ALUMNO`, `NOMBRES`, `APELLIDOS`, `IDENTIFICACION`, `GENERO`, `CORREO`, `TELEFONO`, `DIRECCION`, `GRADO`, `OBSERVACIONES`, `ESTADO`) VALUES
(8, 4552229564, 'JHJDHFJAFH', 'JDHFJSDHFJDFH', 847582374, 'MASCULINO', 'DHFJDSFDJH@JDSHFJDHF.COM', '84237847', '', '1117169249', 'ALUMNO NUEVO', 1),
(9, 7479321091, 'GABRIEL', 'MINA', 17234352324, 'MASCULINO', 'EDSEEADSW@HFFSR', '0984233534', 'SAN BARTOLO', '1117169249', 'NINGUNA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `ID` bigint(255) NOT NULL,
  `ID_ASIGNATURA` bigint(255) NOT NULL,
  `NOMBRE_ASIGNATURA` varchar(1000) COLLATE utf8_spanish2_ci NOT NULL,
  `DESCRIPCION` varchar(1000) COLLATE utf8_spanish2_ci NOT NULL,
  `ESTADO` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`ID`, `ID_ASIGNATURA`, `NOMBRE_ASIGNATURA`, `DESCRIPCION`, `ESTADO`) VALUES
(1, 3752356638, 'LENGUAJE Y LITERATURA ', 'EBG', 1),
(2, 9366311703, 'MATEMATICAS ', 'GBF', 1),
(3, 8034541799, 'CIENCIAS SOCIALES', 'EBG', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `ID` bigint(255) NOT NULL,
  `ID_ASISTENCIA` bigint(20) NOT NULL,
  `ID_ALUMNO` bigint(20) NOT NULL,
  `ID_PROFESOR` bigint(20) NOT NULL,
  `FECHA` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `ASIGNATURA` varchar(225) COLLATE utf8_spanish2_ci NOT NULL,
  `DETALLE` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `ESTADO` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`ID`, `ID_ASISTENCIA`, `ID_ALUMNO`, `ID_PROFESOR`, `FECHA`, `ASIGNATURA`, `DETALLE`, `ESTADO`) VALUES
(1, 2807198760, 4552229564, 3937073055, '2021-09-21', 'LENGUAJE Y LITERATURA ', 'SI', 1),
(2, 5479031902, 4552229564, 3937073055, '2021-10-14', 'LENGUAJE Y LITERATURA ', 'SI', 1),
(3, 9810560829, 7479321091, 3937073055, '2021-10-14', 'LENGUAJE Y LITERATURA ', 'SI', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

CREATE TABLE `grados` (
  `ID` bigint(255) NOT NULL,
  `ID_GRADO` bigint(255) NOT NULL,
  `NOMBRE_GRADO` varchar(1000) COLLATE utf8_spanish2_ci NOT NULL,
  `DESCRIPCION` varchar(1000) COLLATE utf8_spanish2_ci NOT NULL,
  `ESTADO` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `grados`
--

INSERT INTO `grados` (`ID`, `ID_GRADO`, `NOMBRE_GRADO`, `DESCRIPCION`, `ESTADO`) VALUES
(6, 1117169249, 'SEGUNDO', 'EGB', 1),
(7, 1962872879, 'TERCERO', 'EGB', 1),
(8, 4691645012, 'CUARTO', 'EGB', 1),
(9, 4696607165, 'QUINTO', 'EGB', 1),
(10, 3127325286, 'SEPTIMO', 'EGB', 1),
(11, 7177717686, 'OCTAVO A', 'EGB', 1),
(12, 1891339890, 'OCTAVO B', 'EGB', 1),
(13, 1526448546, 'DECIMO', 'DECIMO', 1),
(14, 4227442324, 'TALLER DE HOTELERIA ', 'COCINA Y MUCHO MAS ', 1),
(15, 4187277310, 'DEPORTE DE LUCHA OLIMPICA', 'EDUCACIóN FíSICA ', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `ID` bigint(255) NOT NULL,
  `ID_NOTA` bigint(20) NOT NULL,
  `ID_ALUMNO` bigint(20) NOT NULL,
  `ID_PROFESOR` bigint(20) NOT NULL,
  `MATERIA` varchar(1000) COLLATE utf8_spanish2_ci NOT NULL,
  `NOTA` decimal(20,1) NOT NULL,
  `DETALLE` varchar(1000) COLLATE utf8_spanish2_ci NOT NULL,
  `FECHA` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `ESTADO` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `ID` bigint(255) NOT NULL,
  `ID_PROFESOR` bigint(255) NOT NULL,
  `NOMBRES` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `APELLIDOS` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `IDENTIFICACION` bigint(255) NOT NULL,
  `TELEFONO` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `CORREO` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `ASIGNATURA` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `ESTADO` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`ID`, `ID_PROFESOR`, `NOMBRES`, `APELLIDOS`, `IDENTIFICACION`, `TELEFONO`, `CORREO`, `ASIGNATURA`, `ESTADO`) VALUES
(1, 3937073055, 'GABRIELA ', 'ERAZO', 171423645, '2999000', 'GABY@GIMAIL.COM', 'LENGUAJE Y LITERATURA ', 1),
(3, 8162050676, 'MAR', 'CODENA', 1, '209883642', 'MAR@GANDFR', 'CIENCIAS SOCIALES', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` bigint(255) NOT NULL,
  `ID_USUARIO` bigint(20) NOT NULL,
  `USER` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `PASS` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `ROL` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `NOMBRE_USER` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `TELEFONO` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `CORREO` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `ESTADO` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `ID_USUARIO`, `USER`, `PASS`, `ROL`, `NOMBRE_USER`, `TELEFONO`, `CORREO`, `ESTADO`) VALUES
(1, 19892308, 'admin', '123456', 'ADMINISTRADOR', 'ADMINISTRADOR DECE', '3504016739', 'sirefys@gmail.com', 1),
(4, 3937073055, 'GABY', '123456', 'DOCENTE', 'GABRIELA ', '2999000', 'GABY@GIMAIL.COM', 1),
(5, 7770943812, 'MARCO ', '123456', 'DOCENTE', 'CODENA', '02883664', 'DWMARCO@GSFDE', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_ALUMNO` (`ID_ALUMNO`),
  ADD UNIQUE KEY `IDENTIFICACION` (`IDENTIFICACION`),
  ADD UNIQUE KEY `CORREO` (`CORREO`),
  ADD UNIQUE KEY `TELEFONO` (`TELEFONO`);

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_CURSO` (`ID_ASIGNATURA`),
  ADD UNIQUE KEY `NOMBRE_CURSO` (`NOMBRE_ASIGNATURA`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_ASISTENCIA` (`ID_ASISTENCIA`);

--
-- Indices de la tabla `grados`
--
ALTER TABLE `grados`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_GRADO` (`ID_GRADO`) USING BTREE,
  ADD UNIQUE KEY `NOMBRE_GRADO` (`NOMBRE_GRADO`) USING BTREE;

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_NOTA` (`ID_NOTA`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_PROFESOR` (`ID_PROFESOR`),
  ADD UNIQUE KEY `IDENTIFICACION_PROFESOR` (`IDENTIFICACION`),
  ADD UNIQUE KEY `TELEFONO_PROFESOR` (`TELEFONO`),
  ADD UNIQUE KEY `CORREO_PROFESOR` (`CORREO`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_USUARIO` (`ID_USUARIO`),
  ADD UNIQUE KEY `USER` (`USER`),
  ADD UNIQUE KEY `CORREO_USER` (`CORREO`),
  ADD UNIQUE KEY `TELEFONO_USER` (`TELEFONO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `ID` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `ID` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `ID` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `grados`
--
ALTER TABLE `grados`
  MODIFY `ID` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `ID` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `ID` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

