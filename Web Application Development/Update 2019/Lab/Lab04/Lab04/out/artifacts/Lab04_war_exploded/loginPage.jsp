<%--
  Created by IntelliJ IDEA.
  User: xuant
  Date: 2/4/2019
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Extra login page</title>
</head>
<body>
    <form method="post" action="extra">
        <table>
            <tr>
                <td>Username: </td>
                <td><input type="text" name="username" required></td>
            </tr>
            <tr>
                <td>Password: </td>
                <td><input type="password" name="password" required></td>
            </tr>
            <tr>
                <td><input type="checkbox" name="isSave" value="Remember me?"/>Remember me? (don't care)</td>
            </tr>
            <tr>
                <td><input type="submit" /></td>
            </td>
        </table>
    </form>
</body>
</html>
