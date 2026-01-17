<%-- 
    Document   : checkout
    Created on : Dec 12, 2011, 10:38:13 PM
    Author     : Trong Tin
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.Vector"%>
<%@page import="Bean.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products Checkout</title>
    </head>
    <body>
        <jsp:useBean id="accountBean" scope="session" class="Bean.AccountBean" />
        <%
            if (accountBean.getVisa().equals("")) {
                response.sendRedirect("./error.html");
            }
        %>

        <h1>Customer : <jsp:getProperty name="accountBean" property="name"/></h1>
        <h1>VISA Number : <jsp:getProperty name="accountBean" property="visa"/></h1>
        <h1>Address : <jsp:getProperty name="accountBean" property="address"/></h1>
        <h1>Products List</h1>
        <hr />

    <center>
        <table border="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
            <tr bgcolor="yellow">
                <td><b>PRODUCT</b></td>
                <td><b>MANUFACTURER</b></td>
                <td><b>MADE IN</b></td>
                <td><b>PRICE</b></td>
                <td><b>QUANTITY</b></td>
                <td><b>SUBTOTAL</b></td>
            </tr>
            <%
                Vector list = (Vector) session.getAttribute("cart");
                float total = 0;
                if (list != null && (list.size() > 0)) {
                    for (int i = 0; i < list.size(); i++) {
                        Product buy = (Product) list.elementAt(i);
                        total += buy.getPrice() * buy.getQuantity();
            %>
            <tr>
                <td><b><%= buy.getName()%></b></td>
                <td><b><%= buy.getManuf()%></b></td>
                <td><b><%= buy.getCountry()%></b></td>
                <td><b><%= buy.getPrice()%></b></td>
                <td><b><%= buy.getQuantity()%></b></td>
                <td><b><%= buy.getPrice() * buy.getQuantity()%></b></td>
            </tr>
            <%
                    }
                    session.removeAttribute("cart");
                }
            %>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><b>TOTAL</b></td>
                <td><b>$<%= total%></b></td>
            </tr>
        </table>
        <a href="./ShoppingServlet?action=SHOPPING">Shop some more! | </a>
        <a href="./ShoppingServlet?action=LOGOUT">Logout</a>
    </center>
    <hr />

    <h1>Recent Bought Products</h1>
    <center>
        <table border="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
            <tr bgcolor="yellow">
                <td><b>PRODUCT</b></td>
                <td><b>MANUFACTURER</b></td>
                <td><b>MADE IN</b></td>
                <td><b>PRICE</b></td>
                <td><b>QUANTITY</b></td>
                <td><b>SUBTOTAL</b></td>
            </tr>
            <%
                String connectionURL = "jdbc:mysql://localhost:3306/weblab6?user=root;password=taurus&useUnicode=true&characterEncoding=UTF-8";
                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(connectionURL, "root", "taurus");
                statement = connection.createStatement();
                rs = statement.executeQuery("SELECT * FROM cart WHERE visa='" + accountBean.getVisa() + "'");
                total = 0;
                while (rs.next()) {
                    statement = connection.createStatement();
                    ResultSet rs2 = statement.executeQuery("SELECT * FROM product WHERE name='" + rs.getString("productName") + "'");
                    rs2.next();
            %>
            <tr>
                <td><b><%= rs.getString("productName")%></b></td>
                <td><b><%= rs2.getString("manuf")%></b></td>
                <td><b><%= rs2.getString("country")%></b></td>
                <td><b><%= rs2.getFloat("price")%></b></td>
                <td><b><%= rs.getInt("quantity")%></b></td>
                <td><b><%= rs2.getFloat("price") * rs.getInt("quantity")%></b></td>
            </tr>
            <%
                    total += rs2.getFloat("price") * rs.getInt("quantity");
                    rs2.close();
                }
                rs.close();
                connection.close();
            %>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><b>TOTAL</b></td>
                <td><b>$<%= total%></b></td>
            </tr>
        </table>
        <form action="./ShoppingServlet" method="post">
            <input type="submit" value="Clear List" />
            <input type="hidden" name="action" value="CLEAR"/>
        </form>
    </center>
</body>
</html>
