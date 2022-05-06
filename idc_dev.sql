/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.24 : Database - idc_dev
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`idc_dev` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `idc_dev`;

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `migrations` */

LOCK TABLES `migrations` WRITE;

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2020_01_29_233225_create_tbl_roles_table',1),(4,'2020_01_29_234142_tbl_user_roles',1),(5,'2020_02_06_014633_add_soft_deletes_to_users_table',1),(6,'2020_11_19_193024_create_vc_payments_table',1),(7,'2020_11_19_193106_create_vc_invoices_table',1),(8,'2020_11_19_193123_create_vc_payment_temps_table',1),(9,'2020_11_19_193140_create_vc_invoice_temps_table',1),(10,'2020_11_19_193619_create_vc_vendors_table',1),(11,'2020_11_24_013954_create_cleanup_sp',1),(12,'2020_11_24_231025_create_vc_cleaned_data_table',1),(13,'2020_11_25_112131_create_tbl_vc_vendors_v1',1),(14,'2020_11_25_115717_create_tbl_vc_payments_v1',1),(15,'2020_11_25_123844_create_tbl__vc_invoices_v1',1),(16,'2020_11_25_232846_create_master_etl_sp',1),(17,'2020_11_25_232918_create_populate_recovered_sp',2),(18,'2020_11_25_232937_create_populate_invoices_maintable_sp',2),(19,'2020_11_25_232954_create_populate_payments_maintable_sp',2),(20,'2020_11_26_223818_create_tbl_cleaned_data_v1',2),(21,'2020_11_26_223842_create_tbl_recovered_table',2),(22,'2020_11_26_225240_create_duplication_verf_invoice_sp',2),(23,'2020_11_26_225301_create_duplication_verf_payment_sp',2),(24,'2020_11_26_231409_create_populate_cleaned_sp',2),(25,'2020_11_26_231541_create_populate_recovered1_sp',3),(26,'2020_12_03_032245_create_populate_changed_recovered_sp',3);

UNLOCK TABLES;

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `password_resets` */

LOCK TABLES `password_resets` WRITE;

UNLOCK TABLES;

/*Table structure for table `tbl_cleaned_data` */

DROP TABLE IF EXISTS `tbl_cleaned_data`;

CREATE TABLE `tbl_cleaned_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` int(11) NOT NULL,
  `payment_number` bigint(20) NOT NULL,
  `payment_date` date NOT NULL,
  `invoice_number` varchar(100) DEFAULT NULL,
  `invoice_date` date NOT NULL DEFAULT '1999-09-09',
  `description` varchar(500) DEFAULT NULL,
  `amount_paid` double(10,2) DEFAULT NULL,
  `po` varchar(20) DEFAULT NULL,
  `invoice_id` varchar(20) DEFAULT NULL,
  `capture_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_cleaned_data` */

LOCK TABLES `tbl_cleaned_data` WRITE;

UNLOCK TABLES;

/*Table structure for table `tbl_recoverd` */

DROP TABLE IF EXISTS `tbl_recoverd`;

