/*
Navicat MySQL Data Transfer

Source Server         : parknshop
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : parknshop

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2017-12-03 11:29:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(45) NOT NULL,
  `type` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `storeCount` int(11) NOT NULL,
  `soldCount` int(11) NOT NULL,
  `introduction` varchar(512) NOT NULL,
  `sellerId` int(11) NOT NULL,
  `picture` varchar(45) NOT NULL,
  PRIMARY KEY (`productId`),
  KEY `sellerId_idx` (`sellerId`),
  CONSTRAINT `sellerId` FOREIGN KEY (`sellerId`) REFERENCES `seller` (`sellerId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS=1;
