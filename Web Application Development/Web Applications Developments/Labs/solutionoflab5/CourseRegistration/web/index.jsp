<%-- 
    Document   : index
    Created on : Mar 12, 2009, 7:02:12 AM
    Author     : Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Course Registration Demo</h1>
        <form action="Student?action=view" method="post">
              Student ID: <input type="text" name="studentID"/>
            <input type="submit" value="Submit"/>
        </form>
        <h2>Manager</h2>
        <a href="Student">Students Manager</a><br/>
        <a href="Course">Courses Manager</a>
    </body>
</html>
