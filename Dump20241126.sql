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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'2024-11-18','CALL','TEST',17,1),(2,'2024-11-18','CALL','TEST 2',17,1),(3,'2024-11-04','MEETING','OMG',21,2),(5,'2024-11-23','EMAIL','byhfgytf',8,4),(6,'2024-11-24','EMAIL','rkbtywscer',21,5),(7,'2024-11-24','CALL','TEST YY',21,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Dhaka','test@email.com','Customer 1','01700000000'),(2,'CTG 2','test@email.com','Customer 420','01700000000'),(4,'sdry','ok@aa.v','yreyre','54862'),(5,'qwwqwq','zzz@gm.c','ERT','453858'),(6,'dhaka','nrjs@gmail.com','Nirjash','436785656');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
INSERT INTO `leads` VALUES (11,'2024-11-26',2,13),(12,'2024-11-26',6,22);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Mobile','AVAILABLE',1500,10000,15),(2,'PC','AVAILABLE',1500,50000,15),(4,'OMG2','AVAILABLE',122,122,12),(5,'qwe11','AVAILABLE',11,11,11);
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
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwiaWF0IjoxNzMxNDQwNDg1LCJleHAiOjE3MzE1MjY4ODV9.nKMnQLnQv2gNB8zUJaPcOPS8n1dMvms7dtYPSrHlj7mA3_4wveZ9nCiaXwalBhnl',8),(2,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwiaWF0IjoxNzMxNDQxMTU0LCJleHAiOjE3MzE1Mjc1NTR9.TDx7rIFh4Io_7xGj-hhg94ozJRE1VHbivhmGTAUb7epVgdMDpMknFjQm3KnEYMB8',8),(3,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNDQxNTgyLCJleHAiOjE3MzE1Mjc5ODJ9.6SJWQCH-dm7yu1t5QZU7RTEJRGG3r0guokfHfoX6iKeagtxa8nACvtAfTtognPq6',8),(8,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhdmlqaXRAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMTUzMjUwMSwiZXhwIjoxNzMxNjE4OTAxfQ.wIAGTZFNzgaK-PO-thVXmwZysB3A7W9D72sBuGpWzN38XNnmd-fgcI2Qt-MITTTI',13),(9,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhdmlqaXRAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMTUzNTU5OSwiZXhwIjoxNzMxNjIxOTk5fQ.nuriKvyPFBk86cQeXGqP4uWVseGjjLnXSRja873h1Q8pmy_qzIKutD-zE8aoK3Li',13),(10,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhdmlqaXRAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMTUzNjM5MSwiZXhwIjoxNzMxNjIyNzkxfQ.Kn7QsTrsCucXiq19LMFD-PtfDcIyq6sSpidega376FmtWZLMdJbLd3ql_8FNsX-1',13),(11,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhdmlqaXRAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMTUzNjcyMCwiZXhwIjoxNzMxNjIzMTIwfQ.zx3A1Bxj5CeuFcarm4B1myzgh2nsHdJmHW7adt7G_Ag7X_bDaJoNLQQFRY1FhNR8',13),(12,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhdmlqaXRAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMTUzNjc1NCwiZXhwIjoxNzMxNjIzMTU0fQ.K1SfRPuEqfT4rHgpzCMFTyvwkrX2eOiAnOoQSQOPrH8lbLsvNtaDSjuCA55bJdVD',13),(13,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM2OTY0LCJleHAiOjE3MzE2MjMzNjR9.1ptiTWUwdDh1zsZR0AwPPe1AtjnAZs0tSv61kU79UUbrUxWcdtqvyt2Ha1ixqXpN',8),(14,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3MjUwLCJleHAiOjE3MzE2MjM2NTB9.hmz0Qf_RbECAlmSK0KXxPGvelOQkO-3HfoKguRLHFgb5LgQtL-axNiQnVa9-n-B_',8),(15,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3Mzk5LCJleHAiOjE3MzE2MjM3OTl9.C-qgNFuecYhXZAOgMiX0qjGbxNTzaWulJPuW_jcYjj91uVd4BzUH6UxPDMHxlZtS',8),(16,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3NDI3LCJleHAiOjE3MzE2MjM4Mjd9.l2N9C6H7n0HMz7tdgaMqfRI8Ud4MK7PCcogxjlq6oDY9sq9N65nYNngPaKt6FKD0',8),(17,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3NDMzLCJleHAiOjE3MzE2MjM4MzN9.sBUTXBVbjCq1ENNSqX4IKvXpmSDg8dfXHfjWtrdi-lHu6HsxgYCKX37E-VmQMAKG',8),(18,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3NDUzLCJleHAiOjE3MzE2MjM4NTN9.ZSmw7Ys2RpbAplOrNI_bWdhEssQDBtub2qPvil-nvDtqGV7C7KzHfUTiYnXU94Fl',8),(19,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3NDY2LCJleHAiOjE3MzE2MjM4NjZ9.myNcDgt0TJa_tqmQOxSLe1JDNRjErlJP1TM7huQt_YYF6ch_MyFRixKY9XNPX9O_',8),(20,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3NTIyLCJleHAiOjE3MzE2MjM5MjJ9.vrLnCN9zjLVjEFAlHXmMvYw8cEC2X-HuEvSy1Yy4QNSwu9dPUx394ycZ-iZ1aZpy',8),(21,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhdmlqaXRAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMTUzNzY1MCwiZXhwIjoxNzMxNjI0MDUwfQ.X704uSh95Kf8MMCzyxKdm2MtqpuhREmtqodOYM0Zi9ZF8uU6yXuiIFFSziWXtU7m',13),(22,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3ODc3LCJleHAiOjE3MzE2MjQyNzd9.Zie-BsxlWP-_ga69yl_8XFT5wQgfEAGpPcWIziNjsTctKeLyAECP2wowxP5iLjIU',8),(23,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM3ODg5LCJleHAiOjE3MzE2MjQyODl9.uImbDllh6iS0d-R4nfiLEF04TeKNanVglqkEb10rqTsjbAjGDusk430c2WlscvnG',8),(24,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM4MDM3LCJleHAiOjE3MzE2MjQ0Mzd9.OUsYhcKAvBNN0THMUE3DrDnXOxp8RgUnTBJVytk8LWKVIP5PCyY1HOQraCM2ut-g',8),(25,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM4MTYwLCJleHAiOjE3MzE2MjQ1NjB9.8XozDSMSK3FfaoWLpBoKqE3F6XMuKc6rzWWe24QivhhUWDDyJnDmTHEr2GocmW37',8),(26,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxNTM4MjY3LCJleHAiOjE3MzE2MjQ2Njd9.VdxbuHvMYXbKt28XJ1OvtvXmLW3jtJErF8-W9yjJxwCIbBvuoah62-TJY5Kv63JG',8),(27,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhdmlqaXRAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMTUzODI5NiwiZXhwIjoxNzMxNjI0Njk2fQ.p_T6iyX1lPzx5gI3Ls4H_TEp3bq9qA6yQFA6S-V9D3BTsbRiyKyhFcrnSRcVcmSH',13),(28,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhdmlqaXRAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMTUzODQxNiwiZXhwIjoxNzMxNjI0ODE2fQ.-rP_ll1YxvGHRKMZVbHQpOl4ftlZ1-KfQm1aO9wP1YJzTMqQ5sTJDarUhtCFybeN',13),(33,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzc3NAZ21haWwuY29tIiwiaWF0IjoxNzMxNTg2NTM4LCJleHAiOjE3MzE2NzI5Mzh9.IpGXhND3A9c7qkOWhtlHHC0sAwvrBsVWMyFGAGPRHQT9KJvVddZ89OSpz9W1IJkT',18),(34,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxOTMxMTQ1LCJleHAiOjE3MzIwMTc1NDV9.VPl2PCaM8w6wgJgGIVzOZl-bB8UzXWd6Kr-ulWks6qi32-yeJIdKlEagoYC3OVyN',8),(35,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxOTMxMTczLCJleHAiOjE3MzIwMTc1NzN9.P2GmIccLPH-BTB7lKh-QETgpcdYzoku0Q99AdkAEQCEcIpCM1bhou_ctqdDIZIg3',8),(36,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxOTMxMTkyLCJleHAiOjE3MzIwMTc1OTJ9.1nRLHLqzGk2HrTVHKdKlEl9n2OWUbJnKMs_WY2EBYaO5tXow-hP-msA64EKiKxmG',8),(37,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMxOTMxMzE2LCJleHAiOjE3MzIwMTc3MTZ9.E8kfOno9PPTws5xbsR2NIGED622tNQvwpMWsKCmlA0vMUBq2izMD9I8tsyvtCu-H',8),(38,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyMDA4NDg0LCJleHAiOjE3MzIwOTQ4ODR9.oFI-KqRS3haKMbfmtC4K9_mvGxJ_DO00FIOjYv5IQJfOqyuvJauXBquB7Ci05wvu',8),(39,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyMDA5NTg4LCJleHAiOjE3MzIwOTU5ODh9.oHB9CzLGvtybDfax6L55B2_qRmwvWoSBsGrrMOEaQQwM9uPWpo-MIlJ-ReuDlzze',8),(40,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyMDExOTk2LCJleHAiOjE3MzIwOTgzOTZ9.75Th-51f31KgbbHijfWnm4stp2cDeafQPJEx58hxe-oUeAlXVsHvUR8SpqvQHoem',8),(41,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyMTA3MjkzLCJleHAiOjE3MzIxOTM2OTN9.XSEUXxEJ20Qz4tzdtgQgxHj7rwwqMMAB1OUWxYvrnzCLpH-wg6cgJsoBv2FmFHW6',8),(47,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODQwOTUsImV4cCI6MTczMjI3MDQ5NX0.VK6t4QtY4AoKgW68uqPJkYJg57LULz2yHGqfTjOCJ0Vrs9-ux25Zby1HKrb0flYT',21),(48,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODQxMTIsImV4cCI6MTczMjI3MDUxMn0.KlBYHTuKiJGNIR5dxOD2VRQF1EmvO5a38vudkRYHXG_SVNHORw6zgmqCepGXjx_n',21),(49,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxODUwMDEsImV4cCI6MTczMjI3MTQwMX0.RF-RViVFMLS5NqIvPdcqtQdTz6veXTJxTEzKDTm0LUarMODj6530OFNmF9ObhkUu',21),(50,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxODUwMTYsImV4cCI6MTczMjI3MTQxNn0.Tkj8RvW_Lm-PgoWf7ScKaqKPR_83ABhjm0_lQ0yJaXiGfghUWm_xR2JFRWgrvHVS',21),(51,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxODUwMjAsImV4cCI6MTczMjI3MTQyMH0.3CpWQ2kSfO3xF-T8jS89lfmU7mcqXHtI4VMPFQXSPfQ_JSVba9ssauQ0toy9oq5e',21),(52,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxODUwNDcsImV4cCI6MTczMjI3MTQ0N30.IvrSljn7czo7XikcReQGoprAh85aiD4Le54AiIwGoCFpAgmjXhET33C99p7ovZb-',21),(53,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxODUxMzEsImV4cCI6MTczMjI3MTUzMX0.ST7RO1AZ0Z5diwu6eaHQnqcDV3aakQp1bH88cn5Z9nbjuxj5xyHFpZ6tJIWD2xAg',21),(54,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxODUxMzcsImV4cCI6MTczMjI3MTUzN30.8H37qGj89azRMIrba2_P5VOIa1AZz2u7Wlv0AxFHsnZN8AmLRcFhwgeU70LSarli',21),(55,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxODUxNTgsImV4cCI6MTczMjI3MTU1OH0.51vyD_DzUh2ZAgYappk2Ga6liZ9L9x0FdqekYmA80Q1z2_MctHMeaDj4xZsCPZkP',21),(56,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzIxODUyMjUsImV4cCI6MTczMjI3MTYyNX0.jzU54Sinsl9_ibaC3Gl9R4uPxo9CX7ekWOaG_MeN8Y8jbAiIEZ9zAsvzq-128twU',21),(57,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODUyNDEsImV4cCI6MTczMjI3MTY0MX0.LYH5tExqvGq0iSZBMbbHdA6XF6BqZfY5nSzzV2ZWE-qzV9JXBm2ILGSz8ZgmHPAR',21),(58,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODUyOTgsImV4cCI6MTczMjI3MTY5OH0.Q6ul5I4W23IOeXc1UQnqcJN2W3cRGCuUuMiVdczWQlcxMd4LfqTG06acfIH4O0qY',21),(59,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODUzNzQsImV4cCI6MTczMjI3MTc3NH0.f1qWluJLpeBYE_bEcFC5jdslvArruQBOk6GFsdUHU2nrkqxG30pFM7IEVqkcYkIR',21),(60,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODUzODUsImV4cCI6MTczMjI3MTc4NX0.Hrw17oXuCcH68wB5eMr-uxnii6I7_shWRDWoNrUmiY2oRFwJ48S9_Em6aA0SO7Pc',21),(61,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiU0FMRVNfRVhFQ1VUSVZFIiwiaWF0IjoxNzMyMTg1Mzk4LCJleHAiOjE3MzIyNzE3OTh9.-iA9NCFpUNJDjDerU4nHpdoKMe90Q335SfTxXcmDwnws_jVwgNDNCUD9NUTJj3Zq',21),(62,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiU0FMRVNfRVhFQ1VUSVZFIiwiaWF0IjoxNzMyMTg1NDE0LCJleHAiOjE3MzIyNzE4MTR9.Sm6Ra4wb9X05SlzpMFPDY5sWZ6Paz7HaG_hBHakMuVhLfz1bGFHyMkkTxXWcSh8y',21),(63,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODU5MzUsImV4cCI6MTczMjI3MjMzNX0.EAj_hTN2EUGkZmweQ42q6TcqqgGElvGd30ieok0MxdlxK17vdRYewgQ-ao3R19tn',21),(64,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODY0MzksImV4cCI6MTczMjI3MjgzOX0.2P1nD0fV-STt6cNs9pffvfOKHyewctchVUE2x9roQ6nunt5PQsCgXCcD7MJD4kkU',21),(65,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODY3ODUsImV4cCI6MTczMjI3MzE4NX0.DJN5jlH3Ia6ngFuuI0fASgVc5bnDajTwFGGXoonNjM4zDVMK6A7UjoU17hBWZ9d3',21),(66,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODY4NDcsImV4cCI6MTczMjI3MzI0N30.ZXYUFq14n071uGDQvKOFdMABDvQYsnkqOt97INRLDDTOVNHSTtFq9Y0KUVJnRptr',21),(67,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyMTg3NjQ0LCJleHAiOjE3MzIyNzQwNDR9.upgTptoiVdBPUWpxiHyirc9JAcBwfU0aQA7fLoSietFwaWlPlXIine7jVwFo7NGF',8),(68,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODc2NTgsImV4cCI6MTczMjI3NDA1OH0.icz3TdpzIdDII2_-el8UmeMqUl7-u6FwIGYELjHxEq7q8q-875XN-uxJ4E5rYngm',21),(69,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIxODc2NzEsImV4cCI6MTczMjI3NDA3MX0.t2ehrPYyqYrqBfPVw-yTYtVY8HfCr3UI2G9pcMTQuH05WNCf2KLUnMlqt4Vn5uTm',21),(70,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzYWxlczFAZ21haWwuY29tIiwicm9sZSI6IkFHRU5UIiwiaWF0IjoxNzMyMzU3MjgyLCJleHAiOjE3MzI0NDM2ODJ9.oCw1HIUueaW9o1No00fh7suHwAJ5lZICibTaxHMroJRCtspP4Z7gucV3EFqeQ8vX',22),(71,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzYWxlczFAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMjM1NzQyNywiZXhwIjoxNzMyNDQzODI3fQ.X2IZcuh7ZQlOsrbw_EHoScfgXJdOv30prrLOswBS52NkLILdrIfUNflJpBb9IKHX',22),(72,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyMzU3NjIzLCJleHAiOjE3MzI0NDQwMjN9.sKER5EShKeh5mMdqREilqbTCNd_DEI7ithZvydEjRZiWSyQ4gyFCLFnNbWvQVrFz',8),(73,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyMzU3ODc1LCJleHAiOjE3MzI0NDQyNzV9.uTFlV1TVA53uOg2znUbKaSGbuS1nyMMP1BYIBvz4ptL1KaHmwEUjrb0s3pUSLFUo',8),(74,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIzOTU2MjcsImV4cCI6MTczMjQ4MjAyN30.RImwWVHBQeRk9m24UweI_Kw0yoyqC0zx5aSwQyzBFo9PIaW8KOPrpvjoPUPlUs4D',21),(75,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzIzOTU2NjAsImV4cCI6MTczMjQ4MjA2MH0.mdU9nUCWfr5RF1sCG528iC80qTPwCDlkXG4zz04g-eamHP5asaCz0bV57CNBUH12',21),(76,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyNDQ5NTU4LCJleHAiOjE3MzI1MzU5NTh9.yJ8rSVIktxB6DPVE8a-JoK1kdH5nTPkWMY3PNo0s6EQnZc-MH6D1_A-krWUEWeK4',8),(77,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyNDQ5NTY5LCJleHAiOjE3MzI1MzU5Njl9.Iew6eVEJs9mbZUi0EloOeaoZxYrGQ71dH91_pLTioxv8uC5iehWla4FvwAYS-VvX',8),(78,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyNDQ5OTUzLCJleHAiOjE3MzI1MzYzNTN9.emToJZ0IGnGEqlMOlaSRVRgFi8iBJlWvLh8OlvLPMk9pH7DSzeC4Bvgn-16L7Ee3',8),(79,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyNDQ5OTc3LCJleHAiOjE3MzI1MzYzNzd9.G4q4d6U26g2FBZysGo2OWkR-c9s76mEg93MkjlkMd0TyEaknCB78KdZYoK2hoi38',8),(80,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTAwNjEsImV4cCI6MTczMjUzNjQ2MX0.ZGbMWi2pn7lUozPgXD0Pzdk115ws15wH0ME5ywIQNBMybjmv-Ereal4CBs1hpJ--',21),(81,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTAxODUsImV4cCI6MTczMjUzNjU4NX0.vlwYLNoz_Yi-LHRnsswVksFX_4uPRZjERERfb7dsbhTE2eQqctUsIyxBO4q_fPOA',21),(82,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTAyMTUsImV4cCI6MTczMjUzNjYxNX0.y5VuHMbA5xyhwxTzUkq7yTYIYqv2a-Ga6qZoE8Xp7Ou2e7thz9OzUmLeNTw3UFOA',21),(83,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTAyODcsImV4cCI6MTczMjUzNjY4N30.reBqbKD8hZTL49R28BSoGyfyu5PnYmNTNbfmxRXEZbJ3-YoiL2SZs777idV71YRN',21),(84,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTAzNDYsImV4cCI6MTczMjUzNjc0Nn0.Mu_9mDFDuty2_KAnSUvEgYDXy8DkikhnICDveRhi5QkhlH8zWX9bD9BuhNFDsfUX',21),(85,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTE2NjksImV4cCI6MTczMjUzODA2OX0.Sud6BgJiWJ1m8W17m1QUzf88ZaYJ97t7dH9jO-JEeR0otaA-qrxCVXRl2qHZsF6Z',21),(86,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTE4NjAsImV4cCI6MTczMjUzODI2MH0.yiNLSnK-npUiiT3whdyOYgwZ_dFlv9L58U4B6sRJwze_u8zhO12azpC5shpgHhGZ',21),(87,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTE5NTIsImV4cCI6MTczMjUzODM1Mn0.RNbWUhXVnwrlScZiAkt3W-JCAPpafFVVW_l7Gn0Q-8_8K0LLUziHUdW1T-XREbR5',21),(88,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTIwMDEsImV4cCI6MTczMjUzODQwMX0.4erdwvf3hHM76ZhCCXsawKkPiMQIt3PNSSerl7sWCDI9YkmxmS_JN1Y9-KPqI6iG',21),(89,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTIxMDIsImV4cCI6MTczMjUzODUwMn0.ojfpxi98wWyuHgYDCgRfLa8dbgh-I9WbQCps8vvF7sDtyfN0EtVQ3tyV0e1buU8H',21),(90,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTIxMzgsImV4cCI6MTczMjUzODUzOH0.5MvZTMeZ1Bo38QsXs-oN5fqOCkNUXatkXy4SKiLlr5P-9knbYOaQk3xON6wagvEK',21),(91,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTIxNjMsImV4cCI6MTczMjUzODU2M30.w-OrYCxJ1MKPsALjQfW_iJ_QZNNxW21Ci3YrPpFrsU48rJAVj-5brNdyQvc20xH0',21),(92,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTIyOTEsImV4cCI6MTczMjUzODY5MX0.FvZ8o-wSjPm5gRQ0zl9M12Y95VdhOyePXvcidhGR7HJX7q4499O3DlEkbNwHCaio',21),(93,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTI2NzgsImV4cCI6MTczMjUzOTA3OH0.E2mB7sMgKvKvsvqnYv5negxdOoXXhh6_xbFHmM14SWghcDTuSRME3CjjIW43_Nz2',21),(94,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTI4NDcsImV4cCI6MTczMjUzOTI0N30.T4cjsEC4aNqV-Bibw0ZpEY05r_Jj4cRiE77NwjA8mSSZDEAd1yyy1q-AuN8wkV0v',21),(95,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTI4NTYsImV4cCI6MTczMjUzOTI1Nn0.7O436tPp-srw-ne-29oRgP9ZyXuYzHG5W01XNHyFbiIADNGspVr6lZ4nyEHHG18Q',21),(96,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTI4OTIsImV4cCI6MTczMjUzOTI5Mn0.GDcyE1Q60K8enwlgU24j39Rm4wk-lDLG0dlmYot4Z4oWzknWvK7S8IzyLnbQWDdT',21),(97,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTI5NDEsImV4cCI6MTczMjUzOTM0MX0.2HNeUw2d-5qrWTGiQzU4ekWAlkzri1ewOHYfi2lVwBlm2DfSPJqRh8GKGMjuGlkz',21),(98,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTI5OTksImV4cCI6MTczMjUzOTM5OX0.WY1eMZTjrQQ7zVnkssoTsoNsRlKsfXli0C5yDooatoNjglDH2yRky35eHUitm-1t',21),(99,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTMwMjIsImV4cCI6MTczMjUzOTQyMn0.jTQuvUBU1ARp4iIAwux_TWLmQuGNuRQtMzeJnyp-d7gIPy98NF2k71BVYq4bVe2m',21),(100,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTMxODEsImV4cCI6MTczMjUzOTU4MX0.io4wqGMKHPndsF8KwSymOi1Qmv3N-tSfSB7EOCfIhPhTd48cLD_MSZ-m57iGP2YS',21),(101,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTMxOTgsImV4cCI6MTczMjUzOTU5OH0.IhlxtHO3qT5ZBMngFsVbqIQ_Oz95vGXpPH71Dr82b8P3NQ0IHzZY1Q5E9KUDw7Db',21),(102,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTMyMTksImV4cCI6MTczMjUzOTYxOX0.XuMDATYowapzqKk9zTj3dYyZZyFYGjDiPYN8ktpdkYLPWIjfYw5uoKxgqtPGkjn8',21),(103,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI0NTMyODIsImV4cCI6MTczMjUzOTY4Mn0.1FRBAbWCZdHEFlHv4bqCo1EGwKqdMArENQQtCUdxf8H74jaXzP2b-G5_CYR1QK0o',21),(104,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzYWxlczFAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMjUyOTIxNiwiZXhwIjoxNzMyNjE1NjE2fQ.2ZRYxqIrBZDZ0JtLY4K4XRR1covGP78q19JHbhuHwXN4OIDkHL1MQ7_TW_RanBbR',22),(105,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzYWxlczFAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMjUzMjQyMSwiZXhwIjoxNzMyNjE4ODIxfQ.INcDjP-ecCprhdiiQwENfJrQuNO_r0AY0yI2-4QoSHbdsZIzwSSA4Lph7Ut8jxAf',22),(106,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzYWxlczFAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMjUzODMzMSwiZXhwIjoxNzMyNjI0NzMxfQ.5ANPo7nPwXZXJldsbu2tVxR4Ki2yklMtmbNvl7-r_5SM1G5olNVUfV2AWCgZ_1iQ',22),(107,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzYWxlczFAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMjUzODM0NiwiZXhwIjoxNzMyNjI0NzQ2fQ.iFG5Sv0K_LWor-zB8sZVdE6aqVEFmEgiIMJ_d1z1T2-2MKy3AE5qfIyo7Y8wGzpm',22),(108,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzYWxlczFAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMjUzODU1OSwiZXhwIjoxNzMyNjI0OTU5fQ.wZcqMqvfWgT4gIClHjysehe6XZT7TedZWEkz9zmdFpfxu5QGBYgv1QLa6-A_YQRx',22),(109,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzYWxlczFAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMjYxMjc4MSwiZXhwIjoxNzMyNjk5MTgxfQ.7Z4mbAx6rUXzBGpFTGS0wkw2sVTDl512PZWreEb2w4vM6G3HDgtY_2qY6pXqcyq-',22),(110,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTI4NTcsImV4cCI6MTczMjY5OTI1N30.Dq7_fwWCqSPTQ_t5FbHGUBiLDQeiCBtayKv_hF-f09qgiUb9adQ6payfg6CpJdcW',21),(111,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTI4ODIsImV4cCI6MTczMjY5OTI4Mn0.iflyVEI7ckrQ28OnNldZuMD0IgYSe7chrEwpRXMbnUeOykfZHC70oWnhYNVwIdEi',21),(112,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTMxMzUsImV4cCI6MTczMjY5OTUzNX0.GJJu2hilVcM0bwDQ78wJdTBy-UEQgYaZ_YvaTXnFbx4TFqGFgitV87gtLA6zJJUm',21),(113,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTMyMjgsImV4cCI6MTczMjY5OTYyOH0.i9B1l3wI8UlBrZrkMy9ygsrtgjCUqe_ImnoXV6ps9F6x5p1UPqi7ZJXqBDfxgRSi',21),(114,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTM2MjcsImV4cCI6MTczMjcwMDAyN30.whXNYLYJlqnmlfmvwYda976Ax8PGta1iRfCEtFHfqIwb721OSkGay4CqPhfeTcCR',21),(115,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTM3NjYsImV4cCI6MTczMjcwMDE2Nn0.hPJA-7MH7jzC-TaapluhZWLQrKpL3BUlKGKLINF-nj52VXStDo8OupOvuCm0S4Gj',21),(116,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTM4NDAsImV4cCI6MTczMjcwMDI0MH0.4pa9gbv9qYkcLp95_H73q_AD9CDj8kRNZumJMynvx_hg6CXKRgVxQ0UDXhOhs0Fs',21),(117,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTUyODEsImV4cCI6MTczMjcwMTY4MX0.8Jfh43tWDY7g89gHegaMfCu511l1mwYm8-L2q2L6uAZC4VhFF89iEoG-swxbqgFV',21),(118,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTUzMjQsImV4cCI6MTczMjcwMTcyNH0.SsMogvts7_gac0xl-n76t9eDNaEf1ZcxiOA22FSDtiukfEpAzb7poyc7yUem5EgM',21),(119,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyNjE1NDQ3LCJleHAiOjE3MzI3MDE4NDd9.Q0xQinzVqnWaBISpixbFWOwGR7UWM6BeG64adwOLr6iB08vT_sAxl8-EEkW7-xNv',8),(120,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzYWxlczFAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMjYxNTQ4OCwiZXhwIjoxNzMyNzAxODg4fQ.iSxDT_EN-nVmt6_t38L8q6ZTmv-aL6T_DLogrNVtQMFmBolPeTwWXyFoqYO2R6lO',22),(121,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzYWxlczFAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMjYxNTUyMSwiZXhwIjoxNzMyNzAxOTIxfQ.t-3d2bbI2DvG5apIqYogLBWrE_8QXEGHBpfIsghyYrtdsc90Iadjm1MpSFyb9Pp-',22),(122,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTU1NjUsImV4cCI6MTczMjcwMTk2NX0.G5Pi6WwOCyKfFeWXbl_pfwE67tVtuPlVfMBeQvJYHHA-NBi_6fdccNtBUbaoQTWv',21),(123,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVsaXNsYW05NzdAZ21haWwuY29tIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzMyNjE3Nzk2LCJleHAiOjE3MzI3MDQxOTZ9.yy98seSR9_052l2PgGKqKrBT-m8PSzR1e_OM3qZZ-mamzSrO1EdNxLVCEkyr57Ak',8),(124,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTc4OTEsImV4cCI6MTczMjcwNDI5MX0.1IOVcpoCsxVwB1uKGVbNRiGJbJJz6LBp6uxhJslSAnr2geJkYR9XuqJVE99WQWf9',21),(125,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTc5MTAsImV4cCI6MTczMjcwNDMxMH0.CXDwejYlJQEOS28jnhVEV1IJpEnijXIdeOFyDD9Dp_vqiIoPTZzrgMPQcChwVW_N',21),(126,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTg5NjUsImV4cCI6MTczMjcwNTM2NX0.I_OsKjEd5oFcs7vAik-DTQrk4LB-_siuVpT_nhcMs_-sKXd0-MJ8JPgQi-VzkNKg',21),(127,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTkwMDIsImV4cCI6MTczMjcwNTQwMn0.jKNVxhl8yiVpYs2cyNGEm4d-eF3iPDjLDyn6VgqpoXFGzyQVAYwXBe7mn2WOhv8j',21),(128,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTkwMjUsImV4cCI6MTczMjcwNTQyNX0.haMv2VWygqfgRVXHxga3CoPLHYKpeWA7pcSZs8bd-J6EimyF8VVBM2vUnNfHjkha',21),(129,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTkwMzIsImV4cCI6MTczMjcwNTQzMn0.pCnPdRWVG27i3z1sFfWGSoV96-jg1k5LrWNBIBqGAMpx3Gb3bXyzd2JDHyitsNHI',21),(130,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTkwNjUsImV4cCI6MTczMjcwNTQ2NX0.UPL_Jx72LPihpxgYOio1PifNguUaHh_3c2Aw863PR4NtES1Dtsg3FEiQEj6JG4tJ',21),(131,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTkxNjEsImV4cCI6MTczMjcwNTU2MX0.YHrwLi4JBNJN6-dTYQCV5crZtk_fEyYbfhYKAWlkaapd59_z7Gfix9WLo5yduiYZ',21),(132,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTkyNDIsImV4cCI6MTczMjcwNTY0Mn0.Apg6HU9ZlEwknFSJdElBl0qblKfnftxv6RJbrWeMBspim4v4Gkexs845YU2M3vfm',21),(133,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJ0ZXN0dHQyQHRlc3QiLCJyb2xlIjoiQUdFTlQiLCJpYXQiOjE3MzI2MTkzODMsImV4cCI6MTczMjcwNTc4M30.5dVQq7ZiIjncdWv4e0c8bGFz6KKhLV6Ti0UbKJVv4WwAvuBW6svabBWi_d2VZq3B',21),(134,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzYWxlczFAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMjYxOTQ3NSwiZXhwIjoxNzMyNzA1ODc1fQ.bRxDXSIII8mL6YqETIQvlJBNOyKdX61f51gDVpOlzkg_H2-7sVI6uUaHsLZ04Enw',22),(135,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzYWxlczFAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMjYyMDE5OCwiZXhwIjoxNzMyNzA2NTk4fQ.wWyQypB9lqKS0DdthrM5lxEOdLkSAQnpYzOnJ2MhPNo4t3nqm8rkWEEDVH5JWffx',22),(136,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzYWxlczFAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMjYyMDQwMywiZXhwIjoxNzMyNzA2ODAzfQ.RxPrPqaE_N9TgdARkLArQ2G7CWjUi6dKjbgbcCFnpVOwm4RaVwB4fbBbLbjw_vBF',22),(137,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzYWxlczFAZ21haWwuY29tIiwicm9sZSI6IlNBTEVTX0VYRUNVVElWRSIsImlhdCI6MTczMjYyMDY0MCwiZXhwIjoxNzMyNzA3MDQwfQ.eoKwQLDbHNzXoXvP4LsqcwTwDTzj2ffj3Y3Cm-uNsUKxkMDBJLJkzIA-zXe2uBjS',22);
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
INSERT INTO `user` VALUES (8,'rafiqulislam977@gmail.com','Razu','$2a$10$H4uHwBBWGV4l8sQ1C/Iws.A1EUbFVkseJd4Cj2chVR7dS.XFmDm6a','01775805206','ADMIN',NULL,_binary '','Dhaka',_binary ''),(9,'rafiqul1@gmail.com','Rafiqul','$2a$10$rFFKiIP3BEKfGq/swlNb4ObaPn82IrB7M0xQ5gICxZDpEeUHyi.72','3469002','ADMIN',NULL,_binary '','Barishal',_binary ''),(10,'rafiqul@gmail.com','Rafiqul','$2a$10$dSBVLW9exD7hPfpm5W54..Lnz3ZwGARM8JBCGoUsrTTZApZWuVVKe','375409','ADMIN',NULL,_binary '','Barishal',_binary ''),(12,'agent@gmail.com','agent1','$2a$10$dsADJ4P3uO81D31vQz6cg.faR/bS9bS.nElj4RLOqwnikKUS2vqHu','3464374','SALES_EXECUTIVE',NULL,_binary '','dhaka',_binary ''),(13,'avijit@gmail.com','avijit','$2a$10$046r9.v1uZ6Zcdl6aZOYJeQQpzft1aeEsIgOwf0vnZJiYEDn7xy3i','436857','SALES_EXECUTIVE',NULL,_binary '','dhaka',_binary ''),(17,'eeee@gmail.com','Agent1','$2a$10$XKpToTi83mHFHtgGAmRikuGhS2wr.hF.8K2m4mHZpwJz.JVLephkm','453889','AGENT',NULL,_binary '\0','dhaka',_binary ''),(18,'sss@gmail.com','rir','$2a$10$AGrSvNUabcNiOgQBQXJW3uSguOmbV5csDD9dmonIgpvxLEhY4QBHy','389722','AGENT',NULL,_binary '','escrtaew',_binary ''),(20,'testtt@test','TEST','$2a$10$hI9sYzv1cqKfiw6ZhE0en.ByKcp4tFB3QW5Di14lB6qTbaBEZbxtG','123','AGENT',NULL,_binary '','123',_binary ''),(21,'testtt2@test','TEST2','$2a$10$ojn/olgAujPsQKKb7GdkTO3yIZQFS8qw3WMiNsL5DAvja2I/i/3N6','123','AGENT',NULL,_binary '','123',_binary ''),(22,'sales1@gmail.com','Sales One','$2a$10$ZHuF4R.PR.5shPxe0omJL.uMBjrv8VYbvoSzHl8QE9GxRCOKRNCvK','435844','SALES_EXECUTIVE',NULL,_binary '','Dhaka',_binary '');
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

-- Dump completed on 2024-11-26 19:03:46
