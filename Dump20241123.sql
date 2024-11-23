-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: dbcrm
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activity_date` date DEFAULT NULL,
  `activity_type` enum('CALL','EMAIL','MEETING') DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `agent_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5e5e4kako2wsalpuxg44tky33` (`agent_id`),
  KEY `FKse269fvw3ft70lc8sf7mp5kpo` (`customer_id`),
  CONSTRAINT `FK5e5e4kako2wsalpuxg44tky33` FOREIGN KEY (`agent_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKse269fvw3ft70lc8sf7mp5kpo` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'2024-11-18','CALL','TEST',17,1),(2,'2024-11-18','CALL','TEST',17,1),(3,'2024-11-21','EMAIL','TTTTT',21,2),(4,'2024-11-21','MEETING','KREizy',21,1),(5,'2024-11-23','EMAIL','byhfgytf',8,4);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Dhaka','test@email.com','Customer 1','01700000000'),(2,'CTG 2','test@email.com','Customer 420','01700000000'),(4,'sdry','ok@aa.v','yreyre','54862');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT NULL,
  `activity_id` bigint DEFAULT NULL,
  `sales_executive_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKi2aji3pbs3dxrr4mowpriekt` (`activity_id`),
  KEY `FKm5oib60ypxwschne1tt98bvy0` (`sales_executive_id`),
  CONSTRAINT `FK1m7exg3ult1jnak8w64m8vdoq` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`),
  CONSTRAINT `FKm5oib60ypxwschne1tt98bvy0` FOREIGN KEY (`sales_executive_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
INSERT INTO `leads` VALUES (2,'2024-11-18',1,13);
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKq89usen27cbednlrjldh8mpgo` (`product_id`),
  CONSTRAINT `FKq89usen27cbednlrjldh8mpgo` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_date` datetime(6) DEFAULT NULL,
  `status` enum('APPROVED','DELIVERED','PENDING','REJECTED') DEFAULT NULL,
  `total_amount` double NOT NULL,
  `customer_id` bigint NOT NULL,
  `lead_id` bigint DEFAULT NULL,
  `sold_by` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK624gtjin3po807j3vix093tlf` (`customer_id`),
  KEY `FKginbhj3fpnxvxfiybfkw7hmpv` (`lead_id`),
  KEY `FKhjr8gu5s8t1wjv2a2ke5sp1fj` (`sold_by`),
  CONSTRAINT `FK624gtjin3po807j3vix093tlf` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKginbhj3fpnxvxfiybfkw7hmpv` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`),
  CONSTRAINT `FKhjr8gu5s8t1wjv2a2ke5sp1fj` FOREIGN KEY (`sold_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-11-18 18:10:54.000000','PENDING',60000,1,NULL,13);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order_items`
--

DROP TABLE IF EXISTS `orders_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_order_items` (
  `order_id` bigint NOT NULL,
  `order_items_id` bigint NOT NULL,
  UNIQUE KEY `UK9d47gapmi35omtannusv6btu3` (`order_items_id`),
  KEY `FK3l8rktw0f4w5t6tift31e2d7c` (`order_id`),
  CONSTRAINT `FK3l8rktw0f4w5t6tift31e2d7c` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKsgoyspqft6rmn9a87v1tkl1yx` FOREIGN KEY (`order_items_id`) REFERENCES `orderitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order_items`
--

LOCK TABLES `orders_order_items` WRITE;
/*!40000 ALTER TABLE `orders_order_items` DISABLE KEYS */;
INSERT INTO `orders_order_items` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `orders_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` enum('AVAILABLE','OUT_OF_STOCK') DEFAULT NULL,
  `stock` double NOT NULL,
  `unit_price` double NOT NULL,
  `vat` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Mobile','AVAILABLE',1500,10000,15),(2,'PC','AVAILABLE',1500,50000,15),(4,'OMG2','AVAILABLE',122,122,12);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deadline` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sales_amount` double NOT NULL,
  `target_amount` double NOT NULL,
  `sales_executive_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1yqnjaufgrhm0pr9j8u620dwm` (`sales_executive_id`),
  CONSTRAINT `FKi5otejyympr0u9jygkrhpyhyo` FOREIGN KEY (`sales_executive_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_logged_0ut` bit(1) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe32ek7ixanakfqsdaokm4q9y2` (`user_id`),
  CONSTRAINT `FKe32ek7ixanakfqsdaokm4q9y2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwiaWF0IjoxNzMxNDQwNDg1LCJleHAiOjE3MzE1MjY4ODV9.nKMnQLnQv2gNB8zUJaPcOPS8n1dMvms7dtYPSrHlj7mA3_4wveZ9nCiaXwalBhnl',8),(2,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwiaWF0IjoxNzMxNDQxMTU0LCJleHAiOjE3MzE1Mjc1NTR9.TDx7rIFh4Io_7xGj-hhg94ozJRE1VHbivhmGTAUb7epVgdMDpMknFjQm3KnEYMB8',8),(3,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNDQxNTgyLCJleHAiOjE3MzE1Mjc5ODJ9.6SJWQCH-dm7yu1t5QZU7RTEJRGG3r0guokfHfoX6iKeagtxa8nACvtAfTtognPq6',8),(4,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsMUBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE1MjU3MjMsImV4cCI6MTczMTYxMjEyM30.ioyXsPcEqNVPcMsN9bomXozT9EjXWNPu0-CYblWHajOuRylVxvhJLqANMbz5zOuc',9),(5,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsQGdtYWlsLmNvbSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTczMTUyOTc0NSwiZXhwIjoxNzMxNjE2MTQ1fQ.HRWti91OdTYOpI-rw6DzDzWfxfMAxEPQDdT8AwzydSqWaT78U_zLLG98mVRJIr5H',10),(6,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVscnJyQGdtYWlsLmNvbSIsInJvbGUiOiJBR0VOVCIsImlhdCI6MTczMTUzMDE1OSwiZXhwIjoxNzMxNjE2NTU5fQ.LrC4pJKvciM_5DxluHLjD_yn7UylVT-hYg7qSI6OAiW0_fxSvVRRRHOmcK0fo8Qw',11),(7,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhZ2VudEBnbWFpbC5jb20iLCJyb2xlIjoiU0FMRVNfRVhFQ1VUSVZFIiwiaWF0IjoxNzMxNTMwNDM2LCJleHAiOjE3MzE2MTY4MzZ9.OoY1abi0tuQwnlXQi__O-5sW6q32Pmjs88LIT34UklW1I3XC32u85CFyy2XoFjOw',12),(8,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhdmlqaXRAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMTUzMjUwMSwiZXhwIjoxNzMxNjE4OTAxfQ.wIAGTZFNzgaK-PO-thVXmwZysB3A7W9D72sBuGpWzN38XNnmd-fgcI2Qt-MITTTI',13),(9,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhdmlqaXRAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMTUzNTU5OSwiZXhwIjoxNzMxNjIxOTk5fQ.nuriKvyPFBk86cQeXGqP4uWVseGjjLnXSRja873h1Q8pmy_qzIKutD-zE8aoK3Li',13),(10,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhdmlqaXRAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMTUzNjM5MSwiZXhwIjoxNzMxNjIyNzkxfQ.Kn7QsTrsCucXiq19LMFD-PtfDcIyq6sSpidega376FmtWZLMdJbLd3ql_8FNsX-1',13),(11,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhdmlqaXRAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMTUzNjcyMCwiZXhwIjoxNzMxNjIzMTIwfQ.zx3A1Bxj5CeuFcarm4B1myzgh2nsHdJmHW7adt7G_Ag7X_bDaJoNLQQFRY1FhNR8',13),(12,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhdmlqaXRAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMTUzNjc1NCwiZXhwIjoxNzMxNjIzMTU0fQ.K1SfRPuEqfT4rHgpzCMFTyvwkrX2eOiAnOoQSQOPrH8lbLsvNtaDSjuCA55bJdVD',13),(13,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM2OTY0LCJleHAiOjE3MzE2MjMzNjR9.1ptiTWUwdDh1zsZR0AwPPe1AtjnAZs0tSv61kU79UUbrUxWcdtqvyt2Ha1ixqXpN',8),(14,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3MjUwLCJleHAiOjE3MzE2MjM2NTB9.hmz0Qf_RbECAlmSK0KXxPGvelOQkO-3HfoKguRLHFgb5LgQtL-axNiQnVa9-n-B_',8),(15,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3Mzk5LCJleHAiOjE3MzE2MjM3OTl9.C-qgNFuecYhXZAOgMiX0qjGbxNTzaWulJPuW_jcYjj91uVd4BzUH6UxPDMHxlZtS',8),(16,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3NDI3LCJleHAiOjE3MzE2MjM4Mjd9.l2N9C6H7n0HMz7tdgaMqfRI8Ud4MK7PCcogxjlq6oDY9sq9N65nYNngPaKt6FKD0',8),(17,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3NDMzLCJleHAiOjE3MzE2MjM4MzN9.sBUTXBVbjCq1ENNSqX4IKvXpmSDg8dfXHfjWtrdi-lHu6HsxgYCKX37E-VmQMAKG',8),(18,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3NDUzLCJleHAiOjE3MzE2MjM4NTN9.ZSmw7Ys2RpbAplOrNI_bWdhEssQDBtub2qPvil-nvDtqGV7C7KzHfUTiYnXU94Fl',8),(19,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3NDY2LCJleHAiOjE3MzE2MjM4NjZ9.myNcDgt0TJa_tqmQOxSLe1JDNRjErlJP1TM7huQt_YYF6ch_MyFRixKY9XNPX9O_',8),(20,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3NTIyLCJleHAiOjE3MzE2MjM5MjJ9.vrLnCN9zjLVjEFAlHXmMvYw8cEC2X-HuEvSy1Yy4QNSwu9dPUx394ycZ-iZ1aZpy',8),(21,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhdmlqaXRAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMTUzNzY1MCwiZXhwIjoxNzMxNjI0MDUwfQ.X704uSh95Kf8MMCzyxKdm2MtqpuhREmtqodOYM0Zi9ZF8uU6yXuiIFFSziWXtU7m',13),(22,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3ODc3LCJleHAiOjE3MzE2MjQyNzd9.Zie-BsxlWP-_ga69yl_8XFT5wQgfEAGpPcWIziNjsTctKeLyAECP2wowxP5iLjIU',8),(23,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3ODg5LCJleHAiOjE3MzE2MjQyODl9.uImbDllh6iS0d-R4nfiLEF04TeKNanVglqkEb10rqTsjbAjGDusk430c2WlscvnG',8),(24,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM4MDM3LCJleHAiOjE3MzE2MjQ0Mzd9.OUsYhcKAvBNN0THMUE3DrDnXOxp8RgUnTBJVytk8LWKVIP5PCyY1HOQraCM2ut-g',8),(25,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM4MTYwLCJleHAiOjE3MzE2MjQ1NjB9.8XozDSMSK3FfaoWLpBoKqE3F6XMuKc6rzWWe24QivhhUWDDyJnDmTHEr2GocmW37',8),(26,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM4MjY3LCJleHAiOjE3MzE2MjQ2Njd9.VdxbuHvMYXbKt28XJ1OvtvXmLW3jtJErF8-W9yjJxwCIbBvuoah62-TJY5Kv63JG',8),(27,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhdmlqaXRAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMTUzODI5NiwiZXhwIjoxNzMxNjI0Njk2fQ.p_T6iyX1lPzx5gI3Ls4H_TEp3bq9qA6yQFA6S-V9D3BTsbRiyKyhFcrnSRcVcmSH',13),(28,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhdmlqaXRAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMTUzODQxNiwiZXhwIjoxNzMxNjI0ODE2fQ.-rP_ll1YxvGHRKMZVbHQpOl4ftlZ1-KfQm1aO9wP1YJzTMqQ5sTJDarUhtCFybeN',13),(29,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhYWFhQGdtYWlsLmNvbSIsImlhdCI6MTczMTU4NTkwOCwiZXhwIjoxNzMxNjcyMzA4fQ.dMK24fMR0uhUktxdsZxvmoPwg3apPxCfj0R25PuwdhThyQLJBaVtf2cDg3VYf6AC',14),(30,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJiYmJiQGdtYWlsLmNvbSIsImlhdCI6MTczMTU4NjAzMSwiZXhwIjoxNzMxNjcyNDMxfQ.BowrFV672bYt5Gf4YvgqGCvqKRlMP-bz_Ul0K3_hjLCHgFIOvu4eAXC73aGu5Xx_',15),(31,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJjY2NjQGdtYWlsLmNvbSIsImlhdCI6MTczMTU4NjIxMiwiZXhwIjoxNzMxNjcyNjEyfQ.8-wdVIacxjnp7dRSxkJWiJoIQuXM07R-otSn3M6RYp9sEGgksSIeVt6eZXUSEAef',16),(32,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJlZWVlQGdtYWlsLmNvbSIsImlhdCI6MTczMTU4NjMzOSwiZXhwIjoxNzMxNjcyNzM5fQ.DM1tmWC5W3gA4vAHDZdtVKaWQlb5-vJ37aKH4PaScIj6bB5gO081QRmdSk5W1qa7',17),(33,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzc3NAZ21haWwuY29tIiwiaWF0IjoxNzMxNTg2NTM4LCJleHAiOjE3MzE2NzI5Mzh9.IpGXhND3A9c7qkOWhtlHHC0sAwvrBsVWMyFGAGPRHQT9KJvVddZ89OSpz9W1IJkT',18),(34,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxOTMxMTQ1LCJleHAiOjE3MzIwMTc1NDV9.VPl2PCaM8w6wgJgGIVzOZl-bB8UzXWd6Kr-ulWks6qi32-yeJIdKlEagoYC3OVyN',8),(35,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxOTMxMTczLCJleHAiOjE3MzIwMTc1NzN9.P2GmIccLPH-BTB7lKh-QETgpcdYzoku0Q99AdkAEQCEcIpCM1bhou_ctqdDIZIg3',8),(36,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxOTMxMTkyLCJleHAiOjE3MzIwMTc1OTJ9.1nRLHLqzGk2HrTVHKdKlEl9n2OWUbJnKMs_WY2EBYaO5tXow-hP-msA64EKiKxmG',8),(37,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxOTMxMzE2LCJleHAiOjE3MzIwMTc3MTZ9.E8kfOno9PPTws5xbsR2NIGED622tNQvwpMWsKCmlA0vMUBq2izMD9I8tsyvtCu-H',8),(38,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyMDA4NDg0LCJleHAiOjE3MzIwOTQ4ODR9.oFI-KqRS3haKMbfmtC4K9_mvGxJ_DO00FIOjYv5IQJfOqyuvJauXBquB7Ci05wvu',8),(39,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyMDA5NTg4LCJleHAiOjE3MzIwOTU5ODh9.oHB9CzLGvtybDfax6L55B2_qRmwvWoSBsGrrMOEaQQwM9uPWpo-MIlJ-ReuDlzze',8),(40,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyMDExOTk2LCJleHAiOjE3MzIwOTgzOTZ9.75Th-51f31KgbbHijfWnm4stp2cDeafQPJEx58hxe-oUeAlXVsHvUR8SpqvQHoem',8),(41,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyMTA3MjkzLCJleHAiOjE3MzIxOTM2OTN9.XSEUXxEJ20Qz4tzdtgQgxHj7rwwqMMAB1OUWxYvrnzCLpH-wg6cgJsoBv2FmFHW6',8),(42,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhdmlqaXRAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMjEwNzMxNiwiZXhwIjoxNzMyMTkzNzE2fQ.E32IY42RL-gmfsrfYigq9AMfwfovZhWjSA7uTiyqa07UASJYUmGV259s8ksu5H9-',13),(43,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzc3NAZ21haWwuY29tIiwicm9sZSI6IkFHRU5UIiwiaWF0IjoxNzMyMTA3NTE0LCJleHAiOjE3MzIxOTM5MTR9.j0XTU_590AWiZ41eVL7i2DkWqK59kcYA01LMSskNCeKAHJlk0ZBi98Lkc-JXK0UD',18),(44,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzc3NAZ21haWwuY29tIiwicm9sZSI6IkFHRU5UIiwiaWF0IjoxNzMyMTA3NTY5LCJleHAiOjE3MzIxOTM5Njl9.OERLoOS1cCJxfb76RveJwh1_jjApufzfr_fjYPR6vNwruoHfEkvD86xReyNaSdH4',18),(46,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHRAdGVzdCIsInJvbGUiOiJBR0VOVCIsImlhdCI6MTczMjE4Mzk5NiwiZXhwIjoxNzMyMjcwMzk2fQ.2tUYgmlPUdUDT_SgrSz3DFljfcPLRB_dnXiQboA8XjiUGSHaNupq4s2xRIh2Gyw1',20),(47,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODQwOTUsImV4cCI6MTczMjI3MDQ5NX0.VK6t4QtY4AoKgW68uqPJkYJg57LULz2yHGqfTjOCJ0Vrs9-ux25Zby1HKrb0flYT',21),(48,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODQxMTIsImV4cCI6MTczMjI3MDUxMn0.KlBYHTuKiJGNIR5dxOD2VRQF1EmvO5a38vudkRYHXG_SVNHORw6zgmqCepGXjx_n',21),(49,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxODUwMDEsImV4cCI6MTczMjI3MTQwMX0.RF-RViVFMLS5NqIvPdcqtQdTz6veXTJxTEzKDTm0LUarMODj6530OFNmF9ObhkUu',21),(50,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxODUwMTYsImV4cCI6MTczMjI3MTQxNn0.Tkj8RvW_Lm-PgoWf7ScKaqKPR_83ABhjm0_lQ0yJaXiGfghUWm_xR2JFRWgrvHVS',21),(51,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxODUwMjAsImV4cCI6MTczMjI3MTQyMH0.3CpWQ2kSfO3xF-T8jS89lfmU7mcqXHtI4VMPFQXSPfQ_JSVba9ssauQ0toy9oq5e',21),(52,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxODUwNDcsImV4cCI6MTczMjI3MTQ0N30.IvrSljn7czo7XikcReQGoprAh85aiD4Le54AiIwGoCFpAgmjXhET33C99p7ovZb-',21),(53,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxODUxMzEsImV4cCI6MTczMjI3MTUzMX0.ST7RO1AZ0Z5diwu6eaHQnqcDV3aakQp1bH88cn5Z9nbjuxj5xyHFpZ6tJIWD2xAg',21),(54,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxODUxMzcsImV4cCI6MTczMjI3MTUzN30.8H37qGj89azRMIrba2_P5VOIa1AZz2u7Wlv0AxFHsnZN8AmLRcFhwgeU70LSarli',21),(55,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxODUxNTgsImV4cCI6MTczMjI3MTU1OH0.51vyD_DzUh2ZAgYappk2Ga6liZ9L9x0FdqekYmA80Q1z2_MctHMeaDj4xZsCPZkP',21),(56,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxODUyMjUsImV4cCI6MTczMjI3MTYyNX0.jzU54Sinsl9_ibaC3Gl9R4uPxo9CX7ekWOaG_MeN8Y8jbAiIEZ9zAsvzq-128twU',21),(57,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODUyNDEsImV4cCI6MTczMjI3MTY0MX0.LYH5tExqvGq0iSZBMbbHdA6XF6BqZfY5nSzzV2ZWE-qzV9JXBm2ILGSz8ZgmHPAR',21),(58,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODUyOTgsImV4cCI6MTczMjI3MTY5OH0.Q6ul5I4W23IOeXc1UQnqcJN2W3cRGCuUuMiVdczWQlcxMd4LfqTG06acfIH4O0qY',21),(59,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODUzNzQsImV4cCI6MTczMjI3MTc3NH0.f1qWluJLpeBYE_bEcFC5jdslvArruQBOk6GFsdUHU2nrkqxG30pFM7IEVqkcYkIR',21),(60,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODUzODUsImV4cCI6MTczMjI3MTc4NX0.Hrw17oXuCcH68wB5eMr-uxnii6I7_shWRDWoNrUmiY2oRFwJ48S9_Em6aA0SO7Pc',21),(61,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiU0FMRVNfRVhFQ1VUSVZFIiwiaWF0IjoxNzMyMTg1Mzk4LCJleHAiOjE3MzIyNzE3OTh9.-iA9NCFpUNJDjDerU4nHpdoKMe90Q335SfTxXcmDwnws_jVwgNDNCUD9NUTJj3Zq',21),(62,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiU0FMRVNfRVhFQ1VUSVZFIiwiaWF0IjoxNzMyMTg1NDE0LCJleHAiOjE3MzIyNzE4MTR9.Sm6Ra4wb9X05SlzpMFPDY5sWZ6Paz7HaG_hBHakMuVhLfz1bGFHyMkkTxXWcSh8y',21),(63,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODU5MzUsImV4cCI6MTczMjI3MjMzNX0.EAj_hTN2EUGkZmweQ42q6TcqqgGElvGd30ieok0MxdlxK17vdRYewgQ-ao3R19tn',21),(64,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODY0MzksImV4cCI6MTczMjI3MjgzOX0.2P1nD0fV-STt6cNs9pffvfOKHyewctchVUE2x9roQ6nunt5PQsCgXCcD7MJD4kkU',21),(65,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODY3ODUsImV4cCI6MTczMjI3MzE4NX0.DJN5jlH3Ia6ngFuuI0fASgVc5bnDajTwFGGXoonNjM4zDVMK6A7UjoU17hBWZ9d3',21),(66,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODY4NDcsImV4cCI6MTczMjI3MzI0N30.ZXYUFq14n071uGDQvKOFdMABDvQYsnkqOt97INRLDDTOVNHSTtFq9Y0KUVJnRptr',21),(67,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyMTg3NjQ0LCJleHAiOjE3MzIyNzQwNDR9.upgTptoiVdBPUWpxiHyirc9JAcBwfU0aQA7fLoSietFwaWlPlXIine7jVwFo7NGF',8),(68,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODc2NTgsImV4cCI6MTczMjI3NDA1OH0.icz3TdpzIdDII2_-el8UmeMqUl7-u6FwIGYELjHxEq7q8q-875XN-uxJ4E5rYngm',21),(69,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODc2NzEsImV4cCI6MTczMjI3NDA3MX0.t2ehrPYyqYrqBfPVw-yTYtVY8HfCr3UI2G9pcMTQuH05WNCf2KLUnMlqt4Vn5uTm',21),(70,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzYWxlczFAZ21haWwuY29tIiwicm9sZSI6IkFHRU5UIiwiaWF0IjoxNzMyMzU3MjgyLCJleHAiOjE3MzI0NDM2ODJ9.oCw1HIUueaW9o1No00fh7suHwAJ5lZICibTaxHMroJRCtspP4Z7gucV3EFqeQ8vX',22),(71,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzYWxlczFAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMjM1NzQyNywiZXhwIjoxNzMyNDQzODI3fQ.X2IZcuh7ZQlOsrbw_EHoScfgXJdOv30prrLOswBS52NkLILdrIfUNflJpBb9IKHX',22),(72,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyMzU3NjIzLCJleHAiOjE3MzI0NDQwMjN9.sKER5EShKeh5mMdqREilqbTCNd_DEI7ithZvydEjRZiWSyQ4gyFCLFnNbWvQVrFz',8),(73,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyMzU3ODc1LCJleHAiOjE3MzI0NDQyNzV9.uTFlV1TVA53uOg2znUbKaSGbuS1nyMMP1BYIBvz4ptL1KaHmwEUjrb0s3pUSLFUo',8);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` enum('ADMIN','AGENT','SALES_EXECUTIVE') DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `active` bit(1) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `is_lock` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (8,'rafiqulislam977@gmail.com','Razu','$2a$10$H4uHwBBWGV4l8sQ1C/Iws.A1EUbFVkseJd4Cj2chVR7dS.XFmDm6a','01775805206','ADMIN',NULL,_binary '','Dhaka',_binary ''),(9,'rafiqul1@gmail.com','Rafiqul','$2a$10$rFFKiIP3BEKfGq/swlNb4ObaPn82IrB7M0xQ5gICxZDpEeUHyi.72','3469002','ADMIN',NULL,_binary '','Barishal',_binary ''),(10,'rafiqul@gmail.com','Rafiqul','$2a$10$dSBVLW9exD7hPfpm5W54..Lnz3ZwGARM8JBCGoUsrTTZApZWuVVKe','375409','ADMIN',NULL,_binary '','Barishal',_binary ''),(11,'rafiqulrrr@gmail.com','rrr','$2a$10$CqvSvXJZess2TY7YQKE5ZOc6J/WZ3pqg21XlVkUIRyTxmb/BaTqQ.','436098','AGENT',NULL,_binary '\0','Barishal',_binary ''),(12,'agent@gmail.com','agent1','$2a$10$dsADJ4P3uO81D31vQz6cg.faR/bS9bS.nElj4RLOqwnikKUS2vqHu','3464374','SALES_EXECUTIVE',NULL,_binary '','dhaka',_binary ''),(13,'avijit@gmail.com','avijit','$2a$10$046r9.v1uZ6Zcdl6aZOYJeQQpzft1aeEsIgOwf0vnZJiYEDn7xy3i','436857','SALES_EXECUTIVE',NULL,_binary '','dhaka',_binary ''),(14,'aaaa@gmail.com','aaaa','$2a$10$gEg03ObtKfKLrCer7H1owePAY/ato2kP4.7aMsS7Aea.dGKJMvIj6','243687','AGENT',NULL,_binary '\0','dhaka',_binary ''),(15,'bbbb@gmail.com','bbbb','$2a$10$b1niflXl9G9nlxHakIyx1.C2IyqS8X1QTxEmSC/0sXZtamW9Xd4xq','243687','AGENT',NULL,_binary '\0','dhaka',_binary ''),(16,'cccc@gmail.com','cccc','$2a$10$Bey6/aItkRECSet8Opw8ium.gRQqRQ/pS.7C4J3tZwCQOl9WBBFzO','243687','AGENT',NULL,_binary '\0','dhaka',_binary ''),(17,'eeee@gmail.com','Agent1','$2a$10$XKpToTi83mHFHtgGAmRikuGhS2wr.hF.8K2m4mHZpwJz.JVLephkm','453889','AGENT',NULL,_binary '\0','dhaka',_binary ''),(18,'sss@gmail.com','rir','$2a$10$AGrSvNUabcNiOgQBQXJW3uSguOmbV5csDD9dmonIgpvxLEhY4QBHy','389722','AGENT',NULL,_binary '','escrtaew',_binary ''),(20,'testtt@test','TEST','$2a$10$hI9sYzv1cqKfiw6ZhE0en.ByKcp4tFB3QW5Di14lB6qTbaBEZbxtG','123','AGENT',NULL,_binary '','123',_binary ''),(21,'testtt2@test','TEST2','$2a$10$ojn/olgAujPsQKKb7GdkTO3yIZQFS8qw3WMiNsL5DAvja2I/i/3N6','123','AGENT',NULL,_binary '','123',_binary ''),(22,'sales1@gmail.com','Sales One','$2a$10$ZHuF4R.PR.5shPxe0omJL.uMBjrv8VYbvoSzHl8QE9GxRCOKRNCvK','435844','SALES_EXECUTIVE',NULL,_binary '','Dhaka',_binary '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-23 18:55:14
