-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: db01_efusionve
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `charger`
--

DROP TABLE IF EXISTS `charger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charger` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `adresse` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `code_postal` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `ville` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `pays` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `longitude` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `latitude` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `owner_type` bit(1) NOT NULL,
  `prix` decimal(10,2) NOT NULL DEFAULT '0.28',
  `connector_id` bigint unsigned NOT NULL,
  `state` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `error_code` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `model` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vendor` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `serial_number` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `firmware_version` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timestamp` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price_details` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `INDEX_unique_conn_id` (`connector_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charger`
--

LOCK TABLES `charger` WRITE;
/*!40000 ALTER TABLE `charger` DISABLE KEYS */;
INSERT INTO `charger` VALUES (1,'0 av Labege','31400','Labege','France','1.513380','43.545607',_binary '\0',0.27,1,'accepted','Charging','NoError','type-2','Teison-AC','AISEN001','V0.0.1','2022-12-31 00:00:00','2023-03-03T09:32:50','2023-03-13 11:21:41','IoT charger','0,25 per kwh');
/*!40000 ALTER TABLE `charger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed`
--

DROP TABLE IF EXISTS `feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feed` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connector_id` bigint DEFAULT NULL,
  `trans_id` bigint DEFAULT NULL,
  `l1v` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `l2v` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `l3v` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `l1a` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `l2a` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `l3a` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `temp` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `watts` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `consumed` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `timestamp` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed`
--

LOCK TABLES `feed` WRITE;
/*!40000 ALTER TABLE `feed` DISABLE KEYS */;
INSERT INTO `feed` VALUES (1,1,8,'216.7','239.6','2414.6','324.6','241.4','0.0','29','7037','330157','2023-03-03T09:33:17');
/*!40000 ALTER TABLE `feed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_access_token`
--

DROP TABLE IF EXISTS `gireve_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_access_token` (
  `id` bigint NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `party_id` varchar(255) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_access_token`
--

