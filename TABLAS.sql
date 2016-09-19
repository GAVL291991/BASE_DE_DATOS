CREATE DATABASE  IF NOT EXISTS `dbuniguajirag6` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbuniguajirag6`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: dbuniguajirag6
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `afiliado`
--

DROP TABLE IF EXISTS `afiliado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afiliado` (
  `id_afiliado` bigint(20) NOT NULL,
  `nombre` char(40) DEFAULT NULL,
  `direccion` char(40) DEFAULT NULL,
  `telefono` char(40) DEFAULT NULL,
  `id_sexo` char(10) DEFAULT NULL,
  PRIMARY KEY (`id_afiliado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afiliado`
--

LOCK TABLES `afiliado` WRITE;
/*!40000 ALTER TABLE `afiliado` DISABLE KEYS */;
/*!40000 ALTER TABLE `afiliado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alquiler`
--

DROP TABLE IF EXISTS `alquiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alquiler` (
  `id_prestamo` int(11) NOT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `telefono` char(40) DEFAULT NULL,
  `id_afiliado` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `id_afiliado` (`id_afiliado`),
  CONSTRAINT `alquiler_ibfk_1` FOREIGN KEY (`id_afiliado`) REFERENCES `afiliado` (`id_afiliado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquiler`
--

LOCK TABLES `alquiler` WRITE;
/*!40000 ALTER TABLE `alquiler` DISABLE KEYS */;
/*!40000 ALTER TABLE `alquiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucion`
--

DROP TABLE IF EXISTS `devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devolucion` (
  `id_devolucion` int(11) NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `multa` bigint(40) DEFAULT NULL,
  `id_prestamo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_devolucion`),
  KEY `id_prestamo` (`id_prestamo`),
  CONSTRAINT `devolucion_ibfk_1` FOREIGN KEY (`id_prestamo`) REFERENCES `alquiler` (`id_prestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucion`
--

LOCK TABLES `devolucion` WRITE;
/*!40000 ALTER TABLE `devolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `director` (
  `id_director` int(11) NOT NULL,
  `nombre` char(20) DEFAULT NULL,
  `id_sexo` char(10) DEFAULT NULL,
  `id_nacionalidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_director`),
  KEY `id_nacionalidad` (`id_nacionalidad`),
  CONSTRAINT `director_ibfk_1` FOREIGN KEY (`id_nacionalidad`) REFERENCES `nacionalidad` (`id_nacionalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formato`
--

DROP TABLE IF EXISTS `formato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formato` (
  `id_formato` bigint(20) NOT NULL,
  `nombre` char(50) DEFAULT NULL,
  PRIMARY KEY (`id_formato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formato`
--

LOCK TABLES `formato` WRITE;
/*!40000 ALTER TABLE `formato` DISABLE KEYS */;
/*!40000 ALTER TABLE `formato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `tipo_genero` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nacionalidad`
--

DROP TABLE IF EXISTS `nacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nacionalidad` (
  `id_nacionalidad` int(11) NOT NULL,
  `nombre` char(20) DEFAULT NULL,
  PRIMARY KEY (`id_nacionalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacionalidad`
--

LOCK TABLES `nacionalidad` WRITE;
/*!40000 ALTER TABLE `nacionalidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `nacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelicula` (
  `id_pelicula` bigint(20) NOT NULL,
  `nombre` char(20) DEFAULT NULL,
  `id_genero` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pelicula`),
  KEY `id_genero` (`id_genero`),
  CONSTRAINT `id_genero` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_x_director`
--

DROP TABLE IF EXISTS `pelicula_x_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelicula_x_director` (
  `id_director` int(11) NOT NULL,
  `id_pelicula` bigint(20) NOT NULL,
  PRIMARY KEY (`id_director`,`id_pelicula`),
  KEY `id_pelicula` (`id_pelicula`),
  KEY `id_director` (`id_director`),
  CONSTRAINT `pelicula_x_director_ibfk_1` FOREIGN KEY (`id_director`) REFERENCES `director` (`id_director`),
  CONSTRAINT `pelicula_x_director_ibfk_2` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id_pelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_x_director`
--

LOCK TABLES `pelicula_x_director` WRITE;
/*!40000 ALTER TABLE `pelicula_x_director` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelicula_x_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_x_formato`
--

DROP TABLE IF EXISTS `pelicula_x_formato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelicula_x_formato` (
  `id_formato` bigint(20) NOT NULL,
  `id_pelicula` bigint(20) NOT NULL,
  PRIMARY KEY (`id_formato`,`id_pelicula`),
  KEY `id_pelicula` (`id_pelicula`),
  KEY `id_formato` (`id_formato`),
  CONSTRAINT `pelicula_x_formato_ibfk_1` FOREIGN KEY (`id_formato`) REFERENCES `formato` (`id_formato`),
  CONSTRAINT `pelicula_x_formato_ibfk_2` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id_pelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_x_formato`
--

LOCK TABLES `pelicula_x_formato` WRITE;
/*!40000 ALTER TABLE `pelicula_x_formato` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelicula_x_formato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_x_protagonista`
--

DROP TABLE IF EXISTS `pelicula_x_protagonista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelicula_x_protagonista` (
  `id_protagonista` int(11) NOT NULL,
  `id_pelicula` bigint(20) NOT NULL,
  PRIMARY KEY (`id_protagonista`,`id_pelicula`),
  KEY `id_pelicula` (`id_pelicula`),
  KEY `id_protagonista` (`id_protagonista`),
  CONSTRAINT `pelicula_x_protagonista_ibfk_1` FOREIGN KEY (`id_protagonista`) REFERENCES `protagonista` (`id_protagonista`),
  CONSTRAINT `pelicula_x_protagonista_ibfk_2` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id_pelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_x_protagonista`
--

LOCK TABLES `pelicula_x_protagonista` WRITE;
/*!40000 ALTER TABLE `pelicula_x_protagonista` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelicula_x_protagonista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo_x_pelicula`
--

DROP TABLE IF EXISTS `prestamo_x_pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamo_x_pelicula` (
  `id_prestamo` int(11) NOT NULL,
  `id_pelicula` bigint(20) NOT NULL,
  PRIMARY KEY (`id_prestamo`,`id_pelicula`),
  KEY `id_prestamo` (`id_prestamo`),
  KEY `id_pelicula` (`id_pelicula`),
  CONSTRAINT `prestamo_x_pelicula_ibfk_1` FOREIGN KEY (`id_prestamo`) REFERENCES `alquiler` (`id_prestamo`),
  CONSTRAINT `prestamo_x_pelicula_ibfk_2` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id_pelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo_x_pelicula`
--

LOCK TABLES `prestamo_x_pelicula` WRITE;
/*!40000 ALTER TABLE `prestamo_x_pelicula` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamo_x_pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protagonista`
--

DROP TABLE IF EXISTS `protagonista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protagonista` (
  `id_protagonista` int(11) NOT NULL,
  `nombre` char(20) DEFAULT NULL,
  `id_sexo` char(10) DEFAULT NULL,
  `id_nacionalidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_protagonista`),
  KEY `id_nacionalidad` (`id_nacionalidad`),
  CONSTRAINT `protagonista_ibfk_1` FOREIGN KEY (`id_nacionalidad`) REFERENCES `nacionalidad` (`id_nacionalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protagonista`
--

LOCK TABLES `protagonista` WRITE;
/*!40000 ALTER TABLE `protagonista` DISABLE KEYS */;
/*!40000 ALTER TABLE `protagonista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbuniguajirag6'
--

--
-- Dumping routines for database 'dbuniguajirag6'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-16 21:53:09
