<%-- 
    Document   : update
    Created on : Nov 15, 2011, 8:34:15 AM
    Author     : Trong Tin
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Course</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            String connectionURL = "jdbc:mysql://localhost:3306/weblab5?user=root;password=taurus";
            Connection connection = null;
            Statement statement = null;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL, "root", "taurus");
            if (request.getParameter("action").equals("delete")) {
                statement = connection.createStatement();
                int rowCount = statement.executeUpdate("DELETE FROM course WHERE CourseID='" + request.getParameter("courseID") + "'");
                statement = connection.createStatement();
                rowCount = statement.executeUpdate("DELETE FROM studentcourse WHERE CourseID='" + request.getParameter("courseID") + "'");
                connection.close();
                response.sendRedirect("./Course");
            }
            if (request.getParameter("action").equals("edit")) {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(connectionURL, "root", "taurus");
                statement = connection.createStatement();
                rs = statement.executeQuery("SELECT * FROM course WHERE CourseID='" + request.getParameter("courseID") + "'");
                rs.next();
        %>
        <h1>Edit Course</h1>
        <form action="./Course?action=update&courseID=<%= request.getParameter("courseID")%>" method="post">
            Course ID: <%= request.getParameter("courseID")%>
            <br />Course Name: <%= rs.getString("CourseName")%>
            <br />New Course Name: <input type="text" name="course" />
            <input type="submit" value="Edit" />
        </form>
        <h2>Manager</h2>
        <a href="./Student">Student Manager</a><br />
        <a href="./Course">Course Manager</a>
        <%
            }
            if (request.getParameter("action").equals("update")) {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(connectionURL, "root", "taurus");
                statement = connection.createStatement();
                int rowCount = statement.executeUpdate("UPDATE course SET CourseName='" + request.getParameter("course") + "' WHERE CourseID='" + request.getParameter("courseID") + "'");
                connection.close();
                response.sendRedirect("./Course");
            }
        %>
    </body>
</html>
