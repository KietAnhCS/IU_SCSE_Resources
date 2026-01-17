<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="org.w3c.dom.*, javax.xml.parsers.*" %>
<%
    DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
    DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
    String scheme = request.getScheme();
    String serverName = request.getServerName();
    String serverPort = String.valueOf(request.getServerPort());
    String contextPath = request.getContextPath();

    Document doc = docBuilder.parse(scheme + "://" + serverName + ":" + serverPort + contextPath + "/WebClass.xml");
%>
<%!
    public boolean isTextNode(Node n) {
        return n.getNodeName().equals("#text");
    }
%>
<html>
<head>
    <title>Excercise 2</title>
</head>
<body style="text-align: center">
    <h2>Student of Web Class</h2>
    <table border="1" align="center">
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
</body>
</html>