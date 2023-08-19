-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-08-2023 a las 15:07:47
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion_hosanna`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `update_product_status`$$
CREATE PROCEDURE `update_product_status` (IN `product_id` INT)  BEGIN
    UPDATE productos
    SET activo = 0
    WHERE id_producto = product_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `descripcion`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'VENDEDOR'),
(3, 'CLIENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha_pedido` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_usuario`, `id_producto`, `cantidad`, `total`, `fecha_pedido`) VALUES
(1, 2, 29, 6, '120.00', '2023-07-20'),
(2, 3, 50, 1, '0.00', '2023-07-26'),
(3, 3, 52, 2, '0.00', '2023-07-26'),
(4, 3, 54, 1, '0.00', '2023-07-26'),
(5, 3, 53, 1, '0.00', '2023-07-26'),
(6, 3, 55, 2, '155.00', '2023-07-26'),
(7, 3, 56, 1, '75.00', '2023-07-26'),
(8, 3, 55, 1, '155.00', '2023-07-26'),
(9, 3, 56, 1, '75.00', '2023-07-26'),
(10, 3, 1, 2, '10.00', '2023-07-27'),
(11, 3, 50, 3, '25.00', '2023-07-27'),
(12, 3, 53, 1, '125.00', '2023-07-27'),
(13, 25, 29, 3, '20.00', '2023-08-03'),
(14, 25, 50, 2, '25.00', '2023-08-03'),
(15, 25, 1, 1, '10.00', '2023-08-03'),
(16, 1, 29, 2, '100.00', '2023-08-08'),
(17, 3, 1, 1, '10.00', '2023-08-05'),
(18, 3, 29, 2, '20.00', '2023-08-05'),
(19, 34, 52, 1, '125.00', '2023-08-14'),
(20, 34, 50, 1, '25.00', '2023-08-14'),
(21, 34, 50, 2, '25.00', '2023-08-14'),
(22, 34, 50, 1, '25.00', '2023-08-14'),
(23, 34, 50, 1, '25.00', '2023-08-14'),
(24, 34, 50, 1, '25.00', '2023-08-14'),
(25, 34, 50, 1, '25.00', '2023-08-14'),
(26, 34, 50, 1, '25.00', '2023-08-14'),
(27, 34, 50, 1, '25.00', '2023-08-14'),
(28, 34, 1, 1, '10.00', '2023-08-14'),
(29, 34, 50, 1, '25.00', '2023-08-14');

--
-- Disparadores `pedidos`
--
DROP TRIGGER IF EXISTS `check_pedido_cantidad`;
DELIMITER $$
CREATE TRIGGER `check_pedido_cantidad` BEFORE INSERT ON `pedidos` FOR EACH ROW BEGIN
    DECLARE product_quantity INT;

    SELECT cantidad INTO product_quantity
    FROM productos
    WHERE id_producto = NEW.id_producto;

    IF product_quantity < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La cantidad solicitada en el pedido supera la cantidad disponible del producto';
    END IF;

    IF (product_quantity - NEW.cantidad) <= 0 THEN
        CALL update_product_status(NEW.id_producto);
    END IF;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_productos_pedidos`;
DELIMITER $$
CREATE TRIGGER `update_productos_pedidos` AFTER INSERT ON `pedidos` FOR EACH ROW BEGIN
	UPDATE productos
    SET cantidad = cantidad - NEW.cantidad
    WHERE id_producto = (SELECT id_producto FROM pedidos WHERE id_pedido = NEW.id_pedido);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `nombre_corto` varchar(256) NOT NULL,
  `descripcion` text NOT NULL,
  `tipo_categoria` int(11) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `codigo` int(50) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `nombre_corto`, `descripcion`, `tipo_categoria`, `cantidad`, `imagen`, `precio`, `codigo`, `activo`) VALUES
