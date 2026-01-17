<%-- 
    Document   : Result
    Created on : Oct 18, 2011, 9:20:16 AM
    Author     : Trong Tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if (request.getParameter("submit").equals("CANCEL")) {
    response.sendRedirect("./RegisterForm.jsp");
}%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Thank you!</h1>
        <br /><p>Waiting for approving by advisor</p>
    </body>
</html>
