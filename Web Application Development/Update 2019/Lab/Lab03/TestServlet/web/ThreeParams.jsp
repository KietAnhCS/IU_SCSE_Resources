<%--
  Created by IntelliJ IDEA.
  User: xuant
  Date: 26/3/2019
  Time: 8:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Collect Param</title>
</head>
<body>
<h2>Collect Three Parameter</h2>
<form method="post" action="/ThreeParams/">
    <table>
        <tr>
            <td>First Para:</td>
            <td><input type="text" name="firstPara"/></td>
        </tr>
        <tr>
            <td>Second Para:</td>
            <td><input type="text" name="secondPara"/></td>
        </tr>
        <tr>
            <td>Third Para:</td>
            <td><input type="text" name="thirdPara"/></td>
        </tr>
        <tr>
            <td><input type="submit"></td>
            <td><input type="reset"></td>
        </tr>
    </table>


</form>

</body>
</html>
