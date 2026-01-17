<%--
  Created by IntelliJ IDEA.
  User: xuant
  Date: 6/5/2019
  Time: 9:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Account Information</title>
</head>
<body>
<%
    request.setAttribute("acc", null);
    request.setAttribute("inventory", null);
%>
<h2 style="text-align: center">Please provide your account information</h2>
<form action="ShoppingServlet" method="post">
    <table>
        <tr>
            <td><b>Name:</b></td>
            <td><input type="text" name="name" size="30"/></td>
        </tr>
        <tr>
            <td><b>VISA Card Number: </b></td>
            <td><input type="text" name="visa" size="15"/></td>
        </tr>
        <tr>
            <td><b>Address: </b></td>
            <td><input type="text" name="address" size="50"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" name="submit"/></td>
        </tr>
    </table>
</form>

</body>
</html>
