/*
Navicat MySQL Data Transfer

Source Server         : MySQLRoot
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : parknshop

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-01-02 13:59:55
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
  `ADClickUrl` varchar(256) NOT NULL,
  `ADDescription` varchar(255) NOT NULL,
  `ADPrice` float NOT NULL,
  `ADStartDate` datetime NOT NULL,
  `ADTime` int(11) NOT NULL,
  PRIMARY KEY (`ADId`),
  KEY `FK_Reference_16` (`adminId`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`adminId`) REFERENCES `admins` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ad
-- ----------------------------
INSERT INTO `ad` VALUES ('2', '2', '3', '1', '1', 'testAD', 'https://www.baidu.com', 'https://www.baidu.com', 'ADDescription', '1000', '2018-01-02 12:15:07', '10');
INSERT INTO `ad` VALUES ('3', '2', '2', '1', '1', 'testAD', 'https://www.baidu.com', 'https://www.baidu.com', 'ADDescription', '1000', '2018-01-02 12:15:07', '10');
INSERT INTO `ad` VALUES ('4', '1', '2', '1', '1', 'testAD', 'https://www.baidu.com', 'https://www.baidu.com', 'ADDescription', '1000', '2018-01-02 12:15:07', '10');
INSERT INTO `ad` VALUES ('5', '1', '2', '1', '1', 'testAD', 'https://www.baidu.com', 'https://www.baidu.com', 'ADDescription', '1000', '2018-01-02 12:15:07', '10');

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
INSERT INTO `admins` VALUES ('1', 'admin', 'admin', 'admin', '0', '12345678910', '1');
INSERT INTO `admins` VALUES ('2', 'admin2', 'admin2', 'admin2', '0', '110', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buyer
-- ----------------------------
INSERT INTO `buyer` VALUES ('2', 'buyer2', 'buye2', 'buy2address', '123456', 'buyer2', '1', '0');
INSERT INTO `buyer` VALUES ('3', 'buyer3', 'buyer3', 'buy3address', '123456788910', 'buyer3', '2', '0');
INSERT INTO `buyer` VALUES ('4', 'buyer4', 'buyer4', 'buy4address', '123456788910', 'buyer4', '2', '0');
INSERT INTO `buyer` VALUES ('5', 'buyer5', 'buyer5', 'buy5address', '123456788910', 'buyer5', '3', '0');
INSERT INTO `buyer` VALUES ('6', 'buyer6', 'buyer6', 'bue6address', '1234', 'buyer6', '1', '0');
INSERT INTO `buyer` VALUES ('7', '1112@qq.com', 'buybuybuy', '12311123', '13522212111', '111', '1', '0');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `buyerId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `content` varchar(512) NOT NULL,
  `reply` varchar(512) NOT NULL,
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
  `time` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `operatoraccount` (`operatoraccount`),
  KEY `commission` (`commission`),
  CONSTRAINT `operatoraccount` FOREIGN KEY (`operatoraccount`) REFERENCES `admins` (`adminAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commission
-- ----------------------------
INSERT INTO `commission` VALUES ('1', '0.2', 'admin', '2017-12-16 16:34:56');
INSERT INTO `commission` VALUES ('2', '0.3', 'admin', '2017-12-16 17:05:32');
INSERT INTO `commission` VALUES ('3', '0.35', 'admin', '2017-12-16 17:08:36');
INSERT INTO `commission` VALUES ('4', '0', 'admin', '2017-12-17 20:15:24');

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
  PRIMARY KEY (`orderId`),
  KEY `FK_Reference_14` (`buyerId`),
  KEY `FK_Reference_2` (`sellerId`),
  KEY `FK_Reference_24` (`productId`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`buyerId`) REFERENCES `buyer` (`buyerId`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`sellerId`) REFERENCES `seller` (`sellerId`),
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '2', '4', '2', '2', '5', '1234654456', '3', '2017-12-19 11:42:43');
INSERT INTO `orders` VALUES ('3', '2', '2', '1', '2', '3', '13212145', '2', '2017-12-19 11:44:05');
INSERT INTO `orders` VALUES ('4', '5', '6', '3', '1', '2', '336', '3', '2017-12-15 16:39:56');
INSERT INTO `orders` VALUES ('5', '6', '3', '1', '1', '56', '123456', '4', '2017-11-01 19:34:02');
INSERT INTO `orders` VALUES ('6', '6', '3', '1', '1', '56', '123456', '4', '2017-12-17 19:33:14');
INSERT INTO `orders` VALUES ('7', '6', '3', '1', '1', '56', '123456', '4', '2017-12-17 19:33:14');
INSERT INTO `orders` VALUES ('8', '2', '3', '2', '2', '36', '464545', '5', '2017-09-01 14:20:00');

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
INSERT INTO `product` VALUES ('1', '1', '1', '1', '1', '1', '0', '1', 'b4ac0721c2994519a487d2f926540c3a.jpg');
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
INSERT INTO `seller` VALUES ('1', 'Aj', 'Aj\'s Shop', '111', '123@123.com', '12345678910', '0', 'a shop', '1');
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
