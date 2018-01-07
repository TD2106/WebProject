CREATE DATABASE  IF NOT EXISTS `moviestreamingwebsite` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `moviestreamingwebsite`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: moviestreamingwebsite
-- ------------------------------------------------------
-- Server version	5.6.35-log

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
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `idLink` int(11) NOT NULL,
  `movieLink` varchar(200) NOT NULL,
  `serverName` varchar(45) NOT NULL,
  `idMovie` int(11) NOT NULL,
  PRIMARY KEY (`idLink`),
  KEY `fk_Link_Movie1_idx` (`idMovie`),
  CONSTRAINT `fk_Link_Movie1` FOREIGN KEY (`idMovie`) REFERENCES `movie` (`idMovie`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` VALUES (1,'https://drive.google.com/file/d/0B46Fkfv1tFH7ZVNXRTVmeTlCSmc/view?usp=sharing','Google Drive',1),(2,'https://goo.gl/YwQ7q8','Onedrive',1),(3,'https://drive.google.com/file/d/0B46Fkfv1tFH7ZVNXRTVmeTlCSmc/view?usp=sharing','Google Drive',2),(4,'https://goo.gl/YwQ7q8','Onedrive',2),(5,'https://drive.google.com/file/d/0B46Fkfv1tFH7ZVNXRTVmeTlCSmc/view?usp=sharing','Google Drive',3),(6,'https://goo.gl/YwQ7q8','Onedrive',4),(7,'https://drive.google.com/file/d/0B46Fkfv1tFH7ZVNXRTVmeTlCSmc/view?usp=sharing','Google Drive',4),(8,'https://goo.gl/YwQ7q8','Onedrive',4);
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-12  6:02:49
