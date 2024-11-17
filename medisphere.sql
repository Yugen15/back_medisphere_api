-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: medisphere
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `paciente_id` bigint unsigned NOT NULL,
  `doctor_id` bigint unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `estado` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `citas_paciente_id_foreign` (`paciente_id`),
  KEY `citas_doctor_id_foreign` (`doctor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (1,1,1,'Consulta inicial','2024-11-15 22:00:00','Confirmada','2024-11-14 02:44:45','2024-11-14 15:32:02'),(2,2,2,'Control de seguimiento','2024-11-16 15:00:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:46:45'),(3,3,3,'Evaluación dermatológica','2024-11-17 20:30:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:46:52'),(4,4,4,'Consulta neurológica','2024-11-18 19:00:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:46:58'),(5,5,5,'Evaluación digestiva','2024-11-19 17:00:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:47:05'),(6,6,6,'Consulta de oncología','2024-11-20 21:00:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:47:12'),(7,7,7,'Control ginecológico','2024-11-21 16:00:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:47:20'),(8,8,8,'Revisión ortopédica','2024-11-22 18:00:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:47:26'),(9,9,9,'Control endocrinológico','2024-11-23 22:30:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:47:31'),(10,10,10,'Evaluación psiquiátrica','2024-11-24 23:00:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:47:38'),(11,11,11,'Consulta reumatológica','2024-11-25 15:30:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:47:44'),(12,12,12,'Revisión urológica','2024-11-26 17:30:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:48:00'),(13,13,13,'Evaluación nefrológica','2024-11-27 21:00:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:48:05'),(14,14,14,'Control hematológico','2024-11-28 19:30:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:48:13'),(15,15,15,'Revisión inmunológica','2024-11-29 15:00:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:48:20'),(16,16,16,'Consulta oftalmológica','2024-11-30 16:30:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:48:28'),(17,17,17,'Evaluación neumológica','2024-12-01 17:00:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:48:38'),(18,18,18,'Control otorrinolaringológico','2023-12-02 12:00:00','Agendada','2024-11-14 02:44:45','2024-11-14 02:44:45'),(19,19,19,'Estudio radiológico','2024-12-03 20:00:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:48:48'),(20,20,20,'Evaluación alergológica','2024-12-04 22:30:00','Pendiente','2024-11-14 02:44:45','2024-11-14 02:48:55'),(22,3,3,'Diagnostico Sidgo','2024-11-15 22:00:00','Confirmada','2024-11-14 17:18:16','2024-11-14 17:23:14'),(23,2,4,'nueva','2024-11-14 11:20:00','Pendiente','2024-11-14 17:20:49','2024-11-14 17:20:49');
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `estado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diagnostico` text COLLATE utf8mb4_unicode_ci,
  `id_cita` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `consultas_id_cita_unique` (`id_cita`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
INSERT INTO `consultas` VALUES (1,'2024-11-15','Completada','Hipertensión leve',1,NULL,NULL,NULL),(2,'2024-11-16','Confirmada','Seguimiento de peso',2,NULL,NULL,NULL),(3,'2024-11-17','Completada','Le duele el pelo',3,NULL,'2024-11-14 17:27:36',NULL),(4,'2024-11-18','Pendiente','Migraña crónica',4,NULL,NULL,NULL),(5,'2024-11-19','Completada','Gastritis',5,NULL,NULL,NULL),(6,'2024-11-20','Confirmada','Cáncer de mama',6,NULL,NULL,NULL),(7,'2024-11-21','Completada','Revisión ginecológica',7,NULL,NULL,NULL),(8,'2024-11-22','Confirmada','Fractura de muñeca',8,NULL,NULL,NULL),(9,'2024-11-23','Pendiente','Diabetes mellitus',9,NULL,NULL,NULL),(10,'2024-11-24','Completada','Trastorno de ansiedad',10,NULL,NULL,NULL),(11,'2024-11-25','Confirmada','Artritis reumatoide',11,NULL,NULL,NULL),(12,'2024-11-26','Completada','Infección urinaria',12,NULL,NULL,NULL),(13,'2024-11-27','Pendiente','Insuficiencia renal',13,NULL,NULL,NULL),(14,'2024-11-28','Confirmada','Anemia',14,NULL,NULL,NULL),(15,'2024-11-29','Completada','Alergia respiratoria',15,NULL,NULL,NULL),(16,'2024-11-30','Confirmada','Catarata',16,NULL,NULL,NULL),(17,'2024-12-01','Completada','Asma',17,NULL,NULL,NULL),(18,'2024-12-02','Pendiente','Sinusitis',18,NULL,NULL,NULL),(19,'2024-12-03','Confirmada','Dolor lumbar',19,NULL,NULL,NULL),(20,'2024-12-04','Completada','Rinitis alérgica',20,NULL,NULL,NULL),(21,'2024-11-15','Pendiente',NULL,21,'2024-11-14 15:32:24','2024-11-14 15:32:24',NULL),(22,'2024-11-14','Pendiente',NULL,22,'2024-11-14 17:18:16','2024-11-14 17:18:16',NULL),(23,'2024-11-14','Pendiente',NULL,23,'2024-11-14 17:20:49','2024-11-14 17:20:49',NULL);
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidades` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
INSERT INTO `especialidades` VALUES (1,'Cardiología',NULL,NULL),(2,'Pediatría',NULL,NULL),(3,'Dermatología',NULL,NULL),(4,'Neurología',NULL,NULL),(5,'Gastroenterología',NULL,NULL),(6,'Oncología',NULL,NULL),(7,'Ginecología',NULL,NULL),(8,'Ortopedia',NULL,NULL),(9,'Endocrinología',NULL,NULL),(10,'Psiquiatría',NULL,NULL),(11,'Reumatología',NULL,NULL),(12,'Urología',NULL,NULL),(13,'Nefrología',NULL,NULL),(14,'Hematología',NULL,NULL),(15,'Inmunología',NULL,NULL),(16,'Oftalmología',NULL,NULL),(17,'Neumología',NULL,NULL),(18,'Otorrinolaringología',NULL,NULL),(19,'Radiología',NULL,NULL),(20,'Alergología',NULL,NULL);
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examenes`
--

DROP TABLE IF EXISTS `examenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examenes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resultado` text COLLATE utf8mb4_unicode_ci,
  `id_consulta` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `examenes_id_consulta_foreign` (`id_consulta`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examenes`
--

LOCK TABLES `examenes` WRITE;
/*!40000 ALTER TABLE `examenes` DISABLE KEYS */;
INSERT INTO `examenes` VALUES (1,'Electrocardiograma','Normal',1,NULL,NULL,NULL),(2,'Análisis de sangre','Hemoglobina baja',2,NULL,NULL,NULL),(3,'Biopsia de piel','No maligno',3,NULL,NULL,NULL),(4,'Resonancia magnética','Lesión leve',4,NULL,NULL,NULL),(5,'Endoscopia','Gastritis leve',5,NULL,NULL,NULL),(6,'Biopsia','Positivo',6,NULL,NULL,NULL),(7,'Ecografía','Útero normal',7,NULL,NULL,NULL),(8,'Rayos X','Fractura visible',8,NULL,NULL,NULL),(9,'Análisis de glucosa','Elevada',9,NULL,NULL,NULL),(10,'Prueba de estrés','Ansiedad confirmada',10,NULL,NULL,NULL),(11,'Análisis de factor reumatoide','Positivo',11,NULL,NULL,NULL),(12,'Análisis de orina','Bacterias presentes',12,NULL,NULL,NULL),(13,'Pruebas renales','Creatinina alta',13,NULL,NULL,NULL),(14,'Hemograma completo','Anemia moderada',14,NULL,NULL,NULL),(15,'Prueba de alergia','Positiva',15,NULL,NULL,NULL),(16,'OCT','Degeneración leve',16,NULL,NULL,NULL),(17,'Espirometría','Restricción leve',17,NULL,NULL,NULL),(18,'TAC de senos paranasales','Sinusitis',18,NULL,NULL,NULL),(19,'Radiografía lumbar','Hernia discal',19,NULL,NULL,NULL),(20,'Prueba de IgE','Alta',20,NULL,NULL,NULL),(21,'Electrocardiograma','preocupante',1,'2024-11-14 15:43:53','2024-11-14 15:44:54',NULL),(22,'Electrocardiograma','normal',3,'2024-11-14 17:30:00','2024-11-14 17:30:30','2024-11-14 17:30:30');
/*!40000 ALTER TABLE `examenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_especialidad` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medicos_id_especialidad_foreign` (`id_especialidad`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` VALUES (1,'Juan','Perez',1,NULL,NULL,NULL),(2,'Ana','Martinez',2,NULL,NULL,NULL),(3,'Carlos','Lopez',3,NULL,NULL,NULL),(4,'Maria','Garcia',4,NULL,NULL,NULL),(5,'Luis','Hernandez',5,NULL,NULL,NULL),(6,'Carmen','Gomez',6,NULL,NULL,NULL),(7,'Jose','Diaz',7,NULL,NULL,NULL),(8,'Marta','Morales',8,NULL,NULL,NULL),(9,'Sergio','Torres',9,NULL,NULL,NULL),(10,'Laura','Ruiz',10,NULL,NULL,NULL),(11,'Jorge','Ramirez',11,NULL,NULL,NULL),(12,'Elena','Ortiz',12,NULL,NULL,NULL),(13,'Victor','Vargas',13,NULL,NULL,NULL),(14,'Lucia','Gutierrez',14,NULL,NULL,NULL),(15,'Miguel','Castillo',15,NULL,NULL,NULL),(17,'Andres','Jimenez',17,NULL,NULL,NULL),(18,'Claudia','Rios',18,NULL,NULL,NULL),(19,'Ricardo','Flores',19,NULL,NULL,NULL),(20,'Gabriela','Mendoza',20,NULL,NULL,NULL),(21,'David','Mendoza',1,'2024-11-14 03:05:01','2024-11-14 03:05:01',NULL),(22,'Juan Carlos','Bodoque',1,'2024-11-14 15:24:24','2024-11-14 15:24:24',NULL),(23,'Juan Carlos','Bodoque II',1,'2024-11-14 17:12:10','2024-11-14 17:12:51',NULL);
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2024_10_01_161000_create_citas_table',1),(7,'2024_10_20_165706_create_especialidads_table',1),(8,'2024_10_20_214009_create_medicos_table',1),(9,'2024_10_24_213318_create_pacientes_table',1),(10,'2024_10_25_223559_create_consultas_table',1),(11,'2024_11_11_155054_create_examenes_table',1),(12,'2024_11_11_155324_create_recetas_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dui` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES (1,'Pedro','Alvarez','12345678-9','1985-02-15',NULL,NULL),(2,'Lucia','Contreras','98765432-1','1992-11-23',NULL,NULL),(3,'Carlos','Jimenez','15935728-4','1980-07-30',NULL,NULL),(4,'Laura','Navarro','75395146-2','1994-03-17',NULL,NULL),(5,'Andres','Lopez','85236947-5','1983-06-25',NULL,NULL),(6,'Rosa','Mejia','95175328-9','1975-10-05',NULL,NULL),(7,'Miguel','Silva','12378945-6','1991-09-09',NULL,NULL),(8,'Andrea','Molina','25896314-7','1988-04-12',NULL,NULL),(9,'Victor','Martinez','96325871-3','1978-05-15',NULL,NULL),(10,'Sofia','Fuentes','32165498-7','1990-12-20',NULL,NULL),(11,'Luis','Vega','15948763-2','1982-01-10',NULL,NULL),(12,'Claudia','Diaz','78965412-3','1979-03-30',NULL,NULL),(13,'Ricardo','Guzman','74185296-5','1986-08-23',NULL,NULL),(14,'Gabriela','Ortega','35795146-9','1993-10-19',NULL,NULL),(15,'Ana','Castro','96321458-2','1985-02-14',NULL,NULL),(16,'Carlos','Lopez','87456321-4','1974-07-22',NULL,NULL),(17,'Julio','Morales','12547896-1','1995-09-15',NULL,NULL),(18,'Patricia','Vargas','85214796-5','1987-11-02',NULL,NULL),(19,'Enrique','Soto','32147895-2','1981-06-11',NULL,NULL),(20,'Diana','Perez','14785236-4','1989-12-29',NULL,NULL),(21,'Juan carlos','Bodoque','073624342','2003-05-13','2024-11-14 15:27:19','2024-11-14 15:27:19');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',12,'api-key','163aa0d240411ff9ee3e2223e943e8a7037e216f37d61bcdc9aec89ded28466c','[\"*\"]',NULL,NULL,'2024-11-14 02:46:13','2024-11-14 02:46:13'),(2,'App\\Models\\User',12,'api-key','45ad40762541512b9b71d798d8daf628a70542f5899c7fec22c7093c9be3210d','[\"*\"]',NULL,NULL,'2024-11-14 02:46:15','2024-11-14 02:46:15'),(3,'App\\Models\\User',12,'api-key','928ed161e65ec62bc320f079c05829e344848505d981bfa6ce8c5d9ac257abdd','[\"*\"]',NULL,NULL,'2024-11-14 02:46:15','2024-11-14 02:46:15'),(4,'App\\Models\\User',12,'api-key','d5ec3c92fafef94167fbd6660b06520c220a4c1e97c6e321131a2e8d2bf5322f','[\"*\"]',NULL,NULL,'2024-11-14 02:46:16','2024-11-14 02:46:16'),(5,'App\\Models\\User',12,'api-key','49b266082844413dbe16a8c7e57b187c7d9c6f07cbff315909f9e48e940a2d51','[\"*\"]',NULL,NULL,'2024-11-14 02:46:16','2024-11-14 02:46:16'),(6,'App\\Models\\User',12,'api-key','818c32ffcca84df077ec2e5bab0114cae82ff23778367da2255088fff9715747','[\"*\"]',NULL,NULL,'2024-11-14 02:46:16','2024-11-14 02:46:16'),(7,'App\\Models\\User',12,'api-key','82d6d7927b45966121180cd7bbb912ceab9150ba81aacbd408366fc64ba93746','[\"*\"]',NULL,NULL,'2024-11-14 02:46:17','2024-11-14 02:46:17'),(8,'App\\Models\\User',12,'api-key','21df59e05b975e499407f41cfc7bd6ba9fbc7c309b8f9e6109964f1157a26675','[\"*\"]','2024-11-14 02:49:46',NULL,'2024-11-14 02:46:17','2024-11-14 02:49:46'),(9,'App\\Models\\User',12,'api-key','b7e57abcfb3f1b86c6d19b0567b62aa9da6ffe9fbd0550654c7a0f3c0065de61','[\"*\"]','2024-11-14 03:02:19',NULL,'2024-11-14 02:56:20','2024-11-14 03:02:19'),(10,'App\\Models\\User',12,'api-key','0fcc402304e4300e2f297b8c71a003833b8b5a6e3fcd32873a9eee55b1c11173','[\"*\"]','2024-11-14 03:05:21',NULL,'2024-11-14 03:02:35','2024-11-14 03:05:21'),(11,'App\\Models\\User',12,'api-key','36f22015b0a255ab65bd994efd7871d74944e98ade0c080e71a37d8e3109ef7a','[\"*\"]','2024-11-14 15:47:44',NULL,'2024-11-14 15:22:10','2024-11-14 15:47:44'),(12,'App\\Models\\User',12,'api-key','aff798a0c9677515aa4d8cfc9e31be61e916e46cc6dd8502f21c159cdf395b70','[\"*\"]','2024-11-14 17:10:00',NULL,'2024-11-14 17:01:41','2024-11-14 17:10:00'),(13,'App\\Models\\User',12,'api-key','94d5cad327e5866a6d5f5265a4725804aee9cfc2e1ee2e2d54cc997170e12419','[\"*\"]','2024-11-14 17:32:01',NULL,'2024-11-14 17:10:13','2024-11-14 17:32:01'),(14,'App\\Models\\User',12,'api-key','ea384362bb0a5e197a427cc211dd5d03968809c8fa955dce0d31d404caf705aa','[\"*\"]','2024-11-14 17:35:10',NULL,'2024-11-14 17:35:01','2024-11-14 17:35:10');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `medicamento` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dosis` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_consulta` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recetas_id_consulta_foreign` (`id_consulta`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
INSERT INTO `recetas` VALUES (1,'Lisinopril','10 mg una vez al día',1,NULL,NULL),(2,'Paracetamol','500 mg cada 6 horas',2,NULL,NULL),(3,'Corticoides tópicos','Aplicar una vez al día',3,NULL,NULL),(4,'Amitriptilina','25 mg antes de dormir',4,NULL,NULL),(5,'Omeprazol','20 mg antes de comer',5,NULL,NULL),(6,'Tamoxifeno','20 mg diarios',6,NULL,NULL),(7,'Ácido fólico','1 mg diario',7,NULL,NULL),(8,'Ibuprofeno','400 mg cada 8 horas',8,NULL,NULL),(9,'Metformina','500 mg dos veces al día',9,NULL,NULL),(10,'Sertralina','50 mg al día',10,NULL,NULL),(11,'Metotrexato','10 mg semanal',11,NULL,NULL),(12,'Amoxicilina','500 mg cada 8 horas',12,NULL,NULL),(13,'Eritropoyetina','3.000 U cada semana',13,NULL,NULL),(14,'Hierro','325 mg diarios',14,NULL,NULL),(15,'Loratadina','10 mg diario',15,NULL,NULL),(16,'Brinzolamida','1 gota cada 8 horas',16,NULL,NULL),(17,'Salbutamol','2 inhalaciones cada 6 horas',17,NULL,NULL),(18,'Fluticasona','1 aplicación cada noche',18,NULL,NULL),(19,'Paracetamol','500 mg cada 8 horas',19,NULL,NULL),(20,'Cetirizina','10 mg diario',20,NULL,NULL),(21,'acetaminofen','1 cada 8 horas',1,'2024-11-14 15:41:51','2024-11-14 15:42:17'),(23,'acetaminofen','1 cada 12 horas',3,'2024-11-14 17:28:46','2024-11-14 17:29:31');
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mr. Justen Farrell IV','hattie.abshire@example.net','2024-11-14 02:44:38','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','4QMcCedQLl','2024-11-14 02:44:38','2024-11-14 02:44:38'),(2,'Dr. Chesley Batz I','ztoy@example.org','2024-11-14 02:44:38','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','rP8n108pql','2024-11-14 02:44:38','2024-11-14 02:44:38'),(3,'Giovanny Lebsack','maddison.metz@example.net','2024-11-14 02:44:38','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','1efPUaQWpA','2024-11-14 02:44:38','2024-11-14 02:44:38'),(4,'Gayle Schoen','stoltenberg.baron@example.net','2024-11-14 02:44:38','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','NGCliroAMb','2024-11-14 02:44:38','2024-11-14 02:44:38'),(5,'Maia Hilpert I','vmurazik@example.net','2024-11-14 02:44:38','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','wti7K9zGHI','2024-11-14 02:44:38','2024-11-14 02:44:38'),(6,'Reuben Prohaska','langosh.kristoffer@example.org','2024-11-14 02:44:38','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','4RQnVlgN0L','2024-11-14 02:44:38','2024-11-14 02:44:38'),(7,'Aurelio Renner Sr.','vhessel@example.net','2024-11-14 02:44:38','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','5MHf2Scdgl','2024-11-14 02:44:38','2024-11-14 02:44:38'),(8,'Jeffery Crona','wharvey@example.com','2024-11-14 02:44:38','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','v9Z31Sz2N1','2024-11-14 02:44:38','2024-11-14 02:44:38'),(9,'Ms. Luz Runolfsson Jr.','usenger@example.org','2024-11-14 02:44:38','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9rfxw8Wg9o','2024-11-14 02:44:38','2024-11-14 02:44:38'),(10,'Drake Kulas','retta.wilkinson@example.com','2024-11-14 02:44:38','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9jOEZ1ksYe','2024-11-14 02:44:38','2024-11-14 02:44:38'),(11,'Test User','test@example.com','2024-11-14 02:44:38','$2y$10$aXoOQK1W/isRKHlz9Py6N.GD4RH.rVhLo5YJFdTEkmNhC/Jtuj.Au','KsZssXEeDQ','2024-11-14 02:44:38','2024-11-14 02:44:38'),(12,'David','admin@gmail.com',NULL,'$2y$10$UVmiD07Wj9Kfuebmxp55Iu/IIFlpvSoggecSaNM0TOKHA64X/YFsG',NULL,'2024-11-14 02:44:39','2024-11-14 02:44:39'),(13,'quesito','quesito@medishpere.com',NULL,'$2y$10$tFF5nATRewU/CNHT8j/XRemWYF1lY4hfnonU6ba6AUFRl09Vy7JmS',NULL,'2024-11-14 17:33:28','2024-11-14 17:34:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'medisphere'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-17 13:53:08
