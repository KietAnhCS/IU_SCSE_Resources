<%@ page import="java.util.Map" %>
<%@ page import="Lab06.Item" %><%--
  Created by IntelliJ IDEA.
  User: xuant
  Date: 7/5/2019
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Check Out</title>
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</head>
<body>
<jsp:useBean id="acc" scope="session" class="Lab06.AccountBean"/>
<h3>Customer: <jsp:getProperty name="acc" property="name"/></h3>
<h3>VISA: <jsp:getProperty name="acc" property="visa"/></h3>
<h3>ADDRESS: <jsp:getProperty name="acc" property="address"/></h3>
<h3>Product List</h3>
<%
    Map inventory = (Map) request.getAttribute("inventory");
    Double total = 0.0;
    if (inventory != null){
        out.println("<table align=\"center\">");
        out.println("<tr><th>PRODUCT</th><th>MANUFACTURER</th><th>MADE IN</th><th>PRICE</th><th>QUANTITY</th><th>SUBTOTAL</th></tr>");
        for (Object obj : inventory.keySet()){
            Item item = (Item) obj;
            Double subtotal = item.getPrice() * (Integer) inventory.get(item);
            total += subtotal;
            out.println("<form method=\"post\" action=\"ShoppingServlet\">");
            out.println("<input type=\"hidden\" name=\"productDelete\" value=\""+item.getProduct()+"\"/>");
            out.println("<tr>");
            out.println("<td>"+item.getProduct()+"</td>");
            out.println("<td>"+item.getManufacturer()+"</td>");
            out.println("<td>"+item.getMadeIn()+"</td>");
            out.println("<td>"+item.getPrice()+"</td>");
            out.println("<td>"+inventory.get(item)+"</td>");
            out.println("<td>");
            out.println(subtotal);
            out.println("</td>");
            out.println("</tr></form>");
        }
        out.println("<tr>");
        out.println("<td></td>");
        out.println("<td></td>");
        out.println("<td></td>");
        out.println("<td></td>");
        out.println("<td><b>TOTAL</b></td>");
        out.println("<td>"+total+"</td>");
        out.println("</tr>");
        out.println("</table>");
    }
%>
<a href="ShoppingServlet">Shop some more!</a>
<a href="account.jsp">Log out!</a>
</body>
</html>
