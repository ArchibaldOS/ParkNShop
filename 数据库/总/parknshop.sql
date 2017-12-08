/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : parknshop

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2017-12-08 18:37:43
*/

SET FOREIGN_KEY_CHECKS=0;

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
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'admin', 'admin', '0', '12345678910', '1');

-- ----------------------------
-- Table structure for buyer
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer` (
  `buyerId` int(11) NOT NULL AUTO_INCREMENT,
  `buyerName` varchar(25) NOT NULL,
  `buyerAddress` varchar(100) NOT NULL,
  `buyerPhone` varchar(45) NOT NULL,
  `buyerPassword` varchar(20) NOT NULL,
  `buyerStatus` int(11) NOT NULL,
  `buyerBalance` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`buyerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buyer
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for productad
-- ----------------------------
DROP TABLE IF EXISTS `productad`;
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

-- ----------------------------
-- Records of productad
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seller
-- ----------------------------

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

-- ----------------------------
-- Table structure for shopad
-- ----------------------------
DROP TABLE IF EXISTS `shopad`;
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

-- ----------------------------
-- Records of shopad
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
