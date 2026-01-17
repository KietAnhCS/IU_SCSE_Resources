<%-- 
    Document   : parsingxml
    Created on : Dec 16, 2011, 8:10:12 AM
    Author     : Trong Tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.w3c.dom.*, javax.xml.parsers.*" %>
<%
    DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
    DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
    Document doc = docBuilder.parse("./WebClass.xml");
%>
<%!
    public boolean isTextNode(Node n) {
        return n.getNodeName().equals("#text");
    }
%>
<html>
    <head><title>Parsing of xml using DOM Parser</title></head>
    <body>
        <center>
            <h2><font color='red'>Student of Web Class</font></h2>
            <table border="2">
                <tr>
                    <th>Name of Student</th>
                    <th>ID Number</th>
                    <th>Date of Birth</th>
                    <th>City</th>
                </tr>
                <%
                    Element element = doc.getDocumentElement();
                    NodeList personNodes = element.getChildNodes();
                    for (int i = 0; i < personNodes.getLength(); i++) {
                        Node stu = personNodes.item(i);
                        if (isTextNode(stu)) {
                            continue;
                        }
                        NodeList NameDOBCity = stu.getChildNodes();
                %>
                <tr>
                    <%
                        for (int j = 0; j < NameDOBCity.getLength(); j++) {
                            Node node = NameDOBCity.item(j);
                            if (isTextNode(node)) {
                                continue;
                            }
                    %>
                    <td><%= node.getFirstChild().getNodeValue()%></td>
                    <%}%>
                </tr>
                <%}%>
            </table>
        </center>
    </body>
</html>