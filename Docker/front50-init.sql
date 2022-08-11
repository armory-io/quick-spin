-- MySQL dump 10.13  Distrib 5.7.38, for Linux (x86_64)
--
-- Host: localhost    Database: front50
-- ------------------------------------------------------
-- Server version	5.7.38

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
-- Table structure for table `DATABASECHANGELOG`
--

USE front50;

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('create-application-permissions-table','ajordens','classpath:db/changelog/20190415-initial-application-permissions-schema.yml','2022-08-11 12:24:32',1,'EXECUTED','8:eb39c30379b46aa54f2d020b2e2a00c5','createTable tableName=application_permissions','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-application-permissions-history-table','ajordens','classpath:db/changelog/20190415-initial-application-permissions-schema.yml','2022-08-11 12:24:32',2,'EXECUTED','8:903ea8bac0e3c1291ab739a4c56d5564','createTable tableName=application_permissions_history','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-applications-table','ajordens','classpath:db/changelog/20190415-initial-applications-schema.yml','2022-08-11 12:24:32',3,'EXECUTED','8:4d56bb2d648a3f77cbb077a992f3aaf8','createTable tableName=applications','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-applications-history-table','ajordens','classpath:db/changelog/20190415-initial-applications-schema.yml','2022-08-11 12:24:32',4,'EXECUTED','8:44aeb412cfe9de650a6446e1cd7039fd','createTable tableName=applications_history','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-deliveries-table','ajordens','classpath:db/changelog/20190415-initial-deliveries-schema.yml','2022-08-11 12:24:32',5,'EXECUTED','8:a2137731fedec29fe35f8003e1ef6988','createTable tableName=deliveries','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-deliveries-history-table','ajordens','classpath:db/changelog/20190415-initial-deliveries-schema.yml','2022-08-11 12:24:32',6,'EXECUTED','8:9ab44f1ac57151e6c2462a044f85098a','createTable tableName=deliveries_history','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-entity-tags-table','ajordens','classpath:db/changelog/20190415-initial-entity-tags-schema.yml','2022-08-11 12:24:32',7,'EXECUTED','8:a6d48c589ea63424e1551893f74d9ce8','createTable tableName=entity_tags','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-notifications-table','ajordens','classpath:db/changelog/20190415-initial-notifications-schema.yml','2022-08-11 12:24:33',8,'EXECUTED','8:8a6e878bd168b08797953b60491723e6','createTable tableName=notifications','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-notifications-history-table','ajordens','classpath:db/changelog/20190415-initial-notifications-schema.yml','2022-08-11 12:24:33',9,'EXECUTED','8:4ac6d70ebb19a78bad11bacc2f53db7c','createTable tableName=notifications_history','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-pipeline-strategies-table','ajordens','classpath:db/changelog/20190415-initial-pipeline-strategies-schema.yml','2022-08-11 12:24:33',10,'EXECUTED','8:785fb1675468806bc0a10fa52e5fe0ab','createTable tableName=pipeline_strategies','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-pipeline-strategies-history-table','ajordens','classpath:db/changelog/20190415-initial-pipeline-strategies-schema.yml','2022-08-11 12:24:33',11,'EXECUTED','8:bc43cc7a7af7757ad20dae4e229c86ef','createTable tableName=pipeline_strategies_history','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-pipeline-templates-table','ajordens','classpath:db/changelog/20190415-initial-pipeline-templates-schema.yml','2022-08-11 12:24:33',12,'EXECUTED','8:66c33eafbec85ab326598490059de481','createTable tableName=pipeline_templates','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-pipeline-templates-history-table','ajordens','classpath:db/changelog/20190415-initial-pipeline-templates-schema.yml','2022-08-11 12:24:33',13,'EXECUTED','8:46e01f986e07e045564734addcef13d5','createTable tableName=pipeline_templates_history','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-pipelines-table','ajordens','classpath:db/changelog/20190415-initial-pipelines-schema.yml','2022-08-11 12:24:33',14,'EXECUTED','8:a6341a1c5e26aa510c73c282bb4b4215','createTable tableName=pipelines','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-pipelines-history-table','ajordens','classpath:db/changelog/20190415-initial-pipelines-schema.yml','2022-08-11 12:24:33',15,'EXECUTED','8:d7ea5f88c9ac94bfbb22e3db221d3d17','createTable tableName=pipelines_history','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-projects-table','ajordens','classpath:db/changelog/20190415-initial-projects-schema.yml','2022-08-11 12:24:33',16,'EXECUTED','8:5af18d3099e265d02b15a586035f0247','createTable tableName=projects','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-projects-history-table','ajordens','classpath:db/changelog/20190415-initial-projects-schema.yml','2022-08-11 12:24:33',17,'EXECUTED','8:62ec625fa7e65134c5aa39643b07e04d','createTable tableName=projects_history','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-service-accounts-table','ajordens','classpath:db/changelog/20190415-initial-service-accounts-schema.yml','2022-08-11 12:24:33',18,'EXECUTED','8:31aba0cb64c5dd749a5168badf92bd47','createTable tableName=service_accounts','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-service-accounts-history-table','ajordens','classpath:db/changelog/20190415-initial-service-accounts-schema.yml','2022-08-11 12:24:33',19,'EXECUTED','8:89cbcc2fd15a424cc76a6b727de5c6eb','createTable tableName=service_accounts_history','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-snapshots-table','ajordens','classpath:db/changelog/20190415-initial-snapshots-schema.yml','2022-08-11 12:24:33',20,'EXECUTED','8:c15c14722cc57148f198954c5dda0436','createTable tableName=snapshots','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-indexes','ajordens','classpath:db/changelog/20190530-add-is-deleted-indexes.yml','2022-08-11 12:24:33',21,'EXECUTED','8:00fb76fd56ce5e27d8299634a5a0b753','createIndex indexName=is_deleted_idx, tableName=applications; createIndex indexName=is_deleted_idx, tableName=application_permissions; createIndex indexName=is_deleted_idx, tableName=deliveries; createIndex indexName=is_deleted_idx, tableName=enti...','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-plugin-artifacts-table','robzienert','classpath:db/changelog/20191213-initial-plugin-artifacts-schema.yml','2022-08-11 12:24:33',22,'EXECUTED','8:ed51336bdd7edb125156a3cefd2d47ff','createTable tableName=plugin_artifacts','',NULL,'3.8.7',NULL,NULL,'0220672743'),('rename-plugin-artifacts-to-plugin-info','jonsie','classpath:db/changelog/20200113-rename-plugin-artifacts-to-plugin-info.yml','2022-08-11 12:24:33',23,'EXECUTED','8:ad29694bb434a70ec9754542cce4908b','renameTable newTableName=plugin_info, oldTableName=plugin_artifacts','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-plugin-versions-table','robzienert','classpath:db/changelog/20200428-initial-plugin-versions-schema.yml','2022-08-11 12:24:33',24,'EXECUTED','8:7ef19c8ada92473ba526ae590e1373a3','createTable tableName=plugin_versions','',NULL,'3.8.7',NULL,NULL,'0220672743'),('plugin-versions-is-deleted-index','rzienert','classpath:db/changelog/20200428-initial-plugin-versions-schema.yml','2022-08-11 12:24:33',25,'EXECUTED','8:3e995818c5d5add259d3e7b5734d70a8','createIndex indexName=is_deleted_plugin_versions_idx, tableName=plugin_versions','',NULL,'3.8.7',NULL,NULL,'0220672743'),('create-healthcheck-table','robzienert','classpath:db/healthcheck.yml','2022-08-11 12:24:33',26,'EXECUTED','8:4cf9e4b79f88b3c0ecd4fe3d8bb37877','createTable tableName=healthcheck','',NULL,'3.8.7',NULL,NULL,'0220673664');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_permissions`
--

DROP TABLE IF EXISTS `application_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_permissions` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `last_modified_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `is_deleted_idx` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_permissions`
--

LOCK TABLES `application_permissions` WRITE;
/*!40000 ALTER TABLE `application_permissions` DISABLE KEYS */;
INSERT INTO `application_permissions` VALUES ('tt','{\"name\":\"tt\",\"lastModified\":1660221125068,\"lastModifiedBy\":\"anonymous\",\"permissions\":{}}',1660221125068,1660221125068,'anonymous',_binary '\0');
/*!40000 ALTER TABLE `application_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_permissions_history`
--

DROP TABLE IF EXISTS `application_permissions_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_permissions_history` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_sig` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `recorded_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`body_sig`,`last_modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_permissions_history`
--

LOCK TABLES `application_permissions_history` WRITE;
/*!40000 ALTER TABLE `application_permissions_history` DISABLE KEYS */;
INSERT INTO `application_permissions_history` VALUES ('tt','{\"name\":\"tt\",\"lastModified\":1660221125068,\"lastModifiedBy\":\"anonymous\",\"permissions\":{}}','519f7aedf13c53f7a792685937cdd0ea',1660221125068,1660221125078);
/*!40000 ALTER TABLE `application_permissions_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `last_modified_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `is_deleted_idx` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES ('tt','{\"name\":\"TT\",\"description\":\"enteradescription\",\"email\":\"chris.kotula@armory.io\",\"updateTs\":\"1660221124923\",\"createTs\":null,\"lastModifiedBy\":\"anonymous\",\"cloudProviders\":\"kubernetes\",\"trafficGuards\":[],\"instancePort\":80,\"repoSlug\":\"projectname\",\"repoType\":\"github\",\"repoProjectKey\":\"projectname\",\"user\":\"[anonymous]\"}',1660221124923,1660221124923,'anonymous',_binary '\0');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications_history`
--