CREATE TABLE `tbl_recoverd` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` int(11) NOT NULL,
  `invoice_id` varchar(20) DEFAULT NULL,
  `start_balance` double(10,2) DEFAULT NULL,
  `current_balance` varchar(10) DEFAULT NULL,
  `recoverd` varchar(10) DEFAULT NULL,
  `payment_date` date NOT NULL,
  `refresh_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_recoverd` */

LOCK TABLES `tbl_recoverd` WRITE;

UNLOCK TABLES;

/*Table structure for table `tbl_roles` */

DROP TABLE IF EXISTS `tbl_roles`;

CREATE TABLE `tbl_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_roles` */

LOCK TABLES `tbl_roles` WRITE;

insert  into `tbl_roles`(`id`,`name`,`created_at`,`updated_at`) values (1,'Super Admin','2021-03-10 21:34:24','2021-03-10 21:34:24'),(2,'User','2021-03-10 21:34:24','2021-03-10 21:34:24');

UNLOCK TABLES;

/*Table structure for table `tbl_user_roles` */

DROP TABLE IF EXISTS `tbl_user_roles`;

CREATE TABLE `tbl_user_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `roleId` int(10) unsigned NOT NULL,
  `userId` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_user_roles` */

LOCK TABLES `tbl_user_roles` WRITE;

insert  into `tbl_user_roles`(`id`,`roleId`,`userId`,`created_at`,`updated_at`) values (1,1,1,NULL,NULL),(2,2,2,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `tbl_vc_invoice_temps` */

DROP TABLE IF EXISTS `tbl_vc_invoice_temps`;

CREATE TABLE `tbl_vc_invoice_temps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` int(11) NOT NULL,
  `payment_number` varchar(20) DEFAULT NULL,
  `invoice_number` varchar(100) DEFAULT NULL,
  `invoice_date` varchar(10) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `invoice_amount` varchar(10) DEFAULT NULL,
  `invoice_currency` varchar(10) DEFAULT NULL,
  `withholding_amount` varchar(10) DEFAULT NULL,
  `terms_discount_taken` varchar(10) DEFAULT NULL,
  `amount_paid` varchar(10) DEFAULT NULL,
  `remaining_amount` varchar(10) DEFAULT NULL,
  `capture_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vc_invoice_temps` */

LOCK TABLES `tbl_vc_invoice_temps` WRITE;

UNLOCK TABLES;

/*Table structure for table `tbl_vc_invoices` */

DROP TABLE IF EXISTS `tbl_vc_invoices`;

CREATE TABLE `tbl_vc_invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` int(11) NOT NULL,
  `payment_number` varchar(20) DEFAULT NULL,
  `invoice_number` varchar(100) DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `invoice_amount` double(10,2) DEFAULT NULL,
  `invoice_currency` varchar(10) DEFAULT NULL,
  `withholding_amount` double(10,2) DEFAULT NULL,
  `terms_discount_taken` double(10,2) DEFAULT NULL,
  `amount_paid` double(10,2) DEFAULT NULL,
  `remaining_amount` double(10,2) DEFAULT NULL,
  `capture_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vc_invoices` */

LOCK TABLES `tbl_vc_invoices` WRITE;

UNLOCK TABLES;

/*Table structure for table `tbl_vc_payment_temps` */

DROP TABLE IF EXISTS `tbl_vc_payment_temps`;

CREATE TABLE `tbl_vc_payment_temps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` int(11) NOT NULL,
  `payment_number` varchar(20) DEFAULT NULL,
  `payment_date` varchar(10) NOT NULL,
  `invoice_currency` varchar(10) DEFAULT NULL,
  `amount_in_invoice_currency` varchar(10) DEFAULT NULL,
  `payment_currency` varchar(10) DEFAULT NULL,
  `amount_in_payment_currency` varchar(10) DEFAULT NULL,
  `exchange_rate` varchar(5) DEFAULT NULL,
  `payment_type` varchar(5) DEFAULT NULL,
  `payment_status` varchar(30) DEFAULT NULL,
  `payment_voided_reason` varchar(50) DEFAULT NULL,
  `capture_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vc_payment_temps` */

LOCK TABLES `tbl_vc_payment_temps` WRITE;

UNLOCK TABLES;

/*Table structure for table `tbl_vc_payments` */

DROP TABLE IF EXISTS `tbl_vc_payments`;

CREATE TABLE `tbl_vc_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_vendor_id` int(11) NOT NULL,
  `payment_number` bigint(20) DEFAULT NULL,
  `payment_date` date NOT NULL,
  `invoice_currency` varchar(10) DEFAULT NULL,
  `amount_in_invoice_currency` double(10,2) DEFAULT NULL,
  `payment_currency` varchar(10) DEFAULT NULL,
  `amount_in_payment_currency` double(10,2) DEFAULT NULL,
  `exchange_rate` varchar(5) DEFAULT NULL,
  `payment_type` varchar(5) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_voided_reason` varchar(50) DEFAULT NULL,
  `capture_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vc_payments` */

LOCK TABLES `tbl_vc_payments` WRITE;

UNLOCK TABLES;

/*Table structure for table `tbl_vc_vendors` */

DROP TABLE IF EXISTS `tbl_vc_vendors`;

