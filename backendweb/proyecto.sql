-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-09-2024 a las 14:57:34
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
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` int(11) NOT NULL,
  `id_pac` int(11) NOT NULL,
  `nombre_pac` varchar(50) NOT NULL,
  `apellido_pac` varchar(50) DEFAULT NULL,
  `id_odon` int(11) NOT NULL,
  `Fecha_cita` date NOT NULL,
  `hora` varchar(50) NOT NULL,
  `descripcion_cita` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `odontologos`
--

CREATE TABLE `odontologos` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `Usuario` varchar(50) NOT NULL,
  `Contrasena` varchar(100) NOT NULL,
  `Tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `odontologos`
--

INSERT INTO `odontologos` (`id`, `nombres`, `apellidos`, `Usuario`, `Contrasena`, `Tipo`) VALUES
(98765421, 'katryn', 'gonzalez', 'kat', '$2a$10$FfycobghzD4Mv/okOYzCS.GmvqLJE8lF7cyswnQEMFWln8n.Fd44i', 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `Tipo_id` enum('C.C','T.I','C.E') NOT NULL,
  `id` int(11) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Edad` int(100) NOT NULL,
  `Tipo_sangre` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') NOT NULL,
  `sexo` enum('Masculino','Femenino') NOT NULL,
  `Estado_civil` enum('Solter@','Casad@','Divorciad@','Viud@') NOT NULL,
  `Raza_Étnica` enum('Meztizo','Afrodesendiente','Blanco','Indigena','Mulato','Asiatico','Otro') NOT NULL,
  `Direccion` varchar(60) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Telefono` int(10) NOT NULL,
  `Ocupacion` varchar(100) NOT NULL,
  `EPS` varchar(100) NOT NULL,
  `Alergias` varchar(500) NOT NULL,
  `Cirugias` varchar(500) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Nombre_contacto_Emer` varchar(50) DEFAULT NULL,
  `Apellido_con_Emer` varchar(50) DEFAULT NULL,
  `telefono_contacto` int(10) DEFAULT NULL,
  `Direccion_contacto` varchar(60) DEFAULT NULL,
  `Relacion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`Tipo_id`, `id`, `Nombres`, `Apellidos`, `Fecha_Nacimiento`, `Edad`, `Tipo_sangre`, `sexo`, `Estado_civil`, `Raza_Étnica`, `Direccion`, `Ciudad`, `Telefono`, `Ocupacion`, `EPS`, `Alergias`, `Cirugias`, `Email`, `Nombre_contacto_Emer`, `Apellido_con_Emer`, `telefono_contacto`, `Direccion_contacto`, `Relacion`) VALUES
('T.I', 1046268369, 'Luis Gabriel', 'Cabello Sepulveda', '2007-02-03', 17, 'A+', 'Masculino', 'Solter@', 'Otro', 'calle 97A #6l-64', 'Barranquilla', 302349961, 'aprendiz', 'salud total', 'niguna', 'ninguna', 'luisgabrielcabellosepulveda52@gmail.com', 'yuranis', 'sepulveda', 300380182, 'calle 97A #6l-64', 'madre'),
('', 2147483647, 'dwejhvmb', 'fjcashgbn', '2000-06-01', 24, 'A-', 'Masculino', '', 'Otro', 'kfbwvajmc', 'fqkham', 2147483647, 'fewhmw', 'ewqsjk', 'kfwvqhm', 'fwejh', 'fwegvhjm', 'rkehwvjdm', 'jbwfm', 0, 'wefvjhn', 'fwe b');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retratamientos`
--

CREATE TABLE `retratamientos` (
  `id` int(11) NOT NULL,
  `id_pac` int(11) NOT NULL,
  `nombre_pac` varchar(50) NOT NULL,
  `apellido_pac` varchar(50) DEFAULT NULL,
  `id_odon` int(11) NOT NULL,
  `Fecha_retratamiento` date NOT NULL,
  `hora` varchar(50) NOT NULL,
  `descripcion_retratamiento` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_odo` (`id_odon`),
  ADD KEY `fk_pac` (`id_pac`);

--
-- Indices de la tabla `odontologos`
--
ALTER TABLE `odontologos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `retratamientos`
--
ALTER TABLE `retratamientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_paci` (`id_pac`),
  ADD KEY `fk_odont` (`id_odon`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `retratamientos`
--
ALTER TABLE `retratamientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `fk_odo` FOREIGN KEY (`id_odon`) REFERENCES `odontologos` (`id`),
  ADD CONSTRAINT `fk_pac` FOREIGN KEY (`id_pac`) REFERENCES `pacientes` (`id`);

--
-- Filtros para la tabla `retratamientos`
--
ALTER TABLE `retratamientos`
  ADD CONSTRAINT `fk_odont` FOREIGN KEY (`id_odon`) REFERENCES `odontologos` (`id`),
  ADD CONSTRAINT `fk_paci` FOREIGN KEY (`id_pac`) REFERENCES `pacientes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
