/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.24 : Database - tana-2-dev-sdm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tana-2-dev-sdm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `tana-2-dev-sdm`;

/*Table structure for table `br_brand_vendor` */

DROP TABLE IF EXISTS `br_brand_vendor`;

CREATE TABLE `br_brand_vendor` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_brand_id` smallint(5) unsigned NOT NULL,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `rdm_brand_id` smallint(5) unsigned NOT NULL,
  `rdm_vendor_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `br_brand_vendor` */

LOCK TABLES `br_brand_vendor` WRITE;

UNLOCK TABLES;

/*Table structure for table `dim_brand` */

DROP TABLE IF EXISTS `dim_brand`;

CREATE TABLE `dim_brand` (
  `brand_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `rdm_brand_id` smallint(5) unsigned DEFAULT NULL,
  `brand_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`brand_id`),
  KEY `idx_brand_id` (`rdm_brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `dim_brand` */

LOCK TABLES `dim_brand` WRITE;

UNLOCK TABLES;

/*Table structure for table `dim_category` */

DROP TABLE IF EXISTS `dim_category`;

CREATE TABLE `dim_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subcategory` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `idx_subcategory` (`subcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `dim_category` */

LOCK TABLES `dim_category` WRITE;

UNLOCK TABLES;

/*Table structure for table `dim_date` */

DROP TABLE IF EXISTS `dim_date`;

CREATE TABLE `dim_date` (
  `date_key` int(10) unsigned NOT NULL,
  `full_date` date DEFAULT NULL,
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
  `fiscal_year` int(10) unsigned NOT NULL,
  `fiscal_year_month` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiscal_year_qtr` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`date_key`),
  KEY `idx_fulldate` (`full_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `dim_date` */

LOCK TABLES `dim_date` WRITE;

UNLOCK TABLES;

/*Table structure for table `dim_po` */

DROP TABLE IF EXISTS `dim_po`;

CREATE TABLE `dim_po` (
  `po_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `po` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_to_location` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_id` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `availability` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `backordered` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `window_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`po_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `dim_po` */

LOCK TABLES `dim_po` WRITE;

UNLOCK TABLES;

/*Table structure for table `dim_product` */

DROP TABLE IF EXISTS `dim_product`;

CREATE TABLE `dim_product` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_category_id` int(10) unsigned DEFAULT NULL,
  `asin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `idx_asin` (`asin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `dim_product` */

LOCK TABLES `dim_product` WRITE;

UNLOCK TABLES;

/*Table structure for table `dim_vendor` */

DROP TABLE IF EXISTS `dim_vendor`;

CREATE TABLE `dim_vendor` (
  `vendor_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rdm_vendor_id` mediumint(8) unsigned DEFAULT NULL,
  `vendor_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tier` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`vendor_id`),
  KEY `idx_vendor_name` (`vendor_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `dim_vendor` */

LOCK TABLES `dim_vendor` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_dropship_daily` */

DROP TABLE IF EXISTS `fact_dropship_daily`;

CREATE TABLE `fact_dropship_daily` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(6) NOT NULL,
  `fk_product_id` mediumint(9) NOT NULL,
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
  `item_quantity` smallint(5) unsigned DEFAULT NULL,
  `gift_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipped_date` date NOT NULL DEFAULT '1999-09-09',
  `date_key` int(11) NOT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_dropship_daily` */

LOCK TABLES `fact_dropship_daily` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_dropship_daily_summary` */

DROP TABLE IF EXISTS `fact_dropship_daily_summary`;

CREATE TABLE `fact_dropship_daily_summary` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(6) NOT NULL,
  `item_cost` decimal(14,4) DEFAULT NULL,
  `item_quantity` smallint(5) unsigned DEFAULT NULL,
  `shipped_date` date NOT NULL DEFAULT '1999-09-09',
  `date_key` int(11) NOT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_dropship_daily_summary` */

LOCK TABLES `fact_dropship_daily_summary` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_dropship_monthly_summary` */

DROP TABLE IF EXISTS `fact_dropship_monthly_summary`;

CREATE TABLE `fact_dropship_monthly_summary` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(6) NOT NULL,
  `item_cost` decimal(14,4) DEFAULT NULL,
  `item_quantity` smallint(5) unsigned DEFAULT NULL,
  `start_date` date NOT NULL DEFAULT '1999-09-09',
  `end_date` date NOT NULL,
  `date_key` int(10) unsigned NOT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_dropship_monthly_summary` */

LOCK TABLES `fact_dropship_monthly_summary` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_dropship_weekly_summary` */

DROP TABLE IF EXISTS `fact_dropship_weekly_summary`;

CREATE TABLE `fact_dropship_weekly_summary` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(6) NOT NULL,
  `item_cost` decimal(14,4) DEFAULT NULL,
  `item_quantity` smallint(5) unsigned DEFAULT NULL,
  `start_date` date NOT NULL DEFAULT '1999-09-09',
  `end_date` date NOT NULL,
  `date_key` int(10) unsigned NOT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_dropship_weekly_summary` */

LOCK TABLES `fact_dropship_weekly_summary` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_inventory_daily` */

DROP TABLE IF EXISTS `fact_inventory_daily`;

CREATE TABLE `fact_inventory_daily` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` mediumint(8) unsigned NOT NULL,
  `fk_product_id` mediumint(8) unsigned NOT NULL,
  `fk_category_id` mediumint(8) unsigned NOT NULL,
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
  `date_key` int(10) unsigned NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`received_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_inventory_daily` */

LOCK TABLES `fact_inventory_daily` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_inventory_daily_summary` */

DROP TABLE IF EXISTS `fact_inventory_daily_summary`;

CREATE TABLE `fact_inventory_daily_summary` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(6) NOT NULL,
  `net_received` decimal(11,2) NOT NULL,
  `net_received_units` int(11) NOT NULL,
  `open_purchase_order_quantity` mediumint(8) unsigned DEFAULT NULL,
  `ptp_net_receipts_dollar` decimal(11,2) DEFAULT NULL,
  `ptp_daily_net_receipts_dollar` decimal(11,2) DEFAULT NULL,
  `ptp_net_shipped_units` decimal(11,2) DEFAULT NULL,
  `ptp_daily_net_shipped_units` decimal(11,2) DEFAULT NULL,
  `yoy` decimal(8,2) NOT NULL DEFAULT '0.00',
  `received_date` date NOT NULL DEFAULT '1999-09-09',
  `date_key` int(11) NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`received_date`),
  KEY `idx_vendor_nr` (`fk_vendor_id`,`net_received`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_inventory_daily_summary` */

LOCK TABLES `fact_inventory_daily_summary` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_inventory_monthly_summary` */

DROP TABLE IF EXISTS `fact_inventory_monthly_summary`;

CREATE TABLE `fact_inventory_monthly_summary` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(6) NOT NULL,
  `net_received` decimal(11,2) NOT NULL,
  `net_received_units` int(11) NOT NULL,
  `open_purchase_order_quantity` int(10) unsigned DEFAULT NULL,
  `ptp_net_receipts_dollar` decimal(11,2) DEFAULT NULL,
  `ptp_daily_net_receipts_dollar` decimal(11,2) DEFAULT NULL,
  `ptp_net_shipped_units` decimal(11,2) DEFAULT NULL,
  `ptp_daily_net_shipped_units` decimal(11,2) DEFAULT NULL,
  `yoy` decimal(8,2) NOT NULL DEFAULT '0.00',
  `start_date` date NOT NULL DEFAULT '1999-09-09',
  `end_date` date NOT NULL,
  `date_key` int(10) unsigned NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`start_date`),
  KEY `idx_vendor_nr` (`fk_vendor_id`,`net_received`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_inventory_monthly_summary` */

LOCK TABLES `fact_inventory_monthly_summary` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_inventory_weekly_summary` */

DROP TABLE IF EXISTS `fact_inventory_weekly_summary`;

CREATE TABLE `fact_inventory_weekly_summary` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(6) NOT NULL,
  `net_received` decimal(11,2) NOT NULL,
  `net_received_units` int(11) NOT NULL,
  `open_purchase_order_quantity` mediumint(8) unsigned DEFAULT NULL,
  `ptp_net_receipts_dollar` decimal(11,2) DEFAULT NULL,
  `ptp_daily_net_receipts_dollar` decimal(11,2) DEFAULT NULL,
  `ptp_net_shipped_units` decimal(11,2) DEFAULT NULL,
  `ptp_daily_net_shipped_units` decimal(11,2) DEFAULT NULL,
  `yoy` decimal(8,2) NOT NULL DEFAULT '0.00',
  `start_date` date NOT NULL DEFAULT '1999-09-09',
  `end_date` date NOT NULL,
  `date_key` int(11) NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`start_date`),
  KEY `idx_vendor_nr` (`fk_vendor_id`,`net_received`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_inventory_weekly_summary` */

LOCK TABLES `fact_inventory_weekly_summary` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_po_daily` */

DROP TABLE IF EXISTS `fact_po_daily`;

CREATE TABLE `fact_po_daily` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` mediumint(9) DEFAULT NULL,
  `fk_product_id` mediumint(9) DEFAULT NULL,
  `fk_category_id` mediumint(9) DEFAULT NULL,
  `fk_po_id` mediumint(9) DEFAULT NULL,
  `window_start` date NOT NULL DEFAULT '1999-09-09',
  `window_end` date NOT NULL DEFAULT '1999-09-09',
  `expected_date` date NOT NULL DEFAULT '1999-09-09',
  `quantity_requested` mediumint(9) DEFAULT NULL,
  `accepted_quantity` mediumint(9) DEFAULT NULL,
  `quantity_received` mediumint(9) DEFAULT NULL,
  `quantity_outstanding` mediumint(9) DEFAULT NULL,
  `unit_cost` decimal(14,4) DEFAULT NULL,
  `total_cost` decimal(16,4) DEFAULT NULL,
  `ordered_on` date NOT NULL DEFAULT '1999-09-09',
  `datekey` int(11) NOT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_po_daily` */

LOCK TABLES `fact_po_daily` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_po_daily_summary` */

DROP TABLE IF EXISTS `fact_po_daily_summary`;

CREATE TABLE `fact_po_daily_summary` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
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
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_po_daily_summary` */

LOCK TABLES `fact_po_daily_summary` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_po_monthly_summary` */

DROP TABLE IF EXISTS `fact_po_monthly_summary`;

CREATE TABLE `fact_po_monthly_summary` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `total_quantity_requested` mediumint(8) unsigned DEFAULT NULL,
  `total_accepted_quantity` mediumint(8) unsigned DEFAULT NULL,
  `total_quantity_received` mediumint(8) unsigned DEFAULT NULL,
  `total_quantity_outstanding` mediumint(8) unsigned DEFAULT NULL,
  `total_unit_cost` mediumint(8) unsigned DEFAULT NULL,
  `total_cost` decimal(11,2) unsigned DEFAULT NULL,
  `confirmation_rate` decimal(7,2) unsigned DEFAULT NULL,
  `yoy` decimal(8,2) NOT NULL DEFAULT '0.00',
  `start_date` date NOT NULL DEFAULT '1999-09-09',
  `end_date` date NOT NULL DEFAULT '1999-09-09',
  `date_key` int(10) unsigned NOT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_po_monthly_summary` */

LOCK TABLES `fact_po_monthly_summary` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_po_weekly_summary` */

DROP TABLE IF EXISTS `fact_po_weekly_summary`;

CREATE TABLE `fact_po_weekly_summary` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` smallint(5) unsigned NOT NULL,
  `total_quantity_requested` mediumint(8) unsigned DEFAULT NULL,
  `total_accepted_quantity` mediumint(8) unsigned DEFAULT NULL,
  `total_quantity_received` mediumint(8) unsigned DEFAULT NULL,
  `total_quantity_outstanding` mediumint(8) unsigned DEFAULT NULL,
  `total_unit_cost` mediumint(8) unsigned DEFAULT NULL,
  `total_cost` decimal(11,2) unsigned DEFAULT NULL,
  `confirmation_rate` decimal(7,2) unsigned DEFAULT NULL,
  `yoy` decimal(8,2) NOT NULL DEFAULT '0.00',
  `start_date` date NOT NULL DEFAULT '1999-09-09',
  `end_date` date NOT NULL DEFAULT '1999-09-09',
  `date_key` int(10) unsigned NOT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_po_weekly_summary` */

LOCK TABLES `fact_po_weekly_summary` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_sale_daily` */

DROP TABLE IF EXISTS `fact_sale_daily`;

CREATE TABLE `fact_sale_daily` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` mediumint(8) unsigned NOT NULL,
  `fk_product_id` mediumint(8) unsigned NOT NULL,
  `fk_category_id` mediumint(8) unsigned NOT NULL,
  `shipped_cogs` decimal(20,4) DEFAULT NULL,
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
  `sale_date` date NOT NULL,
  `date_key` int(10) unsigned NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`sale_date`),
  KEY `idx_product` (`fk_product_id`),
  KEY `idx_category` (`fk_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_sale_daily` */

LOCK TABLES `fact_sale_daily` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_sale_daily_summary` */

DROP TABLE IF EXISTS `fact_sale_daily_summary`;

CREATE TABLE `fact_sale_daily_summary` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` mediumint(8) unsigned NOT NULL,
  `shipped_cogs` decimal(20,4) unsigned DEFAULT NULL,
  `shipped_units` mediumint(8) unsigned DEFAULT NULL,
  `shipped_cogs_prior_period` decimal(12,4) DEFAULT NULL,
  `shipped_units_prior_period` decimal(12,4) DEFAULT NULL,
  `acu` decimal(12,4) unsigned DEFAULT NULL,
  `ptp_shipped_cogs` decimal(12,4) DEFAULT NULL,
  `ptp_daily_shipped_cogs` decimal(16,4) DEFAULT NULL,
  `ptp_shipped_units` decimal(12,4) DEFAULT NULL,
  `ptp_daily_shipped_units` decimal(16,4) DEFAULT NULL,
  `yoy` decimal(8,2) NOT NULL DEFAULT '0.00',
  `sale_date` date DEFAULT NULL,
  `date_key` int(10) unsigned NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`sale_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_sale_daily_summary` */

LOCK TABLES `fact_sale_daily_summary` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_sale_monthly` */

DROP TABLE IF EXISTS `fact_sale_monthly`;

CREATE TABLE `fact_sale_monthly` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` mediumint(8) unsigned NOT NULL,
  `fk_product_id` mediumint(8) unsigned NOT NULL,
  `fk_category_id` mediumint(8) unsigned NOT NULL,
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
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `date_key` int(10) unsigned NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`start_date`),
  KEY `idx_product` (`fk_product_id`),
  KEY `idx_category` (`fk_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_sale_monthly` */

LOCK TABLES `fact_sale_monthly` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_sale_monthly_summary` */

DROP TABLE IF EXISTS `fact_sale_monthly_summary`;

CREATE TABLE `fact_sale_monthly_summary` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` mediumint(8) unsigned NOT NULL,
  `shipped_cogs` decimal(20,4) unsigned DEFAULT NULL,
  `shipped_units` mediumint(8) unsigned DEFAULT NULL,
  `shipped_cogs_prior_period` decimal(12,4) DEFAULT NULL,
  `shipped_units_prior_period` decimal(12,4) DEFAULT NULL,
  `acu` decimal(12,4) unsigned DEFAULT NULL,
  `ptp_shipped_cogs` decimal(12,4) DEFAULT NULL,
  `ptp_daily_shipped_cogs` decimal(16,4) DEFAULT NULL,
  `ptp_shipped_units` decimal(12,4) DEFAULT NULL,
  `ptp_daily_shipped_units` decimal(16,4) DEFAULT NULL,
  `yoy` decimal(8,2) NOT NULL DEFAULT '0.00',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `date_key` int(10) unsigned NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_sale_monthly_summary` */

LOCK TABLES `fact_sale_monthly_summary` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_sale_weekly` */

DROP TABLE IF EXISTS `fact_sale_weekly`;

CREATE TABLE `fact_sale_weekly` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` mediumint(8) unsigned NOT NULL,
  `fk_product_id` mediumint(8) unsigned NOT NULL,
  `fk_category_id` mediumint(8) unsigned NOT NULL,
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
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `date_key` int(10) unsigned NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`start_date`),
  KEY `idx_product` (`fk_product_id`),
  KEY `idx_category` (`fk_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_sale_weekly` */

LOCK TABLES `fact_sale_weekly` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_sale_weekly_summary` */

DROP TABLE IF EXISTS `fact_sale_weekly_summary`;

CREATE TABLE `fact_sale_weekly_summary` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` mediumint(8) unsigned NOT NULL,
  `shipped_cogs` decimal(20,4) unsigned DEFAULT NULL,
  `shipped_units` mediumint(8) unsigned DEFAULT NULL,
  `shipped_cogs_prior_period` decimal(12,4) DEFAULT NULL,
  `shipped_units_prior_period` decimal(12,4) DEFAULT NULL,
  `acu` decimal(12,4) unsigned DEFAULT NULL,
  `ptp_shipped_cogs` decimal(12,4) DEFAULT NULL,
  `ptp_daily_shipped_cogs` decimal(16,4) DEFAULT NULL,
  `ptp_shipped_units` decimal(12,4) DEFAULT NULL,
  `ptp_daily_shipped_units` decimal(16,4) DEFAULT NULL,
  `yoy` decimal(8,2) NOT NULL DEFAULT '0.00',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `date_key` int(10) unsigned NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_vendor_date` (`fk_vendor_id`,`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fact_sale_weekly_summary` */

LOCK TABLES `fact_sale_weekly_summary` WRITE;

UNLOCK TABLES;

/*Table structure for table `fact_sc_sale` */

DROP TABLE IF EXISTS `fact_sc_sale`;

CREATE TABLE `fact_sc_sale` (
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

/*Data for the table `fact_sc_sale` */

LOCK TABLES `fact_sc_sale` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
