-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: qlxuatkho_com1012
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cuahang`
--

DROP TABLE IF EXISTS `cuahang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cuahang` (
  `MACH` char(4) NOT NULL,
  `TENCH` varchar(120) NOT NULL,
  `DIACHI` varchar(50) NOT NULL,
  `SODT` varchar(15) NOT NULL,
  `EMAIL` varchar(20) DEFAULT NULL,
  `NGUOIDD` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MACH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuahang`
--

LOCK TABLES `cuahang` WRITE;
/*!40000 ALTER TABLE `cuahang` DISABLE KEYS */;
INSERT INTO `cuahang` VALUES ('CH01','Vân Thanh Fashion – Chi nhánh Quận 5','123 Nguyễn Trãi, Quận 5, Tp.HCM','0909099099','thanhtt@gmail.com','Trần Tuấn Thành'),('CH02','Vân Thanh Fashion – TTTM AERON TÂN PHÚ','30 Bờ Bao Tân Thắng, Quận Tân Phú, Tp.HCM','0909099099','areontp@gmail.com','Nguyễn Thành Công'),('CH05','Vân Thanh Fashion – Chi nhánh Hà Nội','123 Nguyễn Trãi, Quận 5, Tp.HCM','0909099099',NULL,'Trần Quốc Hậu');
/*!40000 ALTER TABLE `cuahang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-16 17:01:03
