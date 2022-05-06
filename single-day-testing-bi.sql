/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.24 : Database - single-day-testing-bi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`single-day-testing-bi` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `single-day-testing-bi`;

/*Table structure for table `etl_logs` */

DROP TABLE IF EXISTS `etl_logs`;

CREATE TABLE `etl_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `Stored_Procedure_Name` varchar(200) NOT NULL,
  `Execution_status` varchar(200) NOT NULL,
  `LogDate` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15132 DEFAULT CHARSET=utf8;

/*Data for the table `etl_logs` */

LOCK TABLES `etl_logs` WRITE;

insert  into `etl_logs`(`log_id`,`Stored_Procedure_Name`,`Execution_status`,`LogDate`) values (15130,'spRTLAMSTarget','Commit','2021-03-10 00:51:26'),(15131,'spRTLAMSTarget','Commit','2021-03-10 01:00:09');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
