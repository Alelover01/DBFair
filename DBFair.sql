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
-- Table structure for table `appartenenza`
--

DROP TABLE IF EXISTS `appartenenza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appartenenza` (
  `codAzienda` int(11) NOT NULL,
  `codProdotto` int(11) NOT NULL,
  KEY `codAzienda` (`codAzienda`),
  KEY `codProdotto` (`codProdotto`),
  CONSTRAINT `codAzienda` FOREIGN KEY (`codAzienda`) REFERENCES `aziende` (`idAzienda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `codProdotto` FOREIGN KEY (`codProdotto`) REFERENCES `prodotti` (`idProdotto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartenenza`
--

LOCK TABLES `appartenenza` WRITE;
/*!40000 ALTER TABLE `appartenenza` DISABLE KEYS */;
INSERT INTO `appartenenza` VALUES (1,11),(1,23),(2,16);
/*!40000 ALTER TABLE `appartenenza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aziende`
--

DROP TABLE IF EXISTS `aziende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aziende` (
  `idAzienda` int(11) NOT NULL,
  `denominazione` varchar(45) NOT NULL,
  `specializzazione` varchar(45) NOT NULL,
  PRIMARY KEY (`idAzienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aziende`
--

LOCK TABLES `aziende` WRITE;
/*!40000 ALTER TABLE `aziende` DISABLE KEYS */;
INSERT INTO `aziende` VALUES (1,'gayspa','rotelline del mouse'),(2,'transACTION','pixel');
/*!40000 ALTER TABLE `aziende` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biglietti`
--

DROP TABLE IF EXISTS `biglietti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biglietti` (
  `idBiglietto` int(11) NOT NULL,
  `prezzo` decimal(3,2) NOT NULL,
  `descrizione` varchar(45) NOT NULL,
  PRIMARY KEY (`idBiglietto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biglietti`
--

LOCK TABLES `biglietti` WRITE;
/*!40000 ALTER TABLE `biglietti` DISABLE KEYS */;
/*!40000 ALTER TABLE `biglietti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giorni`
--

DROP TABLE IF EXISTS `giorni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giorni` (
  `data` date NOT NULL,
  `descizione` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giorni`
--

LOCK TABLES `giorni` WRITE;
/*!40000 ALTER TABLE `giorni` DISABLE KEYS */;
/*!40000 ALTER TABLE `giorni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordini`
--

DROP TABLE IF EXISTS `ordini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordini` (
  `idOrdine` int(11) NOT NULL,
  `giorno` varchar(45) NOT NULL,
  `codVisitatore` varchar(45) NOT NULL,
  `codPromozione` varchar(45) NOT NULL,
  PRIMARY KEY (`idOrdine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordini`
--

LOCK TABLES `ordini` WRITE;
/*!40000 ALTER TABLE `ordini` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordini` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `padiglioni`
--

DROP TABLE IF EXISTS `padiglioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `padiglioni` (
  `idPadiglione` int(11) NOT NULL,
  `specializzazioneRichiesta` varchar(45) NOT NULL,
  `orarioApertura` date NOT NULL,
  `orarioChiusura` date NOT NULL,
  `giornoAperturaAreaBambini` date NOT NULL,
  `numSpaziEsposizioneTot` int(11) NOT NULL,
  `numSpaziEsposizioneOccupati` int(11) NOT NULL,
  PRIMARY KEY (`idPadiglione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `padiglioni`
--

LOCK TABLES `padiglioni` WRITE;
/*!40000 ALTER TABLE `padiglioni` DISABLE KEYS */;
/*!40000 ALTER TABLE `padiglioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personale`
--

DROP TABLE IF EXISTS `personale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personale` (
  `codiceFiscale` varchar(20) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `dataNascita` date NOT NULL,
  `sesso` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefono` int(11) NOT NULL,
  `ruolo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codiceFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personale`
--

LOCK TABLES `personale` WRITE;
/*!40000 ALTER TABLE `personale` DISABLE KEYS */;
/*!40000 ALTER TABLE `personale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotti`
--

DROP TABLE IF EXISTS `prodotti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prodotti` (
  `idProdotto` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `prezzo` decimal(4,2) NOT NULL,
  `descrizione` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idProdotto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotti`
--

LOCK TABLES `prodotti` WRITE;
/*!40000 ALTER TABLE `prodotti` DISABLE KEYS */;
INSERT INTO `prodotti` VALUES (7,'saso',0.50,'un saso'),(11,'maso',3.00,'un maso'),(16,'faso',1.00,'un faso'),(23,'baso',2.00,'un baso');
/*!40000 ALTER TABLE `prodotti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promozioni`
--

DROP TABLE IF EXISTS `promozioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promozioni` (
  `idPromozione` varchar(20) NOT NULL,
  `sconto%` int(11) NOT NULL,
  `descrizione` varchar(45) NOT NULL,
  PRIMARY KEY (`idPromozione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promozioni`
--

LOCK TABLES `promozioni` WRITE;
/*!40000 ALTER TABLE `promozioni` DISABLE KEYS */;
/*!40000 ALTER TABLE `promozioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spazi_esposizione`
--

DROP TABLE IF EXISTS `spazi_esposizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spazi_esposizione` (
  `lettera` varchar(1) NOT NULL,
  `numero` int(11) NOT NULL,
  PRIMARY KEY (`lettera`,`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spazi_esposizione`
--

LOCK TABLES `spazi_esposizione` WRITE;
/*!40000 ALTER TABLE `spazi_esposizione` DISABLE KEYS */;
/*!40000 ALTER TABLE `spazi_esposizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turni`
--

DROP TABLE IF EXISTS `turni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turni` (
  `idTurno` int(11) NOT NULL,
  `giorno` date NOT NULL,
  `orario` time NOT NULL,
  PRIMARY KEY (`idTurno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turni`
--

LOCK TABLES `turni` WRITE;
/*!40000 ALTER TABLE `turni` DISABLE KEYS */;
/*!40000 ALTER TABLE `turni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitatori`
--

DROP TABLE IF EXISTS `visitatori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitatori` (
  `codice fiscale` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `data nascita` date NOT NULL,
  `sesso` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codice fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitatori`
--

LOCK TABLES `visitatori` WRITE;
/*!40000 ALTER TABLE `visitatori` DISABLE KEYS */;
INSERT INTO `visitatori` VALUES ('sd','sd','sd','2001-01-01','sd'),('syso','gay','trallalla','2002-02-02','gay');
/*!40000 ALTER TABLE `visitatori` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-01 15:41:43
