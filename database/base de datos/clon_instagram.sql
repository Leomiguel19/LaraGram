-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-08-2020 a las 06:40:01
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clon_instagram`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `image_id` int(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `image_id`, `content`, `created_at`, `updated_at`) VALUES
(17, 5, 12, 'Excelente vista, my friend!', '2020-08-09 04:34:00', '2020-08-09 04:34:00'),
(18, 7, 12, 'Central Park, IN LOVE!!', '2020-08-09 05:00:02', '2020-08-09 05:00:02'),
(19, 8, 14, 'La vista desde mi edificio', '2020-08-12 04:31:29', '2020-08-12 04:31:29'),
(20, 8, 15, 'El puente de noche', '2020-08-12 04:32:06', '2020-08-12 04:32:06'),
(21, 8, 12, 'Que buena vista tienes!... Vecino!', '2020-08-12 04:32:41', '2020-08-12 04:32:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `images`
--

INSERT INTO `images` (`id`, `user_id`, `image_path`, `description`, `created_at`, `updated_at`) VALUES
(12, 5, '1596947544538080_1366_768.jpg', 'My view', '2020-08-09 04:32:24', '2020-08-09 04:32:24'),
(14, 7, '1597012601538080_1366_768.jpg', 'bello', '2020-08-09 22:36:41', '2020-08-09 22:36:41'),
(15, 8, '1597205520newyork.jpg', 'La ciudad de New York', '2020-08-12 04:12:00', '2020-08-12 04:12:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

CREATE TABLE `likes` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `image_id` int(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `image_id`, `created_at`, `updated_at`) VALUES
(27, 5, 12, '2020-08-09 21:34:07', '2020-08-09 21:34:07'),
(29, 7, 12, '2020-08-09 21:35:45', '2020-08-09 21:35:45'),
(36, 7, 14, '2020-08-09 22:37:49', '2020-08-09 22:37:49'),
(38, 5, 14, '2020-08-09 22:49:43', '2020-08-09 22:49:43'),
(39, 8, 14, '2020-08-12 04:11:13', '2020-08-12 04:11:13'),
(40, 8, 12, '2020-08-12 04:11:15', '2020-08-12 04:11:15'),
(41, 8, 15, '2020-08-12 04:21:22', '2020-08-12 04:21:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `surname` varchar(200) DEFAULT NULL,
  `nick` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `surname`, `nick`, `email`, `password`, `image`, `created_at`, `updated_at`, `remember_token`) VALUES
(5, 'user', 'Leonardo', 'Carreño', 'Leomiguel', 'leomiguel1907@gmail.com', '$2y$10$EjtyO.uBaAEO26jBVtMKHOCUfYHInrQAibQ8jPe7cOpkWgkW/w2O.', '1596947600foto de perfil.jpg', '2020-01-01 19:36:47', '2020-08-09 04:33:20', 'V5cAXBQGYjbFDsvGFVXbLjvJgWsUyWgDbLjz3b2zT7ApGjKz83X0dkISYrkw'),
(7, 'user', 'Juan', 'Perez', 'JuanPerez8945', 'juanperez@hotmail.com', '$2y$10$uUoDDXmMaGfPf36i.JzqK.sC7YGZElHX1OCed8KP8WwRF05ZnJJx2', '1596949106hacker.jpg', '2020-08-09 04:35:38', '2020-08-09 04:58:26', 'QEThT3vdzVPtoc2In4j6LpmYrLcZHkMY5NfDkM6z7aXM6uiVngoLoxCKpFnA'),
(8, 'user', 'admin', 'admin', 'admin', 'admin@admin.com', '$2y$10$qb8eiKnBD44BHZJGVA3MHegkT4k.ldz5GtgwRZxqgJWV0WDUQnIrK', '1597205556hacker3.jpg', '2020-08-11 22:46:57', '2020-08-12 04:12:36', 'gclJWqiruPKq5GbNwGdUWRpXMULfIhxvPU2BcH5dMjO9QAiN6XwlfPjcLiDT');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comments_users` (`user_id`),
  ADD KEY `fk_comments_images` (`image_id`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_images_users` (`user_id`);

--
-- Indices de la tabla `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_likes_users` (`user_id`),
  ADD KEY `fk_likes_images` (`image_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_images` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `fk_comments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_images_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_likes_images` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `fk_likes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
