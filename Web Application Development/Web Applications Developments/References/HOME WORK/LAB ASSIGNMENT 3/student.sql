/*
Navicat MySQL Data Transfer

Source Server         : weblab5
Source Server Version : 50153
Source Host           : localhost:3306
Source Database       : weblab5

Target Server Type    : MYSQL
Target Server Version : 50153
File Encoding         : 65001

Date: 2010-11-28 14:50:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL,
  `StudentName` varchar(255) NOT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 'habjkl');
INSERT INTO `student` VALUES ('2', 'khanh');
INSERT INTO `student` VALUES ('3', 'hang');
