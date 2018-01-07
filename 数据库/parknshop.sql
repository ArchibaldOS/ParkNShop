/*
 Navicat MySQL Data Transfer

 Source Server         : 1
 Source Server Version : 50720
 Source Host           : localhost
 Source Database       : parknshop

 Target Server Version : 50720
 File Encoding         : utf-8

 Date: 01/07/2018 17:33:28 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `ad`
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
  CONSTRAINT `FK_Reference_166` FOREIGN KEY (`adminId`) REFERENCES `admins` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ad`
-- ----------------------------
BEGIN;
INSERT INTO `ad` VALUES ('18', '2', '2', '8', '1', 'Audio', '0f093f331a5c4b4dbba217ffa0e4a4be.png', 'Subvert your hearing', '2000', '2018-01-07 17:11:31', '10'), ('19', '1', '2', '15', '1', 'wireless', '9e7d18fce952497a84bc320819709273.jpg', 'wireless', '1000', '2018-01-07 17:11:34', '10'), ('20', '3', '2', '16', '1', 'bose', '3173cf8ecd8843b09c75273d0399207d.jpg', 'bose', '1000', '2018-01-07 17:11:37', '10'), ('21', '4', '2', '17', '1', 'car', '6081d80115d94bac881f873f4b0d9413.jpg', 'car', '1000', '2018-01-07 17:11:41', '10'), ('22', '5', '2', '44', '1', 'blue', '48eacea2af9740c78f491d54b8d920c4.jpg', 'blue', '1000', '2018-01-07 17:11:47', '10'), ('23', '2', '2', '9', '1', 'computer', 'ba12c53cc6cd4c8a8b1f6f934cacbe1a.png', 'Light metal body', '2000', '2018-01-07 17:11:49', '10'), ('24', '1', '2', '18', '1', 'fdg', '0d5bf02173224f379a8c0e4aa9c4ebb6.jpg', 'vdsjhdbsjv', '1000', '2018-01-07 17:11:52', '10'), ('25', '3', '2', '19', '1', 'dfs', '8196bd6d99c94a959a6c532b4914042c.jpg', 'dfgfdg', '1000', '2018-01-07 17:11:55', '10'), ('26', '4', '2', '20', '1', 'dsfd', '7a2da7b4af55490ca76455e38af38fdb.jpg', 'dsdsfsd', '1000', '2018-01-07 17:11:57', '10'), ('27', '5', '2', '21', '1', 'wer', '1425e195f69944ba872df12998b3ca21.jpg', 'fdbdfd', '1000', '2018-01-07 17:12:00', '10'), ('28', '2', '2', '10', '1', 'cellphone', '581c3da1f52544f1ae97644001690730.png', 'Lasting and smooth	', '2000', '2018-01-07 17:12:04', '10'), ('29', '1', '2', '22', '1', 'fgdf', 'c9426455d3d44d4fa35800c9fe593bd3.jpg', 'fdbgdbfg', '1000', '2018-01-07 17:12:06', '10'), ('30', '3', '2', '23', '1', 'dfbdf', '1a633f8e6c7d49678681fbc2ca989b38.jpg', 'vffdsvdf', '1000', '2018-01-07 17:12:09', '10'), ('31', '4', '2', '24', '1', 'dsvsa', 'af2bf7004a2a4bed984b1635148aaed6.jpg', 'dfdf', '1000', '2018-01-07 17:12:12', '10'), ('32', '5', '2', '25', '1', 'rfvfd', '2a342d849eec454194798f8e727ba0d8.jpg', 'fdvdfvdf', '1500', '2018-01-07 17:12:15', '15'), ('33', '2', '2', '11', '1', 'camera', '7c8570bf39c544f493cbc9193ba539f0.png', 'Full HD lossless fast output', '3200', '2018-01-07 17:12:18', '16'), ('35', '3', '2', '27', '1', 'dsf', '3a77dc8ba9fc4088b4c893dd15d60834.jpg', 'dfsdf', '1300', '2018-01-07 17:12:23', '13'), ('36', '4', '2', '28', '1', 'dsfs', '4dfc6f52a7244483b4cf830e45f171b8.jpg', 'dsfdf', '1400', '2018-01-07 17:12:26', '14'), ('37', '5', '2', '29', '1', 'dsfsd', 'b0e53487ff134aab8380652031f5fbc3.jpg', 'dsfdsfsdf', '1700', '2018-01-07 17:12:28', '17'), ('38', '1', '2', '30', '1', 'fdgfdg', 'cc3be59a933543b78a620fe7f0fa76c4.jpg', 'fsdgfdgfdsg', '1400', '2018-01-07 17:12:31', '14'), ('39', '1', '2', '31', '1', 'dfdsf', 'f2cafc72fc874d509be9255ceac1a539.jpg', 'dsfdsf', '1500', '2018-01-07 17:12:34', '15'), ('40', '1', '2', '32', '1', 'dsfds', '845d4729c45e4fada89c080cd32298e7.jpg', 'dsfgdsg', '1500', '2018-01-07 17:12:36', '15'), ('41', '1', '2', '46', '1', 'ddsfdsf', '199204a868274839b38b58241feb94ed.jpg', 'fdgfdgfdg', '1700', '2018-01-07 17:12:39', '17'), ('45', '2', '2', '14', '1', 'Television', '1dcc168e878c48dfa87a43f0cc361e19.png', 'Central high-power surround', '3200', '2018-01-07 17:12:41', '16'), ('46', '3', '2', '33', '1', 'wqeqw', '5250a301289d45ad95fdf49a3cffcdc0.jpg', 'fsdff', '1400', '2018-01-07 17:12:44', '14'), ('47', '4', '2', '34', '1', 'fdfdgf', '6eca723b37d744cf86a0db75121772cb.jpg', 'dfbfdg', '1500', '2018-01-07 17:12:47', '15'), ('48', '5', '2', '36', '1', 'fdsgfdg', '91063e8a38594a85b22e08b239ff9307.jpg', 'dsvfdsvfd', '1600', '2018-01-07 17:12:50', '16');
COMMIT;

-- ----------------------------
--  Table structure for `admins`
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `admins`
-- ----------------------------
BEGIN;
INSERT INTO `admins` VALUES ('1', 'admin', 'admin', 'admin', '3527.46', '12345678910', '1'), ('2', 'admin2', 'admin2', 'admin2', '0', '110', '1'), ('3', 'admin3', 'admin3', 'admin3', '0', '1111111111', '0');
COMMIT;

-- ----------------------------
--  Table structure for `backuphistory`
-- ----------------------------
DROP TABLE IF EXISTS `backuphistory`;
CREATE TABLE `backuphistory` (
  `backupId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `backupAccount` varchar(255) NOT NULL,
  `backupDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `backupFilePath` varchar(255) NOT NULL,
  PRIMARY KEY (`backupId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `buyer`
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
--  Records of `buyer`
-- ----------------------------
BEGIN;
INSERT INTO `buyer` VALUES ('8', 'cxh@qq.com', 'buyerbuyerer', 'xidianUniversity', '15002972015', '1234', '1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
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

-- ----------------------------
--  Table structure for `commission`
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `favouriteproduct`
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
--  Table structure for `favouriteshop`
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
--  Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
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

-- ----------------------------
--  Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `product`
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES ('0', '16', '8', 'Bose Solo 15 Series II TV Sound System', '5', '279', '1900', '0', 'The Bose Solo 15 Series II TV sound system is a one-piece speaker that delivers dramatically better sound than your TV. Advanced Bose technologies make each word and detail sound clear at any volume, and create an experience that\'s wider than the screen. The system also produces impressive bass that adds impact to your shows. And when you want even more clarity, dialogue mode makes every word easier to hear without having to adjust the volume from scene to scene. Setup is easy, with just one connection to your TV. The system fits under most TVs up to 50 inches yet is still small enough to place on an open shelf. It features Bluetooth connectivity, so you can stream music wirelessly, and includes a universal remote.', '3173cf8ecd8843b09c75273d0399207d.jpg'), ('0', '17', '8', 'Car DVR Dash Cam 2.4” ', '5', '87.99', '1900', '0', 'Item: Neutra lDAB211\r\nFeature: Ambarella A12A55+2.31\"LCD+2 DDR3+1Gbit flash+OV4689+Lens TRC-2045E1(diameter14MM)\r\nDiagonal angle 143° wide angle \r\nMax. video resolution: 2560x1440 30P / HDR 2560x1440 30P/ 2304x1296 30P / 1920*1080 60P/ 1920*1080 30P/HDR 1920*1080 \r\nVideo coding format: MP4\r\nPixels4M/8M/14M/16M \r\nPhoto format: JPG \r\nBattery: 400MA/3.7V', '6081d80115d94bac881f873f4b0d9413.jpg'), ('0', '18', '9', 'Fire HD 8 Tablet with Alexa', '2', '49.99', '10', '0', 'The next generation of our best-reviewed Fire tablet, with up to 12 hours of battery life, a vibrant 8\" HD display, a 1.3 GHz quad-core processor, 1.5 GB of RAM, and Dolby Audio. More durable than the latest iPad.', '0d5bf02173224f379a8c0e4aa9c4ebb6.jpg'), ('0', '19', '9', 'RCA Voyager PRO 7 with two cores', '2', '56.48', '565', '0', 'Introducing the RCA Voyager Pro 7-inch Google Certified Tablet with keyboard case. Operating on Android\'s sweetest operating system yet, Android 5.0 (Lollipop), you can enjoy more of what the Google Play store has to offer.', '8196bd6d99c94a959a6c532b4914042c.jpg'), ('0', '20', '9', 'Certified Refurbished Fire HD 10 Tablet', '2', '89.99', '560', '0', 'The fast quad-core processor consists of two high-performance 1.5 GHz cores and two 1.2 GHz cores running simultaneously for quick app launches, smooth games and videos, and great overall performance.', '7a2da7b4af55490ca76455e38af38fdb.jpg'), ('0', '21', '9', 'NeuTab 7\'\' Quad Core WIFI Tablet PC', '2', '44.99', '890', '0', 'The 7 inch screen is proven to be the most popular and practical screen size that makes your hand comfortable as well as your mind. And NeuTab N7 Pro feathers the 7 inch HD screen and the powerful Quad Core Processor.', '1425e195f69944ba872df12998b3ca21.jpg'), ('0', '22', '10', 'BLU Advance A5 -UnlockedSmartphone', '3', '49.99', '94', '0', 'Introducing new Advance A5, designated with a perfect blend of style and function. The Advance 5A offers a clean and Sexy looking smartphone. Available in metal Black, the Advance A5 incorporated a flawless and enhanced metal housing.', 'c9426455d3d44d4fa35800c9fe593bd3.jpg'), ('0', '23', '10', 'Huawei Honor 6X Unlocked Smartphone', '3', '149.99', '808', '0', 'Honor has created a device that gives a double dose of what you would expect of a smart device. With the Honor 6x’s dual-lens 12MP + 2MP rear camera and ultra-fast focus time of 0.3 seconds you can capture colorful HD photos day or night. To double the camera capability, the Honor 6x also features a wide aperture range (F/0.95-F/16) that allows for a professional-grade shallow depth of field effect (blurred Background). the 6x\'s Octa-core processor(16nm) and 3GB RAM, in addition to its smart file system allows for seamlessly running Multiple apps at the same time.', '1a633f8e6c7d49678681fbc2ca989b38.jpg'), ('0', '24', '10', ' Le S3 Unlocked Dual-SIM Smartphone', '3', '129.99', '999', '0', 'From fast processing to a generous 5.5-inch display and award-winning CDLA audio technology, your Le S3 is built to deliver the ultimate mobile entertainment experience. Le S3 delivers best-in-class performance by combining the Qualcomm Snapdragon 652 processor, 3GB memory, 32GB onboard storage and LTE-A connectivity. 16MP main and 8MP selfie cameras deliver high resolution photos and videos, paired with an intelligent fingerprint scanner that also acts as a camera shutter button.', 'af2bf7004a2a4bed984b1635148aaed6.jpg'), ('0', '25', '10', 'Razer Phone with dual Camera', '3', '699.99', '677', '0', 'The World’s First 120Hz Ultra Motion Display for smoother and truer graphics. Audio is powered by Dolby ATMOS and certified by THX for a true cinematic audio experience. Qualcomm Snapdragon 835 with 8GB RAM for optimized performance. **The Razer Phone is a GSM-compatible unlocked phone.', '2a342d849eec454194798f8e727ba0d8.jpg'), ('0', '26', '11', 'Sony a7R III 42.4MP Full-frame', '4', '149', '890', '0', 'Thanks to an evolutionary leap in image processing power and efficiency, the a7R III combines a high-resolution 42.4 MP back-illuminated Exmor R CMOS image sensor with impressive shooting speeds at up to 10 fps with full AF/AE tracking, as well as beautiful 4K HDR video quality, wide 15-stop dynamic range and high sensitivity with noise reduction of almost a full stop.', '92abf9ea216645729d865331b65203af.jpg'), ('0', '27', '11', 'Sony Alpha 6000 Mirrorless Camera', '4', '498', '890', '0', '79-point focal plane phase-detection AF sensor. The compact, lightweight camera delivers superb image quality - via newly developed 24.3-effective-megapixel (approx.) Exmor APS HD CMOS sensor and BIONZ X image processing engine - as well as highly intuitive operation thanks to an OLED Tru-Finder and two operation dials.\r\n', '3a77dc8ba9fc4088b4c893dd15d60834.jpg'), ('0', '28', '11', 'Sony SEL35F18 35mm f/1.8 Prime', '4', '398', '878', '0', 'High performance and a compact design make the SEL-35F18 an ideal “second lens” that is easy to carry around when capturing the action. It’s ideal for a wide variety of photos, including snapshots while strolling, night shots (thanks to the bright maximum aperture) and portraits with superb background/foreground blur.', '4dfc6f52a7244483b4cf830e45f171b8.jpg'), ('0', '29', '11', 'Sony DSCW800/B 20.1 MP Camera', '4', '888', '890', '0', 'Sony DSCW800/B 20.1 MP Digital Camera with 2.7-Inch LCD (black)', 'b0e53487ff134aab8380652031f5fbc3.jpg'), ('0', '30', '13', 'Fitness Track Hostate WaterproofActivity', '8', '30.99', '345', '0', '14 popular sports modes meet your daily needs\r\nHeart Rate Monitor/Private Health Tracker\r\nWith Camera& Music Control', 'cc3be59a933543b78a620fe7f0fa76c4.jpg'), ('0', '31', '13', 'Slim Fitness Tracker Watch', '8', '78', '677', '0', 'See time and date by tapping the bright LED display; Slim and stylish design with only 18g, it also suits for kids; No charging cable needed.\r\nAutomatically tracking your steps, distance and calories burning, by tapping the LED display to see the data easily.', 'f2cafc72fc874d509be9255ceac1a539.jpg'), ('0', '32', '13', 'WOWGO Women Sport  Smart Watch', '8', '80', '23', '0', 'sync date and time, music control, distance tracking, notifications, remote camera control, anti-lost alert, find Phone, sports and health recording; Incoming call and sms reminder,Social software,message reminder, sedentary reminder', '845d4729c45e4fada89c080cd32298e7.jpg'), ('0', '33', '14', 'DVD   Player    with     Swivel Screen', '1', '78', '89', '0', 'COMPARED WITH PREVIOUS VERSIONS, THE NEW GENERATION 9.5 INCH PORTABLE DVD PLAYER: 1. Lightweight and more portable than the previous generation 2. Built-in virtual remote make sure you can use all the function even though the remote control is miss 3. 5ft car cord (Longer enough) make sure you can charge your device while you are watching a movie on car rides 4.Dull polish technology can avoid the fingerprint Product Description： Vivid Swivel Display： Our vivid 9.5 inch TFT color display provide crystal clear visibility.', '5250a301289d45ad95fdf49a3cffcdc0.jpg'), ('0', '34', '14', ' T20 1500 Lumens LCD Mini Projector', '1', '99.99', '777', '0', 'DBPOWER 1500 lumens mini video projector , do you want to have amazing watching experience at home? DBPOWER mini video projector is your best choice at a reasonable price, which has high fidelity images and focusing function.', '6eca723b37d744cf86a0db75121772cb.jpg'), ('0', '35', '14', 'Home Video Theater Game Office ', '1', '439', '568', '0', '◆Connectivity Technology:Wifi/Buletooth/HDMI/VGA/USB/AV/Audio/SD/Keyboard/TF\r\n\r\n◆Contrast Ratio:3000:1\r\n\r\n◆Item Dimensions: 6.8*4.0*1.1\r\n\r\n◆Item Weight:0.98lbs\r\n\r\n◆Resolution:Native 1280x720, Support 1080p', '33d7c939cfaf4c8bb8d688734c453d0b.jpg'), ('0', '36', '14', 'Samsung Electronics UN65MU8000', '1', '1297.99', '8000', '0', 'Every scene deserves a brilliant picture. Experience lifelike color with a billion more shades than regular 4K UHD and enjoy the expanded depth of HDR. With extreme contrast between the darkest darks and lightest lights, you never miss a detail. MR 240 brings fast action to life, and you can take it all in on a TV that\'s streamlined from every angle- from a sleek frame to a clean back.', '91063e8a38594a85b22e08b239ff9307.jpg'), ('0', '40', '14', 'LG Electronics OLED55B7A 55-Inch 4K', '1', '1646', '888', '0', 'Amazon.com is not a sponsor of this promotion. Except as required by law, Amazon.com Gift Cards (\"GCs\") cannot be transferred for value or redeemed for cash. GCs may be used only for purchases of eligible goods at Amazon.com or certain of its affiliated websites. For complete terms and conditions, see www.amazon.com/gc-legal. GCs are issued by ACI Gift Cards LLC, a Washington limited liability company. All Amazon Registered, Copyrights and Trademarks are IP of Amazon.com, Inc. or its affiliates. No expiration date or service fees.', '46ae60f365b2495bb2e82b0ddb7c871d.jpg'), ('0', '41', '9', 'Microsoft Surface Studio Intel Core i5', '1', '2899', '999', '0', 'Turn your desk into a Studio. Microsoft Surface Studio is a whole new class of device, one designed for the creative process. The 28-inch PixelSense Display floats like a sheet of suspended pixels giving you a huge canvas for all kinds of work. Use it upright or draw on it like a drafting table, breathing life into your ideas with a process that has been limited to whiteboards and sketchbooks, until now. Featuring a 6th generation Intel Core i5 or i7 processor and up to 32GB RAM, Surface Studio is available in 1T or 2T Rapid Hybrid Drive. Run professional-grade software like Solidworks, Adobe Premiere Pro and Autodesk* with tools unique to Surface, like Surface Pen and Surface Dial*. The minimal and modern design sits perfectly on your desk with its striking lines and small footprint. Includes Surface Pen, Surface Keyboard, Surface Mouse. *Software and Surface Dial sold separately.', 'd431df46230d4c969f044da3b21af9a1.jpg'), ('0', '42', '10', 'Apple iPhone X, GSM Unlocked 5.8\"', '1', '1142', '1000', '0', 'iPhone x features an all-screen design with a 5.8-Inch super Retina HD display with HDR and true tone. Face ID lets you unlock and use Apple pay with just a glance. Powered by A11 Bionic, the most powerful and smartest chip ever in a smartphone. Supports augmented reality experiences in games and apps.', '314b71ecc4e44312a773d4805f074956.jpg'), ('0', '44', '8', 'AmazonBasics Bluetooth 4.0 Audio Receiver', '5', '20', '10000', '0', 'Play music on your speaker system wirelessly from most any Bluetooth enabled device. Receives music from up to 30 feet (10 meters) away so you don’t need to dock your Bluetooth device\r\n', '48eacea2af9740c78f491d54b8d920c4.jpg'), ('0', '45', '8', 'ZONEPAN Wireless Bluetooth Speaker', '5', '60', '10000', '0', 'ONNECT IN SECONDS: Bluetooth 4.1-Maximum Compatibility, Better Signal Quality, Extended 66 Feet Range, Support Extra TF Card and AUX Line-In Playing Mode.HANDS-FREE CALLS: Built-In HD Microphone and Echo-Cancellation Chipset. It’s Convenient for Hands-Free Speaker Phone Calling, Video Chat, Google Talk, Facetime.', '2d44d03dd1e54625807fe8257ce9daf1.jpg'), ('0', '46', '13', 'Airpods, Wireless Earbuds Stereo Earphone ', '8', '72', '10000', '0', 'BLUETOOTH V4.1 UNIVERSAL COMPATIBILITY: With latest Bluetooth 4.1 technology, provides more stable connection signal transmission. The earbuds work with all smartphones, tablets and bluetooth enabled devices.Compatible with most Bluetooth enabled devices, such as Apple iPhone, Android Samsung, etc., pairing up just take a few seconds. Any question, please contact seller, we’ll try our best to resolve it as soon as possibl', '199204a868274839b38b58241feb94ed.jpg'), ('0', '47', '13', 'JBL Under Armour Wireless Headphones', '8', '100', '10000', '0', 'UA headphones wireless - engineered by jbl are designed by athletes for athletes to set the new standard of what a sport headphone should be. Sweat-proof and built to withstand any workout, they\'re guaranteed to be the most comfortable headphones you\'ll ever wear. They\'ll never hurt, fall out, or get in your way. UA headphones wireless - engineered by jbl are Bluetooth Enabled freeing you from wires and distractions. A button Mic handles volume, music/calls, and works with both iPhone and Android devices. Included with purchase is a membership to map my fitness premium, allowing you to monitor your health and track your progress. Power every workout with jbl signature sound so you can finish strong. UA headphones wireless - engineered by jbl - this is the sound of high performance. Get a week\'s worth of workouts with 8 hours of battery life per charge.', 'e8a1b694769e44158023ce7010a7caca.jpg'), ('0', '48', '13', 'HP OfficeJet Pro 8710 All-in-One Wireless Printer', '9', '59', '10000', '0', 'This full-featured wireless all-in-one delivers professional-quality color for up to 50% lower cost per page than lasers. Stay productive and tackle high-volume print jobs with print, fax, scan, and copy versatility. Finish jobs in a snap with an all-in-one printer designed for fast, high-volume performance for the office.\r\n', '71af60c82d5244ba935c166149293abf.jpg'), ('0', '49', '13', 'Wireless Intercom System ', '9', '120', '10000', '0', '2017 new release 1800 feet long range 10 channel secure wireless intercom system. It integrates the latest technology to be the most trusted intercom system for home, office, business.\r\nPowerful and Individually Function, Monitor, talk, VOX(Voice Operated Exchange), group call function, monitor function can monitor 10 hours at once. Group function (conference call) can call all the stations in intercom system. VOX(Voice Operated Exchange) function can work all the time until you cancel it.', '459e19f1fdab4b36bc8d4f7aefe176ae.jpg'), ('0', '50', '13', 'Eye-Vac EVPRO Professional Touchless Stationary Vacuum ', '9', '148', '10000', '0', 'With the Eye-Vac Professional, simply sweep up to the infrared sensors at the base and automatically hair, dust, and debris will be suctioned into the easy to dump canister. Eye-Vac Pro is a proven best seller in the hair salon / beauty supply industry, where sweeping is all day job. For anyone with kids, pets, mobility concerns or any space that requires sweeping, the Eye-Vac Professional will make your cleaning life easier and avoid the laborious task of bending down to gather debris. Choose your Eye-Vac setting for an \"always on\" Automatic activation, or switch to Manual mode at your convenience. The Status Indicator will light up \"red\" when the canister is ready to be emptied. Save time & energy with this fast & efficient cleaning machine.', '6afc6aa80bf2445590b7f8306236639b.jpg'), ('0', '51', '13', 'Car DVR Dash Cam 2.4” with Built-in GPS Parking Monitoring', '6', '88', '10000', '0', 'Built-in GPS: The dash cam will record GPS data into dash cam video clips so that you are able to check vehicle location/speed/route on Google Map through included player software.', '8740616a80a0478caf844f6e484f6ad4.jpg'), ('0', '52', '13', 'Avital 4103LX Remote Start System ', '6', '47', '10000', '0', 'Get the convenience of remote start with the smallest-size Avital remotes ever. Perfect for use with OEM keyless remotes integrated into the factory key. Long range remote start in a tiny package.', '6df3dedec4a6406ca307e208bc7f6662.jpg'), ('0', '53', '13', 'BZseed Head Up Display', '6', '12', '10000', '0', 'BZseed GPS navigation hud image reflector can reflect GPS hud image clearly in front of your eyesight, letting you see navigation clearly without lowering head, bringing safety, convenience and joy for driving. ', '25b34315b7ef4d29ad638490b8086b16.jpg'), ('0', '54', '13', 'TomTom VIA 1515M 5-Inch Portable Touchscreen Car GPS', '6', '70', '10000', '0', 'The TomTom VIA 1515TM helps you to keep your hands on the wheel and focus on the road. It makes navigation safe and stress-free.', '9a39497cd4cf44338d62ce770659876d.jpg'), ('0', '55', '13', 'The Lego Ninjago Movie Videogame ', '7', '40', '10000', '0', 'Find your inner ninja with the all-new LEGO Ninjago Movie Video Game! Play as your favorite ninjas, Lloyd, Jay, Kai, Cole, Zane, Nya and Master Wu to defend their home island of Ninjago from the evil Lord Garmadon and his Shark Army.', 'da6b7d3da0fe47cd8b910c9c49517346.jpg'), ('0', '56', '13', 'Trapped in a Video Game: Book One', '7', '8', '10000', '0', 'Jesse Rigsby doesn\'t even like video games. Yet, here he is with a blaster stuck to his arm, a man-sized praying mantis thing chasing him and...is that the Statue of Liberty taking off like a rocket ship? ', '92747cb544294c9eb7686de459643d64.jpg'), ('0', '57', '13', 'Hamilton (Original Broadway Cast Recording)', '7', '19', '10000', '0', '\"Hamilton\" - which transferred to Broadway following a sold-out run at The Public Theater in NYC - is the acclaimed new musical about the scrappy young immigrant Alexander Hamilton, the $10 Founding Father who forever changed America with his revolutionary ideas and actions. During his life cut too short, he served as George Washington\'s chief aide, was the first Treasury Secretary of the United States, a loving husband and father, despised by his fellow Founding Fathers, and shot to death by Aaron Burr in a legendary duel. ', 'ea067741a64547ca92de9025405644ba.jpg');
COMMIT;

-- ----------------------------
--  Table structure for `seller`
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
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

-- ----------------------------
--  Records of `seller`
-- ----------------------------
BEGIN;
INSERT INTO `seller` VALUES ('Chongqing', '8', 'Zhangxiaowu', 'Audio\'s shop', '111', '123@1.com', '15002972015', '0', 'This is an Audio shop', '1'), ('Guangzhou', '9', 'Liubing', 'Computer\'s shop', '111', '123@2.com', '15002976789', '166.051', 'This is an Computer\'s shop', '1'), ('HongKong', '10', 'DZ', 'Cellphone\'s shop', '111', '123@3.com', '15002020202', '4.999', 'This is a Cellphone', '1'), ('Hangzhou', '11', 'Caihongyang', 'Camera\'s shop', '111', '123@4.com', '15002972016', '0', 'This is a Camera shop', '1'), ('Nanjing', '13', 'Liubenhong', 'Health\'s shop', '111', '123@5.com', '15627788822', '0', 'This is a Health shop', '1'), ('Shenzhen', '14', 'Liuxuezhen', 'Television\'s shop', '111', '123@6.com', '15678892020', '3427.81', 'This is a television shop', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sellerblacklist`
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

SET FOREIGN_KEY_CHECKS = 1;
