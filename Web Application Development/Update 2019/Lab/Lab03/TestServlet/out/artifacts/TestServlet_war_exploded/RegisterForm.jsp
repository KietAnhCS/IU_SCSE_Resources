<%--
  Created by IntelliJ IDEA.
  User: xuant
  Date: 26/3/2019
  Time: 9:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Form</title>
</head>
<body>
<form method="post" action="/RegisterCourse/">
    <table>
        <tr>
            <th colspan="5"><h1>Registration Form</h1></th>
        </tr>
        <tr>
            <td colspan="1">ID</td>
            <td colspan="4"><input type="text" name="id"></td>
        </tr>
        <tr>
            <td colspan="1">Full name</td>
            <td colspan="4"><input type="text" name="name"></td>
        </tr>
        <tr>
            <td colspan="1">Email</td>
            <td colspan="4"><input type="email" name="email"></td>
        </tr>
        <tr>
            <td colspan="1">Gender</td>
            <td colspan="2"><input type="radio" name="gender" value="Male">Male</td>
            <td colspan="2"><input type="radio" name="gender" value="Female">Female</td>
        </tr>
        <tr>
            <td colspan="1">Field of Study</td>
            <td colspan="2">
                <select name="field">
                    <option>CS</option>
                    <option>IT</option>
                    <option>BT</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="1" rowspan="6">List of subject</td>
        <tr>
            <td colspan="4"><input type="checkbox" name="subject" value="Web Application">Web Application</td>
        </tr>
        <tr>
            <td colspan="4"><input type="checkbox" name="subject" value="Database">Database</td>
        </tr>
        <tr>
            <td colspan="4"><input type="checkbox" name="subject" value="Data Structure and Algorithm">Data Structure and Algorithm</td>
        </tr>
        <tr>
            <td colspan="4"><input type="checkbox" name="subject" value="OOP">OOP</td>
        </tr>
        <tr>
            <td colspan="4"><input type="checkbox" name="subject" value="Computer Architecture">Computer Architecture</td>
        </tr>
        <tr>
            <td colspan="1">Interesting Field</td>
            <td colspan="2"><textarea name="interestField" rows="10" cols="30"></textarea></td>
        </tr>
        <tr>
            <td colspan="1"></td>
            <td colspan="1"><input type="submit"></td>
            <td colspan="1"><input type="reset"></td>
        </tr>
    </table>
</form>
</body>
</html>
