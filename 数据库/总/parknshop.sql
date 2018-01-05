/*
Navicat MySQL Data Transfer

Source Server         : ParkNShop
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : parknshop

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-01-04 22:38:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
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
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`adminId`) REFERENCES `admins` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ad
-- ----------------------------
INSERT INTO `ad` VALUES ('2', '2', '3', '1', '1', 'testAD', 'https://www.baidu.com', 'ADDescription', '1000', '2018-01-02 12:15:07', '10');
INSERT INTO `ad` VALUES ('3', '2', '2', '1', '1', 'testAD', 'https://www.baidu.com', 'ADDescription', '1000', '2018-01-02 12:15:07', '10');
INSERT INTO `ad` VALUES ('4', '1', '2', '1', '1', 'testAD', 'https://www.baidu.com', 'ADDescription', '1000', '2018-01-04 17:48:17', '10');
INSERT INTO `ad` VALUES ('5', '1', '2', '1', '1', 'testAD', 'https://www.baidu.com', 'ADDescription', '1000', '2018-01-02 12:15:07', '10');
INSERT INTO `ad` VALUES ('6', '1', '2', '1', '1', 'testAD', 'https://www.baidu.com', 'ADDescription', '1125', '2018-01-04 12:15:07', '10');
INSERT INTO `ad` VALUES ('7', '1', '2', '1', '1', 'testAD', 'https://www.baidu.com', 'ADDescription', '1328', '2018-01-04 12:15:07', '10');
INSERT INTO `ad` VALUES ('8', '1', '2', '1', '1', 'testAD', 'https://www.baidu.com', 'ADDescription', '1256', '2018-01-04 12:15:07', '10');
INSERT INTO `ad` VALUES ('9', '1', '2', '1', '1', 'testAD', 'https://www.baidu.com', 'ADDescription', '1565', '2018-01-04 12:15:07', '10');
INSERT INTO `ad` VALUES ('10', '1', '2', '1', '1', 'testAD', 'https://www.baidu.com', 'ADDescription', '1656', '2018-01-04 12:15:07', '10');

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'admin', 'admin', '1.98', '12345678910', '1');
INSERT INTO `admins` VALUES ('2', 'admin2', 'admin2', 'admin2', '0', '110', '1');

-- ----------------------------
-- Table structure for backuphistory
-- ----------------------------
DROP TABLE IF EXISTS `backuphistory`;
CREATE TABLE `backuphistory` (
  `backupId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `backupAccount` varchar(255) NOT NULL,
  `backupDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `backupFilePath` varchar(255) NOT NULL,
  PRIMARY KEY (`backupId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backuphistory
-- ----------------------------
INSERT INTO `backuphistory` VALUES ('5', 'admin2', '2017-12-31 16:53:31', 'C:/Users/Kevin_coco/Desktop/GitProject/ParkNShop/Backup/admin2_2017_12_31_16_53_30.sql');
INSERT INTO `backuphistory` VALUES ('8', 'admin', '2018-01-02 11:40:27', 'C:\\Users\\Kevin_coco/Desktop/GitProject/ParkNShop/Backup/admin_2018_01_02_11_40_27.sql');
INSERT INTO `backuphistory` VALUES ('9', 'admin2', '2018-01-02 11:47:12', 'C:\\Users\\Kevin_coco/Desktop/GitProject/ParkNShop/Backup/admin2_2018_01_02_11_47_12.sql');
INSERT INTO `backuphistory` VALUES ('10', '', '2018-01-02 16:17:37', 'C:\\Users\\TAD/Desktop/GitProject/ParkNShop/Backup/_2018_01_02_16_17_37.sql');
INSERT INTO `backuphistory` VALUES ('11', '', '2018-01-02 16:20:50', 'C:\\Users\\TAD/Desktop/GitProject/ParkNShop/Backup/_2018_01_02_16_20_49.sql');
INSERT INTO `backuphistory` VALUES ('12', '', '2018-01-02 16:24:12', 'D:\\CodeTools\\Tomcat\\bin/Desktop/GitProject/ParkNShop/Backup/_2018_01_02_16_24_12.sql');
INSERT INTO `backuphistory` VALUES ('13', '', '2018-01-02 16:40:28', 'D:\\Code\\Java\\ParkNShop\\Code\\ParkNShop\\target\\ParkNShop\\Backup/_2018_01_02_16_40_27.sql');
INSERT INTO `backuphistory` VALUES ('14', '', '2018-01-02 16:43:55', 'D:\\Code\\Java\\ParkNShop\\Code\\ParkNShop\\target\\ParkNShop\\Backup/_2018_01_02_16_43_54.sql');
INSERT INTO `backuphistory` VALUES ('15', '', '2018-01-02 16:45:30', 'D:\\Code\\Java\\ParkNShop\\CBackup/_2018_01_02_16_45_30.sql');
INSERT INTO `backuphistory` VALUES ('16', '', '2018-01-02 16:46:24', 'D:\\Code\\Java\\ParkNShop\\Backup/_2018_01_02_16_46_24.sql');
INSERT INTO `backuphistory` VALUES ('17', '', '2018-01-02 16:47:47', 'D:\\Code\\Java\\ParkNShop\\Backup/_2018_01_02_16_47_47.sql');
INSERT INTO `backuphistory` VALUES ('18', '', '2018-01-02 16:48:39', 'D:\\Code\\Java\\ParkNShop\\Backup/_2018_01_02_16_48_39.sql');
INSERT INTO `backuphistory` VALUES ('19', '', '2018-01-02 16:49:39', 'D:\\Code\\Java\\ParkNShop\\Backup/_2018_01_02_16_49_38.sql');
INSERT INTO `backuphistory` VALUES ('20', '', '2018-01-02 16:51:06', 'D:\\Code\\Java\\ParkNShop\\Backup/_2018_01_02_16_51_06.sql');
INSERT INTO `backuphistory` VALUES ('21', '', '2018-01-04 16:06:16', 'D:\\Code\\Java\\ParkNShop\\Backup/_2018_01_04_16_06_15.sql');
INSERT INTO `backuphistory` VALUES ('22', '', '2018-01-04 16:07:11', 'D:\\Code\\Java\\ParkNShop\\Backup/_2018_01_04_16_07_11.sql');
INSERT INTO `backuphistory` VALUES ('23', '', '2018-01-04 16:08:41', 'D:\\Code\\Java\\ParkNShop\\Backup/_2018_01_04_16_08_40.sql');
INSERT INTO `backuphistory` VALUES ('24', '', '2018-01-04 16:11:06', 'D:\\Code\\Java\\ParkNShop\\Backup/_2018_01_04_16_11_05.sql');

-- ----------------------------
-- Table structure for buyer
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
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

-- ----------------------------
-- Records of buyer
-- ----------------------------
INSERT INTO `buyer` VALUES ('2', 'buyer2', 'buye2', 'buy2address', '123456', 'buyer2', '1', '0');
INSERT INTO `buyer` VALUES ('3', 'buyer3', 'buyer3', 'buy3address', '123456788910', 'buyer3', '2', '0');
INSERT INTO `buyer` VALUES ('4', 'buyer4', 'buyer4', 'buy4address', '123456788910', 'buyer4', '2', '0');
INSERT INTO `buyer` VALUES ('5', 'buyer5', 'buyer5', 'buy5address', '123456788910', 'buyer5', '3', '0');
INSERT INTO `buyer` VALUES ('6', 'buyer6', 'buyer6', 'bue6address', '1234', 'buyer6', '1', '0');
INSERT INTO `buyer` VALUES ('7', '1112@qq.com', 'buybuybuy', '12311123', '13522212111', '111', '1', '0');
INSERT INTO `buyer` VALUES ('8', 'cxh@qq.com', 'buybuybuybuy', '1223344555', '12234455555', '1234', '1', '0');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `buyerId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `content` varchar(512) NOT NULL,
  `reply` varchar(512) DEFAULT NULL,
  `commentTime` datetime NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `FK_Reference_18` (`buyerId`),
  KEY `FK_Reference_23` (`productId`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`buyerId`) REFERENCES `buyer` (`buyerId`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for commission
-- ----------------------------
DROP TABLE IF EXISTS `commission`;
CREATE TABLE `commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commission` float NOT NULL,
  `operatoraccount` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `operatoraccount` (`operatoraccount`),
  KEY `commission` (`commission`),
  CONSTRAINT `operatoraccount` FOREIGN KEY (`operatoraccount`) REFERENCES `admins` (`adminAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commission
-- ----------------------------
INSERT INTO `commission` VALUES ('1', '0.02', 'admin', '2018-01-04 16:36:14');

-- ----------------------------
-- Table structure for favouriteproduct
-- ----------------------------
DROP TABLE IF EXISTS `favouriteproduct`;
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

-- ----------------------------
-- Records of favouriteproduct
-- ----------------------------

-- ----------------------------
-- Table structure for favouriteshop
-- ----------------------------
DROP TABLE IF EXISTS `favouriteshop`;
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

-- ----------------------------
-- Records of favouriteshop
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `sellerId` int(11) DEFAULT NULL,
  `buyerId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `totalPrice` float NOT NULL,
  `address` varchar(45) NOT NULL,
  `orderStatus` int(11) NOT NULL,
  `orderTime` datetime NOT NULL,
  `orderCommissionId` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`orderId`),
  KEY `FK_Reference_14` (`buyerId`),
  KEY `FK_Reference_2` (`sellerId`),
  KEY `FK_Reference_24` (`productId`),
  KEY `FK_Reference_55` (`orderCommissionId`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`buyerId`) REFERENCES `buyer` (`buyerId`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`sellerId`) REFERENCES `seller` (`sellerId`),
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`),
  CONSTRAINT `FK_Reference_55` FOREIGN KEY (`orderCommissionId`) REFERENCES `commission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '2', '4', '2', '2', '5', '12346544', '2', '2017-12-16 14:50:09', '1');
INSERT INTO `orders` VALUES ('2', '2', '4', '3', '1', '12', '123', '5', '2017-12-15 19:31:46', '1');
INSERT INTO `orders` VALUES ('4', '5', '6', '3', '1', '2', '336', '3', '2017-12-15 16:39:56', '1');
INSERT INTO `orders` VALUES ('6', '6', '3', '1', '1', '999', '123456', '4', '2017-12-17 19:33:14', '1');
INSERT INTO `orders` VALUES ('7', '6', '3', '1', '1', '56', '123456', '4', '2017-12-17 19:33:14', '1');
INSERT INTO `orders` VALUES ('8', '1', '2', '1', '1', '1', 'buy2address', '4', '2017-12-29 11:17:35', '1');
INSERT INTO `orders` VALUES ('9', '2', '3', '3', '1', '95', '12313', '5', '2018-01-04 16:31:11', '1');
INSERT INTO `orders` VALUES ('10', '2', '3', '3', '1', '195', '12313', '5', '2018-01-04 16:31:11', '1');
INSERT INTO `orders` VALUES ('11', '2', '3', '3', '1', '138', '12313', '5', '2018-01-04 16:31:11', '1');
INSERT INTO `orders` VALUES ('12', '2', '3', '3', '1', '125', '12313', '5', '2018-01-04 16:31:11', '1');
INSERT INTO `orders` VALUES ('13', '2', '3', '3', '1', '138', '12313', '5', '2018-01-04 16:31:11', '1');
INSERT INTO `orders` VALUES ('14', '2', '3', '3', '1', '46', '12313', '5', '2018-01-04 16:31:11', '1');
INSERT INTO `orders` VALUES ('15', '2', '3', '3', '1', '98', '12313', '5', '2018-01-04 16:31:11', '1');
INSERT INTO `orders` VALUES ('20', '1', '8', '1', '1', '1', '1223344555', '5', '2018-01-04 22:21:53', '1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `sellerId` int(11) DEFAULT NULL,
  `productName` varchar(45) NOT NULL,
  `productType` int(11) NOT NULL,
  `productPrice` float NOT NULL,
  `storeCount` int(11) NOT NULL,
  `soldCount` int(11) NOT NULL,
  `productIntroduction` varchar(512) NOT NULL,
  `productPicture` varchar(512) NOT NULL,
  PRIMARY KEY (`productId`),
  KEY `FK_Reference_25` (`sellerId`),
  CONSTRAINT `FK_Reference_25` FOREIGN KEY (`sellerId`) REFERENCES `seller` (`sellerId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '1', '1', '1', '1', '-6', '0', '1', 'b4ac0721c2994519a487d2f926540c3a.jpg');
INSERT INTO `product` VALUES ('2', '1', '123', '1', '11', '1', '0', '1', '17d530ab3c234e96b779b599be9e0057.jpg');
INSERT INTO `product` VALUES ('3', '1', '123', '1', '123', '1', '0', '123', 'b3d7e407b07441eba384d3fbbcbfc478.jpg');

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES ('1', 'Aj', 'Aj\'s Shop', '111', '123@123.com', '12345678910', '0.02', 'a shop', '1');
INSERT INTO `seller` VALUES ('2', 'Aj2', 'Aj2\'s Shop', '111', '1234@123.com', '12345678911', '0', 'a shop', '0');
INSERT INTO `seller` VALUES ('3', 'Aj3', 'Aj3\'s Shop', '111', '12345@123.com', '12345678912', '0', 'a shop', '3');
INSERT INTO `seller` VALUES ('4', 'aa', 'aa\'s Shop', '111', '123456@123.com', '12345678913', '0', 'a shop', '1');
INSERT INTO `seller` VALUES ('5', 'aa2', 'aa2\'s Shop', '111', '1234567@123.com', '12345678914', '0', 'a shop', '1');
INSERT INTO `seller` VALUES ('6', 'ban', 'ban\'s Shop', '111', '131232345678@123.com', '12345678915', '0', 'a shop', '1');
INSERT INTO `seller` VALUES ('7', 'seller666', 'seller\'s shop', '123', '123@666.com', '13522111235', '0', 'asdEnter Introduction', '0');

-- ----------------------------
-- Table structure for sellerblacklist
-- ----------------------------
DROP TABLE IF EXISTS `sellerblacklist`;
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

-- ----------------------------
-- Records of sellerblacklist
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
