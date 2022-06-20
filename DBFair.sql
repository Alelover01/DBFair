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

--
-- Table structure for table `appartenenza`
--
CREATE DATABASE fairdb;
USE fairdb;

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
  `codicePadiglione` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAzienda`),
  KEY `codicePadiglione` (`codicePadiglione`),
  CONSTRAINT `codicePadiglione` FOREIGN KEY (`codicePadiglione`) REFERENCES `padiglioni` (`idPadiglione`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aziende`
--

LOCK TABLES `aziende` WRITE;
/*!40000 ALTER TABLE `aziende` DISABLE KEYS */;
INSERT INTO `aziende` VALUES (1,'gayspa','Tastiere',2),(2,'transACTION','Stampanti',1);
/*!40000 ALTER TABLE `aziende` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biglietti`
--

DROP TABLE IF EXISTS `biglietti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biglietti` (
  `idBiglietto` varchar(20) NOT NULL,
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
INSERT INTO `biglietti` VALUES ('bambini',0.00,'Entrata gratuita per bambini fino ai 5 anni'),('online ridotto',7.20,'Biglietto ridotto online'),('online singolo',9.99,'Biglietto singolo online'),('pass azienda',0.00,'Entrata per i dipendenti delle aziende'),('ridotto',8.00,'Entrata per singolo padiglione con prezzo rid'),('singolo',9.99,'Entrata base per singolo padiglione'),('tutti padiglioni',9.99,'Entrata che consente l’accesso a tutti i padi'),('tutti padiglioni rid',9.99,'Entrata ridotta per l’accesso a tutti i padig');
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
INSERT INTO `giorni` VALUES ('2022-05-06','Primo giorno'),('2022-05-07',NULL),('2022-05-08',NULL),('2022-05-09',NULL),('2022-05-10','Ultimo giorno');
/*!40000 ALTER TABLE `giorni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giorni-biglietti`
--

DROP TABLE IF EXISTS `giorni-biglietti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giorni-biglietti` (
  `biglietto` varchar(45) NOT NULL,
  `giorno` date NOT NULL,
  PRIMARY KEY (`giorno`,`biglietto`),
  KEY `Biglietto` (`biglietto`),
  CONSTRAINT `Biglietto` FOREIGN KEY (`biglietto`) REFERENCES `biglietti` (`idBiglietto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Giorno` FOREIGN KEY (`giorno`) REFERENCES `giorni` (`data`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giorni-biglietti`
--

LOCK TABLES `giorni-biglietti` WRITE;
/*!40000 ALTER TABLE `giorni-biglietti` DISABLE KEYS */;
INSERT INTO `giorni-biglietti` VALUES ('tutti padiglioni','2022-05-07'),('bambini','2022-05-08'),('online ridotto','2022-05-08');
/*!40000 ALTER TABLE `giorni-biglietti` ENABLE KEYS */;
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
  `saldoTotale` decimal(3,2) NOT NULL,
  `codPromozione` varchar(45) NOT NULL,
  PRIMARY KEY (`idOrdine`),
  KEY `codPromozione` (`codPromozione`),
  CONSTRAINT `codPromozione` FOREIGN KEY (`codPromozione`) REFERENCES `promozioni` (`idPromozione`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordini`
--

LOCK TABLES `ordini` WRITE;
/*!40000 ALTER TABLE `ordini` DISABLE KEYS */;
INSERT INTO `ordini` VALUES (1,'sdf',4.00,'famiglia'),(2,'sdf',5.00,'famiglia');
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
  `orarioApertura` time NOT NULL,
  `orarioChiusura` time NOT NULL,
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
INSERT INTO `padiglioni` VALUES (1,'Stampanti','10:00:00','16:00:00','2022-06-08',50,25),(2,'Tastiere','09:00:00','20:00:00','2022-06-09',60,50);
/*!40000 ALTER TABLE `padiglioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `padiglioni-visitatori`
--

DROP TABLE IF EXISTS `padiglioni-visitatori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `padiglioni-visitatori` (
  `codicePadiglioneS` int(11) NOT NULL,
  `codiceFiscaleS` varchar(45) NOT NULL,
  PRIMARY KEY (`codicePadiglioneS`,`codiceFiscaleS`),
  KEY `codiceFiscaleS` (`codiceFiscaleS`),
  CONSTRAINT `codiceFiscaleS` FOREIGN KEY (`codiceFiscaleS`) REFERENCES `visitatori` (`codice fiscale`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `codicePadiglioneS` FOREIGN KEY (`codicePadiglioneS`) REFERENCES `padiglioni` (`idPadiglione`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `padiglioni-visitatori`
--

LOCK TABLES `padiglioni-visitatori` WRITE;
/*!40000 ALTER TABLE `padiglioni-visitatori` DISABLE KEYS */;
INSERT INTO `padiglioni-visitatori` VALUES (1,'a'),(1,'d'),(2,'a'),(2,'d');
/*!40000 ALTER TABLE `padiglioni-visitatori` ENABLE KEYS */;
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
  `codiceAzienda` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProdotto`),
  KEY `codiceAzienda` (`codiceAzienda`),
  CONSTRAINT `codiceAzienda` FOREIGN KEY (`codiceAzienda`) REFERENCES `aziende` (`idAzienda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotti`
--

LOCK TABLES `prodotti` WRITE;
/*!40000 ALTER TABLE `prodotti` DISABLE KEYS */;
INSERT INTO `prodotti` VALUES (7,'saso',0.50,'un saso',1),(11,'maso',3.00,'un maso',2),(16,'faso',1.00,'un faso',2),(23,'baso',2.00,'un baso',2),(45,'paso',5.00,'un paso',1);
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
  `sconto` int(11) NOT NULL,
  `descrizione` varchar(45) NOT NULL,
  PRIMARY KEY (`idPromozione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promozioni`
--

LOCK TABLES `promozioni` WRITE;
/*!40000 ALTER TABLE `promozioni` DISABLE KEYS */;
INSERT INTO `promozioni` VALUES ('famiglia',5,'2 adulti + 2 bambini paganti'),('gruppo 11-30',25,'Promozione per gruppi fino a 30 persone'),('gruppo 5-10',10,'Promozione per gruppi da 5 a 10 persone'),('gruppo più 30',40,'Promozione per gruppi con più di 30 persone');
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
INSERT INTO `visitatori` VALUES ('a','a','a','2022-06-04','M'),('d','d','d','2003-06-17','M'),('e','e','e','2002-06-02','F'),('f','f','f','2003-06-17','F'),('q','q','q','2022-06-02','F'),('r','r','r','2002-06-02','F'),('s','s','s','2022-06-17','M'),('syso','gay','trallalla','2002-02-02','gay'),('w','w','w','2022-06-02','F');
/*!40000 ALTER TABLE `visitatori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitatori-ordini-biglietti`
--

DROP TABLE IF EXISTS `visitatori-ordini-biglietti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitatori-ordini-biglietti` (
  `codVisitatore` varchar(45) NOT NULL,
  `codOrdine` int(11) NOT NULL,
  `codBiglietto` varchar(45) NOT NULL,
  `Data` date NOT NULL,
  PRIMARY KEY (`codVisitatore`,`codOrdine`,`codBiglietto`,`Data`),
  KEY `codBiglietto` (`codBiglietto`),
  KEY `codOrdine` (`codOrdine`),
  CONSTRAINT `codBiglietto` FOREIGN KEY (`codBiglietto`) REFERENCES `biglietti` (`idBiglietto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `codOrdine` FOREIGN KEY (`codOrdine`) REFERENCES `ordini` (`idOrdine`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `codVisitatore` FOREIGN KEY (`codVisitatore`) REFERENCES `visitatori` (`codice fiscale`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitatori-ordini-biglietti`
--

LOCK TABLES `visitatori-ordini-biglietti` WRITE;
/*!40000 ALTER TABLE `visitatori-ordini-biglietti` DISABLE KEYS */;
INSERT INTO `visitatori-ordini-biglietti` VALUES ('a',1,'bambini','2022-06-08'),('a',1,'online ridotto','2022-06-08'),('a',2,'tutti padiglioni','2022-06-07'),('d',1,'online ridotto','2022-06-08');
/*!40000 ALTER TABLE `visitatori-ordini-biglietti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-20 11:28:50
