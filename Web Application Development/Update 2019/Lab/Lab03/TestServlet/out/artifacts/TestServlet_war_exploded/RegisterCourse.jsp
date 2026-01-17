<%--
  Created by IntelliJ IDEA.
  User: xuant
  Date: 26/3/2019
  Time: 10:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table align="center">
    <tr>
        <td colspan="1">ID</td>
        <td colspan="2"><%= request.getParameter("id") %></td>
    </tr>
    <tr>
        <td colspan="1">Name</td>
        <td colspan="2"><%= request.getParameter("name") %></td>
    <tr>
        <td colspan="1">Email</td>
        <td colspan="2"><%= request.getParameter("email") %></td>
    </tr>
    <tr>
        <td colspan="1">Gender</td>
        <td colspan="2"><%= request.getParameter("gender") %></td>
    </tr>
    <tr>
        <td colspan="1">Field of Study</td>
        <td colspan="2"><%= request.getParameter("field") %></td>
    </tr>
    <tr>
        <td colspan="1">Course List</td>
        <td colspan="2"><%= request.getParameterValues("id") %></td>
    </tr>
    <tr>
        <td colspan="1">Interesting Field</td>
        <td colspan="2"><%= request.getParameter("interestField ") %></td>
    </tr>
</table>
</body>
</html>
