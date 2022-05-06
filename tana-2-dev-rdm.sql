/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.24 : Database - tana-2-dev-rdm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tana-2-dev-rdm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `tana-2-dev-rdm`;

/*Table structure for table `core_dropship` */

DROP TABLE IF EXISTS `core_dropship`;

CREATE TABLE `core_dropship` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(6) NOT NULL,
  `order_id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_place_date` timestamp NOT NULL DEFAULT '1999-09-09 00:00:00',
  `required_ship_date` timestamp NOT NULL DEFAULT '1999-09-09 00:00:00',
  `ship_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_method_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_address_line_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_address_line_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_address_line_3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_city` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_state` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_zipcode` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_country` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_it_gift` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_cost` decimal(14,4) DEFAULT NULL,
  `sku` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_quantity` smallint(5) unsigned DEFAULT NULL,
  `gift_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipped_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `capture_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_key` int(11) NOT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `core_dropship` */

LOCK TABLES `core_dropship` WRITE;

UNLOCK TABLES;

/*Table structure for table `core_inventory` */

DROP TABLE IF EXISTS `core_inventory`;

CREATE TABLE `core_inventory` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `asin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subcategory` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_received` decimal(10,2) DEFAULT NULL,
  `net_received_units` mediumint(9) DEFAULT NULL,
  `sell_through_rate` decimal(6,2) DEFAULT NULL,
  `open_purchase_order_quantity` mediumint(8) unsigned DEFAULT NULL,
  `sellable_on_hand_inventory` decimal(10,2) DEFAULT NULL,
  `sellable_on_hand_inventory_trailing_30_day_average` decimal(10,2) DEFAULT NULL,
  `sellable_on_hand_units` mediumint(8) unsigned DEFAULT NULL,
  `unsellable_on_hand_inventory` decimal(10,2) DEFAULT NULL,
  `unsellable_on_hand_inventory_trailing_30_day_average` decimal(10,2) DEFAULT NULL,
  `unsellable_on_hand_units` mediumint(8) unsigned DEFAULT NULL,
  `aged_90+_days_sellable_inventory` decimal(10,2) DEFAULT NULL,
  `aged_90+_days_sellable_inventory_trailing_30_day_average` decimal(10,2) DEFAULT NULL,
  `aged_90+_days_sellable_units` mediumint(8) unsigned DEFAULT NULL,
  `replenishment_category` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_date` date NOT NULL,
  `captured_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_key` int(10) unsigned NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`received_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `core_inventory` */

LOCK TABLES `core_inventory` WRITE;

UNLOCK TABLES;

/*Table structure for table `core_purchase_order` */

DROP TABLE IF EXISTS `core_purchase_order`;

CREATE TABLE `core_purchase_order` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `po` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_location` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asin` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_id` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `availability` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `backordered` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `window_type` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `window_start` date NOT NULL DEFAULT '1999-09-09',
  `window_end` date NOT NULL DEFAULT '1999-09-09',
  `expected_date` date NOT NULL DEFAULT '1999-09-09',
  `quantity_requested` smallint(5) unsigned DEFAULT NULL,
  `accepted_quantity` smallint(5) unsigned DEFAULT NULL,
  `quantity_received` smallint(5) unsigned DEFAULT NULL,
  `quantity_outstanding` smallint(5) unsigned DEFAULT NULL,
  `unit_cost` decimal(8,2) DEFAULT NULL,
  `total_cost` decimal(11,2) DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ordered_on` date NOT NULL DEFAULT '1999-09-09',
  `datekey` int(11) DEFAULT NULL,
  `captured_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`ordered_on`),
  KEY `idx_po_status` (`po`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `core_purchase_order` */

LOCK TABLES `core_purchase_order` WRITE;

UNLOCK TABLES;

/*Table structure for table `core_sale` */

DROP TABLE IF EXISTS `core_sale`;

CREATE TABLE `core_sale` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `asin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subcategory` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipped_cogs` decimal(20,4) unsigned DEFAULT NULL,
  `shipped_cogs_percentage_of_total` decimal(12,4) DEFAULT NULL,
  `shipped_cogs_prior_period` decimal(12,4) DEFAULT NULL,
  `shipped_cogs_last_year` decimal(12,4) DEFAULT NULL,
  `shipped_units` mediumint(8) unsigned DEFAULT NULL,
  `shipped_units_percentage_of_total` decimal(12,4) DEFAULT NULL,
  `shipped_units_prior_period` decimal(12,4) DEFAULT NULL,
  `shipped_units_last_year` decimal(12,4) DEFAULT NULL,
  `customer_returns` smallint(5) unsigned DEFAULT NULL,
  `free_replacements` smallint(5) unsigned DEFAULT NULL,
  `average_sales_price` decimal(10,2) DEFAULT NULL,
  `average_sales_price_prior_period` decimal(10,2) DEFAULT NULL,
  `sale_date` date NOT NULL DEFAULT '1999-09-09',
  `date_key` int(10) unsigned NOT NULL,
  `captured_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`sale_date`),
  KEY `idx_asin_subcategory` (`asin`,`subcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `core_sale` */

LOCK TABLES `core_sale` WRITE;

UNLOCK TABLES;

/*Table structure for table `core_sale_category` */

DROP TABLE IF EXISTS `core_sale_category`;

CREATE TABLE `core_sale_category` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inserted_at` date NOT NULL DEFAULT '1999-09-09',
  `date_key` int(10) unsigned NOT NULL,
  `captured_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`),
  KEY `idx_asin_category` (`asin`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `core_sale_category` */

LOCK TABLES `core_sale_category` WRITE;

UNLOCK TABLES;

/*Table structure for table `core_sale_ptp` */

DROP TABLE IF EXISTS `core_sale_ptp`;

CREATE TABLE `core_sale_ptp` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `fk_vendor_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipped_cogs` decimal(16,4) unsigned DEFAULT NULL,
  `receipt_shipped_units` int(10) unsigned DEFAULT NULL,
  `receipt_dollar` decimal(16,2) unsigned DEFAULT NULL,
  `shipped_units` int(10) unsigned DEFAULT NULL,
  `ptp_date` date NOT NULL DEFAULT '1999-09-09',
  `date_key` int(10) unsigned DEFAULT NULL,
  `captured_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`ptp_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `core_sale_ptp` */

LOCK TABLES `core_sale_ptp` WRITE;

UNLOCK TABLES;

/*Table structure for table `core_sc_sale` */

DROP TABLE IF EXISTS `core_sc_sale`;

CREATE TABLE `core_sc_sale` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `ordered_product_sales` decimal(9,2) unsigned DEFAULT NULL,
  `units_ordered` mediumint(8) unsigned DEFAULT NULL,
  `total_ordered_items` mediumint(8) unsigned DEFAULT NULL,
  `average_sales_per_order_item` decimal(7,2) unsigned DEFAULT NULL,
  `average_units_per_order_item` decimal(7,2) unsigned DEFAULT NULL,
  `average_selling_price` decimal(7,2) unsigned DEFAULT NULL,
  `sessions` mediumint(8) unsigned DEFAULT NULL,
  `order_item_session_percentage` decimal(5,2) DEFAULT NULL,
  `average_offer_count` smallint(5) unsigned DEFAULT NULL,
  `sale_date` date NOT NULL DEFAULT '1999-09-09',
  `date_key` int(10) unsigned NOT NULL,
  `capture_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`sale_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `core_sc_sale` */

LOCK TABLES `core_sc_sale` WRITE;

UNLOCK TABLES;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

LOCK TABLES `failed_jobs` WRITE;

UNLOCK TABLES;

/*Table structure for table `gen_date` */

DROP TABLE IF EXISTS `gen_date`;

CREATE TABLE `gen_date` (
  `date_key` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_date` date NOT NULL DEFAULT '1999-09-09',
  `date_name` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_name_us` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_name_eu` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day_of_week` tinyint(3) unsigned NOT NULL,
  `day_name_of_week` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day_of_month` tinyint(3) unsigned NOT NULL,
  `day_of_year` smallint(5) unsigned NOT NULL,
  `weekday_weekend` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `week_of_month` tinyint(3) unsigned NOT NULL,
  `week_name_of_month` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `week_of_year` tinyint(3) unsigned NOT NULL,
  `week_name_of_year` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month_name` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month_of_year` tinyint(3) unsigned NOT NULL,
  `is_last_day_of_month` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calendar_quarter` tinyint(3) unsigned NOT NULL,
  `calendar_year` smallint(5) unsigned NOT NULL,
  `calendar_year_month` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calendar_year_qtr` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiscal_month_of_year` tinyint(3) unsigned NOT NULL,
  `fiscal_quarter` tinyint(3) unsigned NOT NULL,
  `fiscal_year` int(11) NOT NULL,
  `fiscal_year_month` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiscal_year_qtr` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`date_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `gen_date` */

LOCK TABLES `gen_date` WRITE;

UNLOCK TABLES;

/*Table structure for table `log_transaction` */

DROP TABLE IF EXISTS `log_transaction`;

CREATE TABLE `log_transaction` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_name` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execute_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `log_transaction` */

