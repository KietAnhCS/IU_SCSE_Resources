-- --------------------------------------------------------

--
-- Table structure for table 'course'
--

CREATE TABLE IF NOT EXISTS course (
  _ID int(10) NOT NULL auto_increment,
  CourseName varchar(255) NOT NULL,
  Credits int(1) NOT NULL,
  PRIMARY KEY  (_ID),
  KEY Course_CourseID_INDEX (CourseName)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table 'student'
--

CREATE TABLE IF NOT EXISTS student (
  _ID int(10) NOT NULL auto_increment,
  StudentID varchar(10) NOT NULL,
  StudentName varchar(255) NOT NULL,
  PRIMARY KEY  (_ID)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table 'studentcourse'
--

CREATE TABLE IF NOT EXISTS studentcourse (
  Student_ID int(10) NOT NULL,
  Course_ID int(10) NOT NULL,
  PRIMARY KEY  (Student_ID,Course_ID),
  KEY StudentCourse_StudentID_INDEX (Student_ID),
  KEY StudentCourse_CourseID_INDEX (Course_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
