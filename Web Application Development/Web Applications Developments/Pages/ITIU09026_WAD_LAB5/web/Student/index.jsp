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
        <title>Student List</title>
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
                String connectionURL = "jdbc:mysql://localhost:3306/weblab5?user=root;password=taurus&useUnicode=true&characterEncoding=UTF-8";
                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(connectionURL, "root", "taurus");
                statement = connection.createStatement();
                rs = statement.executeQuery("SELECT * FROM student");
                while (rs.next()) {
                    out.println("<tr><td align=\"center\">");
                    out.println(rs.getString("StudentID"));
                    out.println("</td><td>");
                    out.println("<a href=\"Student?action=view&studentID=" + rs.getString("StudentID") + "\">" + rs.getString("StudentName") + "</a>");
                    out.println("</td><td align=\"center\">");
                    out.println("<a href=\"./Student?action=edit&studentID=" + rs.getString("StudentID") + "\">Edit</a> | <a href=\"./Student?action=delete&studentID=" + rs.getString("StudentID") + "\">Delete</a>");
                }
                rs.close();
            %>
        </table>
        <a href="./Student?action=new">New Student</a>
        <hr /><a href="./">homepage</a>
    </body>
</html>
