-- MySQL dump 10.13  Distrib 5.7.42, for Linux (x86_64)
--
-- Host: localhost    Database: dental
-- ------------------------------------------------------
-- Server version	5.7.42-0ubuntu0.18.04.1

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointments` (
  `appointmentid` int(11) NOT NULL,
  `patientid` int(11) DEFAULT NULL,
  `dentistid` int(11) DEFAULT NULL,
  `procedureid` int(11) DEFAULT NULL,
  PRIMARY KEY (`appointmentid`),
  KEY `patientid` (`patientid`),
  KEY `dentistid` (`dentistid`),
  KEY `procedureid` (`procedureid`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patientid`) REFERENCES `patients` (`patientid`),
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`dentistid`) REFERENCES `dentists` (`dentistid`),
  CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`procedureid`) REFERENCES `procedures` (`procedureid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,1,1,1),(2,2,1,1),(3,3,2,2),(4,4,2,2);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dentists`
--

DROP TABLE IF EXISTS `dentists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dentists` (
  `dentistid` int(11) NOT NULL,
  `dname` varchar(15) DEFAULT NULL,
  `dnumber` varchar(20) DEFAULT NULL,
  `staffid` int(11) DEFAULT NULL,
  PRIMARY KEY (`dentistid`),
  KEY `staffid` (`staffid`),
  CONSTRAINT `dentists_ibfk_1` FOREIGN KEY (`staffid`) REFERENCES `staff` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dentists`
--

LOCK TABLES `dentists` WRITE;
/*!40000 ALTER TABLE `dentists` DISABLE KEYS */;
INSERT INTO `dentists` VALUES (1,'Joe','8343434653',4),(2,'Jose','8434343566',5);
/*!40000 ALTER TABLE `dentists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalhistory`
--

DROP TABLE IF EXISTS `medicalhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicalhistory` (
  `medicalhistoryid` int(11) NOT NULL,
  `patientid` int(11) DEFAULT NULL,
  `procedureid` int(11) DEFAULT NULL,
  `datevisited` date DEFAULT NULL,
  PRIMARY KEY (`medicalhistoryid`),
  KEY `patientid` (`patientid`),
  KEY `procedureid` (`procedureid`),
  CONSTRAINT `medicalhistory_ibfk_1` FOREIGN KEY (`patientid`) REFERENCES `patients` (`patientid`),
  CONSTRAINT `medicalhistory_ibfk_2` FOREIGN KEY (`procedureid`) REFERENCES `procedures` (`procedureid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalhistory`
--

LOCK TABLES `medicalhistory` WRITE;
/*!40000 ALTER TABLE `medicalhistory` DISABLE KEYS */;
INSERT INTO `medicalhistory` VALUES (1,1,1,'2023-09-04'),(2,1,2,'2023-09-03'),(3,1,3,'2023-09-05');
/*!40000 ALTER TABLE `medicalhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `patientid` int(11) NOT NULL,
  `pname` varchar(20) DEFAULT NULL,
  `pnumber` varchar(10) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`patientid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Anvin','9837623434','anvin@email.com'),(2,'Anurag','9837634343','anurag@email.com'),(3,'Jacob','7777634343','jacob@email.com'),(4,'John','9833434347','john@email.com'),(5,'Aqeel','9834343377','aqeel@email.com'),(6,'Emily','9837623435','emily@email.com'),(7,'Michael','7777634344','michael@email.com'),(8,'Sophia','9833434348','sophia@email.com'),(9,'William','9834343378','william@email.com'),(10,'Olivia','9837623436','olivia@email.com'),(11,'James','7777634345','james@email.com'),(12,'Ann','9833434349','ava@email.com'),(13,'Benjamin','9834343379','benjamin@email.com'),(14,'Emma','9837623437','emma@email.com'),(15,'Liam H.','7777634346','liam@email.com'),(16,'Gregory','4747473288','greg@kgb.gov.ru'),(17,'Anna','7837373733','anna@gmail.com'),(18,'Anu','9898973625','anu@gmail.com');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `paymentid` int(11) NOT NULL,
  `patientid` int(11) DEFAULT NULL,
  `appointmentid` int(11) DEFAULT NULL,
  `paymentdate` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`paymentid`),
  KEY `patientid` (`patientid`),
  KEY `appointmentid` (`appointmentid`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`patientid`) REFERENCES `patients` (`patientid`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`appointmentid`) REFERENCES `appointments` (`appointmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,3,2,'2023-09-04',100),(2,1,3,'2023-09-05',200),(3,2,1,'2023-09-06',300),(4,4,4,'2023-09-07',150),(5,5,3,'2023-09-08',250),(6,3,4,'2023-09-09',500),(7,2,2,'2023-09-10',200),(8,1,3,'2023-09-11',300),(9,5,1,'2023-09-12',350),(10,4,2,'2023-09-13',600),(11,3,1,'2023-09-14',700),(12,2,4,'2023-09-15',800),(13,1,3,'2023-09-16',1000),(14,5,2,'2023-09-17',120);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedures`
--

DROP TABLE IF EXISTS `procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedures` (
  `procedureid` int(11) NOT NULL,
  `procedurename` varchar(20) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`procedureid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedures`
--

LOCK TABLES `procedures` WRITE;
/*!40000 ALTER TABLE `procedures` DISABLE KEYS */;
INSERT INTO `procedures` VALUES (1,'Teeth Cleaning',100),(2,'Tooth Extraction',200),(3,'Dental Filling',300),(4,'Root Canal',500),(5,'Teeth Whitening',250),(6,'Dental Implant',1000),(7,'Orthodontic Braces',800),(9,'Dental Crown',400),(10,'Gum Surgery',700),(12,'Dental Bridge',600),(13,'Dental Veneers',300);
/*!40000 ALTER TABLE `procedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `staffid` int(11) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `snumber` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Mohammed','Receptionalist','6543434367'),(2,'Maya','Assistant','4563434354'),(3,'Mohan','Hygienist','6543434887'),(4,'Joe','Dentist','8343434653'),(5,'Jose','Dentist','8434343566'),(6,'Samantha','Hygienist','1234567890'),(7,'David','Dentist','2345678901'),(8,'Sophie','Receptionalist','3456789012'),(9,'Ethan','Assistant','4567890123'),(10,'Isabella','Hygienist','5678901234'),(11,'Liam','Dentist','6789012345'),(12,'Olivia','Assistant','7890123456'),(13,'Noah','Hygienist','8901234567'),(14,'Ava','Receptionalist','9012345678'),(15,'Lucas','Dentist','9876543210');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp` (
  `rollno` int(11) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp`
--

LOCK TABLES `temp` WRITE;
/*!40000 ALTER TABLE `temp` DISABLE KEYS */;
INSERT INTO `temp` VALUES (2,23232),(2,2322),(3,3434),(2,2322),(3,3434);
/*!40000 ALTER TABLE `temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v1`
--

DROP TABLE IF EXISTS `v1`;
/*!50001 DROP VIEW IF EXISTS `v1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v1` AS SELECT 
 1 AS `patientid`,
 1 AS `pname`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v1`
--

/*!50001 DROP VIEW IF EXISTS `v1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v1` AS select `patients`.`patientid` AS `patientid`,`patients`.`pname` AS `pname` from `patients` where (`patients`.`patientid` > 15) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-22 15:33:23
