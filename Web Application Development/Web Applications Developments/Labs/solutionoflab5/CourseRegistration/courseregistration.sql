-- phpMyAdmin SQL Dump
-- version 3.1.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 12, 2009 at 07:40 PM
-- Server version: 5.0.67
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: 'courseregistration'
--

-- --------------------------------------------------------

--
-- Table structure for table 'course'
--

CREATE TABLE IF NOT EXISTS 'course' (
  'CourseID' bigint(20) NOT NULL auto_increment,
  'CourseName' varchar(255) NOT NULL,
  PRIMARY KEY  ('CourseID'),
  KEY 'Course_CourseID_INDEX' ('CourseID')
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table 'student'
--

CREATE TABLE IF NOT EXISTS 'student' (
  'StudentID' int(11) NOT NULL auto_increment,
  'StudentName' varchar(255) NOT NULL,
  PRIMARY KEY  ('StudentID')
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table 'studentcourse'
--

CREATE TABLE IF NOT EXISTS 'studentcourse' (
  'StudentID' bigint(20) NOT NULL,
  'CourseID' bigint(20) NOT NULL,
  PRIMARY KEY  ('StudentID','CourseID'),
  KEY 'StudentCourse_StudentID_INDEX' ('StudentID'),
  KEY 'StudentCourse_CourseID_INDEX' ('CourseID')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
