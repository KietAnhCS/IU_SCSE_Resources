<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: xuant
  Date: 23/4/2019
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course Register</title>
</head>
<body>
<%
    String connectionURL = "jdbc:mysql://35.247.180.147:3306/Lab05_Ntxtung"; //step 2
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
            if (c.getName().equals("username")) {
                cUsername = c.getValue();
            }
            if (c.getName().equals("_id")) {
                _id = c.getValue();
            }
        }
    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit") != null) {
        out.println("Course Registed Successful!");
        String[] list = request.getParameterValues("courses");
        for (String course : list){
//            System.out.println(course);
            try {
                Class.forName("com.mysql.jdbc.Driver"); //step 1
                connection = DriverManager.getConnection(connectionURL, "ntxtung", "xuantung98");
                statement = connection.createStatement();
                statement.execute("INSERT INTO `Lab05_Ntxtung`.`studentcourse` (`Student_ID`, `Course_ID`) VALUES (\""+_id+"\", \""+course+"\");\n");

            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect(request.getContextPath() + "/homepage.jsp");

    } else {
        try {
            Class.forName("com.mysql.jdbc.Driver"); //step 1
            connection = DriverManager.getConnection(connectionURL, "ntxtung", "xuantung98");
            statement = connection.createStatement();
            rs = statement.executeQuery("select _ID, CourseName, Credits from Lab05_Ntxtung.course where course._ID not in (SELECT Course_ID FROM Lab05_Ntxtung.studentcourse where student_ID=\"" + _id + "\");");
            out.println("<h2>Course Registration</h2>");
            if (rs.next()) {
                out.println("<form method=\"post\">");
                out.println("<table><tr>");
                while (rs.next()) {
                    out.println("<td><input type=\"checkbox\" name=\"courses\" value=\" " + rs.getString("_ID") + " \"></td>");
                    out.println("<td>" + rs.getString("CourseName") + "</td>");
                    out.println("<td>" + rs.getString("Credits") + "</td>");
                    out.println("</tr>");
                } //step 6
            }
            out.println("<tr><td><input type=\"submit\" name=\"submit\"> </td></tr></table></form>");
            rs.close(); //step 7
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


%>
</body>
</html>
