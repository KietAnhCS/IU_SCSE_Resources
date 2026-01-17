<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Form</title>
</head>
<body>
<%!
    ArrayList<String> listOfStudentID = new ArrayList<>();
%>
<%
    String connectionURL="jdbc:mysql://35.247.180.147:3306/Lab05_Ntxtung"; //step 2
    Connection connection = null; //step 3
    Statement statement = null; //step 4
    ResultSet rs = null;
%>
<%!
    Boolean isInList(String id){
        for (String idInList : listOfStudentID){
            if (idInList.equalsIgnoreCase(id))
                return true;
        }
        return false;
    }
%>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver"); //step 1
        connection = DriverManager.getConnection(connectionURL, "ntxtung", "xuantung98");
        statement = connection.createStatement();
        rs = statement.executeQuery("SELECT * FROM student"); //step 5
        while (rs.next()) {
            listOfStudentID.add(rs.getString("StudentID"));
//            System.out.println(rs.getString("StudentID"));
        } //step 6
        rs.close(); //step 7
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e){
        e.printStackTrace();
    }
%>
<%
    String cUsername = null;
    String cPass = null;
    Cookie[] listOfCookie = request.getCookies();
    if (listOfCookie != null)
        for (Cookie c : listOfCookie) {
            if (c.getName().equals("username")){
                cUsername = c.getValue();
            } else if(c.getName().equals("password")) {
                cPass = c.getValue();
            }
        }
%>
<%
    if (cUsername == null || cPass == null){
        out.println("<form method=\"post\">\n" +
                "    <table>\n" +
                "        <tr>\n" +
                "            <td>Username</td>\n" +
                "            <td><input type=\"text\" name=\"username\" required></td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td>Password</td>\n" +
                "            <td><input type=\"password\" name=\"password\" required></td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td><input type=\"submit\" name=\"submit\"></td>\n" +
                "            <td><input type=\"reset\"></td>\n" +
                "        </tr>\n" +
                "    </table>\n" +
                "</form>");
    } else if (isInList(cUsername) && isInList(cPass)){
        out.println("You has been logged before");
    }
%>

<%
    String inputName = request.getParameter("username");
    String inputPass = request.getParameter("password");
%>
<%
    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit") != null) {
        if (inputName != null && inputName.trim().length() > 0) {
            if (inputPass != null && inputPass.trim().length() > 0) {
                try {
                    Class.forName("com.mysql.jdbc.Driver"); //step 1
                    connection = DriverManager.getConnection(connectionURL, "ntxtung", "xuantung98");
                    statement = connection.createStatement();
                    rs = statement.executeQuery("SELECT * FROM student where StudentID = \""+inputName+"\" "); //step 5
                    if (rs.next()){
                        out.println("Login Successful!");
                        response.addCookie(new Cookie("username", inputName));
                        response.addCookie(new Cookie("password", inputPass));
                        response.addCookie(new Cookie("_id", rs.getString("_id")));
                        response.sendRedirect(request.getContextPath() + "/homepage.jsp");
                    }
                    rs.close(); //step 7
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else {
                out.println("The password is required");
            }
        } else {
            out.println("The username is required!");
        }
    }
%>
</body>
</html>