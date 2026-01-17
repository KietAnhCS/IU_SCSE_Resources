<%-- 
    Document   : new
    Created on : Nov 15, 2011, 8:34:07 AM
    Author     : Trong Tin
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
    String student = request.getParameter("student");
    if (student != null && !student.equals(" ")) {
        String connectionURL = "jdbc:mysql://localhost:3306/weblab5?user=root;password=taurus&useUnicode=true&characterEncoding=UTF-8";
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL, "root", "taurus");
        statement = connection.createStatement();
        rs = statement.executeQuery("SELECT * FROM student");
        int newRow = 0;
        while (rs.next()) {
            if (rs.isLast()) {
                newRow = rs.getInt("StudentID") + 1;
                break;
            }
            int temp1 = rs.getInt("StudentID");
            rs.next();
            int temp2 = rs.getInt("StudentID");
            if ((temp2 - temp1) > 1) {
                newRow = temp1 + 1;
                break;
            }
            rs.previous();
        }
        rs.beforeFirst();
        if (!rs.next()) {
            newRow = 1;
        }
        statement = connection.createStatement();
        int rowCount = statement.executeUpdate("INSERT INTO student(StudentID, StudentName) VALUES('" + newRow +  "','" + student + "')");
        rs.close();
        connection.close();
        response.sendRedirect("./Student");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Student</title>
    </head>
    <body>
        <h1>New Student</h1>
        <form action="./Student?action=new" method="post">
            Student: <input type="text" name="student" />
            <input type="submit" value="Add" />
        </form>
        <h2>Manager</h2>
        <a href="./Student">Student Manager</a><br />
        <a href="./Course">Course Manager</a>
    </body>
</html>
