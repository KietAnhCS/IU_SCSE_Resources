/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : weblab6

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2011-12-13 16:36:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `visa` varchar(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  PRIMARY KEY (`visa`,`productName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('123', 'Dell XPS', '8');
INSERT INTO `cart` VALUES ('123', 'iPhone', '25');
INSERT INTO `cart` VALUES ('123', 'Võng xếp', '20');
INSERT INTO `cart` VALUES ('7890', 'iPad', '5');
INSERT INTO `cart` VALUES ('7890', 'Kềm cắt móng tay', '44');
INSERT INTO `cart` VALUES ('7890', 'Sony Vaio', '1');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `name` varchar(255) NOT NULL,
  `visa` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`visa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('tin', '123', '1234');
INSERT INTO `customer` VALUES ('kai', '321', '4321');
INSERT INTO `customer` VALUES ('Hung', '7890', 'Thu Duc');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `manuf` varchar(255) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'Dell XPS', 'USA', 'Dell', '1500');
INSERT INTO `product` VALUES ('2', 'iPhone', 'USA', 'Apple', '999');
INSERT INTO `product` VALUES ('3', 'iPad', 'USA', 'Apple', '1400');
INSERT INTO `product` VALUES ('4', 'Sony Vaio', 'JPN', 'Sony', '2000');
INSERT INTO `product` VALUES ('5', 'Võng xếp', 'VN', 'Duy Lợi', '10');
INSERT INTO `product` VALUES ('6', 'Kềm cắt móng tay', 'VN', 'Kềm Nghĩa', '2');
