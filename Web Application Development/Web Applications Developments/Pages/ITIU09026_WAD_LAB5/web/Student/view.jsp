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
    String course = request.getParameter("course");
    String connectionURL = "jdbc:mysql://localhost:3306/weblab5?user=root;password=taurus&useUnicode=true&characterEncoding=UTF-8";
    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL, "root", "taurus");
    statement = connection.createStatement();
    rs = statement.executeQuery("SELECT * FROM student WHERE StudentID='" + request.getParameter("studentID") + "'");
    if (!rs.next()) {
        out.println("<h1>Student ID is not exist</h1>");
        out.println("<hr /><a href=\"./\">homepage</a>");
        rs.close();
        connection.close();
        return;
    }
    if (course != null) {
        statement = connection.createStatement();
        rs = statement.executeQuery("SELECT * FROM course WHERE CourseName='" + course + "'");
        rs.next();
        int studentID = Integer.parseInt(request.getParameter("studentID")), courseID = rs.getInt("CourseID");
        statement = connection.createStatement();
        try {
            int rowCount = statement.executeUpdate("INSERT INTO studentcourse(StudentID, CourseID) VALUES('" + studentID + "','" + courseID + "')");
        } catch (SQLException e) {
            rs.close();
            connection.close();
            response.sendRedirect("./Student?action=view&studentID=" + studentID);
        }
    }
    if (request.getParameter("action").equals("remove")) {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL, "root", "taurus");
        statement = connection.createStatement();
        int rowCount = statement.executeUpdate("DELETE FROM studentcourse WHERE StudentID='" + request.getParameter("studentID") + "' AND CourseID='" + request.getParameter("courseID") + "'");
        connection.close();
        response.sendRedirect("./Student?action=view&studentID=" + request.getParameter("studentID"));
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Detail</title>
    </head>
    <body>
        <h1>Student's Details</h1>
        <%
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL, "root", "taurus");
            statement = connection.createStatement();
            rs = statement.executeQuery("SELECT * FROM student WHERE StudentID='" + request.getParameter("studentID") + "'");
            rs.next();
        %>
        Student ID: <%= rs.getString("StudentID")%>
        <br />Student Name: <%= rs.getString("StudentName")%>
        <h2>Select Course</h2>
        <form action="./Student?action=view&studentID=<%= rs.getString("StudentID")%>" method="post">
            Course:
            <select name="course">
                <%
                    statement = connection.createStatement();
                    rs = statement.executeQuery("SELECT * FROM course");
                    while (rs.next()) {
                %>
                <option><%= rs.getString("CourseName")%></option>
                <%
                    }
                %>
            </select>
            <input type="submit" value="Add" />
        </form>
        <h2>Registered Courses:</h2>
        <table width="50%">
            <tr>
                <td align="center"><h3>Course ID</h3></td>
                <td><h3>Course Name</h3></td>
                <td align="center"><h3>Action</h3></td>
            </tr>
            <tr>
                <%
                    statement = connection.createStatement();
                    rs = statement.executeQuery("SELECT * FROM studentcourse WHERE StudentID='" + request.getParameter("studentID") + "'");
                    while (rs.next()) {
                        ResultSet rs2 = null;
                        statement = connection.createStatement();
                        rs2 = statement.executeQuery("SELECT * FROM course WHERE CourseID='" + rs.getString("CourseID") + "'");
                        rs2.next();
                        out.println("<tr><td align=\"center\">");
                        out.println(rs2.getString("CourseID"));
                        out.println("</td><td>");
                        out.println(rs2.getString("CourseName"));
                        out.println("</td><td align=\"center\">");
                        out.println("<a href=\"./Student?action=remove&courseID=" + rs.getString("CourseID") + "&studentID=" + request.getParameter("studentID") + "\">Remove</a>");
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
