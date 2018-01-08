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
  `idLink` int(11) NOT NULL AUTO_INCREMENT,
  `movieLink` varchar(200) NOT NULL,
  `serverName` varchar(45) NOT NULL,
  `idMovie` int(11) NOT NULL,
  PRIMARY KEY (`idLink`),
  KEY `fk_Link_Movie1_idx` (`idMovie`),
  CONSTRAINT `fk_Link_Movie1` FOREIGN KEY (`idMovie`) REFERENCES `movie` (`idMovie`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` VALUES (1,'https://drive.google.com/file/d/16Y_q9MzsxTvGNen_rnkqj6dg53-Mn_98/preview','Google Drive',1),(2,'https://openload.co/embed/-YSoeTBHwRQ/','Openload',1),(3,'https://drive.google.com/file/d/1Q8YAeeZowySqF7JPCXPd6Yu4s4FYXI5D/preview','Google Drive',2),(4,'https://openload.co/embed/5DALUfS2rVM','Openload',2),(5,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',3),(6,'https://openload.co/embed/1zr-6k7Gc5s','Openload',3),(7,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',4),(8,'https://openload.co/embed/1zr-6k7Gc5s','Openload',4),(9,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',5),(10,'https://openload.co/embed/1zr-6k7Gc5s','Openload',5),(11,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',6),(12,'https://openload.co/embed/1zr-6k7Gc5s','Openload',6),(13,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',7),(14,'https://openload.co/embed/1zr-6k7Gc5s','Openload',7),(17,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',10),(18,'https://openload.co/embed/1zr-6k7Gc5s','Openload',10),(19,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',11),(20,'https://openload.co/embed/1zr-6k7Gc5s','Openload',11),(21,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',12),(22,'https://openload.co/embed/1zr-6k7Gc5s','Openload',12),(23,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',13),(24,'https://openload.co/embed/1zr-6k7Gc5s','Openload',13),(25,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',14),(26,'https://openload.co/embed/1zr-6k7Gc5s','Openload',14),(27,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',15),(28,'https://openload.co/embed/1zr-6k7Gc5s','Openload',15),(29,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',16),(30,'https://openload.co/embed/1zr-6k7Gc5s','Openload',16),(31,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',17),(32,'https://openload.co/embed/1zr-6k7Gc5s','Openload',17),(33,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',18),(34,'https://openload.co/embed/1zr-6k7Gc5s','Openload',18),(35,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',19),(36,'https://openload.co/embed/1zr-6k7Gc5s','Openload',19),(37,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',20),(38,'https://openload.co/embed/1zr-6k7Gc5s','Openload',20),(39,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',21),(40,'https://openload.co/embed/1zr-6k7Gc5s','Openload',21),(41,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',22),(42,'https://openload.co/embed/1zr-6k7Gc5s','Openload',22),(43,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',23),(44,'https://openload.co/embed/1zr-6k7Gc5s','Openload',23),(45,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',24),(46,'https://openload.co/embed/1zr-6k7Gc5s','Openload',24),(47,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',25),(48,'https://openload.co/embed/1zr-6k7Gc5s','Openload',25),(49,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',26),(50,'https://openload.co/embed/1zr-6k7Gc5s','Openload',26),(51,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',27),(52,'https://openload.co/embed/1zr-6k7Gc5s','Openload',27),(53,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',28),(54,'https://openload.co/embed/1zr-6k7Gc5s','Openload',28),(55,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',29),(56,'https://openload.co/embed/1zr-6k7Gc5s','Openload',29),(57,'https://drive.google.com/file/d/1_QvyIfknydBBEpFXQ19aEMjtZJlvw__M/preview','Google Drive',30),(58,'https://openload.co/embed/1zr-6k7Gc5s','Openload',30);
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

-- Dump completed on 2018-01-08 11:55:20
