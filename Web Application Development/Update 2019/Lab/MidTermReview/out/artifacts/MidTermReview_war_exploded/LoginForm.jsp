<%--
  Created by IntelliJ IDEA.
  User: xuant
  Date: 8/4/2019
  Time: 2:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Form</title>
</head>
<body>
<%
    String username = "admin";
    String password = "admin";
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
    } else if (cUsername.equals(username) && cPass.equals(password)){
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
                if (inputName.equals(username) && inputPass.equals(password)) {
                    out.println("Login Successful!");
                    response.addCookie(new Cookie("username", inputName));
                    response.addCookie(new Cookie("password", inputPass));
                } else {
                    out.println("Incorrect username or password");
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