-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: dev.timecard.ru
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `absence`
--

DROP TABLE IF EXISTS `absence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `absence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `absence_type_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `comment` varchar(1024) NOT NULL DEFAULT '',
  `request_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sow_id` (`company_id`),
  KEY `absence_type_id` (`absence_type_id`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  CONSTRAINT `absence_ibfk_2` FOREIGN KEY (`absence_type_id`) REFERENCES `absence_types` (`id`),
  CONSTRAINT `absence_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `absence_types`
--

DROP TABLE IF EXISTS `absence_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `absence_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `action_category`
--

DROP TABLE IF EXISTS `action_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `title_male` varchar(256) NOT NULL,
  `title_female` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `action_types`
--

DROP TABLE IF EXISTS `action_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryID` int(3) NOT NULL,
  `title` varchar(256) NOT NULL,
  `title_male` varchar(256) NOT NULL,
  `title_female` varchar(256) NOT NULL,
  `isShowFeed` int(1) NOT NULL,
  `isShowNotification` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryID` (`categoryID`),
  KEY `title` (`title`),
  KEY `isShowNotification` (`isShowNotification`),
  KEY `isShowFeed` (`isShowFeed`),
  CONSTRAINT `action_types_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `action_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activators`
--

DROP TABLE IF EXISTS `activators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activators` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `user` varchar(64) NOT NULL DEFAULT '',
  `type` enum('regNewUser','password_recovery') NOT NULL,
  `date` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `airfare_limits_by_direction`
--

DROP TABLE IF EXISTS `airfare_limits_by_direction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airfare_limits_by_direction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `limit` int(11) NOT NULL,
  `agency_company_id` int(11) NOT NULL,
  `creator_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `from` (`from`),
  KEY `to` (`to`),
  KEY `owner_agency_id` (`agency_company_id`),
  KEY `eventTimestamp` (`eventTimestamp`),
  KEY `creator_user_id` (`creator_user_id`),
  CONSTRAINT `airfare_limits_by_direction_ibfk_1` FOREIGN KEY (`from`) REFERENCES `airport_countries` (`id`),
  CONSTRAINT `airfare_limits_by_direction_ibfk_2` FOREIGN KEY (`to`) REFERENCES `airport_countries` (`id`),
  CONSTRAINT `airfare_limits_by_direction_ibfk_3` FOREIGN KEY (`agency_company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `airfare_limits_by_direction_ibfk_4` FOREIGN KEY (`creator_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `airline_bookings`
--

DROP TABLE IF EXISTS `airline_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airline_bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_sow_id` int(11) NOT NULL,
  `search_id` varchar(64) NOT NULL,
  `search_trip_id` varchar(64) NOT NULL,
  `search_fare_id` varchar(64) NOT NULL,
  `passport_type` enum('foreign_passport','domestic_passport') NOT NULL DEFAULT 'foreign_passport',
  `trip_id` varchar(64) NOT NULL DEFAULT '',
  `destination` varchar(64) NOT NULL DEFAULT '',
  `checkin` varchar(64) NOT NULL DEFAULT '',
  `checkout` varchar(64) NOT NULL DEFAULT '',
  `amount` float NOT NULL DEFAULT '0',
  `book_date` varchar(64) NOT NULL DEFAULT '',
  `status` enum('done','pending','failed') NOT NULL DEFAULT 'pending',
  `voucher_filename` varchar(64) NOT NULL DEFAULT '',
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `search_id` (`search_id`),
  KEY `trip_id` (`search_trip_id`),
  KEY `fare_id` (`search_fare_id`),
  KEY `contract_sow_id` (`contract_sow_id`),
  CONSTRAINT `airline_bookings_ibfk_2` FOREIGN KEY (`contract_sow_id`) REFERENCES `contracts_sow` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `airlines`
--

DROP TABLE IF EXISTS `airlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airlines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(2) NOT NULL,
  `description_rus` varchar(128) NOT NULL DEFAULT '',
  `description_eng` varchar(128) NOT NULL,
  `country` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iata_code` (`code`),
  UNIQUE KEY `description_eng_2` (`description_eng`),
  KEY `description_rus` (`description_rus`),
  KEY `description_eng` (`description_eng`)
) ENGINE=InnoDB AUTO_INCREMENT=12735 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `airport_countries`
--

DROP TABLE IF EXISTS `airport_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airport_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `abbrev` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_2` (`title`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(64) NOT NULL,
  `airport_code` varchar(8) NOT NULL,
  `airport_name` varchar(64) NOT NULL,
  `airport_country_id` int(11) NOT NULL,
  `world_area_code` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `airport_code` (`airport_code`),
  KEY `city_name` (`city_name`),
  KEY `airport_name` (`airport_name`),
  KEY `world_area_code` (`world_area_code`),
  KEY `airport_country_id` (`airport_country_id`),
  CONSTRAINT `airports_ibfk_1` FOREIGN KEY (`airport_country_id`) REFERENCES `airport_countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9524 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `airports_view`
--

DROP TABLE IF EXISTS `airports_view`;
/*!50001 DROP VIEW IF EXISTS `airports_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `airports_view` AS SELECT 
 1 AS `id`,
 1 AS `city_name`,
 1 AS `airport_code`,
 1 AS `airport_name`,
 1 AS `world_area_code`,
 1 AS `country_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `bik` varchar(16) NOT NULL,
  `account` varchar(64) NOT NULL,
  `geo_zip_id` int(11) DEFAULT '29817',
  `address` varchar(256) NOT NULL DEFAULT '',
  `phone` varchar(256) NOT NULL DEFAULT '',
  `okato` varchar(16) NOT NULL DEFAULT '',
  `okpo` varchar(16) NOT NULL DEFAULT '',
  `regnum` varchar(16) NOT NULL DEFAULT '',
  `srok` varchar(16) NOT NULL DEFAULT '' COMMENT 'dokuments handling period',
  PRIMARY KEY (`id`),
  KEY `bik` (`bik`),
  KEY `geo_zip_id` (`geo_zip_id`),
  CONSTRAINT `banks_ibfk_1` FOREIGN KEY (`geo_zip_id`) REFERENCES `geo_zip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1884 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bt`
--

DROP TABLE IF EXISTS `bt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_sow_id` int(11) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `place` varchar(256) NOT NULL,
  `purpose` varchar(256) NOT NULL,
  `status` enum('saved','submit','approved','pending_approve','rejected') NOT NULL DEFAULT 'saved',
  `submit_date` int(11) NOT NULL DEFAULT '0',
  `approve_date` int(11) NOT NULL DEFAULT '0',
  `payed_date` int(11) NOT NULL DEFAULT '0',
  `expected_pay_date` int(11) NOT NULL DEFAULT '0',
  `originals_received_date` int(11) NOT NULL DEFAULT '0',
  `invoice_filename` varchar(128) NOT NULL DEFAULT '',
  `invoice_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sow_id` (`contract_sow_id`),
  KEY `date_start` (`date_start`),
  KEY `date_end` (`date_end`),
  KEY `customer_id` (`customer_id`),
  KEY `payed_date` (`payed_date`),
  KEY `expected_pay_date` (`expected_pay_date`),
  KEY `originals_received_date` (`originals_received_date`),
  KEY `status` (`status`),
  KEY `act_id` (`invoice_id`),
  CONSTRAINT `bt_ibfk_1` FOREIGN KEY (`contract_sow_id`) REFERENCES `contracts_sow` (`id`),
  CONSTRAINT `bt_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `timecard_customers` (`id`),
  CONSTRAINT `bt_ibfk_3` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bt_allowance`
--

DROP TABLE IF EXISTS `bt_allowance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bt_allowance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_company_id` int(11) NOT NULL,
  `geo_country_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agency_company_id` (`agency_company_id`),
  KEY `country` (`geo_country_id`),
  CONSTRAINT `bt_allowance_ibfk_1` FOREIGN KEY (`agency_company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `bt_allowance_ibfk_2` FOREIGN KEY (`geo_country_id`) REFERENCES `geo_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bt_approvals`
--

DROP TABLE IF EXISTS `bt_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bt_approvals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bt_id` int(11) NOT NULL,
  `approver_id` int(11) NOT NULL,
  `decision` enum('approved','rejected','pending','submit') NOT NULL DEFAULT 'pending',
  `comment` varchar(512) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timecard_id` (`bt_id`),
  KEY `approver_id` (`approver_id`),
  KEY `decision` (`decision`),
  KEY `eventTimestamp` (`eventTimestamp`),
  CONSTRAINT `bt_approvals_ibfk_1` FOREIGN KEY (`bt_id`) REFERENCES `bt` (`id`),
  CONSTRAINT `bt_approvals_ibfk_2` FOREIGN KEY (`approver_id`) REFERENCES `bt_approvers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `bt_approvals_view`
--

DROP TABLE IF EXISTS `bt_approvals_view`;
/*!50001 DROP VIEW IF EXISTS `bt_approvals_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bt_approvals_view` AS SELECT 
 1 AS `bt_approvers_id`,
 1 AS `bt_approvals_eventTimestamp`,
 1 AS `bt_approvals_bt_id`,
 1 AS `bt_approvers_approver_order`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bt_approvers`
--

DROP TABLE IF EXISTS `bt_approvers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bt_approvers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approver_user_id` int(11) NOT NULL,
  `contract_psow_id` int(11) NOT NULL,
  `approver_order` int(11) NOT NULL,
  `auto_approve` enum('Y','N') NOT NULL DEFAULT 'N',
  `type` enum('service','business travel') NOT NULL DEFAULT 'business travel',
  `rate` enum('subcontractor','agency') NOT NULL DEFAULT 'subcontractor',
  PRIMARY KEY (`id`),
  KEY `approver_user_id` (`approver_user_id`),
  KEY `approver_order` (`approver_order`),
  KEY `contract_psow_id` (`contract_psow_id`),
  CONSTRAINT `bt_approvers_ibfk_1` FOREIGN KEY (`approver_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `bt_approvers_ibfk_3` FOREIGN KEY (`contract_psow_id`) REFERENCES `contracts_psow` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bt_approvers_backup`
--

DROP TABLE IF EXISTS `bt_approvers_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bt_approvers_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approver_user_id` int(11) NOT NULL,
  `contract_psow_id` int(11) NOT NULL,
  `contract_sow_id` int(11) NOT NULL COMMENT 'must be replaced to contract_psow_id',
  `approver_order` int(11) NOT NULL,
  `auto_approve` enum('Y','N') NOT NULL DEFAULT 'N',
  `type` enum('service','business travel') NOT NULL DEFAULT 'business travel',
  `rate` enum('subcontractor','agency') NOT NULL DEFAULT 'subcontractor',
  PRIMARY KEY (`id`),
  KEY `approver_user_id` (`approver_user_id`),
  KEY `contract_sow_id` (`contract_sow_id`),
  KEY `approver_order` (`approver_order`),
  KEY `contract_psow_id` (`contract_psow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `bt_download_attachments_view`
--

DROP TABLE IF EXISTS `bt_download_attachments_view`;
/*!50001 DROP VIEW IF EXISTS `bt_download_attachments_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bt_download_attachments_view` AS SELECT 
 1 AS `id`,
 1 AS `bt_id`,
 1 AS `date`,
 1 AS `bt_expense_id`,
 1 AS `value`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bt_expense_item_docs`
--

DROP TABLE IF EXISTS `bt_expense_item_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bt_expense_item_docs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bt_expense_item_id` int(11) NOT NULL,
  `type` enum('image','input','allowance') NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` varchar(512) NOT NULL DEFAULT '',
  `tooltip` varchar(256) NOT NULL DEFAULT '',
  `payment` enum('cash','card','cash and card') NOT NULL DEFAULT 'cash',
  `required` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  KEY `bt_expense_item_id` (`bt_expense_item_id`),
  KEY `type` (`type`),
  KEY `payment` (`payment`),
  KEY `required` (`required`),
  CONSTRAINT `bt_expense_item_docs_ibfk_1` FOREIGN KEY (`bt_expense_item_id`) REFERENCES `bt_expense_items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bt_expense_items`
--

DROP TABLE IF EXISTS `bt_expense_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bt_expense_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `agency_comment` varchar(64) NOT NULL,
  `is_default` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `is_default` (`is_default`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bt_expense_line_templates`
--

DROP TABLE IF EXISTS `bt_expense_line_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bt_expense_line_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bt_expense_template_id` int(11) NOT NULL,
  `dom_type` enum('image','input','allowance') NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` varchar(512) NOT NULL DEFAULT '',
  `tooltip` varchar(256) NOT NULL DEFAULT '',
  `payment` enum('cash','card','cash and card') NOT NULL DEFAULT 'cash',
  `required` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  KEY `bt_expense_item_id` (`bt_expense_template_id`),
  KEY `type` (`dom_type`),
  KEY `payment` (`payment`),
  KEY `required` (`required`),
  CONSTRAINT `bt_expense_line_templates_ibfk_1` FOREIGN KEY (`bt_expense_template_id`) REFERENCES `bt_expense_templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bt_expense_lines`
--

DROP TABLE IF EXISTS `bt_expense_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bt_expense_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bt_expense_id` int(11) NOT NULL,
  `bt_expense_line_template_id` int(11) NOT NULL,
  `value` varchar(256) NOT NULL,
  `comment` varchar(256) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bt_expense_id` (`bt_expense_id`),
  KEY `bt_expenses_item_id` (`bt_expense_line_template_id`),
  CONSTRAINT `bt_expense_lines_ibfk_1` FOREIGN KEY (`bt_expense_id`) REFERENCES `bt_expenses` (`id`),
  CONSTRAINT `bt_expense_lines_ibfk_2` FOREIGN KEY (`bt_expense_line_template_id`) REFERENCES `bt_expense_line_templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bt_expense_templates`
--

DROP TABLE IF EXISTS `bt_expense_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bt_expense_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `agency_company_id` int(11) NOT NULL,
  `agency_comment` varchar(64) NOT NULL,
  `is_default` enum('Y','N') NOT NULL DEFAULT 'N',
  `taxable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `eventTimestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_default` (`is_default`) USING BTREE,
  KEY `agency_company_id` (`agency_company_id`),
  CONSTRAINT `bt_expense_templates_ibfk_1` FOREIGN KEY (`agency_company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bt_expenses`
--

DROP TABLE IF EXISTS `bt_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bt_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bt_id` int(11) NOT NULL,
  `bt_expense_template_id` int(11) NOT NULL,
  `comment` varchar(256) NOT NULL,
  `date` date NOT NULL,
  `payment_type` enum('cash','card') NOT NULL,
  `price_foreign` varchar(32) NOT NULL DEFAULT '0',
  `price_domestic` varchar(32) NOT NULL DEFAULT '0',
  `currency_nominal` int(11) NOT NULL DEFAULT '0',
  `currency_name` varchar(64) NOT NULL DEFAULT '',
  `currency_value` float NOT NULL DEFAULT '0',
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bt_id` (`bt_id`),
  KEY `bt_expense_item_id` (`bt_expense_template_id`),
  CONSTRAINT `bt_expenses_ibfk_1` FOREIGN KEY (`bt_id`) REFERENCES `bt` (`id`),
  CONSTRAINT `bt_expenses_ibfk_2` FOREIGN KEY (`bt_expense_template_id`) REFERENCES `bt_expense_templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bt_sow`
--

DROP TABLE IF EXISTS `bt_sow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bt_sow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sow_id` int(11) NOT NULL,
  `bt_expense_template_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sow_id` (`sow_id`),
  KEY `bt_expence_item_id` (`bt_expense_template_id`),
  CONSTRAINT `bt_sow_ibfk_1` FOREIGN KEY (`sow_id`) REFERENCES `contracts_sow` (`id`),
  CONSTRAINT `bt_sow_ibfk_2` FOREIGN KEY (`bt_expense_template_id`) REFERENCES `bt_expense_templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bt_sow_assignment`
--

DROP TABLE IF EXISTS `bt_sow_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bt_sow_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sow_id` int(11) NOT NULL,
  `bt_expense_template_id` int(11) NOT NULL,
  `assignee_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sow_id` (`sow_id`),
  KEY `bt_expence_item_id` (`bt_expense_template_id`),
  KEY `assignee_user_id` (`assignee_user_id`),
  CONSTRAINT `bt_sow_assignment_ibfk_1` FOREIGN KEY (`sow_id`) REFERENCES `contracts_sow` (`id`),
  CONSTRAINT `bt_sow_assignment_ibfk_2` FOREIGN KEY (`bt_expense_template_id`) REFERENCES `bt_expense_templates` (`id`),
  CONSTRAINT `bt_sow_assignment_ibfk_3` FOREIGN KEY (`assignee_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `captcha`
--

DROP TABLE IF EXISTS `captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `session` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `id_3` (`id`),
  KEY `id_4` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_contact_list`
--

DROP TABLE IF EXISTS `chat_contact_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_contact_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userID` int(10) NOT NULL,
  `friendID` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`),
  KEY `friendID` (`friendID`),
  CONSTRAINT `chat_contact_list_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  CONSTRAINT `chat_contact_list_ibfk_2` FOREIGN KEY (`friendID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_messages`
--

DROP TABLE IF EXISTS `chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `messageType` enum('text','image') NOT NULL DEFAULT 'text',
  `fromType` enum('fromUser','fromCompany') NOT NULL,
  `fromID` int(11) NOT NULL,
  `toType` enum('toUser','toCompany','toGroup','Broadcast') NOT NULL,
  `toID` int(11) NOT NULL,
  `messageStatus` enum('unread','read','unread_const','delivered','sent') NOT NULL,
  `eventTimestamp` datetime NOT NULL,
  `secondsSinceY2k` bigint(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fromType` (`fromType`),
  KEY `fromID` (`fromID`),
  KEY `toType` (`toType`),
  KEY `toID` (`toID`),
  KEY `messageStatus` (`messageStatus`),
  KEY `secondsSinceY2k` (`secondsSinceY2k`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('agency','partner','subcontractor','cost_center') NOT NULL,
  `name` varchar(256) NOT NULL,
  `legal_geo_zip_id` int(11) NOT NULL,
  `legal_address` varchar(256) NOT NULL,
  `mailing_geo_zip_id` int(11) NOT NULL,
  `mailing_address` varchar(256) NOT NULL,
  `tin` varchar(64) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `account` varchar(64) NOT NULL,
  `kpp` varchar(64) NOT NULL,
  `ogrn` varchar(64) NOT NULL,
  `vat` enum('Y','N') NOT NULL DEFAULT 'N',
  `vat_calculation_type` enum('sum_by_row','percentage') NOT NULL DEFAULT 'sum_by_row',
  `link` varchar(32) NOT NULL DEFAULT '',
  `admin_userID` int(11) NOT NULL DEFAULT '0',
  `act_number_prefix` varchar(16) NOT NULL DEFAULT '',
  `act_number` int(11) NOT NULL DEFAULT '1',
  `act_number_postfix` varchar(16) NOT NULL DEFAULT '',
  `act_number_unique` enum('true','false') NOT NULL DEFAULT 'false',
  `isConfirmed` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'Company owning confirmed with documents',
  `foundationDate` varchar(15) NOT NULL DEFAULT '01/01/2000' COMMENT 'date format: dd/mm/yyyy',
  `numberOfEmployee` int(11) NOT NULL DEFAULT '0',
  `webSite` varchar(254) NOT NULL DEFAULT '',
  `description` varchar(16384) NOT NULL DEFAULT '',
  `isBlocked` enum('Y','N') NOT NULL DEFAULT 'N',
  `logo_folder` varchar(16) NOT NULL DEFAULT '',
  `logo_filename` varchar(32) NOT NULL DEFAULT '',
  `ownerChangeCounter` int(11) NOT NULL DEFAULT '0',
  `lastActivity` int(11) NOT NULL DEFAULT '0' COMMENT 'If no activities for a long time, user may not be active or cyber-squatter. Reset company ownership to 0',
  `eventTimestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tin` (`tin`) USING BTREE,
  KEY `name` (`name`),
  KEY `owner_userID` (`admin_userID`),
  KEY `isBlocked` (`isBlocked`),
  KEY `lastActivity` (`lastActivity`),
  KEY `link` (`link`),
  KEY `geo_zip_id` (`legal_geo_zip_id`),
  KEY `bank_id` (`bank_id`),
  KEY `mailing_geo_zip_id` (`mailing_geo_zip_id`),
  KEY `type` (`type`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`legal_geo_zip_id`) REFERENCES `geo_zip` (`id`),
  CONSTRAINT `company_ibfk_2` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`),
  CONSTRAINT `company_ibfk_3` FOREIGN KEY (`admin_userID`) REFERENCES `users` (`id`),
  CONSTRAINT `company_ibfk_4` FOREIGN KEY (`mailing_geo_zip_id`) REFERENCES `geo_zip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_agreement_files`
--

DROP TABLE IF EXISTS `company_agreement_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_agreement_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL COMMENT 'title visible to user',
  `filename` varchar(1024) NOT NULL DEFAULT '',
  `owner_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner_user_id` (`owner_user_id`),
  KEY `company_id` (`company_id`) USING BTREE,
  KEY `title` (`title`),
  CONSTRAINT `company_agreement_files_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `company_agreement_files_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_candidates`
--

DROP TABLE IF EXISTS `company_candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_candidates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer1` enum('1','2','3') NOT NULL,
  `answer2` enum('1','2','3') NOT NULL,
  `answer3` enum('1','2','3') NOT NULL,
  `language1` enum('Y','N','') NOT NULL DEFAULT '',
  `language2` enum('Y','N','') NOT NULL DEFAULT '',
  `language3` enum('Y','N','') NOT NULL DEFAULT '',
  `skill1` enum('Y','N','') NOT NULL DEFAULT '',
  `skill2` enum('Y','N','') NOT NULL DEFAULT '',
  `skill3` enum('Y','N','') NOT NULL DEFAULT '',
  `description` varchar(1024) NOT NULL DEFAULT '',
  `status` enum('applied','rejected') NOT NULL DEFAULT 'applied' COMMENT 'if add more statuses, investigate sort in user_profile.',
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vacancy_id` (`vacancy_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_custom_fields`
--

DROP TABLE IF EXISTS `company_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `var_name` varchar(64) NOT NULL COMMENT 'ID uses in templates',
  `title` varchar(64) NOT NULL COMMENT 'title visible to user',
  `description` varchar(64) NOT NULL DEFAULT '',
  `type` enum('input','file') NOT NULL DEFAULT 'input',
  `value` varchar(1024) NOT NULL DEFAULT '',
  `visible_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N',
  `editable_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N',
  `owner_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_id_var_name` (`company_id`,`var_name`) USING BTREE,
  KEY `title` (`var_name`),
  KEY `owner_user_id` (`owner_user_id`),
  KEY `visible_by_subcontractor` (`visible_by_subcontractor`),
  KEY `editable_by_subcontractor` (`editable_by_subcontractor`),
  KEY `company_id` (`company_id`) USING BTREE,
  CONSTRAINT `company_custom_fields_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `company_custom_fields_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_employees`
--

DROP TABLE IF EXISTS `company_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'employee',
  `company_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL DEFAULT '1',
  `allowed_change_agency_data` enum('Y','N') NOT NULL DEFAULT 'N',
  `allowed_change_sow` enum('Y','N') NOT NULL DEFAULT 'N',
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`) USING BTREE,
  KEY `company_id` (`company_id`),
  KEY `position_id` (`position_id`),
  CONSTRAINT `company_employees_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `company_employees_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `company_employees_ibfk_3` FOREIGN KEY (`position_id`) REFERENCES `company_position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_founder`
--

DROP TABLE IF EXISTS `company_founder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_founder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyID` int(11) NOT NULL,
  `founder_name` varchar(256) NOT NULL DEFAULT '',
  `founder_userID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `companyID` (`companyID`),
  KEY `owner_userID` (`founder_userID`),
  KEY `founder_name` (`founder_name`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_industry`
--

DROP TABLE IF EXISTS `company_industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_industry_ref`
--

DROP TABLE IF EXISTS `company_industry_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_industry_ref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `profile_id` (`profile_id`),
  CONSTRAINT `company_industry_ref_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `company_industry_ref_ibfk_2` FOREIGN KEY (`profile_id`) REFERENCES `company_industry_ref` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_owner`
--

DROP TABLE IF EXISTS `company_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyID` int(11) NOT NULL,
  `owner_name` varchar(256) NOT NULL DEFAULT '',
  `owner_userID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `companyID` (`companyID`),
  KEY `owner_userID` (`owner_userID`),
  KEY `owner_name` (`owner_name`),
  KEY `companyID_2` (`companyID`),
  CONSTRAINT `company_owner_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_posession_request`
--

DROP TABLE IF EXISTS `company_posession_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_posession_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requested_company_id` int(11) NOT NULL,
  `requester_user_id` int(11) NOT NULL,
  `status` enum('requested','approved','rejected') NOT NULL,
  `description` varchar(1024) NOT NULL DEFAULT '',
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `requested_company_id` (`requested_company_id`),
  KEY `requester_user_id` (`requester_user_id`),
  KEY `eventTimestamp` (`eventTimestamp`),
  CONSTRAINT `company_posession_request_ibfk_1` FOREIGN KEY (`requested_company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `company_posession_request_ibfk_2` FOREIGN KEY (`requester_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_position`
--

DROP TABLE IF EXISTS `company_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `area` varchar(256) NOT NULL DEFAULT '',
  `local_service_description` varchar(256) NOT NULL DEFAULT '',
  `remote_service_description` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=15264 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_questions`
--

DROP TABLE IF EXISTS `company_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `set_id` int(11) NOT NULL,
  `question` varchar(256) NOT NULL,
  `answer1` varchar(256) NOT NULL,
  `answer2` varchar(256) NOT NULL,
  `answer3` varchar(256) NOT NULL,
  `correct_answer` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `set_id` (`set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_vacancy`
--

DROP TABLE IF EXISTS `company_vacancy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_vacancy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `company_position_id` int(11) NOT NULL,
  `geo_locality_id` int(11) NOT NULL,
  `salary_min` int(11) NOT NULL DEFAULT '0',
  `salary_max` int(11) NOT NULL DEFAULT '0',
  `start_month` int(2) NOT NULL,
  `work_format` enum('fte','pte','remote','entrepreneur') NOT NULL DEFAULT 'fte',
  `description` varchar(16384) NOT NULL DEFAULT '',
  `question1` varchar(256) NOT NULL DEFAULT '',
  `answer11` varchar(256) NOT NULL DEFAULT '',
  `answer12` varchar(256) NOT NULL DEFAULT '',
  `answer13` varchar(256) NOT NULL DEFAULT '',
  `correct_answer1` int(11) NOT NULL DEFAULT '0',
  `question2` varchar(256) NOT NULL DEFAULT '',
  `answer21` varchar(256) NOT NULL DEFAULT '',
  `answer22` varchar(256) NOT NULL DEFAULT '',
  `answer23` varchar(256) NOT NULL DEFAULT '',
  `correct_answer2` int(11) NOT NULL DEFAULT '0',
  `question3` varchar(256) NOT NULL DEFAULT '',
  `answer31` varchar(256) NOT NULL DEFAULT '',
  `answer32` varchar(256) NOT NULL DEFAULT '',
  `answer33` varchar(256) NOT NULL DEFAULT '',
  `correct_answer3` int(11) NOT NULL DEFAULT '0',
  `language1_id` int(11) NOT NULL DEFAULT '0',
  `language2_id` int(11) NOT NULL DEFAULT '0',
  `language3_id` int(11) NOT NULL DEFAULT '0',
  `skill1_id` int(11) NOT NULL DEFAULT '0',
  `skill2_id` int(11) NOT NULL DEFAULT '0',
  `skill3_id` int(11) NOT NULL DEFAULT '0',
  `publish_finish` date NOT NULL DEFAULT '2000-01-01',
  `publish_period` enum('suspend','week','month') NOT NULL DEFAULT 'suspend',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `company_position_id` (`company_position_id`),
  KEY `geo_locality_id` (`geo_locality_id`),
  KEY `publish_start` (`publish_finish`),
  CONSTRAINT `company_vacancy_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `company_vacancy_ibfk_2` FOREIGN KEY (`company_position_id`) REFERENCES `company_position` (`id`),
  CONSTRAINT `company_vacancy_ibfk_3` FOREIGN KEY (`geo_locality_id`) REFERENCES `geo_locality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_psow_custom_fields`
--

DROP TABLE IF EXISTS `contract_psow_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_psow_custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_psow_id` int(11) NOT NULL,
  `var_name` varchar(64) NOT NULL COMMENT 'ID uses in templates',
  `title` varchar(64) NOT NULL COMMENT 'title visible to user',
  `description` varchar(64) NOT NULL DEFAULT '',
  `type` enum('input','file') NOT NULL DEFAULT 'input',
  `value` varchar(1024) NOT NULL DEFAULT '',
  `visible_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'PSoW not visible by subc  (not valid)',
  `editable_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'PSoW not visible by subc  (not valid)',
  `owner_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `contract_psow_id` (`contract_psow_id`,`var_name`),
  KEY `sow_id` (`contract_psow_id`),
  KEY `title` (`var_name`),
  KEY `owner_user_id` (`owner_user_id`),
  KEY `visible_by_subcontractor` (`visible_by_subcontractor`),
  KEY `editable_by_subcontractor` (`editable_by_subcontractor`),
  CONSTRAINT `contract_psow_custom_fields_ibfk_1` FOREIGN KEY (`contract_psow_id`) REFERENCES `contracts_psow` (`id`),
  CONSTRAINT `contract_psow_custom_fields_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_sow_agreement_files`
--

DROP TABLE IF EXISTS `contract_sow_agreement_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_sow_agreement_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_sow_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL COMMENT 'title visible to user',
  `filename` varchar(1024) NOT NULL DEFAULT '',
  `owner_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner_user_id` (`owner_user_id`),
  KEY `contract_sow_id` (`contract_sow_id`),
  KEY `title` (`title`),
  CONSTRAINT `contract_sow_agreement_files_ibfk_1` FOREIGN KEY (`contract_sow_id`) REFERENCES `contracts_sow` (`id`),
  CONSTRAINT `contract_sow_agreement_files_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_sow_custom_fields`
--

DROP TABLE IF EXISTS `contract_sow_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_sow_custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_sow_id` int(11) NOT NULL,
  `var_name` varchar(64) NOT NULL COMMENT 'ID uses in templates',
  `title` varchar(64) NOT NULL COMMENT 'title visible to user',
  `description` varchar(64) NOT NULL DEFAULT '',
  `type` enum('input','file') NOT NULL DEFAULT 'input',
  `value` varchar(1024) NOT NULL DEFAULT '',
  `visible_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N',
  `editable_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N',
  `owner_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `contract_sow_id` (`contract_sow_id`,`var_name`) USING BTREE,
  KEY `sow_id` (`contract_sow_id`),
  KEY `title` (`var_name`),
  KEY `owner_user_id` (`owner_user_id`),
  KEY `visible_by_subcontractor` (`visible_by_subcontractor`),
  KEY `editable_by_subcontractor` (`editable_by_subcontractor`),
  CONSTRAINT `contract_sow_custom_fields_ibfk_1` FOREIGN KEY (`contract_sow_id`) REFERENCES `contracts_sow` (`id`),
  CONSTRAINT `contract_sow_custom_fields_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contracts_psow`
--

DROP TABLE IF EXISTS `contracts_psow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracts_psow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_sow_id` int(11) NOT NULL,
  `cost_center_id` int(11) NOT NULL,
  `company_position_id` int(11) NOT NULL,
  `start_date` date NOT NULL DEFAULT '2000-01-01',
  `end_date` date NOT NULL DEFAULT '2000-01-01',
  `number` varchar(128) NOT NULL DEFAULT '',
  `sign_date` date NOT NULL DEFAULT '2000-01-01',
  `day_rate` double NOT NULL DEFAULT '0',
  `working_hours_per_day` double NOT NULL DEFAULT '8',
  `bt_markup` double NOT NULL DEFAULT '0',
  `bt_markup_type` enum('percent','fix') NOT NULL DEFAULT 'percent',
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `company_position_id` (`company_position_id`),
  KEY `contract_sow_id` (`contract_sow_id`),
  KEY `cost_center_id` (`cost_center_id`),
  CONSTRAINT `contracts_psow_ibfk_1` FOREIGN KEY (`contract_sow_id`) REFERENCES `contracts_sow` (`id`),
  CONSTRAINT `contracts_psow_ibfk_2` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  CONSTRAINT `contracts_psow_ibfk_3` FOREIGN KEY (`company_position_id`) REFERENCES `company_position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contracts_sow`
--

DROP TABLE IF EXISTS `contracts_sow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracts_sow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subcontractor_company_id` int(11) NOT NULL,
  `agency_company_id` int(11) NOT NULL,
  `company_position_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `number` varchar(128) NOT NULL,
  `sign_date` date NOT NULL,
  `timecard_period` enum('month','week') NOT NULL,
  `subcontractor_create_tasks` enum('Y','N') NOT NULL DEFAULT 'N',
  `day_rate` double NOT NULL DEFAULT '0' COMMENT 'day_rate_to_subcontractor',
  `working_hours_per_day` double NOT NULL DEFAULT '8',
  `status` enum('accepted_by_subc','signed','negotiating','expired') NOT NULL DEFAULT 'negotiating',
  `agreement_filename` varchar(128) NOT NULL DEFAULT '',
  `payment_period_service` int(11) NOT NULL DEFAULT '30' COMMENT 'in days',
  `payment_period_bt` int(11) NOT NULL DEFAULT '30' COMMENT 'in days',
  `recall_by_agency` enum('Y','N') NOT NULL DEFAULT 'Y',
  `recall_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N',
  `creator_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`subcontractor_company_id`),
  KEY `agency_id` (`agency_company_id`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `company_position_id` (`company_position_id`),
  KEY `creator_user_id` (`creator_user_id`),
  KEY `status` (`status`),
  CONSTRAINT `contracts_sow_ibfk_1` FOREIGN KEY (`subcontractor_company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `contracts_sow_ibfk_2` FOREIGN KEY (`agency_company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `contracts_sow_ibfk_3` FOREIGN KEY (`company_position_id`) REFERENCES `company_position` (`id`),
  CONSTRAINT `contracts_sow_ibfk_4` FOREIGN KEY (`creator_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cost_center_assignment`
--

DROP TABLE IF EXISTS `cost_center_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_center_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost_center_id` int(11) NOT NULL,
  `timecard_customer_id` int(11) NOT NULL,
  `assignee_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cost_center_id` (`cost_center_id`),
  KEY `timecard_customer_id` (`timecard_customer_id`),
  KEY `assignee_user_id` (`assignee_user_id`),
  CONSTRAINT `cost_center_assignment_ibfk_1` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  CONSTRAINT `cost_center_assignment_ibfk_2` FOREIGN KEY (`timecard_customer_id`) REFERENCES `timecard_customers` (`id`),
  CONSTRAINT `cost_center_assignment_ibfk_3` FOREIGN KEY (`assignee_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cost_center_custom_fields`
--

DROP TABLE IF EXISTS `cost_center_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_center_custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost_center_id` int(11) NOT NULL,
  `var_name` varchar(64) NOT NULL COMMENT 'ID uses in templates',
  `title` varchar(64) NOT NULL COMMENT 'title visible to user',
  `description` varchar(64) NOT NULL DEFAULT '',
  `type` enum('input','file') NOT NULL DEFAULT 'input',
  `value` varchar(1024) NOT NULL DEFAULT '',
  `visible_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N',
  `editable_by_subcontractor` enum('Y','N') NOT NULL DEFAULT 'N',
  `owner_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cost_center_id_2` (`cost_center_id`,`var_name`),
  KEY `title` (`var_name`),
  KEY `owner_user_id` (`owner_user_id`),
  KEY `visible_by_subcontractor` (`visible_by_subcontractor`),
  KEY `editable_by_subcontractor` (`editable_by_subcontractor`),
  KEY `cost_center_id` (`cost_center_id`),
  CONSTRAINT `cost_center_custom_fields_ibfk_1` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  CONSTRAINT `cost_center_custom_fields_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cost_centers`
--

DROP TABLE IF EXISTS `cost_centers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_centers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT 'optional field, use company.name instead',
  `description` varchar(256) NOT NULL DEFAULT '',
  `agency_company_id` int(11) NOT NULL,
  `start_date` date NOT NULL DEFAULT '2000-01-01',
  `end_date` date NOT NULL DEFAULT '2000-01-01',
  `number` varchar(128) NOT NULL DEFAULT '',
  `sign_date` date NOT NULL DEFAULT '2000-01-01',
  `assignee_user_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `agency_company_id` (`agency_company_id`),
  KEY `assignee_user_id` (`assignee_user_id`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `sign_date` (`sign_date`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `cost_centers_ibfk_1` FOREIGN KEY (`agency_company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `cost_centers_ibfk_2` FOREIGN KEY (`assignee_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `cost_centers_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_rate`
--

DROP TABLE IF EXISTS `currency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `num_code` int(11) NOT NULL,
  `char_code` varchar(8) NOT NULL,
  `nominal` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `num_code` (`num_code`),
  KEY `char_code` (`char_code`),
  KEY `nominal` (`nominal`),
  KEY `name` (`name`),
  KEY `value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=6701 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `demo_requests`
--

DROP TABLE IF EXISTS `demo_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dictionary_adverse`
--

DROP TABLE IF EXISTS `dictionary_adverse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dictionary_adverse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_change_tokens`
--

DROP TABLE IF EXISTS `email_change_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_change_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `new_email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventTimestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exception`
--

DROP TABLE IF EXISTS `exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exception` (
  `identifier` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(100) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `template` varchar(100) NOT NULL DEFAULT '',
  `lng` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`identifier`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` enum('subcontractor','helpdesk','agency','approver','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed`
--

DROP TABLE IF EXISTS `feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(4) NOT NULL DEFAULT '',
  `srcType` enum('user','company','group') NOT NULL DEFAULT 'user',
  `userId` int(11) NOT NULL COMMENT 'srcID (something producing action)',
  `dstType` enum('user','company','group','') NOT NULL DEFAULT '',
  `dstID` int(11) NOT NULL DEFAULT '0',
  `actionTypeId` int(11) NOT NULL COMMENT 'Action type',
  `actionId` int(11) NOT NULL DEFAULT '0' COMMENT 'Additional data',
  `eventTimestamp` datetime NOT NULL COMMENT 'format YYYY-MM-DD HH:MM:SS',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `eventTimestamp` (`eventTimestamp`),
  KEY `actionTypeId` (`actionTypeId`),
  KEY `actionId` (`actionId`),
  KEY `srcType` (`srcType`),
  KEY `dstType` (`dstType`),
  KEY `dstID` (`dstID`)
) ENGINE=InnoDB AUTO_INCREMENT=8162 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_images`
--

DROP TABLE IF EXISTS `feed_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setID` int(11) NOT NULL DEFAULT '0',
  `srcType` enum('user','company','group') NOT NULL DEFAULT 'user',
  `userID` int(10) NOT NULL,
  `folder` varchar(32) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mediaType` enum('image','video','youtube_video') NOT NULL DEFAULT 'image',
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `tempSet` int(9) NOT NULL,
  `removeFlag` enum('keep','remove') NOT NULL DEFAULT 'keep',
  `exifDateTime` varchar(64) NOT NULL DEFAULT '',
  `exifGPSAltitude` varchar(64) NOT NULL DEFAULT '',
  `exifGPSLatitude` varchar(64) NOT NULL DEFAULT '',
  `exifGPSLongitude` varchar(64) NOT NULL DEFAULT '',
  `exifGPSSpeed` varchar(64) NOT NULL DEFAULT '',
  `exifModel` varchar(64) NOT NULL DEFAULT '',
  `exifAuthors` varchar(64) NOT NULL DEFAULT '',
  `exifApertureValue` varchar(64) NOT NULL DEFAULT '',
  `exifBrightnessValue` varchar(64) NOT NULL DEFAULT '',
  `exifColorSpace` varchar(64) NOT NULL DEFAULT '',
  `exifComponentsConfiguration` varchar(64) NOT NULL DEFAULT '',
  `exifCompression` varchar(64) NOT NULL DEFAULT '',
  `exifDateTimeDigitized` varchar(64) NOT NULL DEFAULT '',
  `exifDateTimeOriginal` varchar(64) NOT NULL DEFAULT '',
  `exifExifImageLength` varchar(64) NOT NULL DEFAULT '',
  `exifExifImageWidth` varchar(64) NOT NULL DEFAULT '',
  `exifExifOffset` varchar(64) NOT NULL DEFAULT '',
  `exifExifVersion` varchar(64) NOT NULL DEFAULT '',
  `exifExposureBiasValue` varchar(64) NOT NULL DEFAULT '',
  `exifExposureMode` varchar(64) NOT NULL DEFAULT '',
  `exifExposureProgram` varchar(64) NOT NULL DEFAULT '',
  `exifExposureTime` varchar(64) NOT NULL DEFAULT '',
  `exifFlash` varchar(64) NOT NULL DEFAULT '',
  `exifFlashPixVersion` varchar(64) NOT NULL DEFAULT '',
  `exifFNumber` varchar(64) NOT NULL DEFAULT '',
  `exifFocalLength` varchar(64) NOT NULL DEFAULT '',
  `exifFocalLengthIn35mmFilm` varchar(64) NOT NULL DEFAULT '',
  `exifGPSDateStamp` varchar(64) NOT NULL DEFAULT '',
  `exifGPSDestBearing` varchar(64) NOT NULL DEFAULT '',
  `exifGPSDestBearingRef` varchar(64) NOT NULL DEFAULT '',
  `exifGPSImgDirection` varchar(64) NOT NULL DEFAULT '',
  `exifGPSImgDirectionRef` varchar(64) NOT NULL DEFAULT '',
  `exifGPSInfo` varchar(64) NOT NULL DEFAULT '',
  `exifGPSTimeStamp` varchar(64) NOT NULL DEFAULT '',
  `exifISOSpeedRatings` varchar(64) NOT NULL DEFAULT '',
  `exifJPEGInterchangeFormat` varchar(64) NOT NULL DEFAULT '',
  `exifJPEGInterchangeFormatLength` varchar(64) NOT NULL DEFAULT '',
  `exifMake` varchar(64) NOT NULL DEFAULT '',
  `exifMeteringMode` varchar(64) NOT NULL DEFAULT '',
  `exifOrientation` varchar(64) NOT NULL DEFAULT '',
  `exifResolutionUnit` varchar(64) NOT NULL DEFAULT '',
  `exifSceneCaptureType` varchar(64) NOT NULL DEFAULT '',
  `exifSceneType` varchar(64) NOT NULL DEFAULT '',
  `exifSensingMethod` varchar(64) NOT NULL DEFAULT '',
  `exifShutterSpeedValue` varchar(64) NOT NULL DEFAULT '',
  `exifSoftware` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exifSubjectArea` varchar(64) NOT NULL DEFAULT '',
  `exifSubSecTimeDigitized` varchar(64) NOT NULL DEFAULT '',
  `exifSubSecTimeOriginal` varchar(64) NOT NULL DEFAULT '',
  `exifWhiteBalance` varchar(64) NOT NULL DEFAULT '',
  `exifXResolution` varchar(64) NOT NULL DEFAULT '',
  `exifYCbCrPositioning` varchar(64) NOT NULL DEFAULT '',
  `exifYResolution` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`),
  KEY `tempSet` (`tempSet`),
  KEY `setID` (`setID`),
  KEY `srcType` (`srcType`)
) ENGINE=InnoDB AUTO_INCREMENT=1455 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_message`
--

DROP TABLE IF EXISTS `feed_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1024) NOT NULL,
  `link` varchar(1024) NOT NULL,
  `message` text NOT NULL,
  `imageSetID` int(11) NOT NULL,
  `access` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `imageSetID` (`imageSetID`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8 COMMENT='ATTENTION ! "Table truncation" must be implemented with care';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_message_comment`
--

DROP TABLE IF EXISTS `feed_message_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_message_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `type` enum('message','book','certification','university','course','language','school','company') NOT NULL DEFAULT 'message',
  `comment` text NOT NULL,
  `eventTimestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `messageID` (`messageID`),
  KEY `userID` (`userID`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_message_params`
--

DROP TABLE IF EXISTS `feed_message_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_message_params` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parameter` enum('like','spam','likeBook','likeCertification','likeUniversityDegree','likeCourse','likeLanguage','likeSchool','likeCompany') NOT NULL,
  `messageID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `messageID` (`messageID`),
  KEY `userID` (`userID`),
  KEY `parameter` (`parameter`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geo_country`
--

DROP TABLE IF EXISTS `geo_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geo_locality`
--

DROP TABLE IF EXISTS `geo_locality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_locality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_region_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(128) NOT NULL,
  `population` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `geo_region_id` (`geo_region_id`),
  CONSTRAINT `geo_locality_ibfk_1` FOREIGN KEY (`geo_region_id`) REFERENCES `geo_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29821 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geo_locality_unknown`
--

DROP TABLE IF EXISTS `geo_locality_unknown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_locality_unknown` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locality` varchar(256) NOT NULL,
  `eventTimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `locality` (`locality`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `geo_locality_view`
--

DROP TABLE IF EXISTS `geo_locality_view`;
/*!50001 DROP VIEW IF EXISTS `geo_locality_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `geo_locality_view` AS SELECT 
 1 AS `geo_locality_id`,
 1 AS `geo_locality_title`,
 1 AS `geo_region_id`,
 1 AS `geo_region_title`,
 1 AS `geo_country_id`,
 1 AS `geo_country_title`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `geo_region`
--

DROP TABLE IF EXISTS `geo_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_country_id` int(11) NOT NULL DEFAULT '7',
  `title` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `geo_country_id` (`geo_country_id`),
  CONSTRAINT `geo_region_ibfk_1` FOREIGN KEY (`geo_country_id`) REFERENCES `geo_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=787 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geo_zip`
--

DROP TABLE IF EXISTS `geo_zip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_zip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zip` varchar(16) NOT NULL,
  `geo_locality_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `zip` (`zip`),
  KEY `geo_locality_id` (`geo_locality_id`) USING BTREE,
  CONSTRAINT `geo_zip_ibfk_1` FOREIGN KEY (`geo_locality_id`) REFERENCES `geo_locality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44993 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(64) NOT NULL DEFAULT '' COMMENT 'name in web-link',
  `title` varchar(64) NOT NULL COMMENT 'human readable title',
  `description` varchar(1024) NOT NULL DEFAULT '',
  `logo_folder` varchar(32) NOT NULL DEFAULT '',
  `logo_filename` varchar(32) NOT NULL DEFAULT '',
  `owner_id` int(11) NOT NULL,
  `isBlocked` enum('N','Y') NOT NULL DEFAULT 'N',
  `eventTimestampCreation` int(11) NOT NULL,
  `eventTimestampLastPost` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`),
  KEY `owner_id` (`owner_id`),
  KEY `isBlocked` (`isBlocked`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpdesk_ticket_attaches`
--

DROP TABLE IF EXISTS `helpdesk_ticket_attaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdesk_ticket_attaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `helpdesk_ticket_history_id` int(11) NOT NULL,
  `filename` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `helpdesk_ticket_history_id` (`helpdesk_ticket_history_id`),
  CONSTRAINT `helpdesk_ticket_attaches_ibfk_1` FOREIGN KEY (`helpdesk_ticket_history_id`) REFERENCES `helpdesk_ticket_history` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpdesk_ticket_history`
--

DROP TABLE IF EXISTS `helpdesk_ticket_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdesk_ticket_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `helpdesk_ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `severity` int(11) NOT NULL,
  `state` enum('new','customer_pending','company_pending','assigned','solution_provided','monitoring','close_pending','closed','severity_changed','change_company_user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `helpdesk_ticket_id` (`helpdesk_ticket_id`),
  KEY `state` (`state`),
  KEY `eventTimestamp` (`eventTimestamp`),
  KEY `company_user_id` (`user_id`),
  KEY `severity` (`severity`),
  CONSTRAINT `helpdesk_ticket_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `helpdesk_ticket_history_ibfk_2` FOREIGN KEY (`helpdesk_ticket_id`) REFERENCES `helpdesk_tickets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `helpdesk_ticket_history_helpdesk_users_view`
--

DROP TABLE IF EXISTS `helpdesk_ticket_history_helpdesk_users_view`;
/*!50001 DROP VIEW IF EXISTS `helpdesk_ticket_history_helpdesk_users_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `helpdesk_ticket_history_helpdesk_users_view` AS SELECT 
 1 AS `id`,
 1 AS `helpdesk_ticket_id`,
 1 AS `user_id`,
 1 AS `severity`,
 1 AS `state`,
 1 AS `description`,
 1 AS `eventTimestamp`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `helpdesk_ticket_history_last_case_state_view`
--

DROP TABLE IF EXISTS `helpdesk_ticket_history_last_case_state_view`;
/*!50001 DROP VIEW IF EXISTS `helpdesk_ticket_history_last_case_state_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `helpdesk_ticket_history_last_case_state_view` AS SELECT 
 1 AS `id`,
 1 AS `helpdesk_ticket_id`,
 1 AS `user_id`,
 1 AS `severity`,
 1 AS `state`,
 1 AS `description`,
 1 AS `eventTimestamp`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `helpdesk_ticket_history_last_helpdesk_user_update_view`
--

DROP TABLE IF EXISTS `helpdesk_ticket_history_last_helpdesk_user_update_view`;
/*!50001 DROP VIEW IF EXISTS `helpdesk_ticket_history_last_helpdesk_user_update_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `helpdesk_ticket_history_last_helpdesk_user_update_view` AS SELECT 
 1 AS `id`,
 1 AS `helpdesk_ticket_id`,
 1 AS `user_id`,
 1 AS `severity`,
 1 AS `state`,
 1 AS `description`,
 1 AS `eventTimestamp`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `helpdesk_tickets`
--

DROP TABLE IF EXISTS `helpdesk_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdesk_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `opener_user_id` (`customer_user_id`),
  CONSTRAINT `helpdesk_tickets_ibfk_1` FOREIGN KEY (`customer_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=438814 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holiday_calendar`
--

DROP TABLE IF EXISTS `holiday_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_company_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `type` enum('full','partial') NOT NULL DEFAULT 'full',
  `title` varchar(64) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `agency_company_id` (`agency_company_id`),
  CONSTRAINT `holiday_calendar_ibfk_1` FOREIGN KEY (`agency_company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hotel_chains`
--

DROP TABLE IF EXISTS `hotel_chains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_chains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL,
  `description_rus` varchar(128) NOT NULL DEFAULT '',
  `description_eng` varchar(128) NOT NULL,
  `country` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iata_code` (`code`),
  UNIQUE KEY `description_eng_2` (`description_eng`),
  KEY `description_rus` (`description_rus`),
  KEY `description_eng` (`description_eng`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_cost_center_bt`
--

DROP TABLE IF EXISTS `invoice_cost_center_bt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_cost_center_bt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost_center_id` int(11) NOT NULL,
  `file` varchar(256) NOT NULL COMMENT 'archive with all files enclosed',
  `owner_user_id` int(11) NOT NULL,
  `owner_company_id` int(11) NOT NULL COMMENT 'use it only to check that invoce belongs to company',
  `invoice_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner_user_id` (`owner_user_id`),
  KEY `cost_center_id` (`cost_center_id`),
  KEY `owner_company_id` (`owner_company_id`),
  KEY `act_id` (`invoice_id`),
  CONSTRAINT `invoice_cost_center_bt_ibfk_1` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  CONSTRAINT `invoice_cost_center_bt_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `invoice_cost_center_bt_ibfk_3` FOREIGN KEY (`owner_company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `invoice_cost_center_bt_ibfk_4` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_cost_center_bt_details`
--

DROP TABLE IF EXISTS `invoice_cost_center_bt_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_cost_center_bt_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_cost_center_bt_id` int(11) NOT NULL,
  `bt_id` int(11) NOT NULL,
  `cc_amount_pre_tax` double NOT NULL DEFAULT '0',
  `cc_amount_tax` double NOT NULL DEFAULT '0',
  `cc_amount_total` double NOT NULL DEFAULT '0',
  `subc_amount_pre_tax` double NOT NULL DEFAULT '0',
  `subc_amount_tax` double NOT NULL DEFAULT '0',
  `subc_amount_total` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `invoice_cost_center_bt_id` (`invoice_cost_center_bt_id`),
  KEY `bt_id` (`bt_id`),
  CONSTRAINT `invoice_cost_center_bt_details_ibfk_1` FOREIGN KEY (`invoice_cost_center_bt_id`) REFERENCES `invoice_cost_center_bt` (`id`),
  CONSTRAINT `invoice_cost_center_bt_details_ibfk_2` FOREIGN KEY (`bt_id`) REFERENCES `bt` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_cost_center_service`
--

DROP TABLE IF EXISTS `invoice_cost_center_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_cost_center_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost_center_id` int(11) NOT NULL,
  `file` varchar(256) NOT NULL COMMENT 'archive with all files enclosed',
  `owner_user_id` int(11) NOT NULL,
  `owner_company_id` int(11) NOT NULL COMMENT 'use it only to check that invoce belongs to company',
  `invoice_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner_user_id` (`owner_user_id`),
  KEY `cost_center_id` (`cost_center_id`),
  KEY `owner_company_id` (`owner_company_id`),
  KEY `act_id` (`invoice_id`),
  CONSTRAINT `invoice_cost_center_service_ibfk_2` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `invoice_cost_center_service_ibfk_3` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  CONSTRAINT `invoice_cost_center_service_ibfk_4` FOREIGN KEY (`owner_company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `invoice_cost_center_service_ibfk_5` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_cost_center_service_details`
--

DROP TABLE IF EXISTS `invoice_cost_center_service_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_cost_center_service_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_cost_center_service_id` int(11) NOT NULL,
  `timecard_id` int(11) NOT NULL,
  `cc_amount_pre_tax` double NOT NULL DEFAULT '0',
  `cc_amount_tax` double NOT NULL DEFAULT '0',
  `cc_amount_total` double NOT NULL DEFAULT '0',
  `subc_amount_pre_tax` double NOT NULL DEFAULT '0',
  `subc_amount_tax` double NOT NULL DEFAULT '0',
  `subc_amount_total` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `contract_sow_id` (`timecard_id`),
  KEY `invoice_cost_center_service_id` (`invoice_cost_center_service_id`),
  CONSTRAINT `invoice_cost_center_service_details_ibfk_2` FOREIGN KEY (`timecard_id`) REFERENCES `timecards` (`id`),
  CONSTRAINT `invoice_cost_center_service_details_ibfk_3` FOREIGN KEY (`invoice_cost_center_service_id`) REFERENCES `invoice_cost_center_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_number` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `eventTimestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `full_number` (`full_number`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(512) NOT NULL,
  `logo_folder` varchar(16) NOT NULL DEFAULT '',
  `logo_filename` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `name_sex`
--

DROP TABLE IF EXISTS `name_sex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `name_sex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `sex` enum('male','female') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `sex` (`sex`)
) ENGINE=InnoDB AUTO_INCREMENT=753 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password_dictionary_adjectives`
--

DROP TABLE IF EXISTS `password_dictionary_adjectives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_dictionary_adjectives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password_dictionary_characteristics`
--

DROP TABLE IF EXISTS `password_dictionary_characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_dictionary_characteristics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=738 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password_dictionary_nouns`
--

DROP TABLE IF EXISTS `password_dictionary_nouns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_dictionary_nouns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1383 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phone_confirmation`
--

DROP TABLE IF EXISTS `phone_confirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_confirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(64) NOT NULL,
  `confirmation_code` varchar(8) NOT NULL,
  `country_code` varchar(8) NOT NULL DEFAULT '',
  `phone_number` varchar(32) NOT NULL DEFAULT '',
  `attempt` int(11) NOT NULL DEFAULT '0',
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session` (`session`),
  KEY `confirmation_code` (`confirmation_code`),
  KEY `eventTimestamp` (`eventTimestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `railroads`
--

DROP TABLE IF EXISTS `railroads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `railroads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL,
  `description_rus` varchar(128) NOT NULL DEFAULT '',
  `description_eng` varchar(128) NOT NULL,
  `country` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iata_code` (`code`),
  UNIQUE KEY `description_eng_2` (`description_eng`),
  KEY `description_rus` (`description_rus`),
  KEY `description_eng` (`description_eng`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(128) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '24',
  `country_auto` varchar(128) NOT NULL DEFAULT '',
  `city_auto` varchar(128) NOT NULL DEFAULT '',
  `lng` varchar(4) NOT NULL DEFAULT '',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `http_user_agent` varchar(512) NOT NULL DEFAULT '',
  `expire` int(11) NOT NULL DEFAULT '3600' COMMENT 'session duration in seconds',
  `remove_flag` enum('N','Y','pending') NOT NULL DEFAULT 'N',
  `remove_flag_timestamp` int(11) NOT NULL DEFAULT '0',
  `previous_sessid` varchar(128) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `time` (`time`),
  KEY `user_id` (`user_id`),
  KEY `previous_sesid` (`previous_sessid`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions_persistence_ratelimit`
--

DROP TABLE IF EXISTS `sessions_persistence_ratelimit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions_persistence_ratelimit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  `attempts` int(11) NOT NULL,
  `eventTimestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`),
  KEY `eventTimestamp` (`eventTimestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=1052 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings_default`
--

DROP TABLE IF EXISTS `settings_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_default` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting` varchar(64) NOT NULL,
  `value` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting` (`setting`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `site_themes`
--

DROP TABLE IF EXISTS `site_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `path` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_report`
--

DROP TABLE IF EXISTS `sms_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(32) NOT NULL DEFAULT '',
  `sms_id` int(11) NOT NULL,
  `sms_cost` float NOT NULL,
  `sms_quantity` int(11) NOT NULL DEFAULT '1',
  `sms_text` varchar(1024) NOT NULL DEFAULT '',
  `current_balance` float NOT NULL,
  `eventTimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subcontractors_to_agency_mapping`
--

DROP TABLE IF EXISTS `subcontractors_to_agency_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcontractors_to_agency_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subcontractor_company_id` int(11) NOT NULL,
  `agency_company_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subcontractor_company_id` (`subcontractor_company_id`),
  KEY `agency_company_id` (`agency_company_id`),
  CONSTRAINT `subcontractors_to_agency_mapping_ibfk_1` FOREIGN KEY (`subcontractor_company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `subcontractors_to_agency_mapping_ibfk_2` FOREIGN KEY (`agency_company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Agency isn''t allowed to search any subc on the web-site';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_media`
--

DROP TABLE IF EXISTS `temp_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'user uploaded image',
  `mediaType` enum('image','youtube_video') NOT NULL DEFAULT 'image',
  `folder` varchar(4) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `eventTimestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eventTimestamp` (`eventTimestamp`),
  KEY `user_id` (`user_id`),
  KEY `mediaType` (`mediaType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timecard_approvals`
--

DROP TABLE IF EXISTS `timecard_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timecard_approvals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timecard_id` int(11) NOT NULL,
  `approver_id` int(11) NOT NULL,
  `decision` enum('approved','rejected','pending','submit') NOT NULL DEFAULT 'pending',
  `comment` varchar(512) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timecard_id` (`timecard_id`),
  KEY `approver_id` (`approver_id`),
  KEY `decision` (`decision`),
  KEY `eventTimestamp` (`eventTimestamp`),
  CONSTRAINT `timecard_approvals_ibfk_1` FOREIGN KEY (`timecard_id`) REFERENCES `timecards` (`id`),
  CONSTRAINT `timecard_approvals_ibfk_2` FOREIGN KEY (`approver_id`) REFERENCES `timecard_approvers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `timecard_approvals_view`
--

DROP TABLE IF EXISTS `timecard_approvals_view`;
/*!50001 DROP VIEW IF EXISTS `timecard_approvals_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `timecard_approvals_view` AS SELECT 
 1 AS `timecard_approvers_id`,
 1 AS `timecard_approvals_eventTimestamp`,
 1 AS `timecard_approvals_timecard_id`,
 1 AS `timecard_approvers_approver_order`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `timecard_approvers`
--

DROP TABLE IF EXISTS `timecard_approvers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timecard_approvers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approver_user_id` int(11) NOT NULL,
  `contract_psow_id` int(11) NOT NULL,
  `approver_order` int(11) NOT NULL,
  `auto_approve` enum('Y','N') NOT NULL DEFAULT 'N',
  `type` enum('service','business travel') NOT NULL DEFAULT 'service',
  `rate` enum('subcontractor','agency') NOT NULL DEFAULT 'subcontractor',
  PRIMARY KEY (`id`),
  KEY `approver_user_id` (`approver_user_id`),
  KEY `approver_order` (`approver_order`),
  KEY `contract_psow_id` (`contract_psow_id`),
  CONSTRAINT `timecard_approvers_ibfk_1` FOREIGN KEY (`approver_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `timecard_approvers_ibfk_3` FOREIGN KEY (`contract_psow_id`) REFERENCES `contracts_psow` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timecard_customers`
--

DROP TABLE IF EXISTS `timecard_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timecard_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_company_id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `agency_company_id` (`agency_company_id`),
  CONSTRAINT `timecard_customers_ibfk_1` FOREIGN KEY (`agency_company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timecard_lines`
--

DROP TABLE IF EXISTS `timecard_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timecard_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timecard_id` int(11) NOT NULL,
  `timecard_task_id` int(11) NOT NULL,
  `row` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timecard_id` (`timecard_id`),
  KEY `timecard_tasks_id` (`timecard_task_id`),
  CONSTRAINT `timecard_lines_ibfk_1` FOREIGN KEY (`timecard_id`) REFERENCES `timecards` (`id`),
  CONSTRAINT `timecard_lines_ibfk_2` FOREIGN KEY (`timecard_task_id`) REFERENCES `timecard_tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timecard_projects`
--

DROP TABLE IF EXISTS `timecard_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timecard_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timecard_customers_id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timecard_cutomers_id` (`timecard_customers_id`),
  KEY `title` (`title`),
  CONSTRAINT `timecard_projects_ibfk_1` FOREIGN KEY (`timecard_customers_id`) REFERENCES `timecard_customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timecard_task_assignment`
--

DROP TABLE IF EXISTS `timecard_task_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timecard_task_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timecard_tasks_id` int(11) NOT NULL,
  `assignee_user_id` int(11) NOT NULL,
  `period_start` date NOT NULL,
  `period_end` date NOT NULL,
  `hour_limit` int(11) NOT NULL,
  `contract_sow_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timecard_tasks_id` (`timecard_tasks_id`),
  KEY `contract_sow_id` (`contract_sow_id`),
  KEY `assignee_id` (`assignee_user_id`),
  KEY `period_start` (`period_start`),
  KEY `period_end` (`period_end`),
  CONSTRAINT `timecard_task_assignment_ibfk_1` FOREIGN KEY (`timecard_tasks_id`) REFERENCES `timecard_tasks` (`id`),
  CONSTRAINT `timecard_task_assignment_ibfk_2` FOREIGN KEY (`contract_sow_id`) REFERENCES `contracts_sow` (`id`),
  CONSTRAINT `timecard_task_assignment_ibfk_4` FOREIGN KEY (`assignee_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timecard_tasks`
--

DROP TABLE IF EXISTS `timecard_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timecard_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timecard_projects_id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timecard_projects_id` (`timecard_projects_id`),
  KEY `title` (`title`),
  CONSTRAINT `timecard_tasks_ibfk_1` FOREIGN KEY (`timecard_projects_id`) REFERENCES `timecard_projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timecards`
--

DROP TABLE IF EXISTS `timecards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timecards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_sow_id` int(11) NOT NULL,
  `period_start` date NOT NULL,
  `period_end` date NOT NULL DEFAULT '2000-01-01',
  `status` enum('saved','submit','approved','pending approve','rejected') NOT NULL DEFAULT 'saved',
  `submit_date` int(11) NOT NULL DEFAULT '0',
  `approve_date` int(11) NOT NULL DEFAULT '0',
  `payed_date` int(11) NOT NULL DEFAULT '0',
  `expected_pay_date` int(11) NOT NULL DEFAULT '0',
  `originals_received_date` int(11) NOT NULL DEFAULT '0',
  `invoice_filename` varchar(128) NOT NULL DEFAULT '',
  `invoice_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `period_start` (`period_start`),
  KEY `contract_sow_id` (`contract_sow_id`),
  KEY `status` (`status`),
  KEY `period_end` (`period_end`),
  KEY `payed_date` (`payed_date`),
  KEY `expected_pay_date` (`expected_pay_date`),
  KEY `originals_received_date` (`originals_received_date`),
  KEY `act_id` (`invoice_id`),
  CONSTRAINT `timecards_ibfk_3` FOREIGN KEY (`contract_sow_id`) REFERENCES `contracts_sow` (`id`),
  CONSTRAINT `timecards_ibfk_4` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_bonuses_avia`
--

DROP TABLE IF EXISTS `user_bonuses_avia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_bonuses_avia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `airline_id` int(11) NOT NULL,
  `number` varchar(32) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bonuses_avia_id` (`airline_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_bonuses_avia_ibfk_1` FOREIGN KEY (`airline_id`) REFERENCES `airlines` (`id`),
  CONSTRAINT `user_bonuses_avia_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `user_bonuses_avia_view`
--

DROP TABLE IF EXISTS `user_bonuses_avia_view`;
/*!50001 DROP VIEW IF EXISTS `user_bonuses_avia_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_bonuses_avia_view` AS SELECT 
 1 AS `id`,
 1 AS `user_id`,
 1 AS `airline_id`,
 1 AS `number`,
 1 AS `eventTimestamp`,
 1 AS `code`,
 1 AS `description_rus`,
 1 AS `description_eng`,
 1 AS `country`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `user_bonuses_hotel_view`
--

DROP TABLE IF EXISTS `user_bonuses_hotel_view`;
/*!50001 DROP VIEW IF EXISTS `user_bonuses_hotel_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_bonuses_hotel_view` AS SELECT 
 1 AS `id`,
 1 AS `user_id`,
 1 AS `hotel_chain_id`,
 1 AS `number`,
 1 AS `eventTimestamp`,
 1 AS `code`,
 1 AS `description_rus`,
 1 AS `description_eng`,
 1 AS `country`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_bonuses_hotels`
--

DROP TABLE IF EXISTS `user_bonuses_hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_bonuses_hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `hotel_chain_id` int(11) NOT NULL,
  `number` varchar(32) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bonuses_avia_id` (`hotel_chain_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_bonuses_hotels_ibfk_1` FOREIGN KEY (`hotel_chain_id`) REFERENCES `hotel_chains` (`id`),
  CONSTRAINT `user_bonuses_hotels_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `user_bonuses_railroad_view`
--

DROP TABLE IF EXISTS `user_bonuses_railroad_view`;
/*!50001 DROP VIEW IF EXISTS `user_bonuses_railroad_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_bonuses_railroad_view` AS SELECT 
 1 AS `id`,
 1 AS `user_id`,
 1 AS `railroad_id`,
 1 AS `number`,
 1 AS `eventTimestamp`,
 1 AS `code`,
 1 AS `description_rus`,
 1 AS `description_eng`,
 1 AS `country`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_bonuses_railroads`
--

DROP TABLE IF EXISTS `user_bonuses_railroads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_bonuses_railroads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `railroad_id` int(11) NOT NULL,
  `number` varchar(32) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bonuses_avia_id` (`railroad_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_bonuses_railroads_ibfk_1` FOREIGN KEY (`railroad_id`) REFERENCES `railroads` (`id`),
  CONSTRAINT `user_bonuses_railroads_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `email_changeable` enum('Y','N') NOT NULL DEFAULT 'N',
  `type` enum('subcontractor','approver','agency','no role','user','guest','helpdesk') NOT NULL DEFAULT 'no role',
  `isactivated` enum('N','Y') NOT NULL DEFAULT 'N',
  `isblocked` char(1) NOT NULL DEFAULT 'N',
  `lng` varchar(20) NOT NULL DEFAULT '',
  `regdate` date NOT NULL DEFAULT '2000-01-01',
  `partnerid` int(10) unsigned NOT NULL DEFAULT '0',
  `country` int(10) unsigned NOT NULL DEFAULT '0',
  `geo_locality_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nameLast` varchar(30) NOT NULL DEFAULT '',
  `nameMiddle` varchar(64) NOT NULL DEFAULT '',
  `address` varchar(64) NOT NULL DEFAULT '',
  `phone` varchar(64) NOT NULL DEFAULT '',
  `country_code` varchar(5) NOT NULL DEFAULT '',
  `is_phone_confirmed` enum('Y','N') NOT NULL DEFAULT 'N',
  `cv` text NOT NULL,
  `passport_series` varchar(16) NOT NULL DEFAULT '',
  `passport_number` varchar(16) NOT NULL DEFAULT '',
  `passport_issue_date` date NOT NULL DEFAULT '1900-01-01',
  `passport_issue_authority` varchar(256) NOT NULL DEFAULT '',
  `foreign_passport_number` varchar(32) NOT NULL DEFAULT '',
  `foreign_passport_expiration_date` date NOT NULL DEFAULT '1900-01-01',
  `first_name_en` varchar(32) NOT NULL DEFAULT '',
  `last_name_en` varchar(32) NOT NULL DEFAULT '',
  `middle_name_en` varchar(32) NOT NULL DEFAULT '',
  `citizenship_code` enum('RU') NOT NULL DEFAULT 'RU',
  `sex` enum('male','female','') NOT NULL DEFAULT '',
  `birthday` date NOT NULL DEFAULT '1900-01-01',
  `birthdayAccess` enum('public','private') NOT NULL DEFAULT 'private',
  `site_theme_id` int(11) NOT NULL DEFAULT '1',
  `smartway_employee_id` varchar(64) NOT NULL DEFAULT '',
  `appliedVacanciesRender` enum('all','inprogress') NOT NULL DEFAULT 'all' COMMENT 'declares vacancies render in profile_edit: "show all" / "in-progress"',
  `pending_approval_notification_timecard` enum('Y','N') NOT NULL DEFAULT 'N',
  `pending_approval_notification_bt` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S1_sms` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S2_sms` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S3_sms` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S4_sms` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S1_email` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S2_email` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S3_email` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_new_notification_S4_email` enum('Y','N') NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S1_sms` enum('N','Y') NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S2_sms` enum('N','Y') NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S3_sms` enum('N','Y') NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S4_sms` enum('N','Y') NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S1_email` enum('N','Y') NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S2_email` enum('N','Y') NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S3_email` enum('N','Y') NOT NULL DEFAULT 'N',
  `helpdesk_subscription_S4_email` enum('N','Y') NOT NULL DEFAULT 'N',
  `last_online` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT 'используется для presence',
  `last_onlineSecondsSinceY2k` bigint(15) NOT NULL DEFAULT '0',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `activated` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `activator_sent` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_2` (`email`),
  UNIQUE KEY `login_2` (`login`),
  KEY `name` (`name`),
  KEY `nameLast` (`nameLast`),
  KEY `birthdayAccess` (`birthdayAccess`),
  KEY `birthday` (`birthday`),
  KEY `nameMiddle` (`nameMiddle`),
  KEY `phone` (`phone`),
  KEY `country_code` (`country_code`),
  KEY `helpdesk_subscription_S1` (`helpdesk_subscription_S1_sms`),
  KEY `helpdesk_subscription_S2` (`helpdesk_subscription_S2_sms`),
  KEY `helpdesk_subscription_S3` (`helpdesk_subscription_S3_sms`),
  KEY `helpdesk_subscription_S4` (`helpdesk_subscription_S4_sms`),
  KEY `helpdesk_subscription_S1_email` (`helpdesk_subscription_S1_email`),
  KEY `helpdesk_subscription_S2_email` (`helpdesk_subscription_S2_email`),
  KEY `helpdesk_subscription_S3_email` (`helpdesk_subscription_S3_email`),
  KEY `helpdesk_subscription_S4_email` (`helpdesk_subscription_S4_email`),
  KEY `helpdesk_new_notification_S1_sms` (`helpdesk_new_notification_S1_sms`),
  KEY `helpdesk_new_notification_S2_sms` (`helpdesk_new_notification_S2_sms`),
  KEY `helpdesk_new_notification_S3_sms` (`helpdesk_new_notification_S3_sms`),
  KEY `helpdesk_new_notification_S4_sms` (`helpdesk_new_notification_S4_sms`),
  KEY `helpdesk_new_notification_S1_email` (`helpdesk_new_notification_S1_email`),
  KEY `helpdesk_new_notification_S2_email` (`helpdesk_new_notification_S2_email`),
  KEY `helpdesk_new_notification_S3_email` (`helpdesk_new_notification_S3_email`),
  KEY `helpdesk_new_notification_S4_email` (`helpdesk_new_notification_S4_email`),
  KEY `timecard_pending_approval_notification` (`pending_approval_notification_timecard`),
  KEY `bt_pending_approval_notification` (`pending_approval_notification_bt`)
) ENGINE=InnoDB AUTO_INCREMENT=1058 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_avatars`
--

DROP TABLE IF EXISTS `users_avatars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_avatars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `folder` text NOT NULL,
  `filename` text NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `isActive` (`isActive`),
  CONSTRAINT `users_avatars_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_block`
--

DROP TABLE IF EXISTS `users_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_block` (
  `userid` varchar(255) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notes` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_company`
--

DROP TABLE IF EXISTS `users_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `position_title_id` int(11) NOT NULL,
  `occupation_start` date NOT NULL,
  `occupation_finish` date NOT NULL,
  `current_company` tinyint(1) NOT NULL,
  `responsibilities` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `company_id` (`company_id`),
  KEY `position_title_id` (`position_title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_complains`
--

DROP TABLE IF EXISTS `users_complains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_complains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `entityID` int(11) NOT NULL,
  `type` enum('company','certification','course','university','school','language','book') NOT NULL,
  `subtype` enum('image','title','description','general') NOT NULL,
  `complainComment` varchar(512) NOT NULL DEFAULT '',
  `resolveComment` varchar(512) NOT NULL DEFAULT '',
  `state` enum('new','handling','closed') NOT NULL DEFAULT 'new',
  `openEventTimestamp` int(11) NOT NULL,
  `closeEventTimestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entityID` (`entityID`),
  KEY `userID` (`userID`),
  KEY `subtype` (`subtype`),
  KEY `type` (`type`),
  CONSTRAINT `users_complains_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_friends`
--

DROP TABLE IF EXISTS `users_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_friends` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `friendID` int(11) NOT NULL,
  `state` enum('requested','confirmed','blocked','ignored','requesting') NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`),
  KEY `friendID` (`friendID`),
  KEY `state` (`state`),
  CONSTRAINT `users_friends_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  CONSTRAINT `users_friends_ibfk_2` FOREIGN KEY (`friendID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_language`
--

DROP TABLE IF EXISTS `users_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(15) NOT NULL,
  `language_id` int(11) NOT NULL,
  `level` enum('Свободно','Читаю, пишу','Начинающий','') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_notification`
--

DROP TABLE IF EXISTS `users_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_notification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(1024) NOT NULL DEFAULT '',
  `userId` int(11) NOT NULL COMMENT 'User making an action',
  `actionTypeId` int(11) NOT NULL COMMENT 'Action type',
  `actionId` int(11) NOT NULL DEFAULT '0' COMMENT 'Additional data',
  `notificationStatus` enum('read','unread') NOT NULL DEFAULT 'unread',
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `actionTypeId` (`actionTypeId`),
  KEY `actionId` (`actionId`),
  KEY `notificationStatus` (`notificationStatus`),
  KEY `eventTimestamp_2` (`eventTimestamp`),
  CONSTRAINT `users_notification_ibfk_1` FOREIGN KEY (`actionTypeId`) REFERENCES `action_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3823 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_passwd`
--

DROP TABLE IF EXISTS `users_passwd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_passwd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `passwd` varchar(128) NOT NULL,
  `isActive` enum('true','false') NOT NULL DEFAULT 'false',
  `eventTimestamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`),
  KEY `isActive` (`isActive`),
  KEY `passwd` (`passwd`),
  CONSTRAINT `users_passwd_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_subscriptions`
--

DROP TABLE IF EXISTS `users_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `entity_type` enum('company','group') NOT NULL,
  `entity_id` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `entity_type` (`entity_type`),
  KEY `entity_id` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_watched`
--

DROP TABLE IF EXISTS `users_watched`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_watched` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `watched_userID` int(11) NOT NULL,
  `watching_userID` int(11) NOT NULL,
  `eventTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `watching_userID` (`watching_userID`),
  KEY `eventTimestamp` (`eventTimestamp`),
  KEY `watched_userID` (`watched_userID`),
  CONSTRAINT `users_watched_ibfk_1` FOREIGN KEY (`watched_userID`) REFERENCES `users` (`id`),
  CONSTRAINT `users_watched_ibfk_2` FOREIGN KEY (`watching_userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `airports_view`
--

/*!50001 DROP VIEW IF EXISTS `airports_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `airports_view` AS select `airports`.`id` AS `id`,`airports`.`city_name` AS `city_name`,`airports`.`airport_code` AS `airport_code`,`airports`.`airport_name` AS `airport_name`,`airports`.`world_area_code` AS `world_area_code`,`airport_countries`.`title` AS `country_name` from (`airports` join `airport_countries` on((`airports`.`airport_country_id` = `airport_countries`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bt_approvals_view`
--

/*!50001 DROP VIEW IF EXISTS `bt_approvals_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bt_approvals_view` AS select `bt_approvers`.`id` AS `bt_approvers_id`,`bt_approvals`.`eventTimestamp` AS `bt_approvals_eventTimestamp`,`bt_approvals`.`bt_id` AS `bt_approvals_bt_id`,`bt_approvers`.`approver_order` AS `bt_approvers_approver_order` from (`bt_approvals` join `bt_approvers` on((`bt_approvers`.`id` = `bt_approvals`.`approver_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bt_download_attachments_view`
--

/*!50001 DROP VIEW IF EXISTS `bt_download_attachments_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bt_download_attachments_view` AS select `exp_line`.`id` AS `id`,`exp`.`bt_id` AS `bt_id`,`exp`.`date` AS `date`,`exp_line`.`bt_expense_id` AS `bt_expense_id`,`exp_line`.`value` AS `value` from ((`bt_expense_lines` `exp_line` join `bt_expense_line_templates` `exp_line_templ` on((`exp_line_templ`.`id` = `exp_line`.`bt_expense_line_template_id`))) join `bt_expenses` `exp` on((`exp`.`id` = `exp_line`.`bt_expense_id`))) where (`exp_line_templ`.`dom_type` = 'image') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `geo_locality_view`
--

/*!50001 DROP VIEW IF EXISTS `geo_locality_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `geo_locality_view` AS select `geo_locality`.`id` AS `geo_locality_id`,`geo_locality`.`title` AS `geo_locality_title`,`geo_region`.`id` AS `geo_region_id`,`geo_region`.`title` AS `geo_region_title`,`geo_country`.`id` AS `geo_country_id`,`geo_country`.`title` AS `geo_country_title` from ((`geo_locality` join `geo_region` on((`geo_region`.`id` = `geo_locality`.`geo_region_id`))) join `geo_country` on((`geo_country`.`id` = `geo_region`.`geo_country_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `helpdesk_ticket_history_helpdesk_users_view`
--

/*!50001 DROP VIEW IF EXISTS `helpdesk_ticket_history_helpdesk_users_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `helpdesk_ticket_history_helpdesk_users_view` AS select `helpdesk_ticket_history`.`id` AS `id`,`helpdesk_ticket_history`.`helpdesk_ticket_id` AS `helpdesk_ticket_id`,`helpdesk_ticket_history`.`user_id` AS `user_id`,`helpdesk_ticket_history`.`severity` AS `severity`,`helpdesk_ticket_history`.`state` AS `state`,`helpdesk_ticket_history`.`description` AS `description`,`helpdesk_ticket_history`.`eventTimestamp` AS `eventTimestamp` from `helpdesk_ticket_history` where `helpdesk_ticket_history`.`user_id` in (select `users`.`id` from `users` where (`users`.`type` = 'helpdesk')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `helpdesk_ticket_history_last_case_state_view`
--

/*!50001 DROP VIEW IF EXISTS `helpdesk_ticket_history_last_case_state_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `helpdesk_ticket_history_last_case_state_view` AS select `a`.`id` AS `id`,`a`.`helpdesk_ticket_id` AS `helpdesk_ticket_id`,`a`.`user_id` AS `user_id`,`a`.`severity` AS `severity`,`a`.`state` AS `state`,`a`.`description` AS `description`,`a`.`eventTimestamp` AS `eventTimestamp` from (`helpdesk_ticket_history` `a` left join `helpdesk_ticket_history` `b` on(((`a`.`helpdesk_ticket_id` = `b`.`helpdesk_ticket_id`) and (`a`.`eventTimestamp` < `b`.`eventTimestamp`)))) where isnull(`b`.`helpdesk_ticket_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `helpdesk_ticket_history_last_helpdesk_user_update_view`
--

/*!50001 DROP VIEW IF EXISTS `helpdesk_ticket_history_last_helpdesk_user_update_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `helpdesk_ticket_history_last_helpdesk_user_update_view` AS select `a`.`id` AS `id`,`a`.`helpdesk_ticket_id` AS `helpdesk_ticket_id`,`a`.`user_id` AS `user_id`,`a`.`severity` AS `severity`,`a`.`state` AS `state`,`a`.`description` AS `description`,`a`.`eventTimestamp` AS `eventTimestamp` from (`helpdesk_ticket_history_helpdesk_users_view` `a` left join `helpdesk_ticket_history_helpdesk_users_view` `b` on(((`a`.`helpdesk_ticket_id` = `b`.`helpdesk_ticket_id`) and (`a`.`eventTimestamp` < `b`.`eventTimestamp`)))) where isnull(`b`.`helpdesk_ticket_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `timecard_approvals_view`
--

/*!50001 DROP VIEW IF EXISTS `timecard_approvals_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `timecard_approvals_view` AS select `timecard_approvers`.`id` AS `timecard_approvers_id`,`timecard_approvals`.`eventTimestamp` AS `timecard_approvals_eventTimestamp`,`timecard_approvals`.`timecard_id` AS `timecard_approvals_timecard_id`,`timecard_approvers`.`approver_order` AS `timecard_approvers_approver_order` from (`timecard_approvals` join `timecard_approvers` on((`timecard_approvers`.`id` = `timecard_approvals`.`approver_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_bonuses_avia_view`
--

/*!50001 DROP VIEW IF EXISTS `user_bonuses_avia_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_bonuses_avia_view` AS select `user_bonuses_avia`.`id` AS `id`,`user_bonuses_avia`.`user_id` AS `user_id`,`user_bonuses_avia`.`airline_id` AS `airline_id`,`user_bonuses_avia`.`number` AS `number`,`user_bonuses_avia`.`eventTimestamp` AS `eventTimestamp`,`airlines`.`code` AS `code`,`airlines`.`description_rus` AS `description_rus`,`airlines`.`description_eng` AS `description_eng`,`airlines`.`country` AS `country` from (`user_bonuses_avia` join `airlines` on((`user_bonuses_avia`.`airline_id` = `airlines`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_bonuses_hotel_view`
--

/*!50001 DROP VIEW IF EXISTS `user_bonuses_hotel_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_bonuses_hotel_view` AS select `user_bonuses_hotels`.`id` AS `id`,`user_bonuses_hotels`.`user_id` AS `user_id`,`user_bonuses_hotels`.`hotel_chain_id` AS `hotel_chain_id`,`user_bonuses_hotels`.`number` AS `number`,`user_bonuses_hotels`.`eventTimestamp` AS `eventTimestamp`,`hotel_chains`.`code` AS `code`,`hotel_chains`.`description_rus` AS `description_rus`,`hotel_chains`.`description_eng` AS `description_eng`,`hotel_chains`.`country` AS `country` from (`user_bonuses_hotels` join `hotel_chains` on((`user_bonuses_hotels`.`hotel_chain_id` = `hotel_chains`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_bonuses_railroad_view`
--

/*!50001 DROP VIEW IF EXISTS `user_bonuses_railroad_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_bonuses_railroad_view` AS select `user_bonuses_railroads`.`id` AS `id`,`user_bonuses_railroads`.`user_id` AS `user_id`,`user_bonuses_railroads`.`railroad_id` AS `railroad_id`,`user_bonuses_railroads`.`number` AS `number`,`user_bonuses_railroads`.`eventTimestamp` AS `eventTimestamp`,`railroads`.`code` AS `code`,`railroads`.`description_rus` AS `description_rus`,`railroads`.`description_eng` AS `description_eng`,`railroads`.`country` AS `country` from (`user_bonuses_railroads` join `railroads` on((`user_bonuses_railroads`.`railroad_id` = `railroads`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-03 22:52:17
