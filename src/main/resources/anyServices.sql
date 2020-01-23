/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 8.0.18 : Database - any_services
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`any_services` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `any_services`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

/*Table structure for table `category_services` */

DROP TABLE IF EXISTS `category_services`;

CREATE TABLE `category_services` (
  `category_id` int(11) NOT NULL,
  `services_id` int(11) NOT NULL,
  KEY `FK5p2f2mjtyobt1num2wjw4d0ir` (`services_id`),
  KEY `FKrfrevdb3a0v8bx9vb18ikiy19` (`category_id`),
  CONSTRAINT `FK5p2f2mjtyobt1num2wjw4d0ir` FOREIGN KEY (`services_id`) REFERENCES `service` (`id`),
  CONSTRAINT `FKrfrevdb3a0v8bx9vb18ikiy19` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category_services` */

/*Table structure for table `massage` */

DROP TABLE IF EXISTS `massage`;

CREATE TABLE `massage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `from_or_to_id` int(11) DEFAULT NULL,
  `to_or_from_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8s8nlib3ot319mbteu66o3gf4` (`from_or_to_id`),
  KEY `FKpo9inenlw01vvqp1d593ol2fh` (`to_or_from_id`),
  CONSTRAINT `FK8s8nlib3ot319mbteu66o3gf4` FOREIGN KEY (`from_or_to_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKpo9inenlw01vvqp1d593ol2fh` FOREIGN KEY (`to_or_from_id`) REFERENCES `operator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `massage` */

/*Table structure for table `operator` */

DROP TABLE IF EXISTS `operator`;

CREATE TABLE `operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operator` */

/*Table structure for table `operator_massages` */

DROP TABLE IF EXISTS `operator_massages`;

CREATE TABLE `operator_massages` (
  `operator_id` int(11) NOT NULL,
  `massages_id` int(11) NOT NULL,
  KEY `FKbpwt44nbib4s0fot0lh9ud8hk` (`massages_id`),
  KEY `FKpcnrtvdb3lfl4aifsj8qpa74g` (`operator_id`),
  CONSTRAINT `FKbpwt44nbib4s0fot0lh9ud8hk` FOREIGN KEY (`massages_id`) REFERENCES `massage` (`id`),
  CONSTRAINT `FKpcnrtvdb3lfl4aifsj8qpa74g` FOREIGN KEY (`operator_id`) REFERENCES `operator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operator_massages` */

/*Table structure for table `service` */

DROP TABLE IF EXISTS `service`;

CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK21kefim0cvfxud7lrcnxctq9r` (`user_id`),
  CONSTRAINT `FK21kefim0cvfxud7lrcnxctq9r` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `service` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `user_type` enum('CONSUMER','MASTER') NOT NULL,
  `age` int(11) NOT NULL,
  `gender` enum('MALE','FEMALE') NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `usertype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*Table structure for table `user_services` */

DROP TABLE IF EXISTS `user_services`;

CREATE TABLE `user_services` (
  `user_id` int(11) NOT NULL,
  `services_id` int(11) NOT NULL,
  KEY `FKp0xpynqj27wjd715djah89qk` (`services_id`),
  KEY `FK9c8yx12obvo89jy5ydn1km34y` (`user_id`),
  CONSTRAINT `FK9c8yx12obvo89jy5ydn1km34y` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKp0xpynqj27wjd715djah89qk` FOREIGN KEY (`services_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_services` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
