-- MySQL dump 10.13  Distrib 5.7.13, for Win64 (x86_64)
--
-- Host: localhost    Database: parknshop
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `ad`
--

DROP TABLE IF EXISTS `ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad` (
  `ADId` int(11) NOT NULL AUTO_INCREMENT,
  `ADType` int(11) NOT NULL,
  `ADStatus` int(11) NOT NULL,
  `otherId` int(11) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  `ADName` varchar(256) NOT NULL,
  `ADPhotoUrl` varchar(256) NOT NULL,
  `ADDescription` varchar(255) NOT NULL,
  `ADPrice` float NOT NULL,
  `ADStartDate` datetime NOT NULL,
  `ADTime` int(11) NOT NULL,
  PRIMARY KEY (`ADId`),
  KEY `FK_Reference_16` (`adminId`),
  CONSTRAINT `FK_Reference_166` FOREIGN KEY (`adminId`) REFERENCES `admins` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad`
--

LOCK TABLES `ad` WRITE;
/*!40000 ALTER TABLE `ad` DISABLE KEYS */;
INSERT INTO `ad` VALUES (15,2,2,1,1,'qweqwe','33540c1e6ba249e9b98908ec03154156.png','qweqweqwe',200,'2018-01-05 19:26:02',1),(16,2,2,1,1,'123123','e3d8e240e92b40c58e6c654bc210fa2d.png','1231231',200,'2018-01-05 19:26:35',1),(17,2,2,1,1,'123123','1258e52aaf574bb18a963acb4181d77a.png','31123123213',22462400,'2018-01-05 19:36:24',112312),(18,1,2,33,1,'123','5250a301289d45ad95fdf49a3cffcdc0.jpg','1231',100,'2018-01-07 13:31:41',1),(19,1,2,34,1,'ooo','6eca723b37d744cf86a0db75121772cb.jpg','yugyuvu',700,'2018-01-07 13:33:46',7),(20,3,2,36,1,'samsung','91063e8a38594a85b22e08b239ff9307.jpg','123',1100,'2018-01-07 13:42:48',11);
/*!40000 ALTER TABLE `ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `adminAccount` varchar(256) NOT NULL,
  `adminPassword` varchar(256) NOT NULL,
  `adminName` varchar(256) NOT NULL,
  `adminBalance` float NOT NULL DEFAULT '0',
  `adminPhone` varchar(45) NOT NULL,
  `adminStatus` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`adminId`),
  KEY `adminAccount` (`adminAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin','admin','admin',3527.46,'12345678910',1),(2,'admin2','admin2','admin2',0,'110',0),(3,'admin3','admin3','admin3',0,'1111111111',0);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backuphistory`
--

DROP TABLE IF EXISTS `backuphistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backuphistory` (
  `backupId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `backupAccount` varchar(255) NOT NULL,
  `backupDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `backupFilePath` varchar(255) NOT NULL,
  PRIMARY KEY (`backupId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backuphistory`
--

LOCK TABLES `backuphistory` WRITE;
/*!40000 ALTER TABLE `backuphistory` DISABLE KEYS */;
INSERT INTO `backuphistory` VALUES (24,'','2018-01-07 14:39:54','C:\\Users\\Kevin_coco\\Desktop\\GitProject\\ParkNShop\\Backup/_2018_01_07_14_39_54.sql');
/*!40000 ALTER TABLE `backuphistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer` (
  `buyerId` int(11) NOT NULL AUTO_INCREMENT,
  `buyerAccount` varchar(25) NOT NULL,
  `buyerName` varchar(25) NOT NULL,
  `buyerAddress` varchar(100) NOT NULL,
  `buyerPhone` varchar(45) NOT NULL,
  `buyerPassword` varchar(20) NOT NULL,
  `buyerStatus` int(11) NOT NULL,
  `buyerBalance` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`buyerId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
INSERT INTO `buyer` VALUES (2,'buyer2','buye2','buy2address','123456','buyer2',1,0),(3,'buyer3','buyer3','buy3address','123456788910','buyer3',2,0),(4,'buyer4','buyer4','buy4address','123456788910','buyer4',2,0),(5,'buyer5','buyer5','buy5address','123456788910','buyer5',3,0),(6,'buyer6','buyer6','bue6address','1234','buyer6',1,0),(7,'1112@qq.com','buybuybuy','haitang8','13522212111','111',1,0),(8,'cxh@qq.com','buyerbuyerer','xidianUniversity','15002972015','1234',1,0);
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `content` varchar(512) NOT NULL,
  `reply` varchar(512) NOT NULL,
  `commentTime` datetime NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `productId_idx` (`productId`),
  CONSTRAINT `productIdComment` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `buyerId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `content` varchar(512) NOT NULL,
  `reply` varchar(512) DEFAULT NULL,
  `commentTime` datetime NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `FK_Reference_18` (`buyerId`),
  KEY `FK_Reference_23` (`productId`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`buyerId`) REFERENCES `buyer` (`buyerId`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,8,33,'good 666 very good','MMPwodelaogeworinima6665554432jhvbskjvbkjfsdv kf vk ','2018-01-01 21:08:23'),(2,8,33,'32432','MMP','2018-01-02 15:30:21');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commission`
--

DROP TABLE IF EXISTS `commission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commission` float NOT NULL,
  `operatoraccount` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `operatoraccount` (`operatoraccount`),
  KEY `commission` (`commission`),
  CONSTRAINT `operatoraccount` FOREIGN KEY (`operatoraccount`) REFERENCES `admins` (`adminAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commission`
--

LOCK TABLES `commission` WRITE;
/*!40000 ALTER TABLE `commission` DISABLE KEYS */;
INSERT INTO `commission` VALUES (1,0.2,'admin','2017-12-16 08:34:56'),(2,0.3,'admin','2017-12-16 09:05:32'),(3,0.35,'admin','2017-12-16 09:08:36'),(4,0,'admin','2017-12-17 12:15:24'),(5,0.02,'admin','2017-12-26 01:38:16'),(6,0.03,'admin','2017-12-26 01:38:35'),(7,0.02,'admin','2017-12-26 03:16:52'),(8,0.1,'admin2','2017-12-30 12:44:39'),(9,0.02,'admin2','2018-01-05 04:45:06');
/*!40000 ALTER TABLE `commission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favouriteproduct`
--

DROP TABLE IF EXISTS `favouriteproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favouriteproduct` (
  `favorProductId` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `buyerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`favorProductId`),
  KEY `FK_Reference_22` (`buyerId`),
  KEY `FK_Reference_6` (`productId`),
  CONSTRAINT `FK_Reference_22` FOREIGN KEY (`buyerId`) REFERENCES `buyer` (`buyerId`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favouriteproduct`
--

LOCK TABLES `favouriteproduct` WRITE;
/*!40000 ALTER TABLE `favouriteproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `favouriteproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favouriteshop`
--

DROP TABLE IF EXISTS `favouriteshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favouriteshop` (
  `favouriteShopId` int(11) NOT NULL AUTO_INCREMENT,
  `sellerId` int(11) DEFAULT NULL,
  `buyerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`favouriteShopId`),
  KEY `FK_Reference_21` (`buyerId`),
  KEY `FK_Reference_8` (`sellerId`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`buyerId`) REFERENCES `buyer` (`buyerId`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`sellerId`) REFERENCES `seller` (`sellerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favouriteshop`
--

LOCK TABLES `favouriteshop` WRITE;
/*!40000 ALTER TABLE `favouriteshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `favouriteshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderCommissionId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `sellerId` int(11) DEFAULT NULL,
  `buyerId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `totalPrice` float NOT NULL,
  `address` varchar(45) NOT NULL,
  `orderStatus` int(11) NOT NULL,
  `orderTime` datetime NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FK_Reference_14` (`buyerId`),
  KEY `FK_Reference_2` (`sellerId`),
  KEY `FK_Reference_24` (`productId`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`buyerId`) REFERENCES `buyer` (`buyerId`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`sellerId`) REFERENCES `seller` (`sellerId`),
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,57,9,8,18,1,49.99,'121312131',1,'2017-12-25 21:45:39'),(1,60,9,8,18,1,49.99,'121312131',4,'2017-12-26 01:37:19'),(1,61,9,8,19,1,56.48,'121312131',5,'2017-12-26 01:37:19'),(1,63,14,8,36,1,1297.99,'xidianUniversity',5,'2017-12-26 09:47:48'),(1,64,14,8,34,1,99.99,'xidianUniversity',5,'2017-12-26 10:10:47'),(1,65,14,8,34,21,2099.79,'xidianUniversity',5,'2017-12-26 11:19:28'),(1,66,14,8,35,0,0,'xidianUniversity',1,'2017-12-28 10:39:05'),(1,67,8,8,17,10,879.9,'xidianUniversity',1,'2017-12-28 12:26:25'),(1,68,9,8,18,1,49.99,'xidianUniversity',3,'2018-01-01 21:25:43'),(1,69,9,8,19,1,56.48,'xidianUniversity',3,'2018-01-01 21:25:45'),(1,70,10,8,22,4,199.96,'xidianUniversity',1,'2018-01-03 18:56:58'),(1,71,10,8,23,1,149.99,'xidianUniversity',1,'2018-01-03 18:57:00'),(1,72,9,8,18,1,49.99,'xidianUniversity',3,'2018-01-05 10:59:19'),(1,73,9,2,18,11,549.89,'buy2address',3,'2018-01-05 11:00:22'),(1,74,9,2,19,1,56.48,'buy2address',3,'2018-01-05 11:00:35'),(1,75,10,2,22,1,49.99,'buy2address',5,'2018-01-05 11:05:10');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productStatus` int(11) NOT NULL,
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `sellerId` int(11) DEFAULT NULL,
  `productName` varchar(512) NOT NULL,
  `productType` int(11) NOT NULL,
  `productPrice` float NOT NULL,
  `storeCount` int(11) NOT NULL,
  `soldCount` int(11) NOT NULL,
  `productIntroduction` varchar(1024) NOT NULL,
  `productPicture` varchar(512) NOT NULL,
  PRIMARY KEY (`productId`),
  KEY `FK_Reference_25` (`sellerId`),
  CONSTRAINT `FK_Reference_25` FOREIGN KEY (`sellerId`) REFERENCES `seller` (`sellerId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (0,15,8,'Wireless Bluetooth V4.0 Portable Speaker',5,34.99,999,0,' DOSS touch portable speaker makes it easy to control the mood and energy of any party by giving you fingertip control of the tracks you\'re playing, their volume and more.\r\n  Enjoy a high definition stereo sound with an impressive volume whether you\'re lounging around the house, or partying, walking out, camping, hiking, biking.','9e7d18fce952497a84bc320819709273.jpg'),(0,16,8,'Bose Solo 15 Series II TV Sound System',5,279,1900,0,'The Bose Solo 15 Series II TV sound system is a one-piece speaker that delivers dramatically better sound than your TV. Advanced Bose technologies make each word and detail sound clear at any volume, and create an experience that\'s wider than the screen. The system also produces impressive bass that adds impact to your shows. And when you want even more clarity, dialogue mode makes every word easier to hear without having to adjust the volume from scene to scene. Setup is easy, with just one connection to your TV. The system fits under most TVs up to 50 inches yet is still small enough to place on an open shelf. It features Bluetooth connectivity, so you can stream music wirelessly, and includes a universal remote.','3173cf8ecd8843b09c75273d0399207d.jpg'),(0,17,8,'Car DVR Dash Cam 2.4” ',5,87.99,1900,0,'Item: Neutra lDAB211\r\nFeature: Ambarella A12A55+2.31\"LCD+2 DDR3+1Gbit flash+OV4689+Lens TRC-2045E1(diameter14MM)\r\nDiagonal angle 143° wide angle \r\nMax. video resolution: 2560x1440 30P / HDR 2560x1440 30P/ 2304x1296 30P / 1920*1080 60P/ 1920*1080 30P/HDR 1920*1080 \r\nVideo coding format: MP4\r\nPixels4M/8M/14M/16M \r\nPhoto format: JPG \r\nBattery: 400MA/3.7V','6081d80115d94bac881f873f4b0d9413.jpg'),(0,18,9,'Fire HD 8 Tablet with Alexa',2,49.99,10,0,'The next generation of our best-reviewed Fire tablet, with up to 12 hours of battery life, a vibrant 8\" HD display, a 1.3 GHz quad-core processor, 1.5 GB of RAM, and Dolby Audio. More durable than the latest iPad.','0d5bf02173224f379a8c0e4aa9c4ebb6.jpg'),(0,19,9,'RCA Voyager PRO 7 with two cores',2,56.48,565,0,'Introducing the RCA Voyager Pro 7-inch Google Certified Tablet with keyboard case. Operating on Android\'s sweetest operating system yet, Android 5.0 (Lollipop), you can enjoy more of what the Google Play store has to offer.','8196bd6d99c94a959a6c532b4914042c.jpg'),(0,20,9,'Certified Refurbished Fire HD 10 Tablet',2,89.99,560,0,'The fast quad-core processor consists of two high-performance 1.5 GHz cores and two 1.2 GHz cores running simultaneously for quick app launches, smooth games and videos, and great overall performance.','7a2da7b4af55490ca76455e38af38fdb.jpg'),(0,21,9,'NeuTab 7\'\' Quad Core WIFI Tablet PC',2,44.99,890,0,'The 7 inch screen is proven to be the most popular and practical screen size that makes your hand comfortable as well as your mind. And NeuTab N7 Pro feathers the 7 inch HD screen and the powerful Quad Core Processor.','1425e195f69944ba872df12998b3ca21.jpg'),(0,22,10,'BLU Advance A5 -UnlockedSmartphone',3,49.99,94,0,'Introducing new Advance A5, designated with a perfect blend of style and function. The Advance 5A offers a clean and Sexy looking smartphone. Available in metal Black, the Advance A5 incorporated a flawless and enhanced metal housing.','c9426455d3d44d4fa35800c9fe593bd3.jpg'),(0,23,10,'Huawei Honor 6X Unlocked Smartphone',3,149.99,808,0,'Honor has created a device that gives a double dose of what you would expect of a smart device. With the Honor 6x’s dual-lens 12MP + 2MP rear camera and ultra-fast focus time of 0.3 seconds you can capture colorful HD photos day or night. To double the camera capability, the Honor 6x also features a wide aperture range (F/0.95-F/16) that allows for a professional-grade shallow depth of field effect (blurred Background). the 6x\'s Octa-core processor(16nm) and 3GB RAM, in addition to its smart file system allows for seamlessly running Multiple apps at the same time.','1a633f8e6c7d49678681fbc2ca989b38.jpg'),(0,24,10,' Le S3 Unlocked Dual-SIM Smartphone',3,129.99,999,0,'From fast processing to a generous 5.5-inch display and award-winning CDLA audio technology, your Le S3 is built to deliver the ultimate mobile entertainment experience. Le S3 delivers best-in-class performance by combining the Qualcomm Snapdragon 652 processor, 3GB memory, 32GB onboard storage and LTE-A connectivity. 16MP main and 8MP selfie cameras deliver high resolution photos and videos, paired with an intelligent fingerprint scanner that also acts as a camera shutter button.','af2bf7004a2a4bed984b1635148aaed6.jpg'),(0,25,10,'Razer Phone with dual Camera',3,699.99,677,0,'The World’s First 120Hz Ultra Motion Display for smoother and truer graphics. Audio is powered by Dolby ATMOS and certified by THX for a true cinematic audio experience. Qualcomm Snapdragon 835 with 8GB RAM for optimized performance. **The Razer Phone is a GSM-compatible unlocked phone.','2a342d849eec454194798f8e727ba0d8.jpg'),(0,26,11,'Sony a7R III 42.4MP Full-frame',4,149,890,0,'Thanks to an evolutionary leap in image processing power and efficiency, the a7R III combines a high-resolution 42.4 MP back-illuminated Exmor R CMOS image sensor with impressive shooting speeds at up to 10 fps with full AF/AE tracking, as well as beautiful 4K HDR video quality, wide 15-stop dynamic range and high sensitivity with noise reduction of almost a full stop.','92abf9ea216645729d865331b65203af.jpg'),(0,27,11,'Sony Alpha 6000 Mirrorless Camera',4,498,890,0,'79-point focal plane phase-detection AF sensor. The compact, lightweight camera delivers superb image quality - via newly developed 24.3-effective-megapixel (approx.) Exmor APS HD CMOS sensor and BIONZ X image processing engine - as well as highly intuitive operation thanks to an OLED Tru-Finder and two operation dials.\r\n','3a77dc8ba9fc4088b4c893dd15d60834.jpg'),(0,28,11,'Sony SEL35F18 35mm f/1.8 Prime',4,398,878,0,'High performance and a compact design make the SEL-35F18 an ideal “second lens” that is easy to carry around when capturing the action. It’s ideal for a wide variety of photos, including snapshots while strolling, night shots (thanks to the bright maximum aperture) and portraits with superb background/foreground blur.','4dfc6f52a7244483b4cf830e45f171b8.jpg'),(0,29,11,'Sony DSCW800/B 20.1 MP Camera',4,888,890,0,'Sony DSCW800/B 20.1 MP Digital Camera with 2.7-Inch LCD (black)','b0e53487ff134aab8380652031f5fbc3.jpg'),(0,30,13,'Fitness Track Hostate WaterproofActivity',8,30.99,345,0,'14 popular sports modes meet your daily needs\r\nHeart Rate Monitor/Private Health Tracker\r\nWith Camera& Music Control','cc3be59a933543b78a620fe7f0fa76c4.jpg'),(0,31,13,'Slim Fitness Tracker Watch',8,78,677,0,'See time and date by tapping the bright LED display; Slim and stylish design with only 18g, it also suits for kids; No charging cable needed.\r\nAutomatically tracking your steps, distance and calories burning, by tapping the LED display to see the data easily.','f2cafc72fc874d509be9255ceac1a539.jpg'),(0,32,13,'WOWGO Women Sport  Smart Watch',8,80,23,0,'sync date and time, music control, distance tracking, notifications, remote camera control, anti-lost alert, find Phone, sports and health recording; Incoming call and sms reminder,Social software,message reminder, sedentary reminder','845d4729c45e4fada89c080cd32298e7.jpg'),(0,33,14,'DVD   Player    with     Swivel Screen',1,78,89,0,'COMPARED WITH PREVIOUS VERSIONS, THE NEW GENERATION 9.5 INCH PORTABLE DVD PLAYER: 1. Lightweight and more portable than the previous generation 2. Built-in virtual remote make sure you can use all the function even though the remote control is miss 3. 5ft car cord (Longer enough) make sure you can charge your device while you are watching a movie on car rides 4.Dull polish technology can avoid the fingerprint Product Description： Vivid Swivel Display： Our vivid 9.5 inch TFT color display provide crystal clear visibility.','5250a301289d45ad95fdf49a3cffcdc0.jpg'),(0,34,14,' T20 1500 Lumens LCD Mini Projector',1,99.99,777,0,'DBPOWER 1500 lumens mini video projector , do you want to have amazing watching experience at home? DBPOWER mini video projector is your best choice at a reasonable price, which has high fidelity images and focusing function.','6eca723b37d744cf86a0db75121772cb.jpg'),(0,35,14,'Home Video Theater Game Office ',1,439,568,0,'◆Connectivity Technology:Wifi/Buletooth/HDMI/VGA/USB/AV/Audio/SD/Keyboard/TF\r\n\r\n◆Contrast Ratio:3000:1\r\n\r\n◆Item Dimensions: 6.8*4.0*1.1\r\n\r\n◆Item Weight:0.98lbs\r\n\r\n◆Resolution:Native 1280x720, Support 1080p','33d7c939cfaf4c8bb8d688734c453d0b.jpg'),(0,36,14,'Samsung Electronics UN65MU8000',1,1297.99,8000,0,'Every scene deserves a brilliant picture. Experience lifelike color with a billion more shades than regular 4K UHD and enjoy the expanded depth of HDR. With extreme contrast between the darkest darks and lightest lights, you never miss a detail. MR 240 brings fast action to life, and you can take it all in on a TV that\'s streamlined from every angle- from a sleek frame to a clean back.','91063e8a38594a85b22e08b239ff9307.jpg'),(1,37,1,'shit',1,0.88,9998,0,'a piece of shit','21cc31a7ae724f6f91beade2b5451c93.jpg'),(1,38,1,'keda',4,123,123,0,'dshbcksdjbc','c37586ac87404b139fe67a04319c4e5e.jpg'),(1,39,8,'vuyvuyu',1,3.4444,33,0,'3333cweverv','44b550f6633d4cdfbb4bed2c50f5acd2.png');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productad`
--

DROP TABLE IF EXISTS `productad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productad` (
  `productADId` int(11) NOT NULL AUTO_INCREMENT,
  `sellerId` int(11) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  `productADName` varchar(256) NOT NULL,
  `productADPhotoUrl` varchar(256) NOT NULL,
  `productADClickUrl` varchar(256) NOT NULL,
  `productADPrice` float NOT NULL,
  `productADStartDate` datetime NOT NULL,
  `productADEndDate` datetime NOT NULL,
  PRIMARY KEY (`productADId`),
  KEY `FK_Reference_12` (`sellerId`),
  KEY `FK_Reference_16` (`adminId`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`sellerId`) REFERENCES `seller` (`sellerId`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`adminId`) REFERENCES `admins` (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productad`
--

LOCK TABLES `productad` WRITE;
/*!40000 ALTER TABLE `productad` DISABLE KEYS */;
/*!40000 ALTER TABLE `productad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `sellerAddress` varchar(512) NOT NULL,
  `sellerId` int(11) NOT NULL AUTO_INCREMENT,
  `sellerName` varchar(45) NOT NULL,
  `shopName` varchar(45) NOT NULL,
  `sellerPassword` varchar(45) NOT NULL,
  `sellerEmail` varchar(45) NOT NULL,
  `sellerPhone` varchar(45) NOT NULL,
  `sellerBalance` float NOT NULL DEFAULT '0',
  `shopIntroduction` varchar(512) NOT NULL,
  `shopStatus` int(11) NOT NULL,
  PRIMARY KEY (`sellerId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES ('Beijing',1,'Aj','Aj\'s Shop','111','123@123.com','12345678910',0,'a shop',1),('ShangHai',2,'Aj2','Aj2\'s Shop','111','1234@123.com','12345678911',0,'a shop',1),('Xian',3,'Aj3','Aj3\'s Shop','111','12345@123.com','12345678912',0,'a shop',2),('Tianjing',5,'aa2','aa2\'s Shop','111','1234567@123.com','12345678914',0,'a shop',0),('Wuhan',6,'ban','ban\'s Shop','111','131232345678@123.com','12345678915',0,'a shop',0),('Chengdu',7,'seller666','seller\'s shop','123','123@666.com','13522111235',0,'I am a illegal shop.',3),('Chongqing',8,'Audio','Audio\'s shop','111','123@1.com','15002972015',0,'This is an Audio shop',1),('Guangzhou',9,'Computer','Computer\'s shop','111','123@2.com','15002976789',166.051,'This is an Computer\'s shop',1),('HongKong',10,'Cellphone','Cellphone\'s shop','111','123@3.com','15002020202',4.999,'This is a Cellphone',1),('Hangzhou',11,'Camera','Camera\'s shop','111','123@4.com','15002972016',0,'This is a Camera shop',1),('Nanjing',13,'Health','Health\'s shop','111','123@5.com','15627788822',0,'This is a Health shop',1),('Shenzhen',14,'Television','Television\'s shop','111','123@6.com','15678892020',3427.81,'This is a television shop',1),('250250250',15,'wasngdachui','wanwanmeixiangdao','111','qwe@qwe','13211111111',0,'dsfgfdsgdfgbdf',0);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellerblacklist`
--

DROP TABLE IF EXISTS `sellerblacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellerblacklist` (
  `sellerBlackListId` int(11) NOT NULL AUTO_INCREMENT,
  `sellerId` int(11) DEFAULT NULL,
  `buyerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`sellerBlackListId`),
  KEY `FK_Reference_10` (`sellerId`),
  KEY `FK_Reference_17` (`buyerId`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`sellerId`) REFERENCES `seller` (`sellerId`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`buyerId`) REFERENCES `buyer` (`buyerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellerblacklist`
--

LOCK TABLES `sellerblacklist` WRITE;
/*!40000 ALTER TABLE `sellerblacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellerblacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopad`
--

DROP TABLE IF EXISTS `shopad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopad` (
  `shopADId` int(11) NOT NULL AUTO_INCREMENT,
  `sellerId` int(11) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  `shopADName` varchar(512) NOT NULL,
  `shopADPhotoUrl` varchar(512) NOT NULL,
  `shopADClickUrl` varchar(512) NOT NULL,
  `shopADPrice` float NOT NULL,
  `shopADStartDate` datetime NOT NULL,
  `shopADEndDate` datetime NOT NULL,
  PRIMARY KEY (`shopADId`),
  KEY `FK_Reference_19` (`sellerId`),
  KEY `FK_Reference_20` (`adminId`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`sellerId`) REFERENCES `seller` (`sellerId`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`adminId`) REFERENCES `admins` (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopad`
--

LOCK TABLES `shopad` WRITE;
/*!40000 ALTER TABLE `shopad` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-07 14:39:57
