CREATE DATABASE  IF NOT EXISTS `blood_bank_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `blood_bank_management`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: blood_bank_management
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add city',6,'add_city'),(22,'Can change city',6,'change_city'),(23,'Can delete city',6,'delete_city'),(24,'Can view city',6,'view_city'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add donor',8,'add_donor'),(30,'Can change donor',8,'change_donor'),(31,'Can delete donor',8,'delete_donor'),(32,'Can view donor',8,'view_donor'),(33,'Can add blood bank',9,'add_bloodbank'),(34,'Can change blood bank',9,'change_bloodbank'),(35,'Can delete blood bank',9,'delete_bloodbank'),(36,'Can view blood bank',9,'view_bloodbank'),(37,'Can add donation',10,'add_donation'),(38,'Can change donation',10,'change_donation'),(39,'Can delete donation',10,'delete_donation'),(40,'Can view donation',10,'view_donation'),(41,'Can add camp',11,'add_camp'),(42,'Can change camp',11,'change_camp'),(43,'Can delete camp',11,'delete_camp'),(44,'Can view camp',11,'view_camp'),(45,'Can add hospital',12,'add_hospital'),(46,'Can change hospital',12,'change_hospital'),(47,'Can delete hospital',12,'delete_hospital'),(48,'Can view hospital',12,'view_hospital'),(49,'Can add request',13,'add_request'),(50,'Can change request',13,'change_request'),(51,'Can delete request',13,'delete_request'),(52,'Can view request',13,'view_request'),(53,'Can add password token',14,'add_passwordtoken'),(54,'Can change password token',14,'change_passwordtoken'),(55,'Can delete password token',14,'delete_passwordtoken'),(56,'Can view password token',14,'view_passwordtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloodbank_bloodbank`
--