DROP TABLE IF EXISTS `applications_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications_history` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_sig` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `recorded_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`body_sig`,`last_modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications_history`
--

LOCK TABLES `applications_history` WRITE;
/*!40000 ALTER TABLE `applications_history` DISABLE KEYS */;
INSERT INTO `applications_history` VALUES ('tt','{\"name\":\"TT\",\"description\":\"enteradescription\",\"email\":\"chris.kotula@armory.io\",\"updateTs\":\"1660221124923\",\"createTs\":null,\"lastModifiedBy\":\"anonymous\",\"cloudProviders\":\"kubernetes\",\"trafficGuards\":[],\"instancePort\":80,\"repoSlug\":\"projectname\",\"repoType\":\"github\",\"repoProjectKey\":\"projectname\",\"user\":\"[anonymous]\"}','40170cb343ac30b0fff20405c1d1f61d',1660221124923,1660221124964);
/*!40000 ALTER TABLE `applications_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveries` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `application` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `last_modified_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `is_deleted_idx` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries_history`
--

DROP TABLE IF EXISTS `deliveries_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveries_history` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_sig` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `recorded_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`body_sig`,`last_modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries_history`
--

LOCK TABLES `deliveries_history` WRITE;
/*!40000 ALTER TABLE `deliveries_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliveries_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_tags`
--

DROP TABLE IF EXISTS `entity_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_tags` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `last_modified_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `is_deleted_idx` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_tags`
--

LOCK TABLES `entity_tags` WRITE;
/*!40000 ALTER TABLE `entity_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `healthcheck`
--

DROP TABLE IF EXISTS `healthcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `healthcheck` (
  `id` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthcheck`
--

LOCK TABLES `healthcheck` WRITE;
/*!40000 ALTER TABLE `healthcheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `healthcheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `last_modified_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `is_deleted_idx` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_history`
--

DROP TABLE IF EXISTS `notifications_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications_history` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_sig` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `recorded_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`body_sig`,`last_modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_history`
--

LOCK TABLES `notifications_history` WRITE;
/*!40000 ALTER TABLE `notifications_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipeline_strategies`
--

DROP TABLE IF EXISTS `pipeline_strategies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipeline_strategies` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `application` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `last_modified_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `is_deleted_idx` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipeline_strategies`
--

LOCK TABLES `pipeline_strategies` WRITE;
/*!40000 ALTER TABLE `pipeline_strategies` DISABLE KEYS */;
/*!40000 ALTER TABLE `pipeline_strategies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipeline_strategies_history`
--

DROP TABLE IF EXISTS `pipeline_strategies_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipeline_strategies_history` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_sig` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `recorded_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`body_sig`,`last_modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipeline_strategies_history`
--

LOCK TABLES `pipeline_strategies_history` WRITE;
/*!40000 ALTER TABLE `pipeline_strategies_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `pipeline_strategies_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipeline_templates`
--

DROP TABLE IF EXISTS `pipeline_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipeline_templates` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `last_modified_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `is_deleted_idx` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipeline_templates`
--

LOCK TABLES `pipeline_templates` WRITE;
/*!40000 ALTER TABLE `pipeline_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `pipeline_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipeline_templates_history`
--

DROP TABLE IF EXISTS `pipeline_templates_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipeline_templates_history` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_sig` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `recorded_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`body_sig`,`last_modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipeline_templates_history`
--

LOCK TABLES `pipeline_templates_history` WRITE;
/*!40000 ALTER TABLE `pipeline_templates_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `pipeline_templates_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipelines`
--

DROP TABLE IF EXISTS `pipelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipelines` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `application` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `last_modified_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `is_deleted_idx` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipelines`
--

LOCK TABLES `pipelines` WRITE;
/*!40000 ALTER TABLE `pipelines` DISABLE KEYS */;
INSERT INTO `pipelines` VALUES ('fd19d3a3-4c36-4709-a019-44b195bfd03b','dfs','tt','{\"id\":\"fd19d3a3-4c36-4709-a019-44b195bfd03b\",\"name\":\"dfs\",\"application\":\"tt\",\"schema\":\"1\",\"triggers\":[],\"index\":0,\"lastModifiedBy\":\"anonymous\",\"stages\":[{\"failOnFailedExpressions\":true,\"name\":\"Evaluate Variables\",\"refId\":\"1\",\"requisiteStageRefIds\":[],\"type\":\"evaluateVariables\",\"variables\":[{\"key\":\"TEST\",\"value\":\"TEST_VALUE\"}]}],\"keepWaitingPipelines\":false,\"limitConcurrent\":true,\"spelEvaluator\":\"v4\"}',1660221154285,1660221201334,'anonymous',_binary '\0');
/*!40000 ALTER TABLE `pipelines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pipelines_history`
--

DROP TABLE IF EXISTS `pipelines_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipelines_history` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_sig` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `recorded_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`body_sig`,`last_modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pipelines_history`
--

LOCK TABLES `pipelines_history` WRITE;
/*!40000 ALTER TABLE `pipelines_history` DISABLE KEYS */;
INSERT INTO `pipelines_history` VALUES ('fd19d3a3-4c36-4709-a019-44b195bfd03b','{\"id\":\"fd19d3a3-4c36-4709-a019-44b195bfd03b\",\"name\":\"dfs\",\"application\":\"tt\",\"schema\":\"1\",\"triggers\":[],\"index\":0,\"lastModifiedBy\":\"anonymous\",\"stages\":[],\"keepWaitingPipelines\":false,\"limitConcurrent\":true,\"spelEvaluator\":\"v4\"}','7ed7e0f44f3ffecddaad5b7f4c3ce9cb',1660221154285,1660221154294),('fd19d3a3-4c36-4709-a019-44b195bfd03b','{\"id\":\"fd19d3a3-4c36-4709-a019-44b195bfd03b\",\"name\":\"dfs\",\"application\":\"tt\",\"schema\":\"1\",\"triggers\":[],\"index\":0,\"lastModifiedBy\":\"anonymous\",\"stages\":[{\"failOnFailedExpressions\":true,\"name\":\"Evaluate Variables\",\"refId\":\"1\",\"requisiteStageRefIds\":[],\"type\":\"evaluateVariables\",\"variables\":[{\"key\":\"TEST\",\"value\":\"TEST_VALUE\"}]}],\"keepWaitingPipelines\":false,\"limitConcurrent\":true,\"spelEvaluator\":\"v4\"}','89f84a3a0ea1fa7feb306460f2a59027',1660221201334,1660221201341);
/*!40000 ALTER TABLE `pipelines_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_info`
--

DROP TABLE IF EXISTS `plugin_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_info` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `last_modified_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_info`
--

LOCK TABLES `plugin_info` WRITE;
/*!40000 ALTER TABLE `plugin_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_versions`
--

DROP TABLE IF EXISTS `plugin_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_versions` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `last_modified_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `is_deleted_plugin_versions_idx` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_versions`
--

LOCK TABLES `plugin_versions` WRITE;
/*!40000 ALTER TABLE `plugin_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `last_modified_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `is_deleted_idx` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_history`
--

DROP TABLE IF EXISTS `projects_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_history` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_sig` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `recorded_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`body_sig`,`last_modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_history`
--

LOCK TABLES `projects_history` WRITE;
/*!40000 ALTER TABLE `projects_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_accounts`
--

DROP TABLE IF EXISTS `service_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_accounts` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `last_modified_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `is_deleted_idx` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_accounts`
--

LOCK TABLES `service_accounts` WRITE;
/*!40000 ALTER TABLE `service_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_accounts_history`
--

DROP TABLE IF EXISTS `service_accounts_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_accounts_history` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_sig` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `recorded_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`body_sig`,`last_modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_accounts_history`
--

LOCK TABLES `service_accounts_history` WRITE;
/*!40000 ALTER TABLE `service_accounts_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_accounts_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snapshots`
--

DROP TABLE IF EXISTS `snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snapshots` (
  `id` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_modified_at` bigint(20) NOT NULL,
  `last_modified_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `is_deleted_idx` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snapshots`
--

LOCK TABLES `snapshots` WRITE;
/*!40000 ALTER TABLE `snapshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `snapshots` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-11 13:26:51
