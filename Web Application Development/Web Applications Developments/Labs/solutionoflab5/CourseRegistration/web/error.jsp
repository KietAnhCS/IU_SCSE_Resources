<%-- 
    Document   : Error
    Created on : Mar 12, 2009, 7:54:05 AM
    Author     : Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Error</h1>

        <%=request.getAttribute("error")%>
        <hr>
        <a href="index.jsp">homepage</a>            </body>
</html>
