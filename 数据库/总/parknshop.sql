/*
Navicat MySQL Data Transfer

Source Server         : MySQLRoot
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : parknshop

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-01-02 15:53:05
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ad
-- ----------------------------
INSERT INTO `ad` VALUES ('2', '2', '3', '1', '1', 'testAD', 'https://www.baidu.com', 'ADDescription', '1000', '2018-01-02 12:15:07', '10');
INSERT INTO `ad` VALUES ('3', '2', '2', '1', '1', 'testAD', 'https://www.baidu.com', 'ADDescription', '1000', '2018-01-02 12:15:07', '10');
INSERT INTO `ad` VALUES ('4', '1', '2', '1', '1', 'testAD', 'https://www.baidu.com', 'ADDescription', '1000', '2018-01-02 12:15:07', '10');
INSERT INTO `ad` VALUES ('5', '1', '2', '1', '1', 'testAD', 'https://www.baidu.com', 'ADDescription', '1000', '2018-01-02 12:15:07', '10');
SET FOREIGN_KEY_CHECKS=1;