LOCK TABLES `gireve_access_token` WRITE;
/*!40000 ALTER TABLE `gireve_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `gireve_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_cdr_dimension`
--

DROP TABLE IF EXISTS `gireve_cdr_dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_cdr_dimension` (
  `cdr_dimension_id` bigint NOT NULL,
  `type` varchar(255) NOT NULL,
  `volume` double NOT NULL,
  `charging_period_id` bigint NOT NULL,
  PRIMARY KEY (`cdr_dimension_id`),
  KEY `FK7hjx6v4w3r2qmtcihq8s6c69x` (`charging_period_id`),
  CONSTRAINT `FK7hjx6v4w3r2qmtcihq8s6c69x` FOREIGN KEY (`charging_period_id`) REFERENCES `gireve_charging_periods` (`charging_period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_cdr_dimension`
--

LOCK TABLES `gireve_cdr_dimension` WRITE;
/*!40000 ALTER TABLE `gireve_cdr_dimension` DISABLE KEYS */;
/*!40000 ALTER TABLE `gireve_cdr_dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_cdrs`
--

DROP TABLE IF EXISTS `gireve_cdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_cdrs` (
  `cdr_id` varchar(255) NOT NULL,
  `auth_id` varchar(255) NOT NULL,
  `auth_method` varchar(255) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `party_id` varchar(255) DEFAULT NULL,
  `currency` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  `meter_id` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `start_date_time` datetime NOT NULL,
  `stop_date_time` datetime NOT NULL,
  `total_cost` double NOT NULL,
  `total_energy` double NOT NULL,
  `total_parking_time` double NOT NULL,
  `total_time` double NOT NULL,
  `connector_id` varchar(255) NOT NULL,
  `evse_uid` varchar(255) NOT NULL,
  PRIMARY KEY (`cdr_id`),
  KEY `FK7u1jglcatktcri7wv2wopt444` (`connector_id`,`evse_uid`),
  CONSTRAINT `FK7u1jglcatktcri7wv2wopt444` FOREIGN KEY (`connector_id`, `evse_uid`) REFERENCES `gireve_connectors` (`connector_id`, `evse_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_cdrs`
--

LOCK TABLES `gireve_cdrs` WRITE;
/*!40000 ALTER TABLE `gireve_cdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `gireve_cdrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_charging_periods`
--

DROP TABLE IF EXISTS `gireve_charging_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_charging_periods` (
  `charging_period_id` bigint NOT NULL,
  `start_date_time` datetime NOT NULL,
  `cdr_id` varchar(255) NOT NULL,
  PRIMARY KEY (`charging_period_id`),
  KEY `FKhyi42rkvngfq7c3eiblqdwn7q` (`cdr_id`),
  CONSTRAINT `FKhyi42rkvngfq7c3eiblqdwn7q` FOREIGN KEY (`cdr_id`) REFERENCES `gireve_cdrs` (`cdr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_charging_periods`
--

LOCK TABLES `gireve_charging_periods` WRITE;
/*!40000 ALTER TABLE `gireve_charging_periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `gireve_charging_periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_connectors`
--

DROP TABLE IF EXISTS `gireve_connectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_connectors` (
  `connector_id` varchar(255) NOT NULL,
  `evse_uid` varchar(255) NOT NULL,
  `amperage` int NOT NULL,
  `format` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  `power_type` varchar(255) NOT NULL,
  `standard` varchar(255) NOT NULL,
  `tariff_id` varchar(255) DEFAULT NULL,
  `voltage` int NOT NULL,
  PRIMARY KEY (`connector_id`,`evse_uid`),
  KEY `FKehxun3carwjv0jsluhft5sx0r` (`evse_uid`),
  CONSTRAINT `FKehxun3carwjv0jsluhft5sx0r` FOREIGN KEY (`evse_uid`) REFERENCES `gireve_evses` (`evse_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_connectors`
--

LOCK TABLES `gireve_connectors` WRITE;
/*!40000 ALTER TABLE `gireve_connectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `gireve_connectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_connectors_cdrs`
--

DROP TABLE IF EXISTS `gireve_connectors_cdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_connectors_cdrs` (
  `connector_connector_id` varchar(255) NOT NULL,
  `connector_evse_uid` varchar(255) NOT NULL,
  `cdrs_cdr_id` varchar(255) NOT NULL,
  UNIQUE KEY `UK_bmbomgg2776sbp9rlr2vqb1ro` (`cdrs_cdr_id`),
  KEY `FK86ua87wimjpf7kba2nb1jsc2u` (`connector_connector_id`,`connector_evse_uid`),
  CONSTRAINT `FK80nk2ouul217w1gb0d0gjaanf` FOREIGN KEY (`cdrs_cdr_id`) REFERENCES `gireve_cdrs` (`cdr_id`),
  CONSTRAINT `FK86ua87wimjpf7kba2nb1jsc2u` FOREIGN KEY (`connector_connector_id`, `connector_evse_uid`) REFERENCES `gireve_connectors` (`connector_id`, `evse_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_connectors_cdrs`
--

LOCK TABLES `gireve_connectors_cdrs` WRITE;
/*!40000 ALTER TABLE `gireve_connectors_cdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `gireve_connectors_cdrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_credentials`
--

DROP TABLE IF EXISTS `gireve_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_credentials` (
  `country_code` varchar(255) NOT NULL,
  `party_id` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `height` int DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `width` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `cdrs_last_update` datetime DEFAULT NULL,
  `locations_last_update` datetime DEFAULT NULL,
  `operator_type` varchar(255) NOT NULL,
  `sessions_last_update` datetime DEFAULT NULL,
  `tariffs_last_update` datetime DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`country_code`,`party_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_credentials`
--

LOCK TABLES `gireve_credentials` WRITE;
/*!40000 ALTER TABLE `gireve_credentials` DISABLE KEYS */;
INSERT INTO `gireve_credentials` VALUES ('FR','CPO',NULL,NULL,NULL,NULL,NULL,NULL,'GIREVE-PREPROD',NULL,'1970-01-01 00:00:00','2023-03-06 10:32:39','CPO','1970-01-01 00:00:00','1970-01-01 00:00:00','TOIOP-OCPI-TOKEN-63238aca-a198-46e6-a8e7-36da72ae3dec','https://ocpi-pp-iop.gireve.com/ocpi/cpo/versions');
/*!40000 ALTER TABLE `gireve_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_endpoints`
--

DROP TABLE IF EXISTS `gireve_endpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_endpoints` (
  `id` bigint NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `version_details_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7fwlmud0p6o384kllcc3as13l` (`version_details_id`),
  CONSTRAINT `FK7fwlmud0p6o384kllcc3as13l` FOREIGN KEY (`version_details_id`) REFERENCES `gireve_version_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_endpoints`
--

LOCK TABLES `gireve_endpoints` WRITE;
/*!40000 ALTER TABLE `gireve_endpoints` DISABLE KEYS */;
INSERT INTO `gireve_endpoints` VALUES (1,'credentials','https://ocpi-pp-iop.gireve.com/ocpi/cpo/2.1.1/credentials',1),(2,'locations','https://ocpi-pp-iop.gireve.com/ocpi/cpo/2.1.1/locations',1),(3,'tokens','https://ocpi-pp-iop.gireve.com/ocpi/cpo/2.1.1/tokens',1),(4,'commands','https://ocpi-pp-iop.gireve.com/ocpi/cpo/2.1.1/commands',1),(5,'sessions','https://ocpi-pp-iop.gireve.com/ocpi/cpo/2.1.1/sessions',1),(6,'cdrs','https://ocpi-pp-iop.gireve.com/ocpi/cpo/2.1.1/cdrs',1),(7,'tariffs','https://ocpi-pp-iop.gireve.com/ocpi/cpo/2.1.1/tariffs',1);
/*!40000 ALTER TABLE `gireve_endpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_evses`
--

DROP TABLE IF EXISTS `gireve_evses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_evses` (
  `evse_uid` varchar(255) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `location_id` varchar(255) NOT NULL,
  PRIMARY KEY (`evse_uid`),
  KEY `FK4brhhif5gaub2k4h5re8rkxlo` (`location_id`),
  CONSTRAINT `FK4brhhif5gaub2k4h5re8rkxlo` FOREIGN KEY (`location_id`) REFERENCES `gireve_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_evses`
--

LOCK TABLES `gireve_evses` WRITE;
/*!40000 ALTER TABLE `gireve_evses` DISABLE KEYS */;
/*!40000 ALTER TABLE `gireve_evses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_hours`
--

DROP TABLE IF EXISTS `gireve_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_hours` (
  `hours_id` bigint NOT NULL,
  `twentyfourseven` bit(1) NOT NULL,
  `location_location_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hours_id`),
  KEY `FKpg03ue2yp5bi591co1071pt7g` (`location_location_id`),
  CONSTRAINT `FKpg03ue2yp5bi591co1071pt7g` FOREIGN KEY (`location_location_id`) REFERENCES `gireve_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_hours`
--

LOCK TABLES `gireve_hours` WRITE;
/*!40000 ALTER TABLE `gireve_hours` DISABLE KEYS */;
/*!40000 ALTER TABLE `gireve_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_locations`
--

DROP TABLE IF EXISTS `gireve_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_locations` (
  `location_id` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `charging_when_closed` bit(1) NOT NULL,
  `city` varchar(255) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `party_id` varchar(255) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_locations`
--

LOCK TABLES `gireve_locations` WRITE;
/*!40000 ALTER TABLE `gireve_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gireve_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_price_component`
--

DROP TABLE IF EXISTS `gireve_price_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_price_component` (
  `price_id` bigint NOT NULL,
  `exact_price_component` bit(1) NOT NULL,
  `price` double NOT NULL,
  `price_round_round_granularity` varchar(255) DEFAULT NULL,
  `price_round_round_rule` varchar(255) DEFAULT NULL,
  `step_size` int NOT NULL,
  `step_round_round_granularity` varchar(255) DEFAULT NULL,
  `step_round_round_rule` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `tariff_element_id` bigint NOT NULL,
  PRIMARY KEY (`price_id`),
  KEY `FKa5xxfuhkylgbtddxbeir25hso` (`tariff_element_id`),
  CONSTRAINT `FKa5xxfuhkylgbtddxbeir25hso` FOREIGN KEY (`tariff_element_id`) REFERENCES `gireve_tariff_element` (`tariff_element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_price_component`
--

LOCK TABLES `gireve_price_component` WRITE;
/*!40000 ALTER TABLE `gireve_price_component` DISABLE KEYS */;
INSERT INTO `gireve_price_component` VALUES (238,_binary '',0,'THOUSANDTH','ROUND_NEAR',90,'UNIT','ROUND_UP','ENERGY',237),(241,_binary '',0,'THOUSANDTH','ROUND_NEAR',5,'UNIT','ROUND_UP','ENERGY',240),(325,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',324),(328,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',327),(331,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',330),(415,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',414),(418,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',417),(421,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',420),(505,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',504),(508,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',507),(511,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',510),(595,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',594),(598,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',597),(601,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',600),(685,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',684),(688,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',687),(691,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',690),(775,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',774),(778,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',777),(781,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',780),(865,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',864),(868,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',867),(871,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',870),(955,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',954),(958,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',957),(961,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',960),(1045,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',1044),(1048,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',1047),(1051,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',1050),(1135,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',1134),(1138,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',1137),(1141,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',1140),(1225,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',1224),(1228,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',1227),(1231,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',1230),(1315,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',1314),(1318,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',1317),(1321,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',1320),(1405,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',1404),(1408,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',1407),(1411,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',1410),(1504,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',1503),(1507,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',1506),(1510,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',1509),(1603,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',1602),(1606,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',1605),(1609,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',1608),(1702,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',1701),(1705,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',1704),(1708,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',1707),(1801,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',1800),(1804,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',1803),(1807,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',1806),(1900,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',1899),(1903,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',1902),(1906,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',1905),(1999,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',1998),(2002,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',2001),(2005,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',2004),(2098,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',2097),(2101,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',2100),(2104,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',2103),(2197,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',2196),(2200,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',2199),(2203,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',2202),(2296,_binary '',3,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',2295),(2299,_binary '',1,'THOUSANDTH','ROUND_NEAR',900,'UNIT','ROUND_UP','TIME',2298),(2302,_binary '',2,'THOUSANDTH','ROUND_NEAR',600,'UNIT','ROUND_UP','TIME',2301),(2305,_binary '',1,'THOUSANDTH','ROUND_NEAR',600,'UNIT','ROUND_UP','TIME',2304),(2308,_binary '',5,'THOUSANDTH','ROUND_NEAR',300,'UNIT','ROUND_UP','PARKING_TIME',2307),(2311,_binary '',6,'THOUSANDTH','ROUND_NEAR',300,'UNIT','ROUND_UP','PARKING_TIME',2310),(2395,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',2394),(2398,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',2397),(2401,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',2400),(2485,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',2484),(2488,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',2487),(2491,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',2490),(2569,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',2568),(2572,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',2571),(2575,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',2574),(2647,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',2646),(2650,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',2649),(2653,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',2652),(2728,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',2727),(2731,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',2730),(2734,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',2733),(2812,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',2811),(2815,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',2814),(2818,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',2817),(2899,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',2898),(2902,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',2901),(2905,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',2904),(2995,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',2994),(2998,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',2997),(3001,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',3000),(3100,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',3099),(3103,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',3102),(3106,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',3105),(3214,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',3213),(3217,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',3216),(3220,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',3219),(3337,_binary '',100,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',3336),(3469,_binary '',100,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',3468),(3616,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',3615),(3619,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',3618),(3622,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',3621),(3625,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','PARKING_TIME',3624),(3778,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',3777),(3781,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',3780),(3784,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',3783),(3787,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','PARKING_TIME',3786),(3946,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',3945),(3949,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','ENERGY',3948),(3952,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',3951),(3955,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','PARKING_TIME',3954),(4120,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',4119),(4123,_binary '',0,'THOUSANDTH','ROUND_NEAR',1000,'UNIT','ROUND_UP','ENERGY',4122),(4126,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4125),(4129,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4128),(4132,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4131),(4135,_binary '',17,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4134),(4300,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',4299),(4303,_binary '',0,'THOUSANDTH','ROUND_NEAR',1000,'UNIT','ROUND_UP','ENERGY',4302),(4306,_binary '',1,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4305),(4309,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4308),(4312,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4311),(4315,_binary '',22,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4314),(4480,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',4479),(4483,_binary '',0,'THOUSANDTH','ROUND_NEAR',1000,'UNIT','ROUND_UP','ENERGY',4482),(4486,_binary '',1,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4485),(4489,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4488),(4492,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4491),(4495,_binary '',22,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4494),(4660,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',4659),(4663,_binary '',0,'THOUSANDTH','ROUND_NEAR',1000,'UNIT','ROUND_UP','ENERGY',4662),(4666,_binary '',1,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4665),(4669,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4668),(4672,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4671),(4675,_binary '',22,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4674),(4840,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',4839),(4843,_binary '',0,'THOUSANDTH','ROUND_NEAR',1000,'UNIT','ROUND_UP','ENERGY',4842),(4846,_binary '',1,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4845),(4849,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4848),(4852,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4851),(4855,_binary '',22,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',4854),(5020,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',5019),(5023,_binary '',0,'THOUSANDTH','ROUND_NEAR',1000,'UNIT','ROUND_UP','ENERGY',5022),(5026,_binary '',1,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5025),(5029,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5028),(5032,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5031),(5035,_binary '',22,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5034),(5182,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',5181),(5185,_binary '',0,'THOUSANDTH','ROUND_NEAR',1000,'UNIT','ROUND_UP','ENERGY',5184),(5188,_binary '',1,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5187),(5191,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5190),(5194,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5193),(5197,_binary '',22,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5196),(5326,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',5325),(5329,_binary '',0,'THOUSANDTH','ROUND_NEAR',1000,'UNIT','ROUND_UP','ENERGY',5328),(5332,_binary '',1,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5331),(5335,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5334),(5338,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5337),(5341,_binary '',22,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5340),(5452,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',5451),(5455,_binary '',0,'THOUSANDTH','ROUND_NEAR',1000,'UNIT','ROUND_UP','ENERGY',5454),(5458,_binary '',1,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5457),(5461,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5460),(5464,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5463),(5467,_binary '',22,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5466),(5560,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',5559),(5563,_binary '',0,'THOUSANDTH','ROUND_NEAR',1000,'UNIT','ROUND_UP','ENERGY',5562),(5566,_binary '',1,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5565),(5569,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5568),(5572,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5571),(5575,_binary '',22,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5574),(5650,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',5649),(5653,_binary '',0,'THOUSANDTH','ROUND_NEAR',1000,'UNIT','ROUND_UP','ENERGY',5652),(5656,_binary '',1,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5655),(5659,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5658),(5662,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5661),(5665,_binary '',22,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5664),(5722,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',5721),(5725,_binary '',0,'THOUSANDTH','ROUND_NEAR',1000,'UNIT','ROUND_UP','ENERGY',5724),(5728,_binary '',1,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5727),(5731,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5730),(5734,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5733),(5737,_binary '',22,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5736),(5776,_binary '',3,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',5775),(5779,_binary '',1,'THOUSANDTH','ROUND_NEAR',1000,'UNIT','ROUND_UP','ENERGY',5778),(5782,_binary '',3,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5781),(5785,_binary '',1,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5784),(5788,_binary '',1,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5787),(5791,_binary '',64,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5790),(5812,_binary '',0,'THOUSANDTH','ROUND_NEAR',1,'UNIT','ROUND_UP','FLAT',5811),(5815,_binary '',0,'THOUSANDTH','ROUND_NEAR',1000,'UNIT','ROUND_UP','ENERGY',5814),(5818,_binary '',1,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5817),(5821,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5820),(5824,_binary '',0,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5823),(5827,_binary '',22,'THOUSANDTH','ROUND_NEAR',60,'UNIT','ROUND_UP','TIME',5826);
/*!40000 ALTER TABLE `gireve_price_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_regular_hours`
--

DROP TABLE IF EXISTS `gireve_regular_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_regular_hours` (
  `id` bigint NOT NULL,
  `period_begin` varchar(255) NOT NULL,
  `period_end` varchar(255) NOT NULL,
  `weekday` int NOT NULL,
  `hours_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKb2t7l168cihumcpjmn98w1k7e` (`hours_id`),
  CONSTRAINT `FKb2t7l168cihumcpjmn98w1k7e` FOREIGN KEY (`hours_id`) REFERENCES `gireve_hours` (`hours_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_regular_hours`
--

LOCK TABLES `gireve_regular_hours` WRITE;
/*!40000 ALTER TABLE `gireve_regular_hours` DISABLE KEYS */;
/*!40000 ALTER TABLE `gireve_regular_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_session`
--

DROP TABLE IF EXISTS `gireve_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_session` (
  `session_id` varchar(255) NOT NULL,
  `auth_id` varchar(255) NOT NULL,
  `auth_method` varchar(255) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `party_id` varchar(255) DEFAULT NULL,
  `currency` varchar(255) NOT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `kwh` double NOT NULL,
  `last_updated` datetime NOT NULL,
  `meter_id` varchar(255) DEFAULT NULL,
  `start_datetime` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `total_cost` double NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_session`
--

LOCK TABLES `gireve_session` WRITE;
/*!40000 ALTER TABLE `gireve_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `gireve_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_session_command`
--

DROP TABLE IF EXISTS `gireve_session_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_session_command` (
  `session_command_id` bigint NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `response` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`session_command_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_session_command`
--

LOCK TABLES `gireve_session_command` WRITE;
/*!40000 ALTER TABLE `gireve_session_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `gireve_session_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_tariff_element`
--

DROP TABLE IF EXISTS `gireve_tariff_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_tariff_element` (
  `tariff_element_id` bigint NOT NULL,
  `tariff_id` varchar(255) NOT NULL,
  PRIMARY KEY (`tariff_element_id`),
  KEY `FKnr2gc66m7oou9y8y5df8bumrt` (`tariff_id`),
  CONSTRAINT `FKnr2gc66m7oou9y8y5df8bumrt` FOREIGN KEY (`tariff_id`) REFERENCES `gireve_tariffs` (`tariff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_tariff_element`
--

LOCK TABLES `gireve_tariff_element` WRITE;
/*!40000 ALTER TABLE `gireve_tariff_element` DISABLE KEYS */;
INSERT INTO `gireve_tariff_element` VALUES (5451,'598-10323-4758'),(5454,'598-10323-4758'),(5457,'598-10323-4758'),(5460,'598-10323-4758'),(5463,'598-10323-4758'),(5466,'598-10323-4758'),(5559,'598-10324-47581'),(5562,'598-10324-47581'),(5565,'598-10324-47581'),(5568,'598-10324-47581'),(5571,'598-10324-47581'),(5574,'598-10324-47581'),(5649,'598-10325-475812'),(5652,'598-10325-475812'),(5655,'598-10325-475812'),(5658,'598-10325-475812'),(5661,'598-10325-475812'),(5664,'598-10325-475812'),(5721,'598-10326-4758124'),(5724,'598-10326-4758124'),(5727,'598-10326-4758124'),(5730,'598-10326-4758124'),(5733,'598-10326-4758124'),(5736,'598-10326-4758124'),(5775,'598-17371-5'),(5778,'598-17371-5'),(5781,'598-17371-5'),(5784,'598-17371-5'),(5787,'598-17371-5'),(5790,'598-17371-5'),(5811,'598-17375-1000'),(5814,'598-17375-1000'),(5817,'598-17375-1000'),(5820,'598-17375-1000'),(5823,'598-17375-1000'),(5826,'598-17375-1000'),(237,'598-6204-GRP-141'),(240,'598-6204-GRP-141'),(324,'598-6377-6788513443'),(327,'598-6377-6788513443'),(330,'598-6377-6788513443'),(414,'598-6378-67885134437678'),(417,'598-6378-67885134437678'),(420,'598-6378-67885134437678'),(504,'598-6379-678854437678'),(507,'598-6379-678854437678'),(510,'598-6379-678854437678'),(594,'598-6380-678853678'),(597,'598-6380-678853678'),(600,'598-6380-678853678'),(684,'598-6381-67885348'),(687,'598-6381-67885348'),(690,'598-6381-67885348'),(774,'598-6382-6788'),(777,'598-6382-6788'),(780,'598-6382-6788'),(864,'598-6383-67812322148'),(867,'598-6383-67812322148'),(870,'598-6383-67812322148'),(954,'598-6384-678123232428'),(957,'598-6384-678123232428'),(960,'598-6384-678123232428'),(1044,'598-6385-6781232324'),(1047,'598-6385-6781232324'),(1050,'598-6385-6781232324'),(1134,'598-6386-123345'),(1137,'598-6386-123345'),(1140,'598-6386-123345'),(1224,'598-6387-1233456'),(1227,'598-6387-1233456'),(1230,'598-6387-1233456'),(1314,'598-6388-12334567'),(1317,'598-6388-12334567'),(1320,'598-6388-12334567'),(1404,'598-6389-123345678'),(1407,'598-6389-123345678'),(1410,'598-6389-123345678'),(1503,'598-6390-1233456789'),(1506,'598-6390-1233456789'),(1509,'598-6390-1233456789'),(1602,'598-6391-123345678910'),(1605,'598-6391-123345678910'),(1608,'598-6391-123345678910'),(1701,'598-6392-1233456178910'),(1704,'598-6392-1233456178910'),(1707,'598-6392-1233456178910'),(1800,'598-6393-12334562178910'),(1803,'598-6393-12334562178910'),(1806,'598-6393-12334562178910'),(1899,'598-6394-1233456217891044'),(1902,'598-6394-1233456217891044'),(1905,'598-6394-1233456217891044'),(1998,'598-6635-12334562178910444'),(2001,'598-6635-12334562178910444'),(2004,'598-6635-12334562178910444'),(2097,'598-6636-123345621789104445'),(2100,'598-6636-123345621789104445'),(2103,'598-6636-123345621789104445'),(2196,'598-6637-1233456217891044457'),(2199,'598-6637-1233456217891044457'),(2202,'598-6637-1233456217891044457'),(2295,'598-7720-FR-CPO-TEST-YANIS'),(2298,'598-7720-FR-CPO-TEST-YANIS'),(2301,'598-7720-FR-CPO-TEST-YANIS'),(2304,'598-7720-FR-CPO-TEST-YANIS'),(2307,'598-7720-FR-CPO-TEST-YANIS'),(2310,'598-7720-FR-CPO-TEST-YANIS'),(2394,'598-8026-TESTYANIS891044457'),(2397,'598-8026-TESTYANIS891044457'),(2400,'598-8026-TESTYANIS891044457'),(2484,'598-8070-TESTYANIS891044457ECH'),(2487,'598-8070-TESTYANIS891044457ECH'),(2490,'598-8070-TESTYANIS891044457ECH'),(2568,'598-8071-TESTYANIS891044457ECH2'),(2571,'598-8071-TESTYANIS891044457ECH2'),(2574,'598-8071-TESTYANIS891044457ECH2'),(2646,'598-8080-FR*CPO_1'),(2649,'598-8080-FR*CPO_1'),(2652,'598-8080-FR*CPO_1'),(2727,'598-8193-FR*CPO_TESTQ8'),(2730,'598-8193-FR*CPO_TESTQ8'),(2733,'598-8193-FR*CPO_TESTQ8'),(2811,'598-9261-FR*CPO_TESTQ12'),(2814,'598-9261-FR*CPO_TESTQ12'),(2817,'598-9261-FR*CPO_TESTQ12'),(2898,'598-9262-FR*CPO_TESTQ13'),(2901,'598-9262-FR*CPO_TESTQ13'),(2904,'598-9262-FR*CPO_TESTQ13'),(2994,'598-9380-FR*CPO_TESTQ43'),(2997,'598-9380-FR*CPO_TESTQ43'),(3000,'598-9380-FR*CPO_TESTQ43'),(3099,'598-9614-FR*CPO-TESTQ8'),(3102,'598-9614-FR*CPO-TESTQ8'),(3105,'598-9614-FR*CPO-TESTQ8'),(3213,'598-9615-FR*SMI*PRIX-TYPE2AC-22K-01-'),(3216,'598-9615-FR*SMI*PRIX-TYPE2AC-22K-01-'),(3219,'598-9615-FR*SMI*PRIX-TYPE2AC-22K-01-'),(3336,'598-9616-FR*SMI*PRIX-TYPE2AC-3K-02-2'),(3468,'598-9617-FR*YANIS'),(3615,'598-9646-WATTIFY_TEST'),(3618,'598-9646-WATTIFY_TEST'),(3621,'598-9646-WATTIFY_TEST'),(3624,'598-9646-WATTIFY_TEST'),(3777,'598-9778-594'),(3780,'598-9778-594'),(3783,'598-9778-594'),(3786,'598-9778-594'),(3945,'598-9779-954954'),(3948,'598-9779-954954'),(3951,'598-9779-954954'),(3954,'598-9779-954954'),(4119,'598-9780-TAC0000003'),(4122,'598-9780-TAC0000003'),(4125,'598-9780-TAC0000003'),(4128,'598-9780-TAC0000003'),(4131,'598-9780-TAC0000003'),(4134,'598-9780-TAC0000003'),(4299,'598-9781-TDC0000003'),(4302,'598-9781-TDC0000003'),(4305,'598-9781-TDC0000003'),(4308,'598-9781-TDC0000003'),(4311,'598-9781-TDC0000003'),(4314,'598-9781-TDC0000003'),(4479,'598-9782-TESTTESTTEST'),(4482,'598-9782-TESTTESTTEST'),(4485,'598-9782-TESTTESTTEST'),(4488,'598-9782-TESTTESTTEST'),(4491,'598-9782-TESTTESTTEST'),(4494,'598-9782-TESTTESTTEST'),(4659,'598-9783-TESTTHOMASXYANIS'),(4662,'598-9783-TESTTHOMASXYANIS'),(4665,'598-9783-TESTTHOMASXYANIS'),(4668,'598-9783-TESTTHOMASXYANIS'),(4671,'598-9783-TESTTHOMASXYANIS'),(4674,'598-9783-TESTTHOMASXYANIS'),(4839,'598-9784-1'),(4842,'598-9784-1'),(4845,'598-9784-1'),(4848,'598-9784-1'),(4851,'598-9784-1'),(4854,'598-9784-1'),(5019,'598-9785-2'),(5022,'598-9785-2'),(5025,'598-9785-2'),(5028,'598-9785-2'),(5031,'598-9785-2'),(5034,'598-9785-2'),(5181,'598-9786-3'),(5184,'598-9786-3'),(5187,'598-9786-3'),(5190,'598-9786-3'),(5193,'598-9786-3'),(5196,'598-9786-3'),(5325,'598-9787-4'),(5328,'598-9787-4'),(5331,'598-9787-4'),(5334,'598-9787-4'),(5337,'598-9787-4'),(5340,'598-9787-4');
/*!40000 ALTER TABLE `gireve_tariff_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_tariff_restrictions`
--

DROP TABLE IF EXISTS `gireve_tariff_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_tariff_restrictions` (
  `tariff_restriction_id` bigint NOT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `end_time_2` varchar(255) DEFAULT NULL,
  `max_duration` int NOT NULL,
  `max_kwh` double NOT NULL,
  `max_power` double NOT NULL,
  `min_duration` int NOT NULL,
  `min_kwh` double NOT NULL,
  `min_power` double NOT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `start_time_2` varchar(255) DEFAULT NULL,
  `tariff_element_id` bigint NOT NULL,
  PRIMARY KEY (`tariff_restriction_id`),
  KEY `FKkvoo9y7jbje6nm6qg6ejlwet` (`tariff_element_id`),
  CONSTRAINT `FKkvoo9y7jbje6nm6qg6ejlwet` FOREIGN KEY (`tariff_element_id`) REFERENCES `gireve_tariff_element` (`tariff_element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_tariff_restrictions`
--

LOCK TABLES `gireve_tariff_restrictions` WRITE;
/*!40000 ALTER TABLE `gireve_tariff_restrictions` DISABLE KEYS */;
INSERT INTO `gireve_tariff_restrictions` VALUES (239,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,237),(242,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,240),(326,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,324),(329,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,327),(332,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,330),(416,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,414),(419,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,417),(422,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,420),(506,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,504),(509,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,507),(512,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,510),(596,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,594),(599,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,597),(602,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,600),(686,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,684),(689,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,687),(692,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,690),(776,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,774),(779,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,777),(782,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,780),(866,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,864),(869,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,867),(872,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,870),(956,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,954),(959,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,957),(962,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,960),(1046,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1044),(1049,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,1047),(1052,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1050),(1136,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1134),(1139,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,1137),(1142,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1140),(1226,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1224),(1229,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,1227),(1232,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1230),(1316,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1314),(1319,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,1317),(1322,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1320),(1406,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1404),(1409,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,1407),(1412,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1410),(1505,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1503),(1508,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,1506),(1511,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1509),(1604,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1602),(1607,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,1605),(1610,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1608),(1703,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1701),(1706,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,1704),(1709,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1707),(1802,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1800),(1805,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,1803),(1808,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1806),(1901,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1899),(1904,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,1902),(1907,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1905),(2000,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1998),(2003,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,2001),(2006,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2004),(2099,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2097),(2102,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,2100),(2105,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2103),(2198,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2196),(2201,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,2199),(2204,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2202),(2297,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2295),(2300,NULL,NULL,NULL,0,0,32,0,0,0,NULL,NULL,NULL,2298),(2303,NULL,NULL,NULL,0,0,0,0,0,32,NULL,NULL,NULL,2301),(2306,NULL,NULL,NULL,0,0,0,0,0,32,NULL,NULL,NULL,2304),(2309,NULL,'18:00',NULL,0,0,0,0,0,0,NULL,'09:00',NULL,2307),(2312,NULL,'17:00',NULL,0,0,0,0,0,0,NULL,'10:00',NULL,2310),(2396,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2394),(2399,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,2397),(2402,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2400),(2486,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2484),(2489,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,2487),(2492,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2490),(2570,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2568),(2573,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,2571),(2576,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2574),(2648,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2646),(2651,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,2649),(2654,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2652),(2729,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2727),(2732,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,2730),(2735,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2733),(2813,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2811),(2816,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,2814),(2819,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2817),(2900,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2898),(2903,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,2901),(2906,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2904),(2996,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2994),(2999,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,2997),(3002,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3000),(3101,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3099),(3104,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,3102),(3107,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3105),(3215,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3213),(3218,NULL,NULL,NULL,0,0,0,180,0,0,NULL,NULL,NULL,3216),(3221,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3219),(3338,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3336),(3470,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3468),(3617,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3615),(3620,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3618),(3623,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3621),(3626,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3624),(3779,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3777),(3782,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3780),(3785,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3783),(3788,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3786),(3947,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3945),(3950,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3948),(3953,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3951),(3956,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,3954),(4121,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,4119),(4124,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,4122),(4127,NULL,'22:00',NULL,0,0,0,0,0,0,NULL,'06:00',NULL,4125),(4130,NULL,'06:00',NULL,0,0,0,0,0,0,NULL,'00:00',NULL,4128),(4133,NULL,'23:59',NULL,0,0,0,0,0,0,NULL,'22:00',NULL,4131),(4136,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,4134),(4301,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,4299),(4304,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,4302),(4307,NULL,'22:00',NULL,0,0,0,0,0,0,NULL,'06:00',NULL,4305),(4310,NULL,'06:00',NULL,0,0,0,0,0,0,NULL,'00:00',NULL,4308),(4313,NULL,'23:59',NULL,0,0,0,0,0,0,NULL,'22:00',NULL,4311),(4316,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,4314),(4481,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,4479),(4484,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,4482),(4487,NULL,'22:00',NULL,0,0,0,0,0,0,NULL,'06:00',NULL,4485),(4490,NULL,'06:00',NULL,0,0,0,0,0,0,NULL,'00:00',NULL,4488),(4493,NULL,'23:59',NULL,0,0,0,0,0,0,NULL,'22:00',NULL,4491),(4496,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,4494),(4661,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,4659),(4664,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,4662),(4667,NULL,'22:00',NULL,0,0,0,0,0,0,NULL,'06:00',NULL,4665),(4670,NULL,'06:00',NULL,0,0,0,0,0,0,NULL,'00:00',NULL,4668),(4673,NULL,'23:59',NULL,0,0,0,0,0,0,NULL,'22:00',NULL,4671),(4676,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,4674),(4841,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,4839),(4844,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,4842),(4847,NULL,'22:00',NULL,0,0,0,0,0,0,NULL,'06:00',NULL,4845),(4850,NULL,'06:00',NULL,0,0,0,0,0,0,NULL,'00:00',NULL,4848),(4853,NULL,'23:59',NULL,0,0,0,0,0,0,NULL,'22:00',NULL,4851),(4856,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,4854),(5021,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5019),(5024,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5022),(5027,NULL,'22:00',NULL,0,0,0,0,0,0,NULL,'06:00',NULL,5025),(5030,NULL,'06:00',NULL,0,0,0,0,0,0,NULL,'00:00',NULL,5028),(5033,NULL,'23:59',NULL,0,0,0,0,0,0,NULL,'22:00',NULL,5031),(5036,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5034),(5183,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5181),(5186,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5184),(5189,NULL,'22:00',NULL,0,0,0,0,0,0,NULL,'06:00',NULL,5187),(5192,NULL,'06:00',NULL,0,0,0,0,0,0,NULL,'00:00',NULL,5190),(5195,NULL,'23:59',NULL,0,0,0,0,0,0,NULL,'22:00',NULL,5193),(5198,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5196),(5327,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5325),(5330,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5328),(5333,NULL,'22:00',NULL,0,0,0,0,0,0,NULL,'06:00',NULL,5331),(5336,NULL,'06:00',NULL,0,0,0,0,0,0,NULL,'00:00',NULL,5334),(5339,NULL,'23:59',NULL,0,0,0,0,0,0,NULL,'22:00',NULL,5337),(5342,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5340),(5453,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5451),(5456,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5454),(5459,NULL,'22:00',NULL,0,0,0,0,0,0,NULL,'06:00',NULL,5457),(5462,NULL,'06:00',NULL,0,0,0,0,0,0,NULL,'00:00',NULL,5460),(5465,NULL,'23:59',NULL,0,0,0,0,0,0,NULL,'22:00',NULL,5463),(5468,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5466),(5561,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5559),(5564,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5562),(5567,NULL,'22:00',NULL,0,0,0,0,0,0,NULL,'06:00',NULL,5565),(5570,NULL,'06:00',NULL,0,0,0,0,0,0,NULL,'00:00',NULL,5568),(5573,NULL,'23:59',NULL,0,0,0,0,0,0,NULL,'22:00',NULL,5571),(5576,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5574),(5651,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5649),(5654,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5652),(5657,NULL,'22:00',NULL,0,0,0,0,0,0,NULL,'06:00',NULL,5655),(5660,NULL,'06:00',NULL,0,0,0,0,0,0,NULL,'00:00',NULL,5658),(5663,NULL,'23:59',NULL,0,0,0,0,0,0,NULL,'22:00',NULL,5661),(5666,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5664),(5723,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5721),(5726,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5724),(5729,NULL,'22:00',NULL,0,0,0,0,0,0,NULL,'06:00',NULL,5727),(5732,NULL,'06:00',NULL,0,0,0,0,0,0,NULL,'00:00',NULL,5730),(5735,NULL,'23:59',NULL,0,0,0,0,0,0,NULL,'22:00',NULL,5733),(5738,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5736),(5777,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5775),(5780,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5778),(5783,NULL,'22:00',NULL,0,0,0,0,0,0,NULL,'06:00',NULL,5781),(5786,NULL,'06:00',NULL,0,0,0,0,0,0,NULL,'00:00',NULL,5784),(5789,NULL,'23:59',NULL,0,0,0,0,0,0,NULL,'22:00',NULL,5787),(5792,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5790),(5813,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5811),(5816,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5814),(5819,NULL,'22:00',NULL,0,0,0,0,0,0,NULL,'06:00',NULL,5817),(5822,NULL,'06:00',NULL,0,0,0,0,0,0,NULL,'00:00',NULL,5820),(5825,NULL,'23:59',NULL,0,0,0,0,0,0,NULL,'22:00',NULL,5823),(5828,NULL,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,5826);
/*!40000 ALTER TABLE `gireve_tariff_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_tariffs`
--

DROP TABLE IF EXISTS `gireve_tariffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_tariffs` (
  `tariff_id` varchar(255) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `party_id` varchar(255) DEFAULT NULL,
  `currency` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`tariff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_tariffs`
--

LOCK TABLES `gireve_tariffs` WRITE;
/*!40000 ALTER TABLE `gireve_tariffs` DISABLE KEYS */;
INSERT INTO `gireve_tariffs` VALUES ('598-10323-4758','FR','CPO','EUR','2023-01-05 12:58:45'),('598-10324-47581','FR','CPO','EUR','2023-01-05 12:58:51'),('598-10325-475812','FR','CPO','EUR','2023-01-05 12:58:55'),('598-10326-4758124','FR','CPO','EUR','2023-01-05 12:58:59'),('598-17371-5','FR','CPO','EUR','2023-03-01 15:36:22'),('598-17375-1000','FR','CPO','EUR','2023-03-02 13:32:42'),('598-6204-GRP-141','FR','CPO','EUR','2021-12-14 13:55:27'),('598-6377-6788513443','FR','CPO','EUR','2022-01-19 15:28:05'),('598-6378-67885134437678','FR','CPO','EUR','2022-01-19 15:29:05'),('598-6379-678854437678','FR','CPO','EUR','2022-01-19 15:29:12'),('598-6380-678853678','FR','CPO','EUR','2022-01-19 15:29:21'),('598-6381-67885348','FR','CPO','EUR','2022-01-19 15:29:31'),('598-6382-6788','FR','CPO','EUR','2022-01-19 15:29:42'),('598-6383-67812322148','FR','CPO','EUR','2022-01-19 15:29:50'),('598-6384-678123232428','FR','CPO','EUR','2022-01-19 15:30:03'),('598-6385-6781232324','FR','CPO','EUR','2022-01-19 15:30:11'),('598-6386-123345','FR','CPO','EUR','2022-01-19 15:30:18'),('598-6387-1233456','FR','CPO','EUR','2022-01-19 15:30:24'),('598-6388-12334567','FR','CPO','EUR','2022-01-19 15:30:47'),('598-6389-123345678','FR','CPO','EUR','2022-01-19 15:30:52'),('598-6390-1233456789','FR','CPO','EUR','2022-01-19 15:30:58'),('598-6391-123345678910','FR','CPO','EUR','2022-01-19 15:31:03'),('598-6392-1233456178910','FR','CPO','EUR','2022-01-19 15:31:08'),('598-6393-12334562178910','FR','CPO','EUR','2022-01-19 15:31:14'),('598-6394-1233456217891044','FR','CPO','EUR','2022-01-19 15:42:26'),('598-6635-12334562178910444','FR','CPO','EUR','2022-02-15 11:18:07'),('598-6636-123345621789104445','FR','CPO','EUR','2022-02-15 11:18:10'),('598-6637-1233456217891044457','FR','CPO','EUR','2022-02-15 11:22:49'),('598-7720-FR-CPO-TEST-YANIS','FR','CPO','EUR','2022-03-08 08:54:05'),('598-8026-TESTYANIS891044457','FR','CPO','EUR','2022-03-14 15:20:40'),('598-8070-TESTYANIS891044457ECH','FR','CPO','EUR','2022-03-22 10:25:21'),('598-8071-TESTYANIS891044457ECH2','FR','CPO','EUR','2022-03-22 10:32:30'),('598-8080-FR*CPO_1','FR','CPO','EUR','2022-03-23 12:00:47'),('598-8193-FR*CPO_TESTQ8','FR','CPO','EUR','2022-04-12 12:14:30'),('598-9261-FR*CPO_TESTQ12','FR','CPO','EUR','2022-08-18 12:23:34'),('598-9262-FR*CPO_TESTQ13','FR','CPO','EUR','2022-08-18 12:45:17'),('598-9380-FR*CPO_TESTQ43','FR','CPO','EUR','2022-08-24 13:58:57'),('598-9614-FR*CPO-TESTQ8','FR','CPO','EUR','2022-10-06 10:13:22'),('598-9615-FR*SMI*PRIX-TYPE2AC-22K-01-','FR','CPO','EUR','2022-10-06 10:13:31'),('598-9616-FR*SMI*PRIX-TYPE2AC-3K-02-2','FR','CPO','EUR','2022-10-06 10:25:56'),('598-9617-FR*YANIS','FR','CPO','EUR','2022-10-06 10:45:43'),('598-9646-WATTIFY_TEST','FR','CPO','EUR','2022-10-07 12:32:06'),('598-9778-594','FR','CPO','EUR','2022-10-21 12:49:01'),('598-9779-954954','FR','CPO','EUR','2022-10-21 12:49:09'),('598-9780-TAC0000003','FR','CPO','EUR','2022-10-27 06:10:37'),('598-9781-TDC0000003','FR','CPO','EUR','2022-10-27 06:11:00'),('598-9782-TESTTESTTEST','FR','CPO','EUR','2022-10-27 09:51:53'),('598-9783-TESTTHOMASXYANIS','FR','CPO','EUR','2022-10-27 12:17:04'),('598-9784-1','FR','CPO','EUR','2022-10-27 12:30:27'),('598-9785-2','FR','CPO','EUR','2022-10-27 12:30:30'),('598-9786-3','FR','CPO','EUR','2022-10-27 12:30:34'),('598-9787-4','FR','CPO','EUR','2022-10-27 12:30:37');
/*!40000 ALTER TABLE `gireve_tariffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_tokens`
--

DROP TABLE IF EXISTS `gireve_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_tokens` (
  `auth_id` varchar(255) NOT NULL,
  `issuer` varchar(255) NOT NULL,
  `language` varchar(255) DEFAULT NULL,
  `last_updated` datetime(6) NOT NULL,
  `type` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `valid` bit(1) NOT NULL,
  `visual_number` varchar(255) DEFAULT NULL,
  `whitelist` varchar(255) NOT NULL,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_tokens`
--

LOCK TABLES `gireve_tokens` WRITE;
/*!40000 ALTER TABLE `gireve_tokens` DISABLE KEYS */;
INSERT INTO `gireve_tokens` VALUES ('1125F','EFusion','FR','2023-02-21 09:15:44.000000','RFID','1125F',_binary '','1125F','ALLOWED'),('1267S2','EFusion','FR','2023-02-21 09:15:44.000000','RFID','1267S2',_binary '','1267S2','ALLOWED'),('12GT56E32','EFusion','FR','2023-02-21 09:15:44.000000','RFID','12GT56E32',_binary '','12GT56E32','ALLOWED'),('12GT5HG2','EFusion','FR','2023-02-21 09:15:44.000000','RFID','12GT5HG2',_binary '','12GT5HG2','ALLOWED'),('12GT5SD2','EFusion','FR','2023-02-21 09:15:44.000000','RFID','12GT5SD2',_binary '','12GT5SD2','ALLOWED'),('12GTSS2','EFusion','FR','2023-02-21 09:15:44.000000','RFID','12GTSS2',_binary '','12GTSS2','ALLOWED'),('12SD5SD2','EFusion','FR','2023-02-21 09:15:44.000000','RFID','12SD5SD2',_binary '','12SD5SD2','ALLOWED'),('12SS2','EFusion','FR','2023-02-21 09:15:44.000000','RFID','12SS2',_binary '','12SS2','ALLOWED'),('12SSSSS2','EFusion','FR','2023-02-21 09:15:44.000000','RFID','12SSSSS2',_binary '','12SSSSS2','ALLOWED'),('12ZZE32','EFusion','FR','2023-02-21 09:15:44.000000','RFID','12ZZE32',_binary '','12ZZE32','ALLOWED'),('13452E','EFusion','FR','2023-02-21 09:15:44.000000','RFID','13452E',_binary '','13452E','ALLOWED'),('16052E','EFusion','FR','2023-02-21 09:15:44.000000','RFID','16052E',_binary '','16052E','ALLOWED'),('17E38AFE','EFusion','FR','2023-02-21 09:15:43.000000','RFID','17E38AFE',_binary '','17E38AFE','ALLOWED'),('1DG6363','EFusion','FR','2023-02-21 09:15:44.000000','RFID','1DG6363',_binary '','1DG6363','ALLOWED'),('1DG6783','EFusion','FR','2023-02-21 09:15:44.000000','RFID','1DG6783',_binary '','1DG6783','ALLOWED'),('1DH563','EFusion','FR','2023-02-21 09:15:44.000000','RFID','1DH563',_binary '','1DH563','ALLOWED'),('1EF563','EFusion','FR','2023-02-21 09:15:44.000000','RFID','1EF563',_binary '','1EF563','ALLOWED'),('1TSS2','EFusion','FR','2023-02-21 09:15:44.000000','RFID','1TSS2',_binary '','1TSS2','ALLOWED'),('1TSS2SSD','EFusion','FR','2023-02-21 09:15:44.000000','RFID','1TSS2SSD',_binary '','1TSS2SSD','ALLOWED'),('224RE','EFusion','FR','2023-02-21 09:15:44.000000','RFID','224RE',_binary '','224RE','ALLOWED'),('2260T','EFusion','FR','2023-02-21 09:15:44.000000','RFID','2260T',_binary '','2260T','ALLOWED'),('5680563','EFusion','FR','2023-02-21 09:15:44.000000','RFID','5680563',_binary '','5680563','ALLOWED'),('56G6363','EFusion','FR','2023-02-21 09:15:44.000000','RFID','56G6363',_binary '','56G6363','ALLOWED'),('56G6563','EFusion','FR','2023-02-21 09:15:44.000000','RFID','56G6563',_binary '','56G6563','ALLOWED'),('56G6643','EFusion','FR','2023-02-21 09:15:44.000000','RFID','56G6643',_binary '','56G6643','ALLOWED'),('6785F','EFusion','FR','2023-02-21 09:15:44.000000','RFID','6785F',_binary '','6785F','ALLOWED'),('678985F','EFusion','FR','2023-02-21 09:15:44.000000','RFID','678985F',_binary '','678985F','ALLOWED'),('890052E','EFusion','FR','2023-02-21 09:15:44.000000','RFID','890052E',_binary '','890052E','ALLOWED'),('90987T','EFusion','FR','2023-02-21 09:15:44.000000','RFID','90987T',_binary '','90987T','ALLOWED'),('à8G6643','EFusion','FR','2023-02-21 09:15:44.000000','RFID','à8G6643',_binary '','à8G6643','ALLOWED');
/*!40000 ALTER TABLE `gireve_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_version_details`
--

DROP TABLE IF EXISTS `gireve_version_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_version_details` (
  `id` bigint NOT NULL,
  `version` varchar(255) NOT NULL,
  `credentials_country_code` varchar(255) DEFAULT NULL,
  `credentials_party_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7ec5dve4m2vsim73vi27gskei` (`credentials_country_code`,`credentials_party_id`),
  CONSTRAINT `FK7ec5dve4m2vsim73vi27gskei` FOREIGN KEY (`credentials_country_code`, `credentials_party_id`) REFERENCES `gireve_credentials` (`country_code`, `party_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_version_details`
--

LOCK TABLES `gireve_version_details` WRITE;
/*!40000 ALTER TABLE `gireve_version_details` DISABLE KEYS */;
INSERT INTO `gireve_version_details` VALUES (1,'2.1.1','FR','CPO');
/*!40000 ALTER TABLE `gireve_version_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gireve_versions`
--

DROP TABLE IF EXISTS `gireve_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gireve_versions` (
  `id` bigint NOT NULL,
  `url` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `credentials_country_code` varchar(255) DEFAULT NULL,
  `credentials_party_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtcg0ft0nc9nyb994hvh8e2ma3` (`credentials_country_code`,`credentials_party_id`),
  CONSTRAINT `FKtcg0ft0nc9nyb994hvh8e2ma3` FOREIGN KEY (`credentials_country_code`, `credentials_party_id`) REFERENCES `gireve_credentials` (`country_code`, `party_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gireve_versions`
--

LOCK TABLES `gireve_versions` WRITE;
/*!40000 ALTER TABLE `gireve_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `gireve_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (5829);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rfid_identification`
--

DROP TABLE IF EXISTS `rfid_identification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rfid_identification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rfid` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `evcoid` varchar(255) DEFAULT NULL,
  `last_usage_date` datetime DEFAULT NULL,
  `printed_number` varchar(255) DEFAULT NULL,
  `user_pool_id` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7ax9n2mbde0s6vfv5g41j6xt7` (`user_pool_id`,`username`),
  CONSTRAINT `FK7ax9n2mbde0s6vfv5g41j6xt7` FOREIGN KEY (`user_pool_id`, `username`) REFERENCES `user_account` (`user_pool_id`, `username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rfid_identification`
--

LOCK TABLES `rfid_identification` WRITE;
/*!40000 ALTER TABLE `rfid_identification` DISABLE KEYS */;
INSERT INTO `rfid_identification` VALUES (18,'62E783BA','62E783BA','FR*FUS','2022-03-08 00:00:00','62E783BA','eu-west-3_7RRotegEb','148b6a95-0ee7-486a-b9c3-03ff3e2e9b64');
/*!40000 ALTER TABLE `rfid_identification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_tag` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `connector_id` bigint NOT NULL,
  `meter_start` int unsigned NOT NULL,
  `start_stamp` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `meter_stop` int unsigned DEFAULT NULL,
  `reason` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stop_stamp` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,'62E783BA',1,0,'2023-03-01T15:08:31',NULL,NULL,NULL),(2,'62E783BA',1,0,'2023-03-01T15:22:37',12108,NULL,NULL),(3,'62E783BA',1,0,'2023-03-01T15:38:49',NULL,NULL,NULL),(4,'62E783BA',1,111,'2023-03-01T15:48:28',144,'Local','2023-03-01T15:48:34'),(5,'62E783BA',1,0,'2023-03-01T15:51:40',2071575,'Local','2023-03-01T15:52:33'),(6,'62E783BA',1,2071875,'2023-03-01T15:53:03',2083136,'Local','2023-03-01T15:53:59'),(7,'62E783BA',1,0,'2023-03-01T17:46:39',44617,'Local','2023-03-01T17:49:23'),(8,'62E783BA',1,0,'2023-03-03T09:29:40',NULL,NULL,NULL);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tariff_restrictions_day_of_week`
--

DROP TABLE IF EXISTS `tariff_restrictions_day_of_week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tariff_restrictions_day_of_week` (
  `tariff_restrictions_tariff_restriction_id` bigint NOT NULL,
  `day_of_week` int DEFAULT NULL,
  KEY `FKhwnmyhnlr9cg330s2o7m8c4g1` (`tariff_restrictions_tariff_restriction_id`),
  CONSTRAINT `FKhwnmyhnlr9cg330s2o7m8c4g1` FOREIGN KEY (`tariff_restrictions_tariff_restriction_id`) REFERENCES `gireve_tariff_restrictions` (`tariff_restriction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tariff_restrictions_day_of_week`
--

LOCK TABLES `tariff_restrictions_day_of_week` WRITE;
/*!40000 ALTER TABLE `tariff_restrictions_day_of_week` DISABLE KEYS */;
INSERT INTO `tariff_restrictions_day_of_week` VALUES (2303,0),(2303,1),(2303,2),(2303,3),(2303,4),(2306,5),(2306,6),(2309,0),(2309,1),(2309,2),(2309,3),(2309,4),(2312,5),(4127,0),(4127,1),(4127,2),(4127,3),(4127,4),(4127,5),(4127,6),(4130,0),(4130,1),(4130,2),(4130,3),(4130,4),(4130,5),(4130,6),(4133,0),(4133,1),(4133,2),(4133,3),(4133,4),(4133,5),(4133,6),(4307,0),(4307,1),(4307,2),(4307,3),(4307,4),(4307,5),(4307,6),(4310,0),(4310,1),(4310,2),(4310,3),(4310,4),(4310,5),(4310,6),(4313,0),(4313,1),(4313,2),(4313,3),(4313,4),(4313,5),(4313,6),(4487,0),(4487,1),(4487,2),(4487,3),(4487,4),(4487,5),(4487,6),(4490,0),(4490,1),(4490,2),(4490,3),(4490,4),(4490,5),(4490,6),(4493,0),(4493,1),(4493,2),(4493,3),(4493,4),(4493,5),(4493,6),(4667,0),(4667,1),(4667,2),(4667,3),(4667,4),(4667,5),(4667,6),(4670,0),(4670,1),(4670,2),(4670,3),(4670,4),(4670,5),(4670,6),(4673,0),(4673,1),(4673,2),(4673,3),(4673,4),(4673,5),(4673,6),(4847,0),(4847,1),(4847,2),(4847,3),(4847,4),(4847,5),(4847,6),(4850,0),(4850,1),(4850,2),(4850,3),(4850,4),(4850,5),(4850,6),(4853,0),(4853,1),(4853,2),(4853,3),(4853,4),(4853,5),(4853,6),(5027,0),(5027,1),(5027,2),(5027,3),(5027,4),(5027,5),(5027,6),(5030,0),(5030,1),(5030,2),(5030,3),(5030,4),(5030,5),(5030,6),(5033,0),(5033,1),(5033,2),(5033,3),(5033,4),(5033,5),(5033,6),(5189,0),(5189,1),(5189,2),(5189,3),(5189,4),(5189,5),(5189,6),(5192,0),(5192,1),(5192,2),(5192,3),(5192,4),(5192,5),(5192,6),(5195,0),(5195,1),(5195,2),(5195,3),(5195,4),(5195,5),(5195,6),(5333,0),(5333,1),(5333,2),(5333,3),(5333,4),(5333,5),(5333,6),(5336,0),(5336,1),(5336,2),(5336,3),(5336,4),(5336,5),(5336,6),(5339,0),(5339,1),(5339,2),(5339,3),(5339,4),(5339,5),(5339,6),(5459,0),(5459,1),(5459,2),(5459,3),(5459,4),(5459,5),(5459,6),(5462,0),(5462,1),(5462,2),(5462,3),(5462,4),(5462,5),(5462,6),(5465,0),(5465,1),(5465,2),(5465,3),(5465,4),(5465,5),(5465,6),(5567,0),(5567,1),(5567,2),(5567,3),(5567,4),(5567,5),(5567,6),(5570,0),(5570,1),(5570,2),(5570,3),(5570,4),(5570,5),(5570,6),(5573,0),(5573,1),(5573,2),(5573,3),(5573,4),(5573,5),(5573,6),(5657,0),(5657,1),(5657,2),(5657,3),(5657,4),(5657,5),(5657,6),(5660,0),(5660,1),(5660,2),(5660,3),(5660,4),(5660,5),(5660,6),(5663,0),(5663,1),(5663,2),(5663,3),(5663,4),(5663,5),(5663,6),(5729,0),(5729,1),(5729,2),(5729,3),(5729,4),(5729,5),(5729,6),(5732,0),(5732,1),(5732,2),(5732,3),(5732,4),(5732,5),(5732,6),(5735,0),(5735,1),(5735,2),(5735,3),(5735,4),(5735,5),(5735,6),(5783,0),(5783,1),(5783,2),(5783,3),(5783,4),(5783,5),(5783,6),(5786,0),(5786,1),(5786,2),(5786,3),(5786,4),(5786,5),(5786,6),(5789,0),(5789,1),(5789,2),(5789,3),(5789,4),(5789,5),(5789,6),(5819,0),(5819,1),(5819,2),(5819,3),(5819,4),(5819,5),(5819,6),(5822,0),(5822,1),(5822,2),(5822,3),(5822,4),(5822,5),(5822,6),(5825,0),(5825,1),(5825,2),(5825,3),(5825,4),(5825,5),(5825,6);
/*!40000 ALTER TABLE `tariff_restrictions_day_of_week` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_account` (
  `user_pool_id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `current_charge_session_id` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_pool_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES ('eu-west-3_7RRotegEb','148b6a95-0ee7-486a-b9c3-03ff3e2e9b64','1998-08-20',NULL,'ahmedbagh1998@gmail.com',1,'Ahmed','Baghawitah','0769976');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-14  7:03:39