CREATE TABLE `tbl_vc_vendors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `tier` varchar(255) DEFAULT NULL,
  `vendor_status` tinyint(3) unsigned NOT NULL COMMENT '0 = inActive, 1 = Active',
  `onboarding_date` date NOT NULL DEFAULT '1999-09-09',
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vc_vendors` */

LOCK TABLES `tbl_vc_vendors` WRITE;

UNLOCK TABLES;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

LOCK TABLES `users` WRITE;

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values (1,'Ideo Click','super_admin@ideo.diginc.pk',NULL,'$2y$10$aHT1bnJvjSHSyUIuiFB71eA5W2yEE6r8Uci2ghD0RiO.MgoF/UZeG',NULL,NULL,NULL,NULL),(2,'User Ideo','user@ideo.diginc.pk',NULL,'$2y$10$CYffJIu6BclitFdwk3hfCeQOmODGoxr3kXrlVvBvAiER1btMmvGfG',NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/* Procedure structure for procedure `spDuplicateVerfinvoice` */

/*!50003 DROP PROCEDURE IF EXISTS  `spDuplicateVerfinvoice` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spDuplicateVerfinvoice`(IN vendor_id INT)
BEGIN
            SELECT DISTINCT b.fk_vendor_id, 
                b.Upload_Time,
                b.Row_No,COALESCE(cnt-1,0) AS dup_count
                FROM (
                (SELECT `fk_vendor_id`,
                `payment_number`,
                `payment_date`,
                `capture_date`AS Upload_Time
                     ,COUNT(id) AS cnt
                    FROM `tbl_vc_payment_temps`
                    WHERE fk_vendor_id =VendorId
                    GROUP BY `fk_vendor_id`,`payment_number`,`payment_date`,Upload_Time
                    HAVING cnt>1)a
                    RIGHT JOIN
                (SELECT `fk_vendor_id`,
                `capture_date`AS Upload_Time
                    ,COUNT(id)AS Row_No
                    FROM `tbl_vc_payment_temps`
                    WHERE fk_vendor_id =VendorId
                    GROUP BY `fk_vendor_id`,Upload_Time)b
                    ON a.fk_vendor_id=b.fk_vendor_id AND a.Upload_Time=b.Upload_Time
                    );
        END */$$
DELIMITER ;

/* Procedure structure for procedure `spDuplicateVerfpayment` */

/*!50003 DROP PROCEDURE IF EXISTS  `spDuplicateVerfpayment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spDuplicateVerfpayment`(IN vendor_id INT)
BEGIN
            SELECT DISTINCT b.fk_vendor_id, 
                b.Upload_Time,
                b.Row_No,COALESCE(cnt-1,0) AS dup_count
                FROM (
                (SELECT `fk_vendor_id`,
                `payment_number`,
                `payment_date`,
                `capture_date`AS Upload_Time
                     ,COUNT(id) AS cnt
                    FROM `tbl_vc_payment_temps`
                    WHERE fk_vendor_id =VendorId
                    GROUP BY `fk_vendor_id`,`payment_number`,`payment_date`,Upload_Time
                    HAVING cnt>1)a
                    RIGHT JOIN
                (SELECT `fk_vendor_id`,
                `capture_date`AS Upload_Time
                    ,COUNT(id)AS Row_No
                    FROM `tbl_vc_payment_temps`
                    WHERE fk_vendor_id =VendorId
                    GROUP BY `fk_vendor_id`,Upload_Time)b
                    ON a.fk_vendor_id=b.fk_vendor_id AND a.Upload_Time=b.Upload_Time
                    );
        END */$$
DELIMITER ;

/* Procedure structure for procedure `spMasterETL` */

/*!50003 DROP PROCEDURE IF EXISTS  `spMasterETL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spMasterETL`(IN vendor_id INT)
BEGIN
            DECLARE `_rollback` BOOL DEFAULT 0 ;
              DECLARE EXIT HANDLER FOR SQLEXCEPTION 
                BEGIN
                -- ERROR
                    SELECT 
                    'Syntax Error' ;
                    SET `_rollback` = 1 ;
                    ROLLBACK ;
                END ;
          
          
              DECLARE EXIT HANDLER FOR SQLWARNING 
                BEGIN
                -- WARNING
                    SELECT 
                    'Warning by DB' ;
                    SET `_rollback` = 1 ;
                    ROLLBACK;
                END ;
              START TRANSACTION ;
                CALL `spPopulatePaymentsMainTable`(vendor_id);
                CALL `spPopulateInvoicesMainTable`(vendor_id);
                CALL `spPopulateCleanedTable`(vendor_id);
                CALL `spPopulateChangedRecoveredTable`(vendor_id);
              IF `_rollback` THEN ROLLBACK;
              ELSE COMMIT;
              END IF;
        END */$$
DELIMITER ;

/* Procedure structure for procedure `spPopulateCleanedTable` */

/*!50003 DROP PROCEDURE IF EXISTS  `spPopulateCleanedTable` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spPopulateCleanedTable`(IN vendor_id INT)
BEGIN
            DECLARE `_rollback` BOOL DEFAULT 0 ;
              DECLARE EXIT HANDLER FOR SQLEXCEPTION 
                BEGIN
                -- ERROR
                    SELECT 
                    "Syntax Error" ;
                    SET `_rollback` = 1 ;
                    ROLLBACK ;
                END ;
          
          
        --	  DECLARE EXIT HANDLER FOR SQLWARNING 
        --		BEGIN
        --		-- WARNING
        --			SELECT 
        --			"Warning by DB" ;
        --			SET `_rollback` = 1 ;
        --			ROLLBACK;
        --		END ;
              START TRANSACTION ;
              SET autocommit = 0 ;
              DELETE FROM `tbl_cleaned_data` WHERE fk_vendor_id=vendor_id;
              INSERT INTO `tbl_cleaned_data`
                (
                 `fk_vendor_id`
                ,`payment_number`
                ,`payment_date`
                ,`invoice_number`
                ,`invoice_date`
                ,`description`
                ,`amount_paid`
                ,`po`
                ,`invoice_id`
                ,`capture_date`	
                )
                (
              SELECT 
                   a.fk_vendor_id
                  ,a.payment_number
                  ,a.payment_date
                  ,b.invoice_number
                  ,b.`invoice_date`
                  ,b.description
                  ,b.amount_paid
                  ,CASE WHEN 
                    b.description LIKE '%/%/' 
                   THEN 
                    SUBSTRING_INDEX(b.description, '/', 1) 
                   ELSE '' END AS po
                  ,IF(LOCATE('S',invoice_number)
                    ,SUBSTRING_INDEX(invoice_number,  'S', 1)
                    ,SUBSTRING_INDEX(invoice_number,  'P', 1))  AS invoice_id
                  ,a.capture_date
              FROM
                `tbl_vc_payments` a
              INNER JOIN
                `tbl_vc_invoices` b
              ON 
                a.payment_number=b.payment_number
              WHERE
                (b.description LIKE '%/%/' OR b.description  LIKE 'Missed%' OR b.description  LIKE 'Shortage%') 
              AND 
                b.description NOT LIKE '%DROPSHIP%'
              AND 
                a.fk_vendor_id=vendor_id
                );
              IF `_rollback` THEN ROLLBACK;
              ELSE COMMIT;
              END IF;
        END */$$
DELIMITER ;

/* Procedure structure for procedure `spPopulateInvoicesMainTable` */

/*!50003 DROP PROCEDURE IF EXISTS  `spPopulateInvoicesMainTable` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spPopulateInvoicesMainTable`(IN vendor_id INT)
BEGIN
            DECLARE `_rollback` BOOL DEFAULT 0 ;
              DECLARE EXIT HANDLER FOR SQLEXCEPTION 
                BEGIN
                -- ERROR
                    SELECT 
                    'Syntax Error' ;
                    SET `_rollback` = 1 ;
                    ROLLBACK ;
                END ;
          
          
              DECLARE EXIT HANDLER FOR SQLWARNING 
                BEGIN
                -- WARNING
                    SELECT 
                    'Warning by DB' ;
                    SET `_rollback` = 1 ;
                    ROLLBACK;
                END ;
              START TRANSACTION ;
              SET autocommit = 0 ;
              INSERT INTO `tbl_vc_invoices`
                (
                 `fk_vendor_id`
                ,`payment_number`
                ,`invoice_number`
                ,`invoice_date`
                ,`description`
                ,`invoice_amount`
                ,`invoice_currency`
                ,`withholding_amount`
                ,`terms_discount_taken`
                ,`amount_paid`
                ,`remaining_amount`
                ,`capture_date`	
                )
                (
              SELECT 
                 `fk_vendor_id`
                ,CAST(`payment_number` AS UNSIGNED)              AS payment_number
                ,`invoice_number`
                ,CAST(`invoice_date` AS DATE)                    AS payment_date
                ,`description`
                ,CAST(`invoice_amount` AS DECIMAL(10,2))         AS invoice_amount
                ,`invoice_currency`
                ,CAST(`withholding_amount` AS DECIMAL(10,2))     AS `withholding_amount`
                ,CAST(`terms_discount_taken` AS DECIMAL(10,2))   AS `terms_discount_taken`
                ,CAST(`amount_paid` AS DECIMAL(10,2))            AS `amount_paid`
                ,CAST(`remaining_amount` AS DECIMAL(10,2))       AS `remaining_amount`
                ,`capture_date`
              FROM 
                `tbl_vc_invoice_temps`
              WHERE 
                fk_vendor_id = vendor_id
                );
              DELETE FROM 
                `tbl_vc_invoice_temps`
              WHERE 
                fk_vendor_id=vendor_id;
              IF `_rollback` THEN ROLLBACK;
              ELSE COMMIT;
              END IF;
        END */$$
DELIMITER ;

/* Procedure structure for procedure `spPopulatePaymentsMainTable` */

/*!50003 DROP PROCEDURE IF EXISTS  `spPopulatePaymentsMainTable` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spPopulatePaymentsMainTable`(IN vendor_id INT)
BEGIN
            DECLARE `_rollback` BOOL DEFAULT 0 ;
                  DECLARE EXIT HANDLER FOR SQLEXCEPTION 
                    BEGIN
                    -- ERROR
                        SELECT 
                        'Syntax Error' ;
                        SET `_rollback` = 1 ;
                        ROLLBACK ;
                    END ;
              
              
                  DECLARE EXIT HANDLER FOR SQLWARNING 
                    BEGIN
                    -- WARNING
                        SELECT 
                        'Warning by DB' ;
                        SET `_rollback` = 1 ;
                        ROLLBACK;
                    END ;
                  START TRANSACTION ;
                  SET autocommit = 0 ;
                  INSERT INTO `tbl_vc_payments`
                    (
                     `fk_vendor_id`
                    ,`payment_number`
                    ,`payment_date`
                    ,`invoice_currency`
                    ,`amount_in_invoice_currency`
                    ,`payment_currency`
                    ,`amount_in_payment_currency`
                    ,`exchange_rate`
                    ,`payment_type`
                    ,`payment_status`
                    ,`payment_voided_reason`
                    ,`capture_date`
                    )
                    (
                  SELECT 
                     `fk_vendor_id`
                    ,CAST(`payment_number` AS UNSIGNED)                  AS payment_number
                    ,CAST(`payment_date` AS DATE)                        AS payment_date
                    ,`invoice_currency`
                    ,CAST(`amount_in_invoice_currency` AS DECIMAL(10,2)) AS amount_in_invoice_currency
                    ,`payment_currency`
                    ,CAST(`amount_in_payment_currency` AS DECIMAL(10,2)) AS `amount_in_payment_currency`
                    ,`exchange_rate`
                    ,`payment_type`
                    ,`payment_status`
                    ,`payment_voided_reason`
                    ,`capture_date`
                  FROM 
                    `tbl_vc_payment_temps`
                  WHERE 
                    fk_vendor_id = vendor_id
                    );
                  DELETE FROM 
                   `tbl_vc_payment_temps`
                  WHERE 
                    fk_vendor_id=vendor_id;
                  IF `_rollback` THEN ROLLBACK;
                  ELSE COMMIT;
                  END IF;
        END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
