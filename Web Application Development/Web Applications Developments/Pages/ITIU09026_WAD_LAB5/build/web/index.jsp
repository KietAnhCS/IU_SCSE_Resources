<%-- 
    Document   : index
    Created on : Nov 15, 2011, 8:16:35 AM
    Author     : Trong Tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Course Registration Demo</h1>
        <form action="./Student?action=view" method="post">
            Student ID: <input type="text" name="studentID" />
            <input type="submit" value="Submit" />
        </form>
        <h2>Manager</h2>
        <a href="Student"">Student Manager</a><br />
        <a href="Course">Course Manager</a>
    </body>
</html>
