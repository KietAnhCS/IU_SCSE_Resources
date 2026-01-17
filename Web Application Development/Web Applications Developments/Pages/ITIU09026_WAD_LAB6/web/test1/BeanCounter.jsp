<%-- 
    Document   : Counter
    Created on : Dec 12, 2011, 9:10:41 PM
    Author     : Trong Tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bean Counter</title>
    </head>
    <body>
        <h2>Testing JSP and Java Bean</h2><hr>
        <jsp:useBean id="counter"
                     scope="session"
                     class="Bean.Counter"/>
        <jsp:setProperty name="counter"
                         property="count"
                         param="count"/>
        <%
            out.println("Value of counter:"+counter.getCount()+"<BR >");
        %>
    </body>
</html>
