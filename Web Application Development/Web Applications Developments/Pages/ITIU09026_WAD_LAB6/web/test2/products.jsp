<%-- 
    Document   : products
    Created on : Dec 12, 2011, 10:38:37 PM
    Author     : Trong Tin
--%>

<%@page import="java.sql.*"%>
<%@page import="Bean.Product"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company's Products</title>
    </head>
    <body>
        <jsp:useBean id="accountBean" scope="session" class="Bean.AccountBean" />
        <%
            if (accountBean.getVisa().equals("")) {
                response.sendRedirect("./error.html");
            }
        %>
        <h1 align="center">Hi <jsp:getProperty name="accountBean" property="name"/></h1>
        <h2 align="center">Please select our product and its quantity</h2>
        <hr />

    <center>
        <form action="./ShoppingServlet" method="POST">
            <b>Product:</b> 
            <select name=Product>
                <%
                    String connectionURL = "jdbc:mysql://localhost:3306/weblab6?user=root;password=taurus&useUnicode=true&characterEncoding=UTF-8";
                    Connection connection = null;
                    Statement statement = null;
                    ResultSet rs = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connection = DriverManager.getConnection(connectionURL, "root", "taurus");
                    statement = connection.createStatement();
                    rs = statement.executeQuery("SELECT * FROM product");
                    while (rs.next()) {
                %>
                <option><%= rs.getString("name")%></option>
                <%
                    }
                    rs.close();
                    connection.close();
                %>
            </select>
            <b>Quantity: </b> 
            <input type="text" name="quantity" value="1" />
            <input type="hidden" name="action" value="ADD" />
            <input type="submit" name="Submit" value="Add to Cart" />
        </form>
    </center>

    <%
        Vector list = (Vector) session.getAttribute("cart");
        if (list != null && (list.size() > 0)) {
    %>

    <center>
        <table border="0" cellpadding="0" width="100%">
            <tr bgcolor="yellow">
                <td><b>PRODUCT</b></td>
                <td><b>MANUFACTURER</b></td>
                <td><b>MADE IN</b></td>
                <td><b>PRICE</b></td>
                <td><b>QUANTITY</b></td>
                <td></td>
            </tr>
            <%
                for (int i = 0; i < list.size(); i++) {
                    Product buy = (Product) list.elementAt(i);
            %>
            <tr>
                <td><b><%= buy.getName()%></b></td>
                <td><b><%= buy.getManuf()%></b></td>
                <td><b><%= buy.getCountry()%></b></td>
                <td><b><%= buy.getPrice()%>$</b></td>
                <td><b><%= buy.getQuantity()%></b></td>
                <td>
                    <form name="deleteForm" action="./ShoppingServlet" method="POST">
                        <input type="submit" value="Delete" />
                        <input type="hidden" name= "index" value='<%= i%>' />
                        <input type="hidden" name="action" value="DELETE" />
                    </form>
                </td>
            </tr> 
            <% }%>
        </table>
    </center>
    <% }%>
    <center>
        <form action="./ShoppingServlet" method="POST">
            <input type="hidden" name="action" value="CHECKOUT" />
            <input type="submit" name="Checkout" value="Checkout" />
        </form>
    </center>
</body>
</html>
