-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: DB
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `ltd_corp_coupon`
--

DROP TABLE IF EXISTS `ltd_corp_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltd_corp_coupon` (
  `c_discount_rate` decimal(30,2) NOT NULL COMMENT 'the rate of the discount',
  `corp_coupon_id` varchar(30) NOT NULL,
  PRIMARY KEY (`corp_coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltd_corp_coupon`
--

LOCK TABLES `ltd_corp_coupon` WRITE;
/*!40000 ALTER TABLE `ltd_corp_coupon` DISABLE KEYS */;
INSERT INTO `ltd_corp_coupon` VALUES (0.90,'1727843195'),(0.80,'2828349816'),(0.90,'2868170271'),(0.80,'2925966320'),(0.80,'5282244975'),(0.85,'6315255780'),(0.60,'7165052063'),(0.70,'8560060722'),(0.70,'8818590786'),(0.70,'952265369');
/*!40000 ALTER TABLE `ltd_corp_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltd_corp_cus`
--

DROP TABLE IF EXISTS `ltd_corp_cus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltd_corp_cus` (
  `email` varchar(30) NOT NULL COMMENT 'email of the customer',
  `corp_no` varchar(30) NOT NULL COMMENT 'the cop registrartion number',
  `emp_id` varchar(30) NOT NULL COMMENT 'the employee id of the customer',
  `corp_name` varchar(30) NOT NULL COMMENT 'the name of the corp',
  `corp_coupon_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `ltd_corp_cus_pkv1` (`corp_no`,`emp_id`),
  KEY `corp_cus_corp_coupon_fk` (`corp_coupon_id`),
  CONSTRAINT `corp_cus_customer_fk` FOREIGN KEY (`email`) REFERENCES `ltd_customer` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltd_corp_cus`
--

LOCK TABLES `ltd_corp_cus` WRITE;
/*!40000 ALTER TABLE `ltd_corp_cus` DISABLE KEYS */;
INSERT INTO `ltd_corp_cus` VALUES ('916791710@qq.com','casdas','111','xxx','null'),('breveyecrece-1984@outlook.com','2','MS43062333','Microsoft Corporation','5282244975'),('ceissazassuddeu-8182@nyu.edu','1','N77414822','New York University','7165052063'),('crebreveyecre-4260@gmail.com','3','G80970673','Alphabet Inc.','6315255780'),('naffureussofou-8723@nyu.edu','1','N63261165','New York University','7165052063'),('pruppitrubuta-1541@outlook.com','2','MS58616803','Microsoft Corporation','5282244975'),('solujicifrou-1777@yopmail.com','5','TG85184809','Techni-Glass Ltd.','2925966320'),('todducemis-2547@yopmail.com','6','A24445062','Aceable, Inc.','952265369'),('trebregrayodeu-5596@nyu.edu','1','N36213671','New York University','7165052063'),('wajougroulage-5993@yopmail.com','4','CH84978299','CHICO Hairdressing Inc.','1727843195'),('wtianyi9802@163.comdasda','dasdas','dsadas','dasdasd','1727843195'),('xaumeweloha-1091@yopmail.com','7','I02810430','Ibotta, Inc.','8818590786');
/*!40000 ALTER TABLE `ltd_corp_cus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltd_customer`
--

DROP TABLE IF EXISTS `ltd_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltd_customer` (
  `email` varchar(30) NOT NULL COMMENT 'email of the customer',
  `phone` bigint NOT NULL COMMENT 'phone number of the customer',
  `street` varchar(30) NOT NULL COMMENT 'the street name of the address',
  `city` varchar(30) NOT NULL COMMENT 'the city of the address',
  `state` varchar(30) NOT NULL COMMENT 'the state of the address',
  `zip` decimal(30,0) NOT NULL COMMENT 'the zip code of the address',
  `customer_type` varchar(30) NOT NULL COMMENT 'the type of the customer',
  PRIMARY KEY (`email`),
  CONSTRAINT `ch_inh_ltd_customer` CHECK ((`customer_type` in (_utf8mb4'c',_utf8mb4'i')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltd_customer`
--

LOCK TABLES `ltd_customer` WRITE;
/*!40000 ALTER TABLE `ltd_customer` DISABLE KEYS */;
INSERT INTO `ltd_customer` VALUES ('916791710@qq.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'c'),('916791710@qq.comwty',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('breveyecrece-1984@outlook.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('ceissazassuddeu-8182@nyu.edu',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('crebreveyecre-4260@gmail.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('crossinnaucagre@icloud.com',8147774630,'x','x','x',121,'i'),('doixauwunuse-5266@qq.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('hoppadilloummu-2988@gmail.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('keigoippeipeitrei@icloud.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('naffureussofou-8723@nyu.edu',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('podducezesse-2447@icloud.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('pruppitrubuta-1541@outlook.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('reikedezotru-1045@gmail.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('solujicifrou-1777@yopmail.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('test@gmail.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('testpass@xxx.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('testxxx@123.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('todducemis-2547@yopmail.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('trebregrayodeu-5596@nyu.edu',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('trissaddeddoutoi-6616@163.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('trujeigaulattou-7527@gmail.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('tw2396@nyu.edu',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('wajougroulage-5993@yopmail.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('wtianyi9802@163.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('wtianyi9802@163.comdasda',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('xaumeweloha-1091@yopmail.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('xxxx@xxx.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('yaudajedeikeu-3539@163.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i'),('yaumewekoha-8071@yahoo.com',8147774630,'605 Pavonia Ave','New jersey','New Jersey',7306,'i');
/*!40000 ALTER TABLE `ltd_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltd_customer_pass`
--

DROP TABLE IF EXISTS `ltd_customer_pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltd_customer_pass` (
  `email` varchar(30) NOT NULL,
  `pass` varchar(45) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltd_customer_pass`
--

LOCK TABLES `ltd_customer_pass` WRITE;
/*!40000 ALTER TABLE `ltd_customer_pass` DISABLE KEYS */;
INSERT INTO `ltd_customer_pass` VALUES ('916791710@qq.com','57ebbf4dddc6a4117950db8eb8ed94f6'),('916791710@qq.comwty','a4cc160dd036acfba17d9debe75098ba'),('breveyecrece-1984@outlook.com','d2588f3c4f5e4e00ce12890cb5dd81f0'),('ceissazassuddeu-8182@nyu.edu','38266ab29037738790358128963e304c'),('crebreveyecre-4260@gmail.com','5d93ceb70e2bf5daa84ec3d0cd2c731a'),('crossinnaucagre@icloud.com','0e78d5729db7871081da1144757f00bd'),('doixauwunuse-5266@qq.com','30ea5c8bface5b1646a95e8a1850f419'),('hoppadilloummu-2988@gmail.com','fc01e41317f5f72c9d6ce775a2c80591'),('keigoippeipeitrei@icloud.com','ee105d1b475099b6bdf40ee7af672319'),('naffureussofou-8723@nyu.edu','1f2720bcccae5f114ab432de1bfee747'),('podducezesse-2447@icloud.com','a4e554ce58f98f9347d8bd812167f9e2'),('pruppitrubuta-1541@outlook.com','e352c389e207f4f3f9f9888379611efc'),('reikedezotru-1045@gmail.com','6d80670318eef0b17bfb6817652fa0c1'),('solujicifrou-1777@yopmail.com','79a95b62b8daa5f5328b93678ce936b2'),('test@gmail.com','b49db2fecf741a029169b87d6cd002d7'),('testpass@xxx.com','19b7621e7ecfe116ed9f4f17f235318b'),('testxxx@123.com','bc65dcd33e383a3d3ab0f0ebf93fcf1a'),('todducemis-2547@yopmail.com','0248b8ca2ffcb8407e24da087186b731'),('trebregrayodeu-5596@nyu.edu','d8fc2dabd897206260483d43f0da2bbe'),('trissaddeddoutoi-6616@163.com','5e7c818e7fb1a9b1796d7bfa227b49c5'),('trujeigaulattou-7527@gmail.com','8e7223029eef609899d0491978eb4931'),('tw2396@nyu.edu','2c7d2e3a4cab8cc55b4fc42cac958b9b'),('wajougroulage-5993@yopmail.com','2fc9e0e838143dbeffe5b6bf5a200bca'),('wtianyi9802@163.com','61092092a4010e363b4a66ce02bcd931'),('wtianyi9802@163.comdasda','c368ac4a335baab951b1c6eee3187b7d'),('xaumeweloha-1091@yopmail.com','422ad9cc7ab650509608d22d4452a80f'),('xxxx@xxx.com','8d28cefebaa071b6cf0ebdbfd894772d'),('yaudajedeikeu-3539@163.com','76abe14f4be291dccdefa8137c45d868'),('yaumewekoha-8071@yahoo.com','6209456403c2641fe216218581bae54e');
/*!40000 ALTER TABLE `ltd_customer_pass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltd_employee_pass`
--

DROP TABLE IF EXISTS `ltd_employee_pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltd_employee_pass` (
  `email` varchar(30) NOT NULL,
  `pass` varchar(45) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltd_employee_pass`
--

LOCK TABLES `ltd_employee_pass` WRITE;
/*!40000 ALTER TABLE `ltd_employee_pass` DISABLE KEYS */;
INSERT INTO `ltd_employee_pass` VALUES ('employee1@gmail.com','3113c76b6518b392d512d538991fb3c7'),('employee2@gmail.com','1679363e3b35e2ee087727cca3c036b8'),('employee3@gmail.com','27327e72960e0cb8c51a0cbb02671c6d');
/*!40000 ALTER TABLE `ltd_employee_pass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltd_indi_coupon`
--

DROP TABLE IF EXISTS `ltd_indi_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltd_indi_coupon` (
  `indi_coupon_id` bigint NOT NULL COMMENT 'the coupon id ',
  `indi_discount_rate` decimal(10,2) NOT NULL COMMENT 'the rate of the discount',
  `start_date` datetime NOT NULL COMMENT 'the start date',
  `end_date` datetime NOT NULL COMMENT 'the end date of the coupon',
  `license_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`indi_coupon_id`),
  KEY `indi_coupon_indi_cus_fk` (`license_id`),
  CONSTRAINT `indi_coupon_indi_cus_fk` FOREIGN KEY (`license_id`) REFERENCES `ltd_indi_cus` (`license_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltd_indi_coupon`
--

LOCK TABLES `ltd_indi_coupon` WRITE;
/*!40000 ALTER TABLE `ltd_indi_coupon` DISABLE KEYS */;
INSERT INTO `ltd_indi_coupon` VALUES (2108149161,0.90,'2022-01-01 00:00:00','2022-01-21 00:00:00','101016329'),(4198309397,0.90,'2020-10-01 00:00:00','2020-11-01 00:00:00','908879746'),(4200713646,0.90,'2020-10-01 00:00:00','2020-12-01 00:00:00','588203864'),(4299540433,0.80,'2021-05-01 00:00:00','2021-06-01 00:00:00','ND158958'),(4422823870,0.90,'2021-04-01 00:00:00','2021-05-01 00:00:00','058600537'),(5294034487,0.75,'2021-05-01 00:00:00','2021-08-01 00:00:00','26806489'),(6264083937,0.80,'2020-08-01 00:00:00','2020-09-01 00:00:00','588203864'),(6428346312,0.85,'2021-01-20 00:00:00','2021-05-20 00:00:00','FDQWERL25495'),(7193258878,0.90,'2020-01-20 00:00:00','2020-02-20 00:00:00','002951620'),(8918830061,0.80,'2021-06-01 00:00:00','2021-07-01 00:00:00','H588540221069'),(8940854222,0.60,'2021-01-01 00:00:00','2021-03-01 00:00:00','25296257'),(9735879478,0.70,'2020-03-20 00:00:00','2020-04-20 00:00:00','002951620'),(9927676813,0.60,'2021-12-01 00:00:00','2021-12-21 00:00:00','101016329');
/*!40000 ALTER TABLE `ltd_indi_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltd_indi_cus`
--

DROP TABLE IF EXISTS `ltd_indi_cus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltd_indi_cus` (
  `email` varchar(30) NOT NULL COMMENT 'email of the customer',
  `license_id` varchar(30) NOT NULL COMMENT 'the driver license number',
  `cus_fn` varchar(30) NOT NULL COMMENT 'the first name of the customer',
  `cus_ln` varchar(30) NOT NULL COMMENT 'the last name of the customer',
  `insurance_name` varchar(30) NOT NULL COMMENT 'the insurance company name',
  `insurance_no` varchar(30) NOT NULL COMMENT 'the insrance number',
  PRIMARY KEY (`email`),
  UNIQUE KEY `ltd_indi_cus_pkv1` (`license_id`),
  CONSTRAINT `indi_cus_customer_fk` FOREIGN KEY (`email`) REFERENCES `ltd_customer` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltd_indi_cus`
--

LOCK TABLES `ltd_indi_cus` WRITE;
/*!40000 ALTER TABLE `ltd_indi_cus` DISABLE KEYS */;
INSERT INTO `ltd_indi_cus` VALUES ('916791710@qq.comwty','sadsad','BOBO','Wang','fd','asass'),('crossinnaucagre@icloud.com','908879746','Tianyi','Wang','1','1'),('doixauwunuse-5266@qq.com','101016329','Tianyi','Wang','state farm','12313'),('hoppadilloummu-2988@gmail.com','H588540221069','Tianyi','Wang','state farm','12313'),('keigoippeipeitrei@icloud.com','25296257','Tianyi','Wang','state farm','12313'),('podducezesse-2447@icloud.com','26806489','Tianyi','Wang','state farm','12313'),('reikedezotru-1045@gmail.com','588203864','Tianyi','Wang','state farm','12313'),('test@gmail.com','a','Tianyi','Wang','state farm','12313'),('testpass@xxx.com','xxx','Tianyi','Wang','nananna','hahaha'),('testxxx@123.com','1233123','Tianyi','Wang','state farm','121212'),('trissaddeddoutoi-6616@163.com','002951620','Tianyi','Wang','state farm','12313'),('trujeigaulattou-7527@gmail.com','058600537','Tianyi','Wang','state farm','12313'),('wtianyi9802@163.com','13232324441','Tianyi','Wang','state farm','12313'),('xxxx@xxx.com','sa','Tianyi','Wang','23123','113133'),('yaudajedeikeu-3539@163.com','ND158958','Tianyi','Wang','state farm','12313'),('yaumewekoha-8071@yahoo.com','FDQWERL25495','Tianyi','Wang','state farm','12313');
/*!40000 ALTER TABLE `ltd_indi_cus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltd_invoice`
--

DROP TABLE IF EXISTS `ltd_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltd_invoice` (
  `invoice_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'the invoice id',
  `date` datetime NOT NULL COMMENT 'the invoice date',
  `amount` decimal(30,3) NOT NULL COMMENT 'the amount of this invoice',
  `record_id` bigint NOT NULL,
  PRIMARY KEY (`invoice_id`),
  UNIQUE KEY `ltd_invoice__idx` (`record_id`),
  CONSTRAINT `invoice_rent_record_fk` FOREIGN KEY (`record_id`) REFERENCES `ltd_rent_record` (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltd_invoice`
--

LOCK TABLES `ltd_invoice` WRITE;
/*!40000 ALTER TABLE `ltd_invoice` DISABLE KEYS */;
INSERT INTO `ltd_invoice` VALUES (1,'2019-06-18 00:00:00',60.000,1),(2,'2020-05-22 00:00:00',120.000,2),(3,'2020-10-11 00:00:00',100.000,3),(4,'2021-06-09 00:00:00',639.000,4),(5,'2021-06-20 00:00:00',480.000,5),(6,'2021-06-25 00:00:00',400.000,6),(7,'2021-06-27 00:00:00',190.000,7),(8,'2021-05-05 00:00:00',380.000,8),(9,'2022-01-11 00:00:00',95.000,9),(10,'2022-02-22 00:00:00',200.000,10);
/*!40000 ALTER TABLE `ltd_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltd_payment`
--

DROP TABLE IF EXISTS `ltd_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltd_payment` (
  `payment_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'the payment id',
  `payment_date` datetime NOT NULL COMMENT 'the date of this payment',
  `payment_status` varchar(30) NOT NULL COMMENT 'the status of this payment',
  `payment_type` varchar(30) NOT NULL COMMENT 'the payment type ( credit, debit, gift ) ',
  `card_no` varchar(30) NOT NULL COMMENT 'the card number ',
  `invoice_id` bigint NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `payment_invoice_fk` (`invoice_id`),
  CONSTRAINT `payment_invoice_fk` FOREIGN KEY (`invoice_id`) REFERENCES `ltd_invoice` (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltd_payment`
--

LOCK TABLES `ltd_payment` WRITE;
/*!40000 ALTER TABLE `ltd_payment` DISABLE KEYS */;
INSERT INTO `ltd_payment` VALUES (1,'2019-06-18 00:00:00','approved','credit card','4539727885860973',1),(2,'2020-05-22 00:00:00','approved','debit card','4929622139534755',2),(3,'2020-10-11 00:00:00','approved','debit card','4716035186596478613',3),(4,'2021-06-09 00:00:00','approved','credit card','2221007539255434',4),(5,'2021-06-20 00:00:00','approved','bebit card','5221766410559791',5),(6,'2021-06-25 00:00:00','approved','credit card','5512435899910044',6),(7,'2021-06-27 00:00:00','approved','credit card','373903761866783',7),(8,'2021-05-05 00:00:00','approved','debit card','348420970316866',8),(9,'2022-01-11 00:00:00','approved','credit card','372434040236961',9),(10,'2022-02-22 00:00:00','approved','credit card','6011961356280666',10);
/*!40000 ALTER TABLE `ltd_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltd_rent_record`
--

DROP TABLE IF EXISTS `ltd_rent_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltd_rent_record` (
  `record_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'the id of the record',
  `pickup_office_id` varchar(30) NOT NULL COMMENT 'the pick up location',
  `dropoff_office_id` varchar(30) NOT NULL COMMENT 'the drop off location',
  `pickup_date` datetime NOT NULL COMMENT 'the pick up date',
  `dropoff_date` datetime NOT NULL COMMENT 'the drop off date',
  `start_meter` decimal(30,0) NOT NULL COMMENT 'the start millage',
  `end_meter` decimal(30,0) NOT NULL COMMENT 'the end millage',
  `daliy_meter_limit` decimal(30,0) NOT NULL COMMENT 'the daily millage limit( if -1 then it''s unlimited)',
  `email` varchar(30) NOT NULL,
  `vin` varchar(30) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `rent_record_customer_fk` (`email`),
  KEY `rent_record_vehicle_fk` (`vin`),
  CONSTRAINT `rent_record_customer_fk` FOREIGN KEY (`email`) REFERENCES `ltd_customer` (`email`),
  CONSTRAINT `rent_record_vehicle_fk` FOREIGN KEY (`vin`) REFERENCES `ltd_vehicle` (`vin`),
  CONSTRAINT `dropoff_date` CHECK ((`dropoff_date` >= `pickup_date`))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltd_rent_record`
--

LOCK TABLES `ltd_rent_record` WRITE;
/*!40000 ALTER TABLE `ltd_rent_record` DISABLE KEYS */;
INSERT INTO `ltd_rent_record` VALUES (1,'1','1','2019-06-17 00:00:00','2019-06-18 00:00:00',12000,12300,500,'reikedezotru-1045@gmail.com','1N4DL01D2XC212827'),(2,'1','1','2020-05-20 00:00:00','2020-05-22 00:00:00',12000,12300,500,'wajougroulage-5993@yopmail.com','3VWPP7AJXDM655051'),(3,'2','2','2020-10-10 00:00:00','2020-10-11 00:00:00',10000,12300,-1,'pruppitrubuta-1541@outlook.com','1FTFW1ET9DFC24713'),(4,'3','3','2021-06-08 00:00:00','2021-06-09 00:00:00',15000,16089,500,'solujicifrou-1777@yopmail.com','1D7HU18206S690287'),(5,'4','4','2021-06-12 00:00:00','2021-06-20 00:00:00',10000,10700,-1,'trissaddeddoutoi-6616@163.com','1FTYR11E06PA11413'),(6,'5','5','2021-06-20 00:00:00','2021-06-25 00:00:00',9000,10700,-1,'naffureussofou-8723@nyu.edu','19UUA5648XA027300'),(7,'6','6','2021-06-25 00:00:00','2021-06-27 00:00:00',8000,8500,1000,'ceissazassuddeu-8182@nyu.edu','1J4GS48K86C205394'),(8,'7','7','2021-05-01 00:00:00','2021-05-05 00:00:00',8000,8500,1000,'crossinnaucagre@icloud.com','3GNAL2EK5DS687791'),(9,'8','8','2022-01-10 00:00:00','2022-01-11 00:00:00',8000,8500,1000,'keigoippeipeitrei@icloud.com','1FTCR10A0TUA90846'),(10,'9','9','2022-02-20 00:00:00','2022-02-22 00:00:00',8000,8500,1000,'hoppadilloummu-2988@gmail.com','JTEEP21A460119291');
/*!40000 ALTER TABLE `ltd_rent_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltd_vehicle`
--

DROP TABLE IF EXISTS `ltd_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltd_vehicle` (
  `vin` varchar(30) NOT NULL COMMENT 'the vin number of this vehicle',
  `make` varchar(30) NOT NULL COMMENT 'the make of this vehicle',
  `model` varchar(30) NOT NULL COMMENT 'the model of this vehicle',
  `year` bigint NOT NULL COMMENT 'the year of this vehicle',
  `license_plate_number` varchar(30) NOT NULL COMMENT 'the license plate number',
  `status` double NOT NULL COMMENT 'the renting status of this vehicle',
  `class_name` varchar(30) NOT NULL,
  `office_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`vin`),
  KEY `vehicle_vehicle_class_fk` (`class_name`),
  KEY `vehicle_wow_office_fk` (`office_id`),
  CONSTRAINT `vehicle_vehicle_class_fk` FOREIGN KEY (`class_name`) REFERENCES `ltd_vehicle_class` (`class_name`),
  CONSTRAINT `vehicle_wow_office_fk` FOREIGN KEY (`office_id`) REFERENCES `ltd_wow_office` (`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltd_vehicle`
--

LOCK TABLES `ltd_vehicle` WRITE;
/*!40000 ALTER TABLE `ltd_vehicle` DISABLE KEYS */;
INSERT INTO `ltd_vehicle` VALUES ('19UUA5648XA027300','BMW','X5',2015,'8CEW092',1,'SUV','5'),('1D7HU18206S690287','Audi','A4',2010,'XSZ904',1,'small car','3'),('1FTCR10A0TUA90846','Ford','Mustang',2018,'CLD6169',1,'convertable','8'),('1FTFW1ET9DFC24713','Audi','RS',2011,'9682TX',1,'race car','2'),('1FTYR11E06PA11413','Toyota','Camery',2007,'6L83236',1,'mid size car','4'),('1J4GS48K86C205394','BMW','M1',2010,'BGS536',1,'convertable','6'),('1N4DL01D2XC212827','Nissan','Maxima',2010,'SC39724',1,'mid size car','1'),('3FA6P0LUXER272699','Aston Martin','Valkyrie',2022,'BB9749',1,'race car','1'),('3GNAL2EK5DS687791','Ford','Mustang',2014,'GML5411',1,'convertable','7'),('3VWPP7AJXDM655051','Nissan','Maxima',2011,'DV38576',1,'mid size car','1'),('JM1BK144671795114','Aston Martin','DB11',2020,'7SKX652',1,'race car','9'),('JTEEP21A460119291','Lamborghini','AVENTADOR',2019,'6BPC403',1,'race car','9'),('KNAGM4A79B5148561','Lamborghini','URUS',2019,'412SKB',1,'SUV','9');
/*!40000 ALTER TABLE `ltd_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltd_vehicle_class`
--

DROP TABLE IF EXISTS `ltd_vehicle_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltd_vehicle_class` (
  `class_name` varchar(30) NOT NULL COMMENT 'the class name',
  `rental_rate` decimal(10,2) NOT NULL COMMENT 'rental rate',
  `over_millage_fee` decimal(10,2) NOT NULL COMMENT 'the over millage fee',
  PRIMARY KEY (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltd_vehicle_class`
--

LOCK TABLES `ltd_vehicle_class` WRITE;
/*!40000 ALTER TABLE `ltd_vehicle_class` DISABLE KEYS */;
INSERT INTO `ltd_vehicle_class` VALUES ('convertable',95.00,8.00),('electricity car',105.00,10.00),('large car',70.00,3.00),('mid size car',60.00,2.00),('Mini Van',90.00,7.00),('Premium SUV',85.00,6.00),('race car',100.00,9.00),('small car',50.00,1.00),('SUV',80.00,5.00),('truck',75.00,4.00);
/*!40000 ALTER TABLE `ltd_vehicle_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltd_wow_office`
--

DROP TABLE IF EXISTS `ltd_wow_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltd_wow_office` (
  `office_id` varchar(30) NOT NULL COMMENT 'the office id ',
  `office_name` varchar(30) NOT NULL COMMENT 'the name of this office',
  `phone` varchar(30) NOT NULL COMMENT 'the phone number of this office',
  `street` varchar(30) NOT NULL COMMENT 'the street of this office',
  `city` varchar(30) NOT NULL COMMENT 'the city of this office',
  `state` varchar(30) NOT NULL COMMENT 'the state of this office',
  `zip` decimal(30,0) NOT NULL COMMENT 'the zip code of this office',
  PRIMARY KEY (`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltd_wow_office`
--

LOCK TABLES `ltd_wow_office` WRITE;
/*!40000 ALTER TABLE `ltd_wow_office` DISABLE KEYS */;
INSERT INTO `ltd_wow_office` VALUES ('1','A office','8156222725','lombardy street','Landilne','IL',7281),('10','J office','3153086474','pavonia avenue','jesus city','NJ',7306),('2','B office','3233438342','sunset avenue','caliform','CA',17782),('3','C office','7347837284','hasker streer','centre city','MI',992871),('4','D office','8172624391','axe first','sandy county','TX',274627),('5','E office','9193961849','st kings','matilda city','NC',872733),('6','F office','3372703067','st david','leon village','LA',165887),('7','G office','5079265194','st mary','jasmin city','MN',766437),('8','H office','3346451904','greate jhson','lagard','AL',8892),('9','I office','9704656295','loiuse street','swiiss county','CO',727661);
/*!40000 ALTER TABLE `ltd_wow_office` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-05 15:31:05