(1, 'cinturon de piel', 'cinturon ch', 'cinturo talla 34', 6, 26, 'Assets/img_categorias/cinturones/4300-1a_color-negro.jpg', '10.00', 201, 1),
(29, 'bolsa de regalo tamaño grande', 'bolsa grande', 'bolsa de regalo tamaño grande', 5, 0, '../../../Assets/img_categorias/bolsas/principal.jpg', '20.00', 123456789, 0),
(50, 'Bolsa #1', 'bolsa gr', 'color amarillo.', 5, 448, 'Assets/img_categorias/bolsas/71principal.jpg', '25.00', 1, 1),
(52, 'cuerda de guitarra clásica', 'cuerdas de nylon', 'cuerda de nylon de la marca valenciana', 1, 9, 'Assets/img_categorias/p_musicales/71la-valenciana.jpg', '125.00', 50, 1),
(53, 'mochila para niños', 'mochila ecom', 'Mochila para niños con imagen de kirby', 2, 80, 'Assets/img_categorias/mochilas/8196179563030-mochila-kirby-nubes-1.jpg', '125.00', 100, 1),
(54, 'Gorra cuadrada', 'Gorra cuadrada', 'Color negro, tipo cuadrada', 3, 27, 'Assets/img_categorias/gorras/5771rcmK7BgUL._AC_SX569_.jpg', '350.00', 150, 1),
(55, 'cinturón de piel', 'cinturon de piel ', 'Color negro, tipo piel.', 4, 20, 'Assets/img_categorias/cinturones/77300-1a_color-negro.jpg', '155.00', 200, 1),
(56, 'Cargador para telefono', 'Cargador para telefono', 'Cargador con entrada para teléfonos de tipo C', 6, 10, 'Assets/img_categorias/p_electronicos/85122cSvA8wL.jpg', '75.00', 250, 1),
(58, 'cinturón Grande', 'cinturon', 'cinturon, grande', 4, 25, 'Assets/img_categorias/cinturones/83c554fa8ca31c78bc58fcb3a4f8313ffc.png', '50.00', 202, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `id_cargo` int(11) NOT NULL DEFAULT 3,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `correo`, `telefono`, `direccion`, `contraseña`, `id_cargo`, `estado`) VALUES
(1, 'david', 'hernandez', 'info@davidhernandez.net', '9233295718', '3ra poniente sur S/N', 'admin', 1, 1),
(2, 'juan', 'mancilla', 'info@juanmancilla.net', '9191323262', '5ta sur poniente S/N', '123', 2, 1),
(3, 'leny danie', 'lopez laras', 'dani@gmail.com', '123456', 'Bochil, Chiapas', '123', 3, 1),
(4, 'nacho la vieja', 'lopez', 'nacho@gmail.com', '123456788', 'nose', '321', 2, 1),
(5, 'nacho', 'lopez', 'nacho@gmail.com', '123456788', 'nose', '123', 2, 0),
(9, 'francisco', 'lopez', 'fran@gmail.com', '6227567494', 'Santo Domingo', 'chichichisco', 2, 0),
(10, 'leny', 'gimenez', 'leny@gmail.com', '123456789', 'bochil', '456', 2, 0),
(18, 'ad', 'asd', 'dani@gmail.com', '233232', 'dsfa', 'as', 3, 0),
(19, 'ad', 'asd', 'dani@gmail.com', '233232', 'dsfa', 'as', 3, 0),
(21, 'leny', 'gomez', 'keny@gomail.con', '9867969', 'kjhas', '789', 3, 1),
(22, 'fada', 'dasff', 'asfd@hfakjsh.com', '7987987', 'hkjaskjh', 'jkl', 3, 1),
(23, 'gffsad', 'asdfafds', 'afds@hfadhsj.com', '9879878', 'kjhkfjadhs', 'jkl', 3, 1),
(24, 'afsdfdas', 'fadsfas', 'jhgdsgajh@gafsdjh.com', '68767', 'iuhghk', 'jkl', 3, 1),
(25, 'henry', 'juarez', 'juarezlah@gmail.com', '1234345', 'sdsfddsds', '123', 3, 1),
(27, 'panchito', 'gomez', 'gomw@gmaili.com', '7894564654', 'fdsaasfdas', '789', 3, 1),
(28, 'paco', 'perez', 'podo@gmail.com', '684654684649', 'dfsafdasd', 'jkl', 3, 1),
(29, 'paco ', 'perez', 'lolololo@gmail.com', '4564894456', 'direccion', '456', 3, 1),
(30, 'pcoadf', 'jkjsd', 'x3@pro.ocm', '45698746598', 'jkljfsalkj', 'jkl', 3, 1),
(31, 'hsfdjksfdkh', 'jlkfdsjaljf', '|lkfsjadl@gmail.com', '97756468794654', 'khlkjlj|', 'jkl', 3, 1),
(32, 'fasd', 'fsadf', 'afsd@jjjhj.oasdifj', '132135146512', 'hlfskjalkjfl', 'hola', 3, 1),
(33, 'ffsdafsfs', 'asfdfasddf', 'sfda@gmail.colkjfkljf', '494655445', 'holalal', '456', 3, 1),
(34, 'afsd', 'afsd', 'asfd@fasdj.com', '9867969', 'jhkhkjh', 'jkl', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `fecha_venta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_usuario`, `id_producto`, `cantidad`, `precio`, `total`, `fecha_venta`) VALUES
(1, 2, 1, 6, '60', '60', '2023-07-20'),
(6, 2, 1, 5, '60', '90', '2023-07-20'),
(7, 1, 50, 16, '25', '400', '0000-00-00'),
(8, 1, 50, 34, '25', '400', '0000-00-00'),
(9, 1, 50, 35, '25', '875', '0000-00-00'),
(10, 1, 50, 35, '25', '400', '0000-00-00'),
(11, 1, 50, 4, '25', '100', '0000-00-00'),
(12, 1, 50, 5, '25', '125', '0000-00-00'),
(13, 1, 50, 5, '25', '125', '0000-00-00'),
(14, 1, 50, 5, '25', '125', '2023-07-23'),
(15, 1, 50, 2, '25', '50', '2023-07-23'),
(16, 1, 50, 2, '25', '50', '2023-07-23'),
(17, 1, 50, 7, '25', '175', '2023-07-23'),
(18, 2, 54, 2, '350', '700', '2023-07-23'),
(19, 2, 53, 4, '125', '500', '2023-07-23'),
(20, 1, 53, 8, '125', '125', '2023-07-24'),
(21, 1, 50, 1, '25', '25', '2023-07-24'),
(22, 1, 52, 5, '125', '625', '2023-07-24'),
(23, 1, 52, 3, '125', '375', '2023-07-24'),
(24, 1, 52, 1, '125', '125', '2023-07-24'),
(25, 1, 52, 1, '125', '125', '2023-07-24'),
(26, 1, 52, 2, '125', '250', '2023-07-24'),
(27, 1, 50, 5, '25', '125', '2023-07-27'),
(28, 1, 29, 1, '20', '20', '2023-08-03'),
(29, 1, 55, 1, '20', '20', '2023-08-03'),
(30, 1, 50, 4, '25', '100', '2023-08-03'),
(31, 1, 50, 3, '25', '75', '2023-08-03'),
(32, 1, 50, 11, '25', '275', '2023-08-03'),
(33, 1, 50, 11, '25', '275', '2023-08-03'),
(34, 1, 50, 1, '25', '25', '2023-08-03'),
(35, 1, 53, 10, '125', '1250', '2023-08-05'),
(36, 1, 1, 1, '10', '10', '2023-08-05'),
(37, 1, 29, 2, '20', '40', '2023-08-05'),
(38, 1, 29, 3, '10', '240', '2023-08-05'),
(39, 1, 29, 3, '20', '60', '2023-08-05'),
(40, 1, 1, 1, '10', '10', '2023-08-05'),
(41, 1, 1, 10, '10', '100', '2023-08-05'),
(42, 1, 53, 10, '125', '1250', '2023-08-05'),
(43, 2, 1, 10, '10', '100', '2023-08-05');

