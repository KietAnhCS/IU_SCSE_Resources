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
        <title>Update Student</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            String connectionURL = "jdbc:mysql://localhost:3306/weblab5?user=root;password=taurus&useUnicode=true&characterEncoding=UTF-8";
            Connection connection = null;
            Statement statement = null;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            if (request.getParameter("action").equals("delete")) {
                connection = DriverManager.getConnection(connectionURL, "root", "taurus");
                statement = connection.createStatement();
                int rowCount = statement.executeUpdate("DELETE FROM student WHERE StudentID='" + request.getParameter("studentID") + "'");
                statement = connection.createStatement();
                rowCount = statement.executeUpdate("DELETE FROM studentcourse WHERE StudentID='" + request.getParameter("studentID") + "'");
                connection.close();
                response.sendRedirect("./Student");
            }
            if (request.getParameter("action").equals("edit")) {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(connectionURL, "root", "taurus");
                statement = connection.createStatement();
                rs = statement.executeQuery("SELECT * FROM student WHERE StudentID='" + request.getParameter("studentID") + "'");
                rs.next();
        %>
        <h1>Edit Student</h1>
        <form action="./Student?action=update&studentID=<%= request.getParameter("studentID")%>" method="post">
            Student ID: <%= request.getParameter("studentID")%>
            <br />Student Name: <%= rs.getString("StudentName")%>
            <br />New Student Name: <input type="text" name="student" />
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
                int rowCount = statement.executeUpdate("UPDATE student SET StudentName='" + request.getParameter("student") + "' WHERE StudentID='" + request.getParameter("studentID") + "'");
                connection.close();
                response.sendRedirect("./Student");
            }
        %>
    </body>
</html>
