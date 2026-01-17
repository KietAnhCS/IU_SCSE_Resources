<%-- 
    Document   : ThreeParams
    Created on : Oct 25, 2011, 8:28:21 AM
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
        <h1>Collect Three Parameters</h1>
        <form action="./getThreeParam" method="post">
            <table>
                <tr>
                    <td>First Parameter</td> 
                    <td><input type="textbox" name="para1" /></td>
                </tr>
                
                <tr>
                    <td>Second Parameter</td> 
                    <td><input type="textbox" name="para2" /></td>
                </tr>
                
                <tr>
                    <td>Third Parameter</td> 
                    <td><input type="textbox" name="para3" /></td>
                </tr>
                
                <tr>
                    <td></td>
                    <td><input type="submit" name="submit" /></td>
                </tr>
            </table>
    </body>
</html>
