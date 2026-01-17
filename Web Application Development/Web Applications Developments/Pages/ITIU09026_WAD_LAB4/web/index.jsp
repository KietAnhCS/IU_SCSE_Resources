<%-- 
    Document   : index
    Created on : Nov 7, 2011, 11:19:47 PM
    Author     : Trong Tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="FBADD0">
        <h1><b>Print out the cookies</b></h1>
        <hr />
        <form method="post" action="./CookieExample">
            <table>
                <tr>
                    <td>Input Cookie Name:</td>
                    <td><input type="text" name="name" /></td>
                </tr>
                
                <tr>
                    <td>Input Cookie Value:</td>
                    <td><input type="text" name="value" /></td>
                </tr>
                
                <tr>
                    <td></td>
                    <td><input type="submit" name="submit" value="submit" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
