<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: xuant
  Date: 23/4/2019
  Time: 10:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HomePage</title>
</head>
<body>
<%
    String connectionURL="jdbc:mysql://35.247.180.147:3306/Lab05_Ntxtung"; //step 2
    Connection connection = null; //step 3
    Statement statement = null; //step 4
    ResultSet rs = null;
%>

<%
    String cUsername = null;
    String _id = null;
    Cookie[] listOfCookie = request.getCookies();
    if (listOfCookie != null)
        for (Cookie c : listOfCookie) {
            if (c.getName().equals("username")){
                cUsername = c.getValue();
            }
            if (c.getName().equals("_id")){
                _id = c.getValue();
            }
        }
    out.println("<h4>Hello "+cUsername+"</h4>");
    try {
        Class.forName("com.mysql.jdbc.Driver"); //step 1
        connection = DriverManager.getConnection(connectionURL, "ntxtung", "xuantung98");
        statement = connection.createStatement();
        rs = statement.executeQuery("select CourseName, Credits from Lab05_Ntxtung.course where course._ID in (SELECT Course_ID FROM Lab05_Ntxtung.studentcourse where student_ID=\""+_id+"\");");
        if (rs.next()){
            out.println("<table><tr>");
            while (rs.next()) {
                out.println("<td>" + rs.getString("CourseName") + "</td>");
                out.println("<td>" + rs.getString("Credits") + "</td>");
                out.println("</tr>");
            } //step 6
        }
        out.println("<tr><td><form method=\"post\" action=\""+request.getContextPath()+"/register.jsp\"><input value=\"Register Course\" type=\"submit\"></form></td></tr></table>");
        rs.close(); //step 7
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }

%>



</body>
</html>