LOCK TABLES `log_transaction` WRITE;

UNLOCK TABLES;

/*Table structure for table `metadata_core_dropship` */

DROP TABLE IF EXISTS `metadata_core_dropship`;

CREATE TABLE `metadata_core_dropship` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `max_shipped_date` date NOT NULL DEFAULT '1999-09-09',
  `inserted_at` datetime NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`max_shipped_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `metadata_core_dropship` */

LOCK TABLES `metadata_core_dropship` WRITE;

UNLOCK TABLES;

/*Table structure for table `metadata_core_inventory` */

DROP TABLE IF EXISTS `metadata_core_inventory`;

CREATE TABLE `metadata_core_inventory` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `max_received_date` date NOT NULL DEFAULT '1999-09-09',
  `inserted_at` datetime NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`max_received_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `metadata_core_inventory` */

LOCK TABLES `metadata_core_inventory` WRITE;

UNLOCK TABLES;

/*Table structure for table `metadata_core_purchase_order` */

DROP TABLE IF EXISTS `metadata_core_purchase_order`;

CREATE TABLE `metadata_core_purchase_order` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `max_ordered_on` date NOT NULL DEFAULT '1999-09-09',
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`max_ordered_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `metadata_core_purchase_order` */

LOCK TABLES `metadata_core_purchase_order` WRITE;

UNLOCK TABLES;

/*Table structure for table `metadata_core_sale` */

DROP TABLE IF EXISTS `metadata_core_sale`;

CREATE TABLE `metadata_core_sale` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `max_sale_date` date NOT NULL DEFAULT '1999-09-09',
  `inserted_at` datetime NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`max_sale_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `metadata_core_sale` */

LOCK TABLES `metadata_core_sale` WRITE;

UNLOCK TABLES;

/*Table structure for table `metadata_core_sc_sale` */

DROP TABLE IF EXISTS `metadata_core_sc_sale`;

CREATE TABLE `metadata_core_sc_sale` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `max_sale_date` date NOT NULL DEFAULT '1999-09-09',
  `inserted_at` datetime NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`max_sale_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `metadata_core_sc_sale` */

LOCK TABLES `metadata_core_sc_sale` WRITE;

UNLOCK TABLES;

/*Table structure for table `metadata_fact_dropship` */

DROP TABLE IF EXISTS `metadata_fact_dropship`;

CREATE TABLE `metadata_fact_dropship` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned DEFAULT NULL,
  `daily_max_date` date NOT NULL DEFAULT '1999-09-09',
  `week_max_date` date NOT NULL DEFAULT '1999-09-09',
  `monthly_max_date` date NOT NULL DEFAULT '1999-09-09',
  `inserted_at` datetime NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`daily_max_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `metadata_fact_dropship` */

LOCK TABLES `metadata_fact_dropship` WRITE;

UNLOCK TABLES;

/*Table structure for table `metadata_fact_inventory` */

DROP TABLE IF EXISTS `metadata_fact_inventory`;

CREATE TABLE `metadata_fact_inventory` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned DEFAULT NULL,
  `daily_max_date` date NOT NULL DEFAULT '1999-09-09',
  `week_max_date` date NOT NULL DEFAULT '1999-09-09',
  `monthly_max_date` date NOT NULL DEFAULT '1999-09-09',
  `inserted_at` datetime NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`daily_max_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `metadata_fact_inventory` */

LOCK TABLES `metadata_fact_inventory` WRITE;

UNLOCK TABLES;

/*Table structure for table `metadata_fact_purchase_order` */

DROP TABLE IF EXISTS `metadata_fact_purchase_order`;

CREATE TABLE `metadata_fact_purchase_order` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned DEFAULT NULL,
  `daily_max_date` date NOT NULL DEFAULT '1999-09-09',
  `weekly_max_date` date NOT NULL DEFAULT '1999-09-09',
  `monthly_max_date` date NOT NULL DEFAULT '1999-09-09',
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`daily_max_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `metadata_fact_purchase_order` */

LOCK TABLES `metadata_fact_purchase_order` WRITE;

UNLOCK TABLES;

/*Table structure for table `metadata_fact_sale` */

DROP TABLE IF EXISTS `metadata_fact_sale`;

CREATE TABLE `metadata_fact_sale` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned DEFAULT NULL,
  `daily_max_date` date DEFAULT '1999-09-09',
  `week_max_date` date DEFAULT '1999-09-09',
  `monthly_max_date` date DEFAULT '1999-09-09',
  `inserted_at` datetime NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`daily_max_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `metadata_fact_sale` */

LOCK TABLES `metadata_fact_sale` WRITE;

UNLOCK TABLES;

/*Table structure for table `metadata_fact_sc_sale` */

DROP TABLE IF EXISTS `metadata_fact_sc_sale`;

CREATE TABLE `metadata_fact_sc_sale` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned DEFAULT NULL,
  `daily_max_date` date NOT NULL DEFAULT '1999-09-09',
  `inserted_at` datetime NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`daily_max_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `metadata_fact_sc_sale` */

LOCK TABLES `metadata_fact_sc_sale` WRITE;

UNLOCK TABLES;

/*Table structure for table `mgmt_account` */

DROP TABLE IF EXISTS `mgmt_account`;

