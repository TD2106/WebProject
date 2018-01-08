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
-- Table structure for table `adminlog`
--

DROP TABLE IF EXISTS `adminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminlog` (
  `idLog` int(11) NOT NULL,
  `actionTaken` varchar(200) NOT NULL,
  `idMember` int(11) NOT NULL,
  PRIMARY KEY (`idLog`),
  KEY `fk_AdminLog_Admin1_idx` (`idMember`),
  CONSTRAINT `fk_AdminLog_Admin1` FOREIGN KEY (`idMember`) REFERENCES `admin` (`idMember`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_AdminLog_Log1` FOREIGN KEY (`idLog`) REFERENCES `log` (`idLog`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlog`
--

LOCK TABLES `adminlog` WRITE;
/*!40000 ALTER TABLE `adminlog` DISABLE KEYS */;
INSERT INTO `adminlog` VALUES (125,'Edit movie with id 3',1),(126,'Edit movie with id 3',1),(127,'Edit movie with id 3',1),(128,'Delete movie with id 31',1),(129,'Add movie with id 32',1),(134,'Add Youtube link for movie with id 3',1),(146,'Add Youtube 2 link for movie with id 3',1),(148,'Delete link with id 10 of movie with id 3',1),(149,'Delete link with id 9 of movie with id 3',1),(169,'Delete movie with id 32',1),(170,'Edit movie with id 30',1),(171,'Add movie with id 33',1),(218,'Add Youtube link for movie with id 30',1),(231,'Delete category with id 8',1),(232,'Add category Kids',1),(254,'Delete member with id 3',1),(255,'Delete member with id 3',1),(256,'Delete member with id 5',1);
/*!40000 ALTER TABLE `adminlog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-08 11:55:18
