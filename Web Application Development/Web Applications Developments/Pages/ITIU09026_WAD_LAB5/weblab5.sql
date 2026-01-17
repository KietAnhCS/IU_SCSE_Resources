/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : weblab5

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2011-11-16 16:52:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `CourseID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(255) NOT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'Computer Graphic');
INSERT INTO `course` VALUES ('2', 'Web');
INSERT INTO `course` VALUES ('3', 'Operating System');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 'Phạm Hoàng Long');
INSERT INTO `student` VALUES ('2', 'Nguyễn Duy Anh');
INSERT INTO `student` VALUES ('3', 'Phan Tiến Nhựt');

-- ----------------------------
-- Table structure for `studentcourse`
-- ----------------------------
DROP TABLE IF EXISTS `studentcourse`;
CREATE TABLE `studentcourse` (
  `StudentID` int(20) NOT NULL,
  `CourseID` bigint(20) NOT NULL,
  PRIMARY KEY (`StudentID`,`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentcourse
-- ----------------------------
INSERT INTO `studentcourse` VALUES ('1', '2');
INSERT INTO `studentcourse` VALUES ('2', '1');
INSERT INTO `studentcourse` VALUES ('3', '3');
