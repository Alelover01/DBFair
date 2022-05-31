-- MariaDB dump 10.19  Distrib 10.4.20-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: fairdb
-- ------------------------------------------------------
-- Server version	10.4.20-MariaDB

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

CREATE DATABASE fairdb;
USE fairdb;

--
-- Table structure for table `azienda`
--

DROP TABLE IF EXISTS `azienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `azienda` (
  `idAzienda` int(11) NOT NULL,
  `denominazione` varchar(45) NOT NULL,
  `specializzazione` varchar(45) NOT NULL,
  PRIMARY KEY (`idAzienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `azienda`
--

LOCK TABLES `azienda` WRITE;
/*!40000 ALTER TABLE `azienda` DISABLE KEYS */;
INSERT INTO `azienda` VALUES (1,'gayspa','rotelline del mouse'),(2,'transACTION','pixel');
/*!40000 ALTER TABLE `azienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodottiazienda`
--

DROP TABLE IF EXISTS `prodottiazienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prodottiazienda` (
  `codAzienda` int(11) NOT NULL,
  `codProdotto` int(11) NOT NULL,
  KEY `codAzienda` (`codAzienda`),
  KEY `codProdotto` (`codProdotto`),
  CONSTRAINT `codAzienda` FOREIGN KEY (`codAzienda`) REFERENCES `azienda` (`idAzienda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `codProdotto` FOREIGN KEY (`codProdotto`) REFERENCES `prodotto` (`idProdotto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodottiazienda`
--

LOCK TABLES `prodottiazienda` WRITE;
/*!40000 ALTER TABLE `prodottiazienda` DISABLE KEYS */;
INSERT INTO `prodottiazienda` VALUES (1,11),(1,23),(2,16);
/*!40000 ALTER TABLE `prodottiazienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prodotto` (
  `idProdotto` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `prezzo` decimal(4,2) NOT NULL,
  `descrizione` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idProdotto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES (7,'saso',0.50,'un saso'),(11,'maso',3.00,'un maso'),(16,'faso',1.00,'un faso'),(23,'baso',2.00,'un baso');
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitatore`
--

DROP TABLE IF EXISTS `visitatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitatore` (
  `codice fiscale` varchar(45) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `cognome` varchar(45) DEFAULT NULL,
  `data nascita` date DEFAULT NULL,
  `sesso` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codice fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitatore`
--

LOCK TABLES `visitatore` WRITE;
/*!40000 ALTER TABLE `visitatore` DISABLE KEYS */;
INSERT INTO `visitatore` VALUES ('sd','sd','sd','2001-01-01','sd'),('syso','gay','trallalla','2002-02-02','gay');
/*!40000 ALTER TABLE `visitatore` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-31 13:20:19
