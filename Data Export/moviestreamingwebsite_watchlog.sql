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
-- Table structure for table `watchlog`
--

DROP TABLE IF EXISTS `watchlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchlog` (
  `idLog` int(11) NOT NULL,
  `idMovie` int(11) NOT NULL,
  `idMember` int(11) NOT NULL,
  PRIMARY KEY (`idLog`),
  KEY `fk_WatchLog_Movie1_idx` (`idMovie`),
  KEY `fk_WatchLog_Member1_idx` (`idMember`),
  CONSTRAINT `fk_WatchLog_Log1` FOREIGN KEY (`idLog`) REFERENCES `log` (`idLog`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_WatchLog_Member1` FOREIGN KEY (`idMember`) REFERENCES `member` (`idMember`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_WatchLog_Movie1` FOREIGN KEY (`idMovie`) REFERENCES `movie` (`idMovie`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlog`
--

LOCK TABLES `watchlog` WRITE;
/*!40000 ALTER TABLE `watchlog` DISABLE KEYS */;
INSERT INTO `watchlog` VALUES (228,28,2),(229,28,2),(230,30,2),(233,30,2),(234,30,2),(235,30,2),(236,30,2),(237,30,2),(238,24,2),(239,30,1),(240,30,1),(241,30,1),(242,30,1),(243,25,1),(244,24,1),(245,23,1),(246,21,1),(247,21,1),(248,19,1),(249,22,1),(250,17,1),(251,24,1),(252,26,1);
/*!40000 ALTER TABLE `watchlog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-08 11:55:19
