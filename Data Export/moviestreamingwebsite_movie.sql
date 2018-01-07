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
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `idMovie` int(11) NOT NULL AUTO_INCREMENT,
  `movieName` varchar(100) NOT NULL,
  `movieDescription` varchar(300) NOT NULL,
  `moviePosterLink` varchar(200) NOT NULL,
  `movieTrailerLink` varchar(200) NOT NULL,
  `country` varchar(45) NOT NULL,
  `year` int(11) NOT NULL,
  `length` varchar(45) NOT NULL,
  `idCategory` int(11) NOT NULL,
  PRIMARY KEY (`idMovie`),
  KEY `fk_Movie_Category1_idx` (`idCategory`),
  CONSTRAINT `fk_Movie_Category1` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Please Love the Useless Me 1','Landjaeger short loin tenderloin beef pork chop short ribs. Biltong ground round pork cow pastrami corned beef turkey leberkas tongue. Ground round salami jowl strip steak, bacon kielbasa pork loin shank landjaeger. Ham tri-tip corned beef alcatra. Pork belly flank alcatra.','https://images-na.ssl-images-amazon.com/images/M/MV5BMmI5Nzk1NGMtM2E1ZS00OTk2LWJlMDQtYTdkMmE4OGE2ZjRlXkEyXkFqcGdeQXVyMzE4MDkyNTA@._V1_SX300.jpg','https://www.youtube.com/embed/nQSUiHYl850','Unknown',2013,'Unknown',2),(2,'Please Love the Useless Me 2','Cupim kevin ground round, jerky tenderloin sausage spare ribs salami ball tip shoulder filet mignon hamburger.','https://images-na.ssl-images-amazon.com/images/M/MV5BMjE0MTkzMDYxM15BMl5BanBnXkFtZTgwNjUxNjIzMTE@._V1_SX300.jpg','https://www.youtube.com/embed/5epiukj1KBU','Unknown',1952,'Unknown',1),(3,'Please Love the Useless Me ','Beef ribs bacon doner, tongue alcatra ground round sausage frankfurter rump burgdoggen swine shankle. Burgdoggen tenderloin picanha shankle buffalo sirloin andouille tail doner landjaeger','https://images-na.ssl-images-amazon.com/images/M/MV5BM2Y5Y2RkMDUtNjYxNy00OTkxLTk2OTMtMzdiYWYyMTJiY2EzXkEyXkFqcGdeQXVyNzU2NjMxOTk@._V1_SX300.jpg','https://www.youtube.com/embed/ZZWhjac9SfE','Unknown',2011,'Unknown',3),(4,'Please Love the Useless Me 4','Beef ribs bacon doner, tongue alcatra ground round sausage frankfurter rump burgdoggen swine shankle. Burgdoggen tenderloin picanha shankle buffalo sirloin andouille tail doner landjaeger','https://images-na.ssl-images-amazon.com/images/M/MV5BMGJjYWFlZWItODZmNi00NmQ5LWI4YTYtMjJjM2QxMDZhNWYyXkEyXkFqcGdeQXVyMzE4MDkyNTA@._V1_SX300.jpg','https://www.youtube.com/embed/nQSUiHYl850','Unknown',2016,'Unknown',2),(5,'Please Love the Useless Me 5','Pastrami meatloaf cupim, shank swine ribeye ham hock kevin bresaola strip steak meatball cow andouille turkey short ribs. Meatloaf swine rump turkey chicken porchetta picanha pork loin tail doner pork chop chuck','https://images-na.ssl-images-amazon.com/images/M/MV5BMDY1OTYxNWYtZGUyNC00NDE2LTkxMmItYzFjOTNmZDk4MjA0XkEyXkFqcGdeQXVyMzE4MDkyNTA@._V1_SX300.jpg','https://www.youtube.com/embed/nQSUiHYl850','Unknown',2009,'Unknown',6),(6,'Please Love the Useless Me 6','Frankfurter pork chop pork loin turkey, beef leberkas tenderloin drumstick chicken filet mignon spare ribs chuck cupim burgdoggen. Bacon fatback ball tip short loin hamburger','https://images-na.ssl-images-amazon.com/images/M/MV5BMTUxNzk3MDQyNl5BMl5BanBnXkFtZTgwNDgxMDkyMzI@._V1_SX300.jpg','https://www.youtube.com/embed/nQSUiHYl850','Unknown',2010,'Unknown',8),(7,'Please Love the Useless Me 8','Frankfurter pork chop pork loin turkey, beef leberkas tenderloin drumstick chicken filet mignon spare ribs chuck cupim burgdoggen. Bacon fatback ball tip short loin hamburger','https://images-na.ssl-images-amazon.com/images/M/MV5BMTUxNzk3MDQyNl5BMl5BanBnXkFtZTgwNDgxMDkyMzI@._V1_SX300.jpg','https://www.youtube.com/embed/nQSUiHYl850','Unknown',2015,'Unknown',4),(8,'Please Love the Useless Me 9','Frankfurter pork chop pork loin turkey, beef leberkas tenderloin drumstick chicken filet mignon spare ribs chuck cupim burgdoggen. Bacon fatback ball tip short loin hamburger','https://images-na.ssl-images-amazon.com/images/M/MV5BMTUxNzk3MDQyNl5BMl5BanBnXkFtZTgwNDgxMDkyMzI@._V1_SX300.jpg','https://www.youtube.com/embed/nQSUiHYl850','Unknown',2015,'Unknown',3),(9,'Please Love the Useless Me 10','Frankfurter pork chop pork loin turkey, beef leberkas tenderloin drumstick chicken filet mignon spare ribs chuck cupim burgdoggen. Bacon fatback ball tip short loin hamburger','https://images-na.ssl-images-amazon.com/images/M/MV5BMGJjYWFlZWItODZmNi00NmQ5LWI4YTYtMjJjM2QxMDZhNWYyXkEyXkFqcGdeQXVyMzE4MDkyNTA@._V1_SX300.jpg','https://www.youtube.com/embed/nQSUiHYl850','Unknown',2015,'Unknown',2),(10,'Please Love the Useless Me 11','Frankfurter pork chop pork loin turkey, beef leberkas tenderloin drumstick chicken filet mignon spare ribs chuck cupim burgdoggen. Bacon fatback ball tip short loin hamburger','https://images-na.ssl-images-amazon.com/images/M/MV5BMTUxNzk3MDQyNl5BMl5BanBnXkFtZTgwNDgxMDkyMzI@._V1_SX300.jpg','https://www.youtube.com/embed/nQSUiHYl850','Unknown',2015,'Unknown',8),(11,'Please Love the Useless Me 11','Frankfurter pork chop pork loin turkey, beef leberkas tenderloin drumstick chicken filet mignon spare ribs chuck cupim burgdoggen. Bacon fatback ball tip short loin hamburger','https://images-na.ssl-images-amazon.com/images/M/MV5BMTUxNzk3MDQyNl5BMl5BanBnXkFtZTgwNDgxMDkyMzI@._V1_SX300.jpg','https://www.youtube.com/embed/nQSUiHYl850','Unknown',2015,'Unknown',7),(12,'Please Love the Useless Me 12','Frankfurter pork chop pork loin turkey, beef leberkas tenderloin drumstick chicken filet mignon spare ribs chuck cupim burgdoggen. Bacon fatback ball tip short loin hamburger','https://images-na.ssl-images-amazon.com/images/M/MV5BMTUxNzk3MDQyNl5BMl5BanBnXkFtZTgwNDgxMDkyMzI@._V1_SX300.jpg','https://www.youtube.com/embed/nQSUiHYl850','Unknown',2015,'Unknown',6),(13,'Please Love the Useless Me 13','Frankfurter pork chop pork loin turkey, beef leberkas tenderloin drumstick chicken filet mignon spare ribs chuck cupim burgdoggen. Bacon fatback ball tip short loin hamburger','https://images-na.ssl-images-amazon.com/images/M/MV5BMTUxNzk3MDQyNl5BMl5BanBnXkFtZTgwNDgxMDkyMzI@._V1_SX300.jpg','https://www.youtube.com/embed/nQSUiHYl850','Unknown',2015,'Unknown',5),(14,'Please Love the Useless Me 14','Frankfurter pork chop pork loin turkey, beef leberkas tenderloin drumstick chicken filet mignon spare ribs chuck cupim burgdoggen. Bacon fatback ball tip short loin hamburger','https://images-na.ssl-images-amazon.com/images/M/MV5BMTUxNzk3MDQyNl5BMl5BanBnXkFtZTgwNDgxMDkyMzI@._V1_SX300.jpg','https://www.youtube.com/embed/nQSUiHYl850','Unknown',2015,'Unknown',4);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-12  6:02:48
