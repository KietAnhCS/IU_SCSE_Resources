<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Composer Information</title>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
    </head>
    <body>
        <table>
            <tr>
                <th colspan="2">Composer Information</th>
            </tr>
            <tr>
                <td>First Name: </td>
                <td>${requestScope.composer.firstName}</td>
            </tr>
            <tr>
                <td>Last Name: </td>
                <td>${requestScope.composer.lastName}</td>
            </tr>
            <tr>
                <td>ID: </td>
                <td>${requestScope.composer.id}</td>
            </tr>
            <tr>
                <td>Category: </td>
                <td>${requestScope.composer.category}</td>
            </tr>
        </table>
        <p>Go back to <a href="index.jsp" class="link">application home</a>.</p>
    </body>
</html>
