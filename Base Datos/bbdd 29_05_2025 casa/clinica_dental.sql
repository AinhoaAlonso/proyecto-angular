CREATE DATABASE  IF NOT EXISTS `clinica_dental` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clinica_dental`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: clinica_dental
-- ------------------------------------------------------
-- Server version	8.0.39

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
  `start_time_appointments` time NOT NULL,
  `duration_minutes_appointments` int DEFAULT NULL,
  `status_appointments` enum('pendiente','confirmada','cancelada','realizada') NOT NULL DEFAULT 'pendiente',
  `cancellation_reason_appointments` longtext,
  `created_by_appointments` enum('admin','professional') DEFAULT NULL,
  PRIMARY KEY (`id_appointments`),
  KEY `professiona_id_idx` (`professional_id`),
  KEY `treatments_id_idx` (`treatments_id`),
  CONSTRAINT `professiona_id` FOREIGN KEY (`professional_id`) REFERENCES `professionals` (`id_professionals`),
  CONSTRAINT `treatments_id` FOREIGN KEY (`treatments_id`) REFERENCES `treatments` (`id_treatments`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,1,7,NULL,'2025-06-01','09:00:00',60,'pendiente','',NULL),(2,2,7,NULL,'2025-06-01','10:00:00',60,'pendiente','',NULL),(3,3,7,NULL,'2025-06-01','11:00:00',60,'pendiente','',NULL),(4,4,7,NULL,'2025-06-01','12:00:00',60,'pendiente','',NULL),(5,5,7,NULL,'2025-06-01','13:00:00',60,'pendiente','',NULL),(6,6,8,NULL,'2025-06-02','09:00:00',60,'pendiente','',NULL),(7,7,8,NULL,'2025-06-02','10:00:00',60,'pendiente','',NULL),(8,8,8,NULL,'2025-06-02','11:00:00',60,'pendiente','',NULL),(9,9,8,NULL,'2025-06-02','12:00:00',60,'pendiente','',NULL),(10,10,8,NULL,'2025-06-02','13:00:00',60,'pendiente','',NULL),(11,11,9,NULL,'2025-06-03','09:00:00',60,'pendiente','',NULL),(12,12,9,NULL,'2025-06-03','10:00:00',60,'pendiente','',NULL),(13,13,9,NULL,'2025-06-03','11:00:00',60,'pendiente','',NULL),(14,14,9,NULL,'2025-06-03','12:00:00',60,'pendiente','',NULL),(15,15,9,NULL,'2025-06-03','13:00:00',60,'pendiente','',NULL),(16,16,10,NULL,'2025-06-04','09:00:00',60,'pendiente','',NULL),(17,17,10,NULL,'2025-06-04','10:00:00',60,'pendiente','',NULL),(18,18,10,NULL,'2025-06-04','11:00:00',60,'pendiente','',NULL),(19,19,10,NULL,'2025-06-04','12:00:00',60,'pendiente','',NULL),(20,20,10,NULL,'2025-06-04','13:00:00',60,'pendiente','',NULL);
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
  `nif_patients` varchar(20) DEFAULT NULL,
  `name_patients` varchar(100) NOT NULL,
  `last_name_patients` varchar(100) NOT NULL,
  `phone_patients` varchar(20) NOT NULL,
  `email_patients` varchar(50) NOT NULL,
  `is_active_patients` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_patients`),
  UNIQUE KEY `email_patients_UNIQUE` (`email_patients`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'12345678A','Ana','García','600123456','ana.garcia@example.com',1),(2,'23456789B','Luis','Martínez','600234567','luis.martinez@example.com',1),(3,'34567890C','María','López','600345678','maria.lopez@example.com',1),(4,'45678901D','Carlos','Sánchez','600456789','carlos.sanchez@example.com',1),(5,'56789012E','Laura','Fernández','600567890','laura.fernandez@example.com',1),(6,'67890123F','Javier','Ruiz','600678901','javier.ruiz@example.com',1),(7,'78901234G','Marta','Moreno','600789012','marta.moreno@example.com',1),(8,'89012345H','David','Jiménez','600890123','david.jimenez@example.com',1),(9,'90123456I','Sofía','Díaz','600901234','sofia.diaz@example.com',1),(10,'01234567J','Pablo','Torres','600012345','pablo.torres@example.com',1),(11,'11223344K','Elena','Vega','600112233','elena.vega@example.com',1),(12,'22334455L','Alberto','Castro','600223344','alberto.castro@example.com',1),(13,'33445566M','Isabel','Ortega','600334455','isabel.ortega@example.com',1),(14,'44556677N','Fernando','Marín','600445566','fernando.marin@example.com',1),(15,'55667788O','Cristina','Gómez','600556677','cristina.gomez@example.com',1),(16,'66778899P','Raúl','Soto','600667788','raul.soto@example.com',1),(17,'77889900Q','Natalia','Blanco','600778899','natalia.blanco@example.com',1),(18,'88990011R','Jorge','Ramos','600889900','jorge.ramos@example.com',1),(19,'99001122S','Patricia','Herrera','600990011','patricia.herrera@example.com',1),(20,'10101010T','Miguel','Molina','601010101','miguel.molina@example.com',1);
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
  `is_active_professionals` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_professionals`,`user_id`),
  UNIQUE KEY `license_number_professional_UNIQUE` (`license_number_professional`),
  UNIQUE KEY `email_professional_UNIQUE` (`email_professional`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `id_users_idx` (`user_id`),
  CONSTRAINT `id_users_professionals` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professionals`
--

LOCK TABLES `professionals` WRITE;
/*!40000 ALTER TABLE `professionals` DISABLE KEYS */;
INSERT INTO `professionals` VALUES (7,2,'00000002B','DENT-2222','Asusalin','Abouhala','555555555','asusalin@asusalin.com',NULL,1),(8,3,'00000003C','DENT-3333','Horacio','Horacio','555555555','horacio@horacio.com',NULL,1),(9,4,'00000004D','DENT-4444','Fran','Eliot','555555555','fran@fran.com',NULL,1),(10,5,'00000005E','DENT-5555','Ainhoa','Alonso','555555555','ainhoa@ainhoa.com',NULL,1);
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
  `username_users` varchar(255) NOT NULL,
  `password_users` varchar(255) NOT NULL,
  `rol_users` enum('admin','dentista','paciente') NOT NULL DEFAULT 'dentista',
  `is_active_users` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@admin.com','$2b$10$Rvo32XKqeHxIUQcjzvy/vOCmpyoiEYaRPLpl7MI/vMtNWBS2o1m8.','admin',1),(2,'asusalin@asusalin.com','$2b$10$AZmUjfc2u/I2RLgvA77qp.T/5wbF7pi2.8F95QfMHrjBwrZ.AapZO','dentista',1),(3,'horacio@horacio.com','$2b$10$0GiEmYtfcr1JxvKuB/4F3er1P7m7rKN6kHfM6btiyCx19NDTxN8H6','dentista',1),(4,'fran@fran.com','$2b$10$9inSRQstlnIhlb/sEd3JiuYVqUXsephFX07GBcA/4Da1ORyifuDlW','dentista',1),(5,'ainhoa@ainhoa.com','$2b$10$m9aN..t0DfnhR4TUvcuBtu7CiGGfyb7Yu/G3vBeYTZBsAfncWZ8La','dentista',1),(7,'prueba@prueba.com','$2b$10$VziwJD8ZS2XcGwb4rLicce95.nU7TLQem9IQCjKkjhk8OVn.bj7da','dentista',1);
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

-- Dump completed on 2025-05-28 23:03:03
