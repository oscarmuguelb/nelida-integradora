CREATE DATABASE  IF NOT EXISTS `savp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `savp`;
-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: savp
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_fk` int NOT NULL,
  `estado` int NOT NULL,
  `plataforma_fk` int NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_fk` (`producto_fk`),
  KEY `plataforma_fk` (`plataforma_fk`),
  CONSTRAINT `Item_ibfk_1` FOREIGN KEY (`producto_fk`) REFERENCES `Producto` (`id`),
  CONSTRAINT `Item_ibfk_2` FOREIGN KEY (`plataforma_fk`) REFERENCES `Plataforma` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
INSERT INTO `Item` VALUES (2,2,1,1,'PRUEBA ITEM',1),(3,5,1,2,'Item Prueba',1),(4,5,1,1,'es un videojuego de acción-aventura de mundo abierto en tercera persona desarrollado por el estudio escocés Rockstar North y distribuido por Rockstar Games. ',1),(5,21,1,2,'En buenas condiciones',1),(6,18,1,2,'Sin detalles',0),(7,18,1,8,'Sin detalles',1),(8,19,1,3,'Sin detalles',0),(9,19,1,8,'Sin detalles',1);
/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Personal`
--

DROP TABLE IF EXISTS `Personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Personal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `birthday` varchar(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `user_fk` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_fk` (`user_fk`),
  CONSTRAINT `Personal_ibfk_1` FOREIGN KEY (`user_fk`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personal`
--

LOCK TABLES `Personal` WRITE;
/*!40000 ALTER TABLE `Personal` DISABLE KEYS */;
INSERT INTO `Personal` VALUES (5,'ivan samuel mata nieto','09-01-1999','Calle miguel hidalgo 37 jiutepec morelos',1,9),(6,'ivan samuel mata nieto','09-01-1999','Calle miguel hidalgo 37 jiutepec morelos',1,10);
/*!40000 ALTER TABLE `Personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plataforma`
--

DROP TABLE IF EXISTS `Plataforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Plataforma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plataforma` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plataforma`
--

LOCK TABLES `Plataforma` WRITE;
/*!40000 ALTER TABLE `Plataforma` DISABLE KEYS */;
INSERT INTO `Plataforma` VALUES (1,'XBOX 360',1),(2,'XBOX ONE',1),(3,'XBOX SERIES S',1),(4,'PS1',1),(5,'PS2',1),(6,'PlayStation3',1),(7,'PlayStation4',1),(8,'PlayStation5',1);
/*!40000 ALTER TABLE `Plataforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producto`
--

DROP TABLE IF EXISTS `Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `titulo_UNIQUE` (`titulo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producto`
--

LOCK TABLES `Producto` WRITE;
/*!40000 ALTER TABLE `Producto` DISABLE KEYS */;
INSERT INTO `Producto` VALUES (2,'PRUEBA','PRUEBA',NULL),(5,'GTA V','es un videojuego de acción-aventura de mundo abierto en tercera persona desarrollado por el estudio escocés Rockstar North y distribuido por Rockstar Games. ',NULL),(17,'PRUEBA1','Minecraft es un videojuego de construcción de tipo «mundo abierto» o en inglés sandbox creado originalmente por el sueco Markus Persson, que creo posteriormente Mojang Studios.','image_PRUEBA.png'),(18,'MINECRAFT','Minecraft es un videojuego de construcción de tipo «mundo abierto» o en inglés sandbox creado originalmente por el sueco Markus Persson, que creo posteriormente Mojang Studios.','image_MINECRAFT.png'),(19,'The Witcher 3: Wild Hunt','Sumérgete en un mundo de fantasía épica mientras controlas a Geralt de Rivia, un cazador de monstruos, en busca de su hija adoptiva.','image_The Witcher 3: Wild Hunt.png'),(20,'BioShock Infinite','Explora la ciudad flotante de Columbia en este shooter en primera persona, donde las dimensiones se entrelazan y la historia te deja sin aliento.','image_BioShock Infinite.png'),(21,'Uncharted 4: A Thief\'s End','Acompaña a Nathan Drake en su última aventura, llena de acción, tesoros perdidos y traiciones, en busca de la verdad detrás de los mitos.','image_Uncharted 4: A Thief\'s End.png');
/*!40000 ALTER TABLE `Producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Renta`
--

DROP TABLE IF EXISTS `Renta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Renta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_fk` int NOT NULL,
  `fecha` datetime NOT NULL,
  `item_fk` int NOT NULL,
  `cajero_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_fk` (`user_fk`),
  KEY `item_fk` (`item_fk`),
  CONSTRAINT `Renta_ibfk_1` FOREIGN KEY (`user_fk`) REFERENCES `User` (`id`),
  CONSTRAINT `Renta_ibfk_2` FOREIGN KEY (`item_fk`) REFERENCES `Item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Renta`
--

LOCK TABLES `Renta` WRITE;
/*!40000 ALTER TABLE `Renta` DISABLE KEYS */;
INSERT INTO `Renta` VALUES (2,1,'2023-12-06 21:10:59',2,1),(6,10,'2023-12-11 05:35:14',8,2),(7,10,'2023-12-11 05:35:30',6,2);
/*!40000 ALTER TABLE `Renta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rol`
--

DROP TABLE IF EXISTS `Rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rol`
--

LOCK TABLES `Rol` WRITE;
/*!40000 ALTER TABLE `Rol` DISABLE KEYS */;
INSERT INTO `Rol` VALUES (1,'ADMIN'),(2,'CAJERO'),(3,'USUARIO');
/*!40000 ALTER TABLE `Rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `rol_fk` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `rol_fk` (`rol_fk`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`rol_fk`) REFERENCES `Rol` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'ivansamuel','$2b$15$gpDO/DQELGXjlaKCUphAOeCzQzBSuKsaj/2b4JizD6UhbRaY0JOsO',1,1),(9,'samuel09','$2b$15$cCb2TA1dNqYrvWs47WgK9.SMNnAApCtPrl9crZQeM09gAKCJOkGxC',1,2),(10,'master09','$2b$15$TtEk9Phz5lsSFJDdbxppUO0DyW9g06htF6nnVYbze.e3Mu4Xwo1Ay',1,3),(11,'usuarioPrueba','$2b$15$Wtvb0/DwUTz.D.7pfxg.g.SF67XX8BsPemZNntXL49W2XoWFdxEWK',1,3),(12,'pruebausuario2','$2b$15$0HwYNpdPVJ/dfL.MFWetRubknOUi0V2p750qUMxpf8qXqQaRC/DDS',1,3);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'savp'
--

--
-- Dumping routines for database 'savp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*
agregados por oscar
*/

-- Dump completed on 2023-12-13 21:56:30
select * from user;
select * from plataforma;
select * from item;
select * from producto;