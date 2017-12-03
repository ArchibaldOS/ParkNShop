/*
Navicat MySQL Data Transfer

Source Server         : parknshop
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : parknshop

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2017-12-03 11:29:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `totalPrice` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `address` varchar(45) NOT NULL,
  `orderStatus` int(11) NOT NULL,
  `orderTime` datetime NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `productId_idx` (`productId`),
  CONSTRAINT `productId` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS=1;
