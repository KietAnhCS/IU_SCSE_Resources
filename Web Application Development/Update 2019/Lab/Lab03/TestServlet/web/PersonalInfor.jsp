<%--
  Created by IntelliJ IDEA.
  User: xuant
  Date: 26/3/2019
  Time: 9:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Personal Information</title>
</head>
<body>
<h1>Personal Information</h1>
<form method="post" action="/getInfor/">
    <table>
        <tr>
            <td colspan="1">ID</td>
            <td colspan="2"><input type="text" name="id"></td>
        </tr>
        <tr>
            <td colspan="1">Name</td>
            <td colspan="2"><input type="text" name="name"></td>
        </tr>
        <tr>
            <td colspan="1">Email</td>
            <td colspan="2"><input type="email" name="email"></td>
        </tr>
        <tr>
            <td colspan="1">Gender</td>
            <td colspan="1"><input type="radio" name="gender" value="Male"> Male</td>
            <td colspan="1"><input type="radio" name="gender" value="Female"> Female</td>
        </tr>
        <tr>
            <td colspan="1">Major</td>
            <td colspan="2">
                <select name="major">
                    <option value="BA">BA</option>
                    <option value="IT">IT</option>
                    <option value="MA">MA</option>
                    <option value="BT">BT</option>
                </select>
            </td>

        </tr>
        <tr>
            <td colspan="1">Interesting Field</td>
            <td colspan="2"><textarea name="interestField" rows="10" cols="30"></textarea></td>
        </tr>
        <tr>
            <td colspan="1"><input type="submit"></td>
            <td colspan="1"><input type="reset"></td>
        </tr>
    </table>
</form>
</body>
</html>
