<%-- 
    Document   : index
    Created on : Nov 15, 2011, 8:33:41 AM
    Author     : Trong Tin
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course List</title>
    </head>
    <body>
        <h1>Course List</h1>
        <table width="50%">
            <tr>
                <td align="center"><h3>Course ID</h3></td>
                <td><h3>Course Name</h3></td>
                <td align="center"><h3>Action</h3></td>
            </tr>
            <%
                request.setCharacterEncoding("UTF-8");
                response.setCharacterEncoding("UTF-8");
                String connectionURL = "jdbc:mysql://localhost:3306/weblab5?user=root;password=taurus";
                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(connectionURL, "root", "taurus");
                statement = connection.createStatement();
                rs = statement.executeQuery("SELECT * FROM course");
                while (rs.next()) {
                    out.println("<tr><td align=\"center\">");
                    out.println(rs.getString("CourseID"));
                    out.println("</td><td>");
                    out.println("<a href=\"Course?action=view&courseID=" + rs.getString("CourseID") + "\">" + rs.getString("CourseName") + "</a>");
                    out.println("</td><td align=\"center\">");
                    out.println("<a href=\"./Course?action=edit&courseID=" + rs.getString("CourseID") + "\">Edit</a> | <a href=\"./Course?action=delete&courseID=" + rs.getString("CourseID") + "\">Delete</a>");
                }
                rs.close();
                connection.close();
            %>
        </table>
        <a href="./Course?action=new">New Course</a>
        <hr /><a href="./">homepage</a>
    </body>
</html>
