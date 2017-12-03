/*
Navicat MySQL Data Transfer

Source Server         : parknshop
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : parknshop

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2017-12-03 11:29:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `sellerId` int(11) NOT NULL AUTO_INCREMENT,
  `sellerName` varchar(45) NOT NULL,
  `shopName` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `sellerEmail` varchar(45) NOT NULL,
  `sellerPhone` varchar(45) NOT NULL,
  `introduction` varchar(512) NOT NULL,
  `shopStatus` int(11) NOT NULL,
  `sellerBalance` int(11) NOT NULL,
  PRIMARY KEY (`sellerId`),
  UNIQUE KEY `shopName_UNIQUE` (`shopName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS=1;
