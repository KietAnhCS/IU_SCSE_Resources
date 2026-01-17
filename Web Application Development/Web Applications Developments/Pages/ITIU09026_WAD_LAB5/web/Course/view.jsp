<%-- 
    Document   : view
    Created on : Nov 15, 2011, 8:33:52 AM
    Author     : Trong Tin
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    String connectionURL = "jdbc:mysql://localhost:3306/weblab5?user=root;password=taurus&useUnicode=true&characterEncoding=UTF-8";
    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL, "root", "taurus");
    statement = connection.createStatement();
    rs = statement.executeQuery("SELECT * FROM course WHERE CourseID='" + request.getParameter("courseID") + "'");
    if (!rs.next()) {
        out.println("<h1>Course ID is not exist</h1>");
        out.println("<hr /><a href=\"./\">homepage</a>");
        rs.close();
        connection.close();
        return;
    }
    if (request.getParameter("action").equals("remove")) {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL, "root", "taurus");
        statement = connection.createStatement();
        int rowCount = statement.executeUpdate("DELETE FROM studentcourse WHERE StudentID='" + request.getParameter("studentID") + "' AND CourseID='" + request.getParameter("courseID") + "'");
        connection.close();
        response.sendRedirect("./Course?action=view&courseID=" + request.getParameter("courseID"));
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course Details</title>
    </head>
    <body>
        <h1>Course's Details</h1>
        <%
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL, "root", "taurus");
            statement = connection.createStatement();
            rs = statement.executeQuery("SELECT * FROM course WHERE CourseID='" + request.getParameter("courseID") + "'");
            rs.next();
        %>
        Course ID: <%= rs.getString("CourseID")%>
        <br />Course Name: <%= rs.getString("CourseName")%>
        <h2>Student list:</h2>
        <table width="50%">
            <tr>
                <td align="center"><h3>Student ID</h3></td>
                <td><h3>Student Name</h3></td>
                <td align="center"><h3>Action</h3></td>
            </tr>
            <tr>
                <%
                    statement = connection.createStatement();
                    rs = statement.executeQuery("SELECT * FROM studentcourse WHERE CourseID='" + request.getParameter("courseID") + "'");
                    while (rs.next()) {
                        ResultSet rs2 = null;
                        statement = connection.createStatement();
                        rs2 = statement.executeQuery("SELECT * FROM student WHERE StudentID='" + rs.getString("StudentID") + "'");
                        rs2.next();
                        out.println("<tr><td align=\"center\">");
                        out.println(rs2.getString("StudentID"));
                        out.println("</td><td>");
                        out.println(rs2.getString("StudentName"));
                        out.println("</td><td align=\"center\">");
                        out.println("<a href=\"./Course?action=remove&courseID=" + request.getParameter("courseID") + "&studentID=" + rs.getString("StudentID") + "\">Remove</a>");
                        rs2.close();
                    }
                    rs.close();
                    connection.close();
                %>
            </tr>
        </table>
        <hr /><a href="./">homepage</a>
    </body>
</html>
