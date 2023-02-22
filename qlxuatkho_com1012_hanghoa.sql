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
-- Table structure for table `hanghoa`
--

DROP TABLE IF EXISTS `hanghoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hanghoa` (
  `MAHH` char(4) NOT NULL,
  `TENHH` varchar(30) NOT NULL,
  `DONVT` varchar(15) NOT NULL,
  `DONGIA` double NOT NULL,
  `MALOAI` char(4) DEFAULT NULL,
  PRIMARY KEY (`MAHH`),
  KEY `LOAI` (`MALOAI`),
  CONSTRAINT `hanghoa_ibfk_1` FOREIGN KEY (`MALOAI`) REFERENCES `loaihang` (`MALOAI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hanghoa`
--

LOCK TABLES `hanghoa` WRITE;
/*!40000 ALTER TABLE `hanghoa` DISABLE KEYS */;
INSERT INTO `hanghoa` VALUES ('AK01','Áo khoát KaKi nữ hàn Quốc','Cái',285000,'TTNU'),('AK02','Áo khoát nữ dáng dài','cái',675000,'TTNU'),('AO01','Áo thun bé trai ngắn tay','Cái',85000,'TTTE'),('AO02','Áo khoát lửng trẻ em cao cấp','Cái',320000,'TTTE'),('BO01','Bộ thun trẻ em','Bộ',280000,'TTTE'),('DA01','Đầm caro công sở','Cái',252000,'TTNU'),('DP01','Đồng phục học sinh','Bộ',162000,'DPHS'),('DP02','Đồng phục học sinh THCS','Bộ',220000,'DPHS'),('SM01','Áo sơ mi nam','Cái',315000,'TTNA'),('SM02','Sơ mi ngắn tay cổ trụ','Cái',285000,'TTNA');
/*!40000 ALTER TABLE `hanghoa` ENABLE KEYS */;
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
