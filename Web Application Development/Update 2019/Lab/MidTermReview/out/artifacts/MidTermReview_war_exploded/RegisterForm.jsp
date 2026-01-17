<%--
  Created by IntelliJ IDEA.
  User: xuant
  Date: 8/4/2019
  Time: 2:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course Register Form</title>
</head>
<body>
    <form action="RegisterResult" method="get">
        <h1>Register Form</h1>
        <table>
            <tr>
                <td colspan="1">ID</td>
                <td colspan="4"><input type="text" name="id"></td>
            </tr>
            <tr>
                <td colspan="1">Name</td>
                <td colspan="4"><input type="text" name="name"></td>
            </tr>
            <tr>
                <td colspan="1">Email</td>
                <td colspan="4"><input type="email" name="email"> </td>
            </tr>
            <tr>
                <td colspan="1">Gender</td>
                <td colspan="2"><input type="radio" name="gender" value="Male">Male</td>
                <td colspan="2"><input type="radio" name="gender" value="Female">Female</td>
            </tr>
            <tr>
                <td colspan="1">Field of Study</td>
                <td colspan="2">
                    <label>
                        <select name="field">
                            <option value="CS">CS</option>
                            <option value="IT">IT</option>
                            <option value="BT">BT</option>
                        </select>
                    </label>
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
                <td colspan="1">Comment</td>
                <td colspan="4"><textarea rows="5" name="cmt"></textarea></td>
            </tr>
            <tr>
                <td colspan="3"><input type="submit" value="Submit" name="s1"></td>
                <td colspan="2"><input type="reset" value="Reset" name="s2"></td>
            </tr>
        </table>
    </form>
</body>
</html>
