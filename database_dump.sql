-- MySQL dump 10.13  Distrib 5.5.52, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: treebo_hotels
-- ------------------------------------------------------
-- Server version	5.5.52-0ubuntu0.14.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add deals',7,'add_deals'),(20,'Can change deals',7,'change_deals'),(21,'Can delete deals',7,'delete_deals');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'hotel','deals'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-10-02 04:43:00'),(2,'auth','0001_initial','2016-10-02 04:43:04'),(3,'admin','0001_initial','2016-10-02 04:43:04'),(4,'admin','0002_logentry_remove_auto_add','2016-10-02 04:43:05'),(5,'contenttypes','0002_remove_content_type_name','2016-10-02 04:43:05'),(6,'auth','0002_alter_permission_name_max_length','2016-10-02 04:43:05'),(7,'auth','0003_alter_user_email_max_length','2016-10-02 04:43:06'),(8,'auth','0004_alter_user_username_opts','2016-10-02 04:43:06'),(9,'auth','0005_alter_user_last_login_null','2016-10-02 04:43:06'),(10,'auth','0006_require_contenttypes_0002','2016-10-02 04:43:06'),(11,'auth','0007_alter_validators_add_error_messages','2016-10-02 04:43:06'),(12,'sessions','0001_initial','2016-10-02 04:43:07'),(13,'hotel','0001_initial','2016-10-02 04:43:44'),(14,'hotel','0002_deals_likes','2016-10-02 06:42:26');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_deals`
--

DROP TABLE IF EXISTS `hotel_deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `image` text NOT NULL,
  `rating` float NOT NULL,
  `link` text NOT NULL,
  `actual_price` float NOT NULL,
  `discount` int(11) NOT NULL,
  `location` text NOT NULL,
  `likes` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_deals`
--

LOCK TABLES `hotel_deals` WRITE;
/*!40000 ALTER TABLE `hotel_deals` DISABLE KEYS */;
INSERT INTO `hotel_deals` VALUES (1,'Treebo Silicon Business','https://images.treebohotels.com/files/Treebo_Silicon_Business/04_Corridor_1.jpg?w=250&fit=crop&fm=jpg&h=200',3.8,'https://www.treebohotels.com/hotels-in-bengaluru/treebo-silicon-business-electronic-city-N7oBraog/?',1350,10,'11 & 12, Silicon Town, 2nd phase, Electronic City, Bengaluru, 560100',56),(2,'Grand Continent','https://images.treebohotels.com/files/GrandContinent_Reception.jpg?w=250&fit=crop&fm=jpg&h=200',4,'https://www.treebohotels.com/hotels-in-bengaluru/treebo-grand-continent-btm-layout-qVjknL1A/',2099,33,'NO.278, 7th main, Mico Layout, BTM 2nd Stage, Bengaluru, 560068\r\n',85),(3,'Treebo Annora','https://images.treebohotels.com/files/annora_mahagony_5.jpg?w=250&fit=crop&fm=jpg&h=200',3.8,'https://www.treebohotels.com/hotels-in-bengaluru/treebo-annora-domlur-aOogwoqe/',2449,25,'#289, Amarjyothi Layout, West Wing, Domlur, Bengaluru, 560071',56),(4,'Golden Pearl Koramangala','https://images.treebohotels.com/files/Treebo_Golden_Pearl_Koramangala/1Treebo_Golden_Pearl_Main.jpg?w=250&fit=crop&fm=jpg&h=200',5,'https://www.treebohotels.com/hotels-in-bengaluru/treebo-golden-pearl-koramangala-koramangala-GPoN4xj6/?checkin=2016-09-28&checkout=2016-09-29&roomconfig=1-0&roomtype=Oak',2299,5,'#395, 7th cross, 4th block, Opp Raheja Residency, Kormangala, Bengaluru, 560034',73),(5,'Akshaya Lalbagh Inn','https://images.treebohotels.com/files/Treebo_Akshaya_Lalbagh_Inn/1Treebo_Akshaya_Lalbagh_Main.jpg?w=250&fit=crop&fm=jpg&h=200',3,'https://www.treebohotels.com/hotels-in-bengaluru/treebo-akshaya-lalbagh-inn-jayanagar-Ae3Jevjb/?checkin=2016-09-28&checkout=2016-09-29&roomconfig=1-0&roomtype=Oak',2499,10,'No. 462, 2nd Block Jayanagar, Near Ashoka Pillar, Jayanagar, Bengaluru, 560011',74),(6,'Treebo Singh Sons','https://images.treebohotels.com/files/singh_sons_mahagony_2.jpg?w=250&fit=crop&fm=jpg&h=200',4,'https://www.treebohotels.com/hotels-in-new-delhi/treebo-singh-sons-karol-bagh-vMjaYj1m/',2499,40,'7A/10, WEA Channa Market, Karol Bagh, New Delhi, 110005',1),(7,'JP Plaza','https://images.treebohotels.com/files/jp_s.jpg?w=250&fit=crop&fm=jpg&h=200',3,'https://www.treebohotels.com/hotels-in-hyderabad/treebo-jp-plaza-basheerbagh-Mv3K9NL1/',1999,10,'#3-6-324, Lane Opp United India Insurance Co Ltd, Hyderguda, Basheerbagh, Hyderabad, 500048',10),(8,'Srico','https://images.treebohotels.com/files/Treebo_Srico/Treebo_Srico_Reception2.jpg?w=250&fit=crop&fm=jpg&h=200',4.1,'https://www.treebohotels.com/hotels-in-hyderabad/treebo-srico-banjara-hills-J1jG8Z3X/',1999,20,'Plot No 178/A, Road No 12 , Banjara Hills, Hyderabad, 500034',73),(9,'Saravana Boutique Inn','https://images.treebohotels.com/files/saravana_showcased_image.jpg?w=250&fit=crop&fm=jpg&h=200',4.5,'https://www.treebohotels.com/hotels-in-chennai/treebo-saravana-boutique-inn-royapettah-Z9o5X3e1/',1299,25,'New No. 15, Old No. 9, Peters Road, Royapettah, Chennai, 600014',99),(10,'Hive','https://images.treebohotels.com/files/Treebo_Hive/Treebo_Hive_6.jpg?w=250&fit=crop&fm=jpg&h=200',4.7,'https://www.treebohotels.com/hotels-in-chennai/treebo-hive-thoraipakkam-omr-q0Lr0X35/',1799,40,'No. 5/371, Annai Indira Nagar, Okkiam, Thoraipakkam, Chennai, 600097',17),(11,'J\'s Five Two Boutique','https://images.treebohotels.com/files/Treebo_J/01_Facade_3.jpg?w=250&fit=crop&fm=jpg&h=200',4,'https://www.treebohotels.com/hotels-in-chennai/treebo-js-five-two-boutique-ra-puram-5D3ydxjJ/',2999,15,'New No. 18, Old No. 29, 2nd Main Road, RA Puram, Chennai, 600028',52),(12,'Abeliya','https://images.treebohotels.com/files/Treebo_Abeliya/1_Treebo_Abeliya_Chennai_TwinBed1.jpg?w=250&fit=crop&fm=jpg&h=200',2.8,'https://www.treebohotels.com/hotels-in-chennai/treebo-abeliya-porur-QZj16Y34/',2299,10,'No. 23 & 24, Nakeeran Street, Kaviya Gardens, Mangala Nagar, Porur, Chennai, 600116',77),(13,'Archana Residency','https://images.treebohotels.com/files/Treebo_Archana_Residency/1Treebo_Archana_Residency_Main9.jpg?w=250&fit=crop&fm=jpg&h=200',4,'https://www.treebohotels.com/hotels-in-mumbai/treebo-archana-residency-mulund-awo0loZk/?',4299,20,'Next to R-Mall / Big Bazar, LBS Marg, Mulund (W), Mumbai, 400080',88),(14,'New Castle','https://images.treebohotels.com/files/NewCastle_Reception_1.jpg?w=250&fit=crop&fm=jpg&h=200',2,'https://www.treebohotels.com/hotels-in-mumbai/treebo-new-castle-khar-west-Mv3KNj1k/?',4999,10,'355, Linking Road, Above Only Parathas Restaurant, Khar West, Mumbai, 400052',2),(15,'Rain Forest Enclave','https://images.treebohotels.com/files/Rainforest_Reception_01.jpg?w=250&fit=crop&fm=jpg&h=200',4.5,'https://www.treebohotels.com/hotels-in-goa/treebo-rain-forest-enclave-arpora-aOog9wjq/',5199,25,'262/6, ward 14, Ghatbhat waddo, Arpora, Bardez, Goa, 403518',91),(16,'Bizotel Green','https://images.treebohotels.com/files/Treebo_Bizotel_Green/02_Reception.jpg?w=250&fit=crop&fm=jpg&h=200',5,'https://www.treebohotels.com/hotels-in-gurgaon/treebo-bizotel-green-sector-14-QZj1wNo4/?',2099,20,'2390/3, Old Delhi-Gurgaon Road, Opp. Dingra Motors, Sector 14, Gurgaon, 122001',73);
/*!40000 ALTER TABLE `hotel_deals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-02 20:20:22
