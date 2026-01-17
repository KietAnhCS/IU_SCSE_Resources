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
        <h1>School of Computer Science &amp; Engineering</h1>
        <hr />
        <h3>Register Form</h3>
        <form action="./ShowRequestHeaders" method="post">
            <table>
                <tr>
                    <td>Full Name:</td> 
                    <td><input type="textbox" name="name" /></td>
                </tr>
                <tr>
                    <td>ID:</td> 
                    <td><input type="textbox" name="id" /></td>
                </tr>
                <tr>
                    <td>Email:</td> 
                    <td><input type="textbox" name="mail" /></td>
                </tr>
                <tr>
                    <td>Gender:</td> 
                    <td><input type="radio" value="male" name="gender" /> Male <input type="radio" value="female" name="gender" /> Female</td>
                </tr>
                <tr>
                    <td>Field of Study:</td>
                    <td><select name="Type">
                            <option>CS</option>
                            <option>IM</option>
                            <option>EE</option>
                            <option>BA</option>
                            <option>BE</option>
                        </select></td>
                </tr>
                <tr>
                    <td>List of Subjects</td> 
                    <td>
                        <input type="checkbox" name="PEE1" /> Principle of EE 1
                        <br /><input type="checkbox" name="CN" /> Computer Network
                        <br /><input type="checkbox" name="WAP" /> Web Application Development
                        <br /><input type="checkbox" name="OOP" /> Object Oriented Programming
                        <br /><input type="checkbox" name="CG" /> Computer Graphics
                    </td>
                </tr>
                <tr>
                    <td>Comments:</td>
                    <td><textarea rows="5" name="cmt" cols="20"></textarea></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="SUBMIT" /></td>
                    <td><input type="submit" name="submit" value="CANCEL" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
