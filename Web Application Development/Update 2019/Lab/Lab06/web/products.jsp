<%@ page import="Lab06.AccountBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Lab06.Item" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Company's Product</title>
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
<body style="text-align: center">
<jsp:useBean id="acc" scope="session" class="Lab06.AccountBean"/>
<h2>Hi
    <jsp:getProperty name="acc" property="name"/>
</h2>
<h3>Please select our product and its quantity</h3>
<hr>
<!------------------------------------------------------------------>
<%
    ArrayList<Item> demoList = new ArrayList<>();
    for (int i = 1; i < 10; i++) {
        demoList.add(new Item("Product " + i, "Manufacturer " + i, "Country " + i, i * 1.25));
    }
%>
<!------------------------------------------------------------------>
<form method="post" action="ShoppingServlet">
    <table align="center">
        <tr>
            <td><b>Product: </b></td>
            <td>
                <label>
                    <select name="item">
                        <%
                            for (Item i : demoList) {
                                out.println("<option value=\"" + i + "\">" + i + "</option>");
                            }
                        %>
                    </select>
                </label>
            </td>
            <td><b>Quantity:</b></td>
            <td><label><input type="text" name="quantity" size="4" value="1"></label></td>
            <td><input type="submit" name="submit" value="Add to cart"></td>
        </tr>
    </table>
</form>

<%
    Map inventory = (Map) request.getAttribute("inventory");
    if (inventory != null){
        out.println("<table align=\"center\">");
        out.println("<tr><th>PRODUCT</th><th>MANUFACTURER</th><th>MADE IN</th><th>PRICE</th><th>QUANTITY</th><th></th></tr>");
        for (Object obj : inventory.keySet()){
            Item item = (Item) obj;
            out.println("<form method=\"post\" action=\"ShoppingServlet\">");
            out.println("<input type=\"hidden\" name=\"productDelete\" value=\""+item.getProduct()+"\"/>");
            out.println("<tr>");
            out.println("<td>"+item.getProduct()+"</td>");
            out.println("<td>"+item.getManufacturer()+"</td>");
            out.println("<td>"+item.getMadeIn()+"</td>");
            out.println("<td>"+item.getPrice()+"</td>");
            out.println("<td>"+inventory.get(item)+"</td>");
            out.println("<td>");
            out.println("<input type=\"submit\" name=\"submit\" value=\"Delete\"/>");
            out.println("</td>");
            out.println("</tr></form>");
        }
        out.println("</table>");
    }
%>
<br>
<form method="post" action="ShoppingServlet">
    <input type="submit" name="checkout" value="Check out">
</form>

</body>
</html>
