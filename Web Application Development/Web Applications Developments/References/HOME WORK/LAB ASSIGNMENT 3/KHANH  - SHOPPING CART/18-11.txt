<%@ page import="com.brainysoftware.burnaby.Product" %>
<%@ page import="com.brainysoftware.burnaby.ShoppingItem" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="dbBean" scope="application" class="com.brainysoftware.burnaby.DbBean"/>
<%
  String base = (String) application.getAttribute("base");
  Hashtable shoppingCart = (Hashtable) session.getAttribute("shoppingCart");
  if (shoppingCart==null)
    shoppingCart = new Hashtable(10);

  String action = request.getParameter("action");
  if (action!=null && action.equals("addShoppingItem")) {
    try {
      int productId = Integer.parseInt(request.getParameter("productId"));
      Product product = dbBean.getProductDetails(productId);
      if (product!=null) {
        ShoppingItem item = new ShoppingItem();
        item.productId = productId;
        item.quantity = 1;
        item.price = product.price;
        item.name = product.name;
        item.description = product.description;

        shoppingCart.remove(Integer.toString(productId));
        shoppingCart.put(Integer.toString(productId), item);
        session.setAttribute("shoppingCart", shoppingCart);
      }
    }
    catch (Exception e) {
      out.println("Error adding the selected product to the shopping cart");
    }
  }

  if (action!=null && action.equals("updateShoppingItem")) {
    try {
      int productId = Integer.parseInt(request.getParameter("productId"));
      int quantity = Integer.parseInt(request.getParameter("quantity"));
      ShoppingItem item = (ShoppingItem) shoppingCart.get(Integer.toString(productId));
      if (item!=null) {
        item.quantity = quantity;
      }
    }
    catch (Exception e) {
      out.println("Error updating shopping cart");
    }
  }

  if (action!=null && action.equals("deleteShoppingItem")) {
    try {
      int productId = Integer.parseInt(request.getParameter("productId"));
      shoppingCart.remove(Integer.toString(productId));
    }
    catch (Exception e) {
      out.println("Error deleting the selected item from the shopping cart");
    }
  }

%>
<HTML>
<HEAD>
<TITLE>Shopping Cart</TITLE>
</HEAD>
<BODY>
<TABLE>
<TR>
  <TD COLSPAN=2><jsp:include page="Header.jsp" flush="true"/></TD>
</TR>
<TR>
  <TD><jsp:include page="Menu.jsp" flush="true"/></TD>
  <TD VALIGN="TOP">
<%
%>
    <TABLE>
    <TR>
      <TD><FONT FACE="Verdana" SIZE="3"><B>Name</B></FONT></TD>
      <TD><FONT FACE="Verdana" SIZE="3"><B>Description</B></FONT></TD>
      <TD><FONT FACE="Verdana" SIZE="3"><B>Price</B></FONT></TD>
      <TD><FONT FACE="Verdana" SIZE="3"><B>Quantity</B></FONT></TD>
      <TD><FONT FACE="Verdana" SIZE="3"><B>Subtotal</B></FONT></TD>
      <TD><FONT FACE="Verdana" SIZE="3"><B>Update</B></FONT></TD>
      <TD><FONT FACE="Verdana" SIZE="3"><B>Delete</B></FONT></TD>
    </TR>
<%

    Enumeration enum = shoppingCart.elements();
    while (enum.hasMoreElements()) {
      ShoppingItem item = (ShoppingItem) enum.nextElement();
%>
    <TR>
      <TD><FONT FACE="Verdana" SIZE="2"><%=item.name%></FONT></TD>
      <TD><FONT FACE="Verdana" SIZE="2"><%=item.description%></FONT></TD>
      <TD><FONT FACE="Verdana" SIZE="2"><%=item.price%></FONT></TD>
      <FORM>
      <INPUT TYPE="HIDDEN" NAME="action" VALUE="updateShoppingItem">
      <INPUT TYPE="HIDDEN" NAME="productId" VALUE="<%=item.productId%>">
      <TD><INPUT TYPE="TEXT" Size="2" NAME="quantity" VALUE="<%=item.quantity%>"></TD>
      <TD><FONT FACE="Verdana" SIZE="2"><%=item.quantity*item.price%></FONT></TD>
      <TD><INPUT TYPE="SUBMIT" VALUE="Update"></TD>
      </FORM>
      <FORM>
      <INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteShoppingItem">
      <INPUT TYPE="HIDDEN" NAME="productId" VALUE="<%=item.productId%>">
      <TD><INPUT TYPE="SUBMIT" VALUE="Delete"></TD>
      </FORM>
    </TR>
<%
    }
%>
    <TR>
      <TD COLSPAN="7"><A HREF="<%=base%>?action=checkOut">Check Out</A></TD>
    </TR>
    </TABLE>
  </TD>
</TR>
</TABLE>
</BODY>
</HTML>
