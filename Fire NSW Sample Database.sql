-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: country_fire_authority
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brigade`
--

DROP TABLE IF EXISTS `brigade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brigade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brigade_name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brigade`
--

LOCK TABLES `brigade` WRITE;
/*!40000 ALTER TABLE `brigade` DISABLE KEYS */;
INSERT INTO `brigade` VALUES (1,'Fire Brigade'),(2,'Forest Industry Brigade'),(3,'Coastguard Brigade');
/*!40000 ALTER TABLE `brigade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_contact`
--

DROP TABLE IF EXISTS `emergency_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mem_id` int DEFAULT NULL,
  `contact_name` varchar(50) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mem_id` (`mem_id`),
  CONSTRAINT `emergency_contact_ibfk_1` FOREIGN KEY (`mem_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_contact`
--

LOCK TABLES `emergency_contact` WRITE;
/*!40000 ALTER TABLE `emergency_contact` DISABLE KEYS */;
INSERT INTO `emergency_contact` VALUES (1,1,'Indiana J Hobler','0353331515'),(2,1,'Gemma R Nicoll','039838 8257'),(3,2,'Hayley J Stoate','0353647075'),(4,3,'Samantha W Sunners','0390766934'),(5,4,'Cooper S Bryant','0353505417'),(6,5,'Caitlin M Bryce','0390766934'),(7,6,'Archer M Barraclough','0353968922'),(8,7,'Chelsea Z Buvelot','0392039011'),(9,8,'Michael R Cottee','0399591005'),(10,9,'Luke M Kauper','0353983138'),(11,10,'Alana Z Stevenson','0353758063');
/*!40000 ALTER TABLE `emergency_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `model` varchar(15) NOT NULL,
  `make_year` year NOT NULL,
  `capacity` varchar(5) DEFAULT NULL,
  `mobility` enum('y','n') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'Tanker','2x2A2011',1989,'3000','y'),(2,'Tanker','4X4A2022',2004,'3000','y'),(3,'Pumper','A214448',2001,'2000','n'),(4,'Aerial Vehicle','P2005',2005,'','y'),(5,'Aerial Vehicle','NP1996',1996,'','y'),(6,'All Terrain Vehicle','CTD1998',1998,'2000','y'),(7,'Rescue Vehicle','ZYD1999',1999,'','y'),(8,'Hazardous Materials Incident Vehicle','HZ2011',2011,'','y'),(9,'Mobile Communications Vehicle','KY2004',2004,'','y'),(10,'Quick Attack Vehicle','DZ2005',2005,'1500','y'),(11,'Protective Equipment Vehicle','DK2006',2006,'','y');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incident_equipment`
--

DROP TABLE IF EXISTS `incident_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident_equipment` (
  `incident_id` int NOT NULL,
  `equipment_id` int NOT NULL,
  KEY `incident_id` (`incident_id`),
  KEY `equipment_id` (`equipment_id`),
  CONSTRAINT `incident_equipment_ibfk_1` FOREIGN KEY (`incident_id`) REFERENCES `incidents` (`id`),
  CONSTRAINT `incident_equipment_ibfk_2` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident_equipment`
--

LOCK TABLES `incident_equipment` WRITE;
/*!40000 ALTER TABLE `incident_equipment` DISABLE KEYS */;
INSERT INTO `incident_equipment` VALUES (1,6),(2,6),(3,6),(4,6),(5,3),(6,7),(7,7),(8,7),(9,7),(10,7);
/*!40000 ALTER TABLE `incident_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incident_member`
--

DROP TABLE IF EXISTS `incident_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident_member` (
  `incident_id` int NOT NULL,
  `mem_id` int NOT NULL,
  KEY `incident_id` (`incident_id`),
  KEY `mem_id` (`mem_id`),
  CONSTRAINT `incident_member_ibfk_1` FOREIGN KEY (`incident_id`) REFERENCES `incidents` (`id`),
  CONSTRAINT `incident_member_ibfk_2` FOREIGN KEY (`mem_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident_member`
--

LOCK TABLES `incident_member` WRITE;
/*!40000 ALTER TABLE `incident_member` DISABLE KEYS */;
INSERT INTO `incident_member` VALUES (1,2),(1,3),(1,4),(1,9),(2,1),(3,5),(4,9),(5,7),(9,7),(10,1);
/*!40000 ALTER TABLE `incident_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incident_station`
--

DROP TABLE IF EXISTS `incident_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident_station` (
  `incident_id` int DEFAULT NULL,
  `stat_id` int NOT NULL,
  KEY `stat_id` (`stat_id`),
  KEY `incident_id` (`incident_id`),
  CONSTRAINT `incident_station_ibfk_1` FOREIGN KEY (`stat_id`) REFERENCES `stations` (`id`),
  CONSTRAINT `incident_station_ibfk_2` FOREIGN KEY (`incident_id`) REFERENCES `incidents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident_station`
--

LOCK TABLES `incident_station` WRITE;
/*!40000 ALTER TABLE `incident_station` DISABLE KEYS */;
INSERT INTO `incident_station` VALUES (1,1),(2,3),(3,4),(3,5),(4,1),(5,1),(6,1),(7,5),(8,10),(9,10),(10,6);
/*!40000 ALTER TABLE `incident_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `description` tinytext NOT NULL,
  `location` varchar(100) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents`
--

LOCK TABLES `incidents` WRITE;
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` VALUES (1,'Urban','Low intensity fire ','122 Albert St, Port Melbourne, VIC 3207','2020-02-05 01:31:51','2020-02-10 22:31:51'),(2,'Urban','Moderate intensity fire ','99 Beacon Rd, Port Melbourne, VIC 3207','2020-02-01 01:14:51','2020-02-02 22:19:52'),(3,'Urban','High intensity fire ','128 Farrell St, Port Melbourne, VIC 3207','2020-02-05 02:31:51','2020-05-15 19:31:53'),(4,'Rural Fire','Low intensity fire ','463 Victoria St, West Melbourne, VIC 3003','2020-10-05 16:31:51','2020-10-05 17:31:54'),(5,'Rural Fire','Medium intensity fire','117 Farrell St, Port Melbourne, VIC 3207','2020-07-07 19:31:51','2020-07-09 21:31:55'),(6,'Rural Fire','High intensity fire','12 Hotham St, South Melbourne, VIC 3205','2020-10-17 16:31:51','2020-10-18 22:31:56'),(7,'Forest Fire','Low intensity fire','Redwood Forest','2020-09-04 11:31:51','2020-09-15 19:31:57'),(8,'Forest Fire','Medium intensity fire','Redwood Forest','2020-12-01 10:31:14','2020-12-08 19:31:58'),(9,'Forest Fire','High intensity fire','Redwood Forest','2020-12-09 17:31:51','2020-12-15 23:00:00'),(10,'Urban','Low intensity fire','7 Orion Mews, Port Melbourne, VIC 3207','2020-12-05 01:31:21','2020-12-30 22:31:41');
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('male','female','unspecified') DEFAULT NULL,
  `phone_number` varchar(12) NOT NULL,
  `email_id` varchar(62) NOT NULL,
  `city` varchar(35) NOT NULL,
  `street_address` varchar(95) NOT NULL,
  `monetary_status` varchar(12) NOT NULL,
  `pincode` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'Tahlia ','J Mulligan','1972-09-21','female','0355501193','nxfv9szowk@powerencry.com','Mirimbah','94 Harris Street','Paid','3201'),(2,'Madeleine','T Hayman','1987-04-23','female','0370105830','xb9kb9sl7nb@gmail.com','Knox City Centre','85 Boughtman Street','Paid','3202'),(3,'Lola ','J McGavin','1987-01-21','female','0355505673','4xv8vi49wurm@gmail.com','Coalville','95 Maintongoon Road','Paid','3203'),(4,'Madeleine','T Baillieu','1997-04-18','female','0370105907','h4mzii9ikxa@gmail.com','Eurobin','29 Villeneuve Street','Paid','3204'),(5,'Sofia ','O Corlette','1974-06-04','female','0355508449','ut4y1w42tle@gmail.com','Jericho','15 Maintongoon Road','Paid','3205'),(6,'Timothy','E Rosenstengel ','1986-04-16','female','0370106564','imgkz0r84o@gmail.com','Weaponah','26 Shell Road','Paid','3206'),(7,'Mitchell','P Harries','1983-04-14','male','0370104944','t1exnxemla@gmail.com','Maindample','91 Myrtle Street','Paid','3211'),(8,'Tristan','M Jageurs','1972-11-09','male','0355502619','6pjal7b13wc@gmail.com','Sout Dudley','68 Mills Street','Paid','3213'),(9,'Samantha','R Edward','1996-09-05','female','0370106788','zc9z6euklp9@gmail.com','Morissons','40 Little Myers Street','Paid','3212'),(10,'Lilly','M Bruton','1984-02-20','female','0370102497','mpnmtcchjj@gmail.com','Hawksburn','95 Patton Street','Paid','3213');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_brigade`
--

DROP TABLE IF EXISTS `member_brigade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_brigade` (
  `mem_id` int NOT NULL,
  `brigade_id` int NOT NULL,
  KEY `mem_id` (`mem_id`),
  KEY `brigade_id` (`brigade_id`),
  CONSTRAINT `member_brigade_ibfk_1` FOREIGN KEY (`mem_id`) REFERENCES `member` (`id`),
  CONSTRAINT `member_brigade_ibfk_2` FOREIGN KEY (`brigade_id`) REFERENCES `brigade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_brigade`
--

LOCK TABLES `member_brigade` WRITE;
/*!40000 ALTER TABLE `member_brigade` DISABLE KEYS */;
INSERT INTO `member_brigade` VALUES (1,1),(1,2),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1);
/*!40000 ALTER TABLE `member_brigade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mem_id` int NOT NULL,
  `stat_id` int NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mem_id` (`mem_id`),
  KEY `stat_id` (`stat_id`),
  CONSTRAINT `shifts_ibfk_1` FOREIGN KEY (`mem_id`) REFERENCES `member` (`id`),
  CONSTRAINT `shifts_ibfk_2` FOREIGN KEY (`stat_id`) REFERENCES `stations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` VALUES (1,1,1,'2020-01-01','01:00:00','03:00:00'),(2,2,1,'2020-01-01','03:00:00','06:00:00'),(3,3,1,'2020-01-01','06:00:00','09:00:00'),(4,4,1,'2020-01-01','09:00:00','12:00:00'),(5,5,1,'2020-01-01','12:00:00','02:00:00'),(6,6,1,'2020-01-01','02:00:00','05:00:00'),(7,7,1,'2020-01-01','05:00:00','08:00:00'),(8,8,1,'2020-01-01','08:00:00','11:00:00'),(9,9,1,'2020-01-01','11:00:00','14:00:00'),(10,10,1,'2020-01-01','14:00:00','17:00:00');
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station_equipment`
--

DROP TABLE IF EXISTS `station_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station_equipment` (
  `equipment_id` int NOT NULL,
  `stat_id` int NOT NULL,
  `no_of_vehicle` int NOT NULL,
  KEY `equipment_id` (`equipment_id`),
  KEY `stat_id` (`stat_id`),
  CONSTRAINT `station_equipment_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`),
  CONSTRAINT `station_equipment_ibfk_2` FOREIGN KEY (`stat_id`) REFERENCES `stations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station_equipment`
--

LOCK TABLES `station_equipment` WRITE;
/*!40000 ALTER TABLE `station_equipment` DISABLE KEYS */;
INSERT INTO `station_equipment` VALUES (1,1,5),(10,1,1),(8,1,2),(1,4,8),(1,5,4),(1,6,2),(1,7,3),(1,8,10),(1,9,4),(1,10,8);
/*!40000 ALTER TABLE `station_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `operation_type` varchar(40) NOT NULL,
  `location` varchar(95) NOT NULL,
  `phone_number` char(10) NOT NULL,
  `build_date` date NOT NULL,
  `station_master` varchar(50) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (1,'Integrated and career fire station','192 Albert St, Port Melbourne, VIC 3207','0355500373','1983-06-22','Lennie Kelly','Albryt  Station'),(2,'Integrated and career fire station','77 Beacon Rd, Port Melbourne, VIC 3207','0375909868','1984-12-14','Rudy Richardson','Beacon Station'),(3,'Integrated and career fire station','177 Cecil St, South Melbourne, VIC 3205','0393300141','1985-06-19','Jonah Harrison','Cecil Station'),(4,'Urban Fire Station','12 Hotham St, South Melbourne, VIC 3205','0398922003','1987-04-15','Solomon Wells','Hotham Station'),(5,'Urban Fire Station','149 Alfred St, North Melbourne, VIC 3051','0352793680','1988-11-15','Clayton Sutton','Alfred Station'),(6,'Urban Fire Station','463 George St, West Melbourne, VIC 3003','0356220742','1990-12-26','Eddie Cox','George Station'),(7,'Rural Fire Station','463 Albert St, Hume, VIC 5001','0397899555','1992-10-29','Samuel Burns','Albert Station'),(8,'Rural Fire Station','527 Damon St, Gippsland, VIC 6002','0375106004','2005-01-17','Cameron Thomson','Damon Station'),(9,'Rural Fire Station','96 Pitt St, Gippsland, VIC 6003','0375106004','2006-07-13','Luka Saunders','Pitthurst Station'),(10,'Integrated and career fire station','100 Broadway St, Port Melbourne, VIC 3209','0365500475','2012-11-21','Sami Black','Broadway Station');
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-02 22:23:29
