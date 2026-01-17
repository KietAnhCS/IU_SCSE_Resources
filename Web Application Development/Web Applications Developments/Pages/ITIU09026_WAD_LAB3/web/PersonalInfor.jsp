<%-- 
    Document   : RegisterForm
    Created on : Oct 18, 2011, 8:29:44 AM
    Author     : Trong Tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
    <center><h1>Personal Information</h1></center>
    <hr />
    <form action="./getInfor" method="post">
        <table>
            <tr>
                <td>ID:</td> 
                <td><input type="textbox" name="id" /></td>
            </tr>
            <tr>
                <td>Name:</td> 
                <td><input type="textbox" name="name" /></td>
            </tr>
            <tr>
                <td>Email:</td> 
                <td><input type="textbox" name="mail" /></td>
            </tr>
            <tr>
                <td>Gender:</td> 
                <td>Male <input type="radio" value="Male" name="gender" /> Female <input type="radio" value="Female" name="gender" /></td>
            </tr>
            <tr>
                <td>Major:</td>
                <td><select name="major">
                        <option>Computer Science and Engineering</option>
                        <option>Business Administration</option>
                        <option>Biotechnology</option>
                        <option>Electrical Engineering</option>
                    </select></td>
            </tr>
            <tr>
                <td>Interesting Field:</td>
                <td><textarea rows="5" cols="20" name="interest"></textarea></td>
            </tr>
            <tr>
                <td><input type="submit" name="submit" value="SUBMIT" /></td>
                <td><input type="submit" name="submit" value="CANCEL" /></td>
            </tr>
        </table>
    </form>
</body>
</html>
