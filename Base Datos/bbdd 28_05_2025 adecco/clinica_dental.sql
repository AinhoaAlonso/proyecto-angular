CREATE DATABASE  IF NOT EXISTS `clinica_dental` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clinica_dental`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: clinica_dental
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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id_appointments` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `professional_id` int DEFAULT NULL,
  `treatments_id` int DEFAULT NULL,
  `date_appointments` date NOT NULL,
  `start_time_appointments` datetime NOT NULL,
  `duration_minutes_appointments` int DEFAULT NULL,
  `status_appointments` enum('pendiente','confirmada','cancelada','realizada') NOT NULL,
  `cancellation_reason_appointments` longtext,
  `created_by_appointments` enum('admin','professional') DEFAULT NULL,
  PRIMARY KEY (`id_appointments`),
  KEY `patients_id_idx` (`patient_id`),
  KEY `professiona_id_idx` (`professional_id`),
  KEY `treatments_id_idx` (`treatments_id`),
  CONSTRAINT `patients_id` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id_patients`),
  CONSTRAINT `professiona_id` FOREIGN KEY (`professional_id`) REFERENCES `professionals` (`id_professionals`),
  CONSTRAINT `treatments_id` FOREIGN KEY (`treatments_id`) REFERENCES `treatments` (`id_treatments`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks_professionals`
--

DROP TABLE IF EXISTS `blocks_professionals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocks_professionals` (
  `idblocks_room_professionals` int NOT NULL AUTO_INCREMENT,
  `professionals_id` int NOT NULL,
  `start_date_blocks` date NOT NULL,
  `end_date_blocks` date NOT NULL,
  `start_time_blocks` time NOT NULL,
  `end_time_blocks` time NOT NULL,
  `reason_blocks` longtext NOT NULL,
  PRIMARY KEY (`idblocks_room_professionals`),
  KEY `id_professionals_idx` (`professionals_id`),
  CONSTRAINT `id_professionals` FOREIGN KEY (`professionals_id`) REFERENCES `professionals` (`id_professionals`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks_professionals`
--

LOCK TABLES `blocks_professionals` WRITE;
/*!40000 ALTER TABLE `blocks_professionals` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocks_professionals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id_patients` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `nif_patients` varchar(20) DEFAULT NULL,
  `name_patients` varchar(100) NOT NULL,
  `last_name_patients` varchar(100) NOT NULL,
  `phone_patients` varchar(20) NOT NULL,
  `email_patients` varchar(50) NOT NULL,
  `is_active_patients` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_patients`),
  UNIQUE KEY `email_patients_UNIQUE` (`email_patients`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `id_users_idx` (`user_id`),
  CONSTRAINT `id_users_patients` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professional_availabilities`
--

DROP TABLE IF EXISTS `professional_availabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professional_availabilities` (
  `id_professional_availabilities` int NOT NULL AUTO_INCREMENT,
  `professional_id` int NOT NULL,
  `date_availability` date NOT NULL,
  `start_time_availability` varchar(45) NOT NULL,
  `end_time_avalaibility` varchar(45) NOT NULL,
  `status_availability` enum('libre','reservado','no disponible') NOT NULL,
  PRIMARY KEY (`id_professional_availabilities`),
  KEY `id_professionals_idx` (`professional_id`),
  CONSTRAINT `id_professional` FOREIGN KEY (`professional_id`) REFERENCES `professionals` (`id_professionals`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professional_availabilities`
--

LOCK TABLES `professional_availabilities` WRITE;
/*!40000 ALTER TABLE `professional_availabilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `professional_availabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professionals`
--

DROP TABLE IF EXISTS `professionals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professionals` (
  `id_professionals` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `nif_professionals` varchar(20) NOT NULL,
  `license_number_professional` varchar(50) NOT NULL,
  `name_professional` varchar(100) NOT NULL,
  `last_name_professional` varchar(100) NOT NULL,
  `phone_professionals` varchar(20) NOT NULL,
  `email_professional` varchar(50) NOT NULL,
  `assigned_room_professional` varchar(10) DEFAULT NULL,
  `is_active_professionals` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_professionals`,`user_id`),
  UNIQUE KEY `license_number_professional_UNIQUE` (`license_number_professional`),
  UNIQUE KEY `email_professional_UNIQUE` (`email_professional`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `id_users_idx` (`user_id`),
  CONSTRAINT `id_users_professionals` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professionals`
--

LOCK TABLES `professionals` WRITE;
/*!40000 ALTER TABLE `professionals` DISABLE KEYS */;
/*!40000 ALTER TABLE `professionals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatments`
--

DROP TABLE IF EXISTS `treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatments` (
  `id_treatments` int NOT NULL AUTO_INCREMENT,
  `name_treatments` varchar(100) NOT NULL,
  `type_treatments` varchar(50) DEFAULT NULL,
  `duration_minutes_treatments` int NOT NULL,
  `price_treatments` decimal(10,2) NOT NULL,
  `visible_to_patients_treatments` tinyint DEFAULT NULL,
  `is_active_treatments` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_treatments`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatments`
--

LOCK TABLES `treatments` WRITE;
/*!40000 ALTER TABLE `treatments` DISABLE KEYS */;
/*!40000 ALTER TABLE `treatments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_users` int NOT NULL AUTO_INCREMENT,
  `rol_users` enum('admin','dentista','paciente') NOT NULL DEFAULT 'dentista',
  `is_active_users` tinyint NOT NULL DEFAULT '1',
  `username_users` varchar(255) NOT NULL,
  `password_users` varchar(255) NOT NULL,
  PRIMARY KEY (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin',1,'admin@admin.com','$2b$10$Rvo32XKqeHxIUQcjzvy/vOCmpyoiEYaRPLpl7MI/vMtNWBS2o1m8.'),(2,'dentista',1,'asusalin@asusalin.com','$2b$10$AZmUjfc2u/I2RLgvA77qp.T/5wbF7pi2.8F95QfMHrjBwrZ.AapZO'),(3,'dentista',1,'horacio@horacio.com','$2b$10$0GiEmYtfcr1JxvKuB/4F3er1P7m7rKN6kHfM6btiyCx19NDTxN8H6'),(4,'dentista',1,'fran@fran.com','$2b$10$9inSRQstlnIhlb/sEd3JiuYVqUXsephFX07GBcA/4Da1ORyifuDlW'),(5,'dentista',1,'ainhoa@ainhoa.com','$2b$10$m9aN..t0DfnhR4TUvcuBtu7CiGGfyb7Yu/G3vBeYTZBsAfncWZ8La'),(7,'dentista',1,'prueba@prueba.com','$2b$10$VziwJD8ZS2XcGwb4rLicce95.nU7TLQem9IQCjKkjhk8OVn.bj7da');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'clinica_dental'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-28 13:17:24