--
-- Disparadores `ventas`
--
DROP TRIGGER IF EXISTS `check_venta_cantidad`;
DELIMITER $$
CREATE TRIGGER `check_venta_cantidad` BEFORE INSERT ON `ventas` FOR EACH ROW BEGIN
    DECLARE product_quantity INT;

    SELECT cantidad INTO product_quantity
    FROM productos
    WHERE id_producto = NEW.id_producto;

    IF product_quantity < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La cantidad solicitada en la venta del producto supera la cantidad disponible';
    END IF;

    IF (product_quantity - NEW.cantidad) <= 0 THEN
        CALL update_product_status(NEW.id_producto);
    END IF;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_productos_ventas`;
DELIMITER $$
CREATE TRIGGER `update_productos_ventas` AFTER INSERT ON `ventas` FOR EACH ROW BEGIN
	UPDATE productos
    SET cantidad = cantidad - NEW.cantidad
    WHERE id_producto = (SELECT id_producto FROM ventas WHERE id_venta = NEW.id_venta);
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_usuario` (`id_usuario`) USING BTREE,
  ADD KEY `id_producto` (`id_producto`) USING BTREE;

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_cargo` (`id_cargo`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_usuario` (`id_usuario`) USING BTREE,
  ADD KEY `id_producto` (`id_producto`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
