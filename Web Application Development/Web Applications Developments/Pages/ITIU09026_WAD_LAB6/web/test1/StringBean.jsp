<%-- 
    Document   : TestBean
    Created on : Dec 12, 2011, 9:05:15 PM
    Author     : Trong Tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>String Bean</title>
    </head>
    <body>
        <TABLE BORDER=5 ALIGN="CENTER">
            <TR><TH CLASS="TITLE">
                    Using JavaBeans with JSP</TABLE>
                    <jsp:useBean id="stringBean" class="Bean.StringBean" />
        <OL>
            <LI>Initial value (from jsp:getProperty):
                <I><jsp:getProperty name="stringBean"
                                 property="message" /></I>
            <LI>Initial value (from JSP expression):
                <I><%= stringBean.getMessage()%></I>
            <LI><jsp:setProperty name="stringBean"
                             property="message"
                             value="Best string bean: Fortex" />
                Value after setting property with jsp:setProperty:
                <I><jsp:getProperty name="stringBean"
                                 property="message" /></I>
            <LI><% stringBean.setMessage("My favorite: Kentucky Wonder");%>
                Value after setting property with scriptlet:
                <I><%= stringBean.getMessage()%></I>
        </OL>
    </body>
</html>