CREATE TABLE `mgmt_account` (
  `account_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fk_user_id` smallint(5) unsigned NOT NULL,
  `fk_brand_id` smallint(5) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `mgmt_account_fk_user_id_fk_brand_id_unique` (`fk_user_id`,`fk_brand_id`),
  KEY `mgmt_account_fk_user_id_index` (`fk_user_id`),
  KEY `mgmt_account_fk_brand_id_index` (`fk_brand_id`),
  CONSTRAINT `mgmt_account_fk_brand_id_foreign` FOREIGN KEY (`fk_brand_id`) REFERENCES `mgmt_brand` (`brand_id`) ON DELETE CASCADE,
  CONSTRAINT `mgmt_account_fk_user_id_foreign` FOREIGN KEY (`fk_user_id`) REFERENCES `mgmt_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mgmt_account` */

LOCK TABLES `mgmt_account` WRITE;

UNLOCK TABLES;

/*Table structure for table `mgmt_alert` */

DROP TABLE IF EXISTS `mgmt_alert`;

CREATE TABLE `mgmt_alert` (
  `alert_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `fk_user_id` smallint(5) unsigned NOT NULL,
  `reported_attribute` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_reported_attribute` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_reported_value` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reported_value` decimal(20,2) DEFAULT NULL,
  `reported_date` date DEFAULT NULL,
  `trigger_date` date DEFAULT NULL,
  `report_name` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_range` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_graph` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `captured_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mgmt_alert` */

LOCK TABLES `mgmt_alert` WRITE;

UNLOCK TABLES;

/*Table structure for table `mgmt_brand` */

DROP TABLE IF EXISTS `mgmt_brand`;

CREATE TABLE `mgmt_brand` (
  `brand_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `mgmt_brand_brand_name_unique` (`brand_name`),
  KEY `mgmt_brand_brand_id_index` (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mgmt_brand` */

LOCK TABLES `mgmt_brand` WRITE;

UNLOCK TABLES;

/*Table structure for table `mgmt_brand_vendors` */

DROP TABLE IF EXISTS `mgmt_brand_vendors`;

CREATE TABLE `mgmt_brand_vendors` (
  `row_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fk_brand_id` smallint(5) unsigned NOT NULL,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`row_id`),
  UNIQUE KEY `unique_idx_mgmt_brand_vendors` (`fk_brand_id`,`fk_vendor_id`),
  KEY `mgmt_brand_vendors_fk_brand_id_index` (`fk_brand_id`),
  KEY `mgmt_brand_vendors_fk_vendor_id_index` (`fk_vendor_id`),
  CONSTRAINT `mgmt_brand_vendors_fk_brand_id_foreign` FOREIGN KEY (`fk_brand_id`) REFERENCES `mgmt_brand` (`brand_id`) ON DELETE CASCADE,
  CONSTRAINT `mgmt_brand_vendors_fk_vendor_id_foreign` FOREIGN KEY (`fk_vendor_id`) REFERENCES `mgmt_vendor` (`vendor_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mgmt_brand_vendors` */

LOCK TABLES `mgmt_brand_vendors` WRITE;

UNLOCK TABLES;

/*Table structure for table `mgmt_ed_user_vendor` */

DROP TABLE IF EXISTS `mgmt_ed_user_vendor`;

CREATE TABLE `mgmt_ed_user_vendor` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_user_id` smallint(5) unsigned NOT NULL,
  `fk_vendor_id_ed` smallint(5) unsigned NOT NULL,
  `fk_vendor1_id_confirm_po` smallint(5) unsigned NOT NULL,
  `fk_vendor2_id_confirm_po` smallint(5) unsigned NOT NULL,
  `fk_vendor3_id_confirm_po` smallint(5) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mgmt_ed_user_vendor` */

LOCK TABLES `mgmt_ed_user_vendor` WRITE;

insert  into `mgmt_ed_user_vendor`(`row_id`,`fk_user_id`,`fk_vendor_id_ed`,`fk_vendor1_id_confirm_po`,`fk_vendor2_id_confirm_po`,`fk_vendor3_id_confirm_po`,`created_at`,`updated_at`) values (1,15,0,0,0,0,'2021-01-04 13:06:23','2021-01-04 13:06:23');

UNLOCK TABLES;

/*Table structure for table `mgmt_kpi_info` */

DROP TABLE IF EXISTS `mgmt_kpi_info`;

CREATE TABLE `mgmt_kpi_info` (
  `kpi_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `kpi_name` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_kpi_name` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_kpi_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_name` varchar(28) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_range` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_graph` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_table` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `captured_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`kpi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mgmt_kpi_info` */

LOCK TABLES `mgmt_kpi_info` WRITE;

insert  into `mgmt_kpi_info`(`kpi_id`,`kpi_name`,`sub_kpi_name`,`sub_kpi_value`,`report_name`,`report_range`,`report_graph`,`report_table`,`captured_at`) values (1,'shipped_cogs','None','0','sale','daily','summary','fact_sale_daily_summary','2021-01-04 18:03:31'),(2,'shipped_units','None','0','sale','daily','summary','fact_sale_daily_summary','2021-01-04 18:03:31'),(3,'shipped_cogs','None','0','sale','daily','category','fact_sale_daily','2021-01-04 18:03:31'),(4,'shipped_cogs','asin','B008FC62Q6','sale','daily','saleTopAsinShippedCogs','fact_sale_daily','2021-01-04 18:03:31'),(5,'shipped_cogs','asin','B008FC62Q6','sale','daily','saleTopAsinIncrease','fact_sale_daily','2021-01-04 18:03:31'),(6,'shipped_cogs','asin','B008FC62Q6','sale','daily','saleTopAsinDecrease','fact_sale_daily','2021-01-04 18:03:31'),(7,'shipped_cogs','None','0','sale','weekly','summary','fact_sale_weekly_summary','2021-01-04 18:03:31'),(8,'shipped_units','None','0','sale','weekly','summary','fact_sale_weekly_summary','2021-01-04 18:03:31'),(9,'shipped_cogs','None','0','sale','weekly','category','fact_sale_weekly','2021-01-04 18:03:31'),(10,'shipped_cogs','asin','B008FC62Q6','sale','weekly','saleTopAsinShippedCogs','fact_sale_daily','2021-01-04 18:03:31'),(11,'shipped_cogs','asin','B008FC62Q6','sale','weekly','saleTopAsinIncrease','fact_sale_daily','2021-01-04 18:03:31'),(12,'shipped_cogs','asin','B008FC62Q6','sale','weekly','saleTopAsinDecrease','fact_sale_daily','2021-01-04 18:03:31'),(13,'shipped_cogs','None','0','sale','monthly','summary','fact_sale_monthly_summary','2021-01-04 18:03:31'),(14,'shipped_units','None','0','sale','monthly','summary','fact_sale_monthly_summary','2021-01-04 18:03:32'),(15,'shipped_cogs','None','0','sale','monthly','category','fact_sale_monthly','2021-01-04 18:03:32'),(16,'shipped_cogs','asin','B008FC62Q6','sale','monthly','saleTopAsinShippedCogs','fact_sale_daily','2021-01-04 18:03:32'),(17,'shipped_cogs','asin','B008FC62Q6','sale','monthly','saleTopAsinIncrease','fact_sale_daily','2021-01-04 18:03:32'),(18,'shipped_cogs','asin','B008FC62Q6','sale','monthly','saleTopAsinDecrease','fact_sale_daily','2021-01-04 18:03:32'),(19,'shipped_cogs','None','0','newSale','daily','shippedCogsSummary','fact_sale_daily_summary','2021-01-04 18:03:32'),(20,'net_received','None','0','newSale','daily','netReceivedSummary','fact_inventory_daily_summary','2021-01-04 18:03:32'),(21,'confirmation_rate','None','0','newSale','daily','confirmationRateSummary','fact_po_daily_summary','2021-01-04 18:03:32'),(22,'yoy','None','0','newSale','daily','yoySummary','fact_po_daily_summary','2021-01-04 18:03:32'),(23,'shipped_cogs','asin','B008FC62Q6','newSale','daily','newSaleTopAsinShippedCogs','fact_sale_daily','2021-01-04 18:03:32'),(24,'shipped_cogs','asin','B008FC62Q6','newSale','daily','newSaleTopAsinIncrease','fact_sale_daily','2021-01-04 18:03:32'),(25,'shipped_cogs','asin','B008FC62Q6','newSale','daily','newSaleTopAsinDecrease','fact_sale_daily','2021-01-04 18:03:32'),(26,'shipped_cogs','None','0','newSale','weekly','shippedCogsSummary','fact_sale_weekly_summary','2021-01-04 18:03:32'),(27,'net_received','None','0','newSale','weekly','netReceivedSummary','fact_inventory_weekly_summary','2021-01-04 18:03:32'),(28,'confirmation_rate','None','0','newSale','weekly','confirmationRateSummary','fact_po_weekly_summary','2021-01-04 18:03:32'),(29,'yoy','None','0','newSale','weekly','yoySummary','fact_po_weekly_summary','2021-01-04 18:03:32'),(30,'shipped_cogs','asin','B008FC62Q6','newSale','weekly','newSaleTopAsinShippedCogs','fact_sale_daily','2021-01-04 18:03:32'),(31,'shipped_cogs','asin','B008FC62Q6','newSale','weekly','newSaleTopAsinIncrease','fact_sale_daily','2021-01-04 18:03:32'),(32,'shipped_cogs','asin','B008FC62Q6','newSale','weekly','newSaleTopAsinDecrease','fact_sale_daily','2021-01-04 18:03:32'),(33,'shipped_cogs','None','0','newSale','monthly','shippedCogsSummary','fact_sale_monthly_summary','2021-01-04 18:03:32'),(34,'net_received','None','0','newSale','monthly','netReceivedSummary','fact_inventory_monthly_summary','2021-01-04 18:03:32'),(35,'confirmation_rate','None','0','newSale','monthly','confirmationRateSummary','fact_po_monthly_summary','2021-01-04 18:03:32'),(36,'yoy','None','0','newSale','monthly','yoySummary','fact_po_monthly_summary','2021-01-04 18:03:32'),(37,'shipped_cogs','asin','B008FC62Q6','newSale','monthly','newSaleTopAsinShippedCogs','fact_sale_daily','2021-01-04 18:03:32'),(38,'shipped_cogs','asin','B008FC62Q6','newSale','monthly','newSaleTopAsinIncrease','fact_sale_daily','2021-01-04 18:03:32'),(39,'shipped_cogs','asin','B008FC62Q6','newSale','monthly','newSaleTopAsinDecrease','fact_sale_daily','2021-01-04 18:03:32');

UNLOCK TABLES;

/*Table structure for table `mgmt_kpi_threshold` */

DROP TABLE IF EXISTS `mgmt_kpi_threshold`;

CREATE TABLE `mgmt_kpi_threshold` (
  `threshold_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_user_id` smallint(5) unsigned NOT NULL,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `fk_kpi_id` smallint(5) unsigned NOT NULL,
  `threshold_type` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `threshold_value` decimal(20,2) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `captured_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`threshold_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mgmt_kpi_threshold` */

LOCK TABLES `mgmt_kpi_threshold` WRITE;

UNLOCK TABLES;

/*Table structure for table `mgmt_module` */

DROP TABLE IF EXISTS `mgmt_module`;

CREATE TABLE `mgmt_module` (
  `module_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`module_id`),
  KEY `mgmt_module_module_id_index` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mgmt_module` */

LOCK TABLES `mgmt_module` WRITE;

insert  into `mgmt_module`(`module_id`,`module_name`,`created_at`,`updated_at`) values (1,'Super Admin','2021-01-04 13:03:29','2021-01-04 13:03:29'),(2,'Admin','2021-01-04 13:03:29','2021-01-04 13:03:29'),(3,'User','2021-01-04 13:03:29','2021-01-04 13:03:29'),(4,'Brand','2021-01-04 13:03:29','2021-01-04 13:03:29'),(5,'Vendor','2021-01-04 13:03:29','2021-01-04 13:03:29'),(6,'Brand Association','2021-01-04 13:03:29','2021-01-04 13:03:29'),(7,'Vendor Association','2021-01-04 13:03:29','2021-01-04 13:03:29'),(8,'Report Uploading','2021-01-04 13:03:29','2021-01-04 13:03:29'),(9,'Category Uploading','2021-01-04 13:03:29','2021-01-04 13:03:29'),(10,'PTP Uploading','2021-01-04 13:03:29','2021-01-04 13:03:29'),(11,'Operator','2021-01-04 13:03:32','2021-01-04 13:03:32');

UNLOCK TABLES;

/*Table structure for table `mgmt_notification` */

DROP TABLE IF EXISTS `mgmt_notification`;

CREATE TABLE `mgmt_notification` (
  `alert_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `fk_user_id` smallint(5) unsigned NOT NULL,
  `alert_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reported_attribute` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_reported_attribute` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_reported_value` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reported_value` decimal(20,2) DEFAULT NULL,
  `reported_date` date DEFAULT NULL,
  `report_range` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trigger_date` date NOT NULL,
  `is_viewed` tinyint(4) NOT NULL DEFAULT '1',
  `is_notified` tinyint(4) NOT NULL DEFAULT '1',
  `is_disabled` tinyint(4) NOT NULL DEFAULT '1',
  `captured_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mgmt_notification` */

LOCK TABLES `mgmt_notification` WRITE;

UNLOCK TABLES;

/*Table structure for table `mgmt_permission` */

DROP TABLE IF EXISTS `mgmt_permission`;

CREATE TABLE `mgmt_permission` (
  `permission_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `mgmt_permission_permission_id_index` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mgmt_permission` */

LOCK TABLES `mgmt_permission` WRITE;

insert  into `mgmt_permission`(`permission_id`,`permission_name`,`created_at`,`updated_at`) values (1,'canView','2021-01-04 13:03:30','2021-01-04 13:03:30'),(2,'canAdd','2021-01-04 13:03:30','2021-01-04 13:03:30'),(3,'canUpdate','2021-01-04 13:03:30','2021-01-04 13:03:30'),(4,'canDelete','2021-01-04 13:03:30','2021-01-04 13:03:30');

UNLOCK TABLES;

/*Table structure for table `mgmt_po_plan` */

DROP TABLE IF EXISTS `mgmt_po_plan`;

CREATE TABLE `mgmt_po_plan` (
  `name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mgmt_po_plan` */

LOCK TABLES `mgmt_po_plan` WRITE;

insert  into `mgmt_po_plan`(`name`,`value`) values ('po_value',0),('po_unit',0);

UNLOCK TABLES;

/*Table structure for table `mgmt_role` */

DROP TABLE IF EXISTS `mgmt_role`;

CREATE TABLE `mgmt_role` (
  `role_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  KEY `mgmt_role_role_id_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mgmt_role` */

LOCK TABLES `mgmt_role` WRITE;

insert  into `mgmt_role`(`role_id`,`role_name`,`created_at`,`updated_at`) values (1,'Super Admin','2021-01-04 13:03:30','2021-01-04 13:03:30'),(2,'Admin','2021-01-04 13:03:30','2021-01-04 13:03:30'),(3,'User','2021-01-04 13:03:30','2021-01-04 13:03:30'),(4,'Data Entry Operator','2021-01-04 13:03:32','2021-01-04 13:03:32');

UNLOCK TABLES;

/*Table structure for table `mgmt_role_module_permission` */

DROP TABLE IF EXISTS `mgmt_role_module_permission`;

CREATE TABLE `mgmt_role_module_permission` (
  `auth_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fk_role_id` smallint(5) unsigned NOT NULL,
  `fk_permission_id` smallint(5) unsigned NOT NULL,
  `fk_module_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`auth_id`),
  KEY `mgmt_role_module_permission_fk_role_id_index` (`fk_role_id`),
  KEY `mgmt_role_module_permission_fk_permission_id_index` (`fk_permission_id`),
  KEY `mgmt_role_module_permission_fk_module_id_index` (`fk_module_id`),
  CONSTRAINT `mgmt_role_module_permission_fk_module_id_foreign` FOREIGN KEY (`fk_module_id`) REFERENCES `mgmt_module` (`module_id`) ON DELETE CASCADE,
  CONSTRAINT `mgmt_role_module_permission_fk_permission_id_foreign` FOREIGN KEY (`fk_permission_id`) REFERENCES `mgmt_permission` (`permission_id`) ON DELETE CASCADE,
  CONSTRAINT `mgmt_role_module_permission_fk_role_id_foreign` FOREIGN KEY (`fk_role_id`) REFERENCES `mgmt_role` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mgmt_role_module_permission` */

LOCK TABLES `mgmt_role_module_permission` WRITE;

insert  into `mgmt_role_module_permission`(`auth_id`,`fk_role_id`,`fk_permission_id`,`fk_module_id`) values (1,1,1,1),(2,1,2,1),(3,1,3,1),(4,1,4,1),(5,1,1,2),(6,1,2,2),(7,1,3,2),(8,1,4,2),(9,1,1,3),(10,1,2,3),(11,1,3,3),(12,1,4,3),(13,1,1,4),(14,1,2,4),(15,1,3,4),(16,1,4,4),(17,1,1,5),(18,1,2,5),(19,1,3,5),(20,1,4,5),(21,1,1,6),(22,1,2,6),(23,1,3,6),(24,1,4,6),(25,1,1,7),(26,1,2,7),(27,1,3,7),(28,1,4,7),(29,1,1,8),(30,1,2,8),(31,1,3,8),(32,1,4,8),(33,1,1,9),(34,1,2,9),(35,1,3,9),(36,1,4,9),(37,1,1,10),(38,1,2,10),(39,1,3,10),(40,1,4,10),(41,2,1,3),(42,2,2,3),(43,2,3,3),(44,2,4,3),(45,2,1,4),(46,2,2,4),(47,2,3,4),(48,2,4,4),(49,2,1,5),(50,2,2,5),(51,2,3,5),(52,2,4,5),(53,2,1,6),(54,2,2,6),(55,2,3,6),(56,2,4,6),(57,2,1,7),(58,2,2,7),(59,2,3,7),(60,2,4,7),(61,2,1,9),(62,2,2,9),(63,2,3,9),(64,2,4,9),(65,2,1,10),(66,2,2,10),(67,2,3,10),(68,2,4,10),(69,3,1,4),(70,3,2,4),(71,3,3,4),(72,3,4,4),(73,3,1,5),(74,3,2,5),(75,3,3,5),(76,3,4,5),(77,1,1,11),(78,1,2,11),(79,1,3,11),(80,1,4,11);

UNLOCK TABLES;

/*Table structure for table `mgmt_user` */

DROP TABLE IF EXISTS `mgmt_user`;

CREATE TABLE `mgmt_user` (
  `user_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `mgmt_user_email_unique` (`email`),
  KEY `mgmt_user_user_id_index` (`user_id`),
  KEY `mgmt_user_email_index` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mgmt_user` */

LOCK TABLES `mgmt_user` WRITE;

insert  into `mgmt_user`(`user_id`,`username`,`email`,`password`,`is_active`,`remember_token`,`created_at`,`updated_at`) values (1,'Shahbaz Bin Tahir','shahbaz.tahir@diginc.pk','$2y$10$fp4EumJJkfIf6w.x2CN84uz6OCs99FkjBzT9eTonftQlMui.M3Nkq',1,NULL,'2021-01-04 13:03:30','2021-01-04 13:03:30'),(2,'Ahad Siddiqui','ahad.siddiqui@diginc.pk','$2y$10$Voh9Y7sa8fekxDSVpqvPreeDoZNaVXf7Imlp7yxl4UJhPrF3kPxa2',1,NULL,'2021-01-04 13:03:30','2021-01-04 13:03:30'),(3,'Ahsan Wani','ahsan.wani@diginc.pk','$2y$10$zEV9q2s/xgA2RheE04fRj.H4CzKkdSIWMUbtIgGVnkvTuqBSUtuHm',1,NULL,'2021-01-04 13:03:30','2021-01-04 13:03:30'),(4,'Ashar Qadir','ashar.qadir@diginc.pk','$2y$10$M4hJhV/1WjnD.VSmgTysj.1kev9TyGxRMhLJpIe13RMBQjcYFvJoq',1,NULL,'2021-01-04 13:03:30','2021-01-04 13:03:30'),(5,'Faisal Adnan','faisal.adnan@diginc.pk','$2y$10$Kw/o0wHFf3Vhb/NZzK3RBu8OC2UeJ.S6840uKELTolW4kQmxeCch2',1,NULL,'2021-01-04 13:03:30','2021-01-04 13:03:30'),(6,'Muhammad Adnan','muhammad.adnan@diginc.pk','$2y$10$kQcg/ng82GbnHDf34kkTJOR4mu.AUB0hUogMXiX8xue52CilqAIrO',1,NULL,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(7,'Sikandar Ali Shah','sikandar.ali@diginc.pk','$2y$10$JHS0ZB.T8FoY6N2uM0NcDujxZI8rRNtGnFsn2zsokB1KMSixA9ZHG',1,NULL,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(8,'Maaz Ali','maaz.ali@diginc.pk','$2y$10$LAYoQj88zr3Rc7ERebrC9eqafZqJmd1gg5s6uJmOFOPJvMBtdECqS',1,NULL,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(9,'Roman Amin','roman.amin@diginc.pk','$2y$10$lX/EDWMSAa6AGjcAIIV6FOSPg3YdCbXlWWdf5uqu4ku/GTF7Qa2iO',1,NULL,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(10,'Saliha Arif','saliha.arif@diginc.pk','$2y$10$I4gpIfli4QZowHs3EM1DqeEAhPdyVjd9luV/jr5T51VdmwQasxSqK',1,NULL,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(11,'Tahir Mustafa','tahir.mustafa@diginc.pk','$2y$10$00FTXx18h/dLBsusCwseOu0iGZGOMSkS4aYe99lE5.sEfDUzHZj.G',1,NULL,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(12,'Umer Farooq','umer.farooq@diginc.pk','$2y$10$mO84mXe9g7I1lKqDOxsgkOZzV38/0kW81ATR.kFAsBKeEoJO1B2Pq',1,NULL,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(13,'Abdul Waqar','abdul.waqar@diginc.pk','$2y$10$J2SUVSfi/rm.UfuuIaFmFeSIcQsT3iKdZeZFp1PEy9k7.i31MpKsS',1,NULL,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(14,'Hamza Younas','hamza.younas@diginc.pk','$2y$10$VadsDbgCfWe6gCidOxClveALEh5aF3DQ7z5ZiVW4JNGDaj/.jk04O',1,NULL,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(15,'Fahad Bhatti','fahad.bhatti@diginc.pk','$2y$10$VhLq0WR6gy.RQurMOgtcjenXeK/bfFnNBRJG2216u4MMgqUsRDsVG',1,NULL,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(16,'47','47@tanasales.com','$2y$10$LuUGUWG9.JpdXMsgfm9AvORiVhhyu92ojXwB87CgZxJDt08UtIJza',1,NULL,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(17,'Arctix','arctix@tanasales.com','$2y$10$gSaRznC4EnQsUSwrt3NaKOLiIvn2jOQazLFvFPhOo65RCTZ2R1Dlq',1,NULL,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(18,'Ardisam','Ardisam@tanasales.com','$2y$10$NTJ/mIatmMILlFt8n7JS2e7y2bicjz4kPWQ5lmSEjrAZlU3MvKXpK',1,NULL,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(19,'Haris Zaman','haris.zaman@diginc.pk','$2y$10$gseiy6NN7A.OdJv63fM99uHnMBGDDB0zNg9igIr2XQUU1Ot/13K3W',1,NULL,'2021-01-04 13:03:32','2021-01-04 13:03:32'),(20,'Salman Khan','salman.khan@diginc.pk','$2y$10$va62OQzQJ9zmtcsFWHpHn.CmHSaCcMPnx51Q5xZT9k2CoYTJ4iO6i',1,NULL,'2021-01-04 13:03:32','2021-01-04 13:03:32');

UNLOCK TABLES;

/*Table structure for table `mgmt_user_profile` */

DROP TABLE IF EXISTS `mgmt_user_profile`;

CREATE TABLE `mgmt_user_profile` (
  `profile_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `profile_mode` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_id` smallint(5) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `mgmt_user_profile_fk_user_id_unique` (`fk_user_id`),
  KEY `mgmt_user_profile_fk_user_id_index` (`fk_user_id`),
  KEY `mgmt_user_profile_profile_id_index` (`profile_id`),
  CONSTRAINT `mgmt_user_profile_fk_user_id_foreign` FOREIGN KEY (`fk_user_id`) REFERENCES `mgmt_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mgmt_user_profile` */

LOCK TABLES `mgmt_user_profile` WRITE;

insert  into `mgmt_user_profile`(`profile_id`,`profile_mode`,`fk_user_id`,`created_at`,`updated_at`) values (1,'light-layout',1,'2021-01-04 13:03:30','2021-01-04 13:03:30'),(2,'light-layout',2,'2021-01-04 13:03:30','2021-01-04 13:03:30'),(3,'light-layout',3,'2021-01-04 13:03:30','2021-01-04 13:03:30'),(4,'light-layout',4,'2021-01-04 13:03:30','2021-01-04 13:03:30'),(5,'light-layout',5,'2021-01-04 13:03:30','2021-01-04 13:03:30'),(6,'light-layout',6,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(7,'light-layout',7,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(8,'light-layout',8,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(9,'light-layout',9,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(10,'light-layout',10,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(11,'light-layout',11,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(12,'light-layout',12,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(13,'light-layout',13,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(14,'light-layout',14,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(15,'light-layout',15,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(16,'light-layout',16,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(17,'light-layout',17,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(18,'light-layout',18,'2021-01-04 13:03:31','2021-01-04 13:03:31'),(19,'light-layout',19,'2021-01-04 13:03:32','2021-01-04 13:03:32'),(20,'light-layout',20,'2021-01-04 13:03:32','2021-01-04 13:03:32');

UNLOCK TABLES;

/*Table structure for table `mgmt_user_role` */

DROP TABLE IF EXISTS `mgmt_user_role`;

CREATE TABLE `mgmt_user_role` (
  `fk_user_id` smallint(5) unsigned NOT NULL,
  `fk_role_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`fk_user_id`,`fk_role_id`),
  KEY `mgmt_user_role_fk_user_id_index` (`fk_user_id`),
  KEY `mgmt_user_role_fk_role_id_index` (`fk_role_id`),
  CONSTRAINT `mgmt_user_role_fk_role_id_foreign` FOREIGN KEY (`fk_role_id`) REFERENCES `mgmt_role` (`role_id`) ON DELETE CASCADE,
  CONSTRAINT `mgmt_user_role_fk_user_id_foreign` FOREIGN KEY (`fk_user_id`) REFERENCES `mgmt_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mgmt_user_role` */

LOCK TABLES `mgmt_user_role` WRITE;

insert  into `mgmt_user_role`(`fk_user_id`,`fk_role_id`) values (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,3),(17,3),(18,3),(19,4),(20,4);

UNLOCK TABLES;

/*Table structure for table `mgmt_vendor` */

DROP TABLE IF EXISTS `mgmt_vendor`;

CREATE TABLE `mgmt_vendor` (
  `vendor_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tier` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`vendor_id`),
  UNIQUE KEY `mgmt_vendor_vendor_name_domain_unique` (`vendor_name`,`domain`),
  KEY `mgmt_vendor_vendor_id_index` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mgmt_vendor` */

LOCK TABLES `mgmt_vendor` WRITE;

UNLOCK TABLES;

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

LOCK TABLES `migrations` WRITE;

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2020_04_27_163934_create_roles_table',1),(5,'2020_04_27_164202_create_modules_table',1),(6,'2020_04_27_164852_create_permissions_table',1),(7,'2020_04_27_165253_create_user_role_table',1),(8,'2020_05_04_073218_create_role_module_persmissions_table',1),(9,'2020_05_12_084927_create_vendor_table',1),(10,'2020_05_13_080322_create_daily_sales_table',1),(11,'2020_06_01_095507_create_brands_table',1),(12,'2020_06_02_044207_create_mgmt_account_table',1),(13,'2020_06_03_094019_src_sale_category',1),(14,'2020_06_03_100432_create_mgmt_brand_vendors_table',1),(15,'2020_06_03_121816_create_mgmt_user_profile_table',1),(16,'2020_06_04_153255_ptp_sales_table',1),(17,'2020_06_09_132852_core_sale_table',1),(18,'2020_06_11_090437_gen_date_table',1),(19,'2020_06_11_093358_log_transaction_table',1),(20,'2020_06_11_093804_metadata_sale',1),(21,'2020_06_15_062053_create_dim_category_table',1),(22,'2020_06_15_062350_create_dim_date_table',1),(23,'2020_06_15_065556_create_dim_product_table',1),(24,'2020_06_15_074338_create_dim_vendor_table',1),(25,'2020_06_15_082817_create_fact_sale_daily_table',1),(26,'2020_06_15_084556_create_fact_sale_daily_summary_table',1),(27,'2020_06_15_085224_create_fact_sale_monthly_summary_table',1),(28,'2020_06_15_090159_create_fact_sale_weekly_table',1),(29,'2020_06_15_090527_create_fact_sale_weekly_summary_table',1),(30,'2020_06_17_175533_create_fact_sale_monthly_table',1),(31,'2020_06_24_072108_create_mgmt_kpi_info_table',1),(32,'2020_06_24_072203_create_mgmt_kpi_threshold_table',1),(33,'2020_06_30_050247_create_mgmt_alert_table',1),(34,'2020_06_30_120921_core_sale_ptp_table',1),(35,'2020_07_10_094426_core_sale_category',1),(36,'2020_07_14_134416_meta_fact_sale_table',1),(37,'2020_07_14_135722_stage_sale_table',1),(38,'2020_07_14_140834_stg_sale_summery_table',1),(39,'2020_07_27_110152_create_dim_brand_table',1),(40,'2020_07_27_110817_create_br_brand_vendor_table',1),(41,'2020_07_30_074907_table_vc_purchase_order',1),(42,'2020_08_05_052527_create_core_inventory_table',1),(43,'2020_08_05_064510_create_src_inventory_table',1),(44,'2020_08_10_084701_core_purchase_order_table',1),(45,'2020_08_10_090707_metadata_core_purchase_order_table',1),(46,'2020_08_11_063326_create_metadata_core_inventory_table',1),(47,'2020_08_11_064545_create_metadata_fact_inventory_table',1),(48,'2020_08_20_102655_create_stg_inventory_table',1),(49,'2020_08_20_102758_create_stg_inventory_summary_table',1),(50,'2020_08_24_051039_create_fact_inventory_daily_table',1),(51,'2020_08_24_051559_create_fact_inventory_daily_summary_table',1),(52,'2020_08_28_101356_create_fact_inventory_monthly_summary_table',1),(53,'2020_08_28_102003_create_fact_inventory_weekly_summary_table',1),(54,'2020_09_02_111521_create_mgmt_ed_user_vendor_table',1),(55,'2020_09_02_141110_metadata_fact_purchase_order_table',1),(56,'2020_09_02_142327_stg_purchase_order_summary_table',1),(57,'2020_09_03_080248_stg_purchase_order_table',1),(58,'2020_09_03_081123_fact_po_daily_table',1),(59,'2020_09_03_082318_fact_po_daily_summary_table',1),(60,'2020_09_03_083618_fact_po_monthly_summary_table',1),(61,'2020_09_03_084455_fact_po_weekly_summary_table',1),(62,'2020_09_08_111549_create_mgmt_po_plan_table',1),(63,'2020_09_24_095454_create_mgmt_notification_table',1),(64,'2020_10_21_191945_create_dim_po_table',2),(65,'2020_11_03_174102_add_column_fact_inventory_daily_summary',2),(66,'2020_11_03_174645_add_column_fact_inventory_monthly_summary',2),(67,'2020_11_03_174733_add_column_fact_inventory_weekly_summary',2),(68,'2020_11_03_174904_add_column_stg_inventory_summary',2),(69,'2020_11_03_175135_add_column_fact_sale_daily_summary',2),(70,'2020_11_03_175206_add_column_fact_sale_monthly_summary',2),(71,'2020_11_03_175222_add_column_fact_sale_weekly_summary',2),(72,'2020_11_03_175448_add_column_stg_sale_summary',2),(73,'2020_11_09_111447_add_column_fact_po_daily',2),(74,'2020_11_09_111734_add_column_fact_po_daily_summary',2),(75,'2020_11_09_120149_add_column_stg_sale',2),(76,'2020_11_09_120406_add_column_stg_purchase_order_summary',2),(77,'2020_11_09_122841_add_column_fact_po_monthly_summary',2),(78,'2020_11_09_123103_add_column_fact_po_weekly_summary',2),(79,'2020_11_09_181201_add_column_dim_product',2),(80,'2020_11_11_143422_create_src_sc_3p_sales_table',2),(81,'2020_11_11_153320_create_src_dropship_table',2),(82,'2020_11_17_162658_create_core_dropship_table',2),(83,'2020_11_17_165006_create_metadata_core_dropship_table',2),(84,'2020_11_17_165412_create_metadata_fact_dropship_table',2),(85,'2020_11_17_165656_create_stg_dropship_table',2),(86,'2020_11_17_170156_create_stg_dropship_summary_table',2),(87,'2020_11_17_170719_create_fact_dropship_daily_table',2),(88,'2020_11_17_172058_create_fact_dropship_daily_summary_table',2),(89,'2020_11_17_195828_create_fact_dropship_monthly_summary_table',2),(90,'2020_11_17_200507_create_fact_dropship_weekly_summary_table',2),(91,'2020_11_17_201233_create_core_sc_sale_table',2),(92,'2020_11_17_203549_create_metadata_core_sc_sale_table',2),(93,'2020_11_17_203755_create_metadata_fact_sc_sale_table',2),(94,'2020_11_17_204047_create_stg_sc_sale_table',2),(95,'2020_11_17_204547_create_fact_sc_sale_table',2),(96,'2020_11_23_104643_add_column_fk_category_id_dim_product',2),(97,'2020_11_24_124152_remove_column_tana_subcategory_from_dim_product',2),(98,'2020_11_24_124313_remove_column_category_from_dim_category',2),(99,'2020_11_24_124521_add_column_tana_subcategory_in_stg_inventory',2);

UNLOCK TABLES;

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

LOCK TABLES `password_resets` WRITE;

UNLOCK TABLES;

/*Table structure for table `src_dropship` */

DROP TABLE IF EXISTS `src_dropship`;

CREATE TABLE `src_dropship` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_place_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `required_ship_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ship_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_method_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_to_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_to_address_line_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_to_address_line_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_to_address_line_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_to_city` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_to_state` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_to_zipcode` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_to_country` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_it_gift` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_cost` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_quantity` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gift_message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracking_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipped_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `capture_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `src_dropship` */

LOCK TABLES `src_dropship` WRITE;

UNLOCK TABLES;

/*Table structure for table `src_inventory` */

DROP TABLE IF EXISTS `src_inventory`;

CREATE TABLE `src_inventory` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subcategory` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_received` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_received_units` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sell_through_rate` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_purchase_order_quantity` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sellable_on_hand_inventory` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sellable_on_hand_inventory_trailing_30_day_average` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sellable_on_hand_units` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unsellable_on_hand_inventory` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unsellable_on_hand_inventory_trailing_30_day_average` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unsellable_on_hand_units` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aged_90+_days_sellable_inventory` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aged_90+_days_sellable_inventory_trailing_30_day_average` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aged_90+_days_sellable_units` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `replenishment_category` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_date` date NOT NULL DEFAULT '1999-09-09',
  `captured_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`received_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `src_inventory` */

LOCK TABLES `src_inventory` WRITE;

UNLOCK TABLES;

/*Table structure for table `src_purchase_order` */

DROP TABLE IF EXISTS `src_purchase_order`;

CREATE TABLE `src_purchase_order` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `po` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_location` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asin` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_id` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `availability` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `backordered` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `window_type` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `window_start` date NOT NULL DEFAULT '1999-09-09',
  `window_end` date NOT NULL DEFAULT '1999-09-09',
  `expected_date` date NOT NULL DEFAULT '1999-09-09',
  `quantity_requested` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accepted_quantity` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity_received` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity_outstanding` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_cost` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_cost` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ordered_on` date NOT NULL DEFAULT '1999-09-09',
  `captured_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`ordered_on`),
  KEY `idx_po_status` (`po`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `src_purchase_order` */

LOCK TABLES `src_purchase_order` WRITE;

UNLOCK TABLES;

/*Table structure for table `src_sale` */

DROP TABLE IF EXISTS `src_sale`;

CREATE TABLE `src_sale` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subcategory` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_no` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipped_cogs` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipped_cogs_percentage_of_total` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipped_cogs_prior_period` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipped_cogs_last_year` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipped_units` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipped_units_percentage_of_total` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipped_units_prior_period` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipped_units_last_year` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_returns` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `free_replacements` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `average_sales_price` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `average_sales_price_prior_period` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_date` date NOT NULL DEFAULT '1999-09-09',
  `captured_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `src_sale` */

LOCK TABLES `src_sale` WRITE;

UNLOCK TABLES;

/*Table structure for table `src_sale_category` */

DROP TABLE IF EXISTS `src_sale_category`;

CREATE TABLE `src_sale_category` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inserted_at` date NOT NULL DEFAULT '1999-09-09',
  `captured_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`),
  KEY `idx_asin_category` (`asin`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `src_sale_category` */

LOCK TABLES `src_sale_category` WRITE;

UNLOCK TABLES;

/*Table structure for table `src_sale_ptp` */

DROP TABLE IF EXISTS `src_sale_ptp`;

CREATE TABLE `src_sale_ptp` (
  `row_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipped_cogs` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt_shipped_units` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt_dollar` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipped_units` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ptp_date` date NOT NULL DEFAULT '1999-09-09',
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `src_sale_ptp` */

LOCK TABLES `src_sale_ptp` WRITE;

UNLOCK TABLES;

/*Table structure for table `src_sc_sale` */

DROP TABLE IF EXISTS `src_sc_sale`;

CREATE TABLE `src_sc_sale` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordered_product_sales` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `units_ordered` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_ordered_items` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `average_sales_per_order_item` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `average_units_per_order_item` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `average_selling_price` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sessions` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_session_percentage` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `average_offer_count` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_date` date NOT NULL DEFAULT '1999-09-09',
  `capture_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `src_sc_sale` */

LOCK TABLES `src_sc_sale` WRITE;

UNLOCK TABLES;

/*Table structure for table `stg_dropship` */

DROP TABLE IF EXISTS `stg_dropship`;

CREATE TABLE `stg_dropship` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(6) NOT NULL,
  `order_id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_place_date` timestamp NOT NULL DEFAULT '1999-09-09 00:00:00',
  `required_ship_date` timestamp NOT NULL DEFAULT '1999-09-09 00:00:00',
  `ship_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_method_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_address_line_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_address_line_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_address_line_3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_city` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_state` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_zipcode` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_country` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_it_gift` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_cost` decimal(14,4) DEFAULT NULL,
  `sku` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_quantity` smallint(5) unsigned DEFAULT NULL,
  `gift_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipped_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `capture_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_key` int(11) NOT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `stg_dropship` */

LOCK TABLES `stg_dropship` WRITE;

UNLOCK TABLES;

/*Table structure for table `stg_dropship_summary` */

DROP TABLE IF EXISTS `stg_dropship_summary`;

CREATE TABLE `stg_dropship_summary` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `item_cost` decimal(14,4) NOT NULL,
  `item_quantity` smallint(5) unsigned NOT NULL,
  `shipped_date` date NOT NULL DEFAULT '1999-09-09',
  `date_key` int(11) NOT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `stg_dropship_summary` */

LOCK TABLES `stg_dropship_summary` WRITE;

UNLOCK TABLES;

/*Table structure for table `stg_inventory` */

DROP TABLE IF EXISTS `stg_inventory`;

CREATE TABLE `stg_inventory` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `asin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subcategory` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tana_subcategory` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_received` decimal(10,2) NOT NULL,
  `net_received_units` mediumint(9) NOT NULL,
  `sell_through_rate` decimal(6,2) DEFAULT NULL,
  `open_purchase_order_quantity` mediumint(8) unsigned DEFAULT NULL,
  `sellable_on_hand_inventory` decimal(10,2) DEFAULT NULL,
  `sellable_on_hand_inventory_trailing_30_day_average` decimal(10,2) DEFAULT NULL,
  `sellable_on_hand_units` mediumint(8) unsigned DEFAULT NULL,
  `unsellable_on_hand_inventory` decimal(10,2) DEFAULT NULL,
  `unsellable_on_hand_inventory_trailing_30_day_average` decimal(10,2) DEFAULT NULL,
  `unsellable_on_hand_units` mediumint(8) unsigned DEFAULT NULL,
  `aged_90+_days_sellable_inventory` decimal(10,2) DEFAULT NULL,
  `aged_90+_days_sellable_inventory_trailing_30_day_average` decimal(10,2) DEFAULT NULL,
  `aged_90+_days_sellable_units` mediumint(8) unsigned DEFAULT NULL,
  `replenishment_category` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_date` date NOT NULL,
  `captured_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_key` int(10) unsigned NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`received_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `stg_inventory` */

LOCK TABLES `stg_inventory` WRITE;

UNLOCK TABLES;

/*Table structure for table `stg_inventory_summary` */

DROP TABLE IF EXISTS `stg_inventory_summary`;

CREATE TABLE `stg_inventory_summary` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `net_received` decimal(11,2) NOT NULL,
  `net_received_units` int(11) NOT NULL,
  `open_purchase_order_quantity` mediumint(8) unsigned DEFAULT NULL,
  `ptp_net_receipts_dollar` decimal(11,2) DEFAULT NULL,
  `ptp_daily_net_receipts_dollar` decimal(11,2) DEFAULT NULL,
  `ptp_net_shipped_units` decimal(11,2) DEFAULT NULL,
  `ptp_daily_net_shipped_units` decimal(11,2) DEFAULT NULL,
  `yoy` decimal(8,2) NOT NULL DEFAULT '0.00',
  `received_date` date NOT NULL DEFAULT '1999-09-09',
  `date_key` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `stg_inventory_summary` */

LOCK TABLES `stg_inventory_summary` WRITE;

UNLOCK TABLES;

/*Table structure for table `stg_purchase_order` */

DROP TABLE IF EXISTS `stg_purchase_order`;

CREATE TABLE `stg_purchase_order` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `po` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_to_location` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asin` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_id` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `availability` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `backordered` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `window_type` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `window_start` date NOT NULL DEFAULT '1999-09-09',
  `window_end` date NOT NULL DEFAULT '1999-09-09',
  `expected_date` date NOT NULL DEFAULT '1999-09-09',
  `quantity_requested` smallint(5) unsigned DEFAULT NULL,
  `accepted_quantity` smallint(5) unsigned DEFAULT NULL,
  `quantity_received` smallint(5) unsigned DEFAULT NULL,
  `quantity_outstanding` smallint(5) unsigned DEFAULT NULL,
  `unit_cost` decimal(8,2) DEFAULT NULL,
  `total_cost` decimal(11,2) DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ordered_on` date NOT NULL DEFAULT '1999-09-09',
  `datekey` int(11) NOT NULL,
  `captured_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`ordered_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `stg_purchase_order` */

LOCK TABLES `stg_purchase_order` WRITE;

UNLOCK TABLES;

/*Table structure for table `stg_purchase_order_summary` */

DROP TABLE IF EXISTS `stg_purchase_order_summary`;

CREATE TABLE `stg_purchase_order_summary` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned DEFAULT NULL,
  `total_quantity_requested` mediumint(8) unsigned DEFAULT NULL,
  `total_accepted_quantity` mediumint(8) unsigned DEFAULT NULL,
  `total_quantity_received` mediumint(8) unsigned DEFAULT NULL,
  `total_quantity_outstanding` mediumint(8) unsigned DEFAULT NULL,
  `total_unit_cost` mediumint(8) unsigned DEFAULT NULL,
  `total_cost` decimal(11,2) unsigned DEFAULT NULL,
  `confirmation_rate` decimal(7,2) unsigned DEFAULT NULL,
  `yoy` decimal(8,2) NOT NULL DEFAULT '0.00',
  `ordered_on` date NOT NULL DEFAULT '1999-09-09',
  `date_key` int(10) unsigned NOT NULL,
  `captured_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`ordered_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `stg_purchase_order_summary` */

LOCK TABLES `stg_purchase_order_summary` WRITE;

UNLOCK TABLES;

/*Table structure for table `stg_sale` */

DROP TABLE IF EXISTS `stg_sale`;

CREATE TABLE `stg_sale` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `asin` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subcategory` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tana_subcategory` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipped_cogs` decimal(20,4) unsigned DEFAULT NULL,
  `shipped_cogs_percentage_of_total` decimal(12,4) DEFAULT NULL,
  `shipped_cogs_prior_period` decimal(12,4) DEFAULT NULL,
  `shipped_cogs_last_year` decimal(12,4) DEFAULT NULL,
  `shipped_units` mediumint(8) unsigned DEFAULT NULL,
  `shipped_units_percentage_of_total` decimal(12,4) DEFAULT NULL,
  `shipped_units_prior_period` decimal(12,4) DEFAULT NULL,
  `shipped_units_last_year` decimal(12,4) DEFAULT NULL,
  `customer_returns` smallint(5) unsigned DEFAULT NULL,
  `free_replacements` smallint(5) unsigned DEFAULT NULL,
  `average_sales_price` decimal(10,2) DEFAULT NULL,
  `average_sales_price_prior_period` decimal(10,2) DEFAULT NULL,
  `sale_date` date NOT NULL DEFAULT '1999-09-09',
  `date_key` int(10) unsigned NOT NULL,
  `captured_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`sale_date`),
  KEY `idx_asin` (`asin`,`subcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `stg_sale` */

LOCK TABLES `stg_sale` WRITE;

UNLOCK TABLES;

/*Table structure for table `stg_sale_summary` */

DROP TABLE IF EXISTS `stg_sale_summary`;

CREATE TABLE `stg_sale_summary` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `shipped_cogs` decimal(20,4) unsigned NOT NULL,
  `shipped_units` mediumint(8) unsigned DEFAULT NULL,
  `shipped_cogs_prior_period` decimal(12,4) DEFAULT NULL,
  `shipped_units_prior_period` decimal(12,4) DEFAULT NULL,
  `acu` decimal(12,4) unsigned DEFAULT NULL,
  `ptp_shipped_cogs` decimal(12,4) DEFAULT NULL,
  `ptp_daily_shipped_cogs` decimal(16,4) DEFAULT NULL,
  `ptp_shipped_units` decimal(12,4) DEFAULT NULL,
  `ptp_daily_shipped_units` decimal(16,4) DEFAULT NULL,
  `yoy` decimal(8,2) NOT NULL DEFAULT '0.00',
  `sale_date` date NOT NULL DEFAULT '1999-09-09',
  `date_key` int(10) unsigned NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`sale_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `stg_sale_summary` */

LOCK TABLES `stg_sale_summary` WRITE;

UNLOCK TABLES;

/*Table structure for table `stg_sc_sale` */

DROP TABLE IF EXISTS `stg_sc_sale`;

CREATE TABLE `stg_sc_sale` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `ordered_product_sales` decimal(9,2) unsigned DEFAULT NULL,
  `units_ordered` mediumint(8) unsigned DEFAULT NULL,
  `total_ordered_items` mediumint(8) unsigned DEFAULT NULL,
  `average_sales_per_order_item` decimal(7,2) unsigned DEFAULT NULL,
  `average_units_per_order_item` decimal(7,2) unsigned DEFAULT NULL,
  `average_selling_price` decimal(7,2) unsigned DEFAULT NULL,
  `sessions` mediumint(8) unsigned DEFAULT NULL,
  `order_item_session_percentage` decimal(5,2) DEFAULT NULL,
  `average_offer_count` smallint(5) unsigned DEFAULT NULL,
  `sale_date` date NOT NULL DEFAULT '1999-09-09',
  `date_key` int(10) unsigned NOT NULL,
  `capture_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`sale_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `stg_sc_sale` */

LOCK TABLES `stg_sc_sale` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
