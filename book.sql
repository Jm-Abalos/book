CREATE DATABASE  IF NOT EXISTS `book_review_platform` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `book_review_platform`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: book_review_platform
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `review_id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `review_id` (`review_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,3,2,'nice','2024-10-13 14:09:22'),(2,3,2,'it\'s goodd.','2024-10-14 02:38:17'),(3,3,2,'niceeee','2024-10-14 02:47:47'),(4,4,6,'wow','2024-10-14 04:37:46'),(5,4,7,'gandaaaa','2024-10-14 04:42:16'),(6,6,8,'goods','2024-10-14 04:47:58'),(7,6,8,'datebayooo','2024-10-14 04:50:24'),(8,8,9,'very inspiring','2024-11-25 00:28:34'),(9,8,12,'nice','2024-11-25 03:25:03');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `book_title` varchar(255) NOT NULL,
  `author` varchar(100) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `rating` int NOT NULL,
  `review_text` text NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `book_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (3,2,'Solo Leveling','GEE So-Lyung','Fantasy',5,'Good visuals and breathtaking arts.','uploads/670a9b1d4e5eb.jpg','https://asuracomic.net/series/solo-leveling-139aa6ab','2024-10-12 15:51:57','2024-10-12 15:51:57'),(4,6,'The Greatest Estate Developer','Kim Hyunsoo','Fiction',4,'It\'s funny and the characters have good chemistry','uploads/670c9a2d2dbb3.jpg','https://asuracomic.net/series/the-greatest-estate-developer-a6a85dd4','2024-10-14 04:12:29','2024-10-14 04:12:29'),(6,8,'Naruto','John Harold Deliga ','Fantasy',5,'akogna[sosn[ojoj[o','uploads/670ca2e699d18.jpg','','2024-10-14 04:46:45','2024-10-14 04:49:42'),(7,8,'Darling In The Franxx','Ry Mar','Romance',5,'lezzgohomee','uploads/670ca42aab39a.jpg','','2024-10-14 04:55:06','2024-10-14 04:55:06'),(8,2,'Anna Karenina ','Clarence Brown','Fiction',5,'amazing russian love story','uploads/6715b7d2693f3.jpg','https://www.amazon.com/Anna-Karenina-Greta-Garbo/dp/B0009S4IIS','2024-10-21 02:05:40','2024-10-21 02:09:22'),(10,12,'maze runner','Harvee dayondon','Fiction',4,'good','uploads/6743ece79b536.png','https://shopee.ph/The-Maze-Runner-Book-1-(Paperback)-by-James-Dashner-i.157956840.6248723680?sp_atk=f894d9a8-9b76-4fdc-ab2a-7a8a8a153e1c&xptdk=f894d9a8-9b76-4fdc-ab2a-7a8a8a153e1c','2024-11-25 03:20:07','2024-11-25 03:20:07');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jm','jyabalos.student@asiancollege.edu.ph','jm123456','2024-10-11 13:39:57',0),(2,'harvee','jm@gmail.com','$2y$10$VRSlYvMWPmcnfEtg/CgIh.MKOm3mNpxxdISh/KrKcjaoohZF2WjPO','2024-10-11 13:44:03',0),(3,'julibe','julibe@gmail.com','$2y$10$fRYyphi1VeqKuz0OjE5bieLqs2C6aCkhtuDnCSFBEBkLvoSgvlBs6','2024-10-11 16:00:07',0),(4,'france','france@gmail.com','$2y$10$Wkl6yLzNRHYmG5Ustot6OOsLBdMG5B8b3/lGuzPB8zcH3KU3T/GCu','2024-10-13 23:28:36',0),(6,'efren','efren@gmail.com','$2y$10$gpEE/ykqiev5yu4LnDZCf.1YpUABXH3mWT8zmnnGFYsnP9NoJR5/y','2024-10-14 04:09:13',0),(7,'lloydiii','jsmacay.student@asiancollege.edu.ph','$2y$10$rqxlZVgvOAEK3CMCSTLVqOMMaaSV1X/efeiVfI6vtNJr4YgJaq2ly','2024-10-14 04:39:29',0),(8,'harbe','harbe@gmail.com','$2y$10$FlhgBq/Lcj7O76Bsk7xH/uLY1.XQyhjspt1BxdK5McK8e56lw3B82','2024-10-14 04:45:37',0),(9,'admin','admin@example.com','$2y$10$2EMVtcrrHqJmNOsLvjFH0u23Ldcru2NpdfAwu8dah2u7ByhM5.Lba','2024-11-21 04:11:31',1),(12,'jmabalos','jmabalos@gmail.com','$2y$10$SnxdgSGw5gMxzwk2SQVJv./8jDuxVJt2U4eZVud2wHjuxK58dskHK','2024-11-25 03:18:45',0);
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

-- Dump completed on 2024-12-09  8:02:18
