
CREATE USER 'me'@'%' IDENTIFIED BY 'me13245';
GRANT ALL PRIVILEGES ON * . * TO 'me'@'%';
FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS `me`;
USE DATABASE 'me';

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dump completed on 2022-06-30 10:48:50
--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `direccion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `repartidor`
--

DROP TABLE IF EXISTS `repartidor`;
CREATE TABLE `repartidor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `city_drive` varchar(255) NOT NULL,
  `estado` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `repartidor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Table structure for table `reputacion`
--

DROP TABLE IF EXISTS `reputacion`;
CREATE TABLE `reputacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `puntaje` double(2,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reputacion_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `tipopago`
--

DROP TABLE IF EXISTS `tipopago`;
CREATE TABLE `tipopago` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `metodo` varchar(255) NOT NULL,
  `numero_cuenta` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tipopago_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_producto` varchar(255) NOT NULL,
  `recoger_ubicacion` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `delivery_id` int DEFAULT NULL,
  `envio_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `fecha_solicitada` date DEFAULT (now()),
  `hora_solicitada` timestamp(3) NULL DEFAULT (now()),
  `hora_entregada` timestamp NULL DEFAULT NULL,
  `entrega_estimada` int NOT NULL,
  `metodo_pago` varchar(255) NOT NULL,
  `subtotal` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `delivery_id` (`delivery_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `envio_id` (`envio_id`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`envio_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;