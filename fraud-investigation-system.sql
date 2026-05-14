-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (x86_64)
--
-- Host: 127.0.0.1    Database: fraud_investigation_system
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `flag_reviews`
--

DROP TABLE IF EXISTS `flag_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flag_reviews` (
  `investigator_id` int NOT NULL,
  `flag_id` int NOT NULL,
  `review_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`investigator_id`,`flag_id`),
  KEY `flag_id` (`flag_id`),
  CONSTRAINT `flag_reviews_ibfk_1` FOREIGN KEY (`investigator_id`) REFERENCES `investigators` (`investigator_id`),
  CONSTRAINT `flag_reviews_ibfk_2` FOREIGN KEY (`flag_id`) REFERENCES `flags` (`flag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flag_reviews`
--

LOCK TABLES `flag_reviews` WRITE;
/*!40000 ALTER TABLE `flag_reviews` DISABLE KEYS */;
INSERT INTO `flag_reviews` VALUES (1,1,'Under Review'),(1,2,'Under Review'),(2,1,'Reviewed');
/*!40000 ALTER TABLE `flag_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flags`
--

DROP TABLE IF EXISTS `flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flags` (
  `flag_id` int NOT NULL AUTO_INCREMENT,
  `txn_id` int DEFAULT NULL,
  `flag_reason` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`flag_id`),
  KEY `txn_id` (`txn_id`),
  CONSTRAINT `flags_ibfk_1` FOREIGN KEY (`txn_id`) REFERENCES `transactions` (`txn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flags`
--

LOCK TABLES `flags` WRITE;
/*!40000 ALTER TABLE `flags` DISABLE KEYS */;
INSERT INTO `flags` VALUES (1,102,'High Value','2026-05-02 15:14:25'),(2,104,'High Value','2026-05-02 15:14:25'),(4,102,'Odd Hour Activity','2026-05-02 15:15:17'),(5,104,'Odd Hour Activity','2026-05-02 15:15:17');
/*!40000 ALTER TABLE `flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investigators`
--

DROP TABLE IF EXISTS `investigators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investigators` (
  `investigator_id` int NOT NULL,
  `investigator_name` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`investigator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investigators`
--

LOCK TABLES `investigators` WRITE;
/*!40000 ALTER TABLE `investigators` DISABLE KEYS */;
INSERT INTO `investigators` VALUES (1,'Arjun','Fraud Ops'),(2,'Meera','Risk Analysis');
/*!40000 ALTER TABLE `investigators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_assessment`
--

DROP TABLE IF EXISTS `risk_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_assessment` (
  `assessment_id` int NOT NULL AUTO_INCREMENT,
  `txn_id` int DEFAULT NULL,
  `risk_score` int DEFAULT NULL,
  `classification` varchar(10) DEFAULT NULL,
  `investigator_notes` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`assessment_id`),
  UNIQUE KEY `txn_id` (`txn_id`),
  CONSTRAINT `risk_assessment_ibfk_1` FOREIGN KEY (`txn_id`) REFERENCES `transactions` (`txn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_assessment`
--

LOCK TABLES `risk_assessment` WRITE;
/*!40000 ALTER TABLE `risk_assessment` DISABLE KEYS */;
INSERT INTO `risk_assessment` VALUES (1,101,0,'NORMAL','No issues'),(2,102,80,'FRAUD','High-value anomaly'),(3,103,0,'NORMAL','No issues'),(4,104,80,'FRAUD','High-value anomaly');
/*!40000 ALTER TABLE `risk_assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `txn_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `txn_time` datetime DEFAULT NULL,
  `txn_type` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`txn_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (101,1,500.00,'2026-05-01 10:00:00','UPI','success'),(102,1,70000.00,'2026-05-01 02:00:00','UPI','success'),(103,2,1200.00,'2026-05-01 13:00:00','card','success'),(104,3,60000.00,'2026-05-01 03:30:00','wallet','success');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `account_created_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Rahul','India','2024-01-10'),(2,'Ayesha','India','2024-03-14'),(3,'John','USA','2023-11-20');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-14 21:46:55
