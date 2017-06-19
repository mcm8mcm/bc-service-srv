-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: service
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.21-MariaDB

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
-- Table structure for table `mcmbcs_appointments`
--

DROP TABLE IF EXISTS `mcmbcs_appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcmbcs_appointments` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(6) unsigned NOT NULL,
  `employee_id` int(4) unsigned NOT NULL,
  `date_n_time` datetime NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT 'Без комментария',
  `done_at` datetime DEFAULT NULL,
  `done_comment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_appointment_task` (`task_id`),
  KEY `idx_appointment_employee` (`employee_id`),
  KEY `idx_appointment_date` (`date_n_time`),
  CONSTRAINT `fk_appointment_employee` FOREIGN KEY (`employee_id`) REFERENCES `mcmbcs_employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_task` FOREIGN KEY (`task_id`) REFERENCES `mcmbcs_tasks` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcmbcs_appointments`
--

LOCK TABLES `mcmbcs_appointments` WRITE;
/*!40000 ALTER TABLE `mcmbcs_appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcmbcs_appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcmbcs_brands`
--

DROP TABLE IF EXISTS `mcmbcs_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcmbcs_brands` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT 'ACME',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcmbcs_brands`
--

LOCK TABLES `mcmbcs_brands` WRITE;
/*!40000 ALTER TABLE `mcmbcs_brands` DISABLE KEYS */;
INSERT INTO `mcmbcs_brands` VALUES (1,'Samsung','2017-06-13 05:15:29','2017-06-13 05:15:29',NULL),(2,'LG','2017-06-13 05:17:05','2017-06-13 05:17:05',NULL);
/*!40000 ALTER TABLE `mcmbcs_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcmbcs_complaint_categories`
--

DROP TABLE IF EXISTS `mcmbcs_complaint_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcmbcs_complaint_categories` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL DEFAULT 'НЕИЗВЕСТНАЯ КАТЕГОРИЯ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcmbcs_complaint_categories`
--

LOCK TABLES `mcmbcs_complaint_categories` WRITE;
/*!40000 ALTER TABLE `mcmbcs_complaint_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcmbcs_complaint_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcmbcs_complaints`
--

DROP TABLE IF EXISTS `mcmbcs_complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcmbcs_complaints` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `complainer_name` varchar(64) DEFAULT NULL,
  `complainerr_phone` varchar(25) DEFAULT NULL,
  `complainer_email` varchar(64) DEFAULT NULL,
  `complaint_content` varchar(255) DEFAULT NULL,
  `complaint_category` int(2) unsigned NOT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  `deleted_at` varchar(45) DEFAULT NULL,
  `processed_at` timestamp NULL DEFAULT NULL,
  `processing_comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_complaint_category` (`complaint_category`),
  KEY `idx_complaint_processed_at` (`processed_at`),
  CONSTRAINT `fk_complaints_category` FOREIGN KEY (`complaint_category`) REFERENCES `mcmbcs_complaint_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcmbcs_complaints`
--

LOCK TABLES `mcmbcs_complaints` WRITE;
/*!40000 ALTER TABLE `mcmbcs_complaints` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcmbcs_complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcmbcs_customers`
--

DROP TABLE IF EXISTS `mcmbcs_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcmbcs_customers` (
  `id` int(5) unsigned NOT NULL,
  `first_name` varchar(25) NOT NULL DEFAULT 'Имя',
  `patronymic` varchar(25) DEFAULT 'Отчество',
  `last_name` varchar(25) NOT NULL DEFAULT 'Фамилия',
  `addr_region` varchar(25) DEFAULT NULL,
  `addr_district` varchar(25) DEFAULT NULL,
  `addr_city` varchar(25) DEFAULT NULL,
  `addr_street` varchar(15) DEFAULT NULL,
  `addr_home` varchar(10) DEFAULT NULL,
  `addr_flat` varchar(5) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `aux_phone_numbers` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `user_id` int(6) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_user_customer` (`user_id`),
  CONSTRAINT `fk_user_customer` FOREIGN KEY (`user_id`) REFERENCES `mcmbcs_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcmbcs_customers`
--

LOCK TABLES `mcmbcs_customers` WRITE;
/*!40000 ALTER TABLE `mcmbcs_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcmbcs_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcmbcs_devices`
--

DROP TABLE IF EXISTS `mcmbcs_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcmbcs_devices` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `devtype` int(4) NOT NULL,
  `brand` int(4) NOT NULL,
  `devmodel` varchar(45) DEFAULT NULL,
  `serialnom` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_sn` (`serialnom`),
  KEY `idx_devtype` (`devtype`),
  KEY `idx_brand` (`brand`),
  CONSTRAINT `fk_brand` FOREIGN KEY (`brand`) REFERENCES `mcmbcs_brands` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_devtype` FOREIGN KEY (`devtype`) REFERENCES `mcmbcs_devtypes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcmbcs_devices`
--

LOCK TABLES `mcmbcs_devices` WRITE;
/*!40000 ALTER TABLE `mcmbcs_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcmbcs_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcmbcs_devtypes`
--

DROP TABLE IF EXISTS `mcmbcs_devtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcmbcs_devtypes` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT 'Абстрактное устройство',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcmbcs_devtypes`
--

LOCK TABLES `mcmbcs_devtypes` WRITE;
/*!40000 ALTER TABLE `mcmbcs_devtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcmbcs_devtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcmbcs_employees`
--

DROP TABLE IF EXISTS `mcmbcs_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcmbcs_employees` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) NOT NULL,
  `patronymic` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `employee_type` int(1) NOT NULL,
  `user_id` int(6) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`),
  CONSTRAINT `fk_emploee_user` FOREIGN KEY (`user_id`) REFERENCES `mcmbcs_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcmbcs_employees`
--

LOCK TABLES `mcmbcs_employees` WRITE;
/*!40000 ALTER TABLE `mcmbcs_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcmbcs_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcmbcs_enum_task_actions`
--

DROP TABLE IF EXISTS `mcmbcs_enum_task_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcmbcs_enum_task_actions` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT 'Действие не определено',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcmbcs_enum_task_actions`
--

LOCK TABLES `mcmbcs_enum_task_actions` WRITE;
/*!40000 ALTER TABLE `mcmbcs_enum_task_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcmbcs_enum_task_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcmbcs_enum_task_statuses`
--

DROP TABLE IF EXISTS `mcmbcs_enum_task_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcmbcs_enum_task_statuses` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT 'Статус не определен',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcmbcs_enum_task_statuses`
--

LOCK TABLES `mcmbcs_enum_task_statuses` WRITE;
/*!40000 ALTER TABLE `mcmbcs_enum_task_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcmbcs_enum_task_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcmbcs_migrations`
--

DROP TABLE IF EXISTS `mcmbcs_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcmbcs_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcmbcs_migrations`
--

LOCK TABLES `mcmbcs_migrations` WRITE;
/*!40000 ALTER TABLE `mcmbcs_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcmbcs_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcmbcs_schedules`
--

DROP TABLE IF EXISTS `mcmbcs_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcmbcs_schedules` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `emploee_id` int(4) unsigned NOT NULL,
  `free_from` datetime NOT NULL,
  `free_until` datetime NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT 'Полностью свободен',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_schedule_employee` (`emploee_id`),
  CONSTRAINT `fk_schedule_employee` FOREIGN KEY (`emploee_id`) REFERENCES `mcmbcs_employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcmbcs_schedules`
--

LOCK TABLES `mcmbcs_schedules` WRITE;
/*!40000 ALTER TABLE `mcmbcs_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcmbcs_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcmbcs_tasks`
--

DROP TABLE IF EXISTS `mcmbcs_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcmbcs_tasks` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `task_number` int(6) NOT NULL,
  `customer_id` int(5) unsigned NOT NULL,
  `manager_id` int(6) unsigned NOT NULL,
  `device_id` int(6) NOT NULL,
  `device_condition` varchar(64) NOT NULL,
  `device_set` varchar(45) DEFAULT NULL,
  `complaint` varchar(64) DEFAULT NULL,
  `ticket_id` int(6) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_device` (`device_id`),
  KEY `idx_customer` (`customer_id`),
  KEY `idx_manager` (`manager_id`),
  KEY `idx_ticket` (`ticket_id`),
  CONSTRAINT `fk_task_customer` FOREIGN KEY (`customer_id`) REFERENCES `mcmbcs_customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_task_device` FOREIGN KEY (`device_id`) REFERENCES `mcmbcs_devices` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_task_manager` FOREIGN KEY (`manager_id`) REFERENCES `mcmbcs_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_task_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `mcmbcs_complaints` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcmbcs_tasks`
--

LOCK TABLES `mcmbcs_tasks` WRITE;
/*!40000 ALTER TABLE `mcmbcs_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcmbcs_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcmbcs_tasks_log`
--

DROP TABLE IF EXISTS `mcmbcs_tasks_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcmbcs_tasks_log` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(6) unsigned NOT NULL,
  `author_id` int(4) unsigned NOT NULL,
  `recipient_id` int(4) unsigned DEFAULT NULL,
  `add_comment` varchar(128) DEFAULT NULL,
  `close_comment` varchar(128) DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_tasks_log_author_id` (`author_id`),
  KEY `idx_tasks_log_recepient_id` (`recipient_id`),
  KEY `idx_tasks_log_task_id` (`task_id`),
  KEY `idx_tasks_log_closed` (`closed_at`),
  CONSTRAINT `fk_tasks_log_author` FOREIGN KEY (`author_id`) REFERENCES `mcmbcs_employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasks_log_recipient` FOREIGN KEY (`recipient_id`) REFERENCES `mcmbcs_employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasks_log_task` FOREIGN KEY (`task_id`) REFERENCES `mcmbcs_tasks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcmbcs_tasks_log`
--

LOCK TABLES `mcmbcs_tasks_log` WRITE;
/*!40000 ALTER TABLE `mcmbcs_tasks_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcmbcs_tasks_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcmbcs_users`
--

DROP TABLE IF EXISTS `mcmbcs_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mcmbcs_users` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `role` int(1) DEFAULT '9',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_remember_token` (`remember_token`),
  KEY `idx_name` (`name`),
  KEY `idx_users_active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcmbcs_users`
--

LOCK TABLES `mcmbcs_users` WRITE;
/*!40000 ALTER TABLE `mcmbcs_users` DISABLE KEYS */;
INSERT INTO `mcmbcs_users` VALUES (1,'admin','$2y$10$wgXBep2ejb2gu.5ILvy67OuYphZvSVbDAQ7CFmFEAfjrZ.RUoyKLK','mcmfspm@gmail.com','ysoKwgWct4mrPKu6CgWGh5SC2EB9lLldIReObdjwh4A4UWSiK75shng1B0Ma',1,1,'2017-06-15 05:08:23','2017-06-15 05:08:23',NULL);
/*!40000 ALTER TABLE `mcmbcs_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-19 16:28:33
