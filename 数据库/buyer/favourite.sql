/*
Navicat MySQL Data Transfer

Source Server         : ParkNShop
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : parknshop

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2017-12-02 21:10:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for favourite
-- ----------------------------
DROP TABLE IF EXISTS `favourite`;
CREATE TABLE `favourite` (
  `buyer_id` int(5) NOT NULL,
  `type` int(1) NOT NULL,
  `favor_id` int(10) NOT NULL,
  PRIMARY KEY (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS=1;
