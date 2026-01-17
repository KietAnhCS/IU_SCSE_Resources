<%--
  Created by IntelliJ IDEA.
  User: xuant
  Date: 2/4/2019
  Time: 9:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Example 3 - JSP</title>
</head>
<body>
<h1>Print out the cookies</h1>
<form action="example3" method="get">
    <table>
        <tr>
            <td>Input Cookie Name</td>
            <td><label>
                <input type="text" name="cookieName"/>
            </label></td>
        </tr>
        <tr>
            <td>Input Cookie Value</td>
            <td><label>
                <input type="text" name="cookieValue"/>
            </label></td>
        </tr>
        <tr>
            <td><label>
                <input type="submit"/>
            </label></td>
        </tr>
    </table>
</form>
</body>
</html>