DROP TABLE IF EXISTS `bloodbank_bloodbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloodbank_bloodbank` (
  `user_id` bigint NOT NULL,
  `bloodbank_name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `pincode` varchar(6) NOT NULL,
  `employees` int NOT NULL,
  `phone` varchar(10) NOT NULL,
  `manager_name` varchar(100) NOT NULL,
  `a_neg` int NOT NULL,
  `a_pos` int NOT NULL,
  `b_neg` int NOT NULL,
  `b_pos` int NOT NULL,
  `ab_neg` int NOT NULL,
  `ab_pos` int NOT NULL,
  `o_neg` int NOT NULL,
  `o_pos` int NOT NULL,
  `city_id` bigint NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `bloodbank_bloodbank_city_id_06e79990_fk_main_city_id` (`city_id`),
  CONSTRAINT `bloodbank_bloodbank_city_id_06e79990_fk_main_city_id` FOREIGN KEY (`city_id`) REFERENCES `main_city` (`id`),
  CONSTRAINT `bloodbank_bloodbank_user_id_91d03b8d_fk_main_user_id` FOREIGN KEY (`user_id`) REFERENCES `main_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodbank_bloodbank`
--

LOCK TABLES `bloodbank_bloodbank` WRITE;
/*!40000 ALTER TABLE `bloodbank_bloodbank` DISABLE KEYS */;
INSERT INTO `bloodbank_bloodbank` VALUES (43,'Chana','mia','110001',233,'1234567890','llluvatar',0,0,0,390,0,0,0,0,4,'signup/Samaira_Khan.png');
/*!40000 ALTER TABLE `bloodbank_bloodbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloodbank_camp`
--

DROP TABLE IF EXISTS `bloodbank_camp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloodbank_camp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `address` varchar(200) NOT NULL,
  `pincode` varchar(6) NOT NULL,
  `bloodbank_id` bigint NOT NULL,
  `city_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bloodbank_camp_bloodbank_id_5051f0ca_fk_bloodbank` (`bloodbank_id`),
  KEY `bloodbank_camp_city_id_4c56b5f5_fk_main_city_id` (`city_id`),
  CONSTRAINT `bloodbank_camp_bloodbank_id_5051f0ca_fk_bloodbank` FOREIGN KEY (`bloodbank_id`) REFERENCES `bloodbank_bloodbank` (`user_id`),
  CONSTRAINT `bloodbank_camp_city_id_4c56b5f5_fk_main_city_id` FOREIGN KEY (`city_id`) REFERENCES `main_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodbank_camp`
--

LOCK TABLES `bloodbank_camp` WRITE;
/*!40000 ALTER TABLE `bloodbank_camp` DISABLE KEYS */;
INSERT INTO `bloodbank_camp` VALUES (9,'Camp1','2023-11-06','2023-11-09','31 Andheri Road, Nayapara','110001',43,2);
/*!40000 ALTER TABLE `bloodbank_camp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloodbank_donation`
--

DROP TABLE IF EXISTS `bloodbank_donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloodbank_donation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `donation_date` date NOT NULL,
  `amount` int NOT NULL,
  `blood_group` varchar(3) NOT NULL,
  `pct_contamination` int NOT NULL,
  `glucose` int NOT NULL,
  `platelet_count` int NOT NULL,
  `info` varchar(10) NOT NULL,
  `bloodbank_id` bigint NOT NULL,
  `donor_id` bigint NOT NULL,
  `is_liked` tinyint(1) NOT NULL,
  `is_seen` tinyint(1) NOT NULL,
  `first_save` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bloodbank_donation_bloodbank_id_e3769814_fk_bloodbank` (`bloodbank_id`),
  KEY `bloodbank_donation_donor_id_bb9d593b_fk_donor_donor_user_id` (`donor_id`),
  CONSTRAINT `bloodbank_donation_bloodbank_id_e3769814_fk_bloodbank` FOREIGN KEY (`bloodbank_id`) REFERENCES `bloodbank_bloodbank` (`user_id`),
  CONSTRAINT `bloodbank_donation_donor_id_bb9d593b_fk_donor_donor_user_id` FOREIGN KEY (`donor_id`) REFERENCES `donor_donor` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodbank_donation`
--

LOCK TABLES `bloodbank_donation` WRITE;
/*!40000 ALTER TABLE `bloodbank_donation` DISABLE KEYS */;
INSERT INTO `bloodbank_donation` VALUES (3,'2023-06-06',390,'B+',1,75,45555,'Normal',43,42,0,0,1);
/*!40000 ALTER TABLE `bloodbank_donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_main_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_main_user_id` FOREIGN KEY (`user_id`) REFERENCES `main_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-10-28 14:16:19.281035','1','Delhi',1,'[{\"added\": {}}]',6,1),(2,'2023-10-28 14:31:33.589972','2','nicer@gmail.com',3,'',7,1),(3,'2023-10-28 14:32:57.468103','4','nicer@gmail.com',3,'',7,1),(4,'2023-10-28 14:51:06.959208','1','ptripathy013@gmail.com',2,'[{\"changed\": {\"fields\": [\"Is donor\"]}}]',7,1),(5,'2023-10-28 14:52:03.325065','5','nicer@gmail.com',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',7,1),(6,'2023-10-28 15:16:02.978004','6','ishani@gmail.com',3,'',7,1),(7,'2023-10-28 15:16:02.981110','5','nicer@gmail.com',3,'',7,1),(8,'2023-10-28 15:22:54.062839','1','ptripathy013@gmail.com',2,'[{\"changed\": {\"fields\": [\"Is donor\"]}}]',7,1),(9,'2023-10-28 17:29:38.107825','7','ishani@gmail.com',3,'',7,1),(10,'2023-10-28 17:31:00.752831','1','ptripathy013@gmail.com',2,'[{\"changed\": {\"fields\": [\"Is donor\", \"Is bloodbank\", \"Is hospital\"]}}]',7,1),(11,'2023-10-28 19:14:51.929041','8','ishani@gmail.com',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',7,1),(12,'2023-10-28 19:18:24.530525','10','Cha',3,'',8,1),(13,'2023-10-28 19:18:32.675121','10','nicer@gmail.com',3,'',7,1),(14,'2023-10-28 19:18:45.008394','8','ishani@gmail.com',3,'',7,1),(15,'2023-10-28 20:18:54.420765','13','s@gmail.com',3,'',7,1),(16,'2023-10-28 20:18:59.552401','12','ishani@gmail.com',3,'',7,1),(17,'2023-10-28 20:18:59.571985','11','nicer@gmail.com',3,'',7,1),(18,'2023-10-28 20:32:48.117859','15','nicer@gmail.com',3,'',7,1),(19,'2023-10-28 20:32:48.121920','14','ishani@gmail.com',3,'',7,1),(20,'2023-10-28 21:40:17.481010','17','y',2,'[{\"changed\": {\"fields\": [\"Ab neg\"]}}]',9,1),(21,'2023-10-28 21:40:26.092617','17','y',2,'[{\"changed\": {\"fields\": [\"Ab neg\"]}}]',9,1),(22,'2023-10-28 21:40:54.192035','17','s@gmail.com',2,'[{\"changed\": {\"fields\": [\"Is donor\", \"Is bloodbank\"]}}]',7,1),(23,'2023-10-28 21:49:16.272360','17','s@gmail.com',3,'',7,1),(24,'2023-10-28 21:49:16.294008','16','ishani@gmail.com',3,'',7,1),(25,'2023-10-28 21:56:02.330887','19','ishani@gmail.com',3,'',7,1),(26,'2023-10-28 22:29:47.668997','22','s@gmail.com',3,'',7,1),(27,'2023-10-28 22:29:47.671989','21','nicer@gmail.com',3,'',7,1),(28,'2023-10-28 22:29:47.673986','20','ishani@gmail.com',3,'',7,1),(29,'2023-10-28 22:30:03.539762','1','ptripathy013@gmail.com',2,'[{\"changed\": {\"fields\": [\"Is donor\", \"Is bloodbank\", \"Is hospital\"]}}]',7,1),(30,'2023-10-28 22:41:58.067434','25','abc@email.com',3,'',7,1),(31,'2023-10-28 22:41:58.069428','24','ishani@gmail.com',3,'',7,1),(32,'2023-10-28 22:41:58.071435','23','nicer@gmail.com',3,'',7,1),(33,'2023-10-29 18:49:16.686791','1','Ishani @ Chair | 2023-09-11',1,'[{\"added\": {}}]',10,1),(34,'2023-10-29 18:49:36.300590','2','Ishani @ Chair | 2023-09-11',1,'[{\"added\": {}}]',10,1),(35,'2023-10-29 20:40:01.983289','1','camp1',1,'[{\"added\": {}}]',11,1),(36,'2023-10-29 20:40:23.205934','2','camp2',1,'[{\"added\": {}}]',11,1),(37,'2023-10-29 21:46:39.524658','1','SafdarJung Hospital | 2023-09-17',1,'[{\"added\": {}}]',13,1),(38,'2023-10-30 08:14:58.846427','2','Mumbai',1,'[{\"added\": {}}]',6,1),(39,'2023-10-30 08:15:12.494595','3','Varanasi',1,'[{\"added\": {}}]',6,1),(40,'2023-10-30 08:15:24.928301','4','Kolkata',1,'[{\"added\": {}}]',6,1),(41,'2023-10-30 08:15:35.864318','5','Chennai',1,'[{\"added\": {}}]',6,1),(42,'2023-10-31 18:16:24.058249','26','Ishani',2,'[]',8,1),(43,'2023-10-31 19:00:52.587007','2','Ishani @ Chair | 2023-09-11',2,'[]',10,1),(44,'2023-10-31 19:27:14.017639','2','Ishani @ Chair | 2023-09-11',2,'[{\"changed\": {\"fields\": [\"Is liked\"]}}]',10,1),(45,'2023-11-01 07:09:31.482487','6','camp4',1,'[{\"added\": {}}]',11,1),(46,'2023-11-01 07:14:11.742444','7','camp5',1,'[{\"added\": {}}]',11,1),(47,'2023-11-02 10:21:24.352060','3','Request object (3)',2,'[{\"changed\": {\"fields\": [\"Expected arrival date\", \"Is accepted\"]}}]',13,1),(48,'2023-11-02 10:21:33.921201','2','Request object (2)',2,'[{\"changed\": {\"fields\": [\"Expected arrival date\", \"Is accepted\"]}}]',13,1),(49,'2023-11-02 10:22:55.871889','3','Request object (3)',2,'[{\"changed\": {\"fields\": [\"Blood bank\"]}}]',13,1),(50,'2023-11-02 10:22:59.052143','2','Request object (2)',2,'[{\"changed\": {\"fields\": [\"Blood bank\"]}}]',13,1),(51,'2023-11-02 10:23:38.885317','2','Request object (2)',2,'[{\"changed\": {\"fields\": [\"Expected arrival date\"]}}]',13,1),(52,'2023-11-02 16:47:49.455522','26','Ishani',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(53,'2023-11-02 17:03:11.134104','29','fgf@gmail.com',3,'',7,1),(54,'2023-11-02 17:08:15.234721','30','fgf@gmail.com',3,'',7,1),(55,'2023-11-02 17:17:23.837292','31','fgf@gmail.com',3,'',7,1),(56,'2023-11-02 17:27:24.344955','32','fgf@gmail.com',3,'',7,1),(57,'2023-11-02 17:42:55.560452','33','Toys',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(58,'2023-11-02 17:43:45.028520','33','fgf@gmail.com',3,'',7,1),(59,'2023-11-02 17:50:30.131063','34','fgf@gmail.com',3,'',7,1),(60,'2023-11-02 18:08:44.373701','35','fgf@gmail.com',3,'',7,1),(61,'2023-11-02 18:17:16.127334','36','fgf@gmail.com',3,'',7,1),(62,'2023-11-02 18:31:52.545897','37','fgf@gmail.com',3,'',7,1),(63,'2023-11-02 19:07:47.926838','41','cccccc@gmail.com',3,'',7,1),(64,'2023-11-02 19:07:47.929896','40','bbbbbb@email.com',3,'',7,1),(65,'2023-11-02 19:07:47.930833','39','aaaa@email.com',3,'',7,1),(66,'2023-11-02 19:07:47.932838','26','ishani@gmail.com',3,'',7,1),(67,'2023-11-02 19:07:56.513173','38','fgf@gmail.com',3,'',7,1),(68,'2023-11-02 19:08:14.676540','27','nicer@gmail.com',3,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(9,'bloodbank','bloodbank'),(11,'bloodbank','camp'),(10,'bloodbank','donation'),(4,'contenttypes','contenttype'),(8,'donor','donor'),(12,'hospital','hospital'),(13,'hospital','request'),(6,'main','city'),(14,'main','passwordtoken'),(7,'main','user'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-10-28 12:53:45.935724'),(2,'contenttypes','0002_remove_content_type_name','2023-10-28 12:53:45.975276'),(3,'auth','0001_initial','2023-10-28 12:53:46.122789'),(4,'auth','0002_alter_permission_name_max_length','2023-10-28 12:53:46.154909'),(5,'auth','0003_alter_user_email_max_length','2023-10-28 12:53:46.160910'),(6,'auth','0004_alter_user_username_opts','2023-10-28 12:53:46.166948'),(7,'auth','0005_alter_user_last_login_null','2023-10-28 12:53:46.175691'),(8,'auth','0006_require_contenttypes_0002','2023-10-28 12:53:46.180142'),(9,'auth','0007_alter_validators_add_error_messages','2023-10-28 12:53:46.187671'),(10,'auth','0008_alter_user_username_max_length','2023-10-28 12:53:46.194671'),(11,'auth','0009_alter_user_last_name_max_length','2023-10-28 12:53:46.203677'),(12,'auth','0010_alter_group_name_max_length','2023-10-28 12:53:46.223766'),(13,'auth','0011_update_proxy_permissions','2023-10-28 12:53:46.229755'),(14,'auth','0012_alter_user_first_name_max_length','2023-10-28 12:53:46.242467'),(15,'main','0001_initial','2023-10-28 12:53:46.410176'),(16,'admin','0001_initial','2023-10-28 12:53:46.490657'),(17,'admin','0002_logentry_remove_auto_add','2023-10-28 12:53:46.497675'),(18,'admin','0003_logentry_add_action_flag_choices','2023-10-28 12:53:46.505658'),(19,'donor','0001_initial','2023-10-28 12:53:46.578822'),(20,'bloodbank','0001_initial','2023-10-28 12:53:46.761366'),(21,'hospital','0001_initial','2023-10-28 12:53:46.961007'),(22,'sessions','0001_initial','2023-10-28 12:53:46.984457'),(23,'bloodbank','0002_remove_bloodbank_password','2023-10-28 14:12:43.981526'),(24,'donor','0002_remove_donor_password','2023-10-28 14:12:43.996923'),(25,'hospital','0002_remove_hospital_password','2023-10-28 14:12:44.012931'),(26,'bloodbank','0003_alter_bloodbank_a_neg_alter_bloodbank_a_pos_and_more','2023-10-28 21:18:40.095616'),(27,'donor','0003_alter_donor_gender','2023-10-28 21:18:40.104739'),(28,'hospital','0003_hospital_phone','2023-10-28 22:01:49.236797'),(29,'main','0002_passwordtoken','2023-10-31 05:22:59.968485'),(30,'hospital','0004_alter_request_expected_arrival_date','2023-10-31 09:53:24.568662'),(31,'bloodbank','0004_donation_is_liked','2023-10-31 17:28:24.735977'),(32,'bloodbank','0005_donation_is_seen','2023-10-31 19:06:42.966496'),(33,'bloodbank','0006_remove_bloodbank_is_verified','2023-11-01 20:30:29.077772'),(34,'donor','0004_remove_donor_is_verified','2023-11-01 20:30:29.097169'),(35,'hospital','0005_remove_hospital_is_verified_request_blood_bank_and_more','2023-11-01 20:30:29.177762'),(36,'donor','0005_donor_image','2023-11-02 16:45:23.169110'),(37,'donor','0006_alter_donor_image','2023-11-02 17:02:09.998476'),(38,'donor','0007_alter_donor_image','2023-11-02 17:49:41.073613'),(39,'donor','0008_alter_donor_image','2023-11-02 18:08:28.052962'),(40,'bloodbank','0007_bloodbank_image','2023-11-02 19:05:24.232597'),(41,'hospital','0006_hospital_image','2023-11-02 19:16:36.200980'),(42,'bloodbank','0008_donation_first_save','2023-11-03 19:43:42.015328');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0gat1sj4vx69mop7qbm72kupk16y0a65','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwro1:VTRtXo9Jk2wyDB3wRRrEgLF2uyS3u0WRiBCaghg1bxU','2023-11-11 22:29:21.852696'),('0hgsaos9x5wqd7rnbajho4rhkjta3hww','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwk5u:xmnRgjAnm2BeZanHe9JPxxwfGP-Pga1cPBYCxi62ako','2023-11-11 14:15:18.994857'),('1thaxw7avkiljokh8orm1ar98i3yo2hk','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwn7p:buOMmpq4WyfvdLT0qB9Q41kET_DHvrJbQuu2PUAYEcs','2023-11-11 17:29:29.259516'),('1wwsvq6jtyypwo4p9a3m7lnxy3euchpu','.eJxVjMsOwiAQRf-FtSEMdAbq0r3fQHgMUjU0Ke3K-O_apAvd3nPOfQkftrX6rfPipyzOwonT7xZDenDbQb6Hdptlmtu6TFHuijxol9c58_NyuH8HNfT6rSOg4dGmoigMlECjK5qgWExkLBTMiOzGcWAAIOZorFPKkQaIFimL9wfKZjbI:1qwodx:sGd3B6H3MTA9fAfHrLi6WzvC48tyRvLcjU-Z0dZFG_E','2023-11-11 19:06:45.576379'),('2084gjxr4hly0moi6b06pbuuy6npgei4','.eJxVjDsOwjAQRO_iGllex0lsSvqcIdpdr3EA2VI-FeLuJFIKKKaZ92beasRtzeO2yDxOUV0VBHX5LQn5KeUg8YHlXjXXss4T6UPRJ130UKO8bqf7d5BxyftaxFFCjyTcJWCx3mKItpMWGFyCnnyfrGkQ2ATiGFxqGzDW7KHGOfX5AjxtOEk:1qwrFw:o5QD5bToceePgG4HuExRiMtXxuunNHuc4c1_zrhkApc','2023-11-11 21:54:08.579586'),('2b2cxdq7b3hjal2ivn8feav25bs79kbw','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwpTN:7pcNWupFB13ygoCBdLAOtJyw-Lfy7T2A6e61qJYciIE','2023-11-11 19:59:53.580989'),('4ksxlfq31ajaha6ivewhcx4oa9h1jy6j','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwpXV:WEA0xC0eOjBMDPntGaLZoipSEZa0QgmpNvMcrQpU1YA','2023-11-11 20:04:09.577483'),('4t17qgaeiyiro2i1d7bzspjf5glzp2az','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwjAq:HyH7dWuIGbpaPX1M-bF4inBen6UM8B3UVVmPfTQ_lR0','2023-11-11 13:16:20.724672'),('5pz0gs9hzjnnkucxpr57qkjve8abzt95','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwkgg:c-3UQLzlRCt4O_rgaO0iEn_CcGqDo2Y_OjzuvBNPh24','2023-11-11 14:53:18.373046'),('68tdll89zswet1tyvgekl3c4nknniazo','.eJxVjMsOwiAQRf-FtSGUYQq4dO83kBketmogKe3K-O_apAvd3nPOfYlA2zqFreclzEmchRWn340pPnLdQbpTvTUZW12XmeWuyIN2eW0pPy-H-3cwUZ--tfMcPSqrI3FUCUq2Dhg1ekxmNIjeD5CVHyIVi2A4a7DFkQIYwYws3h_YXTck:1qwmL8:YBKQgNDlSNVcJku3EHQ2EYS1ASS0dAUNT8IeYQkeE98','2023-11-11 16:39:10.256657'),('6qbwe8umiqt9ibwbshddycdq4syr1h2b','.eJxVjMsOwiAUBf-FtSFAC1dcuu83kPsAWzWQ9LEy_rs26UK3Z2bOSyXc1jFtS57TJOqinFOn35GQH7nuRO5Yb01zq-s8kd4VfdBFD03y83q4fwcjLuO3xk56LgIQA4kjE6yUYISLjRwsdX1HliFn610B9mdANKGgJQDfmwjq_QEl9Thg:1qwrZu:zNT1ozEanAx5-wGmds73jZVNpx8wlqxwwfaHbqk1E04','2023-11-11 22:14:46.472541'),('7pgjnd6p1g2det83cbgvsctvbo02j1f3','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwrjS:qLbjkpKBtd66-BRXUg1DPZz_uvIb6TfU2s_sXi5eIGA','2023-11-11 22:24:38.931932'),('7wxvrmba85o47jkd3wy20eepfu6kd247','.eJxVjDsOwjAQBe_iGlmx418o6TmDtetd4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIstBWn3xEhPbjuhO5Qb02mVtdlRrkr8qBdXhvx83K4fwcFevnWycCAKhEO4-QpawPJZLRgHMDoKHg9eUQPnMGxp2RGpTkox4FJg7Li_QE01jkY:1qwryL:dHMV6xONQs6uPWtMUNdTJfjZaZIXS2C-4cA4fxTwynQ','2023-11-11 22:40:01.470322'),('889d31nuleou8e7fefvf0gbmkzatpl0s','.eJxVjEEOwiAQAP_C2RCg3aV49N43kF3YStXQpLQn499Nkx70OjOZt4q0byXuTdY4Z3VVDtXlFzKlp9TD5AfV-6LTUrd1Zn0k-rRNj0uW1-1s_waFWjm-YQDhLngCnDwYYzOCEROy2AEguWlA9hkDO-lpsjb4nrjnzjlACKg-X-y4Nyw:1qxAv7:_8h68VEB3cs4zb6dU7FCL-RvAK-zX4K7KZypkuZ5Ess','2023-11-12 18:53:57.752339'),('89g5fvs4j0l39uwzf1no33gav11u7uyb','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwkYE:ekMas0nESjLxhWS2H9Quy0kzMOBTqshqeU8h9UkRjT8','2023-11-11 14:44:34.082768'),('9e66r2e5poou08ndno89qf9xfny2l7je','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwrpF:npO1tx1yCq5X5cicXpVeN2Pa6p77KHSmOszyVpVNWuY','2023-11-11 22:30:37.330893'),('a3iansm7i29wg8aiznlsurtgpg8wuv0z','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwplY:isLrYs62rmlkHCVlBNSAYzm-ehLQi1KBPtBWK195U4k','2023-11-11 20:18:40.615991'),('b8rei4b1kfwysymcp8eannw8h2m8behl','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwmKU:M45ahXyW5ctPu-Ob6cNorMAGtvWG7jt7qjuDbmFNqHY','2023-11-11 16:38:30.857245'),('c953zecdj2t07y4z78kcsf23com383ne','.eJxVjDsOwjAQBe_iGlnLrr-U9DmD5S8OIFuKkwpxd4iUAto3M-_FnN_W6raRFzcndmEo2Ol3DD4-cttJuvt26zz2ti5z4LvCDzr41FN-Xg_376D6Ub91IWWg2ACh2EIFjQZz1gpAi6DJJoEiEUZDKChKhUYK0AqlTIFitMDeH92DNpE:1qwrx7:ysOOyhd6IG6U7u2OM9vg9WVAl1KTTRsr5e1r5kbznkI','2023-11-11 22:38:45.575145'),('caeyslx2dexizbimmcregcyhgdrn24gw','.eJxVjMsOwiAQRf-FtSEMdAbq0r3fQHgMUjU0Ke3K-O_apAvd3nPOfQkftrX6rfPipyzOwonT7xZDenDbQb6Hdptlmtu6TFHuijxol9c58_NyuH8HNfT6rSOg4dGmoigMlECjK5qgWExkLBTMiOzGcWAAIOZorFPKkQaIFimL9wfKZjbI:1qwoUM:7fUc0DPA99LUdmkrar0aVpNR8x5kM46jdFU2J3s0M70','2023-11-11 18:56:50.549580'),('cbxckxie3bn0vgasrm23b6rrm444pyoi','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwnAx:nS0ywr-NAR_eVBpkO2XQZ3w2q9yNDJcuOlninRyhiyo','2023-11-11 17:32:43.457866'),('downwci0d96e5zr0xni9bfcvn4omqft2','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qx7Jt:9hdpW29dsiRe4AHKHbpiKMvUUgosjchd1i2NxOheoK8','2023-11-12 15:03:17.383331'),('dtbszqkl6ni4n4lid6pjtfzoiurlaik6','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwnKl:soxy-cgZRY1Hz23q60N_bPdX5o8mAB3o8xdnKgbx6-o','2023-11-11 17:42:51.673971'),('ezdndsn7p4v0vqfmgshnb83yvdaaps6t','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwprk:qZPrPRnyaZCL8BK62Fa2nGTQO8J3cep33Lp509E2d8I','2023-11-11 20:25:04.802359'),('fb0i1rpyg2b2tjfxlvvbezixw9b5dtn2','.eJxVjEEOwiAQRe_C2pC2lIFx6d4zEGZgpGpoUtqV8e7apAvd_vfef6kQt7WEreUlTEmd1eDU6XekyI9cd5Lusd5mzXNdl4n0ruiDNn2dU35eDvfvoMRWvnWE3oHLYlAyGjTUIzJmYmuoEwIL3oCkxKMTj855FgvSjYQDgiCr9wcSSjhP:1qxCMc:jEeUoJr1L8hhiYQ8tcsfpRGg7Qqx4YA9kqZNQqbIJ3g','2023-11-12 20:26:26.721137'),('fu94hdl584fnk75uwlb35u7xh0hdct1r','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwn3D:oDlC1zYms58sdbILxva02T-HkSqCak3Iw0wM9U4CWi0','2023-11-11 17:24:43.727728'),('gf7m0a84ro34utz0ddg3ddlch7kd3pb9','.eJxVjDsOwjAQBe_iGln-fyjpOYO1a69xADlSnFSIu0OkFNC-mXkvlmBbW9oGLWkq7MyUZqffESE_qO-k3KHfZp7nvi4T8l3hBx38Ohd6Xg7376DBaN_aOJCxehNVxiIrCusJjAb0ZEiIYl10VTgbMDupQWOoUglFVWkHwgb2_gAJRTfI:1qwruI:kFQph0T5r0WXGiSp4RBqZDis04YEG0kxa00vXlDH-wU','2023-11-11 22:35:50.473965'),('gxqeuiqcph19z2njsgkhoh3f0x705zxb','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwnCu:cBefBxNL8hhtTPT59Rq6WvQAXmgnHfjTznNz3kzNHBI','2023-11-11 17:34:44.680617'),('hwgy3vhaeygmjve8qq4x05h54r1bg4oi','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwose:UcbDP328B-kWOCUfAnyPZJxdurztceMa2-O9N_VNGjk','2023-11-11 19:21:56.379906'),('ig1vd99tnbz5dijjskixuaxjw8afwyzy','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwoiP:mKiQNuyoXQIvUcvjsq4U4Nb99Yr71zqDHp6gCheZ3zY','2023-11-11 19:11:21.888184'),('kzeoghd8qv7qgtpkvnu9dfl1stw9g6gx','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwrHX:CrW00NlezonbRJ-fs6-M3uk8010J4E8uVbZ1lEaN0n8','2023-11-11 21:55:47.145367'),('l3nj9h1lu3vmr58n5iuju0bqnu96o2q8','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwkem:Nq4xvclJWkhru_LTEQ067t-hh85JLsahOCrqcjFVuww','2023-11-11 14:51:20.010627'),('lggyer2ehh603qpr0mmzf0mmnjshn51x','.eJxVjEEOwiAQRe_C2hCghAGX7j0DmWFAqgaS0q6Md9cmXej2v_f-S0Tc1hq3kZc4szgLC-L0OxKmR2474Tu2W5ept3WZSe6KPOiQ1875eTncv4OKo35rDcVNQTMbixAwkLIFMORg2DqntHeeMWVSmg0ZQshUdDCAYMBPAOL9AQdIN-c:1sVF5K:c-H0CuCKnlQ-8d8hHMds0cMKwgylEowbd7_UmFWTTa0','2024-08-03 18:45:34.457736'),('mc2i9p3u5i37mh3fqvlvquopso8ly0ep','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwnAH:PkQLVNS8FNOLDAN1GlmxvNM_UmMD2auWfu0NZMQt0Fg','2023-11-11 17:32:01.940520'),('mjmw3i8pr9iwbil1timh74925yb9cg3f','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qx8P7:2dp-hSGy4xfy5SMixKG47amHaSZZ4ux6iWmIh2X_DR8','2023-11-12 16:12:45.245300'),('mnlgoih39ofaynfysnmqdttivxeip68v','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwrWj:ichRIHtvurMuryy4uOh04QLmm3QcBWvif6i82mvB9lc','2023-11-11 22:11:29.309599'),('pj0f4o3ciznesv902ax2joyone3r8pqn','.eJxVjEEOwiAQRe_C2hAgTCku3XsGMjMMUjU0Ke3KeHdt0oVu_3vvv1TCba1p67KkKauzcladfkdCfkjbSb5ju82a57YuE-ld0Qft-jpneV4O9--gYq_f2hQKPsKYs81-FPBE1tBQAJ0JESJFEWeQvbFgkSEW8c4OXAIKgwH1_gAJATgr:1qwrYp:ZZwWN5jj0Di-YTAi-flMcVIreQIWPAm96qeiIiN-jZM','2023-11-11 22:13:39.103945'),('q8wf6ou6q6mvfqh4dftq3uip623lfq5a','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwrzo:WN-uoNe8c9plTiSdGxDjKEuw56rEDrjLOZ-RFigXxZI','2023-11-11 22:41:32.884355'),('r0lf1nr61sqtnemh8d5f8d5sx8d6qd8s','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwjgv:w5SUJWbQtYeqKTTqqt8ZTnlXafkvsM1SaD2Rme-rOnw','2023-11-11 13:49:29.131324'),('rl13drgowo2sse5n9s3d71jr9mxags11','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwjgL:2A6gY2vcxNnsIH9Ki5bCl9XI642RL0nNuiXmMG3OtkU','2023-11-11 13:48:53.736885'),('rp6pn9pa6fudu7e0c3ibs106hjja1h6g','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwoV0:0osYHV0PWxJIpwIklOUHyw2jJ1SdAvG1pR02F4tOShI','2023-11-11 18:57:30.901130'),('sl7ox1u8ltl9ap0tdzk6hji9y8domeuw','.eJxVjEEOwiAQRe_C2pC2lIFx6d4zEGZgpGpoUtqV8e7apAvd_vfef6kQt7WEreUlTEmd1eDU6XekyI9cd5Lusd5mzXNdl4n0ruiDNn2dU35eDvfvoMRWvnWE3oHLYlAyGjTUIzJmYmuoEwIL3oCkxKMTj855FgvSjYQDgiCr9wcSSjhP:1qxCag:a215YUGboLxTaUcM9JO74nsga7wNAQBd_0Whu5ppZRI','2023-11-12 20:40:58.507425'),('soit45t4sknaq6otvu5qjq4utee9z1pr','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwq0r:74rTkWDm3jC3XteonHRQ6V69h-dtWFaSvaHFm20LC7E','2023-11-11 20:34:29.211852'),('t67qp3421aduy3nu9njzvfe12jbqc49x','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwr1l:mE0kwpbzZzOV0x1D2N9lZ9DnWHC1Wvr3ZMqKJqDqCLU','2023-11-11 21:39:29.978348'),('tltwgcw6e0jckcvz0v9alh9bdeznl5tz','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwlSI:iVoPWcolwGSda4bH7pCGlJnY-VI49P7QVPF0jM239-M','2023-11-11 15:42:30.088926'),('u2n6zt2w72sc5i8wen9kqiijyf4l6goz','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwoNP:hZapmWhcKEP1_5H4Yx5VOJJ1pL9vRO2B2WtV23VD7rM','2023-11-11 18:49:39.481112'),('utcjfuywe7m6yr44kmcizel8dbn24fmh','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwpz6:RjlnlKFbCoA1EuMa1pl8vDlFPbOGr-XGOEh4k2bp33Y','2023-11-11 20:32:40.761105'),('v6e55nhigs1rm4llzuq5bbw3f5xfvzca','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwqDz:5lWE_Jpg-jTYBeHTEuCfqTir2XzE-NZK5GljfhlDnWk','2023-11-11 20:48:03.240178'),('w0olgpnbbbvszpj262sefuqdnyimphbm','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwl8n:c0-l-OfhYNWVj246sKI90G7UBqM83Bxga2hrMCOjk0w','2023-11-11 15:22:21.420516'),('w3ax5bgamejgehgupfh0jkgf5su7wuf3','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwrq4:X31golz1VpEFAyqwmzKGZ0FkqSR-T7-QJdxnFeCDFYE','2023-11-11 22:31:28.520889'),('xarl43mj8yv0vg4f76oak961onzs13jb','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwon9:n7cet8EOhE_dKf4WS6OSCiPcWauGOczrmE5hwpsavnc','2023-11-11 19:16:15.385325'),('xbfsvs88h49ufe8eiljsd48bwk2g21tu','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwpYT:aO_zq8t569EuJCIv2AJSZqH47DutcnnBvzGydioMAFU','2023-11-11 20:05:09.803411'),('yprwnxnl1e41wafe83peoyjio54lggor','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qxNOy:kSb4b_yAcYEKNHSHsXiEWjSkRtcda3UYU4twrVD4fac','2023-11-13 08:13:36.384316'),('z1dxie91nz52ojv54u9zkjatnr67y2jm','.eJxVjEEOwiAQRe_C2pACdQou3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFGn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX_r1NsePBjgs7FE4FOHEniIoZMh4CCMDMRonEveMDpgsL4ncQlJiNX7A-wuOPQ:1qwkcw:Urq5vWcWA_Kx5qmdQhUujHo0AC_jsKAjl4o0Dl3u3_o','2023-11-11 14:49:26.976687');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor_donor`
--

DROP TABLE IF EXISTS `donor_donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donor_donor` (
  `user_id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `date_of_birth` date NOT NULL,
  `phone` varchar(10) NOT NULL,
  `blood_group` varchar(3) NOT NULL,
  `city_id` bigint NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `donor_donor_city_id_025ebca0_fk_main_city_id` (`city_id`),
  CONSTRAINT `donor_donor_city_id_025ebca0_fk_main_city_id` FOREIGN KEY (`city_id`) REFERENCES `main_city` (`id`),
  CONSTRAINT `donor_donor_user_id_f97e4cc8_fk_main_user_id` FOREIGN KEY (`user_id`) REFERENCES `main_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor_donor`
--

LOCK TABLES `donor_donor` WRITE;
/*!40000 ALTER TABLE `donor_donor` DISABLE KEYS */;
INSERT INTO `donor_donor` VALUES (42,'Ishany','F','1999-03-10','1234567890','B+',1,'signup/download_1.jpeg'),(47,'Ghost','M','1996-07-21','9876543210','A+',2,'signup/battle_mage.jpeg');
/*!40000 ALTER TABLE `donor_donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital_hospital`
--

DROP TABLE IF EXISTS `hospital_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_hospital` (
  `user_id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `pincode` varchar(6) NOT NULL,
  `employees` int NOT NULL,
  `city_id` bigint NOT NULL,
  `phone` varchar(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `hospital_hospital_city_id_5d20c417_fk_main_city_id` (`city_id`),
  CONSTRAINT `hospital_hospital_city_id_5d20c417_fk_main_city_id` FOREIGN KEY (`city_id`) REFERENCES `main_city` (`id`),
  CONSTRAINT `hospital_hospital_user_id_b0c96b32_fk_main_user_id` FOREIGN KEY (`user_id`) REFERENCES `main_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_hospital`
--

LOCK TABLES `hospital_hospital` WRITE;
/*!40000 ALTER TABLE `hospital_hospital` DISABLE KEYS */;
INSERT INTO `hospital_hospital` VALUES (28,'SafdarJung Hospital','31 Andheri Road, Nayapara','666666',45,1,'9876543210',''),(44,'Chair','mia','110001',34,3,'8249355827','signup/movie_-_1_oBzg8na.png'),(45,'SafdarJung','m56','110001',34,4,'9876543210','signup/heart-fill.svg');
/*!40000 ALTER TABLE `hospital_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital_request`
--

DROP TABLE IF EXISTS `hospital_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_request` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `request_date` date NOT NULL,
  `expected_arrival_date` date DEFAULT NULL,
  `blood_group` varchar(3) NOT NULL,
  `amount` int NOT NULL,
  `hospital_id` bigint NOT NULL,
  `blood_bank_id` bigint DEFAULT NULL,
  `is_accepted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_request_hospital_id_ed64348d_fk_hospital_` (`hospital_id`),
  KEY `hospital_request_blood_bank_id_a809c633_fk_bloodbank` (`blood_bank_id`),
  CONSTRAINT `hospital_request_blood_bank_id_a809c633_fk_bloodbank` FOREIGN KEY (`blood_bank_id`) REFERENCES `bloodbank_bloodbank` (`user_id`),
  CONSTRAINT `hospital_request_hospital_id_ed64348d_fk_hospital_` FOREIGN KEY (`hospital_id`) REFERENCES `hospital_hospital` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_request`
--

LOCK TABLES `hospital_request` WRITE;
/*!40000 ALTER TABLE `hospital_request` DISABLE KEYS */;
INSERT INTO `hospital_request` VALUES (1,'2023-09-17','2023-10-29','B+',4,28,NULL,0),(4,'2023-11-02',NULL,'A+',5,28,NULL,0),(5,'2023-11-02',NULL,'O+',190,28,NULL,0),(6,'2023-11-02',NULL,'A-',45,28,NULL,0),(8,'2023-11-05',NULL,'A+',2,45,NULL,0);
/*!40000 ALTER TABLE `hospital_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_city`
--

DROP TABLE IF EXISTS `main_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_city` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) NOT NULL,
  `latitude` decimal(6,1) NOT NULL,
  `longitude` decimal(6,1) NOT NULL,
  `state` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_city`
--

LOCK TABLES `main_city` WRITE;
/*!40000 ALTER TABLE `main_city` DISABLE KEYS */;
INSERT INTO `main_city` VALUES (1,'Delhi',29.4,76.6,'Delhi'),(2,'Mumbai',19.0,77.0,'Maharashtra'),(3,'Varanasi',25.0,83.0,'Uttar Pradesh'),(4,'Kolkata',22.0,88.0,'West Bengal'),(5,'Chennai',13.0,80.0,'Tamil Nadu');
/*!40000 ALTER TABLE `main_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_passwordtoken`
--

DROP TABLE IF EXISTS `main_passwordtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_passwordtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `forgot_password_token` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `main_passwordtoken_user_id_e7d30485_fk_main_user_id` FOREIGN KEY (`user_id`) REFERENCES `main_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_passwordtoken`
--

LOCK TABLES `main_passwordtoken` WRITE;
/*!40000 ALTER TABLE `main_passwordtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_passwordtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_user`
--

DROP TABLE IF EXISTS `main_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_donor` tinyint(1) NOT NULL,
  `is_bloodbank` tinyint(1) NOT NULL,
  `is_hospital` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_user`
--

LOCK TABLES `main_user` WRITE;
/*!40000 ALTER TABLE `main_user` DISABLE KEYS */;
INSERT INTO `main_user` VALUES (1,'pbkdf2_sha256$600000$tuNtOjOpZ21g69fY1rX5EX$FvAXX6SMUxAKdG84aH7ZIUYprqjNNh++MOTwGE7jxNU=','2023-11-02 19:07:08.477630',1,'Pratik','','',1,1,'2023-10-28 12:54:42.000000','ptripathy013@gmail.com',0,0,0),(28,'pbkdf2_sha256$600000$G36aXcqSMzbvG4pHPgDTPQ$X3cMAyGL9IJdwPzIDrc3dzxBC0Ib74F89JvvRe/R/Jc=','2023-11-03 19:45:17.422105',0,'s@gmail.com','','',0,1,'2023-10-29 21:44:57.012432','s@gmail.com',0,0,1),(42,'pbkdf2_sha256$600000$55utag5osbYfIwelMGzDLZ$UKlAxc5i8+wRvony+Ad8eX4NNKF79YqMqvQhE+oakQc=','2023-11-05 08:10:44.185708',0,'ishani@gmail.com','','',0,1,'2023-11-02 19:08:52.292222','ishani@gmail.com',1,0,0),(43,'pbkdf2_sha256$600000$Qu56Ex95thwG4dw7uSEOWB$cUIHwFuqbqSDhioYMqOyv/VPyzb2Kl2E9UtYf9EQGBg=','2023-11-05 08:18:00.539960',0,'nicer@gmail.com','','',0,1,'2023-11-02 19:09:25.754663','nicer@gmail.com',0,1,0),(44,'pbkdf2_sha256$600000$RZNkVIz7orJUmgUfoABG7E$1MEJIeeSK43zHGwRDaLgPVK7YPFMomNIvlKTYDYB3rc=','2023-11-02 19:21:18.246428',0,'s2@gmail.com','','',0,1,'2023-11-02 19:21:18.078723','s2@gmail.com',0,0,1),(45,'pbkdf2_sha256$600000$C1KSru4hbWKAG4x6KFjF0d$Qn/9uF+wSx84YO4RaI72oFOoUgRX3faZb0S/p5R8HsQ=','2023-11-05 08:15:41.498132',0,'fgf@gmail.com','','',0,1,'2023-11-02 20:55:48.329382','fgf@gmail.com',0,0,1),(47,'pbkdf2_sha256$600000$b57YvSWYOdVSO5Evo8VHXq$LBsODfVuyygMhmZOwWg7lxDP7xL8GuaV++yQbKykyXw=','2024-07-20 18:45:34.452173',0,'ghost@gmail.com','','',0,1,'2024-07-20 18:45:34.210714','ghost@gmail.com',1,0,0);
/*!40000 ALTER TABLE `main_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_user_groups`
--

DROP TABLE IF EXISTS `main_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_user_groups_user_id_group_id_ae195797_uniq` (`user_id`,`group_id`),
  KEY `main_user_groups_group_id_a337ba62_fk_auth_group_id` (`group_id`),
  CONSTRAINT `main_user_groups_group_id_a337ba62_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `main_user_groups_user_id_df502602_fk_main_user_id` FOREIGN KEY (`user_id`) REFERENCES `main_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_user_groups`
--

LOCK TABLES `main_user_groups` WRITE;
/*!40000 ALTER TABLE `main_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_user_user_permissions`
--

DROP TABLE IF EXISTS `main_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_user_user_permissions_user_id_permission_id_96b9fadf_uniq` (`user_id`,`permission_id`),
  KEY `main_user_user_permi_permission_id_cd2b56a3_fk_auth_perm` (`permission_id`),
  CONSTRAINT `main_user_user_permi_permission_id_cd2b56a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `main_user_user_permissions_user_id_451ce57f_fk_main_user_id` FOREIGN KEY (`user_id`) REFERENCES `main_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_user_user_permissions`
--

LOCK TABLES `main_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `main_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-30 16:50:01
