<%-- 
    Document   : account
    Created on : Dec 12, 2011, 10:38:05 PM
    Author     : Trong Tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Information</title>
    </head>
    <body>
        <jsp:useBean id="accountBean" scope="session" class="Bean.AccountBean" />
        <%
            if (accountBean != null) {
                session.removeAttribute("accountBean");
            }
        %>
    <center>
        <h2>Please provide your account information</h2>
    </center>

    <form action="../ShoppingServlet" method="POST">
        <table>
            <tr>
                <td><b>Name : </b></td>
                <td><input type="text" name="name" /></td>
            </tr>
            <tr>
                <td><b>VISA Card Number : </b></td>
                <td><input type="text" name="visa" /></td>
            </tr>
            <tr>
                <td><b>Address : </b></td>
                <td><input type="text" name="address" /></td>
            </tr>                
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Submit" />
                    <input type="hidden" name="action" value="ACCOUNT"/>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
